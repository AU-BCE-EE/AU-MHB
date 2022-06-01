---
title: 'Model call record'
output: pdf_document
classoption: landscape
author: Sasha D. Hafner
date: "27 May, 2022"
---

Calculates emission factors

Check package version.


```r
packageVersion('ALFAM2')
```

```
## [1] '2.1.1'
```

Parameter values.


```r
ALFAM2pars02
```

```
##            int.f0    app.mthd.os.f0    app.rate.ni.f0         man.dm.f0 
##       -0.60568338       -1.74351499       -0.01114900        0.39967070 
## man.source.pig.f0    app.mthd.cs.f0            int.r1    app.mthd.bc.r1 
##       -0.59202858       -7.63373787       -0.93921516        0.79352480 
##         man.dm.r1       air.temp.r1        wind.2m.r1    app.mthd.ts.r1 
##       -0.13988189        0.07354268        0.15026720       -0.45907135 
## ts.cereal.hght.r1         man.ph.r1            int.r2      rain.rate.r2 
##       -0.24471238        0.66500000       -1.79918546        0.39402156 
##            int.r3    app.mthd.bc.r3    app.mthd.cs.r3         man.ph.r3 
##       -3.22841225        0.56153956       -0.66647417        0.23800000 
## incorp.shallow.f4 incorp.shallow.r3    incorp.deep.f4    incorp.deep.r3 
##       -0.96496655       -0.58052689       -3.69494954       -1.26569562
```

Run model 

With set 2 parameters


```r
refpreds <- alfam2(refdat, pars = ALFAM2pars02, app.name = 'tan.app', time.name = 'ct', group = 'id', warn = TRUE, prep = TRUE)
```

```
## User-supplied parameters are being used.
```

```
## Warning in alfam2(refdat, pars = ALFAM2pars02, app.name = "tan.app", time.name = "ct", : Running with 15 parameters. Dropped 9 with no match.
## These secondary parameters have been dropped:
##   app.mthd.cs.f0
##   app.mthd.bc.r1
##   ts.cereal.hght.r1
##   app.mthd.bc.r3
##   app.mthd.cs.r3
##   incorp.shallow.f4
##   incorp.shallow.r3
##   incorp.deep.f4
##   incorp.deep.r3
## 
## These secondary parameters are being used:
##   int.f0
##   app.mthd.os.f0
##   app.rate.ni.f0
##   man.dm.f0
##   man.source.pig.f0
##   int.r1
##   man.dm.r1
##   air.temp.r1
##   wind.2m.r1
##   app.mthd.ts.r1
##   man.ph.r1
##   int.r2
##   rain.rate.r2
##   int.r3
##   man.ph.r3
```

```r
lfpreds <- alfam2(lfdat, pars = ALFAM2pars02, app.name = 'tan.app', time.name = 'ct', group = 'id', warn = TRUE, prep = TRUE)
```

```
## User-supplied parameters are being used.
```

```
## Warning in alfam2(lfdat, pars = ALFAM2pars02, app.name = "tan.app", time.name = "ct", : Running with 15 parameters. Dropped 9 with no match.
## These secondary parameters have been dropped:
##   app.mthd.cs.f0
##   app.mthd.bc.r1
##   ts.cereal.hght.r1
##   app.mthd.bc.r3
##   app.mthd.cs.r3
##   incorp.shallow.f4
##   incorp.shallow.r3
##   incorp.deep.f4
##   incorp.deep.r3
## 
## These secondary parameters are being used:
##   int.f0
##   app.mthd.os.f0
##   app.rate.ni.f0
##   man.dm.f0
##   man.source.pig.f0
##   int.r1
##   man.dm.r1
##   air.temp.r1
##   wind.2m.r1
##   app.mthd.ts.r1
##   man.ph.r1
##   int.r2
##   rain.rate.r2
##   int.r3
##   man.ph.r3
```

```r
sfpreds <- alfam2(sfdat, pars = ALFAM2pars02, app.name = 'tan.app', time.name = 'ct', 
                     time.incorp = 't.incorp', group = 'id', warn = TRUE, prep = TRUE)
```

```
## User-supplied parameters are being used.
```

```
## Incorporation applied (for group sep 10).
```

```
## Incorporation applied (for group sep 100).
```

```
## Incorporation applied (for group sep 1000).
```

```
## Incorporation applied (for group sep 1001).
```

```
## Incorporation applied (for group sep 1002).
```

```
## Incorporation applied (for group sep 1006).
```

```
## Incorporation applied (for group sep 1007).
```

```
## Incorporation applied (for group sep 1008).
```

```
## Incorporation applied (for group sep 101).
```

```
## Incorporation applied (for group sep 1012).
```

```
## Incorporation applied (for group sep 1013).
```

```
## Incorporation applied (for group sep 1014).
```

```
## Incorporation applied (for group sep 1018).
```

```
## Incorporation applied (for group sep 1019).
```

```
## Incorporation applied (for group sep 102).
```

```
## Incorporation applied (for group sep 1020).
```

```
## Incorporation applied (for group sep 1024).
```

```
## Incorporation applied (for group sep 1025).
```

```
## Incorporation applied (for group sep 1026).
```

```
## Incorporation applied (for group sep 1030).
```

```
## Incorporation applied (for group sep 1031).
```

```
## Incorporation applied (for group sep 1032).
```

```
## Incorporation applied (for group sep 1036).
```

```
## Incorporation applied (for group sep 1037).
```

```
## Incorporation applied (for group sep 1038).
```

```
## Incorporation applied (for group sep 1042).
```

```
## Incorporation applied (for group sep 1043).
```

```
## Incorporation applied (for group sep 1044).
```

```
## Incorporation applied (for group sep 1048).
```

```
## Incorporation applied (for group sep 1049).
```

```
## Incorporation applied (for group sep 1050).
```

```
## Incorporation applied (for group sep 1054).
```

```
## Incorporation applied (for group sep 1055).
```

```
## Incorporation applied (for group sep 1056).
```

```
## Incorporation applied (for group sep 106).
```

```
## Incorporation applied (for group sep 1060).
```

```
## Incorporation applied (for group sep 1061).
```

```
## Incorporation applied (for group sep 1062).
```

```
## Incorporation applied (for group sep 1066).
```

```
## Incorporation applied (for group sep 1067).
```

```
## Incorporation applied (for group sep 1068).
```

```
## Incorporation applied (for group sep 107).
```

```
## Incorporation applied (for group sep 1072).
```

```
## Incorporation applied (for group sep 1073).
```

```
## Incorporation applied (for group sep 1074).
```

```
## Incorporation applied (for group sep 1078).
```

```
## Incorporation applied (for group sep 1079).
```

```
## Incorporation applied (for group sep 108).
```

```
## Incorporation applied (for group sep 1080).
```

```
## Incorporation applied (for group sep 1084).
```

```
## Incorporation applied (for group sep 1085).
```

```
## Incorporation applied (for group sep 1086).
```

```
## Incorporation applied (for group sep 1090).
```

```
## Incorporation applied (for group sep 1091).
```

```
## Incorporation applied (for group sep 1092).
```

```
## Incorporation applied (for group sep 1096).
```

```
## Incorporation applied (for group sep 1097).
```

```
## Incorporation applied (for group sep 1098).
```

```
## Incorporation applied (for group sep 11).
```

```
## Incorporation applied (for group sep 1102).
```

```
## Incorporation applied (for group sep 1103).
```

```
## Incorporation applied (for group sep 1104).
```

```
## Incorporation applied (for group sep 1108).
```

```
## Incorporation applied (for group sep 1109).
```

```
## Incorporation applied (for group sep 1110).
```

```
## Incorporation applied (for group sep 1114).
```

```
## Incorporation applied (for group sep 1115).
```

```
## Incorporation applied (for group sep 1116).
```

```
## Incorporation applied (for group sep 112).
```

```
## Incorporation applied (for group sep 1120).
```

```
## Incorporation applied (for group sep 1121).
```

```
## Incorporation applied (for group sep 1122).
```

```
## Incorporation applied (for group sep 1126).
```

```
## Incorporation applied (for group sep 1127).
```

```
## Incorporation applied (for group sep 1128).
```

```
## Incorporation applied (for group sep 113).
```

```
## Incorporation applied (for group sep 1132).
```

```
## Incorporation applied (for group sep 1133).
```

```
## Incorporation applied (for group sep 1134).
```

```
## Incorporation applied (for group sep 1138).
```

```
## Incorporation applied (for group sep 1139).
```

```
## Incorporation applied (for group sep 114).
```

```
## Incorporation applied (for group sep 1140).
```

```
## Incorporation applied (for group sep 1144).
```

```
## Incorporation applied (for group sep 1145).
```

```
## Incorporation applied (for group sep 1146).
```

```
## Incorporation applied (for group sep 1150).
```

```
## Incorporation applied (for group sep 1151).
```

```
## Incorporation applied (for group sep 1152).
```

```
## Incorporation applied (for group sep 1156).
```

```
## Incorporation applied (for group sep 1157).
```

```
## Incorporation applied (for group sep 1158).
```

```
## Incorporation applied (for group sep 1162).
```

```
## Incorporation applied (for group sep 1163).
```

```
## Incorporation applied (for group sep 1164).
```

```
## Incorporation applied (for group sep 1168).
```

```
## Incorporation applied (for group sep 1169).
```

```
## Incorporation applied (for group sep 1170).
```

```
## Incorporation applied (for group sep 1174).
```

```
## Incorporation applied (for group sep 1175).
```

```
## Incorporation applied (for group sep 1176).
```

```
## Incorporation applied (for group sep 118).
```

