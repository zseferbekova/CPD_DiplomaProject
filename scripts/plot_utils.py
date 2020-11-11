#!/usr/bin/env python3

import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
pd.options.mode.chained_assignment = None

def plot_dist_by_ClinVar(df, 
                         feature, 
                         xlim=None, 
                         kde=True, 
                         boxplot=True, 
                         remove_VUS=True, 
                         savepath=None, 
                         verbose=False):
    """
    Plot feature distribution by ClinVar class.
    Args:
      df: a pandas dataframe. Should include a column "CV.SigShort".
      feature: a name of the feature to plot.
      xlim: a tuple (x_min, x_max). (Default: None)
      remove_VUS: whether to remove VUS alleles. (Default: True)
      kde: whether to plot distribution. (Default: True)
      boxplot: whether to show boxplots. (Default: True)
      savepath: a path to save the plot. (Default: None)
      verbose: whether to print log messages. (Default: False)
    Returns:
      nothing; plots 3 graphs.
    """
    sns.set(style="white", font_scale=1.3)
    if kde:
        if boxplot:
            fig, (ax1, ax2, ax3, ax4) = plt.subplots(4, sharex=True, figsize=(15, 10),
                                                    gridspec_kw={'height_ratios': [3, 3, 3, 1.5]})
        else:
            fig, (ax1, ax2, ax3) = plt.subplots(3, sharex=True, figsize=(15, 8),)
    else: 
        if boxplot:
            fig, (ax1, ax2, ax3) = plt.subplots(3, sharex=True, figsize=(15, 8),
                                                    gridspec_kw={'height_ratios': [3, 3, 1.5]})
        else:
            fig, (ax1, ax2) = plt.subplots(2, sharex=True, figsize=(15, 8),)
    
    if verbose: print(f"{df[df[feature] == '?'].shape[0]} allels have undefined {feature} and will be removed.")
    df_filtered = df[df[feature] != "?"]
    df_filtered[feature] = pd.to_numeric(df_filtered[feature])
        
    if remove_VUS:
        if verbose: 
            print(f"remove_VUS set to True; {df_filtered[df_filtered['CV.SigShort'] == 'VUS'].shape[0]} allels will be removed.")
        df_filtered = df_filtered[df_filtered["CV.SigShort"] != "VUS"]
    
    if xlim:
        if verbose: 
            print(f"xlim argument provided; {df_filtered[(df_filtered[feature] < xlim[0]) | (df_filtered[feature] > xlim[1])].shape[0]} allels will be removed.")
        df_filtered = df_filtered[(df_filtered[feature] > xlim[0]) & (df_filtered[feature] < xlim[1])]
    
    sns.distplot(df_filtered[feature], color="grey", kde=False, ax=ax1)
    
    sns.distplot(df_filtered[(df_filtered["CV.SigShort"] == "Benign")][feature], 
                color="g", label="Benign", kde=False, ax=ax2)
    sns.distplot(df_filtered[(df_filtered["CV.SigShort"] == "Pathogenic")][feature], 
                color="r", label="Pathogenic", kde=False, ax=ax2)
    if not remove_VUS:
        sns.distplot(df_filtered[(df_filtered["CV.SigShort"] == "VUS")][feature], 
                     color="grey", label="VUS", kde=False, ax=ax2)
        
    if kde:
        sns.kdeplot(df_filtered[(df_filtered["CV.SigShort"] == "Benign")][feature], 
                    color="g", label="Benign", ax=ax3, cut=1, shade=True)
        sns.kdeplot(df_filtered[(df_filtered["CV.SigShort"] == "Pathogenic")][feature], 
                    color="r", label="Pathogenic", ax=ax3, cut=1, shade=True)
        if not remove_VUS:
            sns.kdeplot(df_filtered[(df_filtered["CV.SigShort"] == "VUS")][feature], 
                        color="grey", label="VUS", ax=ax3, cut=1, shade=True)
        if boxplot:
            sns.boxplot(data=df_filtered, x=feature, y="CV.SigShort", color="CV.SigShort",
                        orient="h", ax=ax4, linewidth=2, palette={"Benign": "mediumseagreen", "Pathogenic": "r", "VUS": "grey"}, 
                        order=["Benign", "Pathogenic", "VUS"])
    else:
        if boxplot:
            sns.boxplot(data=df_filtered, x=feature, y="CV.SigShort", color="CV.SigShort",
                        orient="h", ax=ax3, linewidth=2, palette={"Benign": "mediumseagreen", "Pathogenic": "r", "VUS": "grey"}, 
                        order=["Benign", "Pathogenic", "VUS"])
        
    ax1.set_xlabel('')
    ax2.set_xlabel("")
    if kde: 
        if boxplot:
            ax3.set_xlabel("")
            ax4.set_xlabel(f"{feature}")
    else: 
        if boxplot:
            ax3.set_xlabel(f"{feature}")
            
    ax1.set_ylabel('counts')
    ax2.set_ylabel('counts')
    if kde: 
        ax3.set_ylabel('density')
        if boxplot: ax4.set_ylabel("")
    else: 
        if boxplot: ax3.set_ylabel("")

    ax2.legend(loc="best")
    if kde: ax3.legend(loc="best")

    if xlim: plt.xlim(xlim[0], xlim[1])
        
    if savepath: 
        if remove_VUS: plt.savefig(f"{savepath}/{feature}_wo_VUS.png", bbox_inches='tight')
        else: plt.savefig(f"{savepath}/{feature}_w_VUS.png", bbox_inches='tight')
        plt.close()
    else: plt.show();
    
    
