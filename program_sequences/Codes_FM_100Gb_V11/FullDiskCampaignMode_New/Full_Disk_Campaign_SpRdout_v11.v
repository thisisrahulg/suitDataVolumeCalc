15:	1000	SET_CYCLE		55
					000D
17:	1003	CLEAR_FLAG		57
18:	1004	CLEAR_CCD		24
				02
20:	1006	SET_OBSERV_ID		59
				96
21:	1008	SET_FRAME_SIZE		53
				00
22:	100A	SET_BIN		50
				00
23:	100C	SET_LED		54
				2A43
				022A
				4427
24:	1013	HOME_SHU		14
26:	1014	SET_FRAME_TYPE		56
				0E
27:	1016	CCD_START		23
28:	1017	CCD_START		23
29:	1018	CNC		66
30:	1019	SET_BIN		50
				01
31:	101B	CCD_START		23
32:	101C	CCD_START		23
33:	101D	CNC		66
35:	101E	SET_FRAME_TYPE		56
				0D
36:	1020	SET_BIN		50
				00
37:	1022	SET_EXP_TIME		52
				5058
38:	1025	CCD_START		23
39:	1026	CNC		66
40:	1027	SET_EXP_TIME		52
				5068
41:	102A	CCD_START		23
42:	102B	CNC		66
43:	102C	SET_BIN		50
				01
44:	102E	SET_EXP_TIME		52
				5058
45:	1031	CCD_START		23
46:	1032	CNC		66
47:	1033	SET_EXP_TIME		52
				5068
48:	1036	CCD_START		23
49:	1037	CNC		66
51:	1038	SET_OBSERV_ID		59
					97
52:	103A	SET_FRAME_TYPE		56
				00
53:	103C	SET_FRAME_SIZE		53
				00
55:	103E	CLEAR_CCD		24
				02
58:	1040	SET_SEQ		58
				0003
59:	1043	SET_BIN		50
				01
60:	1045	MOVE_FW1		26
				00
61:	1047	MOVE_FW2		27
				00
62:	1049	SET_EXP_TIME		52
				5018
64:	104C	SET_LED		54
					2A43
					022A
					4427
65:	1053	HOME_SHU		14
66:	1054	CCD_START		23
67:	1055	CNC		66
68:	1056	DCR_SEQ		10
69:	1057	JNZS		60
				INIT_FRAMES: 104C
77:	105A	SET_SEQ		58
					0028
78:	105D	CLEAR_CCD		24
				00
80:	105F	SET_FRAME_SIZE		53
					00
81:	1061	SET_BIN		50
				00
83:	1063	MOVE_FW1		26
				06
84:	1065	MOVE_FW2		27
				04
85:	1067	SET_EXP_TIME		52
				51E0
86:	106A	SET_LED		54
				2A43
				022A
				4427
87:	1071	HOME_SHU		14
88:	1072	CCD_START		23
90:	1073	CNC		66
91:	1074	WAIT		30
				1770
92:	1077	CNC		66
94:	1078	SET_BIN		50
				01
95:	107A	MOVE_FW1		26
				00
96:	107C	MOVE_FW2		27
				00
97:	107E	HOME_SHU		14
98:	107F	SET_EXP_TIME		52
				5018
99:	1082	CCD_START		23
101:	1083	CNC		66
102:	1084	FIND_FLARE_SELF		15
103:	1085	JINF		64
				NORM_FLARE: 1266
104:	1088	JIPF		65
				PROM_FLARE: 133B
106:	108B	CNC		66
107:	108C	WAIT		30
				1F40
108:	108F	CNC		66
110:	1090	SET_BIN		50
				00
112:	1092	MOVE_FW1		26
				07
113:	1094	MOVE_FW2		27
				06
114:	1096	SET_EXP_TIME		52
				51F0
115:	1099	HOME_SHU		14
116:	109A	CCD_START		23
118:	109B	CNC		66
119:	109C	WAIT		30
				1770
120:	109F	CNC		66
122:	10A0	SET_BIN		50
				01
123:	10A2	MOVE_FW1		26
				00
124:	10A4	MOVE_FW2		27
				00
125:	10A6	HOME_SHU		14
126:	10A7	SET_EXP_TIME		52
				5018
