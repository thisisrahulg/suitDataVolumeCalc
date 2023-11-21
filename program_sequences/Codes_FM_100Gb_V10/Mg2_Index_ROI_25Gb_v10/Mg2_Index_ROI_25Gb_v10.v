12:	1000	CLEAR_FLAG		57
14:	1001	SET_CYCLE		55
				01F6
16:	1004	SET_OBSERV_ID		59
				96
17:	1006	SET_FRAME_SIZE		53
				00
18:	1008	SET_BIN		50
				00
19:	100A	SET_LED		54
				2A43
				022A
				4427
20:	1011	HOME_SHU		14
22:	1012	SET_FRAME_TYPE		56
				0E
23:	1014	CCD_START		23
24:	1015	CCD_START		23
25:	1016	CNC		66
26:	1017	SET_BIN		50
				01
27:	1019	CCD_START		23
28:	101A	CCD_START		23
29:	101B	CNC		66
31:	101C	SET_FRAME_TYPE		56
				0D
32:	101E	SET_BIN		50
				00
33:	1020	SET_EXP_TIME		52
				5058
34:	1023	CCD_START		23
35:	1024	CNC		66
36:	1025	SET_EXP_TIME		52
				5068
37:	1028	CCD_START		23
38:	1029	CNC		66
39:	102A	SET_BIN		50
				01
40:	102C	SET_EXP_TIME		52
				5058
41:	102F	CCD_START		23
42:	1030	CNC		66
43:	1031	SET_EXP_TIME		52
				5068
44:	1034	CCD_START		23
45:	1035	CNC		66
46:	1036	SET_OBSERV_ID		59
					7A
47:	1038	SET_FRAME_SIZE		53
				00
48:	103A	SET_FRAME_TYPE		56
				00
50:	103C	CLEAR_CCD		24
				02
51:	103E	SET_SEQ		58
				0003
52:	1041	SET_BIN		50
				01
53:	1043	MOVE_FW1		26
				00
54:	1045	MOVE_FW2		27
				00
55:	1047	SET_EXP_TIME		52
				5018
57:	104A	SET_LED		54
					2A43
					022A
					4427
58:	1051	HOME_SHU		14
59:	1052	CCD_START		23
60:	1053	CNC		66
61:	1054	DCR_SEQ		10
62:	1055	JNZS		60
				INIT_FRAMES: 104A
64:	1058	CLEAR_CCD		24
				00
68:	105A	SET_FRAME_SIZE		53
					01
69:	105C	SET_BIN		50
				00
70:	105E	ROI_UpdateEn		12
71:	105F	SET_LED		54
				2A43
				022A
				4427
72:	1066	HOME_SHU		14
73:	1067	SET_EXP_TIME		52
				51A8
74:	106A	CCD_START		23
75:	106B	CNC		66
76:	106C	JIF		62
				JUMP_EXT: 10CF
78:	106F	MOVE_FW1		26
				01
79:	1071	SET_LED		54
				2A43
				022A
				4427
80:	1078	HOME_SHU		14
81:	1079	SET_EXP_TIME		52
				51B0
82:	107C	CCD_START		23
83:	107D	CNC		66
84:	107E	JIF		62
				JUMP_EXT: 10CF
86:	1081	MOVE_FW1		26
				02
87:	1083	SET_LED		54
				2A43
				022A
				4427
88:	108A	HOME_SHU		14
89:	108B	SET_EXP_TIME		52
				51B8
90:	108E	CCD_START		23
91:	108F	CNC		66
92:	1090	JIF		62
				JUMP_EXT: 10CF
94:	1093	MOVE_FW1		26
				03
95:	1095	SET_LED		54
				2A43
				022A
				4427
96:	109C	HOME_SHU		14
97:	109D	SET_EXP_TIME		52
				51C0
98:	10A0	CCD_START		23
99:	10A1	CNC		66
100:	10A2	JIF		62
				JUMP_EXT: 10CF
102:	10A5	SET_FRAME_SIZE		53
				00
103:	10A7	SET_BIN		50
				01
105:	10A9	MOVE_FW1		26
				00
106:	10AB	MOVE_FW2		27
				00
107:	10AD	SET_LED		54
				2A43
				022A
				4427
108:	10B4	HOME_SHU		14
109:	10B5	SET_EXP_TIME		52
				5018