def plot_counts_by_ClinVar(df, 
                           feature, 
                           savepath=None, 
                           remove_VUS=True, 
                           remove_class=None,
                           verbose=False):
    """
    Plot feature distribution by ClinVar class.
    Args:
      df: a pandas dataframe. Should include a column "CV.SigShort".
      feature: a name of the feature to plot.
      savepath: a path to save the plot. (Default: None)
      remove_VUS: whether to remove VUS alleles. (Default: True)
      remove_class: a specific class to remove from plot. (Default: None)
      verbose: whether to print log messages. (Default: False)
    Returns:
      nothing; plots 3 graphs.
    """
    sns.set(style="white", font_scale=1.5)
    _, axes = plt.subplots(1, 2, figsize=(20, 8))

    if verbose: print(f"{df[df[feature] == '?'].shape[0]} allels have undefined {feature} and will be removed")
    df_filtered = df[df[feature] != "?"]
    
    x_order = ["Benign", "Pathogenic", "VUS"]
    if remove_VUS:
        if verbose: 
            print(f"remove_VUS set to True; {df_filtered[df_filtered['CV.SigShort'] == 'VUS'].shape[0]} allels will be removed.")
        df_filtered = df_filtered[df_filtered["CV.SigShort"] != "VUS"]
        x_order = ["Benign", "Pathogenic"]
    
    if remove_class:
        if verbose: 
            print(f"remove_class={remove_class} was passed to the function; \
              {df_filtered[df_filtered[feature] == remove_class].shape[0]} allels will be removed.")
        df_filtered = df_filtered[df_filtered[feature] != remove_class]
    
    features = np.unique(df_filtered[feature])
    col_legend = {features[i] : sns.color_palette("Set3")[i] for i in range(len(features))}
    
    sns.countplot(x="CV.SigShort", 
                  data=df_filtered,
                  hue=feature, 
                  palette=col_legend, 
                  hue_order = features,
                  order=x_order,
                  ax=axes[0])    

    prop_df = (df_filtered[feature]
               .groupby(df_filtered["CV.SigShort"])
               .value_counts(normalize=True)
               .rename("Frequency")
               .reset_index())

    sns.barplot(x="CV.SigShort", 
                y="Frequency", 
                data=prop_df,
                hue=feature, 
                palette=col_legend,
                hue_order = features,
                order=x_order,
                ax=axes[1])
              
    axes[0].set_ylabel(f'{feature} counts')
    axes[1].set_ylabel(f'{feature} frequency (within ClinVar class)')
    axes[0].legend_.remove()
              
    plt.legend(bbox_to_anchor=(1., 1.), loc='upper left', title=feature)

    if savepath: 
        if remove_VUS: plt.savefig(f"{savepath}/{feature}_wo_VUS.png", bbox_inches='tight')
        else: plt.savefig(f"{savepath}/{feature}_w_VUS.png", bbox_inches='tight')
        plt.close()
    else: plt.show();
    
    
