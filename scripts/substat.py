#!/usr/bin/env python3

import pandas as pd
import numpy as np

aa_code = {'Ile': 'I', 'Val': 'V', 'Leu': 'L', 'Phe': 'F',
           'Cys': 'C', 'Met': 'M', 'Ala': 'A', 'Gly': 'G',
           'Thr': 'T', 'Ser': 'S', 'Trp': 'W', 'Tyr': 'Y',
           'Pro': 'P', 'His': 'H', 'Glu': 'E', 'Gln': 'Q',
           'Asp': 'D', 'Asn': 'N', 'Lys': 'K', 'Arg': 'R'}


inv_aa_code = {'I': 'Ile', 'V': 'Val', 'L': 'Leu', 'F': 'Phe',
           'C': 'Cys', 'M': 'Met', 'A': 'Ala', 'G': 'Gly',
           'T': 'Thr', 'S': 'Ser', 'W': 'Trp', 'Y': 'Tyr',
           'P': 'Pro', 'H': 'His', 'E': 'Glu', 'Q': 'Gln',
           'D': 'Asp', 'N': 'Asn', 'K': 'Lys', 'R': 'Arg'}


def calc_sub(matrix, aa1, aa2):
    '''This function reads a substitution 
    matrix and 2 AAs and returns the score'''

    if len(aa1) == 3: aa1 = aa_code[aa1.capitalize()]
    else: aa1 = aa1. upper()

    if len(aa2) == 3: aa2 = aa_code[aa2.capitalize()]
    else: aa2 = aa2.upper()

    df = pd.read_csv(matrix, sep = "\t")
    res = df[((df.aa1 == aa1) & (df.aa2 == aa2)) | ((df.aa1 == aa2) & (df.aa2 == aa1))].score.item()

    return res

def calc_hydro(matrix, type, aa):
    '''This function reads a hydrophobicity 
    matrix and an AA and returns the score'''

    if len(aa) == 1: aa = inv_aa_code[aa.upper()]
    else: aa = aa.capitalize()

    df = pd.read_csv(matrix, sep = "\t")

    if type.upper() == 'KD':
        res = df[df.Residue == aa].kdHydrophobicity.item() 

    elif type.upper() == 'WW':
        res = df[df.Residue == aa].wwHydrophobicity.item() 

    elif type.upper() == 'HH':
        res = df[df.Residue == aa].hhHydrophobicity.item() 

    elif type.upper() == 'MF':
        res = df[df.Residue == aa].mfHydrophobicity.item() 

    elif type.upper() == 'TT':
        res = df[df.Residue == aa].ttHydrophobicity.item() 

    else:  
        print('Wrong hydrophobicity type. Execution aborted.')
        res = None

    return res

def diff_hydro(matrix, type, aa1, aa2):
    '''This function takes matrix, score 
    type and 2 aa (wt first) and returns 
    the difference between the mutant and 
    wt aa'''

    if len(aa1) == 1: aa1 = inv_aa_code[aa1.upper()]
    else: aa1 = aa1.capitalize()

    if len(aa2) == 1: aa2 = inv_aa_code[aa2.upper()]
    else: aa2 = aa2.capitalize()

    df = pd.read_csv(matrix, sep = "\t")

    if type.upper() == 'KD':
        res = df[df.Residue == aa2].kdHydrophobicity.item() - df[df.Residue == aa1].kdHydrophobicity.item()

    elif type.upper() == 'WW':
        res = df[df.Residue == aa2].wwHydrophobicity.item() - df[df.Residue == aa1].wwHydrophobicity.item()

    elif type.upper() == 'HH':
        res = df[df.Residue == aa2].hhHydrophobicity.item() - df[df.Residue == aa1].hhHydrophobicity.item()

    elif type.upper() == 'MF':
        res = df[df.Residue == aa2].mfHydrophobicity.item() - df[df.Residue == aa1].mfHydrophobicity.item()

    elif type.upper() == 'TT':
        res = df[df.Residue == aa2].ttHydrophobicity.item() - df[df.Residue == aa1].ttHydrophobicity.item()

    else: 
        print('Wrong hydrophobicity type. Execution aborted.')
        res = None

    return res

def mean_hydro(matrix, type, aa_list):
    '''This function takes a matrix,
    score type and a list of AAs and
    returns the mean score'''

    aa_list = aa_list.split()
    aa_list = [inv_aa_code[aa.upper()] if len(aa) == 1 else aa.capitalize() for aa in aa_list]

    df = pd.read_csv(matrix, sep = "\t")

    if type.upper() == 'KD':
        res = np.mean([df[df.Residue == aa].kdHydrophobicity.item() for aa in aa_list])

    elif type.upper() == 'WW':
        res = np.mean([df[df.Residue == aa].wwHydrophobicity.item() for aa in aa_list])

    elif type.upper() == 'HH':
        res = np.mean([df[df.Residue == aa].hhHydrophobicity.item() for aa in aa_list])

    elif type.upper() == 'MF':
        res = np.mean([df[df.Residue == aa].mfHydrophobicity.item() for aa in aa_list])

    elif type.upper() == 'TT':
        res = np.mean([df[df.Residue == aa].ttHydrophobicity.item() for aa in aa_list])

    else: 
        print('Wrong hydrophobicity type. Execution aborted.')
        res = None

    return np.round(res,3)
