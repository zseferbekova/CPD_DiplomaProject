import pandas as pd
import warnings
import sys
import numpy as np
from scipy.stats import mannwhitneyu, chi2_contingency
from statsmodels.stats.multitest import multipletests
from sklearn.metrics import roc_curve, auc
import matplotlib.pyplot as plt
pd.options.mode.chained_assignment = None

warnings.simplefilter(action='ignore', category=FutureWarning)


def calc_stat(df, feature, split):
    """
    Calculate number of cases in each CV class, number of variants
    with "?" value, and return median values for each group.
    Args:
      df: a dataframe with data.
      feature: a feature to check.
    Returns:
      Nothing; prints statistics.
    """
    res = []
    
    if split.lower() == "clinvar":
        n = df[(df["CV.SigShort"] == "Benign")].shape[0]
        res.append(n)
    
        n = df[(df["CV.SigShort"] == "Pathogenic")].shape[0]
        res.append(n)
        
        m = df[(df["CV.SigShort"] == "Benign")][feature].median()
        res.append(round(m, 3))

        m = df[(df["CV.SigShort"] == "Pathogenic")][feature].median()
        res.append(round(m, 3))
    
    elif split.lower() == "cpd":
        n = df[(df["CPD"] == "CPD")].shape[0]
        res.append(n)
    
        n = df[(df["CPD"] == "non-CPD")].shape[0]
        res.append(n)
        
        m = df[(df["CPD"] == "CPD")][feature].median()
        res.append(round(m, 3))

        m = df[(df["CPD"] == "non-CPD")][feature].median()
        res.append(round(m, 3))
    
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


def stat_numeric(df, feature, split, cont=True):
    df = df[(df[feature] != "?")]
    df[feature] = pd.to_numeric(df[feature])
        
    res = calc_stat(df, feature, split=split)
    
    if res[2] > res[3]: 
        if split.lower() == "clinvar":
            dist1 = df[(df["CV.SigShort"] == "Benign")][feature]
            dist2 = df[(df["CV.SigShort"] == "Pathogenic")][feature]
            
            ones = list(df[df["CV.SigShort"] == "Benign"][feature].values)
            zeros = list(df[df["CV.SigShort"] == "Pathogenic"][feature].values)
            
        elif split.lower() == "cpd":
            dist1 = df[(df["CPD"] == "CPD")][feature]
            dist2 = df[(df["CPD"] == "non-CPD")][feature]
            
            ones = list(df[df["CPD"] == "CPD"][feature].values)
            zeros = list(df[df["CPD"] == "non-CPD"][feature].values)
    else: 
        if split.lower() == "clinvar":
            dist2 = df[(df["CV.SigShort"] == "Benign")][feature]
            dist1 = df[(df["CV.SigShort"] == "Pathogenic")][feature]
            
            ones = list(df[df["CV.SigShort"] == "Pathogenic"][feature].values)
            zeros = list(df[df["CV.SigShort"] == "Benign"][feature].values)
            
        elif split.lower() == "cpd":
            dist2 = df[(df["CPD"] == "CPD")][feature]
            dist1 = df[(df["CPD"] == "non-CPD")][feature]
            
            ones = list(df[df["CPD"] == "non-CPD"][feature].values)
            zeros = list(df[df["CPD"] == "CPD"][feature].values)
            
    _, p_value = mannwhitneyu(dist1, dist2, alternative="greater", use_continuity=cont)
    
    res.append("{0:.2e}".format(p_value))
    res.extend(cal_auc(ones, zeros))
    
    return res


def calc_obs(df, feature, cl, split):
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
    
    if split.lower() == "clinvar":
        n = df[(df["CV.SigShort"] == "Benign") & (df[feature] == cl)].shape[0]
        p = n / df[(df["CV.SigShort"] == "Benign")].shape[0]
    elif split.lower() == "cpd":
        n = df[(df["CPD"] == "CPD") & (df[feature] == cl)].shape[0]
        p = n / df[(df["CPD"] == "CPD")].shape[0]
        
    res.append("{} ({:.2f})".format(n, p))

    if split.lower() == "clinvar":
        n = df[(df["CV.SigShort"] == "Pathogenic") & (df[feature] == cl)].shape[0]
        p = n / df[(df["CV.SigShort"] == "Pathogenic")].shape[0]
    elif split.lower() == "cpd":
        n = df[(df["CPD"] == "non-CPD") & (df[feature] == cl)].shape[0]
        p = n / df[(df["CPD"] == "non-CPD")].shape[0]
    
    res.append("{} ({:.2f})".format(n, p))

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


