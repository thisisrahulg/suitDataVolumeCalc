12:	1000	SET_CYCLE		55
					0010
14:	1003	CLEAR_FLAG		57
15:	1004	CLEAR_CCD		24
				02
17:	1006	SET_OBSERV_ID		59
				AA
18:	1008	SET_FRAME_SIZE		53
				00
19:	100A	SET_BIN		50
				00
20:	100C	SET_LED		54
				2A43
				022A
				4427
21:	1013	HOME_SHU		14
23:	1014	SET_FRAME_TYPE		56
				0E
24:	1016	CCD_START		23
25:	1017	CCD_START		23
26:	1018	CNC		66
27:	1019	SET_BIN		50
				01
28:	101B	CCD_START		23
29:	101C	CCD_START		23
30:	101D	CNC		66
32:	101E	SET_FRAME_TYPE		56
				0D
33:	1020	SET_BIN		50
				00
34:	1022	SET_EXP_TIME		52
				5058
35:	1025	CCD_START		23
36:	1026	CNC		66
37:	1027	SET_EXP_TIME		52
				5068
38:	102A	CCD_START		23
39:	102B	CNC		66
40:	102C	SET_BIN		50
				01
41:	102E	SET_EXP_TIME		52
				5058
42:	1031	CCD_START		23
43:	1032	CNC		66
44:	1033	SET_EXP_TIME		52
				5068
45:	1036	CCD_START		23
46:	1037	CNC		66
48:	1038	SET_OBSERV_ID		59
					AB
49:	103A	SET_FRAME_TYPE		56
				00
50:	103C	SET_FRAME_SIZE		53
				00
52:	103E	CLEAR_CCD		24
				02
54:	1040	SET_SEQ		58
				0003
55:	1043	SET_BIN		50
				01
56:	1045	MOVE_FW1		26
				00
57:	1047	MOVE_FW2		27
				00
58:	1049	SET_EXP_TIME		52
				5018
60:	104C	SET_LED		54
					2A43
					022A
					4427
61:	1053	HOME_SHU		14
62:	1054	CCD_START		23
63:	1055	CNC		66
64:	1056	DCR_SEQ		10
65:	1057	JNZS		60
				INIT_FRAMES: 104C
71:	105A	SET_SEQ		58
					001C
72:	105D	CLEAR_CCD		24
				00
74:	105F	SET_FRAME_SIZE		53
					01
75:	1061	ROI_UpdateEn		12
76:	1062	SET_BIN		50
				00
77:	1064	SET_LED		54
				2A43
				022A
				4427
78:	106B	HOME_SHU		14
79:	106C	SET_EXP_TIME		52
				51A8
80:	106F	CCD_START		23
81:	1070	CNC		66
82:	1071	JIF		62
				JUMP_EXT: 1329
84:	1074	MOVE_FW1		26
				01
85:	1076	SET_LED		54
				2A43
				022A
				4427
86:	107D	HOME_SHU		14
87:	107E	SET_EXP_TIME		52
				51B0
88:	1081	CCD_START		23
89:	1082	CNC		66
90:	1083	JIF		62
				JUMP_EXT: 1329
92:	1086	MOVE_FW1		26
				02
93:	1088	SET_LED		54
				2A43
				022A
				4427
94:	108F	HOME_SHU		14
95:	1090	SET_EXP_TIME		52
				51B8
96:	1093	CCD_START		23
97:	1094	CNC		66
98:	1095	JIF		62
				JUMP_EXT: 1329
100:	1098	MOVE_FW1		26
				03
101:	109A	SET_LED		54
				2A43
				022A
				4427
102:	10A1	HOME_SHU		14
103:	10A2	SET_EXP_TIME		52
				51C0
104:	10A5	CCD_START		23
105:	10A6	CNC		66
106:	10A7	JIF		62
				JUMP_EXT: 1329
108:	10AA	MOVE_FW1		26
				04
109:	10AC	MOVE_FW2		27
				01
110:	10AE	SET_LED		54
				2A43
				022A
				4427
111:	10B5	HOME_SHU		14
112:	10B6	SET_EXP_TIME		52
				51C8
113:	10B9	CCD_START		23
114:	10BA	CNC		66
115:	10BB	JIF		62
				JUMP_EXT: 1329