```
## Incorporation applied (for group sep 1180).
```

```
## Incorporation applied (for group sep 1181).
```

```
## Incorporation applied (for group sep 1182).
```

```
## Incorporation applied (for group sep 1186).
```

```
## Incorporation applied (for group sep 1187).
```

```
## Incorporation applied (for group sep 1188).
```

```
## Incorporation applied (for group sep 119).
```

```
## Incorporation applied (for group sep 1192).
```

```
## Incorporation applied (for group sep 1193).
```

```
## Incorporation applied (for group sep 1194).
```

```
## Incorporation applied (for group sep 1198).
```

```
## Incorporation applied (for group sep 1199).
```

```
## Incorporation applied (for group sep 12).
```

```
## Incorporation applied (for group sep 120).
```

```
## Incorporation applied (for group sep 1200).
```

```
## Incorporation applied (for group sep 1204).
```

```
## Incorporation applied (for group sep 1205).
```

```
## Incorporation applied (for group sep 1206).
```

```
## Incorporation applied (for group sep 1210).
```

```
## Incorporation applied (for group sep 1211).
```

```
## Incorporation applied (for group sep 1212).
```

```
## Incorporation applied (for group sep 1216).
```

```
## Incorporation applied (for group sep 1217).
```

```
## Incorporation applied (for group sep 1218).
```

```
## Incorporation applied (for group sep 1222).
```

```
## Incorporation applied (for group sep 1223).
```

```
## Incorporation applied (for group sep 1224).
```

```
## Incorporation applied (for group sep 1228).
```

```
## Incorporation applied (for group sep 1229).
```

```
## Incorporation applied (for group sep 1230).
```

```
## Incorporation applied (for group sep 1234).
```

```
## Incorporation applied (for group sep 1235).
```

```
## Incorporation applied (for group sep 1236).
```

```
## Incorporation applied (for group sep 124).
```

```
## Incorporation applied (for group sep 1240).
```

```
## Incorporation applied (for group sep 1241).
```

```
## Incorporation applied (for group sep 1242).
```

```
## Incorporation applied (for group sep 1246).
```

```
## Incorporation applied (for group sep 1247).
```

```
## Incorporation applied (for group sep 1248).
```

```
## Incorporation applied (for group sep 125).
```

```
## Incorporation applied (for group sep 1252).
```

```
## Incorporation applied (for group sep 1253).
```

```
## Incorporation applied (for group sep 1254).
```

```
## Incorporation applied (for group sep 1258).
```

```
## Incorporation applied (for group sep 1259).
```

```
## Incorporation applied (for group sep 126).
```

```
## Incorporation applied (for group sep 1260).
```

```
## Incorporation applied (for group sep 1264).
```

```
## Incorporation applied (for group sep 1265).
```

```
## Incorporation applied (for group sep 1266).
```

```
## Incorporation applied (for group sep 1270).
```

```
## Incorporation applied (for group sep 1271).
```

```
## Incorporation applied (for group sep 1272).
```

```
## Incorporation applied (for group sep 1276).
```

```
## Incorporation applied (for group sep 1277).
```

```
## Incorporation applied (for group sep 1278).
```

```
## Incorporation applied (for group sep 1282).
```

```
## Incorporation applied (for group sep 1283).
```

```
## Incorporation applied (for group sep 1284).
```

```
## Incorporation applied (for group sep 1288).
```

```
## Incorporation applied (for group sep 1289).
```

```
## Incorporation applied (for group sep 1290).
```

```
## Incorporation applied (for group sep 1294).
```

```
## Incorporation applied (for group sep 1295).
```

```
## Incorporation applied (for group sep 1296).
```

```
## Incorporation applied (for group sep 130).
```

```
## Incorporation applied (for group sep 1300).
```

```
## Incorporation applied (for group sep 1301).
```

```
## Incorporation applied (for group sep 1302).
```

```
## Incorporation applied (for group sep 1306).
```

```
## Incorporation applied (for group sep 1307).
```

```
## Incorporation applied (for group sep 1308).
```

```
## Incorporation applied (for group sep 131).
```

```
## Incorporation applied (for group sep 1312).
```

```
## Incorporation applied (for group sep 1313).
```

```
## Incorporation applied (for group sep 1314).
```

```
## Incorporation applied (for group sep 1318).
```

```
## Incorporation applied (for group sep 1319).
```

```
## Incorporation applied (for group sep 132).
```

```
## Incorporation applied (for group sep 1320).
```

```
## Incorporation applied (for group sep 1324).
```

```
## Incorporation applied (for group sep 1325).
```

```
## Incorporation applied (for group sep 1326).
```

```
## Incorporation applied (for group sep 1330).
```

```
## Incorporation applied (for group sep 1331).
```

```
## Incorporation applied (for group sep 1332).
```

```
## Incorporation applied (for group sep 1336).
```

```
## Incorporation applied (for group sep 1337).
```

```
## Incorporation applied (for group sep 1338).
```

```
## Incorporation applied (for group sep 1342).
```

```
## Incorporation applied (for group sep 1343).
```

```
## Incorporation applied (for group sep 1344).
```

```
## Incorporation applied (for group sep 1348).
```

```
## Incorporation applied (for group sep 1349).
```

```
## Incorporation applied (for group sep 1350).
```

```
## Incorporation applied (for group sep 1354).
```

```
## Incorporation applied (for group sep 1355).
```

```
## Incorporation applied (for group sep 1356).
```

```
## Incorporation applied (for group sep 136).
```

```
## Incorporation applied (for group sep 1360).
```

```
## Incorporation applied (for group sep 1361).
```

```
## Incorporation applied (for group sep 1362).
```

```
## Incorporation applied (for group sep 1366).
```

```
## Incorporation applied (for group sep 1367).
```

```
## Incorporation applied (for group sep 1368).
```

```
## Incorporation applied (for group sep 137).
```

```
## Incorporation applied (for group sep 1372).
```

```
## Incorporation applied (for group sep 1373).
```

```
## Incorporation applied (for group sep 1374).
```

```
## Incorporation applied (for group sep 1378).
```

```
## Incorporation applied (for group sep 1379).
```

```
## Incorporation applied (for group sep 138).
```

```
## Incorporation applied (for group sep 1380).
```

```
## Incorporation applied (for group sep 1384).
```

```
## Incorporation applied (for group sep 1385).
```

```
## Incorporation applied (for group sep 1386).
```

```
## Incorporation applied (for group sep 1390).
```

```
## Incorporation applied (for group sep 1391).
```

```
## Incorporation applied (for group sep 1392).
```

```
## Incorporation applied (for group sep 1396).
```

```
## Incorporation applied (for group sep 1397).
```

```
## Incorporation applied (for group sep 1398).
```

```
## Incorporation applied (for group sep 1402).
```

```
## Incorporation applied (for group sep 1403).
```

```
## Incorporation applied (for group sep 1404).
```

```
## Incorporation applied (for group sep 1408).
```

```
## Incorporation applied (for group sep 1409).
```

```
## Incorporation applied (for group sep 1410).
```

```
## Incorporation applied (for group sep 1414).
```

```
## Incorporation applied (for group sep 1415).
```

```
## Incorporation applied (for group sep 1416).
```

```
## Incorporation applied (for group sep 142).
```

```
## Incorporation applied (for group sep 1420).
```

```
## Incorporation applied (for group sep 1421).
```

```
## Incorporation applied (for group sep 1422).
```

```
## Incorporation applied (for group sep 1426).
```

```
## Incorporation applied (for group sep 1427).
```

```
## Incorporation applied (for group sep 1428).
```

```
## Incorporation applied (for group sep 143).
```

```
## Incorporation applied (for group sep 1432).
```

```
## Incorporation applied (for group sep 1433).
```

```
## Incorporation applied (for group sep 1434).
```

```
## Incorporation applied (for group sep 1438).
```

```
## Incorporation applied (for group sep 1439).
```

```
## Incorporation applied (for group sep 144).
```

```
## Incorporation applied (for group sep 1440).
```

```
## Incorporation applied (for group sep 1444).
```

```
## Incorporation applied (for group sep 1445).
```

```
## Incorporation applied (for group sep 1446).
```

```
## Incorporation applied (for group sep 1450).
```

```
## Incorporation applied (for group sep 1451).
```

```
## Incorporation applied (for group sep 1452).
```

```
## Incorporation applied (for group sep 1456).
```

```
## Incorporation applied (for group sep 1457).
```

```
## Incorporation applied (for group sep 1458).
```

```
## Incorporation applied (for group sep 1462).
```

```
## Incorporation applied (for group sep 1463).
```

```
## Incorporation applied (for group sep 1464).
```

```
## Incorporation applied (for group sep 1468).
```

```
## Incorporation applied (for group sep 1469).
```

```
## Incorporation applied (for group sep 1470).
```

```
## Incorporation applied (for group sep 1474).
```

```
## Incorporation applied (for group sep 1475).
```

```
## Incorporation applied (for group sep 1476).
```

```
## Incorporation applied (for group sep 148).
```

```
## Incorporation applied (for group sep 1480).
```

```
## Incorporation applied (for group sep 1481).
```

```
## Incorporation applied (for group sep 1482).
```

```
## Incorporation applied (for group sep 1486).
```

```
## Incorporation applied (for group sep 1487).
```

```
## Incorporation applied (for group sep 1488).
```

```
## Incorporation applied (for group sep 149).
```

```
## Incorporation applied (for group sep 1492).
```

```
## Incorporation applied (for group sep 1493).
```

```
## Incorporation applied (for group sep 1494).
```

