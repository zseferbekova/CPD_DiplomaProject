import pandas as pd
import warnings
import sys
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
pd.options.mode.chained_assignment = None

# import plot_utils
# import stat_utils

warnings.simplefilter(action='ignore', category=FutureWarning)

def plot_dists(df,
               feature, 
               split="clinvar",
               ran_df=None, 
               savepath=None,
               name=None,
               verbose=False):
    """
    Plot feature distribution.
    Args:
      df: a pandas dataframe. Should include a column "CV.SigShort".
      feature: a name of the feature to plot.
      split: how to split the data. (Default: ClinVar class)
      ran_df: if provided add distribution for random subs. (Default: None)
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
    
    if ran_df is not None:
        if verbose: 
            print(f"{ran_df[ran_df[feature] == '?'].shape[0]} random allels have undefined {feature} and will be removed.")
        ran_df = ran_df[ran_df[feature] != "?"]
        ran_df[feature] = pd.to_numeric(ran_df[feature])
    
    
    if split.lower() == "clinvar":
        if name: label1, label2 = name.split("_")
        else: label1, label2 = "Benign", "Pathogenic"
        
        sns.distplot(df_filtered[(df_filtered["CV.SigShort"] == "Benign")][feature], 
                    color="g", label=label1, kde=False, ax=ax1)
        sns.distplot(df_filtered[(df_filtered["CV.SigShort"] == "Pathogenic")][feature], 
                    color="r", label=label2, kde=False, ax=ax1)
        
        if ran_df is not None:
            sns.distplot(ran_df[feature], color="lightslategrey", label="Random", kde=False, ax=ax1)
        
        sns.kdeplot(df_filtered[(df_filtered["CV.SigShort"] == "Benign")][feature], 
                    color="g", label=label1, ax=ax2, cut=1, shade=True)
        sns.kdeplot(df_filtered[(df_filtered["CV.SigShort"] == "Pathogenic")][feature], 
                    color="r", label=label2, ax=ax2, cut=1, shade=True)
        
        if ran_df is not None:
            sns.kdeplot(ran_df[feature], color="lightslategrey", label="Random", ax=ax2, cut=1, shade=True)
        
        df_filtered["SubClass"] = df_filtered["CV.SigShort"]
                
        if ran_df is not None:
            ran_df["SubClass"] = "Random"
            bp_df = pd.concat([df_filtered[[feature, "SubClass"]], ran_df[[feature, "SubClass"]]]).reset_index()

            x_order = [label1, label2, "Random"]
            palette = {label1: "mediumseagreen", label2: "r", "Random": "lightslategrey"}

        else: 
            bp_df = df_filtered
            x_order = [label1, label2]
            palette = {label1: "mediumseagreen", label2: "r"} 

        sns.boxplot(data=bp_df, x=feature, y="SubClass", color="SubClass",
                    orient="h", ax=ax3, linewidth=2, order=x_order, palette=palette)
        
        
    elif split.lower() == "cpd":
        if name: label1, label2 = name.split("_")
        else: label1, label2 = "CPD", "non-CPD"
        
        sns.distplot(df_filtered[(df_filtered["CPD"] == "CPD")][feature], 
                    color="y", label=label1, kde=False, ax=ax1)
        sns.distplot(df_filtered[(df_filtered["CPD"] == "non-CPD")][feature], 
                    color="c", label=label2, kde=False, ax=ax1)
        
        if ran_df is not None:
            sns.distplot(ran_df[feature], color="lightslategrey", label="Random", kde=False, ax=ax1)
        
        sns.kdeplot(df_filtered[(df_filtered["CPD"] == "CPD")][feature], 
                    color="y", label=label1, ax=ax2, cut=1, shade=True)
        sns.kdeplot(df_filtered[(df_filtered["CPD"] == "non-CPD")][feature], 
                    color="c", label=label2, ax=ax2, cut=1, shade=True)
        
        if ran_df is not None:
            sns.kdeplot(ran_df[feature], color="lightslategrey", label="Random", ax=ax2, cut=1, shade=True)


        df_filtered["SubClass"] = df_filtered["CPD"]
        df_filtered["SubClass"].map({"CPD": label1, "non-CPD": label2})
        
        if ran_df is not None:
            ran_df["SubClass"] = "Random"
            bp_df = pd.concat([df_filtered[[feature, "SubClass"]], ran_df[[feature, "SubClass"]]]).reset_index()

            x_order = [label1, label2, "Random"]
            palette = {label1: "y", label2: "c", "Random": "lightslategrey"}

        else: 
            bp_df = df_filtered
            x_order = [label1, label2]
            palette = {label1: "y", label2: "c"} 

        sns.boxplot(data=bp_df, x=feature, y="SubClass", color="SubClass",
                    orient="h", ax=ax3, linewidth=2, order=x_order, palette=palette)
        
    ax1.set_xlabel('')
    ax2.set_xlabel("")
    ax3.set_xlabel(f"{feature}")
    
    ax1.set_ylabel('counts')
    ax2.set_ylabel('density')
    ax3.set_ylabel("")
    
    plt.title(label1 + " vs " + label2)
    
    if savepath: 
        plt.savefig(f"{savepath}/{feature}.png", bbox_inches='tight')
        plt.close()
    else: plt.show();
    
    
def plot_counts(df,
                feature,
                ran_df=None, 
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
      ran_df: if provided add distribution for random subs. (Default: None)
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
    
    if ran_df is not None:
        if verbose: print(f"{ran_df[ran_df[feature] == '?'].shape[0]} random allels have undefined {feature} and will be removed")
        ran_df = ran_df[ran_df[feature] != "?"]
        
    if remove_class:
        if verbose: 
            print(f"remove_class={remove_class} was passed to the function; \
              {df_filtered[df_filtered[feature] == remove_class].shape[0]} ClinVar allels will be removed.")
            if ran_df is not None:
                print(f"remove_class={remove_class} was passed to the function; \
                {ran_df[ran_df[feature] == remove_class].shape[0]} random allels will be removed.")
        df_filtered = df_filtered[df_filtered[feature] != remove_class]
        if ran_df is not None: ran_df = ran_df[ran_df[feature] != remove_class]

    if split.lower() == "clinvar":
        if name: label1, label2 = name.split("_")
        else: label1, label2 = "Benign", "Pathogenic"
        df_filtered["SubClass"] = df_filtered["CV.SigShort"]
        df_filtered["SubClass"].map({"CPD": label1, "non-CPD": label2})

        if ran_df is not None:
            ran_df["SubClass"] = "Random"
            summary_df = pd.concat([df_filtered[[feature, "SubClass"]], ran_df[[feature, "SubClass"]]]).reset_index()

            x_order = [label1, label2, "Random"]
            palette = {label1: "mediumseagreen", label2: "r", "Random": "lightslategrey"}
        else: 
            summary_df = df_filtered
            x_order = [label1, label2]
            palette = {label1: "mediumseagreen", label2: "r"}

    elif split.lower() == "cpd":
        if name: label1, label2 = name.split("_")
        else: label1, label2 = "CPD", "non-CPD"
        df_filtered["SubClass"] = df_filtered["CPD"]
        df_filtered["SubClass"].map({"CPD": label1, "non-CPD": label2})

        if ran_df is not None:
            ran_df["SubClass"] = "Random"
            summary_df = pd.concat([df_filtered[[feature, "SubClass"]], ran_df[[feature, "SubClass"]]]).reset_index()
            
            x_order = [label1, label2, "Random"]
            palette = {label1: "y", label2: "c", "Random": "lightslategrey"}

        else: 
            summary_df = df_filtered
            x_order = [label1, label2]
            palette = {label1: "y", label2: "c"}  
        
    features = np.unique(summary_df[feature])
    col_legend = {features[i] : sns.color_palette("Set3")[i] for i in range(len(features))}
        
    sns.countplot(x="SubClass", 
                  data=summary_df,
                  hue=feature, 
                  palette=col_legend, 
                  hue_order = features,
                  order=x_order,
                  ax=axes[0])    

    prop_df = (summary_df[feature]
               .groupby(summary_df["SubClass"])
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
    plt.title(label1 + " vs " + label2)

    if savepath: 
        plt.savefig(f"{savepath}/{feature}.png", bbox_inches='tight')
        plt.close()
    else: plt.show();
    
    
def plot_integers(df,
                  feature, 
                  ran_df=None, 
                  split="clinvar",
                  name=None,
                  savepath=None, 
                  verbose=False):
    """
    Plot feature distribution.
    Args:
      df: a pandas dataframe. Should include a column "CV.SigShort".
      feature: a name of the feature to plot.
      ran_df: if provided add distribution for random subs. (Default: None)
      savepath: a path to save the plot. (Default: None)
      verbose: whether to print log messages. (Default: False)
    Returns:
      nothing; saves/plots a graph.
    """
    sns.set(style="white", font_scale=1.5)
    _, axes = plt.subplots(1, 2, figsize=(20, 8))

    if verbose: print(f"{df[df[feature] == '?'].shape[0]} ClinVar allels have undefined {feature} and will be removed")
    df_filtered = df[df[feature] != "?"]
    if ran_df is not None:
        if verbose: print(f"{ran_df[ran_df[feature] == '?'].shape[0]} random allels have undefined {feature} and will be removed")
        ran_df = ran_df[ran_df[feature] != "?"]

    if split.lower() == "clinvar":
        if name: label1, label2 = name.split("_")
        else: label1, label2 = "Benign", "Pathogenic"
        df_filtered["SubClass"] = df_filtered["CV.SigShort"]
        df_filtered["SubClass"].map({"CPD": label1, "non-CPD": label2})

        if ran_df is not None:
            ran_df["SubClass"] = "Random"       
            summary_df = pd.concat([df_filtered[[feature, "SubClass"]], ran_df[[feature, "SubClass"]]]).reset_index()
        
            x_order = [label1, label2, "Random"]
            palette = {label1: "mediumseagreen", label2: "r", "Random": "lightslategrey"}
        else: 
            summary_df = df_filtered
            x_order = [label1, label2]
            palette = {label1: "mediumseagreen", label2: "r"}
            
    if split.lower() == "cpd":
        if name: label1, label2 = name.split("_")
        else: label1, label2 = "CPD", "non-CPD"
        df_filtered["SubClass"] = df_filtered["CPD"]
        df_filtered["SubClass"].map({"CPD": label1, "non-CPD": label2})

        if ran_df is not None:
            ran_df["SubClass"] = "Random"       
            summary_df = pd.concat([df_filtered[[feature, "SubClass"]], ran_df[[feature, "SubClass"]]]).reset_index()
        
            x_order = [label1, label2, "Random"]
            palette = {label1: "y", label2: "c", "Random": "lightslategrey"}

        else: 
            summary_df = df_filtered
            x_order = [label1, label2]
            palette = {label1: "y", label2: "c"}  
    
    summary_df[feature] = summary_df[feature].astype("int32")

    sns.countplot(x=feature, 
                  data=summary_df,
                  hue="SubClass", 
                  palette=palette, 
                  ax=axes[0])

    prop_df = (summary_df[feature]
               .groupby(summary_df["SubClass"])
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
    plt.title(label1 + " vs " + label2)

    if savepath: 
        plt.savefig(f"{savepath}/{feature}.png", bbox_inches='tight')
        plt.close()
        
    else: plt.show();
        
    
def plot_graphs(cv_df_sel, ran_df, out_path, plt_name, split):
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
            if pp["random"]: 
                plot_counts(cv_df_filtered, f, ran_df=ran_df, remove_class=pp["remove"], savepath=out_path, verbose=1, name=plt_name, split=split)
            else: 
                plot_counts(cv_df_filtered, f, remove_class=pp["remove"], savepath=out_path, verbose=1, name=plt_name, split=split)        

        else: 
            if pp["type"] == "cont":
                if pp["random"]: plot_dists(cv_df_filtered, f, ran_df=ran_df, savepath=out_path, verbose=1, name=plt_name, split=split)
                else: plot_dists(cv_df_filtered, f, savepath=out_path, verbose=1, name=plt_name, split=split)
            else: 
                if pp["random"]: plot_integers(cv_df_filtered, f, ran_df=ran_df, savepath=out_path, verbose=1, name=plt_name, split=split)
                else: plot_integers(cv_df_filtered, f, savepath=out_path, verbose=1, name=plt_name, split=split)

                    
                    
# read data
print(f"Importing data...")
cv_df = pd.read_csv("../results/ClinVar_preprocessed.csv.gz", compression='gzip', low_memory=0)
ran_df = pd.read_csv("../results/random_preprocessed.csv.gz", compression='gzip', low_memory=0)

print(f"{cv_df.shape[0]} random variants.")
print(f"{cv_df.shape[0]} ClinVar variants before filtering.")

cv_df.rename(columns={'SM.ClassRIN': 'SimpleClassRIN'}, inplace=True)

# filter variants
cv_df = cv_df[cv_df["CV.SigShort"] != "Drug response"]
print(f"{cv_df.shape[0]} ClinVar variants after removal of 'Drug response'.")

cv_df = cv_df[cv_df["CV.SigShort"] != "VUS"]
print(f"{cv_df.shape[0]} ClinVar variants after removal of 'VUS'.")

# remove one weird random variant
ran_df = ran_df[ran_df["FoldXddG"] < 500]
print("1 random variant has FoldXddG > 500 and will be removed.")

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
    'Disorder': 'Disorder',
    'None': 'None'
})

ran_df["SimpleClassRIN"] = ran_df["SimpleClassRIN"].map({
    'Protein interaction': 'Protein_interaction', 
    'Surface': 'Surface',
    'Core': 'Core',
    'ligand interaction': 'Other_interactions',
    'DNA interaction': 'Other_interactions',
    'ion interaction': 'Other_interactions',
    'metal interaction': 'Other_interactions',
    'RNA interaction': 'Other_interactions',
    'Peptide interaction': 'Other_interactions',
    'Disorder': 'Disorder',
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
    "PhyloP": {"type": "cont", "filter": "None", "random": False},
    "SPOTD.Info": {"type": "cont", "filter": "None", "random": False},
    "PPH.dScore": {"type": "cont", "filter": "None", "random": False},
    'SubDiffKDHydro': {"type": "cont", "filter": "None", "random": True},
    "Grantham": {"type": "cont", "filter": "None", "random": True},
    
    "Blosum62": {"type": "disc", "filter": "None", "random": True},
    
    # structural features; only matching variants
    "SPOTD.CN": {"type": "cont", "filter": "PDBAAMatch", "random": False},
    "SPOTD.HSEu": {"type": "cont", "filter": "PDBAAMatch", "random": False},
    "SPOTD.HSEd": {"type": "cont", "filter": "PDBAAMatch", "random": False},
    "SPOTD.ASA": {"type": "cont", "filter": "PDBAAMatch", "random": False},
    "DSSP.NormASA": {"type": "cont", "filter": "PDBAAMatch", "random": True},
    "B.Mean": {"type": "cont", "filter": "PDBAAMatch", "random": True},
    "B.Zscore": {"type": "cont", "filter": "PDBAAMatch", "random": True},
    "AveSeqDist": {"type": "cont", "filter": "PDBAAMatch", "random": True},
    "dProp": {"type": "cont", "filter": "PDBAAMatch", "random": True},
    "dVol": {"type": "cont", "filter": "PDBAAMatch", "random": True},
    "IntCont": {"type": "cont", "filter": "PDBAAMatch", "random": True},
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
    
    "PPH.Site": {"type": "cat", "filter": "PDBAAMatch", "remove": "NO", "random": False},
    "PPH.Region": {"type": "cat", "filter": "PDBAAMatch", "remove": "NO", "random": False},
    "SPOTD.SecStr": {"type": "cat", "filter": "PDBAAMatch", "remove": "", "random": False},
    "DSSP.SecStr": {"type": "cat", "filter": "PDBAAMatch", "remove": ".", "random": True},
    "SPOTD.PDisorder_bin": {"type": "cat", "filter": "PDBAAMatch", "remove": "", "random": False},
    "SPOTD.PCoil_bin": {"type": "cat", "filter": "PDBAAMatch", "remove": "", "random": False},
    "SPOTD.PSheet_bin": {"type": "cat", "filter": "PDBAAMatch", "remove": "", "random": False},
    "SPOTD.PHelix_bin": {"type": "cat", "filter": "PDBAAMatch", "remove": "", "random": False},
    "SimpleClassRIN": {"type": "cat", "filter": "PDBAAMatch", "remove": "None", "random": True},
    "BiolHetCont_bin": {"type": "cat", "filter": "PDBAAMatch", "remove": "", "random": False},
    "ExtCont_bin": {"type": "cat", "filter": "PDBAAMatch", "remove": "", "random": False},
    "Hb.Inter_bin": {"type": "cat", "filter": "PDBAAMatch", "remove": "", "random": False},
    'Hb.Intra_bin': {"type": "cat", "filter": "PDBAAMatch", "remove": "", "random": False},
    'Hb.IntraDist_bin': {"type": "cat", "filter": "PDBAAMatch", "remove": "", "random": False},
    'Hb.SM_bin': {"type": "cat", "filter": "PDBAAMatch", "remove": "", "random": False},
    'Hb.SS_bin': {"type": "cat", "filter": "PDBAAMatch", "remove": "", "random": False},
    'Hb.Tot_bin': {"type": "cat", "filter": "PDBAAMatch", "remove": "", "random": False},
    
    # structural features; only matching variants & hq structure mapping
    "MaestroddG": {"type": "cont", "filter": "StrQual", "random": True},
    "FoldXddG": {"type": "cont", "filter": "StrQual", "random": True}
}


# Path-CPD vs Path-nonCPD
cv_df_sel = cv_df[cv_df["CV.SigShort"] == "Pathogenic"]
out_path = "../pics/CV_CPD/PCPD_PnCPD/"
plt_name = "Path-CPD_Path-nonCPD"
split = "CPD"

plot_graphs(cv_df_sel, ran_df, out_path, plt_name, split)

# Path-CPD vs Benign-CPD
cv_df_sel = cv_df[cv_df["CPD"] == "CPD"]
out_path = "../pics/CV_CPD/PCPD_BCPD/"
plt_name = "Ben-CPD_Path-CPD"
split = "clinvar"

plot_graphs(cv_df_sel, ran_df, out_path, plt_name, split)

# Path-CPD vs Benign-non-CPD
cv_df_sel = cv_df[((cv_df["CPD"] == "CPD") & (cv_df["CV.SigShort"] == "Pathogenic")) | 
                  ((cv_df["CPD"] == "non-CPD") & (cv_df["CV.SigShort"] == "Benign"))]
out_path = "../pics/CV_CPD/PCPD_BnCPD/"
plt_name = "Path-CPD_Ben-nonCPD"
split = "cpd"

plot_graphs(cv_df_sel, ran_df, out_path, plt_name, split)

# Path-CPD vs Benign(all)
cv_df_sel = cv_df[((cv_df["CPD"] == "CPD") & (cv_df["CV.SigShort"] == "Pathogenic")) | 
                  (cv_df["CV.SigShort"] == "Benign")]
out_path = "../pics/CV_CPD/PCPD_B/"
plt_name = "Ben(all)_Path-CPD"
split = "clinvar"

plot_graphs(cv_df_sel, ran_df, out_path, plt_name, split)

# Benign-CPD vs Benign-non-CPD
cv_df_sel = cv_df[cv_df["CV.SigShort"] == "Benign"]
out_path = "../pics/CV_CPD/BCPD_BnCPD/"
plt_name = "Ben-CPD_Ben-nonCPD"
split = "cpd"

plot_graphs(cv_df_sel, ran_df, out_path, plt_name, split)