117:	10BE	MOVE_FW2		27
				02
118:	10C0	SET_LED		54
				2A43
				022A
				4427
119:	10C7	HOME_SHU		14
120:	10C8	SET_EXP_TIME		52
				51D8
121:	10CB	CCD_START		23
122:	10CC	CNC		66
123:	10CD	JIF		62
				JUMP_EXT: 1329
125:	10D0	MOVE_FW1		26
				05
126:	10D2	MOVE_FW2		27
				03
127:	10D4	SET_LED		54
				2A43
				022A
				4427
128:	10DB	HOME_SHU		14
129:	10DC	SET_EXP_TIME		52
				51D0
130:	10DF	CCD_START		23
131:	10E0	CNC		66
132:	10E1	JIF		62
				JUMP_EXT: 1329
134:	10E4	MOVE_FW1		26
				06
135:	10E6	MOVE_FW2		27
				05
136:	10E8	SET_LED		54
				2A43
				022A
				4427
137:	10EF	HOME_SHU		14
138:	10F0	SET_EXP_TIME		52
				51E8
139:	10F3	CCD_START		23
140:	10F4	CNC		66
141:	10F5	JIF		62
				JUMP_EXT: 1329
143:	10F8	SET_BIN		50
				01
144:	10FA	SET_FRAME_SIZE		53
				00
146:	10FC	MOVE_FW1		26
				00
147:	10FE	MOVE_FW2		27
				00
148:	1100	SET_LED		54
				2A43
				022A
				4427
149:	1107	HOME_SHU		14
150:	1108	SET_EXP_TIME		52
				5018
151:	110B	CCD_START		23
153:	110C	FIND_FLARE_SELF		15
154:	110D	JINF		64
				NORM_FLARE: 1351
155:	1110	JIPF		65
				PROM_FLARE: 1426
157:	1113	CNC		66
158:	1114	JIF		62
				JUMP_EXT: 1329
160:	1117	DCR_SEQ		10
161:	1118	JNZS		60
				REPEAT_ROI: 105F
166:	111B	SET_FRAME_SIZE		53
				00
167:	111D	SET_BIN		50
				00
168:	111F	ROI_UpdateEn		12
169:	1120	SET_LED		54
				2A43
				022A
				4427
170:	1127	HOME_SHU		14
171:	1128	SET_EXP_TIME		52
				51A8
172:	112B	CCD_START		23
173:	112C	CNC		66
174:	112D	JIF		62
				JUMP_EXT: 1329
176:	1130	SET_BIN		50
				01
178:	1132	MOVE_FW1		26
				00
179:	1134	SET_LED		54
				2A43
				022A
				4427
180:	113B	HOME_SHU		14
181:	113C	SET_EXP_TIME		52
				5018
182:	113F	CCD_START		23
183:	1140	CNC		66
185:	1141	FIND_FLARE_SELF		15
187:	1142	JINF		64
				NORM_FLARE: 1351
188:	1145	JIPF		65
				PROM_FLARE: 1426
189:	1148	ROI_UpdateEn		12
191:	1149	SET_BIN		50
				00
193:	114B	MOVE_FW1		26
				01
194:	114D	SET_LED		54
				2A43
				022A
				4427
195:	1154	HOME_SHU		14
196:	1155	SET_EXP_TIME		52
				51B0
197:	1158	CCD_START		23
198:	1159	CNC		66
199:	115A	JIF		62
				JUMP_EXT: 1329
201:	115D	SET_BIN		50
				01
203:	115F	MOVE_FW1		26
				00
204:	1161	SET_LED		54
				2A43
				022A
				4427
205:	1168	HOME_SHU		14
206:	1169	SET_EXP_TIME		52
				5018
207:	116C	CCD_START		23
208:	116D	CNC		66
210:	116E	FIND_FLARE_SELF		15
212:	116F	JINF		64
				NORM_FLARE: 1351
213:	1172	JIPF		65
				PROM_FLARE: 1426
214:	1175	ROI_UpdateEn		12
216:	1176	SET_BIN		50
				00
218:	1178	MOVE_FW1		26
				02
219:	117A	SET_LED		54
				2A43
				022A
				4427
220:	1181	HOME_SHU		14
221:	1182	SET_EXP_TIME		52
				51B8
