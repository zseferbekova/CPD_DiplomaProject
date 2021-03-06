# Изображения
Данная директория содержит изображения распределений признаков, полученные в ходе работы над проектом.
Названия изображений соответствуют названию изображённого на них признака.

1) `CV_Path_vs_Ben/` - распределения признаков при противопоставлении безвредных и патогенных замен. 
2) `CV_StrClass/` - распределения признаков при противопоставлении безвредных и патогенных замен внутри
четырех структурных классов замен, изображения для каждой группы находятся в отдельной 
директории: ядро (`Core/`), поверхность (`Surface/`), белок-белковые взаимодействия
(`Protein_interaction/`) и иные взаимодействия (`Other_interaction/`).
3) `CV_CPD/` - распределения признаков при разделении замен на безвредные/патогенные и 
компенсированные/некомпенсированные. Содержит 5 директорий с графиками для:
- `PCPD_PnCPD/` - патогенных компенсированных и некомпенсированных замен;
- `PCPD_BCPD/`- компенсированных патогенных и безвредных замен;
- `BCPD_BnCPD/` - безвредных компенсированных и некомпенсированных замен;
- `PCPD_B/` - компенсированных патогенных и всех безвредных замен;
- `PCPD_BnCPD/` - компенсированных патогенных и некомпенсированных безвредных замен.