127:	10AA	CCD_START		23
129:	10AB	CNC		66
130:	10AC	FIND_FLARE_SELF		15
131:	10AD	JINF		64
				NORM_FLARE: 1266
132:	10B0	JIPF		65
				PROM_FLARE: 133B
134:	10B3	CNC		66
135:	10B4	WAIT		30
				1F40
136:	10B7	CNC		66
138:	10B8	SET_BIN		50
				00
139:	10BA	MOVE_FW1		26
				07
140:	10BC	MOVE_FW2		27
				07
141:	10BE	SET_EXP_TIME		52
				51F8
142:	10C1	HOME_SHU		14
143:	10C2	CCD_START		23
145:	10C3	CNC		66
146:	10C4	WAIT		30
				1770
147:	10C7	CNC		66
149:	10C8	SET_BIN		50
				01
150:	10CA	MOVE_FW1		26
				00
151:	10CC	MOVE_FW2		27
				00
152:	10CE	HOME_SHU		14
153:	10CF	SET_EXP_TIME		52
				5018
154:	10D2	CCD_START		23
156:	10D3	CNC		66
157:	10D4	FIND_FLARE_SELF		15
158:	10D5	JINF		64
				NORM_FLARE: 1266
159:	10D8	JIPF		65
				PROM_FLARE: 133B
161:	10DB	CNC		66
162:	10DC	WAIT		30
				1F40
163:	10DF	CNC		66
165:	10E0	DCR_SEQ		10
166:	10E1	JNZS		60
				REPEAT_FDC: 105F
170:	10E4	SET_FRAME_SIZE		53
				00
171:	10E6	SET_BIN		50
				00
172:	10E8	HOME_SHU		14
173:	10E9	SET_EXP_TIME		52
				51A8
174:	10EC	CCD_START		23
176:	10ED	CNC		66
177:	10EE	JIF		62
				JUMP_EXT: 123E
179:	10F1	MOVE_FW1		26
				01
180:	10F3	SET_LED		54
				2A43
				022A
				4427
181:	10FA	HOME_SHU		14
182:	10FB	SET_EXP_TIME		52
				51B0
183:	10FE	CCD_START		23
185:	10FF	CNC		66
186:	1100	JIF		62
				JUMP_EXT: 123E
188:	1103	SET_BIN		50
				01
190:	1105	MOVE_FW1		26
				00
191:	1107	SET_LED		54
				2A43
				022A
				4427
192:	110E	HOME_SHU		14
193:	110F	SET_EXP_TIME		52
				5018
194:	1112	CCD_START		23
196:	1113	CNC		66
198:	1114	FIND_FLARE_SELF		15
199:	1115	JINF		64
				NORM_FLARE: 1266
200:	1118	JIPF		65
				PROM_FLARE: 133B
201:	111B	ROI_UpdateEn		12
203:	111C	SET_BIN		50
				00
205:	111E	MOVE_FW1		26
				02
206:	1120	SET_LED		54
				2A43
				022A
				4427
207:	1127	HOME_SHU		14
208:	1128	SET_EXP_TIME		52
				51B8
209:	112B	CCD_START		23
211:	112C	CNC		66
212:	112D	JIF		62
				JUMP_EXT: 123E
214:	1130	MOVE_FW1		26
				03
215:	1132	SET_LED		54
				2A43
				022A
				4427
216:	1139	HOME_SHU		14
217:	113A	SET_EXP_TIME		52
				51C0
218:	113D	CCD_START		23
220:	113E	CNC		66
221:	113F	JIF		62
				JUMP_EXT: 123E
223:	1142	MOVE_FW1		26
				04
224:	1144	MOVE_FW2		27
				01
225:	1146	SET_LED		54
				2A43
				022A
				4427
226:	114D	HOME_SHU		14
227:	114E	SET_EXP_TIME		52
				51C8
228:	1151	CCD_START		23
230:	1152	CNC		66
231:	1153	JIF		62
				JUMP_EXT: 123E
233:	1156	SET_BIN		50
				01
235:	1158	MOVE_FW1		26
				00
236:	115A	MOVE_FW2		27
				00
237:	115C	SET_LED		54
				2A43
				022A
				4427