def stat_categ_mul(df, feature, split, remove=None):
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

    classes = np.unique(df[feature])
    res = []

    for cl in classes:
        new_res = [cl]
        
        obs = calc_obs(df, feature, cl, split=split)
        new_res.extend(obs)
        
        if split.lower() == "clinvar":        
            path_cl = df[(df[feature] == cl) & (df["CV.SigShort"] == "Pathogenic")].shape[0]
            ben_cl = df[(df[feature] == cl) & (df["CV.SigShort"] == "Benign")].shape[0]
            path_not_cl = df[(df[feature] != cl) & (df["CV.SigShort"] == "Pathogenic")].shape[0]
            ben_not_cl = df[(df[feature] != cl) & (df["CV.SigShort"] == "Benign")].shape[0]
            table = [[path_cl, ben_cl],
                     [path_not_cl, ben_not_cl]]
    
        elif split.lower() == "cpd":
            nCPD_cl = df[(df[feature] == cl) & (df["CPD"] == "non-CPD")].shape[0]
            CPD_cl = df[(df[feature] == cl) & (df["CPD"] == "CPD")].shape[0]
            nCPD_not_cl = df[(df[feature] != cl) & (df["CPD"] == "non-CPD")].shape[0]
            CPD_not_cl = df[(df[feature] != cl) & (df["CPD"] == "CPD")].shape[0]
            table = [[nCPD_cl, CPD_cl],
                     [nCPD_not_cl, CPD_not_cl]]
        
        p_value = chi2_test(table)
        new_res.extend(["{0:.2e}".format(p_value)])
        
        res.append(new_res)

    return res
        

def stat_categ(df, feature, split, remove=None):
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

    res = []

    if split.lower() == "clinvar":  
        table = pd.crosstab(df[feature], df['CV.SigShort'])
    
    elif split.lower() == "cpd":
        table = pd.crosstab(df[feature], df['CPD'])
        
    p_value = chi2_test(table)
    res.extend(["{0:.2e}".format(p_value)])
        
    return res


def print_num_stat(cv_df, f_numeric, name, split="clinvar"):
    name1, name2 = name.split("_")
    
    print("-" * 115)
    print('{:16}| {:25}| {:25}| {:10}| {:}'.format(" ", "Observations", "Median", "MW", "ROC-AUC"))
    print('{:16}| {:12} {:12}| {:12} {:12}| {:10}| {:7} {:7} {:7} {}'
          .format("Feature", name1, name2, name1, name2, "p-value", "AUC,%", "TPR,%", "FPR,%", "THR,%"))
    print("-" * 16 + "+" + "-" * 26 + "+" + "-" * 26 + "+" + "-" * 11 + "+" + "-" * 32)

    for f, pp in f_numeric.items():

        if pp["filter"] == "None": cv_df_filtered = cv_df
        elif pp["filter"] == "PDBAAMatch": cv_df_filtered = cv_df[(cv_df["PDBAAMatch"] == 1)]
        elif pp["filter"] == "StrQual": 
            cv_df_filtered = cv_df[(cv_df["PDBAAMatch"] == 1) & 
                             (cv_df['SM.Ide'] >= 0.95) & 
                             (cv_df['SM.Coverage'] >= 0.5)]
            cv_df_filtered['SM.Resol'] = cv_df_filtered['SM.Resol'].astype("float")
            cv_df_filtered = cv_df_filtered[(cv_df_filtered['SM.Resol'] <= 4.5)]
            
        res = stat_numeric(cv_df_filtered, f, cont=pp["type"]=="cont", split=split)

        print('{:16}| {:<12} {:<12}| {:<12} {:<12}| {:<10}| {:<7} {:<7} {:<7} {}'.format(f, *res))  

    print("-" * 115)
    print()
    print("DONE.")
    print()

    