```
## Incorporation applied (for group sep 1498).
```

```
## Incorporation applied (for group sep 1499).
```

```
## Incorporation applied (for group sep 150).
```

```
## Incorporation applied (for group sep 1500).
```

```
## Incorporation applied (for group sep 1504).
```

```
## Incorporation applied (for group sep 1505).
```

```
## Incorporation applied (for group sep 1506).
```

```
## Incorporation applied (for group sep 1510).
```

```
## Incorporation applied (for group sep 1511).
```

```
## Incorporation applied (for group sep 1512).
```

```
## Incorporation applied (for group sep 1516).
```

```
## Incorporation applied (for group sep 1517).
```

```
## Incorporation applied (for group sep 1518).
```

```
## Incorporation applied (for group sep 1522).
```

```
## Incorporation applied (for group sep 1523).
```

```
## Incorporation applied (for group sep 1524).
```

```
## Incorporation applied (for group sep 1528).
```

```
## Incorporation applied (for group sep 1529).
```

```
## Incorporation applied (for group sep 1530).
```

```
## Incorporation applied (for group sep 1534).
```

```
## Incorporation applied (for group sep 1535).
```

```
## Incorporation applied (for group sep 1536).
```

```
## Incorporation applied (for group sep 154).
```

```
## Incorporation applied (for group sep 1540).
```

```
## Incorporation applied (for group sep 1541).
```

```
## Incorporation applied (for group sep 1542).
```

```
## Incorporation applied (for group sep 1546).
```

```
## Incorporation applied (for group sep 1547).
```

```
## Incorporation applied (for group sep 1548).
```

```
## Incorporation applied (for group sep 155).
```

```
## Incorporation applied (for group sep 1552).
```

```
## Incorporation applied (for group sep 1553).
```

```
## Incorporation applied (for group sep 1554).
```

```
## Incorporation applied (for group sep 1558).
```

```
## Incorporation applied (for group sep 1559).
```

```
## Incorporation applied (for group sep 156).
```

```
## Incorporation applied (for group sep 1560).
```

```
## Incorporation applied (for group sep 1564).
```

```
## Incorporation applied (for group sep 1565).
```

```
## Incorporation applied (for group sep 1566).
```

```
## Incorporation applied (for group sep 1570).
```

```
## Incorporation applied (for group sep 1571).
```

```
## Incorporation applied (for group sep 1572).
```

```
## Incorporation applied (for group sep 1576).
```

```
## Incorporation applied (for group sep 1577).
```

```
## Incorporation applied (for group sep 1578).
```

```
## Incorporation applied (for group sep 1582).
```

```
## Incorporation applied (for group sep 1583).
```

```
## Incorporation applied (for group sep 1584).
```

```
## Incorporation applied (for group sep 1588).
```

```
## Incorporation applied (for group sep 1589).
```

```
## Incorporation applied (for group sep 1590).
```

```
## Incorporation applied (for group sep 1594).
```

```
## Incorporation applied (for group sep 1595).
```

```
## Incorporation applied (for group sep 1596).
```

```
## Incorporation applied (for group sep 16).
```

```
## Incorporation applied (for group sep 160).
```

```
## Incorporation applied (for group sep 1600).
```

```
## Incorporation applied (for group sep 1601).
```

```
## Incorporation applied (for group sep 1602).
```

```
## Incorporation applied (for group sep 1606).
```

```
## Incorporation applied (for group sep 1607).
```

```
## Incorporation applied (for group sep 1608).
```

```
## Incorporation applied (for group sep 161).
```

```
## Incorporation applied (for group sep 1612).
```

```
## Incorporation applied (for group sep 1613).
```

```
## Incorporation applied (for group sep 1614).
```

```
## Incorporation applied (for group sep 1618).
```

```
## Incorporation applied (for group sep 1619).
```

```
## Incorporation applied (for group sep 162).
```

```
## Incorporation applied (for group sep 1620).
```

```
## Incorporation applied (for group sep 1624).
```

```
## Incorporation applied (for group sep 1625).
```

```
## Incorporation applied (for group sep 1626).
```

```
## Incorporation applied (for group sep 1630).
```

```
## Incorporation applied (for group sep 1631).
```

```
## Incorporation applied (for group sep 1632).
```

```
## Incorporation applied (for group sep 1636).
```

```
## Incorporation applied (for group sep 1637).
```

```
## Incorporation applied (for group sep 1638).
```

```
## Incorporation applied (for group sep 1642).
```

```
## Incorporation applied (for group sep 1643).
```

```
## Incorporation applied (for group sep 1644).
```

```
## Incorporation applied (for group sep 1648).
```

```
## Incorporation applied (for group sep 1649).
```

```
## Incorporation applied (for group sep 1650).
```

```
## Incorporation applied (for group sep 1654).
```

```
## Incorporation applied (for group sep 1655).
```

```
## Incorporation applied (for group sep 1656).
```

```
## Incorporation applied (for group sep 166).
```

```
## Incorporation applied (for group sep 1660).
```

```
## Incorporation applied (for group sep 1661).
```

```
## Incorporation applied (for group sep 1662).
```

```
## Incorporation applied (for group sep 1666).
```

```
## Incorporation applied (for group sep 1667).
```

```
## Incorporation applied (for group sep 1668).
```

```
## Incorporation applied (for group sep 167).
```

```
## Incorporation applied (for group sep 1672).
```

```
## Incorporation applied (for group sep 1673).
```

```
## Incorporation applied (for group sep 1674).
```

```
## Incorporation applied (for group sep 1678).
```

```
## Incorporation applied (for group sep 1679).
```

```
## Incorporation applied (for group sep 168).
```

```
## Incorporation applied (for group sep 1680).
```

```
## Incorporation applied (for group sep 1684).
```

```
## Incorporation applied (for group sep 1685).
```

```
## Incorporation applied (for group sep 1686).
```

```
## Incorporation applied (for group sep 1690).
```

```
## Incorporation applied (for group sep 1691).
```

```
## Incorporation applied (for group sep 1692).
```

```
## Incorporation applied (for group sep 1696).
```

```
## Incorporation applied (for group sep 1697).
```

```
## Incorporation applied (for group sep 1698).
```

```
## Incorporation applied (for group sep 17).
```

```
## Incorporation applied (for group sep 1702).
```

```
## Incorporation applied (for group sep 1703).
```

```
## Incorporation applied (for group sep 1704).
```

```
## Incorporation applied (for group sep 1708).
```

```
## Incorporation applied (for group sep 1709).
```

```
## Incorporation applied (for group sep 1710).
```

```
## Incorporation applied (for group sep 1714).
```

```
## Incorporation applied (for group sep 1715).
```

```
## Incorporation applied (for group sep 1716).
```

```
## Incorporation applied (for group sep 172).
```

```
## Incorporation applied (for group sep 1720).
```

```
## Incorporation applied (for group sep 1721).
```

```
## Incorporation applied (for group sep 1722).
```

```
## Incorporation applied (for group sep 1726).
```

```
## Incorporation applied (for group sep 1727).
```

```
## Incorporation applied (for group sep 1728).
```

```
## Incorporation applied (for group sep 173).
```

```
## Incorporation applied (for group sep 1732).
```

```
## Incorporation applied (for group sep 1733).
```

```
## Incorporation applied (for group sep 1734).
```

```
## Incorporation applied (for group sep 1738).
```

```
## Incorporation applied (for group sep 1739).
```

```
## Incorporation applied (for group sep 174).
```

```
## Incorporation applied (for group sep 1740).
```

```
## Incorporation applied (for group sep 1744).
```

```
## Incorporation applied (for group sep 1745).
```

```
## Incorporation applied (for group sep 1746).
```

```
## Incorporation applied (for group sep 1750).
```

```
## Incorporation applied (for group sep 1751).
```

```
## Incorporation applied (for group sep 1752).
```

```
## Incorporation applied (for group sep 1756).
```

```
## Incorporation applied (for group sep 1757).
```

```
## Incorporation applied (for group sep 1758).
```

```
## Incorporation applied (for group sep 1762).
```

```
## Incorporation applied (for group sep 1763).
```

```
## Incorporation applied (for group sep 1764).
```

```
## Incorporation applied (for group sep 1768).
```

```
## Incorporation applied (for group sep 1769).
```

```
## Incorporation applied (for group sep 1770).
```

```
## Incorporation applied (for group sep 1774).
```

```
## Incorporation applied (for group sep 1775).
```

```
## Incorporation applied (for group sep 1776).
```

```
## Incorporation applied (for group sep 178).
```

```
## Incorporation applied (for group sep 1780).
```

```
## Incorporation applied (for group sep 1781).
```

```
## Incorporation applied (for group sep 1782).
```

```
## Incorporation applied (for group sep 1786).
```

```
## Incorporation applied (for group sep 1787).
```

```
## Incorporation applied (for group sep 1788).
```

```
## Incorporation applied (for group sep 179).
```

```
## Incorporation applied (for group sep 1792).
```

```
## Incorporation applied (for group sep 1793).
```

```
## Incorporation applied (for group sep 1794).
```

```
## Incorporation applied (for group sep 1798).
```

```
## Incorporation applied (for group sep 1799).
```

```
## Incorporation applied (for group sep 18).
```

```
## Incorporation applied (for group sep 180).
```

```
## Incorporation applied (for group sep 1800).
```

```
## Incorporation applied (for group sep 1804).
```

```
## Incorporation applied (for group sep 1805).
```

```
## Incorporation applied (for group sep 1806).
```

```
## Incorporation applied (for group sep 1810).
```

```
## Incorporation applied (for group sep 1811).
```

