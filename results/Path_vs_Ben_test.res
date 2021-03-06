Importing data...
216255 random variants.
216255 ClinVar variants before filtering.
216085 ClinVar variants after removal of 'Drug response'.
216045 ClinVar variants after removal of 'Disorder' str class.
50776 ClinVar variants after removal of 'VUS'.
1 random variant has FoldXddG > 500 and will be removed.
190438 random variants after removal of 'Disorder' str class.

PROCESSING NUMERIC FEATURES...

------------------------------------------------------------------------------------------------------------------------------------
                | Observations           | Median                 | MW                              | ROC-AUC
Feature         | Ben     Path    Rand   | Ben     Path    Rand   | BvsP       BvsR       PvsR      | AUC,%   TPR,%   FPR,%   THR,%
----------------+------------------------+------------------------+---------------------------------+-------------------------------
PhyloP          | 18911   31865   -      | 1.743   7.55    -      | 0.00e+00   -          -         | 83.21   73.13   19.99   5.05
SPOTD.Info      | 18814   31729   -      | 0.4     1.33    -      | 0.00e+00   -          -         | 81.63   69.59   19.94   0.84
PPH.dScore      | 18910   31865   -      | 0.831   2.275   -      | 0.00e+00   -          -         | 83.48   71.52   19.97   1.85
SubDiffKDHydro  | 18911   31865   190438 | 0.3     0.0     0.0    | 6.83e-61   1.84e-93   7.65e-01  | 54.35   12.41   16.35   3.7
Grantham        | 18911   31865   190438 | 58.0    94.0    81.0   | 0.00e+00   0.00e+00   2.51e-111 | 65.02   40.88   19.37   99
Blosum62        | 18911   31865   190438 | 0.0     -1.0    -1.0   | 0.00e+00   0.00e+00   9.76e-148 | 66.18   13.75   4.76    2
SPOTD.CN        | 4510    20828   -      | 36.9    43.3    -      | 7.28e-246  -          -         | 65.87   38.0    19.84   46.1
SPOTD.HSEu      | 4510    20828   -      | 15.7    20.8    -      | 2.62e-259  -          -         | 66.3    35.78   19.67   22.8
SPOTD.HSEd      | 4510    20828   -      | 21.7    23.2    -      | 1.38e-66   -          -         | 58.15   27.2    19.4    25.9
SPOTD.ASA       | 4510    20828   -      | 59.7    38.5    -      | 5.05e-171  -          -         | 63.21   36.25   19.98   75.6
DSSP.NormASA    | 4300    20174   190432 | 0.345   0.104   0.232  | 0.00e+00   2.03e-67   0.00e+00  | 69.73   48.49   19.99   0.36
AveSeqDist      | 4305    20201   187769 | 12.2    18.1    16.1   | 5.98e-86   3.83e-50   3.78e-48  | 59.5    30.1    19.86   32.9
IntCont         | 4305    20201   187769 | 9.0     11.0    12.0   | 5.51e-227  0.00e+00   2.14e-80  | 65.52   35.47   16.24   13
B.Mean          | 4300    20174   190432 | 54.76   45.56   36.24  | 4.19e-32   1.92e-230  0.00e+00  | 55.69   25.86   20.0    91.59
B.Zscore        | 4300    20174   190432 | -0.02   -0.39   -0.11  | 2.38e-138  2.04e-26   0.00e+00  | 62.13   35.42   19.87   0.33
dProp           | 4300    20174   190432 | -0.11   -0.03   0.0    | 2.13e-18   1.94e-44   1.82e-09  | 54.2    35.16   19.95   0.3
dVol            | 4300    20174   190432 | 4.0     4.0     -1.0   | 1.87e-01   4.96e-16   7.88e-49  | 50.43   31.05   19.91   39
SPOTD.PDisorder | 4510    20828   -      | 0.06    0.04    -      | 5.90e-66   -          -         | 58.07   30.6    19.69   0.11
SPOTD.PCoil     | 4510    20828   -      | 0.43    0.37    -      | 6.12e-09   -          -         | 52.7    28.36   19.78   0.79
SPOTD.PSheet    | 4510    20828   -      | 0.04    0.07    -      | 1.00e-13   -          -         | 53.47   20.18   19.89   0.45
SPOTD.PHelix    | 4510    20828   -      | 0.1     0.18    -      | 9.32e-14   -          -         | 53.48   19.92   19.91   0.9
ExtCont         | 4305    20201   187769 | 0.0     0.0     0.0    | 2.13e-56   1.00e+00   1.00e+00  | 56.04   29.91   18.1    1
BiolHetCont     | 4305    20201   187769 | 0.0     0.0     0.0    | 7.16e-48   3.26e-12   1.00e+00  | 53.22   8.71    2.28    1
Hb.Tot          | 4300    20174   190432 | 0.0     0.0     0.0    | 4.88e-57   1.95e-15   1.00e+00  | 56.36   18.24   8.65    2
Hb.Inter        | 4300    20174   190432 | 0.0     0.0     0.0    | 1.49e-13   1.00e+00   1.00e+00  | 51.42   6.22    3.4     1
Hb.Intra        | 4300    20174   190432 | 0.0     0.0     0.0    | 2.03e-49   1.69e-23   1.00e+00  | 55.72   15.34   7.3     2
Hb.IntraDist    | 4300    20174   190432 | 0.0     0.0     0.0    | 6.53e-62   3.74e-23   1.00e+00  | 55.58   21.69   10.86   1
Hb.SM           | 4300    20174   190432 | 0.0     0.0     0.0    | 4.46e-40   1.06e-12   1.00e+00  | 54.48   21.82   13.12   1
Hb.SS           | 4300    20174   190432 | 0.0     0.0     0.0    | 5.68e-37   1.97e-07   1.00e+00  | 54.27   21.37   13.16   1
PPH.PHAT        | 114     1334    -      | 1.0     -2.0    -      | 2.46e-20   -          -         | 75.62   32.46   9.75    2
MaestroddG      | 1707    8925    190438 | -0.072  0.041   0.047  | 1.71e-39   5.64e-41   8.79e-05  | 59.99   34.86   19.98   0.15
FoldXddG        | 1702    8901    190438 | 0.351   1.972   0.938  | 2.26e-181  1.31e-71   4.47e-230 | 71.91   58.44   19.98   1.35
------------------------------------------------------------------------------------------------------------------------------------