def print_cat_stat(cv_df, f_categ, f_categ_mul, name, split="clinvar"):
    name1, name2 = name.split("_")

    print()
    print("PROCESSING CATEGORICAL FEATURES...")
    print()

    print("-" * 85)
    print('{:20}| {:14}| {:26}| {}'.format(" ", " ", "Observations", "Chi2 (one-vs-rest)"))
    print('{:20}| {:14}| {:12} {:13}|'
          .format("Feature", "Class", name1, name2))
    print("-" * 20 + "+" + "-" * 15 + "+" + "-" * 27 + "+" + "-" * 20)

    cv_df_filtered = cv_df[(cv_df["PDBAAMatch"] == 1)]
    for f, pp in f_categ_mul.items():
        res = stat_categ_mul(cv_df_filtered, f, remove=pp["remove"], split=split)

        print('{:20}| {:14}| {:12} {:13}| {}'.format(f, *res.pop(0)))  
        for r in res:
            print('{:20}| {:14}| {:12} {:13}| {}'.format(" ", *r))  

    print("-" * 85)
    print()
    
    print("-" * 33)
    print('{:20}| {}'.format(" ", "Chi2 (all)"))
    print('{:20}| '
          .format("Feature"))
    print("-" * 20 + "+" + "-" * 12)
    for f, pp in f_categ.items():
        res = stat_categ(cv_df_filtered, f, remove=pp["remove"], split=split)

        print('{:20}| {}'.format(f, *res))   

    print("-" * 33)
    print()
    print("DONE.")
    print()



# read data
print(f"Importing data...")
cv_df = pd.read_csv("../results/ClinVar_preprocessed.csv.gz", compression='gzip', low_memory=0)

print(f"{cv_df.shape[0]} random variants.")
print(f"{cv_df.shape[0]} ClinVar variants before filtering.")

cv_df.rename(columns={'SM.ClassRIN': 'SimpleClassRIN'}, inplace=True)

# filter variants
cv_df = cv_df[cv_df["CV.SigShort"] != "Drug response"]
print(f"{cv_df.shape[0]} ClinVar variants after removal of 'Drug response'.")

cv_df = cv_df[cv_df["CV.SigShort"] != "VUS"]
print(f"{cv_df.shape[0]} ClinVar variants after removal of 'VUS'.")

# filter 'Disorder' variants
cv_df = cv_df[cv_df["SimpleClassRIN"] != "Disorder"]
print(f"{cv_df.shape[0]} ClinVar variants after removal of 'Disorder' str class.")

# filter out unmapped variants
cv_df = cv_df[cv_df["NumAA2in26Prim"] != '?']
cv_df["NumAA2in26Prim"] = pd.to_numeric(cv_df["NumAA2in26Prim"])
print(f"{cv_df.shape[0]} variants after removal of '?' in 'AA2in26Prim'.")

# add an indicator column for CPD
cv_df["CPD"] = cv_df["NumAA2in26Prim"] > 0
cv_df["CPD"] = cv_df["CPD"].map({True: 'CPD', False: 'non-CPD'})

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
    "PhyloP": {"type": "cont","filter": "None"},
    "SPOTD.Info": {"type": "cont","filter": "None"},
    "PPH.dScore": {"type": "cont","filter": "None"},
    'SubDiffKDHydro': {"type": "cont", "filter": "None"},
    "Grantham": {"type": "cont","filter": "None"},
    
    "Blosum62": {"type": "disc","filter": "None"},
    
    # structural features; only matching variants
    "SPOTD.CN": {"type": "cont","filter": "PDBAAMatch"},
    "SPOTD.HSEu": {"type": "cont","filter": "PDBAAMatch"},
    "SPOTD.HSEd": {"type": "cont","filter": "PDBAAMatch"},
    "SPOTD.ASA": {"type": "cont", "filter": "PDBAAMatch"},
    "DSSP.NormASA": {"type": "cont", "filter": "PDBAAMatch"},
    "AveSeqDist": {"type": "cont", "filter": "PDBAAMatch"},
    "IntCont": {"type": "cont", "filter": "PDBAAMatch"},
    "B.Mean": {"type": "cont", "filter": "PDBAAMatch"},
    "B.Zscore": {"type": "cont", "filter": "PDBAAMatch"},
    "dProp": {"type": "cont", "filter": "PDBAAMatch"},
    "dVol": {"type": "cont", "filter": "PDBAAMatch"},
    'SPOTD.PDisorder': {"type": "cont", "filter": "PDBAAMatch"},
    'SPOTD.PCoil': {"type": "cont", "filter": "PDBAAMatch"},
    'SPOTD.PSheet': {"type": "cont", "filter": "PDBAAMatch"},
    'SPOTD.PHelix': {"type": "cont", "filter": "PDBAAMatch"},
    
    "ExtCont": {"type": "disc", "filter": "PDBAAMatch"},
    "BiolHetCont": {"type": "disc", "filter": "PDBAAMatch"},
    "Hb.Tot": {"type": "disc", "filter": "PDBAAMatch"},
    "Hb.Inter": {"type": "disc", "filter": "PDBAAMatch"},
    "Hb.Intra": {"type": "disc", "filter": "PDBAAMatch"},
    "Hb.IntraDist": {"type": "disc", "filter": "PDBAAMatch"},
    "Hb.SM": {"type": "disc", "filter": "PDBAAMatch"},
    "Hb.SS": {"type": "disc", "filter": "PDBAAMatch"},
    "PPH.PHAT": {"type": "disc", "filter": "PDBAAMatch"},
    
    # structural features; only matching variants & hq structure mapping
    "MaestroddG": {"type": "cont", "filter": "StrQual"},
    "FoldXddG": {"type": "cont", "filter": "StrQual"}
}

