import pandas as pd
import warnings
import sys
import numpy as np
from scipy.stats import mannwhitneyu, chi2_contingency
from statsmodels.stats.multitest import multipletests
from sklearn.metrics import roc_curve, auc
import matplotlib.pyplot as plt
pd.options.mode.chained_assignment = None

# import plot_utils
# import stat_utils

warnings.simplefilter(action='ignore', category=FutureWarning)


def calc_stat(df, feature, ran_df=None):
    """
    Calculate number of cases in each CV class, number of variants
    with "?" value, and return median values for each group.
    Args:
      df: a dataframe with data.
      feature: a feature to check.
      verbose: whether to print log messages.
    Returns:
      Nothing; prints statistics.
    """
    res = []
    
    n = df[(df["CV.SigShort"] == "Benign")].shape[0]
    res.append(n)
    
    n = df[(df["CV.SigShort"] == "Pathogenic")].shape[0]
    res.append(n)

    if ran_df is not None:
        n = ran_df.shape[0]
        res.append(n)

    else: res.append("-")

    m = df[(df["CV.SigShort"] == "Benign")][feature].median()
    res.append(round(m, 3))

    m = df[(df["CV.SigShort"] == "Pathogenic")][feature].median()
    res.append(round(m, 3))
    
    if ran_df is not None:
        m = ran_df[feature].median()
        res.append(round(m, 3))
    else: res.append("-")

    return res


def cal_auc(ones, zeros):
    """
    Calculate AUC for two distributions.
    Args:
      df: a dataframe with data. 
      feature: a feature to check.
      greater: which class dist should be "greater". 
      verbose: whether to print log messages.
    Returns:
      AUC value, TPR, FPR and thresholds.
    """
    y_score = ones + zeros
    y_true = [1] * len(ones) + [0] * len(zeros)
    fpr, tpr, thr = roc_curve(y_true, y_score)
    roc_auc = round(auc(fpr, tpr) * 100, 2)
    
    idx = sum(fpr < 0.2) - 1
    fpr_thr = round(fpr[idx] * 100, 2)
    tpr_thr = round(tpr[idx] * 100, 2)
    thr_thr = round(thr[idx], 2)
            
    return roc_auc, tpr_thr, fpr_thr, thr_thr


def stat_numeric(df, feature, cont=True, ran_df=None):
    df = df[(df[feature] != "?")]
    df[feature] = pd.to_numeric(df[feature])
    
    if ran_df is not None: 
        ran_df = ran_df[(ran_df[feature] != "?")]
        ran_df[feature] = pd.to_numeric(ran_df[feature])
        
    res = calc_stat(df, feature, ran_df=ran_df)
    
    if res[3] > res[4]: 
        dist1 = df[(df["CV.SigShort"] == "Benign")][feature]
        dist2 = df[(df["CV.SigShort"] == "Pathogenic")][feature]
    else: 
        dist2 = df[(df["CV.SigShort"] == "Benign")][feature]
        dist1 = df[(df["CV.SigShort"] == "Pathogenic")][feature]
    
    _, p_value = mannwhitneyu(dist1, dist2, alternative="greater", use_continuity=cont)
    res.append("{0:.2e}".format(p_value))
    
    if ran_df is not None: 
        if res[3] > res[5]: 
            dist1 = df[(df["CV.SigShort"] == "Benign")][feature]
            dist2 = ran_df[feature]
        else: 
            dist2 = df[(df["CV.SigShort"] == "Benign")][feature]
            dist1 = ran_df[feature]

        _, p_value = mannwhitneyu(dist1, dist2, alternative="greater", use_continuity=cont)
        res.append("{0:.2e}".format(p_value))

        if res[4] > res[5]: 
            dist1 = df[(df["CV.SigShort"] == "Pathogenic")][feature]
            dist2 = ran_df[feature]
        else: 
            dist2 = df[(df["CV.SigShort"] == "Pathogenic")][feature]
            dist1 = ran_df[feature]
    
        _, p_value = mannwhitneyu(dist1, dist2, alternative="greater", use_continuity=cont)
        res.append("{0:.2e}".format(p_value))
        
    else: res.extend(["-", "-"])

    if res[3] > res[4]: 
        ones = list(df[df["CV.SigShort"] == "Benign"][feature].values)
        zeros = list(df[df["CV.SigShort"] == "Pathogenic"][feature].values)
    else: 
        ones = list(df[df["CV.SigShort"] == "Pathogenic"][feature].values)
        zeros = list(df[df["CV.SigShort"] == "Benign"][feature].values)
    
    res.extend(cal_auc(ones, zeros))
    
    return res