def plot_integers_by_ClinVar(df, 
                             feature, 
                             savepath=None, 
                             remove_VUS=True, 
                             verbose=False):
    """
    Plot feature distribution by ClinVar class.
    Args:
      df: a pandas dataframe. Should include a column "CV.SigShort".
      feature: a name of the feature to plot.
      savepath: a path to save the plot. (Default: None)
      remove_VUS: whether to remove VUS alleles. (Default: True)
      verbose: whether to print log messages. (Default: False)
    Returns:
      nothing; plots 3 graphs.
    """
    sns.set(style="white", font_scale=1.5)
    _, axes = plt.subplots(1, 2, figsize=(20, 8))

    if verbose: print(f"{df[df[feature] == '?'].shape[0]} allels have undefined {feature} and will be removed")
    df_filtered = df[df[feature] != "?"]
        
    if remove_VUS:
        if verbose: 
            print(f"remove_VUS set to True; {df_filtered[df_filtered['CV.SigShort'] == 'VUS'].shape[0]} allels will be removed.")
        df_filtered = df_filtered[df_filtered["CV.SigShort"] != "VUS"]
    
    df_filtered[feature] = df_filtered[feature].astype("int32")
    
    sns.countplot(x=feature, 
                  data=df_filtered,
                  hue="CV.SigShort", 
                  palette={"Benign": "mediumseagreen", "Pathogenic": "r"}, 
                  ax=axes[0])

    prop_df = (df_filtered[feature]
               .groupby(df_filtered["CV.SigShort"])
               .value_counts(normalize=True)
               .rename("Frequency")
               .reset_index())

    sns.barplot(x=feature, 
                y="Frequency", 
                data=prop_df,
                hue="CV.SigShort", 
                palette={"Benign": "mediumseagreen", "Pathogenic": "r"}, 
                ax=axes[1])

    axes[0].set_ylabel(f'{feature} counts')
    axes[1].set_ylabel(f'{feature} frequency')
    axes[0].legend_.remove()
    
    plt.legend(bbox_to_anchor=(1., 1.), loc='upper left', title="ClinVar class")

    if savepath: 
        if remove_VUS: plt.savefig(f"{savepath}/{feature}_wo_VUS.png", bbox_inches='tight')
        else: plt.savefig(f"{savepath}/{feature}_w_VUS.png", bbox_inches='tight')
        plt.close()
        
    else: plt.show();
    

# def plot_dist_CPD(df, 
#                   feature, 
#                   xlim=None, 
#                   remove_VUS=True, 
#                   savepath=None, 
#                   verbose=False):
#     """
#     Plot feature distribution by ClinVar class for CPDs vs non-CPDs.
#     Args:
#       df: a pandas dataframe. Should include a column "CV.SigShort".
#       feature: a name of the feature to plot.
#       xlim: a tuple (x_min, x_max). (Default: None)
#       remove_VUS: whether to remove VUS alleles. (Default: True)
#       savepath: a path to save the plot. (Default: None)
#       verbose: whether to print log messages. (Default: False)
#     Returns:
#       nothing; plots 3 graphs.
#     """
#     sns.set(style="white", font_scale=1.3)
#     if remove_VUS: fig, (ax1, ax2, ax3) = plt.subplots(3, sharex=True, figsize=(15, 10), gridspec_kw={'height_ratios': [2, 2, 1]})
#     else: fig, (ax1, ax2, ax3) = plt.subplots(3, sharex=True, figsize=(15, 10), gridspec_kw={'height_ratios': [2, 2, 2]})
    
#     if verbose: print(f"{df[df[feature] == '?'].shape[0]} allels have undefined {feature} and will be removed.")
#     df_filtered = df[df[feature] != "?"]
#     df_filtered[feature] = pd.to_numeric(df_filtered[feature])
        
#     if remove_VUS:
#         if verbose: 
#             print(f"remove_VUS set to True; {df_filtered[df_filtered['CV.SigShort'] == 'VUS'].shape[0]} allels will be removed.")
#         df_filtered = df_filtered[df_filtered["CV.SigShort"] != "VUS"]
    
#     if xlim:
#         if verbose: 
#             print(f"xlim argument provided; {df_filtered[(df_filtered[feature] < xlim[0]) | (df_filtered[feature] > xlim[1])].shape[0]} allels will be removed.")
#         df_filtered = df_filtered[(df_filtered[feature] > xlim[0]) & (df_filtered[feature] < xlim[1])]
        
#     sns.kdeplot(df_filtered[(df_filtered["CV.SigShort"] == "Benign") & (df_filtered["CPD"] == 'CPD')][feature], 
#                 color="g", label="Benign", ax=ax1, cut=1, shade=True)
#     sns.kdeplot(df_filtered[(df_filtered["CV.SigShort"] == "Pathogenic")& (df_filtered["CPD"] == 'CPD')][feature], 
#                 color="r", label="Pathogenic", ax=ax1, cut=1, shade=True)
    
