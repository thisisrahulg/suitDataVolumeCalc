16:	1000	SET_CYCLE		55
					001F
18:	1003	CLEAR_FLAG		57
19:	1004	CLEAR_CCD		24
				02
21:	1006	SET_OBSERV_ID		59
				9E
22:	1008	SET_FRAME_SIZE		53
				00
23:	100A	SET_BIN		50
				00
24:	100C	SET_LED		54
				2A43
				022A
				4427
25:	1013	HOME_SHU		14
27:	1014	SET_FRAME_TYPE		56
				0E
28:	1016	CCD_START		23
29:	1017	CCD_START		23
30:	1018	CNC		66
31:	1019	SET_BIN		50
				01
32:	101B	CCD_START		23
33:	101C	CCD_START		23
34:	101D	CNC		66
36:	101E	SET_FRAME_TYPE		56
				0D
37:	1020	SET_BIN		50
				00
38:	1022	SET_EXP_TIME		52
				5058
39:	1025	CCD_START		23
40:	1026	CNC		66
41:	1027	SET_EXP_TIME		52
				5068
42:	102A	CCD_START		23
43:	102B	CNC		66
44:	102C	SET_BIN		50
				01
45:	102E	SET_EXP_TIME		52
				5058
46:	1031	CCD_START		23
47:	1032	CNC		66
48:	1033	SET_EXP_TIME		52
				5068
49:	1036	CCD_START		23
50:	1037	CNC		66
52:	1038	SET_OBSERV_ID		59
					9F
53:	103A	SET_FRAME_TYPE		56
				00
54:	103C	SET_FRAME_SIZE		53
				00
56:	103E	CLEAR_CCD		24
				02
59:	1040	SET_SEQ		58
				0003
60:	1043	SET_BIN		50
				01
61:	1045	MOVE_FW1		26
				00
62:	1047	MOVE_FW2		27
				00
63:	1049	SET_EXP_TIME		52
				5018
65:	104C	SET_LED		54
					2A43
					022A
					4427
66:	1053	HOME_SHU		14
67:	1054	CCD_START		23
68:	1055	CNC		66
69:	1056	DCR_SEQ		10
70:	1057	JNZS		60
				INIT_FRAMES: 104C
77:	105A	SET_SEQ		58
					0017
78:	105D	CLEAR_CCD		24
				00
80:	105F	SET_FRAME_SIZE		53
					01
81:	1061	ROI_UpdateEn		12
82:	1062	SET_BIN		50
				00
83:	1064	SET_LED		54
				2A43
				022A
				4427
84:	106B	HOME_SHU		14
85:	106C	SET_EXP_TIME		52
				51A8
86:	106F	CCD_START		23
87:	1070	CNC		66
88:	1071	JIF		62
				JUMP_EXT: 1296
90:	1074	MOVE_FW1		26
				01
91:	1076	SET_LED		54
				2A43
				022A
				4427
92:	107D	HOME_SHU		14
93:	107E	SET_EXP_TIME		52
				51B0
94:	1081	CCD_START		23
95:	1082	CNC		66
96:	1083	JIF		62
				JUMP_EXT: 1296
98:	1086	MOVE_FW1		26
				02
99:	1088	SET_LED		54
				2A43
				022A
				4427
100:	108F	HOME_SHU		14
101:	1090	SET_EXP_TIME		52
				51B8
102:	1093	CCD_START		23
103:	1094	CNC		66
104:	1095	JIF		62
				JUMP_EXT: 1296
106:	1098	MOVE_FW1		26
				03
107:	109A	SET_LED		54
				2A43
				022A
				4427
108:	10A1	HOME_SHU		14
109:	10A2	SET_EXP_TIME		52
				51C0
110:	10A5	CCD_START		23
111:	10A6	CNC		66
112:	10A7	JIF		62
				JUMP_EXT: 1296
114:	10AA	MOVE_FW1		26
				04
115:	10AC	MOVE_FW2		27
				01
116:	10AE	SET_LED		54
				2A43
				022A
				4427
117:	10B5	HOME_SHU		14
118:	10B6	SET_EXP_TIME		52
				51C8
119:	10B9	CCD_START		23
120:	10BA	CNC		66
121:	10BB	JIF		62
				JUMP_EXT: 1296
123:	10BE	MOVE_FW2		27
				02
124:	10C0	SET_LED		54
				2A43
				022A
				4427
125:	10C7	HOME_SHU		14
126:	10C8	SET_EXP_TIME		52
				51D8
