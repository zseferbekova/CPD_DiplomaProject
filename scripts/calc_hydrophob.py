#!/usr/bin/env python3

import sys
import pandas as pd
import numpy as np

matrix, type, aa = sys.argv[1:]

aa_code = {'I': 'Ile', 'V': 'Val', 'L': 'Leu', 'F': 'Phe',
           'C': 'Cys', 'M': 'Met', 'A': 'Ala', 'G': 'Gly',
           'T': 'Thr', 'S': 'Ser', 'W': 'Trp', 'Y': 'Tyr',
           'P': 'Pro', 'H': 'His', 'E': 'Glu', 'Q': 'Gln',
           'D': 'Asp', 'N': 'Asn', 'K': 'Lys', 'R': 'Arg'}

if len(aa) == 1: aa = aa_code[aa.upper()]
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

else: print('Wrong hydrophobicity type. Execution aborted.')

print(res)