110:	10B8	CCD_START		23
112:	10B9	CNC		66
114:	10BA	FIND_FLARE_SELF		15
115:	10BB	JINF		64
				NORM_FLARE: 10F7
116:	10BE	JIPF		65
				PROM_FLARE: 11CC
117:	10C1	ROI_UpdateEn		12
119:	10C2	DCR_CYCLE		11
121:	10C3	JNZC		61
				MG_FILTERS: 105A
123:	10C6	SET_OBSERV_ID		59
				F7
124:	10C8	WAIT		30
					7530
125:	10CB	CNC		66
126:	10CC	JMP		63
				WAIT_LOOP: 10C8
130:	10CF	SET_FRAME_SIZE		53
					00
131:	10D1	SET_BIN		50
				01
132:	10D3	MOVE_FW1		26
				00
133:	10D5	MOVE_FW2		27
				00
134:	10D7	SET_EXP_TIME		52
				5018
136:	10DA	SET_SEQ		58
				003C
138:	10DD	SET_LED		54
					2A43
					022A
					4427
139:	10E4	HOME_SHU		14
140:	10E5	CCD_START		23
141:	10E6	CNC		66
142:	10E7	ROI_UpdateEn		12
144:	10E8	FIND_FLARE_EXT		16
145:	10E9	JINF		64
				NORM_FLARE: 10F7
146:	10EC	JIPF		65
				PROM_FLARE: 11CC
148:	10EF	DCR_SEQ		10
149:	10F0	JNZS		60
				LOC_FLR: 10DD
151:	10F3	CLEAR_FLAG		57
152:	10F4	JMP		63
				MG_FILTERS: 105A
156:	10F7	SET_OBSERV_ID		59
					7B
158:	10F9	SET_FRAME_SIZE		53
				01
159:	10FB	ROI_UpdateEn		12
160:	10FC	SET_BIN		50
				00
162:	10FE	SET_SEQ		58
				0078
164:	1101	CHK_ADU		13
				FF
166:	1103	SET_LED		54
				2A43
				022A
				4427
167:	110A	HOME_SHU		14
168:	110B	SET_EXP_TIME		52
				51A8
169:	110E	CCD_START		23
170:	110F	CNC		66
171:	1110	CHK_ADU		13
				00
173:	1112	SET_LED		54
					2A43
					022A
					4427
174:	1119	HOME_SHU		14
175:	111A	SET_EXP_TIME		52
				A000
176:	111D	CCD_START		23
177:	111E	CHK_ADU		13
				00
178:	1120	ROI_UpdateEn		12
180:	1121	MOVE_FW1		26
				01
181:	1123	SET_LED		54
				2A43
				022A
				4427
182:	112A	HOME_SHU		14
183:	112B	SET_EXP_TIME		52
				A008
184:	112E	CCD_START		23
185:	112F	CNC		66
187:	1130	MOVE_FW1		26
				02
188:	1132	SET_LED		54
				2A43
				022A
				4427
189:	1139	HOME_SHU		14
190:	113A	SET_EXP_TIME		52
				A010
191:	113D	CCD_START		23
192:	113E	CNC		66
194:	113F	MOVE_FW1		26
				03
195:	1141	SET_LED		54
				2A43
				022A
				4427
196:	1148	HOME_SHU		14
197:	1149	SET_EXP_TIME		52
				A018
198:	114C	CCD_START		23
199:	114D	CNC		66
201:	114E	MOVE_FW1		26
				04
202:	1150	MOVE_FW2		27
				01
203:	1152	SET_LED		54
				2A43
				022A
				4427
204:	1159	HOME_SHU		14
205:	115A	SET_EXP_TIME		52
				A020
206:	115D	CCD_START		23
207:	115E	CNC		66
209:	115F	MOVE_FW2		27
				02
210:	1161	SET_LED		54
				2A43
				022A
				4427
211:	1168	HOME_SHU		14
212:	1169	SET_EXP_TIME		52
				A030
213:	116C	CCD_START		23
214:	116D	CNC		66
216:	116E	MOVE_FW1		26
				05
217:	1170	MOVE_FW2		27
				03
218:	1172	SET_LED		54
				2A43
				022A
				4427
219:	1179	HOME_SHU		14
220:	117A	SET_EXP_TIME		52
				A028