f_categ = {
    # structural features; only matching variants
    "PPH.Site": {"remove": "NO"},
    "PPH.Region": {"remove": "NO"},
    "SPOTD.SecStr": {"remove": None},
    "DSSP.SecStr": {"remove": "."},
    "SPOTD.PDisorder_bin": {"remove": None},
    "SPOTD.PCoil_bin": {"remove": None},
    "SPOTD.PSheet_bin": {"remove": None},
    "SPOTD.PHelix_bin": {"remove": None},
    "SimpleClassRIN": {"remove": None},
    "BiolHetCont_bin": {"remove": ""},
    "ExtCont_bin": {"remove": ""},
    "Hb.Inter_bin": {"remove": ""},
    'Hb.Intra_bin': {"remove": ""},
    'Hb.IntraDist_bin': {"remove": ""},
    'Hb.SM_bin': {"remove": ""},
    'Hb.SS_bin': {"remove": ""},
    'Hb.Tot_bin': {"remove": ""}
}

f_categ_mul = {
    # structural features; only matching variants
    "PPH.Site": {"remove": "NO"},
    "PPH.Region": {"remove": "NO"},
    "SPOTD.SecStr": {"remove": None},
    "DSSP.SecStr": {"remove": "."},
    "SimpleClassRIN": {"remove": None},
}

# Path-CPD vs Path-nonCPD
cv_df_sel = cv_df[cv_df["CV.SigShort"] == "Pathogenic"]
name = "Path-CPD_Path-nonCPD"
split = "CPD"

print_num_stat(cv_df_sel, f_numeric, name, split)
print_cat_stat(cv_df_sel, f_categ, f_categ_mul, name, split)

# Path-CPD vs Benign-CPD
cv_df_sel = cv_df[cv_df["CPD"] == "CPD"]
name = "Ben-CPD_Path-CPD"
split = "clinvar"

print_num_stat(cv_df_sel, f_numeric, name, split)
print_cat_stat(cv_df_sel, f_categ, f_categ_mul, name, split)

# Path-CPD vs Benign-non-CPD
cv_df_sel = cv_df[((cv_df["CPD"] == "CPD") & (cv_df["CV.SigShort"] == "Pathogenic")) | 
                  ((cv_df["CPD"] == "non-CPD") & (cv_df["CV.SigShort"] == "Benign"))]
name = "Path-CPD_Ben-nonCPD"
split = "cpd"

print_num_stat(cv_df_sel, f_numeric, name, split)
print_cat_stat(cv_df_sel, f_categ, f_categ_mul, name, split)

# Path-CPD vs Benign(all)
cv_df_sel = cv_df[((cv_df["CPD"] == "CPD") & (cv_df["CV.SigShort"] == "Pathogenic")) | 
                  (cv_df["CV.SigShort"] == "Benign")]
name = "Ben(all)_Path-CPD"
split = "clinvar"

print_num_stat(cv_df_sel, f_numeric, name, split)
print_cat_stat(cv_df_sel, f_categ, f_categ_mul, name, split)

# Benign-CPD vs Benign-non-CPD
cv_df_sel = cv_df[cv_df["CV.SigShort"] == "Benign"]
name = "Ben-CPD_Ben-nonCPD"
split = "cpd"

print_num_stat(cv_df_sel, f_numeric, name, split)
print_cat_stat(cv_df_sel, f_categ, f_categ_mul, name, split)