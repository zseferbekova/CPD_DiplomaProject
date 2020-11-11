import pandas as pd
import warnings
import sys
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
pd.options.mode.chained_assignment = None

warnings.simplefilter(action='ignore', category=FutureWarning)

def plot_dists(df,
               feature, 
               split="clinvar",
               savepath=None,
               name=None,
               verbose=False):
    """
    Plot feature distribution.
    Args:
      df: a pandas dataframe. Should include a column "CV.SigShort".
      feature: a name of the feature to plot.
      split: how to split the data. (Default: ClinVar class)
      savepath: if provided save the plot to this dist. (Default: None)
      name: a plot name to use in legend and title. Benign should go
            before Pathogenic, CPD before non-CPD. (Default: None)
      verbose: whether to print log messages. (Default: False)
    Returns:
      nothing; saves/plots a graph.
    """
    sns.set(style="white", font_scale=1.3)
    fig, (ax1, ax2, ax3) = plt.subplots(3, sharex=True, figsize=(15, 10),
                                                    gridspec_kw={'height_ratios': [3, 3, 2]})
    
    if verbose: print(f"{df[df[feature] == '?'].shape[0]} ClinVar allels have undefined {feature} and will be removed.")
    df_filtered = df[df[feature] != "?"]
    df_filtered[feature] = pd.to_numeric(df_filtered[feature])
    palette = {"Ben(all)": "mediumseagreen", "Benign": "mediumseagreen", "Pathogenic": "r",
               "Ben-CPD": "seagreen", "Ben-nonCPD": "yellowgreen", "Path-CPD": "lightsalmon", "Path-nonCPD": "indianred"
              }
    
    if split.lower() == "clinvar":
        if name: label1, label2 = name.split("_")
        else: label1, label2 = "Benign", "Pathogenic"
            
        df_filtered["SubClass"] = df_filtered["CV.SigShort"].map({"Benign": label1, "Pathogenic": label2})
        
    elif split.lower() == "cpd":
        if name: label1, label2 = name.split("_")
        else: label1, label2 = "CPD", "non-CPD"

        df_filtered["SubClass"] = df_filtered["CPD"].map({"CPD": label1, "non-CPD": label2})
        
    x_order = [label1, label2]
        
    sns.histplot(data=df_filtered, x=feature, hue="SubClass", 
                palette=palette, ax=ax1)
    sns.kdeplot(data=df_filtered, x=feature, hue="SubClass",  
                palette=palette, ax=ax2, cut=1, shade=True, common_norm=False)                

    sns.boxplot(data=df_filtered, x=feature, y="SubClass", color="SubClass",
                orient="h", ax=ax3, linewidth=2, order=x_order, palette=palette)
        
    ax1.set_xlabel('')
    ax2.set_xlabel("")
    ax3.set_xlabel(f"{feature}")
    
    ax1.set_ylabel('counts')
    ax2.set_ylabel('density')
    ax3.set_ylabel("")
        
    if savepath: 
        plt.savefig(f"{savepath}/{feature}.png", bbox_inches='tight')
        plt.close()
    else: plt.show();
    
    