222:	1185	CCD_START		23
223:	1186	CNC		66
224:	1187	JIF		62
				JUMP_EXT: 1329
226:	118A	SET_BIN		50
				01
228:	118C	MOVE_FW1		26
				00
229:	118E	SET_LED		54
				2A43
				022A
				4427
230:	1195	HOME_SHU		14
231:	1196	SET_EXP_TIME		52
				5018
232:	1199	CCD_START		23
233:	119A	CNC		66
235:	119B	FIND_FLARE_SELF		15
237:	119C	JINF		64
				NORM_FLARE: 1351
238:	119F	JIPF		65
				PROM_FLARE: 1426
239:	11A2	ROI_UpdateEn		12
241:	11A3	SET_BIN		50
				00
243:	11A5	MOVE_FW1		26
				03
244:	11A7	SET_LED		54
				2A43
				022A
				4427
245:	11AE	HOME_SHU		14
246:	11AF	SET_EXP_TIME		52
				51C0
247:	11B2	CCD_START		23
248:	11B3	CNC		66
249:	11B4	JIF		62
				JUMP_EXT: 1329
251:	11B7	SET_BIN		50
				01
253:	11B9	MOVE_FW1		26
				00
254:	11BB	SET_LED		54
				2A43
				022A
				4427
255:	11C2	HOME_SHU		14
256:	11C3	SET_EXP_TIME		52
				5018
257:	11C6	CCD_START		23
258:	11C7	CNC		66
260:	11C8	FIND_FLARE_SELF		15
262:	11C9	JINF		64
				NORM_FLARE: 1351
263:	11CC	JIPF		65
				PROM_FLARE: 1426
264:	11CF	ROI_UpdateEn		12
266:	11D0	SET_BIN		50
				00
268:	11D2	MOVE_FW1		26
				04
269:	11D4	MOVE_FW2		27
				01
270:	11D6	SET_LED		54
				2A43
				022A
				4427
271:	11DD	HOME_SHU		14
272:	11DE	SET_EXP_TIME		52
				51C8
273:	11E1	CCD_START		23
274:	11E2	CNC		66
275:	11E3	JIF		62
				JUMP_EXT: 1329
277:	11E6	SET_BIN		50
				01
279:	11E8	MOVE_FW1		26
				00
280:	11EA	MOVE_FW2		27
				00
281:	11EC	SET_LED		54
				2A43
				022A
				4427
282:	11F3	HOME_SHU		14
283:	11F4	SET_EXP_TIME		52
				5018
284:	11F7	CCD_START		23
285:	11F8	CNC		66
287:	11F9	FIND_FLARE_SELF		15
289:	11FA	JINF		64
				NORM_FLARE: 1351
290:	11FD	JIPF		65
				PROM_FLARE: 1426
291:	1200	ROI_UpdateEn		12
293:	1201	SET_BIN		50
				00
295:	1203	MOVE_FW1		26
				04
296:	1205	MOVE_FW2		27
				02
297:	1207	SET_LED		54
				2A43
				022A
				4427
298:	120E	HOME_SHU		14
299:	120F	SET_EXP_TIME		52
				51D8
300:	1212	CCD_START		23
301:	1213	CNC		66
302:	1214	JIF		62
				JUMP_EXT: 1329
304:	1217	SET_BIN		50
				01
306:	1219	MOVE_FW1		26
				00
307:	121B	MOVE_FW2		27
				00
308:	121D	SET_LED		54
				2A43
				022A
				4427
309:	1224	HOME_SHU		14
310:	1225	SET_EXP_TIME		52
				5018
311:	1228	CCD_START		23
312:	1229	CNC		66
314:	122A	FIND_FLARE_SELF		15
315:	122B	JINF		64
				NORM_FLARE: 1351
316:	122E	JIPF		65
				PROM_FLARE: 1426
317:	1231	ROI_UpdateEn		12
319:	1232	SET_BIN		50
				00
321:	1234	MOVE_FW1		26
				05
322:	1236	MOVE_FW2		27
				03
323:	1238	SET_LED		54
				2A43
				022A
				4427
324:	123F	HOME_SHU		14
325:	1240	SET_EXP_TIME		52
				51D0
326:	1243	CCD_START		23
327:	1244	CNC		66
328:	1245	JIF		62
				JUMP_EXT: 1329