127:	10CB	CCD_START		23
128:	10CC	CNC		66
129:	10CD	JIF		62
				JUMP_EXT: 1296
131:	10D0	MOVE_FW1		26
				05
132:	10D2	MOVE_FW2		27
				03
133:	10D4	SET_LED		54
				2A43
				022A
				4427
134:	10DB	HOME_SHU		14
135:	10DC	SET_EXP_TIME		52
				51D0
136:	10DF	CCD_START		23
137:	10E0	CNC		66
138:	10E1	JIF		62
				JUMP_EXT: 1296
140:	10E4	MOVE_FW1		26
				06
141:	10E6	MOVE_FW2		27
				05
142:	10E8	SET_LED		54
				2A43
				022A
				4427
143:	10EF	HOME_SHU		14
144:	10F0	SET_EXP_TIME		52
				51E8
145:	10F3	CCD_START		23
146:	10F4	CNC		66
147:	10F5	JIF		62
				JUMP_EXT: 1296
149:	10F8	SET_BIN		50
				01
151:	10FA	SET_FRAME_SIZE		53
				00
153:	10FC	MOVE_FW1		26
				00
154:	10FE	MOVE_FW2		27
				00
155:	1100	SET_LED		54
				2A43
				022A
				4427
156:	1107	HOME_SHU		14
157:	1108	SET_EXP_TIME		52
				5018
158:	110B	CCD_START		23
160:	110C	FIND_FLARE_SELF		15
161:	110D	JINF		64
				NORM_FLARE: 12BE
162:	1110	JIPF		65
				PROM_FLARE: 1393
164:	1113	CNC		66
165:	1114	JIF		62
				JUMP_EXT: 1296
167:	1117	DCR_SEQ		10
168:	1118	JNZS		60
				REPEAT_ROI: 105F
172:	111B	SET_FRAME_SIZE		53
				00
173:	111D	SET_BIN		50
				00
174:	111F	ROI_UpdateEn		12
175:	1120	SET_LED		54
				2A43
				022A
				4427
176:	1127	HOME_SHU		14
177:	1128	SET_EXP_TIME		52
				51A8
178:	112B	CCD_START		23
179:	112C	CNC		66
180:	112D	JIF		62
				JUMP_EXT: 1296
182:	1130	MOVE_FW1		26
				01
183:	1132	SET_LED		54
				2A43
				022A
				4427
184:	1139	HOME_SHU		14
185:	113A	SET_EXP_TIME		52
				51B0
186:	113D	CCD_START		23
187:	113E	CNC		66
188:	113F	JIF		62
				JUMP_EXT: 1296
190:	1142	SET_BIN		50
				01
192:	1144	MOVE_FW1		26
				00
193:	1146	SET_LED		54
				2A43
				022A
				4427
194:	114D	HOME_SHU		14
195:	114E	SET_EXP_TIME		52
				5018
196:	1151	CCD_START		23
197:	1152	CNC		66
199:	1153	FIND_FLARE_SELF		15
200:	1154	JINF		64
				NORM_FLARE: 12BE
201:	1157	JIPF		65
				PROM_FLARE: 1393
202:	115A	ROI_UpdateEn		12
204:	115B	SET_BIN		50
				00
206:	115D	MOVE_FW1		26
				02
207:	115F	SET_LED		54
				2A43
				022A
				4427
208:	1166	HOME_SHU		14
209:	1167	SET_EXP_TIME		52
				51B8
210:	116A	CCD_START		23
211:	116B	CNC		66
212:	116C	JIF		62
				JUMP_EXT: 1296
214:	116F	MOVE_FW1		26
				03
215:	1171	SET_LED		54
				2A43
				022A
				4427
216:	1178	HOME_SHU		14
217:	1179	SET_EXP_TIME		52
				51C0
218:	117C	CCD_START		23
219:	117D	CNC		66
220:	117E	JIF		62
				JUMP_EXT: 1296
222:	1181	SET_BIN		50
				01
224:	1183	MOVE_FW1		26
				00
225:	1185	SET_LED		54
				2A43
				022A
				4427
226:	118C	HOME_SHU		14
227:	118D	SET_EXP_TIME		52
				5018
228:	1190	CCD_START		23
229:	1191	CNC		66
231:	1192	FIND_FLARE_SELF		15
233:	1193	JINF		64
				NORM_FLARE: 12BE
234:	1196	JIPF		65
				PROM_FLARE: 1393