def plot_counts(df,
                feature,
                split="clinvar",
                savepath=None, 
                remove_class=None,
                name=None,
                verbose=False):
    """
    Plot feature distribution.
    Args:
      df: a pandas dataframe. Should include a column "CV.SigShort".
      feature: a name of the feature to plot.
      savepath: a path to save the plot. (Default: None)
      remove_class: a specific class to remove from plot. (Default: None)
      name: a plot name to use in legend and title. Benign should go
            before Pathogenic, CPD before non-CPD. (Default: None)      
      verbose: whether to print log messages. (Default: False)
    Returns:
      nothing; saves/plots a graph.
    """
    sns.set(style="white", font_scale=1.5)
    _, axes = plt.subplots(1, 2, figsize=(20, 8))

    if verbose: print(f"{df[df[feature] == '?'].shape[0]} ClinVar allels have undefined {feature} and will be removed")
    df_filtered = df[df[feature] != "?"]
    palette = {"Ben(all)": "mediumseagreen", "Benign": "mediumseagreen", "Pathogenic": "r",
               "Ben-CPD": "seagreen", "Ben-nonCPD": "yellowgreen", "Path-CPD": "lightsalmon", "Path-nonCPD": "indianred"
              }
    
    if remove_class:
        if verbose: 
            print(f"remove_class={remove_class} was passed to the function; \
              {df_filtered[df_filtered[feature] == remove_class].shape[0]} ClinVar allels will be removed.")

        df_filtered = df_filtered[df_filtered[feature] != remove_class]

    if split.lower() == "clinvar":
        if name: label1, label2 = name.split("_")
        else: label1, label2 = "Benign", "Pathogenic"
        df_filtered["SubClass"] = df_filtered["CV.SigShort"].map({"Benign": label1, "Pathogenic": label2})

    elif split.lower() == "cpd":
        if name: label1, label2 = name.split("_")
        else: label1, label2 = "CPD", "non-CPD"
        df_filtered["SubClass"] = df_filtered["CPD"].map({"CPD": label1, "non-CPD": label2})
        
    x_order = [label1, label2]        
    features = np.unique(df_filtered[feature])
    col_legend = {features[i] : sns.color_palette("Set3")[i] for i in range(len(features))}
        
    sns.countplot(x="SubClass", 
                  data=df_filtered,
                  hue=feature, 
                  palette=col_legend, 
                  hue_order = features,
                  order=x_order,
                  ax=axes[0])    

    prop_df = (df_filtered[feature]
               .groupby(df_filtered["SubClass"])
               .value_counts(normalize=True)
               .rename("Frequency")
               .reset_index())

    sns.barplot(x="SubClass", 
                y="Frequency", 
                data=prop_df,
                hue=feature, 
                palette=col_legend,
                hue_order=features,
                order=x_order,
                ax=axes[1])
              
    axes[0].set_ylabel(f'{feature} counts')
    axes[1].set_ylabel(f'{feature} frequency (within each class)')
    axes[0].legend_.remove()
              
    plt.legend(bbox_to_anchor=(1., 1.), loc='upper left', title=feature)

    if savepath: 
        plt.savefig(f"{savepath}/{feature}.png", bbox_inches='tight')
        plt.close()
    else: plt.show();
    
    
def plot_integers(df,
                  feature, 
                  split="clinvar",
                  name=None,
                  savepath=None, 
                  verbose=False):
    """
    Plot feature distribution.
    Args:
      df: a pandas dataframe. Should include a column "CV.SigShort".
      feature: a name of the feature to plot.
      savepath: a path to save the plot. (Default: None)
      verbose: whether to print log messages. (Default: False)
    Returns:
      nothing; saves/plots a graph.
    """
    sns.set(style="white", font_scale=1.5)
    _, axes = plt.subplots(1, 2, figsize=(20, 8))

    if verbose: print(f"{df[df[feature] == '?'].shape[0]} ClinVar allels have undefined {feature} and will be removed")
    df_filtered = df[df[feature] != "?"]
    palette = {"Ben(all)": "mediumseagreen", "Benign": "mediumseagreen", "Pathogenic": "r",
               "Ben-CPD": "seagreen", "Ben-nonCPD": "yellowgreen", "Path-CPD": "lightsalmon", "Path-nonCPD": "indianred"
              }
    
    if split.lower() == "clinvar":
        if name: label1, label2 = name.split("_")
        else: label1, label2 = "Benign", "Pathogenic"
        df_filtered["SubClass"] = df_filtered["CV.SigShort"].map({"Benign": label1, "Pathogenic": label2})
            
    elif split.lower() == "cpd":
        if name: label1, label2 = name.split("_")
        else: label1, label2 = "CPD", "non-CPD"
        df_filtered["SubClass"] = df_filtered["CPD"].map({"CPD": label1, "non-CPD": label2})
        
    x_order = [label1, label2]    
    df_filtered[feature] = df_filtered[feature].astype("int32")
    
    sns.countplot(x=feature, 
                  data=df_filtered,
                  hue="SubClass", 
                  palette=palette, 
                  ax=axes[0])

    prop_df = (df_filtered[feature]
               .groupby(df_filtered["SubClass"])
               .value_counts(normalize=True)
               .rename("Frequency")
               .reset_index())

    sns.barplot(x=feature, 
                y="Frequency", 
                data=prop_df,
                hue="SubClass", 
                palette=palette, 
                ax=axes[1])

    axes[0].set_ylabel(f'{feature} counts')
    axes[1].set_ylabel(f'{feature} frequency')
    axes[0].legend_.remove()
    
    plt.legend(bbox_to_anchor=(1., 1.), loc='upper left', title="Substitution class")

    if savepath: 
        plt.savefig(f"{savepath}/{feature}.png", bbox_inches='tight')
        plt.close()
        
    else: plt.show();
        
    