#     sns.kdeplot(df_filtered[(df_filtered["CV.SigShort"] == "Benign")& (df_filtered["CPD"] == 'non-CPD')][feature], 
#                 color="g", label="Benign", ax=ax2, cut=1, shade=True)
#     sns.kdeplot(df_filtered[(df_filtered["CV.SigShort"] == "Pathogenic")& (df_filtered["CPD"] == 'non-CPD')][feature], 
#                 color="r", label="Pathogenic", ax=ax2, cut=1, shade=True)
        
#     if remove_VUS:
#         sns.boxplot(data=df_filtered, y="CPD", x=feature, hue="CV.SigShort",
#                     orient="h", ax=ax3, linewidth=2, palette={"Benign": "mediumseagreen", "Pathogenic": "r"})
#     else:
#         sns.kdeplot(df_filtered[(df_filtered["CV.SigShort"] == "VUS") & (df_filtered["CPD"] == 'CPD')][feature], 
#                     color="grey", label="VUS", ax=ax1, cut=1, shade=True)
#         sns.kdeplot(df_filtered[(df_filtered["CV.SigShort"] == "VUS") & (df_filtered["CPD"] == 'non-CPD')][feature], 
#                     color="grey", label="VUS", ax=ax2, cut=1, shade=True)
#         sns.boxplot(data=df_filtered, y="CPD", x=feature, hue="CV.SigShort",
#                     orient="h", ax=ax3, linewidth=2, palette={"Benign": "mediumseagreen", "Pathogenic": "r", "VUS": "grey"},
#                     order=["Benign", "Pathogenic", "VUS"])
        
#     ax1.set_xlabel('')
#     ax2.set_xlabel('')
#     ax3.set_xlabel(feature)
            
#     ax1.set_ylabel('density')
#     ax2.set_ylabel('density')
#     ax3.set_ylabel('')
    
#     ax1.set_title('CPD')
#     ax2.set_title("non-CPD")
    
#     ax1.legend(loc="best")
#     ax2.legend(loc="best")
#     ax3.legend(loc="upper right")
    
#     if xlim: plt.xlim(xlim[0], xlim[1])
        
#     if savepath: 
#         if remove_VUS: plt.savefig(f"{savepath}/{feature}_wo_VUS.png", bbox_inches='tight')
#         else: plt.savefig(f"{savepath}/{feature}_w_VUS.png", bbox_inches='tight')
#         plt.close()
#     else: plt.show();
        
    
# def plot_counts_CPD(df, 
#                     feature, 
#                     savepath=None, 
#                     remove_class=None, 
#                     remove_VUS=True, 
#                     verbose=False):
#     """
#     Plot feature distribution by ClinVar class for CPDs vs non-CPDs.
#     Args:
#       df: a pandas dataframe. Should include a column "CV.SigShort".
#       feature: a name of the feature to plot.
#       savepath: a path to save the plot. (Default: False)
#       remove_VUS: whether to remove VUS alleles. (Default: True)
#       remove_class: a specific class to remove from plot. (Default: None)
#       verbose: whether to print log messages. (Default: False)
#     Returns:
#       nothing; plots 3 graphs.
#     """
#     sns.set(style="white", font_scale=1.5)
#     _, axes = plt.subplots(1, 2, figsize=(20, 8), sharey=True)

#     if verbose: print(f"{df[df[feature] == '?'].shape[0]} allels have undefined {feature} and will be removed")
#     df_filtered = df[df[feature] != "?"]
    
#     if remove_VUS:
#         if verbose: print(f"remove_VUS set to True; {df_filtered[df_filtered['CV.SigShort'] == 'VUS'].shape[0]} allels will be removed.")
#         df_filtered = df_filtered[df_filtered["CV.SigShort"] != "VUS"]
#         x_order = ["Benign", "Pathogenic"]
#     else:    
#         x_order = ["Benign", "Pathogenic", "VUS"]
    
#     if remove_class:
#         if verbose: print(f"remove_class={remove_class} was passed to the function; \
#               {df_filtered[df_filtered[feature] == remove_class].shape[0]} allels will be removed.")
#         df_filtered = df_filtered[df_filtered[feature] != remove_class]
    
#     features = np.unique(df_filtered[feature])
#     col_legend = {features[i] : sns.color_palette("Set3")[i] for i in range(len(features))}
    
#     CPD_df = df_filtered[df_filtered["CPD"] == "CPD"]
#     nonCPD_df = df_filtered[df_filtered["CPD"] == "non-CPD"]
    
#     prop_df = (CPD_df[feature]
#                .groupby(df_filtered["CV.SigShort"])
#                .value_counts(normalize=True)
#                .rename("Frequency")
#                .reset_index())