330:	1248	SET_BIN		50
				01
332:	124A	MOVE_FW1		26
				00
333:	124C	MOVE_FW2		27
				00
334:	124E	SET_LED		54
				2A43
				022A
				4427
335:	1255	HOME_SHU		14
336:	1256	SET_EXP_TIME		52
				5018
337:	1259	CCD_START		23
338:	125A	CNC		66
340:	125B	FIND_FLARE_SELF		15
341:	125C	JINF		64
				NORM_FLARE: 1351
342:	125F	JIPF		65
				PROM_FLARE: 1426
343:	1262	ROI_UpdateEn		12
345:	1263	SET_BIN		50
				00
347:	1265	MOVE_FW1		26
				06
348:	1267	MOVE_FW2		27
				04
349:	1269	SET_LED		54
				2A43
				022A
				4427
350:	1270	HOME_SHU		14
351:	1271	SET_EXP_TIME		52
				51E0
352:	1274	CCD_START		23
353:	1275	CNC		66
354:	1276	JIF		62
				JUMP_EXT: 1329
356:	1279	SET_BIN		50
				01
358:	127B	MOVE_FW1		26
				00
359:	127D	MOVE_FW2		27
				00
360:	127F	SET_LED		54
				2A43
				022A
				4427
361:	1286	HOME_SHU		14
362:	1287	SET_EXP_TIME		52
				5018
363:	128A	CCD_START		23
364:	128B	CNC		66
366:	128C	FIND_FLARE_SELF		15
368:	128D	JINF		64
				NORM_FLARE: 1351
369:	1290	JIPF		65
				PROM_FLARE: 1426
370:	1293	ROI_UpdateEn		12
372:	1294	SET_BIN		50
				00
374:	1296	MOVE_FW1		26
				06
375:	1298	MOVE_FW2		27
				05
376:	129A	SET_LED		54
				2A43
				022A
				4427
377:	12A1	HOME_SHU		14
378:	12A2	SET_EXP_TIME		52
				51E8
379:	12A5	CCD_START		23
380:	12A6	CNC		66
381:	12A7	JIF		62
				JUMP_EXT: 1329
383:	12AA	SET_BIN		50
				01
386:	12AC	MOVE_FW1		26
				00
387:	12AE	MOVE_FW2		27
				00
388:	12B0	SET_LED		54
				2A43
				022A
				4427
389:	12B7	HOME_SHU		14
390:	12B8	SET_EXP_TIME		52
				5018
391:	12BB	CCD_START		23
392:	12BC	CNC		66
394:	12BD	FIND_FLARE_SELF		15
396:	12BE	JINF		64
				NORM_FLARE: 1351
397:	12C1	JIPF		65
				PROM_FLARE: 1426
398:	12C4	ROI_UpdateEn		12
400:	12C5	SET_BIN		50
				00
402:	12C7	MOVE_FW1		26
				07
403:	12C9	MOVE_FW2		27
				06
404:	12CB	SET_LED		54
				2A43
				022A
				4427
405:	12D2	HOME_SHU		14
406:	12D3	SET_EXP_TIME		52
				51F0
407:	12D6	CCD_START		23
408:	12D7	CNC		66
410:	12D8	JIF		62
				JUMP_EXT: 1329
412:	12DB	SET_BIN		50
				01
415:	12DD	MOVE_FW1		26
				00
416:	12DF	MOVE_FW2		27
				00
417:	12E1	SET_LED		54
				2A43
				022A
				4427
418:	12E8	HOME_SHU		14
419:	12E9	SET_EXP_TIME		52
				5018
420:	12EC	CCD_START		23
421:	12ED	CNC		66
423:	12EE	FIND_FLARE_SELF		15
425:	12EF	JINF		64
				NORM_FLARE: 1351
426:	12F2	JIPF		65
				PROM_FLARE: 1426
427:	12F5	ROI_UpdateEn		12
429:	12F6	SET_BIN		50
				00
431:	12F8	MOVE_FW1		26
				07
432:	12FA	MOVE_FW2		27
				07
433:	12FC	SET_LED		54
				2A43
				022A
				4427
434:	1303	HOME_SHU		14
435:	1304	SET_EXP_TIME		52
				51F8
436:	1307	CCD_START		23
438:	1308	SET_BIN		50
				01