def plot_graphs(cv_df_sel, out_path, plt_name, split):
    """
    Go through all features and save plots.
    """
    for f, pp in FEATURES.items():
        print(f"PROCESSING {f}...")

        if pp["filter"] == "None": cv_df_filtered = cv_df_sel
        elif pp["filter"] == "PDBAAMatch": cv_df_filtered = cv_df_sel[(cv_df_sel["PDBAAMatch"] == 1)]
        elif pp["filter"] == "StrQual": 
            cv_df_filtered = cv_df_sel[(cv_df_sel["PDBAAMatch"] == 1) & 
                             (cv_df_sel['SM.Ide'] >= 0.95) & 
                             (cv_df_sel['SM.Coverage'] >= 0.5)]
            cv_df_filtered['SM.Resol'] = cv_df_filtered['SM.Resol'].astype("float")
            cv_df_filtered = cv_df_filtered[(cv_df_filtered['SM.Resol'] <= 4.5)]

        if pp["type"] == "cat":
            plot_counts(cv_df_filtered, f, remove_class=pp["remove"], savepath=out_path, verbose=1, name=plt_name, split=split)   

        else: 
            if pp["type"] == "cont":
                plot_dists(cv_df_filtered, f, savepath=out_path, verbose=1, name=plt_name, split=split)
            else: 
                plot_integers(cv_df_filtered, f, savepath=out_path, verbose=1, name=plt_name, split=split)

                    
                    
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
    'Protein interaction': 'Protein_interaction', 
    'Surface': 'Surface',
    'Core': 'Core',
    'ligand interaction': 'Other_interactions',
    'DNA interaction': 'Other_interactions',
    'ion interaction': 'Other_interactions',
    'metal interaction': 'Other_interactions',
    'RNA interaction': 'Other_interactions',
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
FEATURES = {
    # phylogenetic features; no filter needed
    "PhyloP": {"type": "cont", "filter": "None"},
    "SPOTD.Info": {"type": "cont", "filter": "None"},
    "PPH.dScore": {"type": "cont", "filter": "None"},
    'SubDiffKDHydro': {"type": "cont", "filter": "None"},
    "Grantham": {"type": "cont", "filter": "None"},
    
    "Blosum62": {"type": "disc", "filter": "None"},
    
    # structural features; only matching variants
    "SPOTD.CN": {"type": "cont", "filter": "PDBAAMatch"},
    "SPOTD.HSEu": {"type": "cont", "filter": "PDBAAMatch"},
    "SPOTD.HSEd": {"type": "cont", "filter": "PDBAAMatch"},
    "SPOTD.ASA": {"type": "cont", "filter": "PDBAAMatch"},
    "DSSP.NormASA": {"type": "cont", "filter": "PDBAAMatch"},
    "B.Mean": {"type": "cont", "filter": "PDBAAMatch"},
    "B.Zscore": {"type": "cont", "filter": "PDBAAMatch"},
    "AveSeqDist": {"type": "cont", "filter": "PDBAAMatch"},
    "dProp": {"type": "cont", "filter": "PDBAAMatch"},
    "dVol": {"type": "cont", "filter": "PDBAAMatch"},
    "IntCont": {"type": "cont", "filter": "PDBAAMatch"},
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
    
    "PPH.Site": {"type": "cat", "filter": "PDBAAMatch", "remove": "NO"},
    "PPH.Region": {"type": "cat", "filter": "PDBAAMatch", "remove": "NO"},
    "SPOTD.SecStr": {"type": "cat", "filter": "PDBAAMatch", "remove": ""},
    "DSSP.SecStr": {"type": "cat", "filter": "PDBAAMatch", "remove": "."},
    "SPOTD.PDisorder_bin": {"type": "cat", "filter": "PDBAAMatch", "remove": ""},
    "SPOTD.PCoil_bin": {"type": "cat", "filter": "PDBAAMatch", "remove": ""},
    "SPOTD.PSheet_bin": {"type": "cat", "filter": "PDBAAMatch", "remove": ""},
    "SPOTD.PHelix_bin": {"type": "cat", "filter": "PDBAAMatch", "remove": ""},
    "SimpleClassRIN": {"type": "cat", "filter": "PDBAAMatch", "remove": "None"},
    "BiolHetCont_bin": {"type": "cat", "filter": "PDBAAMatch", "remove": ""},
    "ExtCont_bin": {"type": "cat", "filter": "PDBAAMatch", "remove": ""},
    "Hb.Inter_bin": {"type": "cat", "filter": "PDBAAMatch", "remove": ""},
    'Hb.Intra_bin': {"type": "cat", "filter": "PDBAAMatch", "remove": ""},
    'Hb.IntraDist_bin': {"type": "cat", "filter": "PDBAAMatch", "remove": ""},
    'Hb.SM_bin': {"type": "cat", "filter": "PDBAAMatch", "remove": ""},
    'Hb.SS_bin': {"type": "cat", "filter": "PDBAAMatch", "remove": ""},
    'Hb.Tot_bin': {"type": "cat", "filter": "PDBAAMatch", "remove": ""},
    
    # structural features; only matching variants & hq structure mapping
    "MaestroddG": {"type": "cont", "filter": "StrQual"},
    "FoldXddG": {"type": "cont", "filter": "StrQual"}
}