#     sns.barplot(x="CV.SigShort", 
#                 y="Frequency", 
#                 data=prop_df,
#                 hue=feature, 
#                 palette=col_legend,
#                 hue_order = features,
#                 order=x_order,
#                 ax=axes[0])
    
#     prop_df = (nonCPD_df[feature]
#                .groupby(df_filtered["CV.SigShort"])
#                .value_counts(normalize=True)
#                .rename("Frequency")
#                .reset_index())

#     sns.barplot(x="CV.SigShort", 
#                 y="Frequency", 
#                 data=prop_df,
#                 hue=feature, 
#                 palette=col_legend,
#                 hue_order = features,
#                 order=x_order,
#                 ax=axes[1])
              
#     axes[0].set_ylabel(f'{feature} frequency')
#     axes[1].set_ylabel('')
#     axes[0].legend_.remove()
    
#     axes[0].set_title('CPD')
#     axes[1].set_title("non-CPD")
              
#     plt.legend(bbox_to_anchor=(1., 1.), loc='upper left', title=feature)

#     if savepath: 
#         if remove_VUS: plt.savefig(f"{savepath}/{feature}_wo_VUS.png", bbox_inches='tight')
#         else: plt.savefig(f"{savepath}/{feature}_w_VUS.png", bbox_inches='tight')
#         plt.close()
#     else: plt.show();
        
        
def plot_dist_CPD(df, 
                  feature,
                  paths=True,
                  xlim=None, 
                  kde=True, 
                  boxplot=True, 
                  savepath=None, 
                  verbose=False):
    """
    Plot feature distribution by ClinVar class.
    Args:
      df: a pandas dataframe. Should include a column "CV.SigShort".
      feature: a name of the feature to plot.
      xlim: a tuple (x_min, x_max). (Default: None)
      kde: whether to plot distribution. (Default: True)
      boxplot: whether to show boxplots. (Default: True)
      savepath: a path to save the plot. (Default: None)
      verbose: whether to print log messages. (Default: False)
    Returns:
      nothing; plots 3 graphs.
    """
    sns.set(style="white", font_scale=1.3)
    if kde:
        if boxplot:
            fig, (ax1, ax2, ax3, ax4) = plt.subplots(4, sharex=True, figsize=(15, 10),
                                                    gridspec_kw={'height_ratios': [3, 3, 3, 1.5]})
        else:
            fig, (ax1, ax2, ax3) = plt.subplots(3, sharex=True, figsize=(15, 8),)
    else: 
        if boxplot:
            fig, (ax1, ax2, ax3) = plt.subplots(3, sharex=True, figsize=(15, 8),
                                                    gridspec_kw={'height_ratios': [3, 3, 1.5]})
        else:
            fig, (ax1, ax2) = plt.subplots(2, sharex=True, figsize=(15, 8),)
    
    if verbose: print(f"{df[df[feature] == '?'].shape[0]} allels have undefined {feature} and will be removed.")
    df_filtered = df[df[feature] != "?"]
    df_filtered[feature] = pd.to_numeric(df_filtered[feature])
        
    if verbose: 
        print(f"remove_VUS set to True; {df_filtered[df_filtered['CV.SigShort'] == 'VUS'].shape[0]} allels will be removed.")
    df_filtered = df_filtered[df_filtered["CV.SigShort"] != "VUS"]
    
    if xlim:
        if verbose: 
            print(f"xlim argument provided; {df_filtered[(df_filtered[feature] < xlim[0]) | (df_filtered[feature] > xlim[1])].shape[0]} allels will be removed.")
        df_filtered = df_filtered[(df_filtered[feature] > xlim[0]) & (df_filtered[feature] < xlim[1])]
    
    if paths: cc = ["firebrick", "lightcoral"]
    else: cc = ["darkgreen", "g"]

    sns.distplot(df_filtered[feature], color="grey", kde=False, ax=ax1)
    
    sns.distplot(df_filtered[(df_filtered["CPD"] == "CPD")][feature], 
                color=cc[0], label="CPD", kde=False, ax=ax2)
    sns.distplot(df_filtered[(df_filtered["CPD"] == "non-CPD")][feature], 
                color=cc[1], label="non-CPD", kde=False, ax=ax2)
        
    if kde:
        sns.kdeplot(df_filtered[(df_filtered["CPD"] == "CPD")][feature], 
                    color=cc[0], label="CPD", ax=ax3, cut=1, shade=True)
        sns.kdeplot(df_filtered[(df_filtered["CPD"] == "non-CPD")][feature], 
                    color=cc[1], label="non-CPD", ax=ax3, cut=1, shade=True)

        if boxplot:
            sns.boxplot(data=df_filtered, x=feature, y="CPD", color="CPD",
                        orient="h", ax=ax4, linewidth=2, palette={"CPD": cc[0], "non-CPD": cc[1]}, 
                        order=["CPD", "non-CPD"])
    else:
        if boxplot:
            sns.boxplot(data=df_filtered, x=feature, y="CPD", color="CPD",
                        orient="h", ax=ax3, linewidth=2, palette={"CPD": cc[0], "non-CPD": cc[1]}, 
                        order=["CPD", "non-CPD"])
        
    ax1.set_xlabel('')
    ax2.set_xlabel("")
    if kde: 
        if boxplot:
            ax3.set_xlabel("")
            ax4.set_xlabel(f"{feature}")
    else: 
        if boxplot:
            ax3.set_xlabel(f"{feature}")
            
    ax1.set_ylabel('counts')
    ax2.set_ylabel('counts')
    if kde: 
        ax3.set_ylabel('density')
        if boxplot: ax4.set_ylabel("")
    else: 
        if boxplot: ax3.set_ylabel("")

    ax2.legend(loc="best")
    if kde: ax3.legend(loc="best")

    if xlim: plt.xlim(xlim[0], xlim[1])
        
    if savepath: 
        plt.savefig(f"{savepath}/{feature}.png", bbox_inches='tight')
        plt.close()
    else: plt.show();
        
    
