16:	1000	CLEAR_FLAG		57
18:	1001	SET_CYCLE		55
				0265
20:	1004	SET_OBSERV_ID		59
				96
21:	1006	SET_FRAME_SIZE		53
				00
22:	1008	SET_BIN		50
				00
23:	100A	SET_LED		54
				2A43
				022A
				4427
24:	1011	HOME_SHU		14
26:	1012	SET_FRAME_TYPE		56
				0E
27:	1014	CCD_START		23
28:	1015	CCD_START		23
29:	1016	CNC		66
30:	1017	SET_BIN		50
				01
31:	1019	CCD_START		23
32:	101A	CCD_START		23
33:	101B	CNC		66
35:	101C	SET_FRAME_TYPE		56
				0D
36:	101E	SET_BIN		50
				00
37:	1020	SET_EXP_TIME		52
				5058
38:	1023	CCD_START		23
39:	1024	CNC		66
40:	1025	SET_EXP_TIME		52
				5068
41:	1028	CCD_START		23
42:	1029	CNC		66
43:	102A	SET_BIN		50
				01
44:	102C	SET_EXP_TIME		52
				5058
45:	102F	CCD_START		23
46:	1030	CNC		66
47:	1031	SET_EXP_TIME		52
				5068
48:	1034	CCD_START		23
49:	1035	CNC		66
50:	1036	SET_OBSERV_ID		59
					74
51:	1038	SET_FRAME_SIZE		53
				00
52:	103A	SET_FRAME_TYPE		56
				00
54:	103C	CLEAR_CCD		24
				02
56:	103E	SET_SEQ		58
				0003
57:	1041	SET_BIN		50
				01
58:	1043	MOVE_FW1		26
				00
59:	1045	MOVE_FW2		27
				00
60:	1047	SET_EXP_TIME		52
				5018
62:	104A	SET_LED		54
					2A43
					022A
					4427
63:	1051	HOME_SHU		14
64:	1052	CCD_START		23
65:	1053	CNC		66
66:	1054	DCR_SEQ		10
67:	1055	JNZS		60
				INIT_FRAMES: 104A
69:	1058	CLEAR_CCD		24
				00
71:	105A	SET_FRAME_SIZE		53
					00
72:	105C	SET_BIN		50
				00
73:	105E	MOVE_FW1		26
				05
74:	1060	MOVE_FW2		27
				03
75:	1062	SET_EXP_TIME		52
				51D0
76:	1065	SET_LED		54
				2A43
				022A
				4427
77:	106C	HOME_SHU		14
78:	106D	CCD_START		23
80:	106E	CNC		66
81:	106F	JIF		62
				JUMP_EXT: 1099
83:	1072	SET_BIN		50
				01
85:	1074	MOVE_FW1		26
				00
86:	1076	MOVE_FW2		27
				00
87:	1078	SET_LED		54
				2A43
				022A
				4427
88:	107F	HOME_SHU		14
89:	1080	SET_EXP_TIME		52
				5018
90:	1083	CCD_START		23
92:	1084	CNC		66
94:	1085	FIND_FLARE_SELF		15
96:	1086	JINF		64
				NORM_FLARE: 10C1
97:	1089	JIPF		65
				PROM_FLARE: 1196
99:	108C	DCR_CYCLE		11
101:	108D	JNZC		61
				NORMAL_MODE: 105A
103:	1090	SET_OBSERV_ID		59
				F7
104:	1092	WAIT		30
					7530
105:	1095	CNC		66
106:	1096	JMP		63
				WAIT_LOOP: 1092
110:	1099	SET_FRAME_SIZE		53
					00
112:	109B	SET_BIN		50
				01
114:	109D	MOVE_FW1		26
				00
115:	109F	MOVE_FW2		27
				00
116:	10A1	SET_EXP_TIME		52
				5018
118:	10A4	SET_SEQ		58
				003C
120:	10A7	SET_LED		54
					2A43
					022A
					4427
121:	10AE	HOME_SHU		14
122:	10AF	CCD_START		23
123:	10B0	CNC		66
125:	10B1	ROI_UpdateEn		12
127:	10B2	FIND_FLARE_EXT		16
128:	10B3	JINF		64
				NORM_FLARE: 10C1
129:	10B6	JIPF		65
				PROM_FLARE: 1196
131:	10B9	DCR_SEQ		10
132:	10BA	JNZS		60
				LOC_FLR: 10A7
134:	10BD	CLEAR_FLAG		57
135:	10BE	JMP		63
				NORMAL_MODE: 105A
139:	10C1	SET_OBSERV_ID		59
					75
141:	10C3	SET_FRAME_SIZE		53
				01
143:	10C5	ROI_UpdateEn		12
144:	10C6	SET_BIN		50
				00
146:	10C8	SET_SEQ		58
				0078
148:	10CB	CHK_ADU		13
				FF
150:	10CD	SET_LED		54
				2A43
				022A
				4427
151:	10D4	HOME_SHU		14
152:	10D5	SET_EXP_TIME		52
				51A8
153:	10D8	CCD_START		23
154:	10D9	CNC		66
155:	10DA	CHK_ADU		13
				00
157:	10DC	SET_LED		54
					2A43
					022A
					4427
158:	10E3	HOME_SHU		14
159:	10E4	SET_EXP_TIME		52
				A000
160:	10E7	CCD_START		23
162:	10E8	CHK_ADU		13
				00
164:	10EA	ROI_UpdateEn		12
165:	10EB	MOVE_FW1		26
				01
166:	10ED	SET_LED		54
				2A43
				022A
				4427
167:	10F4	HOME_SHU		14
168:	10F5	SET_EXP_TIME		52
				A008
