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

-------------------------------- ROUND  0 --------------------------------

Best score for round 0: 0.69
Best parameter for round 0: 2

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		12157(79.03%)	3225(20.97%)
1		2618(10.75%)	21742(89.25%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8871(93.47%)	620(6.53%)
1		927(45.15%)	1126(54.85%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		3286(55.78%)	2605(44.22%)
1		1691(7.58%)	20616(92.42%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2791(79.07%)	739(20.93%)
1		727(9.66%)	6799(90.34%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2035(92.92%)	155(7.08%)
1		286(44.69%)	354(55.31%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		756(56.42%)	584(43.58%)
1		441(6.40%)	6445(93.60%)

-------------------------------- ROUND  1 --------------------------------

Best score for round 1: 0.70
Best parameter for round 1: 4

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11450(78.17%)	3197(21.83%)
1		2429(9.46%)	23253(90.54%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8492(92.62%)	677(7.38%)
1		924(43.67%)	1192(56.33%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2958(54.00%)	2520(46.00%)
1		1505(6.39%)	22061(93.61%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		3245(76.08%)	1020(23.92%)
1		673(10.85%)	5531(89.15%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2346(93.39%)	166(6.61%)
1		267(46.27%)	310(53.73%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		899(51.28%)	854(48.72%)
1		406(7.22%)	5221(92.78%)

-------------------------------- ROUND  2 --------------------------------

Best score for round 2: 0.69
Best parameter for round 2: 2

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11994(78.39%)	3307(21.61%)
1		2526(9.85%)	23123(90.15%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8796(92.80%)	682(7.20%)
1		921(42.64%)	1239(57.36%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		3198(54.92%)	2625(45.08%)
1		1605(6.83%)	21884(93.17%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2869(79.45%)	742(20.55%)
1		730(11.70%)	5507(88.30%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2069(93.92%)	134(6.08%)
1		280(52.53%)	253(47.47%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		800(56.82%)	608(43.18%)
1		450(7.89%)	5254(92.11%)

-------------------------------- ROUND  3 --------------------------------

Best score for round 3: 0.68
Best parameter for round 3: 2

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11535(78.04%)	3245(21.96%)
1		2571(10.54%)	21815(89.46%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8401(92.55%)	676(7.45%)
1		953(45.17%)	1157(54.83%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		3134(54.95%)	2569(45.05%)
1		1618(7.26%)	20658(92.74%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		3279(79.36%)	853(20.64%)
1		668(8.91%)	6832(91.09%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2432(93.39%)	172(6.61%)
1		250(42.88%)	333(57.12%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		847(55.43%)	681(44.57%)
1		418(6.04%)	6499(93.96%)

-------------------------------- ROUND  4 --------------------------------

Best score for round 4: 0.69
Best parameter for round 4: 3

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		12057(77.96%)	3408(22.04%)
1		2573(9.82%)	23622(90.18%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8834(92.56%)	710(7.44%)
1		968(43.58%)	1253(56.42%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		3223(54.43%)	2698(45.57%)
1		1605(6.69%)	22369(93.31%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2700(78.33%)	747(21.67%)
1		566(9.95%)	5125(90.05%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1987(92.98%)	150(7.02%)
1		210(44.49%)	262(55.51%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		713(54.43%)	597(45.57%)
1		356(6.82%)	4863(93.18%)

-------------------------------- ROUND  5 --------------------------------

Best score for round 5: 0.69
Best parameter for round 5: 2

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		12547(78.75%)	3386(21.25%)
1		2605(10.31%)	22665(89.69%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		9195(93.12%)	679(6.88%)
1		963(43.59%)	1246(56.41%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		3352(55.32%)	2707(44.68%)
1		1642(7.12%)	21419(92.88%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2337(78.45%)	642(21.55%)
1		622(9.40%)	5994(90.60%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1669(92.36%)	138(7.64%)
1		220(45.45%)	264(54.55%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		668(57.00%)	504(43.00%)
1		402(6.56%)	5730(93.44%)

-------------------------------- ROUND  6 --------------------------------

Best score for round 6: 0.70
Best parameter for round 6: 3

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11499(78.21%)	3204(21.79%)
1		2414(9.18%)	23883(90.82%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8532(92.76%)	666(7.24%)
1		946(43.98%)	1205(56.02%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2967(53.90%)	2538(46.10%)
1		1468(6.08%)	22678(93.92%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		3139(74.58%)	1070(25.42%)
1		636(11.38%)	4953(88.62%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2304(92.79%)	179(7.21%)
1		228(42.07%)	314(57.93%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		835(48.38%)	891(51.62%)
1		408(8.08%)	4639(91.92%)

-------------------------------- ROUND  7 --------------------------------

Best score for round 7: 0.69
Best parameter for round 7: 1

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		12006(78.23%)	3342(21.77%)
1		2556(9.98%)	23064(90.02%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8693(92.48%)	707(7.52%)
1		937(43.08%)	1238(56.92%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		3313(55.70%)	2635(44.30%)
1		1619(6.91%)	21826(93.09%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2778(77.95%)	786(22.05%)
1		609(9.72%)	5657(90.28%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2086(91.45%)	195(8.55%)
1		215(41.51%)	303(58.49%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		692(53.94%)	591(46.06%)
1		394(6.85%)	5354(93.15%)

-------------------------------- ROUND  8 --------------------------------

Best score for round 8: 0.69
Best parameter for round 8: 2

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11806(77.92%)	3345(22.08%)
1		2516(10.00%)	22646(90.00%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8655(92.76%)	676(7.24%)
1		949(44.81%)	1169(55.19%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		3151(54.14%)	2669(45.86%)
1		1567(6.80%)	21477(93.20%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2946(78.33%)	815(21.67%)
1		636(9.46%)	6088(90.54%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2179(92.72%)	171(7.28%)
1		241(41.91%)	334(58.09%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		767(54.36%)	644(45.64%)
1		395(6.42%)	5754(93.58%)

-------------------------------- ROUND  9 --------------------------------

Best score for round 9: 0.69
Best parameter for round 9: 2

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		12156(78.79%)	3272(21.21%)
1		2528(10.01%)	22720(89.99%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8833(93.11%)	654(6.89%)
1		923(42.61%)	1243(57.39%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		3323(55.93%)	2618(44.07%)
1		1605(6.95%)	21477(93.05%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2737(78.56%)	747(21.44%)
1		711(10.71%)	5927(89.29%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2024(92.25%)	170(7.75%)
1		266(50.47%)	261(49.53%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		713(55.27%)	577(44.73%)
1		445(7.28%)	5666(92.72%)

------------------------------------ SUMMARY ------------------------------------

Confusion matrix for all:
TRUE\PRED	0		1
0		78.01 ± 1.46%	21.99 ± 1.46%
1		10.17 ± 0.88%	89.83 ± 0.88%

Confusion matrix for CD:
TRUE\PRED	0		1
0		92.82 ± 0.66%	7.18 ± 0.66%
1		45.23 ± 3.51%	54.77 ± 3.51%

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		54.33 ± 2.54%	45.67 ± 2.54%
1		6.96 ± 0.63%	93.04 ± 0.63%

MCC on train = 0.691 ± 0.009.
MCC on test = 0.684 ± 0.037.
MCC on CDs (test) = 0.507 ± 0.037.
MCC on non-CDs (test) = 0.507 ± 0.037.

F1 on train = 0.887 ± 0.008.
F1 on test = 0.887 ± 0.031.
F1 on CDs (test) = 0.592 ± 0.031.
F1 on non-CDs (test) = 0.911 ± 0.031.

Precision on train = 0.874 ± 0.007.
Precision on test = 0.876 ± 0.048.
Precision on CDs (test) = 0.646 ± 0.048.
Precision on non-CDs (test) = 0.893 ± 0.048.

Recall on train = 0.900 ± 0.009.
Recall on test = 0.898 ± 0.018.
Recall on CDs (test) = 0.548 ± 0.018.
Recall on non-CDs (test) = 0.930 ± 0.018.

Accuracy on train = 0.856 ± 0.006.
Accuracy on test = 0.855 ± 0.026.
Accuracy on CDs (test) = 0.854 ± 0.026.
Accuracy on non-CDs (test) = 0.855 ± 0.026.

ROC-AUC on train = 0.916 ± 0.003.
ROC-AUC on test = 0.914 ± 0.020.
ROC-AUC on CDs (test) = 0.829 ± 0.020.
ROC-AUC on non-CDs (test) = 0.857 ± 0.020.

PR-AUC on train = 0.939 ± 0.005.
PR-AUC on test = 0.939 ± 0.033.
PR-AUC on CDs (test) = 0.642 ± 0.033.
PR-AUC on non-CDs (test) = 0.952 ± 0.033.

#--------------------------------------------------
# FOREST ON PHYLOGENETIC FEATURES
#--------------------------------------------------

-------------------------------- ROUND  0 --------------------------------

Best score for round 0: 0.63
Best parameter for round 0: 1

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11439(74.37%)	3943(25.63%)
1		2934(12.04%)	21426(87.96%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8669(91.34%)	822(8.66%)
1		977(47.59%)	1076(52.41%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2770(47.02%)	3121(52.98%)
1		1957(8.77%)	20350(91.23%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2694(76.32%)	836(23.68%)
1		823(10.94%)	6703(89.06%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2011(91.83%)	179(8.17%)
1		292(45.62%)	348(54.37%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		683(50.97%)	657(49.03%)
1		531(7.71%)	6355(92.29%)

-------------------------------- ROUND  1 --------------------------------

Best score for round 1: 0.65
Best parameter for round 1: 1

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		10971(74.90%)	3676(25.10%)
1		2824(11.00%)	22858(89.00%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8327(90.82%)	842(9.18%)
1		980(46.31%)	1136(53.69%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2644(48.27%)	2834(51.73%)
1		1844(7.82%)	21722(92.18%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		3068(71.93%)	1197(28.07%)
1		809(13.04%)	5395(86.96%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2301(91.60%)	211(8.40%)
1		283(49.05%)	294(50.95%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		767(43.75%)	986(56.25%)
1		526(9.35%)	5101(90.65%)

-------------------------------- ROUND  2 --------------------------------

Best score for round 2: 0.64
Best parameter for round 2: 1

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11361(74.25%)	3940(25.75%)
1		2901(11.31%)	22748(88.69%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8636(91.12%)	842(8.88%)
1		995(46.06%)	1165(53.94%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2725(46.80%)	3098(53.20%)
1		1906(8.11%)	21583(91.89%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2728(75.55%)	883(24.45%)
1		764(12.25%)	5473(87.75%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2029(92.10%)	174(7.90%)
1		266(49.91%)	267(50.09%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		699(49.64%)	709(50.36%)
1		498(8.73%)	5206(91.27%)

-------------------------------- ROUND  3 --------------------------------

Best score for round 3: 0.63
Best parameter for round 3: 1

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		10947(74.07%)	3833(25.93%)
1		2870(11.77%)	21516(88.23%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8271(91.12%)	806(8.88%)
1		982(46.54%)	1128(53.46%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2676(46.92%)	3027(53.08%)
1		1888(8.48%)	20388(91.52%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		3105(75.15%)	1027(24.85%)
1		754(10.05%)	6746(89.95%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2387(91.67%)	217(8.33%)
1		252(43.22%)	331(56.78%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		718(46.99%)	810(53.01%)
1		502(7.26%)	6415(92.74%)

-------------------------------- ROUND  4 --------------------------------

Best score for round 4: 0.63
Best parameter for round 4: 1

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11421(73.85%)	4044(26.15%)
1		2990(11.41%)	23205(88.59%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8684(90.99%)	860(9.01%)
1		1035(46.60%)	1186(53.40%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2737(46.23%)	3184(53.77%)
1		1955(8.15%)	22019(91.85%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2546(73.86%)	901(26.14%)
1		618(10.86%)	5073(89.14%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1926(90.13%)	211(9.87%)
1		225(47.67%)	247(52.33%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		620(47.33%)	690(52.67%)
1		393(7.53%)	4826(92.47%)

-------------------------------- ROUND  5 --------------------------------

Best score for round 5: 0.64
Best parameter for round 5: 1

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11963(75.08%)	3970(24.92%)
1		3015(11.93%)	22255(88.07%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		9030(91.45%)	844(8.55%)
1		1035(46.85%)	1174(53.15%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2933(48.41%)	3126(51.59%)
1		1980(8.59%)	21081(91.41%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2235(75.03%)	744(24.97%)
1		769(11.62%)	5847(88.38%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1649(91.26%)	158(8.74%)
1		242(50.00%)	242(50.00%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		586(50.00%)	586(50.00%)
1		527(8.59%)	5605(91.41%)

-------------------------------- ROUND  6 --------------------------------

Best score for round 6: 0.65
Best parameter for round 6: 1

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		10945(74.44%)	3758(25.56%)
1		2825(10.74%)	23472(89.26%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8361(90.90%)	837(9.10%)
1		993(46.16%)	1158(53.84%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2584(46.94%)	2921(53.06%)
1		1832(7.59%)	22314(92.41%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2963(70.40%)	1246(29.60%)
1		664(11.88%)	4925(88.12%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2223(89.53%)	260(10.47%)
1		244(45.02%)	298(54.98%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		740(42.87%)	986(57.13%)
1		420(8.32%)	4627(91.68%)

-------------------------------- ROUND  7 --------------------------------

Best score for round 7: 0.64
Best parameter for round 7: 1

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11442(74.55%)	3906(25.45%)
1		2903(11.33%)	22717(88.67%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8578(91.26%)	822(8.74%)
1		1012(46.53%)	1163(53.47%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2864(48.15%)	3084(51.85%)
1		1891(8.07%)	21554(91.93%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2648(74.30%)	916(25.70%)
1		821(13.10%)	5445(86.90%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2059(90.27%)	222(9.73%)
1		269(51.93%)	249(48.07%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		589(45.91%)	694(54.09%)
1		552(9.60%)	5196(90.40%)

-------------------------------- ROUND  8 --------------------------------

Best score for round 8: 0.63
Best parameter for round 8: 1

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11219(74.05%)	3932(25.95%)
1		2934(11.66%)	22228(88.34%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8519(91.30%)	812(8.70%)
1		994(46.93%)	1124(53.07%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2700(46.39%)	3120(53.61%)
1		1940(8.42%)	21104(91.58%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2816(74.87%)	945(25.13%)
1		755(11.23%)	5969(88.77%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2145(91.28%)	205(8.72%)
1		274(47.65%)	301(52.35%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		671(47.55%)	740(52.45%)
1		481(7.82%)	5668(92.18%)

-------------------------------- ROUND  9 --------------------------------

Best score for round 9: 0.64
Best parameter for round 9: 1

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11470(74.35%)	3958(25.65%)
1		2916(11.55%)	22332(88.45%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8633(91.00%)	854(9.00%)
1		990(45.71%)	1176(54.29%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2837(47.75%)	3104(52.25%)
1		1926(8.34%)	21156(91.66%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2619(75.17%)	865(24.83%)
1		749(11.28%)	5889(88.72%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2003(91.29%)	191(8.71%)
1		269(51.04%)	258(48.96%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		616(47.75%)	674(52.25%)
1		480(7.85%)	5631(92.15%)

------------------------------------ SUMMARY ------------------------------------

Confusion matrix for all:
TRUE\PRED	0		1
0		74.26 ± 1.70%	25.74 ± 1.70%
1		11.63 ± 0.92%	88.37 ± 0.92%

Confusion matrix for CD:
TRUE\PRED	0		1
0		91.09 ± 0.79%	8.91 ± 0.79%
1		48.11 ± 2.66%	51.89 ± 2.66%

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		47.28 ± 2.46%	52.72 ± 2.46%
1		8.28 ± 0.74%	91.72 ± 0.74%

MCC on train = 0.638 ± 0.011.
MCC on test = 0.633 ± 0.041.
MCC on CDs (test) = 0.449 ± 0.041.
MCC on non-CDs (test) = 0.421 ± 0.041.

F1 on train = 0.868 ± 0.009.
F1 on test = 0.870 ± 0.033.
F1 on CDs (test) = 0.548 ± 0.033.
F1 on non-CDs (test) = 0.897 ± 0.033.

Precision on train = 0.852 ± 0.011.
Precision on test = 0.856 ± 0.054.
Precision on CDs (test) = 0.583 ± 0.054.
Precision on non-CDs (test) = 0.878 ± 0.054.

Recall on train = 0.885 ± 0.008.
Recall on test = 0.884 ± 0.018.
Recall on CDs (test) = 0.519 ± 0.018.
Recall on non-CDs (test) = 0.917 ± 0.018.

Accuracy on train = 0.832 ± 0.008.
Accuracy on test = 0.832 ± 0.029.
Accuracy on CDs (test) = 0.835 ± 0.029.
Accuracy on non-CDs (test) = 0.831 ± 0.029.

ROC-AUC on train = 0.889 ± 0.007.
ROC-AUC on test = 0.889 ± 0.026.
ROC-AUC on CDs (test) = 0.803 ± 0.026.
ROC-AUC on non-CDs (test) = 0.807 ± 0.026.

PR-AUC on train = 0.916 ± 0.010.
PR-AUC on test = 0.918 ± 0.047.
PR-AUC on CDs (test) = 0.585 ± 0.047.
PR-AUC on non-CDs (test) = 0.932 ± 0.047.

#--------------------------------------------------
# FOREST ON STRUCTURAL FEATURES
#--------------------------------------------------

-------------------------------- ROUND  0 --------------------------------

Best score for round 0: 0.49
Best parameter for round 0: 2

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		10409(67.67%)	4973(32.33%)
1		4696(19.28%)	19664(80.72%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		6697(70.56%)	2794(29.44%)
1		725(35.31%)	1328(64.69%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		3712(63.01%)	2179(36.99%)
1		3971(17.80%)	18336(82.20%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2304(65.27%)	1226(34.73%)
1		1279(16.99%)	6247(83.01%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1499(68.45%)	691(31.55%)
1		215(33.59%)	425(66.41%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		805(60.07%)	535(39.93%)
1		1064(15.45%)	5822(84.55%)

-------------------------------- ROUND  1 --------------------------------

Best score for round 1: 0.49
Best parameter for round 1: 1

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		9579(65.40%)	5068(34.60%)
1		4423(17.22%)	21259(82.78%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		6269(68.37%)	2900(31.63%)
1		710(33.55%)	1406(66.45%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		3310(60.42%)	2168(39.58%)
1		3713(15.76%)	19853(84.24%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2849(66.80%)	1416(33.20%)
1		1217(19.62%)	4987(80.38%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1740(69.27%)	772(30.73%)
1		191(33.10%)	386(66.90%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		1109(63.26%)	644(36.74%)
1		1026(18.23%)	4601(81.77%)

-------------------------------- ROUND  2 --------------------------------

Best score for round 2: 0.49
Best parameter for round 2: 4

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		10296(67.29%)	5005(32.71%)
1		4644(18.11%)	21005(81.89%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		6632(69.97%)	2846(30.03%)
1		735(34.03%)	1425(65.97%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		3664(62.92%)	2159(37.08%)
1		3909(16.64%)	19580(83.36%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2416(66.91%)	1195(33.09%)
1		1359(21.79%)	4878(78.21%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1539(69.86%)	664(30.14%)
1		203(38.09%)	330(61.91%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		877(62.29%)	531(37.71%)
1		1156(20.27%)	4548(79.73%)

-------------------------------- ROUND  3 --------------------------------

Best score for round 3: 0.48
Best parameter for round 3: 3

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		10020(67.79%)	4760(32.21%)
1		4843(19.86%)	19543(80.14%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		6419(70.72%)	2658(29.28%)
1		764(36.21%)	1346(63.79%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		3601(63.14%)	2102(36.86%)
1		4079(18.31%)	18197(81.69%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2843(68.80%)	1289(31.20%)
1		1449(19.32%)	6051(80.68%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1856(71.27%)	748(28.73%)
1		202(34.65%)	381(65.35%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		987(64.59%)	541(35.41%)
1		1247(18.03%)	5670(81.97%)

-------------------------------- ROUND  4 --------------------------------

Best score for round 4: 0.49
Best parameter for round 4: 2

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		10358(66.98%)	5107(33.02%)
1		4699(17.94%)	21496(82.06%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		6670(69.89%)	2874(30.11%)
1		767(34.53%)	1454(65.47%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		3688(62.29%)	2233(37.71%)
1		3932(16.40%)	20042(83.60%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2241(65.01%)	1206(34.99%)
1		1157(20.33%)	4534(79.67%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1464(68.51%)	673(31.49%)
1		149(31.57%)	323(68.43%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		777(59.31%)	533(40.69%)
1		1008(19.31%)	4211(80.69%)

-------------------------------- ROUND  5 --------------------------------

Best score for round 5: 0.49
Best parameter for round 5: 3

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		10783(67.68%)	5150(32.32%)
1		4828(19.11%)	20442(80.89%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		6966(70.55%)	2908(29.45%)
1		768(34.77%)	1441(65.23%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		3817(63.00%)	2242(37.00%)
1		4060(17.61%)	19001(82.39%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		1936(64.99%)	1043(35.01%)
1		1125(17.00%)	5491(83.00%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1228(67.96%)	579(32.04%)
1		172(35.54%)	312(64.46%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		708(60.41%)	464(39.59%)
1		953(15.54%)	5179(84.46%)

-------------------------------- ROUND  6 --------------------------------

Best score for round 6: 0.49
Best parameter for round 6: 3

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		9939(67.60%)	4764(32.40%)
1		4831(18.37%)	21466(81.63%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		6472(70.36%)	2726(29.64%)
1		742(34.50%)	1409(65.50%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		3467(62.98%)	2038(37.02%)
1		4089(16.93%)	20057(83.07%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2937(69.78%)	1272(30.22%)
1		1337(23.92%)	4252(76.08%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1801(72.53%)	682(27.47%)
1		191(35.24%)	351(64.76%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		1136(65.82%)	590(34.18%)
1		1146(22.71%)	3901(77.29%)

-------------------------------- ROUND  7 --------------------------------

Best score for round 7: 0.48
Best parameter for round 7: 2

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		10288(67.03%)	5060(32.97%)
1		4841(18.90%)	20779(81.10%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		6600(70.21%)	2800(29.79%)
1		768(35.31%)	1407(64.69%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		3688(62.00%)	2260(38.00%)
1		4073(17.37%)	19372(82.63%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2273(63.78%)	1291(36.22%)
1		988(15.77%)	5278(84.23%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1525(66.86%)	756(33.14%)
1		142(27.41%)	376(72.59%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		748(58.30%)	535(41.70%)
1		846(14.72%)	4902(85.28%)

-------------------------------- ROUND  8 --------------------------------

Best score for round 8: 0.48
Best parameter for round 8: 2

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		10104(66.69%)	5047(33.31%)
1		4734(18.81%)	20428(81.19%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		6502(69.68%)	2829(30.32%)
1		756(35.69%)	1362(64.31%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		3602(61.89%)	2218(38.11%)
1		3978(17.26%)	19066(82.74%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2448(65.09%)	1313(34.91%)
1		1053(15.66%)	5671(84.34%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1602(68.17%)	748(31.83%)
1		153(26.61%)	422(73.39%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		846(59.96%)	565(40.04%)
1		900(14.64%)	5249(85.36%)

-------------------------------- ROUND  9 --------------------------------

Best score for round 9: 0.49
Best parameter for round 9: 7

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		10852(70.34%)	4576(29.66%)
1		5197(20.58%)	20051(79.42%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		6966(73.43%)	2521(26.57%)
1		768(35.46%)	1398(64.54%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		3886(65.41%)	2055(34.59%)
1		4429(19.19%)	18653(80.81%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2342(67.22%)	1142(32.78%)
1		1343(20.23%)	5295(79.77%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1526(69.55%)	668(30.45%)
1		216(40.99%)	311(59.01%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		816(63.26%)	474(36.74%)
1		1127(18.44%)	4984(81.56%)

------------------------------------ SUMMARY ------------------------------------

Confusion matrix for all:
TRUE\PRED	0		1
0		66.36 ± 1.79%	33.64 ± 1.79%
1		19.06 ± 2.56%	80.94 ± 2.56%

Confusion matrix for CD:
TRUE\PRED	0		1
0		69.24 ± 1.58%	30.76 ± 1.58%
1		33.68 ± 4.17%	66.32 ± 4.17%

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		61.73 ± 2.35%	38.27 ± 2.35%
1		17.73 ± 2.51%	82.27 ± 2.51%

MCC on train = 0.488 ± 0.011.
MCC on test = 0.473 ± 0.036.
MCC on CDs (test) = 0.290 ± 0.036.
MCC on non-CDs (test) = 0.395 ± 0.036.

F1 on train = 0.809 ± 0.011.
F1 on test = 0.809 ± 0.043.
F1 on CDs (test) = 0.450 ± 0.043.
F1 on non-CDs (test) = 0.859 ± 0.043.

Precision on train = 0.806 ± 0.012.
Precision on test = 0.808 ± 0.045.
Precision on CDs (test) = 0.341 ± 0.045.
Precision on non-CDs (test) = 0.899 ± 0.045.

Recall on train = 0.812 ± 0.018.
Recall on test = 0.809 ± 0.051.
Recall on CDs (test) = 0.663 ± 0.051.
Recall on non-CDs (test) = 0.823 ± 0.051.

Accuracy on train = 0.760 ± 0.008.
Accuracy on test = 0.757 ± 0.029.
Accuracy on CDs (test) = 0.687 ± 0.029.
Accuracy on non-CDs (test) = 0.784 ± 0.029.

ROC-AUC on train = 0.823 ± 0.005.
ROC-AUC on test = 0.813 ± 0.027.
ROC-AUC on CDs (test) = 0.736 ± 0.027.
ROC-AUC on non-CDs (test) = 0.794 ± 0.027.

PR-AUC on train = 0.886 ± 0.008.
PR-AUC on test = 0.881 ± 0.036.
PR-AUC on CDs (test) = 0.475 ± 0.036.
PR-AUC on non-CDs (test) = 0.935 ± 0.036.

#--------------------------------------------------
# META-BASELINE
#--------------------------------------------------
-------------------------------- ROUND  0 --------------------------------

Best score for round 0: 0.55

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		9467(61.55%)	5915(38.45%)
1		2682(11.01%)	21678(88.99%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		6697(70.56%)	2794(29.44%)
1		725(35.31%)	1328(64.69%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2770(47.02%)	3121(52.98%)
1		1957(8.77%)	20350(91.23%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2182(61.81%)	1348(38.19%)
1		746(9.91%)	6780(90.09%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1499(68.45%)	691(31.55%)
1		215(33.59%)	425(66.41%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		683(50.97%)	657(49.03%)
1		531(7.71%)	6355(92.29%)

-------------------------------- ROUND  1 --------------------------------

Best score for round 1: 0.50

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		8913(60.85%)	5734(39.15%)
1		2554(9.94%)	23128(90.06%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		6269(68.37%)	2900(31.63%)
1		710(33.55%)	1406(66.45%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2644(48.27%)	2834(51.73%)
1		1844(7.82%)	21722(92.18%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2507(58.78%)	1758(41.22%)
1		717(11.56%)	5487(88.44%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1740(69.27%)	772(30.73%)
1		191(33.10%)	386(66.90%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		767(43.75%)	986(56.25%)
1		526(9.35%)	5101(90.65%)

-------------------------------- ROUND  2 --------------------------------

Best score for round 2: 0.53

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		9357(61.15%)	5944(38.85%)
1		2641(10.30%)	23008(89.70%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		6632(69.97%)	2846(30.03%)
1		735(34.03%)	1425(65.97%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2725(46.80%)	3098(53.20%)
1		1906(8.11%)	21583(91.89%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2238(61.98%)	1373(38.02%)
1		701(11.24%)	5536(88.76%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1539(69.86%)	664(30.14%)
1		203(38.09%)	330(61.91%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		699(49.64%)	709(50.36%)
1		498(8.73%)	5206(91.27%)

-------------------------------- ROUND  3 --------------------------------

Best score for round 3: 0.56

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		9095(61.54%)	5685(38.46%)
1		2652(10.88%)	21734(89.12%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		6419(70.72%)	2658(29.28%)
1		764(36.21%)	1346(63.79%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2676(46.92%)	3027(53.08%)
1		1888(8.48%)	20388(91.52%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2574(62.29%)	1558(37.71%)
1		704(9.39%)	6796(90.61%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1856(71.27%)	748(28.73%)
1		202(34.65%)	381(65.35%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		718(46.99%)	810(53.01%)
1		502(7.26%)	6415(92.74%)

-------------------------------- ROUND  4 --------------------------------

Best score for round 4: 0.55

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		9407(60.83%)	6058(39.17%)
1		2722(10.39%)	23473(89.61%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		6670(69.89%)	2874(30.11%)
1		767(34.53%)	1454(65.47%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2737(46.23%)	3184(53.77%)
1		1955(8.15%)	22019(91.85%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2084(60.46%)	1363(39.54%)
1		542(9.52%)	5149(90.48%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1464(68.51%)	673(31.49%)
1		149(31.57%)	323(68.43%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		620(47.33%)	690(52.67%)
1		393(7.53%)	4826(92.47%)

-------------------------------- ROUND  5 --------------------------------

Best score for round 5: 0.53

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		9899(62.13%)	6034(37.87%)
1		2748(10.87%)	22522(89.13%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		6966(70.55%)	2908(29.45%)
1		768(34.77%)	1441(65.23%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2933(48.41%)	3126(51.59%)
1		1980(8.59%)	21081(91.41%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		1814(60.89%)	1165(39.11%)
1		699(10.57%)	5917(89.43%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1228(67.96%)	579(32.04%)
1		172(35.54%)	312(64.46%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		586(50.00%)	586(50.00%)
1		527(8.59%)	5605(91.41%)

-------------------------------- ROUND  6 --------------------------------

Best score for round 6: 0.52

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		9056(61.59%)	5647(38.41%)
1		2574(9.79%)	23723(90.21%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		6472(70.36%)	2726(29.64%)
1		742(34.50%)	1409(65.50%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2584(46.94%)	2921(53.06%)
1		1832(7.59%)	22314(92.41%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2541(60.37%)	1668(39.63%)
1		611(10.93%)	4978(89.07%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1801(72.53%)	682(27.47%)
1		191(35.24%)	351(64.76%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		740(42.87%)	986(57.13%)
1		420(8.32%)	4627(91.68%)

-------------------------------- ROUND  7 --------------------------------

Best score for round 7: 0.51

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		9464(61.66%)	5884(38.34%)
1		2659(10.38%)	22961(89.62%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		6600(70.21%)	2800(29.79%)
1		768(35.31%)	1407(64.69%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2864(48.15%)	3084(51.85%)
1		1891(8.07%)	21554(91.93%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2114(59.32%)	1450(40.68%)
1		694(11.08%)	5572(88.92%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1525(66.86%)	756(33.14%)
1		142(27.41%)	376(72.59%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		589(45.91%)	694(54.09%)
1		552(9.60%)	5196(90.40%)

-------------------------------- ROUND  8 --------------------------------

Best score for round 8: 0.55

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		9202(60.74%)	5949(39.26%)
1		2696(10.71%)	22466(89.29%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		6502(69.68%)	2829(30.32%)
1		756(35.69%)	1362(64.31%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2700(46.39%)	3120(53.61%)
1		1940(8.42%)	21104(91.58%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2273(60.44%)	1488(39.56%)
1		634(9.43%)	6090(90.57%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1602(68.17%)	748(31.83%)
1		153(26.61%)	422(73.39%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		671(47.55%)	740(52.45%)
1		481(7.82%)	5668(92.18%)

-------------------------------- ROUND  9 --------------------------------

Best score for round 9: 0.54

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		9803(63.54%)	5625(36.46%)
1		2694(10.67%)	22554(89.33%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		6966(73.43%)	2521(26.57%)
1		768(35.46%)	1398(64.54%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2837(47.75%)	3104(52.25%)
1		1926(8.34%)	21156(91.66%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2142(61.48%)	1342(38.52%)
1		696(10.49%)	5942(89.51%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1526(69.55%)	668(30.45%)
1		216(40.99%)	311(59.01%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		616(47.75%)	674(52.25%)
1		480(7.85%)	5631(92.15%)

------------------------------------ SUMMARY ------------------------------------

Confusion matrix for all:
TRUE\PRED	0		1
0		60.78 ± 1.09%	39.22 ± 1.09%
1		10.41 ± 0.76%	89.59 ± 0.76%

Confusion matrix for CD:
TRUE\PRED	0		1
0		69.24 ± 1.58%	30.76 ± 1.58%
1		33.68 ± 4.17%	66.32 ± 4.17%

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		47.28 ± 2.46%	52.72 ± 2.46%
1		8.28 ± 0.74%	91.72 ± 0.74%

MCC on train = 0.541 ± 0.015.
MCC on test = 0.535 ± 0.034.
MCC on CDs (test) = 0.290 ± 0.034.
MCC on non-CDs (test) = 0.421 ± 0.034.

F1 on train = 0.842 ± 0.010.
F1 on test = 0.845 ± 0.034.
F1 on CDs (test) = 0.450 ± 0.034.
F1 on non-CDs (test) = 0.897 ± 0.034.

Precision on train = 0.795 ± 0.012.
Precision on test = 0.799 ± 0.054.
Precision on CDs (test) = 0.341 ± 0.054.
Precision on non-CDs (test) = 0.878 ± 0.054.

Recall on train = 0.895 ± 0.008.
Recall on test = 0.896 ± 0.015.
Recall on CDs (test) = 0.663 ± 0.015.
Recall on non-CDs (test) = 0.917 ± 0.015.

Accuracy on train = 0.790 ± 0.009.
Accuracy on test = 0.791 ± 0.030.
Accuracy on CDs (test) = 0.687 ± 0.030.
Accuracy on non-CDs (test) = 0.831 ± 0.030.

ROC-AUC on train = 0.859 ± 0.007.
ROC-AUC on test = 0.858 ± 0.026.
ROC-AUC on CDs (test) = 0.736 ± 0.026.
ROC-AUC on non-CDs (test) = 0.807 ± 0.026.

PR-AUC on train = 0.901 ± 0.011.
PR-AUC on test = 0.904 ± 0.049.
PR-AUC on CDs (test) = 0.475 ± 0.049.
PR-AUC on non-CDs (test) = 0.932 ± 0.049.

#--------------------------------------------------
# FOREST ON 10 FEATURES AND CD-STATUS
#--------------------------------------------------
-------------------------------- ROUND  0 --------------------------------

Best score for round 0: 0.69
Best parameter for round 0: 3

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		12175(79.15%)	3207(20.85%)
1		2516(10.33%)	21844(89.67%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		9133(96.23%)	358(3.77%)
1		1097(53.43%)	956(46.57%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		3042(51.64%)	2849(48.36%)
1		1419(6.36%)	20888(93.64%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2808(79.55%)	722(20.45%)
1		702(9.33%)	6824(90.67%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2106(96.16%)	84(3.84%)
1		351(54.84%)	289(45.16%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		702(52.39%)	638(47.61%)
1		351(5.10%)	6535(94.90%)
-------------------------------- ROUND  1 --------------------------------

Best score for round 1: 0.71
Best parameter for round 1: 3

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11600(79.20%)	3047(20.80%)
1		2369(9.22%)	23313(90.78%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8800(95.98%)	369(4.02%)
1		1130(53.40%)	986(46.60%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2800(51.11%)	2678(48.89%)
1		1239(5.26%)	22327(94.74%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		3235(75.85%)	1030(24.15%)
1		649(10.46%)	5555(89.54%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2413(96.06%)	99(3.94%)
1		322(55.81%)	255(44.19%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		822(46.89%)	931(53.11%)
1		327(5.81%)	5300(94.19%)
-------------------------------- ROUND  2 --------------------------------

Best score for round 2: 0.70
Best parameter for round 2: 3

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		12080(78.95%)	3221(21.05%)
1		2491(9.71%)	23158(90.29%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		9067(95.66%)	411(4.34%)
1		1125(52.08%)	1035(47.92%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		3013(51.74%)	2810(48.26%)
1		1366(5.82%)	22123(94.18%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2861(79.23%)	750(20.77%)
1		707(11.34%)	5530(88.66%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2129(96.64%)	74(3.36%)
1		314(58.91%)	219(41.09%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		732(51.99%)	676(48.01%)
1		393(6.89%)	5311(93.11%)
-------------------------------- ROUND  3 --------------------------------

Best score for round 3: 0.69
Best parameter for round 3: 2

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11570(78.28%)	3210(21.72%)
1		2479(10.17%)	21907(89.83%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8695(95.79%)	382(4.21%)
1		1130(53.55%)	980(46.45%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2875(50.41%)	2828(49.59%)
1		1349(6.06%)	20927(93.94%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		3314(80.20%)	818(19.80%)
1		628(8.37%)	6872(91.63%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2511(96.43%)	93(3.57%)
1		295(50.60%)	288(49.40%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		803(52.55%)	725(47.45%)
1		333(4.81%)	6584(95.19%)
-------------------------------- ROUND  4 --------------------------------

Best score for round 4: 0.69
Best parameter for round 4: 3

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		12178(78.75%)	3287(21.25%)
1		2607(9.95%)	23588(90.05%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		9138(95.75%)	406(4.25%)
1		1176(52.95%)	1045(47.05%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		3040(51.34%)	2881(48.66%)
1		1431(5.97%)	22543(94.03%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2721(78.94%)	726(21.06%)
1		574(10.09%)	5117(89.91%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2052(96.02%)	85(3.98%)
1		255(54.03%)	217(45.97%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		669(51.07%)	641(48.93%)
1		319(6.11%)	4900(93.89%)
-------------------------------- ROUND  5 --------------------------------

Best score for round 5: 0.70
Best parameter for round 5: 1

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		12609(79.14%)	3324(20.86%)
1		2559(10.13%)	22711(89.87%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		9463(95.84%)	411(4.16%)
1		1142(51.70%)	1067(48.30%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		3146(51.92%)	2913(48.08%)
1		1417(6.14%)	21644(93.86%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2336(78.42%)	643(21.58%)
1		606(9.16%)	6010(90.84%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1723(95.35%)	84(4.65%)
1		256(52.89%)	228(47.11%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		613(52.30%)	559(47.70%)
1		350(5.71%)	5782(94.29%)
-------------------------------- ROUND  6 --------------------------------

Best score for round 6: 0.71
Best parameter for round 6: 2

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11603(78.92%)	3100(21.08%)
1		2335(8.88%)	23962(91.12%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8811(95.79%)	387(4.21%)
1		1125(52.30%)	1026(47.70%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2792(50.72%)	2713(49.28%)
1		1210(5.01%)	22936(94.99%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		3145(74.72%)	1064(25.28%)
1		619(11.08%)	4970(88.92%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2374(95.61%)	109(4.39%)
1		278(51.29%)	264(48.71%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		771(44.67%)	955(55.33%)
1		341(6.76%)	4706(93.24%)
-------------------------------- ROUND  7 --------------------------------

Best score for round 7: 0.70
Best parameter for round 7: 2

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		12126(79.01%)	3222(20.99%)
1		2574(10.05%)	23046(89.95%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		9036(96.13%)	364(3.87%)
1		1153(53.01%)	1022(46.99%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		3090(51.95%)	2858(48.05%)
1		1421(6.06%)	22024(93.94%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2823(79.21%)	741(20.79%)
1		591(9.43%)	5675(90.57%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2178(95.48%)	103(4.52%)
1		274(52.90%)	244(47.10%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		645(50.27%)	638(49.73%)
1		317(5.51%)	5431(94.49%)
-------------------------------- ROUND  8 --------------------------------

Best score for round 8: 0.69
Best parameter for round 8: 2

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11894(78.50%)	3257(21.50%)
1		2474(9.83%)	22688(90.17%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8948(95.90%)	383(4.10%)
1		1132(53.45%)	986(46.55%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2946(50.62%)	2874(49.38%)
1		1342(5.82%)	21702(94.18%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2965(78.84%)	796(21.16%)
1		592(8.80%)	6132(91.20%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2251(95.79%)	99(4.21%)
1		287(49.91%)	288(50.09%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		714(50.60%)	697(49.40%)
1		305(4.96%)	5844(95.04%)
-------------------------------- ROUND  9 --------------------------------

Best score for round 9: 0.70
Best parameter for round 9: 1

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		12136(78.66%)	3292(21.34%)
1		2462(9.75%)	22786(90.25%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		9069(95.59%)	418(4.41%)
1		1093(50.46%)	1073(49.54%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		3067(51.62%)	2874(48.38%)
1		1369(5.93%)	21713(94.07%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2763(79.31%)	721(20.69%)
1		660(9.94%)	5978(90.06%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2106(95.99%)	88(4.01%)
1		293(55.60%)	234(44.40%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		657(50.93%)	633(49.07%)
1		367(6.01%)	5744(93.99%)

------------------------------------ SUMMARY ------------------------------------

Confusion matrix for all:
TRUE\PRED	0		1
0		78.43 ± 1.65%	21.57 ± 1.65%
1		9.80 ± 0.91%	90.20 ± 0.91%

Confusion matrix for CD:
TRUE\PRED	0		1
0		95.95 ± 0.39%	4.05 ± 0.39%
1		53.68 ± 2.60%	46.32 ± 2.60%

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		50.37 ± 2.46%	49.63 ± 2.46%
1		5.77 ± 0.67%	94.23 ± 0.67%

MCC on train = 0.698 ± 0.012.
MCC on test = 0.692 ± 0.043.
MCC on CDs (test) = 0.509 ± 0.043.
MCC on non-CDs (test) = 0.501 ± 0.043.

F1 on train = 0.889 ± 0.009.
F1 on test = 0.890 ± 0.032.
F1 on CDs (test) = 0.567 ± 0.032.
F1 on non-CDs (test) = 0.913 ± 0.032.

Precision on train = 0.877 ± 0.009.
Precision on test = 0.879 ± 0.049.
Precision on CDs (test) = 0.733 ± 0.049.
Precision on non-CDs (test) = 0.887 ± 0.049.

Recall on train = 0.902 ± 0.008.
Recall on test = 0.902 ± 0.018.
Recall on CDs (test) = 0.463 ± 0.018.
Recall on non-CDs (test) = 0.942 ± 0.018.

Accuracy on train = 0.860 ± 0.008.
Accuracy on test = 0.859 ± 0.029.
Accuracy on CDs (test) = 0.863 ± 0.029.
Accuracy on non-CDs (test) = 0.857 ± 0.029.

ROC-AUC on train = 0.918 ± 0.004.
ROC-AUC on test = 0.917 ± 0.019.
ROC-AUC on CDs (test) = 0.825 ± 0.019.
ROC-AUC on non-CDs (test) = 0.857 ± 0.019.

PR-AUC on train = 0.941 ± 0.006.
PR-AUC on test = 0.941 ± 0.031.
PR-AUC on CDs (test) = 0.644 ± 0.031.
PR-AUC on non-CDs (test) = 0.952 ± 0.031.

#--------------------------------------------------
# META-LOGREG 1
#--------------------------------------------------
-------------------------------- ROUND  0 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    6.0s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    6.0s finished

Best score for round 0: 0.49
Best parameter for round 0: [1.62377674]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11490(74.70%)	3892(25.30%)
1		2788(11.44%)	21572(88.56%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		9318(98.18%)	173(1.82%)
1		1614(78.62%)	439(21.38%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2172(36.87%)	3719(63.13%)
1		1174(5.26%)	21133(94.74%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2674(75.75%)	856(24.25%)
1		817(10.86%)	6709(89.14%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2132(97.35%)	58(2.65%)
1		506(79.06%)	134(20.94%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		542(40.45%)	798(59.55%)
1		311(4.52%)	6575(95.48%)
-------------------------------- ROUND  1 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    5.4s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    5.4s finished

Best score for round 1: 0.49
Best parameter for round 1: [29.76351442]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11069(75.57%)	3578(24.43%)
1		2845(11.08%)	22837(88.92%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8994(98.09%)	175(1.91%)
1		1731(81.81%)	385(18.19%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2075(37.88%)	3403(62.12%)
1		1114(4.73%)	22452(95.27%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		3057(71.68%)	1208(28.32%)
1		768(12.38%)	5436(87.62%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2480(98.73%)	32(1.27%)
1		484(83.88%)	93(16.12%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		577(32.92%)	1176(67.08%)
1		284(5.05%)	5343(94.95%)
-------------------------------- ROUND  2 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    5.5s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    5.5s finished

Best score for round 2: 0.49
Best parameter for round 2: [1.62377674]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11424(74.66%)	3877(25.34%)
1		2870(11.19%)	22779(88.81%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		9258(97.68%)	220(2.32%)
1		1691(78.29%)	469(21.71%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2166(37.20%)	3657(62.80%)
1		1179(5.02%)	22310(94.98%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2719(75.30%)	892(24.70%)
1		758(12.15%)	5479(87.85%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2166(98.32%)	37(1.68%)
1		446(83.68%)	87(16.32%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		553(39.28%)	855(60.72%)
1		312(5.47%)	5392(94.53%)
-------------------------------- ROUND  3 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    5.4s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    5.4s finished

Best score for round 3: 0.48
Best parameter for round 3: [1.62377674]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		10990(74.36%)	3790(25.64%)
1		2862(11.74%)	21524(88.26%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8882(97.85%)	195(2.15%)
1		1712(81.14%)	398(18.86%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2108(36.96%)	3595(63.04%)
1		1150(5.16%)	21126(94.84%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		3145(76.11%)	987(23.89%)
1		750(10.00%)	6750(90.00%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2572(98.77%)	32(1.23%)
1		478(81.99%)	105(18.01%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		573(37.50%)	955(62.50%)
1		272(3.93%)	6645(96.07%)
-------------------------------- ROUND  4 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    5.6s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    5.6s finished

Best score for round 4: 0.49
Best parameter for round 4: [0.61584821]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11488(74.28%)	3977(25.72%)
1		2907(11.10%)	23288(88.90%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		9357(98.04%)	187(1.96%)
1		1761(79.29%)	460(20.71%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2131(35.99%)	3790(64.01%)
1		1146(4.78%)	22828(95.22%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2583(74.93%)	864(25.07%)
1		588(10.33%)	5103(89.67%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2092(97.89%)	45(2.11%)
1		364(77.12%)	108(22.88%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		491(37.48%)	819(62.52%)
1		224(4.29%)	4995(95.71%)
-------------------------------- ROUND  5 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    5.8s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    5.8s finished

Best score for round 5: 0.49
Best parameter for round 5: [4.2813324]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11959(75.06%)	3974(24.94%)
1		2918(11.55%)	22352(88.45%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		9653(97.76%)	221(2.24%)
1		1716(77.68%)	493(22.32%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2306(38.06%)	3753(61.94%)
1		1202(5.21%)	21859(94.79%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2229(74.82%)	750(25.18%)
1		709(10.72%)	5907(89.28%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1759(97.34%)	48(2.66%)
1		389(80.37%)	95(19.63%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		470(40.10%)	702(59.90%)
1		320(5.22%)	5812(94.78%)
-------------------------------- ROUND  6 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    5.5s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    5.5s finished

Best score for round 6: 0.49
Best parameter for round 6: [29.76351442]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11040(75.09%)	3663(24.91%)
1		2822(10.73%)	23475(89.27%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8995(97.79%)	203(2.21%)
1		1718(79.87%)	433(20.13%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2045(37.15%)	3460(62.85%)
1		1104(4.57%)	23042(95.43%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		3016(71.66%)	1193(28.34%)
1		694(12.42%)	4895(87.58%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2446(98.51%)	37(1.49%)
1		439(81.00%)	103(19.00%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		570(33.02%)	1156(66.98%)
1		255(5.05%)	4792(94.95%)
-------------------------------- ROUND  7 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    5.5s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    5.5s finished

Best score for round 7: 0.48
Best parameter for round 7: [1.62377674]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11517(75.04%)	3831(24.96%)
1		2886(11.26%)	22734(88.74%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		9206(97.94%)	194(2.06%)
1		1713(78.76%)	462(21.24%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2311(38.85%)	3637(61.15%)
1		1173(5.00%)	22272(95.00%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2719(76.29%)	845(23.71%)
1		728(11.62%)	5538(88.38%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2232(97.85%)	49(2.15%)
1		397(76.64%)	121(23.36%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		487(37.96%)	796(62.04%)
1		331(5.76%)	5417(94.24%)
-------------------------------- ROUND  8 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    5.5s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    5.5s finished

Best score for round 8: 0.48
Best parameter for round 8: [4.2813324]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11282(74.46%)	3869(25.54%)
1		2855(11.35%)	22307(88.65%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		9140(97.95%)	191(2.05%)
1		1684(79.51%)	434(20.49%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2142(36.80%)	3678(63.20%)
1		1171(5.08%)	21873(94.92%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2844(75.62%)	917(24.38%)
1		725(10.78%)	5999(89.22%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2308(98.21%)	42(1.79%)
1		453(78.78%)	122(21.22%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		536(37.99%)	875(62.01%)
1		272(4.42%)	5877(95.58%)
-------------------------------- ROUND  9 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    5.8s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    5.8s finished

Best score for round 9: 0.49
Best parameter for round 9: [4.2813324]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11466(74.32%)	3962(25.68%)
1		2791(11.05%)	22457(88.95%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		9209(97.07%)	278(2.93%)
1		1588(73.31%)	578(26.69%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2257(37.99%)	3684(62.01%)
1		1203(5.21%)	21879(94.79%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2619(75.17%)	865(24.83%)
1		725(10.92%)	5913(89.08%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2123(96.76%)	71(3.24%)
1		422(80.08%)	105(19.92%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		496(38.45%)	794(61.55%)
1		303(4.96%)	5808(95.04%)

------------------------------------ SUMMARY ------------------------------------

Confusion matrix for all:
TRUE\PRED	0		1
0		74.73 ± 1.60%	25.27 ± 1.60%
1		11.22 ± 0.82%	88.78 ± 0.82%

Confusion matrix for CD:
TRUE\PRED	0		1
0		97.97 ± 0.63%	2.03 ± 0.63%
1		80.26 ± 2.34%	19.74 ± 2.34%

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		37.51 ± 2.47%	62.49 ± 2.47%
1		4.87 ± 0.54%	95.13 ± 0.54%

MCC on train = 0.644 ± 0.010.
MCC on test = 0.643 ± 0.041.
MCC on CDs (test) = 0.309 ± 0.041.
MCC on non-CDs (test) = 0.408 ± 0.041.

F1 on train = 0.871 ± 0.008.
F1 on test = 0.873 ± 0.033.
F1 on CDs (test) = 0.307 ± 0.033.
F1 on non-CDs (test) = 0.905 ± 0.033.

Precision on train = 0.854 ± 0.012.
Precision on test = 0.859 ± 0.052.
Precision on CDs (test) = 0.707 ± 0.052.
Precision on non-CDs (test) = 0.863 ± 0.052.

Recall on train = 0.888 ± 0.005.
Recall on test = 0.888 ± 0.016.
Recall on CDs (test) = 0.197 ± 0.016.
Recall on non-CDs (test) = 0.951 ± 0.016.

Accuracy on train = 0.835 ± 0.007.
Accuracy on test = 0.837 ± 0.029.
Accuracy on CDs (test) = 0.828 ± 0.029.
Accuracy on non-CDs (test) = 0.839 ± 0.029.

ROC-AUC on train = 0.889 ± 0.007.
ROC-AUC on test = 0.889 ± 0.027.
ROC-AUC on CDs (test) = 0.736 ± 0.027.
ROC-AUC on non-CDs (test) = 0.807 ± 0.027.

PR-AUC on train = 0.917 ± 0.010.
PR-AUC on test = 0.919 ± 0.048.
PR-AUC on CDs (test) = 0.475 ± 0.048.
PR-AUC on non-CDs (test) = 0.932 ± 0.048.

#--------------------------------------------------
# META-LOGREG 2
#--------------------------------------------------
-------------------------------- ROUND  0 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    6.1s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    6.1s finished

Best score for round 0: 0.49
Best parameter for round 0: [0.23357215]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11906(77.40%)	3476(22.60%)
1		2363(9.70%)	21997(90.30%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		9189(96.82%)	302(3.18%)
1		1176(57.28%)	877(42.72%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2717(46.12%)	3174(53.88%)
1		1187(5.32%)	21120(94.68%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2772(78.53%)	758(21.47%)
1		662(8.80%)	6864(91.20%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2122(96.89%)	68(3.11%)
1		366(57.19%)	274(42.81%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		650(48.51%)	690(51.49%)
1		296(4.30%)	6590(95.70%)
-------------------------------- ROUND  1 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    6.0s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    6.0s finished

Best score for round 1: 0.49
Best parameter for round 1: [0.23357215]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11314(77.24%)	3333(22.76%)
1		2241(8.73%)	23441(91.27%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8843(96.44%)	326(3.56%)
1		1199(56.66%)	917(43.34%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2471(45.11%)	3007(54.89%)
1		1042(4.42%)	22524(95.58%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		3163(74.16%)	1102(25.84%)
1		625(10.07%)	5579(89.93%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2434(96.89%)	78(3.11%)
1		330(57.19%)	247(42.81%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		729(41.59%)	1024(58.41%)
1		295(5.24%)	5332(94.76%)
-------------------------------- ROUND  2 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    6.0s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    6.0s finished

Best score for round 2: 0.49
Best parameter for round 2: [4.2813324]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11823(77.27%)	3478(22.73%)
1		2336(9.11%)	23313(90.89%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		9120(96.22%)	358(3.78%)
1		1181(54.68%)	979(45.32%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2703(46.42%)	3120(53.58%)
1		1155(4.92%)	22334(95.08%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2810(77.82%)	801(22.18%)
1		669(10.73%)	5568(89.27%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2137(97.00%)	66(3.00%)
1		324(60.79%)	209(39.21%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		673(47.80%)	735(52.20%)
1		345(6.05%)	5359(93.95%)
-------------------------------- ROUND  3 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    5.9s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    5.9s finished

Best score for round 3: 0.48
Best parameter for round 3: [0.23357215]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11313(76.54%)	3467(23.46%)
1		2304(9.45%)	22082(90.55%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8734(96.22%)	343(3.78%)
1		1180(55.92%)	930(44.08%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2579(45.22%)	3124(54.78%)
1		1124(5.05%)	21152(94.95%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		3228(78.12%)	904(21.88%)
1		624(8.32%)	6876(91.68%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2522(96.85%)	82(3.15%)
1		313(53.69%)	270(46.31%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		706(46.20%)	822(53.80%)
1		311(4.50%)	6606(95.50%)
-------------------------------- ROUND  4 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    5.9s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    5.9s finished

Best score for round 4: 0.49
Best parameter for round 4: [0.08858668]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11878(76.81%)	3587(23.19%)
1		2413(9.21%)	23782(90.79%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		9222(96.63%)	322(3.37%)
1		1271(57.23%)	950(42.77%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2656(44.86%)	3265(55.14%)
1		1142(4.76%)	22832(95.24%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2663(77.26%)	784(22.74%)
1		546(9.59%)	5145(90.41%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2071(96.91%)	66(3.09%)
1		269(56.99%)	203(43.01%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		592(45.19%)	718(54.81%)
1		277(5.31%)	4942(94.69%)
-------------------------------- ROUND  5 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    5.9s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    5.9s finished

Best score for round 5: 0.49
Best parameter for round 5: [0.03359818]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		12329(77.38%)	3604(22.62%)
1		2411(9.54%)	22859(90.46%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		9623(97.46%)	251(2.54%)
1		1314(59.48%)	895(40.52%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2706(44.66%)	3353(55.34%)
1		1097(4.76%)	21964(95.24%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2306(77.41%)	673(22.59%)
1		557(8.42%)	6059(91.58%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		1761(97.45%)	46(2.55%)
1		308(63.64%)	176(36.36%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		545(46.50%)	627(53.50%)
1		249(4.06%)	5883(95.94%)
-------------------------------- ROUND  6 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    6.3s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    6.3s finished

Best score for round 6: 0.49
Best parameter for round 6: [11.28837892]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11343(77.15%)	3360(22.85%)
1		2292(8.72%)	24005(91.28%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8851(96.23%)	347(3.77%)
1		1213(56.39%)	938(43.61%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2492(45.27%)	3013(54.73%)
1		1079(4.47%)	23067(95.53%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		3100(73.65%)	1109(26.35%)
1		570(10.20%)	5019(89.80%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2384(96.01%)	99(3.99%)
1		282(52.03%)	260(47.97%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		716(41.48%)	1010(58.52%)
1		288(5.71%)	4759(94.29%)
-------------------------------- ROUND  7 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    6.0s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    6.0s finished

Best score for round 7: 0.48
Best parameter for round 7: [0.23357215]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11793(76.84%)	3555(23.16%)
1		2395(9.35%)	23225(90.65%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		9064(96.43%)	336(3.57%)
1		1213(55.77%)	962(44.23%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2729(45.88%)	3219(54.12%)
1		1182(5.04%)	22263(94.96%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2758(77.38%)	806(22.62%)
1		580(9.26%)	5686(90.74%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2184(95.75%)	97(4.25%)
1		292(56.37%)	226(43.63%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		574(44.74%)	709(55.26%)
1		288(5.01%)	5460(94.99%)
-------------------------------- ROUND  8 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    6.0s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    6.0s finished

Best score for round 8: 0.48
Best parameter for round 8: [1.62377674]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11634(76.79%)	3517(23.21%)
1		2367(9.41%)	22795(90.59%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		8994(96.39%)	337(3.61%)
1		1195(56.42%)	923(43.58%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2640(45.36%)	3180(54.64%)
1		1172(5.09%)	21872(94.91%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2918(77.59%)	843(22.41%)
1		583(8.67%)	6141(91.33%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2272(96.68%)	78(3.32%)
1		314(54.61%)	261(45.39%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		646(45.78%)	765(54.22%)
1		269(4.37%)	5880(95.63%)
-------------------------------- ROUND  9 --------------------------------
[Parallel(n_jobs=-1)]: Using backend LokyBackend with 2 concurrent workers.
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    5.9s remaining:    0.0s
[Parallel(n_jobs=-1)]: Done  10 out of  10 | elapsed:    5.9s finished

Best score for round 9: 0.49
Best parameter for round 9: [11.28837892]

PREDICTIONS ON TRAIN:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		11945(77.42%)	3483(22.58%)
1		2357(9.34%)	22891(90.66%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		9149(96.44%)	338(3.56%)
1		1154(53.28%)	1012(46.72%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		2796(47.06%)	3145(52.94%)
1		1203(5.21%)	21879(94.79%)

PREDICTIONS ON TEST:
-------------------------------
Confusion matrix for all:
TRUE\PRED	0		1
0		2717(77.99%)	767(22.01%)
1		627(9.45%)	6011(90.55%)

Confusion matrix for CD:
TRUE\PRED	0		1
0		2108(96.08%)	86(3.92%)
1		312(59.20%)	215(40.80%)

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		609(47.21%)	681(52.79%)
1		315(5.15%)	5796(94.85%)

------------------------------------ SUMMARY ------------------------------------

Confusion matrix for all:
TRUE\PRED	0		1
0		76.99 ± 1.59%	23.01 ± 1.59%
1		9.35 ± 0.77%	90.65 ± 0.77%

Confusion matrix for CD:
TRUE\PRED	0		1
0		96.65 ± 0.50%	3.35 ± 0.50%
1		57.17 ± 3.24%	42.83 ± 3.24%

Confusion matrix for non-CD:
TRUE\PRED	0		1
0		45.50 ± 2.26%	54.50 ± 2.26%
1		4.97 ± 0.62%	95.03 ± 0.62%

MCC on train = 0.690 ± 0.009.
MCC on test = 0.686 ± 0.038.
MCC on CDs (test) = 0.498 ± 0.038.
MCC on non-CDs (test) = 0.478 ± 0.038.

F1 on train = 0.888 ± 0.008.
F1 on test = 0.889 ± 0.032.
F1 on CDs (test) = 0.545 ± 0.032.
F1 on non-CDs (test) = 0.913 ± 0.032.

Precision on train = 0.869 ± 0.009.
Precision on test = 0.872 ± 0.050.
Precision on CDs (test) = 0.754 ± 0.050.
Precision on non-CDs (test) = 0.878 ± 0.050.

Recall on train = 0.907 ± 0.006.
Recall on test = 0.906 ± 0.015.
Recall on CDs (test) = 0.428 ± 0.015.
Recall on non-CDs (test) = 0.950 ± 0.015.

Accuracy on train = 0.856 ± 0.006.
Accuracy on test = 0.857 ± 0.028.
Accuracy on CDs (test) = 0.862 ± 0.028.
Accuracy on non-CDs (test) = 0.854 ± 0.028.

ROC-AUC on train = 0.919 ± 0.004.
ROC-AUC on test = 0.916 ± 0.016.
ROC-AUC on CDs (test) = 0.819 ± 0.016.
ROC-AUC on non-CDs (test) = 0.855 ± 0.016.

PR-AUC on train = 0.944 ± 0.006.
PR-AUC on test = 0.943 ± 0.025.
PR-AUC on CDs (test) = 0.644 ± 0.025.
PR-AUC on non-CDs (test) = 0.954 ± 0.025.