def plot_counts_CPD(df, 
                    feature, 
                    savepath=None, 
                    paths=True,
                    remove_class=None,
                    verbose=False):
    """
    Plot feature distribution by ClinVar class.
    Args:
      df: a pandas dataframe. Should include a column "CV.SigShort".
      feature: a name of the feature to plot.
      savepath: a path to save the plot. (Default: None)
      remove_class: a specific class to remove from plot. (Default: None)
      verbose: whether to print log messages. (Default: False)
    Returns:
      nothing; plots 3 graphs.
    """
    sns.set(style="white", font_scale=1.5)
    _, axes = plt.subplots(1, 2, figsize=(20, 8))

    if verbose: print(f"{df[df[feature] == '?'].shape[0]} allels have undefined {feature} and will be removed")
    df_filtered = df[df[feature] != "?"]
    
    if verbose: 
        print(f"remove_VUS set to True; {df_filtered[df_filtered['CV.SigShort'] == 'VUS'].shape[0]} allels will be removed.")
    df_filtered = df_filtered[df_filtered["CV.SigShort"] != "VUS"]
    x_order = ["CPD", "non-CPD"]
    
    if remove_class:
        if verbose: 
            print(f"remove_class={remove_class} was passed to the function; \
              {df_filtered[df_filtered[feature] == remove_class].shape[0]} allels will be removed.")
        df_filtered = df_filtered[df_filtered[feature] != remove_class]
    
    features = np.unique(df_filtered[feature])
    col_legend = {features[i] : sns.color_palette("Set3")[i] for i in range(len(features))}
    
    sns.countplot(x="CPD", 
                  data=df_filtered,
                  hue=feature, 
                  palette=col_legend, 
                  hue_order = features,
                  order=x_order,
                  ax=axes[0])    

    prop_df = (df_filtered[feature]
               .groupby(df_filtered["CPD"])
               .value_counts(normalize=True)
               .rename("Frequency")
               .reset_index())

    sns.barplot(x="CPD", 
                y="Frequency", 
                data=prop_df,
                hue=feature, 
                palette=col_legend,
                hue_order = features,
                order=x_order,
                ax=axes[1])
              
    axes[0].set_ylabel(f'{feature} counts')
    axes[1].set_ylabel(f'{feature} frequency (within CPD class)')
    axes[0].legend_.remove()
              
    plt.legend(bbox_to_anchor=(1., 1.), loc='upper left', title=feature)

    if savepath: 
        plt.savefig(f"{savepath}/{feature}.png", bbox_inches='tight')
        plt.close()
    else: plt.show();
    
    