169:	10F8	CCD_START		23
170:	10F9	CNC		66
172:	10FA	MOVE_FW1		26
				02
173:	10FC	SET_LED		54
				2A43
				022A
				4427
174:	1103	HOME_SHU		14
175:	1104	SET_EXP_TIME		52
				A010
176:	1107	CCD_START		23
177:	1108	CNC		66
179:	1109	MOVE_FW1		26
				03
180:	110B	SET_LED		54
				2A43
				022A
				4427
181:	1112	HOME_SHU		14
182:	1113	SET_EXP_TIME		52
				A018
183:	1116	CCD_START		23
184:	1117	CNC		66
186:	1118	MOVE_FW1		26
				04
187:	111A	MOVE_FW2		27
				01
188:	111C	SET_LED		54
				2A43
				022A
				4427
189:	1123	HOME_SHU		14
190:	1124	SET_EXP_TIME		52
				A020
191:	1127	CCD_START		23
192:	1128	CNC		66
194:	1129	MOVE_FW2		27
				02
195:	112B	SET_LED		54
				2A43
				022A
				4427
196:	1132	HOME_SHU		14
197:	1133	SET_EXP_TIME		52
				A030
198:	1136	CCD_START		23
199:	1137	CNC		66
201:	1138	MOVE_FW1		26
				05
202:	113A	MOVE_FW2		27
				03
203:	113C	SET_LED		54
				2A43
				022A
				4427
204:	1143	HOME_SHU		14
205:	1144	SET_EXP_TIME		52
				A028
206:	1147	CCD_START		23
207:	1148	CNC		66
209:	1149	MOVE_FW1		26
				06
210:	114B	MOVE_FW2		27
				05
211:	114D	SET_LED		54
				2A43
				022A
				4427
212:	1154	HOME_SHU		14
213:	1155	SET_EXP_TIME		52
				A038
214:	1158	CCD_START		23
215:	1159	CNC		66
217:	115A	MOVE_FW2		27
				05
218:	115C	SET_EXP_TIME		52
				A040
219:	115F	SET_LED		54
				2A43
				022A
				4427
220:	1166	HOME_SHU		14
221:	1167	CCD_START		23
222:	1168	CNC		66
224:	1169	MOVE_FW1		26
				07
225:	116B	MOVE_FW2		27
				06
226:	116D	SET_LED		54
				2A43
				022A
				4427
227:	1174	HOME_SHU		14
228:	1175	SET_EXP_TIME		52
				A048
229:	1178	CCD_START		23
230:	1179	CNC		66
233:	117A	MOVE_FW2		27
				07
234:	117C	SET_LED		54
				2A43
				022A
				4427
235:	1183	HOME_SHU		14
236:	1184	SET_EXP_TIME		52
				A050
237:	1187	CCD_START		23
238:	1188	CNC		66
240:	1189	DCR_SEQ		10
242:	118A	CHK_ADU		13
				FF
244:	118C	MOVE_FW1		26
				00
245:	118E	MOVE_FW2		27
				00
247:	1190	JNZS		60
				REPEAT_FLARE: 10DC
249:	1193	JMP		63
				EXIT_FLARE: 120B
253:	1196	SET_OBSERV_ID		59
					76
254:	1198	SET_FRAME_SIZE		53
				01
255:	119A	ROI_UpdateEn		12
257:	119B	SET_BIN		50
				00
258:	119D	SET_SEQ		58
				0078
260:	11A0	CHK_ADU		13
				FF
262:	11A2	SET_LED		54
				2A43
				022A
				4427
263:	11A9	HOME_SHU		14
264:	11AA	SET_EXP_TIME		52
				51A8
266:	11AD	CCD_START		23
268:	11AE	CNC		66
269:	11AF	CHK_ADU		13
				00
271:	11B1	SET_LED		54
					2A43
					022A
					4427
272:	11B8	HOME_SHU		14
273:	11B9	SET_EXP_TIME		52
				A000
274:	11BC	CCD_START		23
276:	11BD	CHK_ADU		13
				00
278:	11BF	ROI_UpdateEn		12
279:	11C0	MOVE_FW1		26
				01
280:	11C2	SET_LED		54
				2A43
				022A
				4427
281:	11C9	HOME_SHU		14
282:	11CA	SET_EXP_TIME		52
				A008
283:	11CD	CCD_START		23
284:	11CE	CNC		66
286:	11CF	MOVE_FW1		26
				02
287:	11D1	SET_LED		54
				2A43
				022A
				4427
288:	11D8	HOME_SHU		14
289:	11D9	SET_EXP_TIME		52
				A010
290:	11DC	CCD_START		23
291:	11DD	CNC		66
293:	11DE	MOVE_FW1		26
				03
294:	11E0	SET_LED		54
				2A43
				022A
				4427
295:	11E7	HOME_SHU		14
296:	11E8	SET_EXP_TIME		52
				A018
297:	11EB	CCD_START		23
298:	11EC	CNC		66
300:	11ED	MOVE_FW1		26
				05
301:	11EF	MOVE_FW2		27
				03
302:	11F1	SET_LED		54
				2A43
				022A
				4427
303:	11F8	HOME_SHU		14
304:	11F9	SET_EXP_TIME		52
				A028
305:	11FC	CCD_START		23
306:	11FD	CNC		66
308:	11FE	DCR_SEQ		10
310:	11FF	CHK_ADU		13
				FF
312:	1201	MOVE_FW1		26
				00
313:	1203	MOVE_FW2		27
				00
315:	1205	JNZS		60
				REPEAT_PROM: 11B1
317:	1208	JMP		63
				EXIT_FLARE: 120B
319:	120B	CHK_ADU		13
					00
320:	120D	CLEAR_FLAG		57
321:	120E	JMP		63
				BEGIN: 1036