def calc_obs(df, feature, cl, ran_df=None):
    """
    Calculate number of cases in each CV class, number of variants
    with "?" value, and return median values for each group.
    Args:
      df: a dataframe with data.
      feature: a feature to check.
      verbose: whether to print log messages.
    Returns:
      Nothing; prints statistics.
    """
    res = []
    
    n = df[(df["CV.SigShort"] == "Benign") & (df[feature] == cl)].shape[0]
    p = n / df[(df["CV.SigShort"] == "Benign")].shape[0]
    res.append("{} ({:.2f})".format(n, p))

    n = df[(df["CV.SigShort"] == "Pathogenic") & (df[feature] == cl)].shape[0]
    p = n / df[(df["CV.SigShort"] == "Pathogenic")].shape[0]
    res.append("{} ({:.2f})".format(n, p))

    if ran_df is not None:
        n = ran_df[(ran_df[feature] == cl)].shape[0]
        p = n / ran_df.shape[0]
        res.append("{} ({:.2f})".format(n, p))

    else: res.append("-")

    return res


def chi2_test(table):
    """
    Perform the Mann-Whitney U Test, comparing two different distributions.
    Args:
      dist1: the 1st sample. 
      dist2: the 2nd sample. 
      alt: alternative for the test. Can be "less" or "greater". 
    Returns:
      U statisitic and p-value for the test.
    """
    stat, p, dof, expected = chi2_contingency(table)
    return p


def stat_categ_mul(df, feature, remove=None, ran_df=None):
    """
    Perform any test, comparing two different distributions.
    Args:
      df: a data dataframe. 
      feature: a feature to test.
      remove: a class to remove.
      verbose: whether to print log messages.
    Returns:
      a dict with U statisitic and p-value for each feature.
    """    
    df = df[(df[feature] != "?")]
    if remove: df = df[(df[feature] != remove)]
        
    if ran_df is not None: 
        ran_df = ran_df[(ran_df[feature] != "?")]
        if remove: ran_df = ran_df[(ran_df[feature] != remove)]

    classes = np.unique(df[feature])
    res = []

    for cl in classes:
        new_res = [cl]
        
        obs = calc_obs(df, feature, cl, ran_df=ran_df)
        new_res.extend(obs)
        
        path_cl = df[(df[feature] == cl) & (df["CV.SigShort"] == "Pathogenic")].shape[0]
        ben_cl = df[(df[feature] == cl) & (df["CV.SigShort"] == "Benign")].shape[0]
        path_not_cl = df[(df[feature] != cl) & (df["CV.SigShort"] == "Pathogenic")].shape[0]
        ben_not_cl = df[(df[feature] != cl) & (df["CV.SigShort"] == "Benign")].shape[0]
        table = [[path_cl, ben_cl],
                 [path_not_cl,ben_not_cl]]
        
        p_value = chi2_test(table)
        new_res.extend(["{0:.2e}".format(p_value)])
        
        if ran_df is not None: 
            ran_cl = ran_df[(ran_df[feature] == cl)].shape[0]
            ran_not_cl = ran_df[(ran_df[feature] != cl)].shape[0]
            
            table = [[ran_cl, ben_cl],
                     [ran_not_cl, ben_not_cl]]

            p_value = chi2_test(table)
            new_res.extend(["{0:.2e}".format(p_value)])

            table = [[ran_cl, path_cl],
                     [ran_not_cl, path_not_cl]]

            p_value = chi2_test(table)
            new_res.extend(["{0:.2e}".format(p_value)])
        else:
            new_res.extend(["-", "-"])
        res.append(new_res)

    return res
        
        