```
## Incorporation applied (for group sep 1812).
```

```
## Incorporation applied (for group sep 1816).
```

```
## Incorporation applied (for group sep 1817).
```

```
## Incorporation applied (for group sep 1818).
```

```
## Incorporation applied (for group sep 1822).
```

```
## Incorporation applied (for group sep 1823).
```

```
## Incorporation applied (for group sep 1824).
```

```
## Incorporation applied (for group sep 1828).
```

```
## Incorporation applied (for group sep 1829).
```

```
## Incorporation applied (for group sep 1830).
```

```
## Incorporation applied (for group sep 1834).
```

```
## Incorporation applied (for group sep 1835).
```

```
## Incorporation applied (for group sep 1836).
```

```
## Incorporation applied (for group sep 184).
```

```
## Incorporation applied (for group sep 1840).
```

```
## Incorporation applied (for group sep 1841).
```

```
## Incorporation applied (for group sep 1842).
```

```
## Incorporation applied (for group sep 1846).
```

```
## Incorporation applied (for group sep 1847).
```

```
## Incorporation applied (for group sep 1848).
```

```
## Incorporation applied (for group sep 185).
```

```
## Incorporation applied (for group sep 1852).
```

```
## Incorporation applied (for group sep 1853).
```

```
## Incorporation applied (for group sep 1854).
```

```
## Incorporation applied (for group sep 1858).
```

```
## Incorporation applied (for group sep 1859).
```

```
## Incorporation applied (for group sep 186).
```

```
## Incorporation applied (for group sep 1860).
```

```
## Incorporation applied (for group sep 1864).
```

```
## Incorporation applied (for group sep 1865).
```

```
## Incorporation applied (for group sep 1866).
```

```
## Incorporation applied (for group sep 1870).
```

```
## Incorporation applied (for group sep 1871).
```

```
## Incorporation applied (for group sep 1872).
```

```
## Incorporation applied (for group sep 1876).
```

```
## Incorporation applied (for group sep 1877).
```

```
## Incorporation applied (for group sep 1878).
```

```
## Incorporation applied (for group sep 1882).
```

```
## Incorporation applied (for group sep 1883).
```

```
## Incorporation applied (for group sep 1884).
```

```
## Incorporation applied (for group sep 1888).
```

```
## Incorporation applied (for group sep 1889).
```

```
## Incorporation applied (for group sep 1890).
```

```
## Incorporation applied (for group sep 1894).
```

```
## Incorporation applied (for group sep 1895).
```

```
## Incorporation applied (for group sep 1896).
```

```
## Incorporation applied (for group sep 190).
```

```
## Incorporation applied (for group sep 1900).
```

```
## Incorporation applied (for group sep 1901).
```

```
## Incorporation applied (for group sep 1902).
```

```
## Incorporation applied (for group sep 1906).
```

```
## Incorporation applied (for group sep 1907).
```

```
## Incorporation applied (for group sep 1908).
```

```
## Incorporation applied (for group sep 191).
```

```
## Incorporation applied (for group sep 1912).
```

```
## Incorporation applied (for group sep 1913).
```

```
## Incorporation applied (for group sep 1914).
```

```
## Incorporation applied (for group sep 1918).
```

```
## Incorporation applied (for group sep 1919).
```

```
## Incorporation applied (for group sep 192).
```

```
## Incorporation applied (for group sep 1920).
```

```
## Incorporation applied (for group sep 1924).
```

```
## Incorporation applied (for group sep 1925).
```

```
## Incorporation applied (for group sep 1926).
```

```
## Incorporation applied (for group sep 1930).
```

```
## Incorporation applied (for group sep 1931).
```

```
## Incorporation applied (for group sep 1932).
```

```
## Incorporation applied (for group sep 1936).
```

```
## Incorporation applied (for group sep 1937).
```

```
## Incorporation applied (for group sep 1938).
```

```
## Incorporation applied (for group sep 1942).
```

```
## Incorporation applied (for group sep 1943).
```

```
## Incorporation applied (for group sep 1944).
```

```
## Incorporation applied (for group sep 1948).
```

```
## Incorporation applied (for group sep 1949).
```

```
## Incorporation applied (for group sep 1950).
```

```
## Incorporation applied (for group sep 1954).
```

```
## Incorporation applied (for group sep 1955).
```

```
## Incorporation applied (for group sep 1956).
```

```
## Incorporation applied (for group sep 196).
```

```
## Incorporation applied (for group sep 1960).
```

```
## Incorporation applied (for group sep 1961).
```

```
## Incorporation applied (for group sep 1962).
```

```
## Incorporation applied (for group sep 1966).
```

```
## Incorporation applied (for group sep 1967).
```

```
## Incorporation applied (for group sep 1968).
```

```
## Incorporation applied (for group sep 197).
```

```
## Incorporation applied (for group sep 1972).
```

```
## Incorporation applied (for group sep 1973).
```

```
## Incorporation applied (for group sep 1974).
```

```
## Incorporation applied (for group sep 1978).
```

```
## Incorporation applied (for group sep 1979).
```

```
## Incorporation applied (for group sep 198).
```

```
## Incorporation applied (for group sep 1980).
```

```
## Incorporation applied (for group sep 1984).
```

```
## Incorporation applied (for group sep 1985).
```

```
## Incorporation applied (for group sep 1986).
```

```
## Incorporation applied (for group sep 1990).
```

```
## Incorporation applied (for group sep 1991).
```

```
## Incorporation applied (for group sep 1992).
```

```
## Incorporation applied (for group sep 1996).
```

```
## Incorporation applied (for group sep 1997).
```

```
## Incorporation applied (for group sep 1998).
```

```
## Incorporation applied (for group sep 2002).
```

```
## Incorporation applied (for group sep 2003).
```

```
## Incorporation applied (for group sep 2004).
```

```
## Incorporation applied (for group sep 2008).
```

```
## Incorporation applied (for group sep 2009).
```

```
## Incorporation applied (for group sep 2010).
```

```
## Incorporation applied (for group sep 2014).
```

```
## Incorporation applied (for group sep 2015).
```

```
## Incorporation applied (for group sep 2016).
```

```
## Incorporation applied (for group sep 202).
```

```
## Incorporation applied (for group sep 2020).
```

```
## Incorporation applied (for group sep 2021).
```

```
## Incorporation applied (for group sep 2022).
```

```
## Incorporation applied (for group sep 2026).
```

```
## Incorporation applied (for group sep 2027).
```

```
## Incorporation applied (for group sep 2028).
```

```
## Incorporation applied (for group sep 203).
```

```
## Incorporation applied (for group sep 2032).
```

```
## Incorporation applied (for group sep 2033).
```

```
## Incorporation applied (for group sep 2034).
```

```
## Incorporation applied (for group sep 2038).
```

```
## Incorporation applied (for group sep 2039).
```

```
## Incorporation applied (for group sep 204).
```

```
## Incorporation applied (for group sep 2040).
```

```
## Incorporation applied (for group sep 2044).
```

```
## Incorporation applied (for group sep 2045).
```

```
## Incorporation applied (for group sep 2046).
```

```
## Incorporation applied (for group sep 2050).
```

```
## Incorporation applied (for group sep 2051).
```

```
## Incorporation applied (for group sep 2052).
```

```
## Incorporation applied (for group sep 2056).
```

```
## Incorporation applied (for group sep 2057).
```

```
## Incorporation applied (for group sep 2058).
```

```
## Incorporation applied (for group sep 2062).
```

```
## Incorporation applied (for group sep 2063).
```

```
## Incorporation applied (for group sep 2064).
```

```
## Incorporation applied (for group sep 2068).
```

```
## Incorporation applied (for group sep 2069).
```

```
## Incorporation applied (for group sep 2070).
```

```
## Incorporation applied (for group sep 2074).
```

```
## Incorporation applied (for group sep 2075).
```

```
## Incorporation applied (for group sep 2076).
```

```
## Incorporation applied (for group sep 208).
```

```
## Incorporation applied (for group sep 2080).
```

```
## Incorporation applied (for group sep 2081).
```

```
## Incorporation applied (for group sep 2082).
```

```
## Incorporation applied (for group sep 2086).
```

```
## Incorporation applied (for group sep 2087).
```

```
## Incorporation applied (for group sep 2088).
```

```
## Incorporation applied (for group sep 209).
```

```
## Incorporation applied (for group sep 2092).
```

```
## Incorporation applied (for group sep 2093).
```

```
## Incorporation applied (for group sep 2094).
```

```
## Incorporation applied (for group sep 2098).
```

```
## Incorporation applied (for group sep 2099).
```

```
## Incorporation applied (for group sep 210).
```

```
## Incorporation applied (for group sep 2100).
```

```
## Incorporation applied (for group sep 2104).
```

```
## Incorporation applied (for group sep 2105).
```

```
## Incorporation applied (for group sep 2106).
```

```
## Incorporation applied (for group sep 2110).
```

```
## Incorporation applied (for group sep 2111).
```

```
## Incorporation applied (for group sep 2112).
```

```
## Incorporation applied (for group sep 2116).
```

```
## Incorporation applied (for group sep 2117).
```

```
## Incorporation applied (for group sep 2118).
```

```
## Incorporation applied (for group sep 2122).
```

```
## Incorporation applied (for group sep 2123).
```

```
## Incorporation applied (for group sep 2124).
```

```
## Incorporation applied (for group sep 2128).
```

```
## Incorporation applied (for group sep 2129).
```

```
## Incorporation applied (for group sep 2130).
```

```
## Incorporation applied (for group sep 2134).
```