440:	130A	MOVE_FW1		26
				00
441:	130C	MOVE_FW2		27
				00
442:	130E	SET_LED		54
				2A43
				022A
				4427
443:	1315	HOME_SHU		14
444:	1316	SET_EXP_TIME		52
				5018
445:	1319	CCD_START		23
446:	131A	CNC		66
448:	131B	FIND_FLARE_SELF		15
449:	131C	JINF		64
				NORM_FLARE: 1351
450:	131F	JIPF		65
				PROM_FLARE: 1426
452:	1322	DCR_CYCLE		11
453:	1323	JNZC		61
				NORMAL_MODE: 105A
454:	1326	JMP		63
				REPEAT_CAL: 1000
458:	1329	SET_FRAME_SIZE		53
					00
460:	132B	SET_BIN		50
				01
462:	132D	MOVE_FW1		26
				00
463:	132F	MOVE_FW2		27
				00
464:	1331	SET_EXP_TIME		52
				5018
466:	1334	SET_SEQ		58
				000F
468:	1337	SET_LED		54
					2A43
					022A
					4427
469:	133E	HOME_SHU		14
470:	133F	CCD_START		23
471:	1340	CNC		66
472:	1341	ROI_UpdateEn		12
474:	1342	FIND_FLARE_EXT		16
475:	1343	JINF		64
				NORM_FLARE: 1351
476:	1346	JIPF		65
				PROM_FLARE: 1426
478:	1349	DCR_SEQ		10
479:	134A	JNZS		60
				LOC_FLR: 1337
481:	134D	CLEAR_FLAG		57
482:	134E	JMP		63
				NORMAL_MODE: 105A
486:	1351	SET_OBSERV_ID		59
					AC
487:	1353	SET_FRAME_SIZE		53
				01
488:	1355	ROI_UpdateEn		12
489:	1356	SET_BIN		50
				00
491:	1358	SET_SEQ		58
				0050
493:	135B	CHK_ADU		13
				FF
495:	135D	SET_LED		54
				2A43
				022A
				4427
496:	1364	HOME_SHU		14
497:	1365	SET_EXP_TIME		52
				51A8
498:	1368	CCD_START		23
499:	1369	CNC		66
500:	136A	CHK_ADU		13
				00
502:	136C	SET_LED		54
					2A43
					022A
					4427
503:	1373	HOME_SHU		14
504:	1374	SET_EXP_TIME		52
				A000
505:	1377	CCD_START		23
507:	1378	CHK_ADU		13
				00
509:	137A	ROI_UpdateEn		12
511:	137B	MOVE_FW1		26
				01
512:	137D	SET_LED		54
				2A43
				022A
				4427
513:	1384	HOME_SHU		14
514:	1385	SET_EXP_TIME		52
				A008
515:	1388	CCD_START		23
516:	1389	CNC		66
518:	138A	MOVE_FW1		26
				02
519:	138C	SET_LED		54
				2A43
				022A
				4427
520:	1393	HOME_SHU		14
521:	1394	SET_EXP_TIME		52
				A010
522:	1397	CCD_START		23
523:	1398	CNC		66
525:	1399	MOVE_FW1		26
				03
526:	139B	SET_LED		54
				2A43
				022A
				4427
527:	13A2	HOME_SHU		14
528:	13A3	SET_EXP_TIME		52
				A018
529:	13A6	CCD_START		23
530:	13A7	CNC		66
532:	13A8	MOVE_FW1		26
				04
533:	13AA	MOVE_FW2		27
				01
534:	13AC	SET_LED		54
				2A43
				022A
				4427
535:	13B3	HOME_SHU		14
536:	13B4	SET_EXP_TIME		52
				A020
537:	13B7	CCD_START		23
538:	13B8	CNC		66
540:	13B9	MOVE_FW2		27
				02
541:	13BB	SET_LED		54
				2A43
				022A
				4427
542:	13C2	HOME_SHU		14
543:	13C3	SET_EXP_TIME		52
				A030
544:	13C6	CCD_START		23
545:	13C7	CNC		66
547:	13C8	MOVE_FW1		26
				05
548:	13CA	MOVE_FW2		27
				03
549:	13CC	SET_LED		54
				2A43
				022A
				4427
550:	13D3	HOME_SHU		14
551:	13D4	SET_EXP_TIME		52
				A028
