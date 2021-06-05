заираImporting data...
216255 ClinVar variants before filtering.
50968 ClinVar variants after removal of 'VUS'.
50798 ClinVar variants after removal of 'Drug response'.
50798 variants after removal of '?' in 'NumAA2in117'.

 #   Column          Non-Null Count  Dtype  
---  ------          --------------  -----  
 0   PhyloP          50798 non-null  float64
 1   SPOTD.Info      50565 non-null  float64
 2   PPH.dScore      50797 non-null  float64
 3   Grantham        50798 non-null  int64  
 4   DSSP.NormASA    24631 non-null  float64
 5   B.Zscore        24631 non-null  float64
 6   IntCont         26428 non-null  float64
 7   AveSeqDist      26428 non-null  float64
 8   FoldXddG        24420 non-null  float64
 9   SimpleClassRIN  50798 non-null  object 
 10  CV.SigShort     50798 non-null  object 

Missing values:
PhyloP                0
SPOTD.Info          233
PPH.dScore            1
Grantham              0
DSSP.NormASA      26167
B.Zscore          26167
IntCont           24370
AveSeqDist        24370
FoldXddG          26378
SimpleClassRIN        0
CV.SigShort           0
dtype: int64

Structural classes:
None                   18705
Core                   10551
Protein_interaction     8609
Surface                 8562
Other_interactions      4349
Disorder                  22

Importing data...
190488 random variants before filtering.

 #   Column        Non-Null Count   Dtype  
---  ------        --------------   -----  
 0   DSSP.NormASA  190482 non-null  float64
 1   B.Zscore      190482 non-null  float64
 2   IntCont       187818 non-null  float64
 3   AveSeqDist    187818 non-null  float64
 4   FoldXddG      190452 non-null  float64
 5   Grantham      190488 non-null  int64  

Missing values:
DSSP.NormASA       6
B.Zscore           6
IntCont         2670
AveSeqDist      2670
FoldXddG          36
Grantham           0

NaN values:
AA1                   0
Acc                   0
CPD                   0
PhyloP                0
SPOTD.Info          233
PPH.dScore            1
Grantham          25342
DSSP.NormASA      26324
B.Zscore          26324
IntCont           26292
AveSeqDist        26292
FoldXddG          40195
SimpleClassRIN        0
CV.SigShort           0
dtype: int64

Number of variants in df with selected features: 50798.

NaN values (after imputation):
Acc                 0
CPD                 0
PhyloP              0
SPOTD.Info        233
PPH.dScore          1
Grantham            0
DSSP.NormASA        0
B.Zscore            0
IntCont             0
AveSeqDist          0
FoldXddG            0
SimpleClassRIN      0
CV.SigShort         0
dtype: int64

Structural classes:
None                   18727
Core                   10551
Protein_interaction     8609
Surface                 8562
Other_interactions      4349

Clinical significance classes:
Pathogenic    31886
Benign        18912

CD classes:
0    36424
1    14374
Name: CPD, dtype: int64

CD & ClinVar classes:
CV.SigShort  CPD
Benign       1      11681
             0       7231
Pathogenic   0      29193
             1       2693

#--------------------------------------------------
# FOREST ON 10 FEATURES
#--------------------------------------------------

Best score: 0.69
Best parameter: 2

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		12107(78.31%)	3354(21.69%)
1		2620(10.02%)	23532(89.98%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8860(92.84%)	683(7.16%)
1		974(44.99%)	1191(55.01%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		3247(54.87%)	2671(45.13%)
1		1646(6.86%)	22341(93.14%)

{'Accuracy': 0.8564390935524956, 'MCC': 0.6900771409147621, 'F1': 0.887363776914665, 'Precision': 0.875251060031243, 'Recall': 0.8998164576323034, 'ROC-AUC': 0.9159233510088607, 'PR-AUC': 0.9398863860652187}

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2716(78.70%)	735(21.30%)
1		576(10.05%)	5158(89.95%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1985(92.84%)	153(7.16%)
1		216(40.91%)	312(59.09%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		731(55.67%)	582(44.33%)
1		360(6.92%)	4846(93.08%)

{'Accuracy': 0.857267283614589, 'MCC': 0.6934014352205812, 'F1': 0.8872452051259999, 'Precision': 0.8752757508908875, 'Recall': 0.8995465643529822, 'ROC-AUC': 0.9190423111260067, 'PR-AUC': 0.94139922593523}

#--------------------------------------------------
# FOREST ON PHYLOGENETIC FEATURES
#--------------------------------------------------
Best score: 0.63
Best parameter: 1

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11444(74.02%)	4017(25.98%)
1		2999(11.47%)	23153(88.53%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8683(90.99%)	860(9.01%)
1		1034(47.76%)	1131(52.24%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2761(46.65%)	3157(53.35%)
1		1965(8.19%)	22022(91.81%)

{'Accuracy': 0.8313988417081201, 'MCC': 0.6349381880950562, 'F1': 0.8684220396834328, 'Precision': 0.8521531100478469, 'Recall': 0.8853242581829306, 'ROC-AUC': 0.8859433669326441, 'PR-AUC': 0.914096194944456}

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2609(75.60%)	842(24.40%)
1		665(11.60%)	5069(88.40%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1953(91.35%)	185(8.65%)
1		227(42.99%)	301(57.01%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		656(49.96%)	657(50.04%)
1		438(8.41%)	4768(91.59%)

{'Accuracy': 0.8359281437125748, 'MCC': 0.6471980102756565, 'F1': 0.8705882352941178, 'Precision': 0.8575537134156657, 'Recall': 0.8840251133589118, 'ROC-AUC': 0.8978294154942325, 'PR-AUC': 0.9241715798251111}

#--------------------------------------------------
# FOREST ON STRUCTURAL FEATURES
#--------------------------------------------------
Best score: 0.49
Best parameter: 2

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		10279(66.48%)	5182(33.52%)
1		4749(18.16%)	21403(81.84%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		6628(69.45%)	2915(30.55%)
1		729(33.67%)	1436(66.33%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		3651(61.69%)	2267(38.31%)
1		4020(16.76%)	19967(83.24%)

{'Accuracy': 0.7613486170187201, 'MCC': 0.48614617535904214, 'F1': 0.8116881885583176, 'Precision': 0.8050780515328193, 'Recall': 0.8184077699602325, 'ROC-AUC': 0.8225521479072981, 'PR-AUC': 0.8861297575164572}

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2255(65.34%)	1196(34.66%)
1		1077(18.78%)	4657(81.22%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1465(68.52%)	673(31.48%)
1		187(35.42%)	341(64.58%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		790(60.17%)	523(39.83%)
1		890(17.10%)	4316(82.90%)

{'Accuracy': 0.752531301034295, 'MCC': 0.46900651006538313, 'F1': 0.8038318805557952, 'Precision': 0.7956603451221596, 'Recall': 0.8121730031391698, 'ROC-AUC': 0.8198256582740863, 'PR-AUC': 0.8843240956845542}