```
## Incorporation applied (for group sep 2135).
```

```
## Incorporation applied (for group sep 2136).
```

```
## Incorporation applied (for group sep 214).
```

```
## Incorporation applied (for group sep 2140).
```

```
## Incorporation applied (for group sep 2141).
```

```
## Incorporation applied (for group sep 2142).
```

```
## Incorporation applied (for group sep 2146).
```

```
## Incorporation applied (for group sep 2147).
```

```
## Incorporation applied (for group sep 2148).
```

```
## Incorporation applied (for group sep 215).
```

```
## Incorporation applied (for group sep 2152).
```

```
## Incorporation applied (for group sep 2153).
```

```
## Incorporation applied (for group sep 2154).
```

```
## Incorporation applied (for group sep 2158).
```

```
## Incorporation applied (for group sep 2159).
```

```
## Incorporation applied (for group sep 216).
```

```
## Incorporation applied (for group sep 2160).
```

```
## Incorporation applied (for group sep 2164).
```

```
## Incorporation applied (for group sep 2165).
```

```
## Incorporation applied (for group sep 2166).
```

```
## Incorporation applied (for group sep 2170).
```

```
## Incorporation applied (for group sep 2171).
```

```
## Incorporation applied (for group sep 2172).
```

```
## Incorporation applied (for group sep 2176).
```

```
## Incorporation applied (for group sep 2177).
```

```
## Incorporation applied (for group sep 2178).
```

```
## Incorporation applied (for group sep 2182).
```

```
## Incorporation applied (for group sep 2183).
```

```
## Incorporation applied (for group sep 2184).
```

```
## Incorporation applied (for group sep 2188).
```

```
## Incorporation applied (for group sep 2189).
```

```
## Incorporation applied (for group sep 2190).
```

```
## Incorporation applied (for group sep 2194).
```

```
## Incorporation applied (for group sep 2195).
```

```
## Incorporation applied (for group sep 2196).
```

```
## Incorporation applied (for group sep 22).
```

```
## Incorporation applied (for group sep 220).
```

```
## Incorporation applied (for group sep 2200).
```

```
## Incorporation applied (for group sep 2201).
```

```
## Incorporation applied (for group sep 2202).
```

```
## Incorporation applied (for group sep 2206).
```

```
## Incorporation applied (for group sep 2207).
```

```
## Incorporation applied (for group sep 2208).
```

```
## Incorporation applied (for group sep 221).
```

```
## Incorporation applied (for group sep 2212).
```

```
## Incorporation applied (for group sep 2213).
```

```
## Incorporation applied (for group sep 2214).
```

```
## Incorporation applied (for group sep 2218).
```

```
## Incorporation applied (for group sep 2219).
```

```
## Incorporation applied (for group sep 222).
```

```
## Incorporation applied (for group sep 2220).
```

```
## Incorporation applied (for group sep 2224).
```

```
## Incorporation applied (for group sep 2225).
```

```
## Incorporation applied (for group sep 2226).
```

```
## Incorporation applied (for group sep 2230).
```

```
## Incorporation applied (for group sep 2231).
```

```
## Incorporation applied (for group sep 2232).
```

```
## Incorporation applied (for group sep 2236).
```

```
## Incorporation applied (for group sep 2237).
```

```
## Incorporation applied (for group sep 2238).
```

```
## Incorporation applied (for group sep 2242).
```

```
## Incorporation applied (for group sep 2243).
```

```
## Incorporation applied (for group sep 2244).
```

```
## Incorporation applied (for group sep 2248).
```

```
## Incorporation applied (for group sep 2249).
```

```
## Incorporation applied (for group sep 2250).
```

```
## Incorporation applied (for group sep 2254).
```

```
## Incorporation applied (for group sep 2255).
```

```
## Incorporation applied (for group sep 2256).
```

```
## Incorporation applied (for group sep 226).
```

```
## Incorporation applied (for group sep 2260).
```

```
## Incorporation applied (for group sep 2261).
```

```
## Incorporation applied (for group sep 2262).
```

```
## Incorporation applied (for group sep 2266).
```

```
## Incorporation applied (for group sep 2267).
```

```
## Incorporation applied (for group sep 2268).
```

```
## Incorporation applied (for group sep 227).
```

```
## Incorporation applied (for group sep 2272).
```

```
## Incorporation applied (for group sep 2273).
```

```
## Incorporation applied (for group sep 2274).
```

```
## Incorporation applied (for group sep 2278).
```

```
## Incorporation applied (for group sep 2279).
```

```
## Incorporation applied (for group sep 228).
```

```
## Incorporation applied (for group sep 2280).
```

```
## Incorporation applied (for group sep 2284).
```

```
## Incorporation applied (for group sep 2285).
```

```
## Incorporation applied (for group sep 2286).
```

```
## Incorporation applied (for group sep 2290).
```

```
## Incorporation applied (for group sep 2291).
```

```
## Incorporation applied (for group sep 2292).
```

```
## Incorporation applied (for group sep 2296).
```

```
## Incorporation applied (for group sep 2297).
```

```
## Incorporation applied (for group sep 2298).
```

```
## Incorporation applied (for group sep 23).
```

```
## Incorporation applied (for group sep 2302).
```

```
## Incorporation applied (for group sep 2303).
```

```
## Incorporation applied (for group sep 2304).
```

```
## Incorporation applied (for group sep 2308).
```

```
## Incorporation applied (for group sep 2309).
```

```
## Incorporation applied (for group sep 2310).
```

```
## Incorporation applied (for group sep 2314).
```

```
## Incorporation applied (for group sep 2315).
```

```
## Incorporation applied (for group sep 2316).
```

```
## Incorporation applied (for group sep 232).
```

```
## Incorporation applied (for group sep 2320).
```

```
## Incorporation applied (for group sep 2321).
```

```
## Incorporation applied (for group sep 2322).
```

```
## Incorporation applied (for group sep 2326).
```

```
## Incorporation applied (for group sep 2327).
```

```
## Incorporation applied (for group sep 2328).
```

```
## Incorporation applied (for group sep 233).
```

```
## Incorporation applied (for group sep 2332).
```

```
## Incorporation applied (for group sep 2333).
```

```
## Incorporation applied (for group sep 2334).
```

```
## Incorporation applied (for group sep 2338).
```

```
## Incorporation applied (for group sep 2339).
```

```
## Incorporation applied (for group sep 234).
```

```
## Incorporation applied (for group sep 2340).
```

```
## Incorporation applied (for group sep 2344).
```

```
## Incorporation applied (for group sep 2345).
```

```
## Incorporation applied (for group sep 2346).
```

```
## Incorporation applied (for group sep 2350).
```

```
## Incorporation applied (for group sep 2351).
```

```
## Incorporation applied (for group sep 2352).
```

```
## Incorporation applied (for group sep 2356).
```

```
## Incorporation applied (for group sep 2357).
```

```
## Incorporation applied (for group sep 2358).
```

```
## Incorporation applied (for group sep 2362).
```

```
## Incorporation applied (for group sep 2363).
```

```
## Incorporation applied (for group sep 2364).
```

```
## Incorporation applied (for group sep 2368).
```

```
## Incorporation applied (for group sep 2369).
```

```
## Incorporation applied (for group sep 2370).
```

```
## Incorporation applied (for group sep 2374).
```

```
## Incorporation applied (for group sep 2375).
```

```
## Incorporation applied (for group sep 2376).
```

```
## Incorporation applied (for group sep 238).
```

```
## Incorporation applied (for group sep 2380).
```

```
## Incorporation applied (for group sep 2381).
```

```
## Incorporation applied (for group sep 2382).
```

```
## Incorporation applied (for group sep 2386).
```

```
## Incorporation applied (for group sep 2387).
```

```
## Incorporation applied (for group sep 2388).
```

```
## Incorporation applied (for group sep 239).
```

```
## Incorporation applied (for group sep 2392).
```

```
## Incorporation applied (for group sep 2393).
```

```
## Incorporation applied (for group sep 2394).
```

```
## Incorporation applied (for group sep 2398).
```

```
## Incorporation applied (for group sep 2399).
```

```
## Incorporation applied (for group sep 24).
```

```
## Incorporation applied (for group sep 240).
```

```
## Incorporation applied (for group sep 2400).
```

```
## Incorporation applied (for group sep 2404).
```

```
## Incorporation applied (for group sep 2405).
```

```
## Incorporation applied (for group sep 2406).
```

```
## Incorporation applied (for group sep 2410).
```

```
## Incorporation applied (for group sep 2411).
```

```
## Incorporation applied (for group sep 2412).
```

```
## Incorporation applied (for group sep 2416).
```

```
## Incorporation applied (for group sep 2417).
```

```
## Incorporation applied (for group sep 2418).
```

```
## Incorporation applied (for group sep 2422).
```

```
## Incorporation applied (for group sep 2423).
```

```
## Incorporation applied (for group sep 2424).
```

```
## Incorporation applied (for group sep 2428).
```

```
## Incorporation applied (for group sep 2429).
```

```
## Incorporation applied (for group sep 2430).
```

```
## Incorporation applied (for group sep 2434).
```

```
## Incorporation applied (for group sep 2435).
```

```
## Incorporation applied (for group sep 2436).
```

```
## Incorporation applied (for group sep 244).
```

```
## Incorporation applied (for group sep 2440).
```

```
## Incorporation applied (for group sep 2441).
```

```
## Incorporation applied (for group sep 2442).
```

```
## Incorporation applied (for group sep 2446).
```

```
## Incorporation applied (for group sep 2447).
```

```
## Incorporation applied (for group sep 2448).
```