221:	117D	CCD_START		23
222:	117E	CNC		66
224:	117F	MOVE_FW1		26
				06
225:	1181	MOVE_FW2		27
				05
226:	1183	SET_LED		54
				2A43
				022A
				4427
227:	118A	HOME_SHU		14
228:	118B	SET_EXP_TIME		52
				A038
229:	118E	CCD_START		23
230:	118F	CNC		66
232:	1190	MOVE_FW2		27
				05
233:	1192	SET_EXP_TIME		52
				A040
234:	1195	SET_LED		54
				2A43
				022A
				4427
235:	119C	HOME_SHU		14
236:	119D	CCD_START		23
237:	119E	CNC		66
239:	119F	MOVE_FW1		26
				07
240:	11A1	MOVE_FW2		27
				06
241:	11A3	SET_LED		54
				2A43
				022A
				4427
242:	11AA	HOME_SHU		14
243:	11AB	SET_EXP_TIME		52
				A048
244:	11AE	CCD_START		23
245:	11AF	CNC		66
247:	11B0	MOVE_FW2		27
				07
248:	11B2	SET_LED		54
				2A43
				022A
				4427
249:	11B9	HOME_SHU		14
250:	11BA	SET_EXP_TIME		52
				A050
251:	11BD	CCD_START		23
252:	11BE	CNC		66
254:	11BF	DCR_SEQ		10
255:	11C0	CHK_ADU		13
				FF
256:	11C2	MOVE_FW1		26
				00
257:	11C4	MOVE_FW2		27
				00
259:	11C6	JNZS		60
				REPEAT_FLARE: 1112
261:	11C9	JMP		63
				EXIT_FLARE: 1241
265:	11CC	SET_OBSERV_ID		59
					7C
266:	11CE	SET_FRAME_SIZE		53
				01
267:	11D0	ROI_UpdateEn		12
268:	11D1	SET_BIN		50
				00
269:	11D3	SET_SEQ		58
				0078
271:	11D6	CHK_ADU		13
				FF
273:	11D8	SET_LED		54
				2A43
				022A
				4427
274:	11DF	HOME_SHU		14
275:	11E0	SET_EXP_TIME		52
				51A8
276:	11E3	CCD_START		23
277:	11E4	CNC		66
278:	11E5	CHK_ADU		13
				00
280:	11E7	SET_LED		54
					2A43
					022A
					4427
281:	11EE	HOME_SHU		14
282:	11EF	SET_EXP_TIME		52
				A000
283:	11F2	CCD_START		23
285:	11F3	CHK_ADU		13
				00
287:	11F5	ROI_UpdateEn		12
288:	11F6	MOVE_FW1		26
				01
289:	11F8	SET_LED		54
				2A43
				022A
				4427
290:	11FF	HOME_SHU		14
291:	1200	SET_EXP_TIME		52
				A008
292:	1203	CCD_START		23
293:	1204	CNC		66
295:	1205	MOVE_FW1		26
				02
296:	1207	SET_LED		54
				2A43
				022A
				4427
297:	120E	HOME_SHU		14
298:	120F	SET_EXP_TIME		52
				A010
299:	1212	CCD_START		23
300:	1213	CNC		66
302:	1214	MOVE_FW1		26
				03
303:	1216	SET_LED		54
				2A43
				022A
				4427
304:	121D	HOME_SHU		14
305:	121E	SET_EXP_TIME		52
				A018
306:	1221	CCD_START		23
307:	1222	CNC		66
309:	1223	MOVE_FW1		26
				05
310:	1225	MOVE_FW2		27
				03
311:	1227	SET_LED		54
				2A43
				022A
				4427
312:	122E	HOME_SHU		14
313:	122F	SET_EXP_TIME		52
				A028
314:	1232	CCD_START		23
315:	1233	CNC		66
317:	1234	DCR_SEQ		10
318:	1235	CHK_ADU		13
				FF
320:	1237	MOVE_FW1		26
				00
321:	1239	MOVE_FW2		27
				00
323:	123B	JNZS		60
				REPEAT_PROM: 11E7
325:	123E	JMP		63
				EXIT_FLARE: 1241
327:	1241	CHK_ADU		13
					00
328:	1243	CLEAR_FLAG		57
329:	1244	JMP		63
				BEGIN: 1036