238:	1163	HOME_SHU		14
239:	1164	SET_EXP_TIME		52
				5018
240:	1167	CCD_START		23
242:	1168	CNC		66
244:	1169	FIND_FLARE_SELF		15
245:	116A	JINF		64
				NORM_FLARE: 1266
246:	116D	JIPF		65
				PROM_FLARE: 133B
247:	1170	ROI_UpdateEn		12
249:	1171	SET_BIN		50
				00
251:	1173	MOVE_FW1		26
				05
252:	1175	MOVE_FW2		27
				03
253:	1177	SET_LED		54
				2A43
				022A
				4427
254:	117E	HOME_SHU		14
255:	117F	SET_EXP_TIME		52
				51D0
256:	1182	CCD_START		23
258:	1183	CNC		66
259:	1184	JIF		62
				JUMP_EXT: 123E
261:	1187	MOVE_FW1		26
				04
262:	1189	MOVE_FW2		27
				02
263:	118B	SET_LED		54
				2A43
				022A
				4427
264:	1192	HOME_SHU		14
265:	1193	SET_EXP_TIME		52
				51D8
266:	1196	CCD_START		23
268:	1197	CNC		66
269:	1198	JIF		62
				JUMP_EXT: 123E
271:	119B	SET_BIN		50
				01
273:	119D	MOVE_FW1		26
				00
274:	119F	MOVE_FW2		27
				00
275:	11A1	SET_LED		54
				2A43
				022A
				4427
276:	11A8	HOME_SHU		14
277:	11A9	SET_EXP_TIME		52
				5018
278:	11AC	CCD_START		23
280:	11AD	CNC		66
282:	11AE	FIND_FLARE_SELF		15
283:	11AF	JINF		64
				NORM_FLARE: 1266
284:	11B2	JIPF		65
				PROM_FLARE: 133B
285:	11B5	ROI_UpdateEn		12
287:	11B6	SET_BIN		50
				00
289:	11B8	MOVE_FW1		26
				06
290:	11BA	MOVE_FW2		27
				04
291:	11BC	SET_LED		54
				2A43
				022A
				4427
292:	11C3	HOME_SHU		14
293:	11C4	SET_EXP_TIME		52
				51E0
294:	11C7	CCD_START		23
296:	11C8	CNC		66
297:	11C9	JIF		62
				JUMP_EXT: 123E
299:	11CC	MOVE_FW2		27
				05
300:	11CE	SET_LED		54
				2A43
				022A
				4427
301:	11D5	HOME_SHU		14
302:	11D6	SET_EXP_TIME		52
				51E8
303:	11D9	CCD_START		23
305:	11DA	CNC		66
306:	11DB	JIF		62
				JUMP_EXT: 123E
308:	11DE	SET_BIN		50
				01
311:	11E0	MOVE_FW1		26
				00
312:	11E2	MOVE_FW2		27
				00
313:	11E4	SET_LED		54
				2A43
				022A
				4427
314:	11EB	HOME_SHU		14
315:	11EC	SET_EXP_TIME		52
				5018
316:	11EF	CCD_START		23
318:	11F0	CNC		66
320:	11F1	FIND_FLARE_SELF		15
321:	11F2	JINF		64
				NORM_FLARE: 1266
322:	11F5	JIPF		65
				PROM_FLARE: 133B
323:	11F8	ROI_UpdateEn		12
325:	11F9	SET_BIN		50
				00
327:	11FB	MOVE_FW1		26
				07
328:	11FD	MOVE_FW2		27
				06
329:	11FF	SET_LED		54
				2A43
				022A
				4427
330:	1206	HOME_SHU		14
331:	1207	SET_EXP_TIME		52
				51F0
332:	120A	CCD_START		23
334:	120B	CNC		66
336:	120C	JIF		62
				JUMP_EXT: 123E
338:	120F	MOVE_FW2		27
				07
339:	1211	SET_LED		54
				2A43
				022A
				4427
340:	1218	HOME_SHU		14
341:	1219	SET_EXP_TIME		52
				51F8
342:	121C	CCD_START		23
344:	121D	SET_BIN		50
				01
346:	121F	MOVE_FW1		26
				00
347:	1221	MOVE_FW2		27
				00
348:	1223	SET_LED		54
				2A43
				022A
				4427