```
## Incorporation applied (for group sep 245).
```

```
## Incorporation applied (for group sep 2452).
```

```
## Incorporation applied (for group sep 2453).
```

```
## Incorporation applied (for group sep 2454).
```

```
## Incorporation applied (for group sep 2458).
```

```
## Incorporation applied (for group sep 2459).
```

```
## Incorporation applied (for group sep 246).
```

```
## Incorporation applied (for group sep 2460).
```

```
## Incorporation applied (for group sep 2464).
```

```
## Incorporation applied (for group sep 2465).
```

```
## Incorporation applied (for group sep 2466).
```

```
## Incorporation applied (for group sep 2470).
```

```
## Incorporation applied (for group sep 2471).
```

```
## Incorporation applied (for group sep 2472).
```

```
## Incorporation applied (for group sep 2476).
```

```
## Incorporation applied (for group sep 2477).
```

```
## Incorporation applied (for group sep 2478).
```

```
## Incorporation applied (for group sep 2482).
```

```
## Incorporation applied (for group sep 2483).
```

```
## Incorporation applied (for group sep 2484).
```

```
## Incorporation applied (for group sep 2488).
```

```
## Incorporation applied (for group sep 2489).
```

```
## Incorporation applied (for group sep 2490).
```

```
## Incorporation applied (for group sep 2494).
```

```
## Incorporation applied (for group sep 2495).
```

```
## Incorporation applied (for group sep 2496).
```

```
## Incorporation applied (for group sep 250).
```

```
## Incorporation applied (for group sep 2500).
```

```
## Incorporation applied (for group sep 2501).
```

```
## Incorporation applied (for group sep 2502).
```

```
## Incorporation applied (for group sep 2506).
```

```
## Incorporation applied (for group sep 2507).
```

```
## Incorporation applied (for group sep 2508).
```

```
## Incorporation applied (for group sep 251).
```

```
## Incorporation applied (for group sep 2512).
```

```
## Incorporation applied (for group sep 2513).
```

```
## Incorporation applied (for group sep 2514).
```

```
## Incorporation applied (for group sep 2518).
```

```
## Incorporation applied (for group sep 2519).
```

```
## Incorporation applied (for group sep 252).
```

```
## Incorporation applied (for group sep 2520).
```

```
## Incorporation applied (for group sep 256).
```

```
## Incorporation applied (for group sep 257).
```

```
## Incorporation applied (for group sep 258).
```

```
## Incorporation applied (for group sep 262).
```

```
## Incorporation applied (for group sep 263).
```

```
## Incorporation applied (for group sep 264).
```

```
## Incorporation applied (for group sep 268).
```

```
## Incorporation applied (for group sep 269).
```

```
## Incorporation applied (for group sep 270).
```

```
## Incorporation applied (for group sep 274).
```

```
## Incorporation applied (for group sep 275).
```

```
## Incorporation applied (for group sep 276).
```

```
## Incorporation applied (for group sep 28).
```

```
## Incorporation applied (for group sep 280).
```

```
## Incorporation applied (for group sep 281).
```

```
## Incorporation applied (for group sep 282).
```

```
## Incorporation applied (for group sep 286).
```

```
## Incorporation applied (for group sep 287).
```

```
## Incorporation applied (for group sep 288).
```

```
## Incorporation applied (for group sep 29).
```

```
## Incorporation applied (for group sep 292).
```

```
## Incorporation applied (for group sep 293).
```

```
## Incorporation applied (for group sep 294).
```

```
## Incorporation applied (for group sep 298).
```

```
## Incorporation applied (for group sep 299).
```

```
## Incorporation applied (for group sep 30).
```

```
## Incorporation applied (for group sep 300).
```

```
## Incorporation applied (for group sep 304).
```

```
## Incorporation applied (for group sep 305).
```

```
## Incorporation applied (for group sep 306).
```

```
## Incorporation applied (for group sep 310).
```

```
## Incorporation applied (for group sep 311).
```

```
## Incorporation applied (for group sep 312).
```

```
## Incorporation applied (for group sep 316).
```

```
## Incorporation applied (for group sep 317).
```

```
## Incorporation applied (for group sep 318).
```

```
## Incorporation applied (for group sep 322).
```

```
## Incorporation applied (for group sep 323).
```

```
## Incorporation applied (for group sep 324).
```

```
## Incorporation applied (for group sep 328).
```

```
## Incorporation applied (for group sep 329).
```

```
## Incorporation applied (for group sep 330).
```

```
## Incorporation applied (for group sep 334).
```

```
## Incorporation applied (for group sep 335).
```

```
## Incorporation applied (for group sep 336).
```

```
## Incorporation applied (for group sep 34).
```

```
## Incorporation applied (for group sep 340).
```

```
## Incorporation applied (for group sep 341).
```

```
## Incorporation applied (for group sep 342).
```

```
## Incorporation applied (for group sep 346).
```

```
## Incorporation applied (for group sep 347).
```

```
## Incorporation applied (for group sep 348).
```

```
## Incorporation applied (for group sep 35).
```

```
## Incorporation applied (for group sep 352).
```

```
## Incorporation applied (for group sep 353).
```

```
## Incorporation applied (for group sep 354).
```

```
## Incorporation applied (for group sep 358).
```

```
## Incorporation applied (for group sep 359).
```

```
## Incorporation applied (for group sep 36).
```

```
## Incorporation applied (for group sep 360).
```

```
## Incorporation applied (for group sep 364).
```

```
## Incorporation applied (for group sep 365).
```

```
## Incorporation applied (for group sep 366).
```

```
## Incorporation applied (for group sep 370).
```

```
## Incorporation applied (for group sep 371).
```

```
## Incorporation applied (for group sep 372).
```

```
## Incorporation applied (for group sep 376).
```

```
## Incorporation applied (for group sep 377).
```

```
## Incorporation applied (for group sep 378).
```

```
## Incorporation applied (for group sep 382).
```

```
## Incorporation applied (for group sep 383).
```

```
## Incorporation applied (for group sep 384).
```

```
## Incorporation applied (for group sep 388).
```

```
## Incorporation applied (for group sep 389).
```

```
## Incorporation applied (for group sep 390).
```

```
## Incorporation applied (for group sep 394).
```

```
## Incorporation applied (for group sep 395).
```

```
## Incorporation applied (for group sep 396).
```

```
## Incorporation applied (for group sep 4).
```

```
## Incorporation applied (for group sep 40).
```

```
## Incorporation applied (for group sep 400).
```

```
## Incorporation applied (for group sep 401).
```

```
## Incorporation applied (for group sep 402).
```

```
## Incorporation applied (for group sep 406).
```

```
## Incorporation applied (for group sep 407).
```

```
## Incorporation applied (for group sep 408).
```

```
## Incorporation applied (for group sep 41).
```

```
## Incorporation applied (for group sep 412).
```

```
## Incorporation applied (for group sep 413).
```

```
## Incorporation applied (for group sep 414).
```

```
## Incorporation applied (for group sep 418).
```

```
## Incorporation applied (for group sep 419).
```

```
## Incorporation applied (for group sep 42).
```

```
## Incorporation applied (for group sep 420).
```

```
## Incorporation applied (for group sep 424).
```

```
## Incorporation applied (for group sep 425).
```

```
## Incorporation applied (for group sep 426).
```

```
## Incorporation applied (for group sep 430).
```

```
## Incorporation applied (for group sep 431).
```

```
## Incorporation applied (for group sep 432).
```

```
## Incorporation applied (for group sep 436).
```

```
## Incorporation applied (for group sep 437).
```

```
## Incorporation applied (for group sep 438).
```

```
## Incorporation applied (for group sep 442).
```

```
## Incorporation applied (for group sep 443).
```

```
## Incorporation applied (for group sep 444).
```

```
## Incorporation applied (for group sep 448).
```

```
## Incorporation applied (for group sep 449).
```

```
## Incorporation applied (for group sep 450).
```

```
## Incorporation applied (for group sep 454).
```

```
## Incorporation applied (for group sep 455).
```

```
## Incorporation applied (for group sep 456).
```

```
## Incorporation applied (for group sep 46).
```

```
## Incorporation applied (for group sep 460).
```

```
## Incorporation applied (for group sep 461).
```

```
## Incorporation applied (for group sep 462).
```

```
## Incorporation applied (for group sep 466).
```

```
## Incorporation applied (for group sep 467).
```

```
## Incorporation applied (for group sep 468).
```

```
## Incorporation applied (for group sep 47).
```

```
## Incorporation applied (for group sep 472).
```

```
## Incorporation applied (for group sep 473).
```

```
## Incorporation applied (for group sep 474).
```

```
## Incorporation applied (for group sep 478).
```

```
## Incorporation applied (for group sep 479).
```

```
## Incorporation applied (for group sep 48).
```

```
## Incorporation applied (for group sep 480).
```

```
## Incorporation applied (for group sep 484).
```

```
## Incorporation applied (for group sep 485).
```

```
## Incorporation applied (for group sep 486).
```

```
## Incorporation applied (for group sep 490).
```

```
## Incorporation applied (for group sep 491).
```

```
## Incorporation applied (for group sep 492).
```

```
## Incorporation applied (for group sep 496).
```

```
## Incorporation applied (for group sep 497).
```

```
## Incorporation applied (for group sep 498).
```

```
## Incorporation applied (for group sep 5).
```

```
## Incorporation applied (for group sep 502).
```

```
## Incorporation applied (for group sep 503).
```

```
## Incorporation applied (for group sep 504).
```

```
## Incorporation applied (for group sep 508).
```

```
## Incorporation applied (for group sep 509).
```