def stat_categ(df, feature, remove=None, ran_df=None):
    """
    Perform any test, comparing two different distributions.
    Args:
      df: a data dataframe. 
      feature: a feature to test.
      remove: a class to remove.
      verbose: whether to print log messages.
    Returns:
      a dict with U statisitic and p-value for each feature.
    """    
    df = df[(df[feature] != "?")]
    if remove: df = df[(df[feature] != remove)]
        
    if ran_df is not None: 
        ran_df = ran_df[(ran_df[feature] != "?")]
        if remove: ran_df = ran_df[(ran_df[feature] != remove)]

    res = []
    
    table = pd.crosstab(df[feature], df['CV.SigShort'])
    p_value = chi2_test(table)
    res.append("{0:.2e}".format(p_value))
        
    if ran_df is not None: 
        ran_df['CV.SigShort'] = "Random"
        conc_df = pd.concat([df[df['CV.SigShort'] == "Benign"], ran_df])[[feature,'CV.SigShort']]
        table = pd.crosstab(conc_df[feature], conc_df['CV.SigShort'])

        p_value = chi2_test(table)
        res.extend(["{0:.2e}".format(p_value)])

        conc_df = pd.concat([df[df['CV.SigShort'] == "Pathogenic"], ran_df])[[feature,'CV.SigShort']]
        table = pd.crosstab(conc_df[feature], conc_df['CV.SigShort'])

        p_value = chi2_test(table)
        res.append("{0:.2e}".format(p_value))
    else:
        res.extend(["-", "-"])

    return res


# read data
print(f"Importing data...")
cv_df = pd.read_csv("../results/ClinVar_preprocessed.csv.gz", compression='gzip', low_memory=0)
ran_df = pd.read_csv("../results/random_preprocessed.csv.gz", compression='gzip', low_memory=0)

print(f"{cv_df.shape[0]} random variants.")
print(f"{cv_df.shape[0]} ClinVar variants before filtering.")

# filter variants
cv_df.rename(columns={'SM.ClassRIN': 'SimpleClassRIN'}, inplace=True)
cv_df = cv_df[cv_df["CV.SigShort"] != "Drug response"]
print(f"{cv_df.shape[0]} ClinVar variants after removal of 'Drug response'.")

# filter 'Disorder' variants
cv_df = cv_df[cv_df["SimpleClassRIN"] != "Disorder"]
print(f"{cv_df.shape[0]} ClinVar variants after removal of 'Disorder' str class.")

cv_df = cv_df[cv_df["CV.SigShort"] != "VUS"]
print(f"{cv_df.shape[0]} ClinVar variants after removal of 'VUS'.")

# ran_df = ran_df[ran_df["FoldXddG"] == 556.1]
ran_df = ran_df[ran_df["FoldXddG"] < 500]
print("1 random variant has FoldXddG > 500 and will be removed.")

ran_df = ran_df[ran_df["SimpleClassRIN"] != "Disorder"]
print(f"{ran_df.shape[0]} random variants after removal of 'Disorder' str class.")

# map sctructure classes to groups
cv_df["SimpleClassRIN"] = cv_df["SimpleClassRIN"].map({
    'Protein interaction': 'PPI', 
    'Surface': 'Surface',
    'Core': 'Core',
    'ligand interaction': 'Other',
    'DNA interaction': 'Other',
    'ion interaction': 'Other',
    'metal interaction': 'Other',
    'RNA interaction': 'Other',
    'None': 'None'
})