235:	1199	ROI_UpdateEn		12
237:	119A	SET_BIN		50
				00
239:	119C	MOVE_FW1		26
				04
240:	119E	MOVE_FW2		27
				01
241:	11A0	SET_LED		54
				2A43
				022A
				4427
242:	11A7	HOME_SHU		14
243:	11A8	SET_EXP_TIME		52
				51C8
244:	11AB	CCD_START		23
245:	11AC	CNC		66
246:	11AD	JIF		62
				JUMP_EXT: 1296
248:	11B0	MOVE_FW2		27
				02
249:	11B2	SET_LED		54
				2A43
				022A
				4427
250:	11B9	HOME_SHU		14
251:	11BA	SET_EXP_TIME		52
				51D8
252:	11BD	CCD_START		23
253:	11BE	CNC		66
254:	11BF	JIF		62
				JUMP_EXT: 1296
256:	11C2	SET_BIN		50
				01
258:	11C4	MOVE_FW1		26
				00
259:	11C6	MOVE_FW2		27
				00
260:	11C8	SET_LED		54
				2A43
				022A
				4427
261:	11CF	HOME_SHU		14
262:	11D0	SET_EXP_TIME		52
				5018
263:	11D3	CCD_START		23
264:	11D4	CNC		66
266:	11D5	FIND_FLARE_SELF		15
267:	11D6	JINF		64
				NORM_FLARE: 12BE
268:	11D9	JIPF		65
				PROM_FLARE: 1393
269:	11DC	ROI_UpdateEn		12
271:	11DD	SET_BIN		50
				00
273:	11DF	MOVE_FW1		26
				05
274:	11E1	MOVE_FW2		27
				03
275:	11E3	SET_LED		54
				2A43
				022A
				4427
276:	11EA	HOME_SHU		14
277:	11EB	SET_EXP_TIME		52
				51D0
278:	11EE	CCD_START		23
279:	11EF	CNC		66
280:	11F0	JIF		62
				JUMP_EXT: 1296
282:	11F3	SET_BIN		50
				01
284:	11F5	MOVE_FW1		26
				00
285:	11F7	MOVE_FW2		27
				00
286:	11F9	SET_LED		54
				2A43
				022A
				4427
287:	1200	HOME_SHU		14
288:	1201	SET_EXP_TIME		52
				5018
289:	1204	CCD_START		23
290:	1205	CNC		66
292:	1206	FIND_FLARE_SELF		15
293:	1207	JINF		64
				NORM_FLARE: 12BE
294:	120A	JIPF		65
				PROM_FLARE: 1393
295:	120D	ROI_UpdateEn		12
297:	120E	SET_BIN		50
				00
299:	1210	MOVE_FW1		26
				06
300:	1212	MOVE_FW2		27
				04
301:	1214	SET_LED		54
				2A43
				022A
				4427
302:	121B	HOME_SHU		14
303:	121C	SET_EXP_TIME		52
				51E0
304:	121F	CCD_START		23
305:	1220	CNC		66
306:	1221	JIF		62
				JUMP_EXT: 1296
308:	1224	MOVE_FW2		27
				05
309:	1226	SET_LED		54
				2A43
				022A
				4427
310:	122D	HOME_SHU		14
311:	122E	SET_EXP_TIME		52
				51E8
312:	1231	CCD_START		23
313:	1232	CNC		66
314:	1233	JIF		62
				JUMP_EXT: 1296
316:	1236	SET_BIN		50
				01
318:	1238	MOVE_FW1		26
				00
319:	123A	MOVE_FW2		27
				00
320:	123C	SET_LED		54
				2A43
				022A
				4427
321:	1243	HOME_SHU		14
322:	1244	SET_EXP_TIME		52
				5018
323:	1247	CCD_START		23
324:	1248	CNC		66
326:	1249	FIND_FLARE_SELF		15
328:	124A	JINF		64
				NORM_FLARE: 12BE
329:	124D	JIPF		65
				PROM_FLARE: 1393
330:	1250	ROI_UpdateEn		12
332:	1251	SET_BIN		50
				00
334:	1253	MOVE_FW1		26
				07
335:	1255	MOVE_FW2		27
				06
336:	1257	SET_LED		54
				2A43
				022A
				4427
337:	125E	HOME_SHU		14
338:	125F	SET_EXP_TIME		52
				51F0
339:	1262	CCD_START		23
340:	1263	CNC		66
342:	1264	JIF		62
				JUMP_EXT: 1296
344:	1267	MOVE_FW2		27
				07