```
## Incorporation applied (for group sep 510).
```

```
## Incorporation applied (for group sep 514).
```

```
## Incorporation applied (for group sep 515).
```

```
## Incorporation applied (for group sep 516).
```

```
## Incorporation applied (for group sep 52).
```

```
## Incorporation applied (for group sep 520).
```

```
## Incorporation applied (for group sep 521).
```

```
## Incorporation applied (for group sep 522).
```

```
## Incorporation applied (for group sep 526).
```

```
## Incorporation applied (for group sep 527).
```

```
## Incorporation applied (for group sep 528).
```

```
## Incorporation applied (for group sep 53).
```

```
## Incorporation applied (for group sep 532).
```

```
## Incorporation applied (for group sep 533).
```

```
## Incorporation applied (for group sep 534).
```

```
## Incorporation applied (for group sep 538).
```

```
## Incorporation applied (for group sep 539).
```

```
## Incorporation applied (for group sep 54).
```

```
## Incorporation applied (for group sep 540).
```

```
## Incorporation applied (for group sep 544).
```

```
## Incorporation applied (for group sep 545).
```

```
## Incorporation applied (for group sep 546).
```

```
## Incorporation applied (for group sep 550).
```

```
## Incorporation applied (for group sep 551).
```

```
## Incorporation applied (for group sep 552).
```

```
## Incorporation applied (for group sep 556).
```

```
## Incorporation applied (for group sep 557).
```

```
## Incorporation applied (for group sep 558).
```

```
## Incorporation applied (for group sep 562).
```

```
## Incorporation applied (for group sep 563).
```

```
## Incorporation applied (for group sep 564).
```

```
## Incorporation applied (for group sep 568).
```

```
## Incorporation applied (for group sep 569).
```

```
## Incorporation applied (for group sep 570).
```

```
## Incorporation applied (for group sep 574).
```

```
## Incorporation applied (for group sep 575).
```

```
## Incorporation applied (for group sep 576).
```

```
## Incorporation applied (for group sep 58).
```

```
## Incorporation applied (for group sep 580).
```

```
## Incorporation applied (for group sep 581).
```

```
## Incorporation applied (for group sep 582).
```

```
## Incorporation applied (for group sep 586).
```

```
## Incorporation applied (for group sep 587).
```

```
## Incorporation applied (for group sep 588).
```

```
## Incorporation applied (for group sep 59).
```

```
## Incorporation applied (for group sep 592).
```

```
## Incorporation applied (for group sep 593).
```

```
## Incorporation applied (for group sep 594).
```

```
## Incorporation applied (for group sep 598).
```

```
## Incorporation applied (for group sep 599).
```

```
## Incorporation applied (for group sep 6).
```

```
## Incorporation applied (for group sep 60).
```

```
## Incorporation applied (for group sep 600).
```

```
## Incorporation applied (for group sep 604).
```

```
## Incorporation applied (for group sep 605).
```

```
## Incorporation applied (for group sep 606).
```

```
## Incorporation applied (for group sep 610).
```

```
## Incorporation applied (for group sep 611).
```

```
## Incorporation applied (for group sep 612).
```

```
## Incorporation applied (for group sep 616).
```

```
## Incorporation applied (for group sep 617).
```

```
## Incorporation applied (for group sep 618).
```

```
## Incorporation applied (for group sep 622).
```

```
## Incorporation applied (for group sep 623).
```

```
## Incorporation applied (for group sep 624).
```

```
## Incorporation applied (for group sep 628).
```

```
## Incorporation applied (for group sep 629).
```

```
## Incorporation applied (for group sep 630).
```

```
## Incorporation applied (for group sep 634).
```

```
## Incorporation applied (for group sep 635).
```

```
## Incorporation applied (for group sep 636).
```

```
## Incorporation applied (for group sep 64).
```

```
## Incorporation applied (for group sep 640).
```

```
## Incorporation applied (for group sep 641).
```

```
## Incorporation applied (for group sep 642).
```

```
## Incorporation applied (for group sep 646).
```

```
## Incorporation applied (for group sep 647).
```

```
## Incorporation applied (for group sep 648).
```

```
## Incorporation applied (for group sep 65).
```

```
## Incorporation applied (for group sep 652).
```

```
## Incorporation applied (for group sep 653).
```

```
## Incorporation applied (for group sep 654).
```

```
## Incorporation applied (for group sep 658).
```

```
## Incorporation applied (for group sep 659).
```

```
## Incorporation applied (for group sep 66).
```

```
## Incorporation applied (for group sep 660).
```

```
## Incorporation applied (for group sep 664).
```

```
## Incorporation applied (for group sep 665).
```

```
## Incorporation applied (for group sep 666).
```

```
## Incorporation applied (for group sep 670).
```

```
## Incorporation applied (for group sep 671).
```

```
## Incorporation applied (for group sep 672).
```

```
## Incorporation applied (for group sep 676).
```

```
## Incorporation applied (for group sep 677).
```

```
## Incorporation applied (for group sep 678).
```

```
## Incorporation applied (for group sep 682).
```

```
## Incorporation applied (for group sep 683).
```

```
## Incorporation applied (for group sep 684).
```

```
## Incorporation applied (for group sep 688).
```

```
## Incorporation applied (for group sep 689).
```

```
## Incorporation applied (for group sep 690).
```

```
## Incorporation applied (for group sep 694).
```

```
## Incorporation applied (for group sep 695).
```

```
## Incorporation applied (for group sep 696).
```

```
## Incorporation applied (for group sep 70).
```

```
## Incorporation applied (for group sep 700).
```

```
## Incorporation applied (for group sep 701).
```

```
## Incorporation applied (for group sep 702).
```

```
## Incorporation applied (for group sep 706).
```

```
## Incorporation applied (for group sep 707).
```

```
## Incorporation applied (for group sep 708).
```

```
## Incorporation applied (for group sep 71).
```

```
## Incorporation applied (for group sep 712).
```

```
## Incorporation applied (for group sep 713).
```

```
## Incorporation applied (for group sep 714).
```

```
## Incorporation applied (for group sep 718).
```

```
## Incorporation applied (for group sep 719).
```

```
## Incorporation applied (for group sep 72).
```

```
## Incorporation applied (for group sep 720).
```

```
## Incorporation applied (for group sep 724).
```

```
## Incorporation applied (for group sep 725).
```

```
## Incorporation applied (for group sep 726).
```

```
## Incorporation applied (for group sep 730).
```

```
## Incorporation applied (for group sep 731).
```

```
## Incorporation applied (for group sep 732).
```

```
## Incorporation applied (for group sep 736).
```

```
## Incorporation applied (for group sep 737).
```

```
## Incorporation applied (for group sep 738).
```

```
## Incorporation applied (for group sep 742).
```

```
## Incorporation applied (for group sep 743).
```

```
## Incorporation applied (for group sep 744).
```

```
## Incorporation applied (for group sep 748).
```

```
## Incorporation applied (for group sep 749).
```

```
## Incorporation applied (for group sep 750).
```

```
## Incorporation applied (for group sep 754).
```

```
## Incorporation applied (for group sep 755).
```

```
## Incorporation applied (for group sep 756).
```

```
## Incorporation applied (for group sep 76).
```

```
## Incorporation applied (for group sep 760).
```

```
## Incorporation applied (for group sep 761).
```

```
## Incorporation applied (for group sep 762).
```

```
## Incorporation applied (for group sep 766).
```

```
## Incorporation applied (for group sep 767).
```

```
## Incorporation applied (for group sep 768).
```

```
## Incorporation applied (for group sep 77).
```

```
## Incorporation applied (for group sep 772).
```

```
## Incorporation applied (for group sep 773).
```

```
## Incorporation applied (for group sep 774).
```

```
## Incorporation applied (for group sep 778).
```

```
## Incorporation applied (for group sep 779).
```

```
## Incorporation applied (for group sep 78).
```

```
## Incorporation applied (for group sep 780).
```

```
## Incorporation applied (for group sep 784).
```

```
## Incorporation applied (for group sep 785).
```

```
## Incorporation applied (for group sep 786).
```

```
## Incorporation applied (for group sep 790).
```

```
## Incorporation applied (for group sep 791).
```

```
## Incorporation applied (for group sep 792).
```

```
## Incorporation applied (for group sep 796).
```

```
## Incorporation applied (for group sep 797).
```

```
## Incorporation applied (for group sep 798).
```

```
## Incorporation applied (for group sep 802).
```

```
## Incorporation applied (for group sep 803).
```

```
## Incorporation applied (for group sep 804).
```

```
## Incorporation applied (for group sep 808).
```

```
## Incorporation applied (for group sep 809).
```

```
## Incorporation applied (for group sep 810).
```

```
## Incorporation applied (for group sep 814).
```

```
## Incorporation applied (for group sep 815).
```

```
## Incorporation applied (for group sep 816).
```

```
## Incorporation applied (for group sep 82).
```

```
## Incorporation applied (for group sep 820).
```

```
## Incorporation applied (for group sep 821).
```

```
## Incorporation applied (for group sep 822).
```

```
## Incorporation applied (for group sep 826).
```

```
## Incorporation applied (for group sep 827).
```

```
## Incorporation applied (for group sep 828).
```

```
## Incorporation applied (for group sep 83).
```

```
## Incorporation applied (for group sep 832).
```

```
## Incorporation applied (for group sep 833).
```

```
## Incorporation applied (for group sep 834).
```

```
## Incorporation applied (for group sep 838).
```

```
## Incorporation applied (for group sep 839).
```

```
## Incorporation applied (for group sep 84).
```

