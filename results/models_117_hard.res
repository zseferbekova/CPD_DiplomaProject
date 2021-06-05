Importing data...
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

Number of variants in df with selected features: 10531.

NaN values:
Acc               0
CPD               0
PhyloP            0
SPOTD.Info        0
PPH.dScore        0
Grantham          0
DSSP.NormASA      0
B.Zscore          0
IntCont           0
AveSeqDist        0
FoldXddG          0
SimpleClassRIN    0
CV.SigShort       0

Structural classes:
Core                   4463
Surface                2522
Protein_interaction    1783
Other_interactions     1763

Clinical significance classes:
Pathogenic    8844
Benign        1687

CD classes:
0    8871
1    1660

CD & ClinVar classes:
CV.SigShort  CPD
Benign       1       973
             0       714
Pathogenic   0      8157
             1       687

#--------------------------------------------------
# FOREST ON 10 FEATURES
#--------------------------------------------------
-------------------------------- ROUND  0 --------------------------------

Best score for round 0: 0.60
Best parameter for round 0: 3

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		777(56.76%)	592(43.24%)
1		259(3.49%)	7162(96.51%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		630(78.26%)	175(21.74%)
1		140(25.00%)	420(75.00%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		147(26.06%)	417(73.94%)
1		119(1.73%)	6742(98.27%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		167(52.52%)	151(47.48%)
1		34(2.39%)	1389(97.61%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		133(79.17%)	35(20.83%)
1		14(11.02%)	113(88.98%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		34(22.67%)	116(77.33%)
1		20(1.54%)	1276(98.46%)

-------------------------------- ROUND  1 --------------------------------

Best score for round 1: 0.60
Best parameter for round 1: 10

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		766(58.43%)	545(41.57%)
1		259(3.88%)	6415(96.12%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		619(81.45%)	141(18.55%)
1		112(22.36%)	389(77.64%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		147(26.68%)	404(73.32%)
1		147(2.38%)	6026(97.62%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		222(59.04%)	154(40.96%)
1		103(4.75%)	2067(95.25%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		167(78.40%)	46(21.60%)
1		63(33.87%)	123(66.13%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		55(33.74%)	108(66.26%)
1		40(2.02%)	1944(97.98%)

-------------------------------- ROUND  2 --------------------------------

Best score for round 2: 0.60
Best parameter for round 2: 4

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		792(56.49%)	610(43.51%)
1		249(3.38%)	7111(96.62%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		643(79.28%)	168(20.72%)
1		140(23.49%)	456(76.51%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		149(25.21%)	442(74.79%)
1		109(1.61%)	6655(98.39%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		161(56.49%)	124(43.51%)
1		52(3.50%)	1432(96.50%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		129(79.63%)	33(20.37%)
1		24(26.37%)	67(73.63%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		32(26.02%)	91(73.98%)
1		28(2.01%)	1365(97.99%)

-------------------------------- ROUND  3 --------------------------------

Best score for round 3: 0.62
Best parameter for round 3: 3

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		789(58.06%)	570(41.94%)
1		229(3.44%)	6427(96.56%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		627(80.08%)	156(19.92%)
1		118(22.31%)	411(77.69%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		162(28.12%)	414(71.88%)
1		111(1.81%)	6016(98.19%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		191(58.23%)	137(41.77%)
1		83(3.79%)	2105(96.21%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		154(81.05%)	36(18.95%)
1		44(27.85%)	114(72.15%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		37(26.81%)	101(73.19%)
1		39(1.92%)	1991(98.08%)

-------------------------------- ROUND  4 --------------------------------

Best score for round 4: 0.60
Best parameter for round 4: 2

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		729(55.35%)	588(44.65%)
1		214(3.00%)	6917(97.00%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		578(76.56%)	177(23.44%)
1		113(20.11%)	449(79.89%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		151(26.87%)	411(73.13%)
1		101(1.54%)	6468(98.46%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		199(53.78%)	171(46.22%)
1		50(2.92%)	1663(97.08%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		169(77.52%)	49(22.48%)
1		26(20.80%)	99(79.20%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		30(19.74%)	122(80.26%)
1		24(1.51%)	1564(98.49%)

-------------------------------- ROUND  5 --------------------------------

Best score for round 5: 0.61
Best parameter for round 5: 2

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		783(56.66%)	599(43.34%)
1		222(3.41%)	6297(96.59%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		633(78.93%)	169(21.07%)
1		111(21.60%)	403(78.40%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		150(25.86%)	430(74.14%)
1		111(1.85%)	5894(98.15%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		182(59.67%)	123(40.33%)
1		92(3.96%)	2233(96.04%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		138(80.70%)	33(19.30%)
1		52(30.06%)	121(69.94%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		44(32.84%)	90(67.16%)
1		40(1.86%)	2112(98.14%)

-------------------------------- ROUND  6 --------------------------------

Best score for round 6: 0.60
Best parameter for round 6: 2

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		715(54.83%)	589(45.17%)
1		211(3.10%)	6585(96.90%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		568(76.65%)	173(23.35%)
1		113(20.93%)	427(79.07%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		147(26.11%)	416(73.89%)
1		98(1.57%)	6158(98.43%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		216(56.40%)	167(43.60%)
1		64(3.12%)	1984(96.88%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		177(76.29%)	55(23.71%)
1		33(22.45%)	114(77.55%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		39(25.83%)	112(74.17%)
1		31(1.63%)	1870(98.37%)

-------------------------------- ROUND  7 --------------------------------

Best score for round 7: 0.61
Best parameter for round 7: 3

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		729(56.38%)	564(43.62%)
1		216(3.10%)	6743(96.90%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		587(79.11%)	155(20.89%)
1		109(21.93%)	388(78.07%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		142(25.77%)	409(74.23%)
1		107(1.66%)	6355(98.34%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		220(55.84%)	174(44.16%)
1		72(3.82%)	1813(96.18%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		181(78.35%)	50(21.65%)
1		48(25.26%)	142(74.74%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		39(23.93%)	124(76.07%)
1		24(1.42%)	1671(98.58%)

-------------------------------- ROUND  8 --------------------------------

Best score for round 8: 0.62
Best parameter for round 8: 6

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		809(58.75%)	568(41.25%)
1		251(3.48%)	6956(96.52%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		646(79.75%)	164(20.25%)
1		137(23.34%)	450(76.66%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		163(28.75%)	404(71.25%)
1		114(1.72%)	6506(98.28%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		160(51.61%)	150(48.39%)
1		54(3.30%)	1583(96.70%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		122(74.85%)	41(25.15%)
1		26(26.00%)	74(74.00%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		38(25.85%)	109(74.15%)
1		28(1.82%)	1509(98.18%)

-------------------------------- ROUND  9 --------------------------------

Best score for round 9: 0.60
Best parameter for round 9: 2

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		673(55.53%)	539(44.47%)
1		202(3.13%)	6253(96.87%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		553(77.56%)	160(22.44%)
1		107(22.20%)	375(77.80%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		120(24.05%)	379(75.95%)
1		95(1.59%)	5878(98.41%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		261(54.95%)	214(45.05%)
1		78(3.26%)	2311(96.74%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		203(78.08%)	57(21.92%)
1		47(22.93%)	158(77.07%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		58(26.98%)	157(73.02%)
1		31(1.42%)	2153(98.58%)

------------------------------------ SUMMARY ------------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		55.85 ± 2.56%	44.15 ± 2.56%
1		3.48 ± 0.61%	96.52 ± 0.61%

Confusion matrix for CD:
TRUE\PRED	0		1
0		78.40 ± 1.80%	21.60 ± 1.80%
1		24.66 ± 5.81%	75.34 ± 5.81%

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		26.44 ± 4.01%	73.56 ± 4.01%
1		1.71 ± 0.23%	98.29 ± 0.23%

MCC on train = 0.605 ± 0.012.
MCC on test = 0.591 ± 0.025.
MCC on CDs (test) = 0.533 ± 0.025.
MCC on non-CDs (test) = 0.353 ± 0.025.

F1 on train = 0.943 ± 0.004.
F1 on test = 0.942 ± 0.011.
F1 on CDs (test) = 0.733 ± 0.011.
F1 on non-CDs (test) = 0.960 ± 0.011.

Precision on train = 0.921 ± 0.006.
Precision on test = 0.921 ± 0.027.
Precision on CDs (test) = 0.717 ± 0.027.
Precision on non-CDs (test) = 0.938 ± 0.027.

Recall on train = 0.967 ± 0.005.
Recall on test = 0.965 ± 0.012.
Recall on CDs (test) = 0.753 ± 0.012.
Recall on non-CDs (test) = 0.983 ± 0.012.

Accuracy on train = 0.902 ± 0.006.
Accuracy on test = 0.901 ± 0.016.
Accuracy on CDs (test) = 0.770 ± 0.016.
Accuracy on non-CDs (test) = 0.924 ± 0.016.

ROC-AUC on train = 0.889 ± 0.005.
ROC-AUC on test = 0.893 ± 0.026.
ROC-AUC on CDs (test) = 0.843 ± 0.026.
ROC-AUC on non-CDs (test) = 0.821 ± 0.026.

PR-AUC on train = 0.968 ± 0.004.
PR-AUC on test = 0.971 ± 0.012.
PR-AUC on CDs (test) = 0.821 ± 0.012.
PR-AUC on non-CDs (test) = 0.976 ± 0.012.

#--------------------------------------------------
# FOREST ON PHYLOGENETIC FEATURES
#--------------------------------------------------
-------------------------------- ROUND  0 --------------------------------

Best score for round 0: 0.56
Best parameter for round 0: 1

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		724(52.89%)	645(47.11%)
1		284(3.83%)	7137(96.17%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		604(75.03%)	201(24.97%)
1		139(24.82%)	421(75.18%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		120(21.28%)	444(78.72%)
1		145(2.11%)	6716(97.89%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		159(50.00%)	159(50.00%)
1		43(3.02%)	1380(96.98%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		128(76.19%)	40(23.81%)
1		17(13.39%)	110(86.61%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		31(20.67%)	119(79.33%)
1		26(2.01%)	1270(97.99%)

-------------------------------- ROUND  1 --------------------------------

Best score for round 1: 0.58
Best parameter for round 1: 1

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		736(56.14%)	575(43.86%)
1		266(3.99%)	6408(96.01%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		606(79.74%)	154(20.26%)
1		119(23.75%)	382(76.25%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		130(23.59%)	421(76.41%)
1		147(2.38%)	6026(97.62%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		210(55.85%)	166(44.15%)
1		133(6.13%)	2037(93.87%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		162(76.06%)	51(23.94%)
1		64(34.41%)	122(65.59%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		48(29.45%)	115(70.55%)
1		69(3.48%)	1915(96.52%)

-------------------------------- ROUND  2 --------------------------------

Best score for round 2: 0.55
Best parameter for round 2: 1

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		749(53.42%)	653(46.58%)
1		316(4.29%)	7044(95.71%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		612(75.46%)	199(24.54%)
1		147(24.66%)	449(75.34%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		137(23.18%)	454(76.82%)
1		169(2.50%)	6595(97.50%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		152(53.33%)	133(46.67%)
1		59(3.98%)	1425(96.02%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		124(76.54%)	38(23.46%)
1		21(23.08%)	70(76.92%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		28(22.76%)	95(77.24%)
1		38(2.73%)	1355(97.27%)

-------------------------------- ROUND  3 --------------------------------

Best score for round 3: 0.55
Best parameter for round 3: 3

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		737(54.23%)	622(45.77%)
1		312(4.69%)	6344(95.31%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		601(76.76%)	182(23.24%)
1		129(24.39%)	400(75.61%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		136(23.61%)	440(76.39%)
1		183(2.99%)	5944(97.01%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		186(56.71%)	142(43.29%)
1		112(5.12%)	2076(94.88%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		146(76.84%)	44(23.16%)
1		47(29.75%)	111(70.25%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		40(28.99%)	98(71.01%)
1		65(3.20%)	1965(96.80%)

-------------------------------- ROUND  4 --------------------------------

Best score for round 4: 0.56
Best parameter for round 4: 1

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		702(53.30%)	615(46.70%)
1		284(3.98%)	6847(96.02%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		573(75.89%)	182(24.11%)
1		140(24.91%)	422(75.09%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		129(22.95%)	433(77.05%)
1		144(2.19%)	6425(97.81%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		204(55.14%)	166(44.86%)
1		64(3.74%)	1649(96.26%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		171(78.44%)	47(21.56%)
1		23(18.40%)	102(81.60%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		33(21.71%)	119(78.29%)
1		41(2.58%)	1547(97.42%)

-------------------------------- ROUND  5 --------------------------------

Best score for round 5: 0.58
Best parameter for round 5: 1

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		774(56.01%)	608(43.99%)
1		268(4.11%)	6251(95.89%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		627(78.18%)	175(21.82%)
1		123(23.93%)	391(76.07%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		147(25.34%)	433(74.66%)
1		145(2.41%)	5860(97.59%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		165(54.10%)	140(45.90%)
1		142(6.11%)	2183(93.89%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		128(74.85%)	43(25.15%)
1		55(31.79%)	118(68.21%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		37(27.61%)	97(72.39%)
1		87(4.04%)	2065(95.96%)

-------------------------------- ROUND  6 --------------------------------

Best score for round 6: 0.56
Best parameter for round 6: 1

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		687(52.68%)	617(47.32%)
1		258(3.80%)	6538(96.20%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		561(75.71%)	180(24.29%)
1		122(22.59%)	418(77.41%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		126(22.38%)	437(77.62%)
1		136(2.17%)	6120(97.83%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		206(53.79%)	177(46.21%)
1		95(4.64%)	1953(95.36%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		171(73.71%)	61(26.29%)
1		36(24.49%)	111(75.51%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		35(23.18%)	116(76.82%)
1		59(3.10%)	1842(96.90%)

-------------------------------- ROUND  7 --------------------------------

Best score for round 7: 0.57
Best parameter for round 7: 1

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		693(53.60%)	600(46.40%)
1		257(3.69%)	6702(96.31%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		568(76.55%)	174(23.45%)
1		121(24.35%)	376(75.65%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		125(22.69%)	426(77.31%)
1		136(2.10%)	6326(97.90%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		207(52.54%)	187(47.46%)
1		82(4.35%)	1803(95.65%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		167(72.29%)	64(27.71%)
1		50(26.32%)	140(73.68%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		40(24.54%)	123(75.46%)
1		32(1.89%)	1663(98.11%)

-------------------------------- ROUND  8 --------------------------------

Best score for round 8: 0.58
Best parameter for round 8: 1

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		777(56.43%)	600(43.57%)
1		289(4.01%)	6918(95.99%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		635(78.40%)	175(21.60%)
1		140(23.85%)	447(76.15%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		142(25.04%)	425(74.96%)
1		149(2.25%)	6471(97.75%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		150(48.39%)	160(51.61%)
1		76(4.64%)	1561(95.36%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		120(73.62%)	43(26.38%)
1		23(23.00%)	77(77.00%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		30(20.41%)	117(79.59%)
1		53(3.45%)	1484(96.55%)

-------------------------------- ROUND  9 --------------------------------

Best score for round 9: 0.56
Best parameter for round 9: 1

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		643(53.05%)	569(46.95%)
1		251(3.89%)	6204(96.11%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		542(76.02%)	171(23.98%)
1		113(23.44%)	369(76.56%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		101(20.24%)	398(79.76%)
1		138(2.31%)	5835(97.69%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		242(50.95%)	233(49.05%)
1		97(4.06%)	2292(95.94%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		197(75.77%)	63(24.23%)
1		52(25.37%)	153(74.63%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		45(20.93%)	170(79.07%)
1		45(2.06%)	2139(97.94%)

------------------------------------ SUMMARY ------------------------------------

Confusion matrix for all:
TRUE\PRED	0		1
0		53.08 ± 2.51%	46.92 ± 2.51%
1		4.58 ± 0.94%	95.42 ± 0.94%

Confusion matrix for CD:
TRUE\PRED	0		1
0		75.43 ± 1.73%	24.57 ± 1.73%
1		25.00 ± 5.88%	75.00 ± 5.88%

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		24.02 ± 3.30%	75.98 ± 3.30%
1		2.85 ± 0.69%	97.15 ± 0.69%

MCC on train = 0.565 ± 0.025.
MCC on test = 0.538 ± 0.061.
MCC on CDs (test) = 0.498 ± 0.061.
MCC on non-CDs (test) = 0.276 ± 0.061.

F1 on train = 0.937 ± 0.005.
F1 on test = 0.934 ± 0.008.
F1 on CDs (test) = 0.717 ± 0.008.
F1 on non-CDs (test) = 0.953 ± 0.008.

Precision on train = 0.916 ± 0.006.
Precision on test = 0.916 ± 0.026.
Precision on CDs (test) = 0.690 ± 0.026.
Precision on non-CDs (test) = 0.935 ± 0.026.

Recall on train = 0.960 ± 0.005.
Recall on test = 0.954 ± 0.019.
Recall on CDs (test) = 0.750 ± 0.019.
Recall on non-CDs (test) = 0.971 ± 0.019.

Accuracy on train = 0.892 ± 0.007.
Accuracy on test = 0.887 ± 0.012.
Accuracy on CDs (test) = 0.751 ± 0.012.
Accuracy on non-CDs (test) = 0.912 ± 0.012.

ROC-AUC on train = 0.859 ± 0.007.
ROC-AUC on test = 0.855 ± 0.023.
ROC-AUC on CDs (test) = 0.817 ± 0.023.
ROC-AUC on non-CDs (test) = 0.754 ± 0.023.

PR-AUC on train = 0.957 ± 0.005.
PR-AUC on test = 0.958 ± 0.016.
PR-AUC on CDs (test) = 0.781 ± 0.016.
PR-AUC on non-CDs (test) = 0.964 ± 0.016.

#--------------------------------------------------
# FOREST ON STRUCTURAL FEATURES
#--------------------------------------------------
-------------------------------- ROUND  0 --------------------------------

Best score for round 0: 0.33
Best parameter for round 0: 5

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		438(31.99%)	931(68.01%)
1		384(5.17%)	7037(94.83%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		312(38.76%)	493(61.24%)
1		60(10.71%)	500(89.29%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		126(22.34%)	438(77.66%)
1		324(4.72%)	6537(95.28%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		98(30.82%)	220(69.18%)
1		63(4.43%)	1360(95.57%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		66(39.29%)	102(60.71%)
1		7(5.51%)	120(94.49%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		32(21.33%)	118(78.67%)
1		56(4.32%)	1240(95.68%)

-------------------------------- ROUND  1 --------------------------------

Best score for round 1: 0.33
Best parameter for round 1: 4

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		416(31.73%)	895(68.27%)
1		358(5.36%)	6316(94.64%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		284(37.37%)	476(62.63%)
1		53(10.58%)	448(89.42%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		132(23.96%)	419(76.04%)
1		305(4.94%)	5868(95.06%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		141(37.50%)	235(62.50%)
1		107(4.93%)	2063(95.07%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		103(48.36%)	110(51.64%)
1		21(11.29%)	165(88.71%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		38(23.31%)	125(76.69%)
1		86(4.33%)	1898(95.67%)

-------------------------------- ROUND  2 --------------------------------

Best score for round 2: 0.35
Best parameter for round 2: 6

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		470(33.52%)	932(66.48%)
1		382(5.19%)	6978(94.81%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		322(39.70%)	489(60.30%)
1		70(11.74%)	526(88.26%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		148(25.04%)	443(74.96%)
1		312(4.61%)	6452(95.39%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		105(36.84%)	180(63.16%)
1		91(6.13%)	1393(93.87%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		71(43.83%)	91(56.17%)
1		11(12.09%)	80(87.91%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		34(27.64%)	89(72.36%)
1		80(5.74%)	1313(94.26%)

-------------------------------- ROUND  3 --------------------------------

Best score for round 3: 0.38
Best parameter for round 3: 2

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		464(34.14%)	895(65.86%)
1		306(4.60%)	6350(95.40%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		329(42.02%)	454(57.98%)
1		56(10.59%)	473(89.41%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		135(23.44%)	441(76.56%)
1		250(4.08%)	5877(95.92%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		105(32.01%)	223(67.99%)
1		118(5.39%)	2070(94.61%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		69(36.32%)	121(63.68%)
1		20(12.66%)	138(87.34%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		36(26.09%)	102(73.91%)
1		98(4.83%)	1932(95.17%)

-------------------------------- ROUND  4 --------------------------------

Best score for round 4: 0.35
Best parameter for round 4: 3

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		422(32.04%)	895(67.96%)
1		329(4.61%)	6802(95.39%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		277(36.69%)	478(63.31%)
1		67(11.92%)	495(88.08%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		145(25.80%)	417(74.20%)
1		262(3.99%)	6307(96.01%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		101(27.30%)	269(72.70%)
1		79(4.61%)	1634(95.39%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		75(34.40%)	143(65.60%)
1		10(8.00%)	115(92.00%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		26(17.11%)	126(82.89%)
1		69(4.35%)	1519(95.65%)

-------------------------------- ROUND  5 --------------------------------

Best score for round 5: 0.36
Best parameter for round 5: 1

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		430(31.11%)	952(68.89%)
1		270(4.14%)	6249(95.86%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		302(37.66%)	500(62.34%)
1		48(9.34%)	466(90.66%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		128(22.07%)	452(77.93%)
1		222(3.70%)	5783(96.30%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		103(33.77%)	202(66.23%)
1		103(4.43%)	2222(95.57%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		68(39.77%)	103(60.23%)
1		21(12.14%)	152(87.86%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		35(26.12%)	99(73.88%)
1		82(3.81%)	2070(96.19%)

-------------------------------- ROUND  6 --------------------------------

Best score for round 6: 0.36
Best parameter for round 6: 7

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		457(35.05%)	847(64.95%)
1		362(5.33%)	6434(94.67%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		312(42.11%)	429(57.89%)
1		62(11.48%)	478(88.52%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		145(25.75%)	418(74.25%)
1		300(4.80%)	5956(95.20%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		121(31.59%)	262(68.41%)
1		111(5.42%)	1937(94.58%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		91(39.22%)	141(60.78%)
1		16(10.88%)	131(89.12%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		30(19.87%)	121(80.13%)
1		95(5.00%)	1806(95.00%)

-------------------------------- ROUND  7 --------------------------------

Best score for round 7: 0.35
Best parameter for round 7: 6

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		420(32.48%)	873(67.52%)
1		324(4.66%)	6635(95.34%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		283(38.14%)	459(61.86%)
1		49(9.86%)	448(90.14%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		137(24.86%)	414(75.14%)
1		275(4.26%)	6187(95.74%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		124(31.47%)	270(68.53%)
1		98(5.20%)	1787(94.80%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		89(38.53%)	142(61.47%)
1		23(12.11%)	167(87.89%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		35(21.47%)	128(78.53%)
1		75(4.42%)	1620(95.58%)

-------------------------------- ROUND  8 --------------------------------

Best score for round 8: 0.36
Best parameter for round 8: 2

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		427(31.01%)	950(68.99%)
1		296(4.11%)	6911(95.89%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		305(37.65%)	505(62.35%)
1		49(8.35%)	538(91.65%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		122(21.52%)	445(78.48%)
1		247(3.73%)	6373(96.27%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		88(28.39%)	222(71.61%)
1		57(3.48%)	1580(96.52%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		59(36.20%)	104(63.80%)
1		11(11.00%)	89(89.00%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		29(19.73%)	118(80.27%)
1		46(2.99%)	1491(97.01%)

-------------------------------- ROUND  9 --------------------------------

Best score for round 9: 0.35
Best parameter for round 9: 3

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		385(31.77%)	827(68.23%)
1		304(4.71%)	6151(95.29%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		269(37.73%)	444(62.27%)
1		47(9.75%)	435(90.25%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		116(23.25%)	383(76.75%)
1		257(4.30%)	5716(95.70%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		164(34.53%)	311(65.47%)
1		127(5.32%)	2262(94.68%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		107(41.15%)	153(58.85%)
1		25(12.20%)	180(87.80%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		57(26.51%)	158(73.49%)
1		102(4.67%)	2082(95.33%)

------------------------------------ SUMMARY ------------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		32.42 ± 3.14%	67.58 ± 3.14%
1		4.93 ± 0.69%	95.07 ± 0.69%

Confusion matrix for CD:
TRUE\PRED	0		1
0		39.71 ± 3.84%	60.29 ± 3.84%
1		10.79 ± 2.16%	89.21 ± 2.16%

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		22.92 ± 3.37%	77.08 ± 3.37%
1		4.45 ± 0.69%	95.55 ± 0.69%

MCC on train = 0.352 ± 0.026.
MCC on test = 0.344 ± 0.046.
MCC on CDs (test) = 0.319 ± 0.046.
MCC on non-CDs (test) = 0.212 ± 0.046.

F1 on train = 0.914 ± 0.005.
F1 on test = 0.915 ± 0.019.
F1 on CDs (test) = 0.656 ± 0.019.
F1 on non-CDs (test) = 0.944 ± 0.019.

Precision on train = 0.880 ± 0.010.
Precision on test = 0.883 ± 0.035.
Precision on CDs (test) = 0.521 ± 0.035.
Precision on non-CDs (test) = 0.934 ± 0.035.

Recall on train = 0.952 ± 0.009.
Recall on test = 0.951 ± 0.014.
Recall on CDs (test) = 0.892 ± 0.014.
Recall on non-CDs (test) = 0.956 ± 0.014.

Accuracy on train = 0.851 ± 0.008.
Accuracy on test = 0.852 ± 0.030.
Accuracy on CDs (test) = 0.606 ± 0.030.
Accuracy on non-CDs (test) = 0.897 ± 0.030.

ROC-AUC on train = 0.814 ± 0.012.
ROC-AUC on test = 0.817 ± 0.026.
ROC-AUC on CDs (test) = 0.766 ± 0.026.
ROC-AUC on non-CDs (test) = 0.776 ± 0.026.

PR-AUC on train = 0.951 ± 0.004.
PR-AUC on test = 0.953 ± 0.017.
PR-AUC on CDs (test) = 0.709 ± 0.017.
PR-AUC on non-CDs (test) = 0.971 ± 0.017.

#--------------------------------------------------
# META-BASELINE
#--------------------------------------------------

-------------------------------- ROUND  0 --------------------------------

Best score for round 0: 0.41

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		432(31.56%)	937(68.44%)
1		205(2.76%)	7216(97.24%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		312(38.76%)	493(61.24%)
1		60(10.71%)	500(89.29%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		120(21.28%)	444(78.72%)
1		145(2.11%)	6716(97.89%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		97(30.50%)	221(69.50%)
1		33(2.32%)	1390(97.68%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		66(39.29%)	102(60.71%)
1		7(5.51%)	120(94.49%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		31(20.67%)	119(79.33%)
1		26(2.01%)	1270(97.99%)
-------------------------------- ROUND  1 --------------------------------

Best score for round 1: 0.44

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		414(31.58%)	897(68.42%)
1		200(3.00%)	6474(97.00%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		284(37.37%)	476(62.63%)
1		53(10.58%)	448(89.42%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		130(23.59%)	421(76.41%)
1		147(2.38%)	6026(97.62%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		151(40.16%)	225(59.84%)
1		90(4.15%)	2080(95.85%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		103(48.36%)	110(51.64%)
1		21(11.29%)	165(88.71%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		48(29.45%)	115(70.55%)
1		69(3.48%)	1915(96.52%)
-------------------------------- ROUND  2 --------------------------------

Best score for round 2: 0.42

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		459(32.74%)	943(67.26%)
1		239(3.25%)	7121(96.75%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		322(39.70%)	489(60.30%)
1		70(11.74%)	526(88.26%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		137(23.18%)	454(76.82%)
1		169(2.50%)	6595(97.50%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		99(34.74%)	186(65.26%)
1		49(3.30%)	1435(96.70%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		71(43.83%)	91(56.17%)
1		11(12.09%)	80(87.91%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		28(22.76%)	95(77.24%)
1		38(2.73%)	1355(97.27%)
-------------------------------- ROUND  3 --------------------------------

Best score for round 3: 0.37

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		465(34.22%)	894(65.78%)
1		239(3.59%)	6417(96.41%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		329(42.02%)	454(57.98%)
1		56(10.59%)	473(89.41%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		136(23.61%)	440(76.39%)
1		183(2.99%)	5944(97.01%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		109(33.23%)	219(66.77%)
1		85(3.88%)	2103(96.12%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		69(36.32%)	121(63.68%)
1		20(12.66%)	138(87.34%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		40(28.99%)	98(71.01%)
1		65(3.20%)	1965(96.80%)
-------------------------------- ROUND  4 --------------------------------

Best score for round 4: 0.38

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		406(30.83%)	911(69.17%)
1		211(2.96%)	6920(97.04%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		277(36.69%)	478(63.31%)
1		67(11.92%)	495(88.08%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		129(22.95%)	433(77.05%)
1		144(2.19%)	6425(97.81%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		108(29.19%)	262(70.81%)
1		51(2.98%)	1662(97.02%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		75(34.40%)	143(65.60%)
1		10(8.00%)	115(92.00%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		33(21.71%)	119(78.29%)
1		41(2.58%)	1547(97.42%)
-------------------------------- ROUND  5 --------------------------------

Best score for round 5: 0.35

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		449(32.49%)	933(67.51%)
1		193(2.96%)	6326(97.04%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		302(37.66%)	500(62.34%)
1		48(9.34%)	466(90.66%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		147(25.34%)	433(74.66%)
1		145(2.41%)	5860(97.59%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		105(34.43%)	200(65.57%)
1		108(4.65%)	2217(95.35%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		68(39.77%)	103(60.23%)
1		21(12.14%)	152(87.86%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		37(27.61%)	97(72.39%)
1		87(4.04%)	2065(95.96%)
-------------------------------- ROUND  6 --------------------------------

Best score for round 6: 0.39

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		438(33.59%)	866(66.41%)
1		198(2.91%)	6598(97.09%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		312(42.11%)	429(57.89%)
1		62(11.48%)	478(88.52%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		126(22.38%)	437(77.62%)
1		136(2.17%)	6120(97.83%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		126(32.90%)	257(67.10%)
1		75(3.66%)	1973(96.34%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		91(39.22%)	141(60.78%)
1		16(10.88%)	131(89.12%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		35(23.18%)	116(76.82%)
1		59(3.10%)	1842(96.90%)
-------------------------------- ROUND  7 --------------------------------

Best score for round 7: 0.41

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		408(31.55%)	885(68.45%)
1		185(2.66%)	6774(97.34%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		283(38.14%)	459(61.86%)
1		49(9.86%)	448(90.14%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		125(22.69%)	426(77.31%)
1		136(2.10%)	6326(97.90%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		129(32.74%)	265(67.26%)
1		55(2.92%)	1830(97.08%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		89(38.53%)	142(61.47%)
1		23(12.11%)	167(87.89%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		40(24.54%)	123(75.46%)
1		32(1.89%)	1663(98.11%)
-------------------------------- ROUND  8 --------------------------------

Best score for round 8: 0.34

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		447(32.46%)	930(67.54%)
1		198(2.75%)	7009(97.25%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		305(37.65%)	505(62.35%)
1		49(8.35%)	538(91.65%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		142(25.04%)	425(74.96%)
1		149(2.25%)	6471(97.75%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		89(28.71%)	221(71.29%)
1		64(3.91%)	1573(96.09%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		59(36.20%)	104(63.80%)
1		11(11.00%)	89(89.00%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		30(20.41%)	117(79.59%)
1		53(3.45%)	1484(96.55%)
-------------------------------- ROUND  9 --------------------------------

Best score for round 9: 0.40

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		370(30.53%)	842(69.47%)
1		185(2.87%)	6270(97.13%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		269(37.73%)	444(62.27%)
1		47(9.75%)	435(90.25%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		101(20.24%)	398(79.76%)
1		138(2.31%)	5835(97.69%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		152(32.00%)	323(68.00%)
1		70(2.93%)	2319(97.07%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		107(41.15%)	153(58.85%)
1		25(12.20%)	180(87.80%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		45(20.93%)	170(79.07%)
1		45(2.06%)	2139(97.94%)

------------------------------------ SUMMARY ------------------------------------

Confusion matrix for all:
TRUE\PRED	0		1
0		32.86 ± 3.10%	67.14 ± 3.10%
1		3.47 ± 0.67%	96.53 ± 0.67%

Confusion matrix for CD:
TRUE\PRED	0		1
0		39.71 ± 3.84%	60.29 ± 3.84%
1		10.79 ± 2.16%	89.21 ± 2.16%

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		24.02 ± 3.30%	75.98 ± 3.30%
1		2.85 ± 0.69%	97.15 ± 0.69%

MCC on train = 0.403 ± 0.019.
MCC on test = 0.391 ± 0.061.
MCC on CDs (test) = 0.319 ± 0.061.
MCC on non-CDs (test) = 0.276 ± 0.061.

F1 on train = 0.924 ± 0.006.
F1 on test = 0.923 ± 0.014.
F1 on CDs (test) = 0.656 ± 0.014.
F1 on non-CDs (test) = 0.953 ± 0.014.

Precision on train = 0.881 ± 0.008.
Precision on test = 0.885 ± 0.034.
Precision on CDs (test) = 0.521 ± 0.034.
Precision on non-CDs (test) = 0.935 ± 0.034.

Recall on train = 0.970 ± 0.005.
Recall on test = 0.965 ± 0.013.
Recall on CDs (test) = 0.892 ± 0.013.
Recall on non-CDs (test) = 0.971 ± 0.013.

Accuracy on train = 0.865 ± 0.009.
Accuracy on test = 0.865 ± 0.022.
Accuracy on CDs (test) = 0.606 ± 0.022.
Accuracy on non-CDs (test) = 0.912 ± 0.022.

ROC-AUC on train = 0.833 ± 0.007.
ROC-AUC on test = 0.831 ± 0.027.
ROC-AUC on CDs (test) = 0.766 ± 0.027.
ROC-AUC on non-CDs (test) = 0.754 ± 0.027.

PR-AUC on train = 0.951 ± 0.004.
PR-AUC on test = 0.953 ± 0.018.
PR-AUC on CDs (test) = 0.709 ± 0.018.
PR-AUC on non-CDs (test) = 0.964 ± 0.018.

#--------------------------------------------------
# FOREST ON 10 FEATURES AND CD-STATUS
#--------------------------------------------------
-------------------------------- ROUND  0 --------------------------------

Best score for round 0: 0.60
Best parameter for round 0: 3

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		773(56.46%)	596(43.54%)
1		246(3.31%)	7175(96.69%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		665(82.61%)	140(17.39%)
1		172(30.71%)	388(69.29%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		108(19.15%)	456(80.85%)
1		74(1.08%)	6787(98.92%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		170(53.46%)	148(46.54%)
1		37(2.60%)	1386(97.40%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		145(86.31%)	23(13.69%)
1		25(19.69%)	102(80.31%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		25(16.67%)	125(83.33%)
1		12(0.93%)	1284(99.07%)
-------------------------------- ROUND  1 --------------------------------

Best score for round 1: 0.63
Best parameter for round 1: 2

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		772(58.89%)	539(41.11%)
1		210(3.15%)	6464(96.85%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		665(87.50%)	95(12.50%)
1		140(27.94%)	361(72.06%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		107(19.42%)	444(80.58%)
1		70(1.13%)	6103(98.87%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		224(59.57%)	152(40.43%)
1		98(4.52%)	2072(95.48%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		187(87.79%)	26(12.21%)
1		79(42.47%)	107(57.53%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		37(22.70%)	126(77.30%)
1		19(0.96%)	1965(99.04%)
-------------------------------- ROUND  2 --------------------------------

Best score for round 2: 0.61
Best parameter for round 2: 3

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		807(57.56%)	595(42.44%)
1		240(3.26%)	7120(96.74%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		687(84.71%)	124(15.29%)
1		168(28.19%)	428(71.81%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		120(20.30%)	471(79.70%)
1		72(1.06%)	6692(98.94%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		163(57.19%)	122(42.81%)
1		43(2.90%)	1441(97.10%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		139(85.80%)	23(14.20%)
1		29(31.87%)	62(68.13%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		24(19.51%)	99(80.49%)
1		14(1.01%)	1379(98.99%)
-------------------------------- ROUND  3 --------------------------------

Best score for round 3: 0.62
Best parameter for round 3: 10

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		819(60.26%)	540(39.74%)
1		265(3.98%)	6391(96.02%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		669(85.44%)	114(14.56%)
1		171(32.33%)	358(67.67%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		150(26.04%)	426(73.96%)
1		94(1.53%)	6033(98.47%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		199(60.67%)	129(39.33%)
1		91(4.16%)	2097(95.84%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		163(85.79%)	27(14.21%)
1		57(36.08%)	101(63.92%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		36(26.09%)	102(73.91%)
1		34(1.67%)	1996(98.33%)
-------------------------------- ROUND  4 --------------------------------

Best score for round 4: 0.60
Best parameter for round 4: 3

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		748(56.80%)	569(43.20%)
1		248(3.48%)	6883(96.52%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		634(83.97%)	121(16.03%)
1		175(31.14%)	387(68.86%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		114(20.28%)	448(79.72%)
1		73(1.11%)	6496(98.89%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		215(58.11%)	155(41.89%)
1		45(2.63%)	1668(97.37%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		189(86.70%)	29(13.30%)
1		29(23.20%)	96(76.80%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		26(17.11%)	126(82.89%)
1		16(1.01%)	1572(98.99%)
-------------------------------- ROUND  5 --------------------------------

Best score for round 5: 0.61
Best parameter for round 5: 6

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		818(59.19%)	564(40.81%)
1		251(3.85%)	6268(96.15%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		687(85.66%)	115(14.34%)
1		168(32.68%)	346(67.32%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		131(22.59%)	449(77.41%)
1		83(1.38%)	5922(98.62%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		188(61.64%)	117(38.36%)
1		116(4.99%)	2209(95.01%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		151(88.30%)	20(11.70%)
1		80(46.24%)	93(53.76%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		37(27.61%)	97(72.39%)
1		36(1.67%)	2116(98.33%)
-------------------------------- ROUND  6 --------------------------------

Best score for round 6: 0.61
Best parameter for round 6: 2

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		747(57.29%)	557(42.71%)
1		227(3.34%)	6569(96.66%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		637(85.96%)	104(14.04%)
1		164(30.37%)	376(69.63%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		110(19.54%)	453(80.46%)
1		63(1.01%)	6193(98.99%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		230(60.05%)	153(39.95%)
1		68(3.32%)	1980(96.68%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		202(87.07%)	30(12.93%)
1		47(31.97%)	100(68.03%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		28(18.54%)	123(81.46%)
1		21(1.10%)	1880(98.90%)
-------------------------------- ROUND  7 --------------------------------

Best score for round 7: 0.61
Best parameter for round 7: 7

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		751(58.08%)	542(41.92%)
1		243(3.49%)	6716(96.51%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		639(86.12%)	103(13.88%)
1		157(31.59%)	340(68.41%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		112(20.33%)	439(79.67%)
1		86(1.33%)	6376(98.67%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		232(58.88%)	162(41.12%)
1		90(4.77%)	1795(95.23%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		198(85.71%)	33(14.29%)
1		69(36.32%)	121(63.68%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		34(20.86%)	129(79.14%)
1		21(1.24%)	1674(98.76%)
-------------------------------- ROUND  8 --------------------------------

Best score for round 8: 0.63
Best parameter for round 8: 3

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		821(59.62%)	556(40.38%)
1		239(3.32%)	6968(96.68%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		693(85.56%)	117(14.44%)
1		163(27.77%)	424(72.23%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		128(22.57%)	439(77.43%)
1		76(1.15%)	6544(98.85%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		154(49.68%)	156(50.32%)
1		53(3.24%)	1584(96.76%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		132(80.98%)	31(19.02%)
1		36(36.00%)	64(64.00%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		22(14.97%)	125(85.03%)
1		17(1.11%)	1520(98.89%)
-------------------------------- ROUND  9 --------------------------------

Best score for round 9: 0.62
Best parameter for round 9: 8

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		707(58.33%)	505(41.67%)
1		218(3.38%)	6237(96.62%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		600(84.15%)	113(15.85%)
1		153(31.74%)	329(68.26%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		107(21.44%)	392(78.56%)
1		65(1.09%)	5908(98.91%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		264(55.58%)	211(44.42%)
1		103(4.31%)	2286(95.69%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		226(86.92%)	34(13.08%)
1		74(36.10%)	131(63.90%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		38(17.67%)	177(82.33%)
1		29(1.33%)	2155(98.67%)

------------------------------------ SUMMARY ------------------------------------

Confusion matrix for all:
TRUE\PRED	0		1
0		57.48 ± 3.49%	42.52 ± 3.49%
1		3.74 ± 0.86%	96.26 ± 0.86%

Confusion matrix for CD:
TRUE\PRED	0		1
0		86.14 ± 1.90%	13.86 ± 1.90%
1		33.99 ± 7.55%	66.01 ± 7.55%

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		20.17 ± 3.94%	79.83 ± 3.94%
1		1.20 ± 0.26%	98.80 ± 0.26%

MCC on train = 0.614 ± 0.018.
MCC on test = 0.596 ± 0.055.
MCC on CDs (test) = 0.535 ± 0.055.
MCC on non-CDs (test) = 0.314 ± 0.055.

F1 on train = 0.944 ± 0.004.
F1 on test = 0.943 ± 0.011.
F1 on CDs (test) = 0.710 ± 0.011.
F1 on non-CDs (test) = 0.960 ± 0.011.

Precision on train = 0.923 ± 0.005.
Precision on test = 0.924 ± 0.027.
Precision on CDs (test) = 0.775 ± 0.027.
Precision on non-CDs (test) = 0.933 ± 0.027.

Recall on train = 0.965 ± 0.005.
Recall on test = 0.963 ± 0.017.
Recall on CDs (test) = 0.660 ± 0.017.
Recall on non-CDs (test) = 0.988 ± 0.017.

Accuracy on train = 0.904 ± 0.006.
Accuracy on test = 0.901 ± 0.017.
Accuracy on CDs (test) = 0.773 ± 0.017.
Accuracy on non-CDs (test) = 0.924 ± 0.017.

ROC-AUC on train = 0.891 ± 0.008.
ROC-AUC on test = 0.894 ± 0.016.
ROC-AUC on CDs (test) = 0.835 ± 0.016.
ROC-AUC on non-CDs (test) = 0.815 ± 0.016.

PR-AUC on train = 0.968 ± 0.005.
PR-AUC on test = 0.971 ± 0.013.
PR-AUC on CDs (test) = 0.815 ± 0.013.
PR-AUC on non-CDs (test) = 0.975 ± 0.013.

#--------------------------------------------------
# META-LOGREG 1
#--------------------------------------------------
-------------------------------- ROUND  0 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    4.5s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    4.5s finished

Best score for round 0: 0.33
Best parameter for round 0: [0.08858668]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		690(50.40%)	679(49.60%)
1		268(3.61%)	7153(96.39%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		664(82.48%)	141(17.52%)
1		250(44.64%)	310(55.36%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		26(4.61%)	538(95.39%)
1		18(0.26%)	6843(99.74%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		150(47.17%)	168(52.83%)
1		48(3.37%)	1375(96.63%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		144(85.71%)	24(14.29%)
1		43(33.86%)	84(66.14%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		6(4.00%)	144(96.00%)
1		5(0.39%)	1291(99.61%)
-------------------------------- ROUND  1 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    2.9s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    2.9s finished

Best score for round 1: 0.33
Best parameter for round 1: [0.08858668]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		697(53.17%)	614(46.83%)
1		262(3.93%)	6412(96.07%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		661(86.97%)	99(13.03%)
1		240(47.90%)	261(52.10%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		36(6.53%)	515(93.47%)
1		22(0.36%)	6151(99.64%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		207(55.05%)	169(44.95%)
1		127(5.85%)	2043(94.15%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		197(92.49%)	16(7.51%)
1		116(62.37%)	70(37.63%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		10(6.13%)	153(93.87%)
1		11(0.55%)	1973(99.45%)
-------------------------------- ROUND  2 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    2.7s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    2.7s finished

Best score for round 2: 0.35
Best parameter for round 2: [0.23357215]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		673(48.00%)	729(52.00%)
1		236(3.21%)	7124(96.79%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		622(76.70%)	189(23.30%)
1		201(33.72%)	395(66.28%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		51(8.63%)	540(91.37%)
1		35(0.52%)	6729(99.48%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		137(48.07%)	148(51.93%)
1		44(2.96%)	1440(97.04%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		126(77.78%)	36(22.22%)
1		37(40.66%)	54(59.34%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		11(8.94%)	112(91.06%)
1		7(0.50%)	1386(99.50%)
-------------------------------- ROUND  3 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    2.8s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    2.8s finished

Best score for round 3: 0.38
Best parameter for round 3: [0.08858668]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		696(51.21%)	663(48.79%)
1		241(3.62%)	6415(96.38%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		666(85.06%)	117(14.94%)
1		220(41.59%)	309(58.41%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		30(5.21%)	546(94.79%)
1		21(0.34%)	6106(99.66%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		169(51.52%)	159(48.48%)
1		84(3.84%)	2104(96.16%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		160(84.21%)	30(15.79%)
1		80(50.63%)	78(49.37%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		9(6.52%)	129(93.48%)
1		4(0.20%)	2026(99.80%)
-------------------------------- ROUND  4 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    3.0s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    3.0s finished

Best score for round 4: 0.35
Best parameter for round 4: [0.08858668]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		641(48.67%)	676(51.33%)
1		237(3.32%)	6894(96.68%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		606(80.26%)	149(19.74%)
1		219(38.97%)	343(61.03%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		35(6.23%)	527(93.77%)
1		18(0.27%)	6551(99.73%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		176(47.57%)	194(52.43%)
1		42(2.45%)	1671(97.55%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		171(78.44%)	47(21.56%)
1		40(32.00%)	85(68.00%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		5(3.29%)	147(96.71%)
1		2(0.13%)	1586(99.87%)
-------------------------------- ROUND  5 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    2.7s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    2.7s finished

Best score for round 5: 0.36
Best parameter for round 5: [0.23357215]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		755(54.63%)	627(45.37%)
1		256(3.93%)	6263(96.07%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		676(84.29%)	126(15.71%)
1		204(39.69%)	310(60.31%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		79(13.62%)	501(86.38%)
1		52(0.87%)	5953(99.13%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		169(55.41%)	136(44.59%)
1		125(5.38%)	2200(94.62%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		150(87.72%)	21(12.28%)
1		103(59.54%)	70(40.46%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		19(14.18%)	115(85.82%)
1		22(1.02%)	2130(98.98%)
-------------------------------- ROUND  6 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    2.8s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    2.8s finished

Best score for round 6: 0.36
Best parameter for round 6: [0.23357215]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		630(48.31%)	674(51.69%)
1		231(3.40%)	6565(96.60%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		568(76.65%)	173(23.35%)
1		192(35.56%)	348(64.44%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		62(11.01%)	501(88.99%)
1		39(0.62%)	6217(99.38%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		190(49.61%)	193(50.39%)
1		82(4.00%)	1966(96.00%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		176(75.86%)	56(24.14%)
1		68(46.26%)	79(53.74%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		14(9.27%)	137(90.73%)
1		14(0.74%)	1887(99.26%)
-------------------------------- ROUND  7 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    3.0s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    3.0s finished

Best score for round 7: 0.35
Best parameter for round 7: [0.23357215]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		649(50.19%)	644(49.81%)
1		208(2.99%)	6751(97.01%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		598(80.59%)	144(19.41%)
1		172(34.61%)	325(65.39%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		51(9.26%)	500(90.74%)
1		36(0.56%)	6426(99.44%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		204(51.78%)	190(48.22%)
1		93(4.93%)	1792(95.07%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		186(80.52%)	45(19.48%)
1		84(44.21%)	106(55.79%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		18(11.04%)	145(88.96%)
1		9(0.53%)	1686(99.47%)
-------------------------------- ROUND  8 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    2.7s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    2.7s finished

Best score for round 8: 0.36
Best parameter for round 8: [0.08858668]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		703(51.05%)	674(48.95%)
1		249(3.45%)	6958(96.55%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		652(80.49%)	158(19.51%)
1		221(37.65%)	366(62.35%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		51(8.99%)	516(91.01%)
1		28(0.42%)	6592(99.58%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		140(45.16%)	170(54.84%)
1		57(3.48%)	1580(96.52%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		131(80.37%)	32(19.63%)
1		50(50.00%)	50(50.00%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		9(6.12%)	138(93.88%)
1		7(0.46%)	1530(99.54%)
-------------------------------- ROUND  9 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    2.8s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    2.8s finished

Best score for round 9: 0.35
Best parameter for round 9: [4.2813324]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		599(49.42%)	613(50.58%)
1		205(3.18%)	6250(96.82%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		541(75.88%)	172(24.12%)
1		162(33.61%)	320(66.39%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		58(11.62%)	441(88.38%)
1		43(0.72%)	5930(99.28%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		238(50.11%)	237(49.89%)
1		102(4.27%)	2287(95.73%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		209(80.38%)	51(19.62%)
1		86(41.95%)	119(58.05%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		29(13.49%)	186(86.51%)
1		16(0.73%)	2168(99.27%)

------------------------------------ SUMMARY ------------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		50.14 ± 3.18%	49.86 ± 3.18%
1		4.05 ± 1.02%	95.95 ± 1.02%

Confusion matrix for CD:
TRUE\PRED	0		1
0		82.35 ± 4.86%	17.65 ± 4.86%
1		46.15 ± 9.38%	53.85 ± 9.38%

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		8.30 ± 3.56%	91.70 ± 3.56%
1		0.52 ± 0.25%	99.48 ± 0.25%

MCC on train = 0.552 ± 0.025.
MCC on test = 0.529 ± 0.033.
MCC on CDs (test) = 0.380 ± 0.033.
MCC on non-CDs (test) = 0.194 ± 0.033.

F1 on train = 0.937 ± 0.004.
F1 on test = 0.935 ± 0.012.
F1 on CDs (test) = 0.597 ± 0.012.
F1 on non-CDs (test) = 0.958 ± 0.012.

Precision on train = 0.910 ± 0.005.
Precision on test = 0.911 ± 0.030.
Precision on CDs (test) = 0.692 ± 0.030.
Precision on non-CDs (test) = 0.925 ± 0.030.

Recall on train = 0.965 ± 0.006.
Recall on test = 0.959 ± 0.020.
Recall on CDs (test) = 0.539 ± 0.020.
Recall on non-CDs (test) = 0.995 ± 0.020.

Accuracy on train = 0.891 ± 0.005.
Accuracy on test = 0.887 ± 0.018.
Accuracy on CDs (test) = 0.698 ± 0.018.
Accuracy on non-CDs (test) = 0.921 ± 0.018.

ROC-AUC on train = 0.863 ± 0.006.
ROC-AUC on test = 0.859 ± 0.023.
ROC-AUC on CDs (test) = 0.766 ± 0.023.
ROC-AUC on non-CDs (test) = 0.754 ± 0.023.

PR-AUC on train = 0.958 ± 0.005.
PR-AUC on test = 0.959 ± 0.017.
PR-AUC on CDs (test) = 0.709 ± 0.017.
PR-AUC on non-CDs (test) = 0.964 ± 0.017.

#--------------------------------------------------
# META-LOGREG 2
#--------------------------------------------------
-------------------------------- ROUND  0 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    3.1s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    3.1s finished

Best score for round 0: 0.33
Best parameter for round 0: [11.28837892]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		759(55.44%)	610(44.56%)
1		213(2.87%)	7208(97.13%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		674(83.73%)	131(16.27%)
1		162(28.93%)	398(71.07%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		85(15.07%)	479(84.93%)
1		51(0.74%)	6810(99.26%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		168(52.83%)	150(47.17%)
1		35(2.46%)	1388(97.54%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		143(85.12%)	25(14.88%)
1		21(16.54%)	106(83.46%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		25(16.67%)	125(83.33%)
1		14(1.08%)	1282(98.92%)
-------------------------------- ROUND  1 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    3.0s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    3.0s finished

Best score for round 1: 0.33
Best parameter for round 1: [4.2813324]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		747(56.98%)	564(43.02%)
1		204(3.06%)	6470(96.94%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		650(85.53%)	110(14.47%)
1		147(29.34%)	354(70.66%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		97(17.60%)	454(82.40%)
1		57(0.92%)	6116(99.08%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		214(56.91%)	162(43.09%)
1		96(4.42%)	2074(95.58%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		183(85.92%)	30(14.08%)
1		75(40.32%)	111(59.68%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		31(19.02%)	132(80.98%)
1		21(1.06%)	1963(98.94%)
-------------------------------- ROUND  2 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    3.5s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    3.5s finished

Best score for round 2: 0.35
Best parameter for round 2: [4.2813324]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		768(54.78%)	634(45.22%)
1		235(3.19%)	7125(96.81%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		671(82.74%)	140(17.26%)
1		172(28.86%)	424(71.14%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		97(16.41%)	494(83.59%)
1		63(0.93%)	6701(99.07%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		156(54.74%)	129(45.26%)
1		41(2.76%)	1443(97.24%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		139(85.80%)	23(14.20%)
1		27(29.67%)	64(70.33%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		17(13.82%)	106(86.18%)
1		14(1.01%)	1379(98.99%)
-------------------------------- ROUND  3 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    3.4s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    3.4s finished

Best score for round 3: 0.38
Best parameter for round 3: [29.76351442]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		767(56.44%)	592(43.56%)
1		210(3.16%)	6446(96.84%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		669(85.44%)	114(14.56%)
1		152(28.73%)	377(71.27%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		98(17.01%)	478(82.99%)
1		58(0.95%)	6069(99.05%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		181(55.18%)	147(44.82%)
1		79(3.61%)	2109(96.39%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		157(82.63%)	33(17.37%)
1		50(31.65%)	108(68.35%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		24(17.39%)	114(82.61%)
1		29(1.43%)	2001(98.57%)
-------------------------------- ROUND  4 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    3.5s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    3.5s finished

Best score for round 4: 0.35
Best parameter for round 4: [11.28837892]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		734(55.73%)	583(44.27%)
1		222(3.11%)	6909(96.89%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		624(82.65%)	131(17.35%)
1		159(28.29%)	403(71.71%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		110(19.57%)	452(80.43%)
1		63(0.96%)	6506(99.04%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		210(56.76%)	160(43.24%)
1		44(2.57%)	1669(97.43%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		187(85.78%)	31(14.22%)
1		27(21.60%)	98(78.40%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		23(15.13%)	129(84.87%)
1		17(1.07%)	1571(98.93%)
-------------------------------- ROUND  5 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    3.5s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    3.5s finished

Best score for round 5: 0.36
Best parameter for round 5: [0.61584821]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		794(57.45%)	588(42.55%)
1		206(3.16%)	6313(96.84%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		684(85.29%)	118(14.71%)
1		147(28.60%)	367(71.40%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		110(18.97%)	470(81.03%)
1		59(0.98%)	5946(99.02%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		180(59.02%)	125(40.98%)
1		88(3.78%)	2237(96.22%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		145(84.80%)	26(15.20%)
1		66(38.15%)	107(61.85%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		35(26.12%)	99(73.88%)
1		22(1.02%)	2130(98.98%)
-------------------------------- ROUND  6 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    3.1s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    3.1s finished

Best score for round 6: 0.36
Best parameter for round 6: [0.61584821]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		709(54.37%)	595(45.63%)
1		221(3.25%)	6575(96.75%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		611(82.46%)	130(17.54%)
1		159(29.44%)	381(70.56%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		98(17.41%)	465(82.59%)
1		62(0.99%)	6194(99.01%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		217(56.66%)	166(43.34%)
1		58(2.83%)	1990(97.17%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		190(81.90%)	42(18.10%)
1		45(30.61%)	102(69.39%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		27(17.88%)	124(82.12%)
1		13(0.68%)	1888(99.32%)
-------------------------------- ROUND  7 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    3.5s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    3.5s finished

Best score for round 7: 0.35
Best parameter for round 7: [1.62377674]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		726(56.15%)	567(43.85%)
1		200(2.87%)	6759(97.13%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		631(85.04%)	111(14.96%)
1		142(28.57%)	355(71.43%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		95(17.24%)	456(82.76%)
1		58(0.90%)	6404(99.10%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		223(56.60%)	171(43.40%)
1		73(3.87%)	1812(96.13%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		192(83.12%)	39(16.88%)
1		61(32.11%)	129(67.89%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		31(19.02%)	132(80.98%)
1		12(0.71%)	1683(99.29%)
-------------------------------- ROUND  8 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    3.7s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    3.7s finished

Best score for round 8: 0.36
Best parameter for round 8: [4.2813324]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		794(57.66%)	583(42.34%)
1		227(3.15%)	6980(96.85%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		683(84.32%)	127(15.68%)
1		160(27.26%)	427(72.74%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		111(19.58%)	456(80.42%)
1		67(1.01%)	6553(98.99%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		145(46.77%)	165(53.23%)
1		50(3.05%)	1587(96.95%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		128(78.53%)	35(21.47%)
1		32(32.00%)	68(68.00%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		17(11.56%)	130(88.44%)
1		18(1.17%)	1519(98.83%)
-------------------------------- ROUND  9 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    3.3s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    3.3s finished

Best score for round 9: 0.35
Best parameter for round 9: [4.2813324]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		669(55.20%)	543(44.80%)
1		192(2.97%)	6263(97.03%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		594(83.31%)	119(16.69%)
1		142(29.46%)	340(70.54%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		75(15.03%)	424(84.97%)
1		50(0.84%)	5923(99.16%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		259(54.53%)	216(45.47%)
1		79(3.31%)	2310(96.69%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		224(86.15%)	36(13.85%)
1		62(30.24%)	143(69.76%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		35(16.28%)	180(83.72%)
1		17(0.78%)	2167(99.22%)

------------------------------------ SUMMARY ------------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		55.00 ± 3.18%	45.00 ± 3.18%
1		3.27 ± 0.61%	96.73 ± 0.61%

Confusion matrix for CD:
TRUE\PRED	0		1
0		83.97 ± 2.32%	16.03 ± 2.32%
1		30.29 ± 6.60%	69.71 ± 6.60%

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		17.29 ± 3.68%	82.71 ± 3.68%
1		1.00 ± 0.22%	99.00 ± 0.22%

MCC on train = 0.608 ± 0.020.
MCC on test = 0.591 ± 0.054.
MCC on CDs (test) = 0.543 ± 0.054.
MCC on non-CDs (test) = 0.292 ± 0.054.

F1 on train = 0.944 ± 0.004.
F1 on test = 0.943 ± 0.011.
F1 on CDs (test) = 0.725 ± 0.011.
F1 on non-CDs (test) = 0.960 ± 0.011.

Precision on train = 0.920 ± 0.006.
Precision on test = 0.920 ± 0.026.
Precision on CDs (test) = 0.760 ± 0.026.
Precision on non-CDs (test) = 0.931 ± 0.026.

Recall on train = 0.969 ± 0.003.
Recall on test = 0.967 ± 0.012.
Recall on CDs (test) = 0.697 ± 0.012.
Recall on non-CDs (test) = 0.990 ± 0.012.

Accuracy on train = 0.903 ± 0.006.
Accuracy on test = 0.901 ± 0.017.
Accuracy on CDs (test) = 0.778 ± 0.017.
Accuracy on non-CDs (test) = 0.924 ± 0.017.

ROC-AUC on train = 0.897 ± 0.006.
ROC-AUC on test = 0.894 ± 0.011.
ROC-AUC on CDs (test) = 0.841 ± 0.011.
ROC-AUC on non-CDs (test) = 0.820 ± 0.011.

PR-AUC on train = 0.973 ± 0.003.
PR-AUC on test = 0.973 ± 0.011.
PR-AUC on CDs (test) = 0.825 ± 0.011.
PR-AUC on non-CDs (test) = 0.977 ± 0.011.