ran_df["SimpleClassRIN"] = ran_df["SimpleClassRIN"].map({
    'Protein interaction': 'PPI', 
    'Surface': 'Surface',
    'Core': 'Core',
    'ligand interaction': 'Other',
    'DNA interaction': 'Other',
    'ion interaction': 'Other',
    'metal interaction': 'Other',
    'RNA interaction': 'Other',
    'Peptide interaction': 'Other',
    'None': 'None'
})

# combine clases
cv_df["PPH.Site"] = cv_df["PPH.Site"].map({
    'ACT_SITE': 'SIGN_SITE', 
    'BINDING': 'SIGN_SITE', 
    'METAL': 'SIGN_SITE', 
    'SITE': 'SIGN_SITE', 
    'CARBOHYD': 'CARBOHYD',
    'CROSSLNK': 'CROSSLNK',
    'DISULFID': 'DISULFID',
    'LIPID': 'LIPID',
    'MOD_RES': 'MOD_RES',
    'NO': 'NO'
})

# add binary features
cv_df["SPOTD.PDisorder_bin"] = [int(float(f) > 0.5) if f != "?" else "?" for f in cv_df['SPOTD.PDisorder']]
cv_df["SPOTD.PDisorder_bin"] = cv_df["SPOTD.PDisorder_bin"].map({
    0: 'Ordered', 
    1: 'Disordered',
    '?': '?'
})              
    
cv_df["SPOTD.PCoil_bin"] = [int(float(f) > 0.5) if f != "?" else "?" for f in cv_df['SPOTD.PCoil']]
cv_df["SPOTD.PCoil_bin"] = cv_df["SPOTD.PCoil_bin"].map({
    0: 'No coil', 
    1: 'Coil',
    '?': '?'
})              
    
cv_df["SPOTD.PSheet_bin"] = [int(float(f) > 0.5) if f != "?" else "?" for f in cv_df['SPOTD.PSheet']]
cv_df["SPOTD.PSheet_bin"] = cv_df["SPOTD.PSheet_bin"].map({
    0: 'No sheet', 
    1: 'Sheet',
    '?': '?'
}) 

cv_df["SPOTD.PHelix_bin"] = [int(float(f) > 0.5) if f != "?" else "?" for f in cv_df['SPOTD.PHelix']]
cv_df["SPOTD.PHelix_bin"] = cv_df["SPOTD.PHelix_bin"].map({
    0: 'No helix', 
    1: 'Helix',
    '?': '?'
}) 

for con_type in ['BiolHetCont', 'ExtCont', 'Hb.Inter', 'Hb.Intra', 'Hb.IntraDist', 'Hb.SM', 'Hb.SS', 'Hb.Tot']:
    cv_df[con_type + '_bin'] = [int(float(f) > 0) if f != "?" else "?" for f in cv_df[con_type]]
    cv_df[con_type + '_bin'] = cv_df[con_type + '_bin'].map({
        0: 'No contacts', 
        1: '≥1 contacts',
        '?': '?'
    })
    