```
## Incorporation applied (for group sep 840).
```

```
## Incorporation applied (for group sep 844).
```

```
## Incorporation applied (for group sep 845).
```

```
## Incorporation applied (for group sep 846).
```

```
## Incorporation applied (for group sep 850).
```

```
## Incorporation applied (for group sep 851).
```

```
## Incorporation applied (for group sep 852).
```

```
## Incorporation applied (for group sep 856).
```

```
## Incorporation applied (for group sep 857).
```

```
## Incorporation applied (for group sep 858).
```

```
## Incorporation applied (for group sep 862).
```

```
## Incorporation applied (for group sep 863).
```

```
## Incorporation applied (for group sep 864).
```

```
## Incorporation applied (for group sep 868).
```

```
## Incorporation applied (for group sep 869).
```

```
## Incorporation applied (for group sep 870).
```

```
## Incorporation applied (for group sep 874).
```

```
## Incorporation applied (for group sep 875).
```

```
## Incorporation applied (for group sep 876).
```

```
## Incorporation applied (for group sep 88).
```

```
## Incorporation applied (for group sep 880).
```

```
## Incorporation applied (for group sep 881).
```

```
## Incorporation applied (for group sep 882).
```

```
## Incorporation applied (for group sep 886).
```

```
## Incorporation applied (for group sep 887).
```

```
## Incorporation applied (for group sep 888).
```

```
## Incorporation applied (for group sep 89).
```

```
## Incorporation applied (for group sep 892).
```

```
## Incorporation applied (for group sep 893).
```

```
## Incorporation applied (for group sep 894).
```

```
## Incorporation applied (for group sep 898).
```

```
## Incorporation applied (for group sep 899).
```

```
## Incorporation applied (for group sep 90).
```

```
## Incorporation applied (for group sep 900).
```

```
## Incorporation applied (for group sep 904).
```

```
## Incorporation applied (for group sep 905).
```

```
## Incorporation applied (for group sep 906).
```

```
## Incorporation applied (for group sep 910).
```

```
## Incorporation applied (for group sep 911).
```

```
## Incorporation applied (for group sep 912).
```

```
## Incorporation applied (for group sep 916).
```

```
## Incorporation applied (for group sep 917).
```

```
## Incorporation applied (for group sep 918).
```

```
## Incorporation applied (for group sep 922).
```

```
## Incorporation applied (for group sep 923).
```

```
## Incorporation applied (for group sep 924).
```

```
## Incorporation applied (for group sep 928).
```

```
## Incorporation applied (for group sep 929).
```

```
## Incorporation applied (for group sep 930).
```

```
## Incorporation applied (for group sep 934).
```

```
## Incorporation applied (for group sep 935).
```

```
## Incorporation applied (for group sep 936).
```

```
## Incorporation applied (for group sep 94).
```

```
## Incorporation applied (for group sep 940).
```

```
## Incorporation applied (for group sep 941).
```

```
## Incorporation applied (for group sep 942).
```

```
## Incorporation applied (for group sep 946).
```

```
## Incorporation applied (for group sep 947).
```

```
## Incorporation applied (for group sep 948).
```

```
## Incorporation applied (for group sep 95).
```

```
## Incorporation applied (for group sep 952).
```

```
## Incorporation applied (for group sep 953).
```

```
## Incorporation applied (for group sep 954).
```

```
## Incorporation applied (for group sep 958).
```

```
## Incorporation applied (for group sep 959).
```

```
## Incorporation applied (for group sep 96).
```

```
## Incorporation applied (for group sep 960).
```

```
## Incorporation applied (for group sep 964).
```

```
## Incorporation applied (for group sep 965).
```

```
## Incorporation applied (for group sep 966).
```

```
## Incorporation applied (for group sep 970).
```

```
## Incorporation applied (for group sep 971).
```

```
## Incorporation applied (for group sep 972).
```

```
## Incorporation applied (for group sep 976).
```

```
## Incorporation applied (for group sep 977).
```

```
## Incorporation applied (for group sep 978).
```

```
## Incorporation applied (for group sep 982).
```

```
## Incorporation applied (for group sep 983).
```

```
## Incorporation applied (for group sep 984).
```

```
## Incorporation applied (for group sep 988).
```

```
## Incorporation applied (for group sep 989).
```

```
## Incorporation applied (for group sep 990).
```

```
## Incorporation applied (for group sep 994).
```

```
## Incorporation applied (for group sep 995).
```

```
## Incorporation applied (for group sep 996).
```

```
## Warning in alfam2(sfdat, pars = ALFAM2pars02, app.name = "tan.app", time.name = "ct", : Running with 17 parameters. Dropped 7 with no match.
## These secondary parameters have been dropped:
##   app.mthd.os.f0
##   app.mthd.cs.f0
##   app.mthd.ts.r1
##   ts.cereal.hght.r1
##   app.mthd.cs.r3
##   incorp.shallow.f4
##   incorp.shallow.r3
## 
## These secondary parameters are being used:
##   int.f0
##   app.rate.ni.f0
##   man.dm.f0
##   man.source.pig.f0
##   int.r1
##   app.mthd.bc.r1
##   man.dm.r1
##   air.temp.r1
##   wind.2m.r1
##   man.ph.r1
##   int.r2
##   rain.rate.r2
##   int.r3
##   app.mthd.bc.r3
##   man.ph.r3
##   incorp.deep.f4
##   incorp.deep.r3
```

Add results to main df for calculating overall EFs

```r
refdat$EF.field <- signif(refpreds$er, 4)
lfdat$EF.field <- signif(lfpreds$er, 4)
sfdat$EF.field <- signif(sfpreds$er, 4)
```

Check size of data frames


```r
dim(refdat)
```

```
## [1] 45 19
```

```r
dim(lfdat)
```

```
## [1] 2520   23
```

```r
dim(sfdat)
```

```
## [1] 2520   26
```

```r
table(lfdat$man.source, lfdat$scenario, lfdat$app.mthd, lfdat$app.timing)
```

```
## , ,  = Open slot injection,  = April
## 
##            
##             sep sep incorp sf
##   Cattle     27            27
##   Digestate  33            33
##   Pig        24            24
## 
## , ,  = Trailing hose,  = April
## 
##            
##             sep sep incorp sf
##   Cattle     27            27
##   Digestate  33            33
##   Pig        24            24
## 
## , ,  = Trailing shoe,  = April
## 
##            
##             sep sep incorp sf
##   Cattle     27            27
##   Digestate  33            33
##   Pig        24            24
## 
## , ,  = Open slot injection,  = Autumn
## 
##            
##             sep sep incorp sf
##   Cattle     27            27
##   Digestate  33            33
##   Pig        24            24
## 
## , ,  = Trailing hose,  = Autumn
## 
##            
##             sep sep incorp sf
##   Cattle     27            27
##   Digestate  33            33
##   Pig        24            24
## 
## , ,  = Trailing shoe,  = Autumn
## 
##            
##             sep sep incorp sf
##   Cattle     27            27
##   Digestate  33            33
##   Pig        24            24
## 
## , ,  = Open slot injection,  = March
## 
##            
##             sep sep incorp sf
##   Cattle     27            27
##   Digestate  33            33
##   Pig        24            24
## 
## , ,  = Trailing hose,  = March
## 
##            
##             sep sep incorp sf
##   Cattle     27            27
##   Digestate  33            33
##   Pig        24            24
## 
## , ,  = Trailing shoe,  = March
## 
##            
##             sep sep incorp sf
##   Cattle     27            27
##   Digestate  33            33
##   Pig        24            24
## 
## , ,  = Open slot injection,  = May
## 
##            
##             sep sep incorp sf
##   Cattle     27            27
##   Digestate  33            33
##   Pig        24            24
## 
## , ,  = Trailing hose,  = May
## 
##            
##             sep sep incorp sf
##   Cattle     27            27
##   Digestate  33            33
##   Pig        24            24
## 
## , ,  = Trailing shoe,  = May
## 
##            
##             sep sep incorp sf
##   Cattle     27            27
##   Digestate  33            33
##   Pig        24            24
## 
## , ,  = Open slot injection,  = Summer
## 
##            
##             sep sep incorp sf
##   Cattle     27            27
##   Digestate  33            33
##   Pig        24            24
## 
## , ,  = Trailing hose,  = Summer
## 
##            
##             sep sep incorp sf
##   Cattle     27            27
##   Digestate  33            33
##   Pig        24            24
## 
## , ,  = Trailing shoe,  = Summer
## 
##            
##             sep sep incorp sf
##   Cattle     27            27
##   Digestate  33            33
##   Pig        24            24
```

```r
table(sfdat$man.source, sfdat$scenario, sfdat$app.mthd, sfdat$app.timing)
```

```
## , ,  = Broadcast,  = April
## 
##            
##             sep sep incorp sf
##   Cattle     81            81
##   Digestate  99            99
##   Pig        72            72
## 
## , ,  = Broadcast,  = Autumn
## 
##            
##             sep sep incorp sf
##   Cattle     81            81
##   Digestate  99            99
##   Pig        72            72
## 
## , ,  = Broadcast,  = March
## 
##            
##             sep sep incorp sf
##   Cattle     81            81
##   Digestate  99            99
##   Pig        72            72
## 
## , ,  = Broadcast,  = May
## 
##            
##             sep sep incorp sf
##   Cattle     81            81
##   Digestate  99            99
##   Pig        72            72
## 
## , ,  = Broadcast,  = Summer
## 
##            
##             sep sep incorp sf
##   Cattle     81            81
##   Digestate  99            99
##   Pig        72            72
```

