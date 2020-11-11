#!/usr/bin/env python3

import sys
import pandas as pd
import numpy as np

matrix, type, aa1, aa2 = sys.argv[1:]

aa_code = {'I': 'Ile', 'V': 'Val', 'L': 'Leu', 'F': 'Phe',
           'C': 'Cys', 'M': 'Met', 'A': 'Ala', 'G': 'Gly',
           'T': 'Thr', 'S': 'Ser', 'W': 'Trp', 'Y': 'Tyr',
           'P': 'Pro', 'H': 'His', 'E': 'Glu', 'Q': 'Gln',
           'D': 'Asp', 'N': 'Asn', 'K': 'Lys', 'R': 'Arg'}

if len(aa1) == 1: aa1 = aa_code[aa1.upper()]
else: aa1 = aa1.capitalize()

if len(aa2) == 1: aa2 = aa_code[aa2.upper()]
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

else: print('Wrong hydrophobicity type. Execution aborted.')

print(res)