def plot_integers_CPD(df, 
                      feature, 
                      savepath=None, 
                      paths=True,
                      verbose=False):
    """
    Plot feature distribution by ClinVar class.
    Args:
      df: a pandas dataframe. Should include a column "CV.SigShort".
      feature: a name of the feature to plot.
      savepath: a path to save the plot. (Default: None)
      verbose: whether to print log messages. (Default: False)
    Returns:
      nothing; plots 3 graphs.
    """
    sns.set(style="white", font_scale=1.5)
    _, axes = plt.subplots(1, 2, figsize=(20, 8))

    if verbose: print(f"{df[df[feature] == '?'].shape[0]} allels have undefined {feature} and will be removed")
    df_filtered = df[df[feature] != "?"]
        
    if verbose: 
        print(f"remove_VUS set to True; {df_filtered[df_filtered['CV.SigShort'] == 'VUS'].shape[0]} allels will be removed.")
    df_filtered = df_filtered[df_filtered["CV.SigShort"] != "VUS"]
    
    df_filtered[feature] = df_filtered[feature].astype("int32")
    
    if paths: cc = ["firebrick", "lightcoral"]
    else: cc = ["darkgreen", "g"]
        
    sns.countplot(x=feature, 
                  data=df_filtered,
                  hue="CPD", 
                  palette={"CPD": cc[0], "non-CPD": cc[1]}, 
                  ax=axes[0])

    prop_df = (df_filtered[feature]
               .groupby(df_filtered["CPD"])
               .value_counts(normalize=True)
               .rename("Frequency")
               .reset_index())

    sns.barplot(x=feature, 
                y="Frequency", 
                data=prop_df,
                hue="CPD", 
                palette={"CPD": cc[0], "non-CPD": cc[1]}, 
                ax=axes[1])

    axes[0].set_ylabel(f'{feature} counts')
    axes[1].set_ylabel(f'{feature} frequency')
    axes[0].legend_.remove()
    
    plt.legend(bbox_to_anchor=(1., 1.), loc='upper left', title="CPD")

    if savepath: 
        plt.savefig(f"{savepath}/{feature}.png", bbox_inches='tight')
        plt.close()
        
    else: plt.show();
        
        
def plot_dist_random(df, 
                     feature,
                     xlim=None, 
                     savepath=None, 
                     verbose=False):
    """
    Plot feature distribution by ClinVar class.
    Args:
      df: a pandas dataframe. Should include a column "CV.SigShort".
      feature: a name of the feature to plot.
      xlim: a tuple (x_min, x_max). (Default: None)
      kde: whether to plot distribution. (Default: True)
      boxplot: whether to show boxplots. (Default: True)
      savepath: a path to save the plot. (Default: None)
      verbose: whether to print log messages. (Default: False)
    Returns:
      nothing; plots 3 graphs.
    """
    sns.set(style="white", font_scale=1.3)
    fig, (ax1, ax2, ax3, ax4) = plt.subplots(4, sharex=True, figsize=(15, 10),
                                             gridspec_kw={'height_ratios': [3, 3, 3, 3]})
    
    if verbose: print(f"{df[df[feature] == '?'].shape[0]} allels have undefined {feature} and will be removed.")
    df_filtered = df[df[feature] != "?"]
    df_filtered[feature] = pd.to_numeric(df_filtered[feature])
    
    if xlim:
        if verbose: 
            print(f"xlim argument provided; {df_filtered[(df_filtered[feature] < xlim[0]) | (df_filtered[feature] > xlim[1])].shape[0]} allels will be removed.")
        df_filtered = df_filtered[(df_filtered[feature] > xlim[0]) & (df_filtered[feature] < xlim[1])]
    
    classes = ["Core", "Surface", "Protein_interaction", "Other_interactions"]
    col_legend = {"Core": "darkorange", 
                  "Surface": "dodgerblue", 
                  "Protein_interaction": "forestgreen", 
                  "Other_interactions": "crimson"}
    
    sns.distplot(df_filtered[feature], color="grey", kde=False, ax=ax1)
    
    sns.histplot(data=df_filtered, x=feature, hue="SimpleClassRIN", stat="count", palette=col_legend, ax=ax2)
        
    sns.kdeplot(data=df_filtered, x=feature, hue="SimpleClassRIN", palette=col_legend, ax=ax3, cut=1, shade=True)
    
    sns.boxplot(data=df_filtered, x=feature, y="SimpleClassRIN", color="SimpleClassRIN",
                orient="h", ax=ax4, linewidth=2, palette=col_legend,
                order=classes)
        
    ax1.set_xlabel('')
    ax2.set_xlabel("")
    ax3.set_xlabel("")
    ax4.set_xlabel(f"{feature}")
            
    ax1.set_ylabel('counts')
    ax2.set_ylabel('counts')
    ax3.set_ylabel('density')
    ax4.set_ylabel("")

    if xlim: plt.xlim(xlim[0], xlim[1])
        
    if savepath: 
        plt.savefig(f"{savepath}/{feature}.png", bbox_inches='tight')
        plt.close()
    else: plt.show();
        
    