349:	122A	HOME_SHU		14
350:	122B	SET_EXP_TIME		52
				5018
351:	122E	CCD_START		23
353:	122F	CNC		66
355:	1230	FIND_FLARE_SELF		15
356:	1231	JINF		64
				NORM_FLARE: 1266
357:	1234	JIPF		65
				PROM_FLARE: 133B
359:	1237	DCR_CYCLE		11
360:	1238	JNZC		61
				NORMAL_MODE: 105A
361:	123B	JMP		63
				REPEAT_CAL: 1000
366:	123E	SET_FRAME_SIZE		53
					00
368:	1240	SET_BIN		50
				01
370:	1242	MOVE_FW1		26
				00
371:	1244	MOVE_FW2		27
				00
372:	1246	SET_EXP_TIME		52
				5018
374:	1249	SET_SEQ		58
				003C
376:	124C	SET_LED		54
					2A43
					022A
					4427
377:	1253	HOME_SHU		14
378:	1254	CCD_START		23
379:	1255	CNC		66
381:	1256	ROI_UpdateEn		12
383:	1257	FIND_FLARE_EXT		16
384:	1258	JINF		64
				NORM_FLARE: 1266
385:	125B	JIPF		65
				PROM_FLARE: 133B
387:	125E	DCR_SEQ		10
388:	125F	JNZS		60
				LOC_FLR: 124C
390:	1262	CLEAR_FLAG		57
391:	1263	JMP		63
				NORMAL_MODE: 105A
395:	1266	SET_OBSERV_ID		59
					98
397:	1268	SET_FRAME_SIZE		53
				01
399:	126A	ROI_UpdateEn		12
400:	126B	SET_BIN		50
				00
402:	126D	SET_SEQ		58
				0078
404:	1270	CHK_ADU		13
				FF
406:	1272	SET_LED		54
				2A43
				022A
				4427
407:	1279	HOME_SHU		14
408:	127A	SET_EXP_TIME		52
				51A8
409:	127D	CCD_START		23
410:	127E	CNC		66
411:	127F	CHK_ADU		13
				00
413:	1281	SET_LED		54
					2A43
					022A
					4427
414:	1288	HOME_SHU		14
415:	1289	SET_EXP_TIME		52
				A000
416:	128C	CCD_START		23
418:	128D	CHK_ADU		13
				00
420:	128F	ROI_UpdateEn		12
421:	1290	MOVE_FW1		26
				01
422:	1292	SET_LED		54
				2A43
				022A
				4427
423:	1299	HOME_SHU		14
424:	129A	SET_EXP_TIME		52
				A008
425:	129D	CCD_START		23
426:	129E	CNC		66
428:	129F	MOVE_FW1		26
				02
429:	12A1	SET_LED		54
				2A43
				022A
				4427
430:	12A8	HOME_SHU		14
431:	12A9	SET_EXP_TIME		52
				A010
432:	12AC	CCD_START		23
433:	12AD	CNC		66
435:	12AE	MOVE_FW1		26
				03
436:	12B0	SET_LED		54
				2A43
				022A
				4427
437:	12B7	HOME_SHU		14
438:	12B8	SET_EXP_TIME		52
				A018
439:	12BB	CCD_START		23
440:	12BC	CNC		66
442:	12BD	MOVE_FW1		26
				04
443:	12BF	MOVE_FW2		27
				01
444:	12C1	SET_LED		54
				2A43
				022A
				4427
445:	12C8	HOME_SHU		14
446:	12C9	SET_EXP_TIME		52
				A020
447:	12CC	CCD_START		23
448:	12CD	CNC		66
450:	12CE	MOVE_FW2		27
				02
451:	12D0	SET_LED		54
				2A43
				022A
				4427
452:	12D7	HOME_SHU		14
453:	12D8	SET_EXP_TIME		52
				A030
454:	12DB	CCD_START		23
455:	12DC	CNC		66
457:	12DD	MOVE_FW1		26
				05
458:	12DF	MOVE_FW2		27
				03
459:	12E1	SET_LED		54
				2A43
				022A
				4427
460:	12E8	HOME_SHU		14
461:	12E9	SET_EXP_TIME		52
				A028