345:	1269	SET_LED		54
				2A43
				022A
				4427
346:	1270	HOME_SHU		14
347:	1271	SET_EXP_TIME		52
				51F8
348:	1274	CCD_START		23
350:	1275	SET_BIN		50
				01
352:	1277	MOVE_FW1		26
				00
353:	1279	MOVE_FW2		27
				00
354:	127B	SET_LED		54
				2A43
				022A
				4427
355:	1282	HOME_SHU		14
356:	1283	SET_EXP_TIME		52
				5018
357:	1286	CCD_START		23
358:	1287	CNC		66
360:	1288	FIND_FLARE_SELF		15
361:	1289	JINF		64
				NORM_FLARE: 12BE
362:	128C	JIPF		65
				PROM_FLARE: 1393
364:	128F	DCR_CYCLE		11
365:	1290	JNZC		61
				NORMAL_MODE: 105A
367:	1293	JMP		63
				REPEAT_CAL: 1000
371:	1296	SET_FRAME_SIZE		53
					00
373:	1298	SET_BIN		50
				01
375:	129A	MOVE_FW1		26
				00
376:	129C	MOVE_FW2		27
				00
377:	129E	SET_EXP_TIME		52
				5018
379:	12A1	SET_SEQ		58
				001E
381:	12A4	SET_LED		54
					2A43
					022A
					4427
382:	12AB	HOME_SHU		14
383:	12AC	CCD_START		23
384:	12AD	CNC		66
385:	12AE	ROI_UpdateEn		12
387:	12AF	FIND_FLARE_EXT		16
388:	12B0	JINF		64
				NORM_FLARE: 12BE
389:	12B3	JIPF		65
				PROM_FLARE: 1393
391:	12B6	DCR_SEQ		10
392:	12B7	JNZS		60
				LOC_FLR: 12A4
394:	12BA	CLEAR_FLAG		57
395:	12BB	JMP		63
				NORMAL_MODE: 105A
399:	12BE	SET_OBSERV_ID		59
					A0
401:	12C0	SET_FRAME_SIZE		53
				01
403:	12C2	ROI_UpdateEn		12
405:	12C3	SET_BIN		50
				00
407:	12C5	SET_SEQ		58
				0064
409:	12C8	CHK_ADU		13
				FF
411:	12CA	SET_LED		54
				2A43
				022A
				4427
412:	12D1	HOME_SHU		14
413:	12D2	SET_EXP_TIME		52
				51A8
415:	12D5	CCD_START		23
417:	12D6	CNC		66
418:	12D7	CHK_ADU		13
				00
420:	12D9	SET_LED		54
					2A43
					022A
					4427
421:	12E0	HOME_SHU		14
422:	12E1	SET_EXP_TIME		52
				A000
424:	12E4	CCD_START		23
426:	12E5	CHK_ADU		13
				00
428:	12E7	ROI_UpdateEn		12
430:	12E8	MOVE_FW1		26
				01
431:	12EA	SET_LED		54
				2A43
				022A
				4427
432:	12F1	HOME_SHU		14
433:	12F2	SET_EXP_TIME		52
				A008
434:	12F5	CCD_START		23
435:	12F6	CNC		66
437:	12F7	MOVE_FW1		26
				02
438:	12F9	SET_LED		54
				2A43
				022A
				4427
439:	1300	HOME_SHU		14
440:	1301	SET_EXP_TIME		52
				A010
441:	1304	CCD_START		23
442:	1305	CNC		66
444:	1306	MOVE_FW1		26
				03
445:	1308	SET_LED		54
				2A43
				022A
				4427
446:	130F	HOME_SHU		14
447:	1310	SET_EXP_TIME		52
				A018
448:	1313	CCD_START		23
449:	1314	CNC		66
451:	1315	MOVE_FW1		26
				04
452:	1317	MOVE_FW2		27
				01
453:	1319	SET_LED		54
				2A43
				022A
				4427
454:	1320	HOME_SHU		14
455:	1321	SET_EXP_TIME		52
				A020
456:	1324	CCD_START		23
457:	1325	CNC		66
459:	1326	MOVE_FW2		27
				02
460:	1328	SET_LED		54
				2A43
				022A
				4427
461:	132F	HOME_SHU		14
462:	1330	SET_EXP_TIME		52
				A030
463:	1333	CCD_START		23
464:	1334	CNC		66
466:	1335	MOVE_FW1		26
				05
467:	1337	MOVE_FW2		27
				03