def plot_counts_random(df,
                       feature, 
                       savepath=None,
                       remove_class=None,
                       verbose=False):
    """
    Plot feature distribution by ClinVar class.
    Args:
      df: a pandas dataframe. Should include a column "CV.SigShort".
      feature: a name of the feature to plot.
      savepath: a path to save the plot. (Default: None)
      remove_class: a specific class to remove from plot. (Default: None)
      verbose: whether to print log messages. (Default: False)
    Returns:
      nothing; plots 3 graphs.
    """
    if verbose: print(f"{df[df[feature] == '?'].shape[0]} allels have undefined {feature} and will be removed")
    df_filtered = df[df[feature] != "?"]
    
    if remove_class:
        if verbose: 
            print(f"remove_class={remove_class} was passed to the function; \
              {df_filtered[df_filtered[feature] == remove_class].shape[0]} allels will be removed.")
        df_filtered = df_filtered[df_filtered[feature] != remove_class]
    
    classes = ["Core", "Surface", "Protein_interaction", "Other_interactions"]
    features = np.unique(df_filtered[feature])
    col_legend = {features[i] : sns.color_palette("Set3")[i] for i in range(len(features))}
    
    sns.set(style="white", font_scale=1.5)
    _, axes = plt.subplots(1, 2, figsize=(30, 8))
    
    sns.countplot(x="SimpleClassRIN", 
                  data=df_filtered,
                  hue=feature, 
                  palette=col_legend, 
                  hue_order = features,
                  order=classes,
                  ax=axes[0])    

    prop_df = (df_filtered[feature]
               .groupby(df_filtered["SimpleClassRIN"])
               .value_counts(normalize=True)
               .rename("Frequency")
               .reset_index())

    sns.barplot(x="SimpleClassRIN", 
                y="Frequency", 
                data=prop_df,
                hue=feature, 
                palette=col_legend,
                hue_order = features,
                order=classes,
                ax=axes[1])
              
    axes[0].set_ylabel(f'{feature} counts')
    axes[1].set_ylabel(f'{feature} frequency (within class)')
    axes[0].legend_.remove()
              
    plt.legend(bbox_to_anchor=(1., 1.), loc='upper left', title=feature)

    if savepath: 
        plt.savefig(f"{savepath}/{feature}.png", bbox_inches='tight')
        plt.close()
    else: plt.show();
    
    
def plot_integers_random(df, 
                         feature, 
                         savepath=None, 
                         verbose=False):
    """
    Plot feature distribution by ClinVar class.
    Args:
      df: a pandas dataframe. Should include a column "CV.SigShort".
      feature: a name of the feature to plot.
      savepath: a path to save the plot. (Default: None)
      verbose: whether to print log messages. (Default: False)
    Returns:
      nothing; plots 3 graphs.
    """
    sns.set(style="white", font_scale=1.5)
    _, axes = plt.subplots(1, 2, figsize=(20, 8))

    if verbose: print(f"{df[df[feature] == '?'].shape[0]} allels have undefined {feature} and will be removed")
    df_filtered = df[df[feature] != "?"]
            
    df_filtered[feature] = df_filtered[feature].astype("int32")
    
    classes = ["Core", "Surface", "Protein_interaction", "Other_interactions"]
    col_legend = {"Core": "darkorange", 
                  "Surface": "dodgerblue", 
                  "Protein_interaction": "forestgreen", 
                  "Other_interactions": "crimson"}    
        
    sns.countplot(x=feature, 
                  data=df_filtered,
                  hue="SimpleClassRIN", 
                  palette=col_legend, 
                  ax=axes[0])

    prop_df = (df_filtered[feature]
               .groupby(df_filtered["SimpleClassRIN"])
               .value_counts(normalize=True)
               .rename("Frequency")
               .reset_index())

    sns.barplot(x=feature, 
                y="Frequency", 
                data=prop_df,
                hue="SimpleClassRIN", 
                palette=col_legend, 
                ax=axes[1])

    axes[0].set_ylabel(f'{feature} counts')
    axes[1].set_ylabel(f'{feature} frequency')
    axes[0].legend_.remove()
    
    plt.legend(bbox_to_anchor=(1., 1.), loc='upper left', title="SimpleClassRIN")

    if savepath: 
        plt.savefig(f"{savepath}/{feature}.png", bbox_inches='tight')
        plt.close()
        
    else: plt.show();