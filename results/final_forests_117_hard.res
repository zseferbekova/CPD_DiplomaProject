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

Best score: 0.60
Best parameter: 2

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		759(55.69%)	604(44.31%)
1		226(3.14%)	6968(96.86%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		618(78.63%)	168(21.37%)
1		119(22.62%)	407(77.38%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		141(24.44%)	436(75.56%)
1		107(1.60%)	6561(98.40%)

{'Accuracy': 0.9030033890382143, 'MCC': 0.6024719407298648, 'F1': 0.9437897873493161, 'Precision': 0.9202324352879028, 'Recall': 0.9685849318876841, 'ROC-AUC': 0.8876581242500323, 'PR-AUC': 0.9681171012735557}

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		176(54.32%)	148(45.68%)
1		36(2.18%)	1614(97.82%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		143(76.47%)	44(23.53%)
1		19(11.80%)	142(88.20%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		33(24.09%)	104(75.91%)
1		17(1.14%)	1472(98.86%)

{'Accuracy': 0.9067882472137792, 'MCC': 0.6237458996486431, 'F1': 0.9460726846424384, 'Precision': 0.9160045402951191, 'Recall': 0.9781818181818182, 'ROC-AUC': 0.9002338196782642, 'PR-AUC': 0.9718522128977538}

#--------------------------------------------------
# FOREST ON PHYLOGENETIC FEATURES
#--------------------------------------------------
Best score: 0.55
Best parameter: 2

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		715(52.46%)	648(47.54%)
1		297(4.13%)	6897(95.87%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		585(74.43%)	201(25.57%)
1		132(25.10%)	394(74.90%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		130(22.53%)	447(77.47%)
1		165(2.47%)	6503(97.53%)

{'Accuracy': 0.8895640995676055, 'MCC': 0.5476769077575849, 'F1': 0.9358843883574192, 'Precision': 0.9141153081510934, 'Recall': 0.9587155963302753, 'ROC-AUC': 0.8527422889091363, 'PR-AUC': 0.9560389777308292}

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		171(52.78%)	153(47.22%)
1		51(3.09%)	1599(96.91%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		137(73.26%)	50(26.74%)
1		21(13.04%)	140(86.96%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		34(24.82%)	103(75.18%)
1		30(2.01%)	1459(97.99%)

{'Accuracy': 0.8966565349544073, 'MCC': 0.582522315346604, 'F1': 0.9400352733686068, 'Precision': 0.9126712328767124, 'Recall': 0.9690909090909091, 'ROC-AUC': 0.8697895622895623, 'PR-AUC': 0.9591876921026548}

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
Best score: 0.37
Best parameter: 7

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		478(35.07%)	885(64.93%)
1		367(5.10%)	6827(94.90%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		333(42.37%)	453(57.63%)
1		64(12.17%)	462(87.83%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		145(25.13%)	432(74.87%)
1		303(4.54%)	6365(95.46%)

{'Accuracy': 0.8536870398504148, 'MCC': 0.3676057629600404, 'F1': 0.9160069770562189, 'Precision': 0.8852437759336099, 'Recall': 0.948985265499027, 'ROC-AUC': 0.8056527296836384, 'PR-AUC': 0.946139474687067}

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		103(31.79%)	221(68.21%)
1		100(6.06%)	1550(93.94%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		71(37.97%)	116(62.03%)
1		18(11.18%)	143(88.82%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		32(23.36%)	105(76.64%)
1		82(5.51%)	1407(94.49%)

{'Accuracy': 0.837386018237082, 'MCC': 0.31375367250699604, 'F1': 0.9061677871967262, 'Precision': 0.8752117447769622, 'Recall': 0.9393939393939394, 'ROC-AUC': 0.8041591844369622, 'PR-AUC': 0.9503512394558074}