468:	1339	SET_LED		54
				2A43
				022A
				4427
469:	1340	HOME_SHU		14
470:	1341	SET_EXP_TIME		52
				A028
471:	1344	CCD_START		23
472:	1345	CNC		66
474:	1346	MOVE_FW1		26
				06
475:	1348	MOVE_FW2		27
				05
476:	134A	SET_LED		54
				2A43
				022A
				4427
477:	1351	HOME_SHU		14
478:	1352	SET_EXP_TIME		52
				A038
479:	1355	CCD_START		23
480:	1356	CNC		66
482:	1357	MOVE_FW2		27
				05
483:	1359	SET_EXP_TIME		52
				A040
484:	135C	SET_LED		54
				2A43
				022A
				4427
485:	1363	HOME_SHU		14
486:	1364	CCD_START		23
487:	1365	CNC		66
489:	1366	MOVE_FW1		26
				07
490:	1368	MOVE_FW2		27
				06
491:	136A	SET_LED		54
				2A43
				022A
				4427
492:	1371	HOME_SHU		14
493:	1372	SET_EXP_TIME		52
				A048
494:	1375	CCD_START		23
495:	1376	CNC		66
497:	1377	MOVE_FW2		27
				07
498:	1379	SET_LED		54
				2A43
				022A
				4427
499:	1380	HOME_SHU		14
500:	1381	SET_EXP_TIME		52
				A050
501:	1384	CCD_START		23
502:	1385	CNC		66
504:	1386	DCR_SEQ		10
506:	1387	CHK_ADU		13
				FF
508:	1389	MOVE_FW1		26
				00
509:	138B	MOVE_FW2		27
				00
511:	138D	JNZS		60
				REPEAT_FLARE: 12D9
513:	1390	JMP		63
				EXIT_FLARE: 1408
517:	1393	SET_OBSERV_ID		59
					A1
518:	1395	SET_FRAME_SIZE		53
				01
519:	1397	ROI_UpdateEn		12
521:	1398	SET_BIN		50
				00
522:	139A	SET_SEQ		58
				0078
524:	139D	CHK_ADU		13
				FF
526:	139F	SET_LED		54
				2A43
				022A
				4427
527:	13A6	HOME_SHU		14
528:	13A7	SET_EXP_TIME		52
				51A8
530:	13AA	CCD_START		23
532:	13AB	CNC		66
533:	13AC	CHK_ADU		13
				00
535:	13AE	SET_LED		54
					2A43
					022A
					4427
536:	13B5	HOME_SHU		14
537:	13B6	SET_EXP_TIME		52
				A000
539:	13B9	CCD_START		23
541:	13BA	CHK_ADU		13
				00
543:	13BC	ROI_UpdateEn		12
545:	13BD	MOVE_FW1		26
				01
546:	13BF	SET_LED		54
				2A43
				022A
				4427
547:	13C6	HOME_SHU		14
548:	13C7	SET_EXP_TIME		52
				A008
549:	13CA	CCD_START		23
551:	13CB	CNC		66
553:	13CC	MOVE_FW1		26
				02
554:	13CE	SET_LED		54
				2A43
				022A
				4427
555:	13D5	HOME_SHU		14
556:	13D6	SET_EXP_TIME		52
				A010
557:	13D9	CCD_START		23
559:	13DA	CNC		66
561:	13DB	MOVE_FW1		26
				03
562:	13DD	SET_LED		54
				2A43
				022A
				4427
563:	13E4	HOME_SHU		14
564:	13E5	SET_EXP_TIME		52
				A018
565:	13E8	CCD_START		23
567:	13E9	CNC		66
569:	13EA	MOVE_FW1		26
				05
570:	13EC	MOVE_FW2		27
				03
571:	13EE	SET_LED		54
				2A43
				022A
				4427
572:	13F5	HOME_SHU		14
573:	13F6	SET_EXP_TIME		52
				A028
574:	13F9	CCD_START		23
576:	13FA	CNC		66
578:	13FB	DCR_SEQ		10
580:	13FC	CHK_ADU		13
				FF
582:	13FE	MOVE_FW1		26
				00
583:	1400	MOVE_FW2		27
				00
585:	1402	JNZS		60
				REPEAT_PROM: 13AE
587:	1405	JMP		63
				EXIT_FLARE: 1408
589:	1408	CHK_ADU		13
					00
590:	140A	CLEAR_FLAG		57
591:	140B	JMP		63
				BEGIN: 1038