# Path-CPD vs Path-nonCPD
cv_df_sel = cv_df[cv_df["CV.SigShort"] == "Pathogenic"]
out_path = "../pics/CV_CPD/PCPD_PnCPD/"
plt_name = "Path-CPD_Path-nonCPD"
split = "CPD"

plot_graphs(cv_df_sel, out_path, plt_name, split)

# Path-CPD vs Benign-CPD
cv_df_sel = cv_df[cv_df["CPD"] == "CPD"]
out_path = "../pics/CV_CPD/PCPD_BCPD/"
plt_name = "Ben-CPD_Path-CPD"
split = "clinvar"

plot_graphs(cv_df_sel, out_path, plt_name, split)

# Path-CPD vs Benign-non-CPD
cv_df_sel = cv_df[((cv_df["CPD"] == "CPD") & (cv_df["CV.SigShort"] == "Pathogenic")) | 
                  ((cv_df["CPD"] == "non-CPD") & (cv_df["CV.SigShort"] == "Benign"))]
out_path = "../pics/CV_CPD/PCPD_BnCPD/"
plt_name = "Path-CPD_Ben-nonCPD"
split = "cpd"

plot_graphs(cv_df_sel, out_path, plt_name, split)

# Path-CPD vs Benign(all)
cv_df_sel = cv_df[((cv_df["CPD"] == "CPD") & (cv_df["CV.SigShort"] == "Pathogenic")) | 
                  (cv_df["CV.SigShort"] == "Benign")]
out_path = "../pics/CV_CPD/PCPD_B/"
plt_name = "Ben(all)_Path-CPD"
split = "clinvar"

plot_graphs(cv_df_sel, out_path, plt_name, split)

# Benign-CPD vs Benign-non-CPD
cv_df_sel = cv_df[cv_df["CV.SigShort"] == "Benign"]
out_path = "../pics/CV_CPD/BCPD_BnCPD/"
plt_name = "Ben-CPD_Ben-nonCPD"
split = "cpd"

plot_graphs(cv_df_sel, out_path, plt_name, split)
