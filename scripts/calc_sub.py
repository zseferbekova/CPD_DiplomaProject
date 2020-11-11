#!/usr/bin/env python3

import sys
import pandas as pd

matrix, aa1, aa2 = sys.argv[1:]

aa_code = {'Ile': 'I', 'Val': 'V', 'Leu': 'L', 'Phe': 'F',
           'Cys': 'C', 'Met': 'M', 'Ala': 'A', 'Gly': 'G',
           'Thr': 'T', 'Ser': 'S', 'Trp': 'W', 'Tyr': 'Y',
           'Pro': 'P', 'His': 'H', 'Glu': 'E', 'Gln': 'Q',
           'Asp': 'D', 'Asn': 'N', 'Lys': 'K', 'Arg': 'R'}

if len(aa1) == 3: aa1 = aa_code[aa1.capitalize()]
else: aa1 = aa1.upper()

if len(aa2) == 3: aa2 = aa_code[aa2.capitalize()]
else: aa2 = aa2.upper()

df = pd.read_csv(matrix, sep = "\t")
res = df[((df.aa1 == aa1) & (df.aa2 == aa2)) | ((df.aa1 == aa2) & (df.aa2 == aa1))].score.item()

print(res)