# save features
f_numeric = {
    # phylogenetic features; no filter needed
    "PhyloP": {"type": "cont","filter": "None", "random": False},
    "SPOTD.Info": {"type": "cont","filter": "None", "random": False},
    "PPH.dScore": {"type": "cont","filter": "None", "random": False},
    'SubDiffKDHydro': {"type": "cont", "filter": "None", "random": True},
    "Grantham": {"type": "cont","filter": "None", "random": True},
    
    "Blosum62": {"type": "disc","filter": "None", "random": True},
    
    # structural features; only matching variants
    "SPOTD.CN": {"type": "cont","filter": "PDBAAMatch", "random": False},
    "SPOTD.HSEu": {"type": "cont","filter": "PDBAAMatch", "random": False},
    "SPOTD.HSEd": {"type": "cont","filter": "PDBAAMatch", "random": False},
    "SPOTD.ASA": {"type": "cont", "filter": "PDBAAMatch", "random": False},
    "DSSP.NormASA": {"type": "cont", "filter": "PDBAAMatch", "random": True},
    "AveSeqDist": {"type": "cont", "filter": "PDBAAMatch", "random": True},
    "IntCont": {"type": "cont", "filter": "PDBAAMatch", "random": True},
    "B.Mean": {"type": "cont", "filter": "PDBAAMatch", "random": True},
    "B.Zscore": {"type": "cont", "filter": "PDBAAMatch", "random": True},
    "dProp": {"type": "cont", "filter": "PDBAAMatch", "random": True},
    "dVol": {"type": "cont", "filter": "PDBAAMatch", "random": True},
    'SPOTD.PDisorder': {"type": "cont", "filter": "PDBAAMatch", "random": False},
    'SPOTD.PCoil': {"type": "cont", "filter": "PDBAAMatch", "random": False},
    'SPOTD.PSheet': {"type": "cont", "filter": "PDBAAMatch", "random": False},
    'SPOTD.PHelix': {"type": "cont", "filter": "PDBAAMatch", "random": False},
    
    "ExtCont": {"type": "disc", "filter": "PDBAAMatch", "random": True},
    "BiolHetCont": {"type": "disc", "filter": "PDBAAMatch", "random": True},
    "Hb.Tot": {"type": "disc", "filter": "PDBAAMatch", "random": True},
    "Hb.Inter": {"type": "disc", "filter": "PDBAAMatch", "random": True},
    "Hb.Intra": {"type": "disc", "filter": "PDBAAMatch", "random": True},
    "Hb.IntraDist": {"type": "disc", "filter": "PDBAAMatch", "random": True},
    "Hb.SM": {"type": "disc", "filter": "PDBAAMatch", "random": True},
    "Hb.SS": {"type": "disc", "filter": "PDBAAMatch", "random": True},
    "PPH.PHAT": {"type": "disc", "filter": "PDBAAMatch", "random": False},
    
    # structural features; only matching variants & hq structure mapping
    "MaestroddG": {"type": "cont", "filter": "StrQual", "random": True},
    "FoldXddG": {"type": "cont", "filter": "StrQual", "random": True}
}

f_categ = {
    # structural features; only matching variants
    "PPH.Site": {"remove": "NO", "random": False},
    "PPH.Region": {"remove": "NO", "random": False},
    "SPOTD.SecStr": {"remove": None, "random": False},
    "DSSP.SecStr": {"remove": ".", "random": True},
    "SPOTD.PDisorder_bin": {"remove": None, "random": False},
    "SPOTD.PCoil_bin": {"remove": None, "random": False},
    "SPOTD.PSheet_bin": {"remove": None, "random": False},
    "SPOTD.PHelix_bin": {"remove": None, "random": False},
    "SimpleClassRIN": {"remove": None, "random": True},
    "BiolHetCont_bin": {"remove": "", "random": False},
    "ExtCont_bin": {"remove": "", "random": False},
    "Hb.Inter_bin": {"remove": "", "random": False},
    'Hb.Intra_bin': {"remove": "", "random": False},
    'Hb.IntraDist_bin': {"remove": "", "random": False},
    'Hb.SM_bin': {"remove": "", "random": False},
    'Hb.SS_bin': {"remove": "", "random": False},
    'Hb.Tot_bin': {"remove": "", "random": False}
}

f_categ_mul = {
    # structural features; only matching variants
    "PPH.Site": {"remove": "NO", "random": False},
    "PPH.Region": {"remove": "NO", "random": False},
    "SPOTD.SecStr": {"remove": None, "random": False},
    "DSSP.SecStr": {"remove": ".", "random": True},
    "SimpleClassRIN": {"remove": None, "random": True},
}