462:	12EC	CCD_START		23
463:	12ED	CNC		66
465:	12EE	MOVE_FW1		26
				06
466:	12F0	MOVE_FW2		27
				05
467:	12F2	SET_LED		54
				2A43
				022A
				4427
468:	12F9	HOME_SHU		14
469:	12FA	SET_EXP_TIME		52
				A038
470:	12FD	CCD_START		23
471:	12FE	CNC		66
473:	12FF	MOVE_FW2		27
				05
474:	1301	SET_LED		54
				2A43
				022A
				4427
475:	1308	HOME_SHU		14
476:	1309	SET_EXP_TIME		52
				A040
477:	130C	CCD_START		23
478:	130D	CNC		66
480:	130E	MOVE_FW1		26
				07
481:	1310	MOVE_FW2		27
				06
482:	1312	SET_LED		54
				2A43
				022A
				4427
483:	1319	HOME_SHU		14
484:	131A	SET_EXP_TIME		52
				A048
485:	131D	CCD_START		23
486:	131E	CNC		66
489:	131F	MOVE_FW2		27
				07
490:	1321	SET_LED		54
				2A43
				022A
				4427
491:	1328	HOME_SHU		14
492:	1329	SET_EXP_TIME		52
				A050
493:	132C	CCD_START		23
494:	132D	CNC		66
496:	132E	DCR_SEQ		10
498:	132F	CHK_ADU		13
				FF
500:	1331	MOVE_FW1		26
				00
501:	1333	MOVE_FW2		27
				00
503:	1335	JNZS		60
				REPEAT_FLARE: 1281
505:	1338	JMP		63
				EXIT_FLARE: 13B0
509:	133B	SET_OBSERV_ID		59
					99
510:	133D	SET_FRAME_SIZE		53
				01
511:	133F	ROI_UpdateEn		12
513:	1340	SET_BIN		50
				00
514:	1342	SET_SEQ		58
				0078
516:	1345	CHK_ADU		13
				FF
518:	1347	SET_LED		54
				2A43
				022A
				4427
519:	134E	HOME_SHU		14
520:	134F	SET_EXP_TIME		52
				51A8
522:	1352	CCD_START		23
524:	1353	CNC		66
525:	1354	CHK_ADU		13
				00
527:	1356	SET_LED		54
					2A43
					022A
					4427
528:	135D	HOME_SHU		14
529:	135E	SET_EXP_TIME		52
				A000
530:	1361	CCD_START		23
532:	1362	CHK_ADU		13
				00
534:	1364	ROI_UpdateEn		12
535:	1365	MOVE_FW1		26
				01
536:	1367	SET_LED		54
				2A43
				022A
				4427
537:	136E	HOME_SHU		14
538:	136F	SET_EXP_TIME		52
				A008
539:	1372	CCD_START		23
540:	1373	CNC		66
542:	1374	MOVE_FW1		26
				02
543:	1376	SET_LED		54
				2A43
				022A
				4427
544:	137D	HOME_SHU		14
545:	137E	SET_EXP_TIME		52
				A010
546:	1381	CCD_START		23
547:	1382	CNC		66
549:	1383	MOVE_FW1		26
				03
550:	1385	SET_LED		54
				2A43
				022A
				4427
551:	138C	HOME_SHU		14
552:	138D	SET_EXP_TIME		52
				A018
553:	1390	CCD_START		23
554:	1391	CNC		66
556:	1392	MOVE_FW1		26
				05
557:	1394	MOVE_FW2		27
				03
558:	1396	SET_LED		54
				2A43
				022A
				4427
559:	139D	HOME_SHU		14
560:	139E	SET_EXP_TIME		52
				A028
561:	13A1	CCD_START		23
562:	13A2	CNC		66
564:	13A3	DCR_SEQ		10
566:	13A4	CHK_ADU		13
				FF
568:	13A6	MOVE_FW1		26
				00
569:	13A8	MOVE_FW2		27
				00
571:	13AA	JNZS		60
				REPEAT_PROM: 1356
573:	13AD	JMP		63
				EXIT_FLARE: 13B0
575:	13B0	CHK_ADU		13
					00
576:	13B2	CLEAR_FLAG		57
577:	13B3	JMP		63
				BEGIN: 1038
