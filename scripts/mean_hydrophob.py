#!/usr/bin/env python3

import sys
import pandas as pd
import numpy as np

matrix, type = sys.argv[1:3] 
aa_list = sys.argv[3:]

aa_code = {'I': 'Ile', 'V': 'Val', 'L': 'Leu', 'F': 'Phe',
           'C': 'Cys', 'M': 'Met', 'A': 'Ala', 'G': 'Gly',
           'T': 'Thr', 'S': 'Ser', 'W': 'Trp', 'Y': 'Tyr',
           'P': 'Pro', 'H': 'His', 'E': 'Glu', 'Q': 'Gln',
           'D': 'Asp', 'N': 'Asn', 'K': 'Lys', 'R': 'Arg'}

aa_list = [aa_code[aa.upper()] if len(aa) == 1 else aa.capitalize() for aa in aa_list]

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

else: print('Wrong hydrophobicity type. Execution aborted.')

print(np.round(res,3))