print()
print("PROCESSING NUMERIC FEATURES...")
print()

print("-" * 132)
print('{:16}| {:23}| {:23}| {:32}| {:}'.format(" ", "Observations", "Median", "MW", "ROC-AUC"))
print('{:16}| {:7} {:7} {:7}| {:7} {:7} {:7}| {:10} {:10} {:10}| {:7} {:7} {:7} {}'
      .format("Feature", "Ben", "Path", "Rand", "Ben", "Path", "Rand", "BvsP", "BvsR", "PvsR", "AUC,%", "TPR,%", "FPR,%", "THR,%"))
print("-" * 16 + "+" + "-" * 24 + "+" + "-" * 24 + "+" + "-" * 33 + "+" + "-" * 31)

for f, pp in f_numeric.items():
    
    if pp["filter"] == "None": cv_df_filtered = cv_df
    elif pp["filter"] == "PDBAAMatch": cv_df_filtered = cv_df[(cv_df["PDBAAMatch"] == 1)]
    elif pp["filter"] == "StrQual": 
        cv_df_filtered = cv_df[(cv_df["PDBAAMatch"] == 1) & 
                         (cv_df['SM.Ide'] >= 0.95) & 
                         (cv_df['SM.Coverage'] >= 0.5)]
        cv_df_filtered['SM.Resol'] = cv_df_filtered['SM.Resol'].astype("float")
        cv_df_filtered = cv_df_filtered[(cv_df_filtered['SM.Resol'] <= 4.5)]
        
    if pp["random"]: 
        res = stat_numeric(cv_df_filtered, f, ran_df=ran_df, cont=pp["type"]=="cont")
    
    else: res = stat_numeric(cv_df_filtered, f, cont=pp["type"]=="cont")
    
    print('{:16}| {:<7} {:<7} {:<7}| {:<7} {:<7} {:<7}| {:<10} {:<10} {:<10}| {:<7} {:<7} {:<7} {}'.format(f, *res))  

print("-" * 132)
print()
print("DONE.")
print()

print()
print("PROCESSING CATEGORICAL FEATURES...")
print()

cv_df_filtered = cv_df[(cv_df["PDBAAMatch"] == 1)]

print("-" * 111)
print('{:20}| {:14}| {:40}| {}'.format(" ", " ", "Observations", "Chi2 (one-vs-rest)"))
print('{:20}| {:14}| {:12} {:13} {:13}| {:10} {:10} {}'
      .format("Feature", "Class", "Ben", "Path", "Rand", "BvsP", "BvsR", "PvsR"))
print("-" * 20 + "+" + "-" * 15 + "+" + "-" * 41 + "+" + "-" * 32)

for f, pp in f_categ_mul.items():
    if pp["random"]: 
        res = stat_categ_mul(cv_df_filtered, f, remove=pp["remove"], ran_df=ran_df)
    
    else: res = stat_categ_mul(cv_df_filtered, f, remove=pp["remove"])

    print('{:20}| {:14}| {:12} {:13} {:13}| {:10} {:10} {}'.format(f, *res.pop(0)))  
    for r in res:
        print('{:20}| {:14}| {:12} {:13} {:13}| {:10} {:10} {}'.format(" ", *r))  

print("-" * 111)
print()

print("-" * 53)
print('{:20}| {}'.format(" ", "Chi2 (all)"))
print('{:20}| {:10} {:10} {}'
      .format("Feature", "BvsP", "BvsR", "PvsR"))
print("-" * 20 + "+" + "-" * 32)
for f, pp in f_categ.items():
    if pp["random"]: 
        res = stat_categ(cv_df_filtered, f, remove=pp["remove"], ran_df=ran_df)
    
    else: res = stat_categ(cv_df_filtered, f, remove=pp["remove"])
        
    print('{:20}| {:10} {:10} {}'.format(f, *res))   

print("-" * 53)
print()

print("DONE.")
print()