552:	13D7	CCD_START		23
553:	13D8	CNC		66
555:	13D9	MOVE_FW1		26
				06
556:	13DB	MOVE_FW2		27
				05
557:	13DD	SET_LED		54
				2A43
				022A
				4427
558:	13E4	HOME_SHU		14
559:	13E5	SET_EXP_TIME		52
				A038
560:	13E8	CCD_START		23
561:	13E9	CNC		66
563:	13EA	MOVE_FW2		27
				05
564:	13EC	SET_EXP_TIME		52
				A040
565:	13EF	SET_LED		54
				2A43
				022A
				4427
566:	13F6	HOME_SHU		14
567:	13F7	CCD_START		23
568:	13F8	CNC		66
570:	13F9	MOVE_FW1		26
				07
571:	13FB	MOVE_FW2		27
				06
572:	13FD	SET_LED		54
				2A43
				022A
				4427
573:	1404	HOME_SHU		14
574:	1405	SET_EXP_TIME		52
				A048
575:	1408	CCD_START		23
576:	1409	CNC		66
578:	140A	MOVE_FW2		27
				07
579:	140C	SET_LED		54
				2A43
				022A
				4427
580:	1413	HOME_SHU		14
581:	1414	SET_EXP_TIME		52
				A050
582:	1417	CCD_START		23
583:	1418	CNC		66
585:	1419	DCR_SEQ		10
587:	141A	CHK_ADU		13
				FF
589:	141C	MOVE_FW1		26
				00
590:	141E	MOVE_FW2		27
				00
592:	1420	JNZS		60
				REPEAT_FLARE: 136C
594:	1423	JMP		63
				EXIT_FLARE: 149B
599:	1426	SET_OBSERV_ID		59
					AD
600:	1428	SET_FRAME_SIZE		53
				01
601:	142A	ROI_UpdateEn		12
603:	142B	SET_BIN		50
				00
604:	142D	SET_SEQ		58
				0078
606:	1430	CHK_ADU		13
				FF
608:	1432	SET_LED		54
				2A43
				022A
				4427
609:	1439	HOME_SHU		14
610:	143A	SET_EXP_TIME		52
				51A8
612:	143D	CCD_START		23
614:	143E	CNC		66
615:	143F	CHK_ADU		13
				00
617:	1441	SET_LED		54
					2A43
					022A
					4427
618:	1448	HOME_SHU		14
619:	1449	SET_EXP_TIME		52
				A000
620:	144C	CCD_START		23
622:	144D	CHK_ADU		13
				00
624:	144F	ROI_UpdateEn		12
626:	1450	MOVE_FW1		26
				01
627:	1452	SET_LED		54
				2A43
				022A
				4427
628:	1459	HOME_SHU		14
629:	145A	SET_EXP_TIME		52
				A008
630:	145D	CCD_START		23
631:	145E	CNC		66
633:	145F	MOVE_FW1		26
				02
634:	1461	SET_LED		54
				2A43
				022A
				4427
635:	1468	HOME_SHU		14
636:	1469	SET_EXP_TIME		52
				A010
637:	146C	CCD_START		23
638:	146D	CNC		66
640:	146E	MOVE_FW1		26
				03
641:	1470	SET_LED		54
				2A43
				022A
				4427
642:	1477	HOME_SHU		14
643:	1478	SET_EXP_TIME		52
				A018
644:	147B	CCD_START		23
645:	147C	CNC		66
647:	147D	MOVE_FW1		26
				05
648:	147F	MOVE_FW2		27
				03
649:	1481	SET_LED		54
				2A43
				022A
				4427
650:	1488	HOME_SHU		14
651:	1489	SET_EXP_TIME		52
				A028
652:	148C	CCD_START		23
653:	148D	CNC		66
655:	148E	DCR_SEQ		10
657:	148F	CHK_ADU		13
				FF
659:	1491	MOVE_FW1		26
				00
660:	1493	MOVE_FW2		27
				00
662:	1495	JNZS		60
				REPEAT_PROM: 1441
664:	1498	JMP		63
				EXIT_FLARE: 149B
667:	149B	CHK_ADU		13
					00
668:	149D	CLEAR_FLAG		57
669:	149E	JMP		63
				BEGIN: 1038