DONE.


PROCESSING CATEGORICAL FEATURES...

---------------------------------------------------------------------------------------------------------------
                    |               | Observations                            | Chi2 (one-vs-rest)
Feature             | Class         | Ben          Path          Rand         | BvsP       BvsR       PvsR
--------------------+---------------+-----------------------------------------+--------------------------------
PPH.Site            | CARBOHYD      | 12 (0.27)    27 (0.02)     -            | 1.89e-25   -          -
                    | CROSSLNK      | 0 (0.00)     6 (0.00)      -            | 3.95e-01   -          -
                    | DISULFID      | 3 (0.07)     974 (0.62)    -            | 7.43e-13   -          -
                    | LIPID         | 0 (0.00)     3 (0.00)      -            | 1.36e-01   -          -
                    | MOD_RES       | 18 (0.41)    114 (0.07)    -            | 6.83e-15   -          -
                    | SIGN_SITE     | 11 (0.25)    456 (0.29)    -            | 6.97e-01   -          -
PPH.Region          | COILED        | 55 (0.09)    215 (0.07)    -            | 2.19e-01   -          -
                    | COMPBIAS      | 32 (0.05)    119 (0.04)    -            | 2.59e-01   -          -
                    | INTRAMEM      | 11 (0.02)    193 (0.06)    -            | 4.72e-06   -          -
                    | PROPEP        | 47 (0.07)    52 (0.02)     -            | 4.28e-15   -          -
                    | REPEAT        | 358 (0.57)   1057 (0.35)   -            | 3.05e-23   -          -
                    | SIGNAL        | 13 (0.02)    14 (0.00)     -            | 7.38e-05   -          -
                    | TRANSMEM      | 114 (0.18)   1330 (0.45)   -            | 8.25e-35   -          -
SPOTD.SecStr        | C             | 2174 (0.48)  9153 (0.44)   -            | 2.01e-07   -          -
                    | E             | 883 (0.20)   4102 (0.20)   -            | 8.75e-01   -          -
                    | H             | 1453 (0.32)  7573 (0.36)   -            | 1.52e-07   -          -
DSSP.SecStr         | B             | 42 (0.01)    239 (0.01)    2061 (0.01)  | 4.44e-01   7.84e-01   2.18e-01
                    | E             | 789 (0.24)   3919 (0.24)   37030 (0.25) | 9.16e-01   7.73e-01   7.21e-01
                    | G             | 117 (0.04)   669 (0.04)    6663 (0.04)  | 1.52e-01   2.87e-02   1.49e-01
                    | H             | 1318 (0.41)  7072 (0.44)   65010 (0.43) | 3.18e-04   4.90e-03   1.92e-02
                    | I             | 29 (0.01)    175 (0.01)    1133 (0.01)  | 3.65e-01   4.09e-01   4.51e-06
                    | S             | 451 (0.14)   1976 (0.12)   17983 (0.12) | 1.41e-02   6.63e-04   1.51e-01
                    | T             | 490 (0.15)   1954 (0.12)   20533 (0.14) | 5.62e-06   1.57e-02   4.20e-07
SimpleClassRIN      | Core          | 1139 (0.25)  8029 (0.38)   51433 (0.27) | 5.13e-64   4.30e-03   2.96e-264
                    | Other         | 322 (0.07)   3650 (0.17)   27836 (0.15) | 7.50e-68   6.12e-46   9.98e-28
                    | PPI           | 716 (0.16)   5322 (0.25)   60864 (0.32) | 1.06e-43   9.65e-119  7.58e-83
                    | Surface       | 2362 (0.52)  3916 (0.19)   49523 (0.26) | 0.00e+00   0.00e+00   5.11e-117
---------------------------------------------------------------------------------------------------------------

-----------------------------------------------------
                    | Chi2 (all)
Feature             | BvsP       BvsR       PvsR
--------------------+--------------------------------
PPH.Site            | 7.08e-41   -          -
PPH.Region          | 2.99e-52   -          -
SPOTD.SecStr        | 7.10e-08   -          -
DSSP.SecStr         | 4.68e-06   2.35e-04   1.65e-09
SPOTD.PDisorder_bin | 1.07e-55   -          -
SPOTD.PCoil_bin     | 3.40e-14   -          -
SPOTD.PSheet_bin    | 3.11e-01   -          -
SPOTD.PHelix_bin    | 1.34e-05   -          -
SimpleClassRIN      | 0.00e+00   0.00e+00   0.00e+00
BiolHetCont_bin     | 2.42e-47   -          -
ExtCont_bin         | 1.76e-55   -          -
Hb.Inter_bin        | 5.80e-13   -          -
Hb.Intra_bin        | 6.25e-42   -          -
Hb.IntraDist_bin    | 9.99e-59   -          -
Hb.SM_bin           | 7.78e-38   -          -
Hb.SS_bin           | 2.75e-34   -          -
Hb.Tot_bin          | 1.99e-46   -          -
-----------------------------------------------------

DONE.

