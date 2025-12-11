--
-- PostgreSQL database dump
--

\restrict uXZ9tCs7nAmgDZJQH6vsSHYp2Wr91ksH64gfe2WCVwQFjfj8Z3E4J2DkfsVWJbZ

-- Dumped from database version 14.19 (Debian 14.19-1.pgdg13+1)
-- Dumped by pg_dump version 14.19 (Debian 14.19-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: dim_products; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.dim_products (
    product_key integer NOT NULL,
    product_id integer,
    name character varying(100),
    category character varying(50),
    price numeric(10,2)
);


ALTER TABLE public.dim_products OWNER TO admin;

--
-- Name: dim_products_product_key_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.dim_products_product_key_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_products_product_key_seq OWNER TO admin;

--
-- Name: dim_products_product_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.dim_products_product_key_seq OWNED BY public.dim_products.product_key;


--
-- Name: dim_users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.dim_users (
    user_key integer NOT NULL,
    user_id integer,
    name character varying(100),
    email character varying(100),
    age integer,
    signup_date date
);


ALTER TABLE public.dim_users OWNER TO admin;

--
-- Name: dim_users_user_key_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.dim_users_user_key_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_users_user_key_seq OWNER TO admin;

--
-- Name: dim_users_user_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.dim_users_user_key_seq OWNED BY public.dim_users.user_key;


--
-- Name: fact_orders; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.fact_orders (
    order_key integer NOT NULL,
    order_id integer,
    user_key integer,
    product_key integer,
    quantity integer,
    total numeric(10,2)
);


ALTER TABLE public.fact_orders OWNER TO admin;

--
-- Name: fact_orders_order_key_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.fact_orders_order_key_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fact_orders_order_key_seq OWNER TO admin;

--
-- Name: fact_orders_order_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.fact_orders_order_key_seq OWNED BY public.fact_orders.order_key;


--
-- Name: fact_reviews; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.fact_reviews (
    review_key integer NOT NULL,
    review_id integer,
    user_key integer,
    product_key integer,
    rating integer,
    comment text,
    review_date date
);


ALTER TABLE public.fact_reviews OWNER TO admin;

--
-- Name: fact_reviews_review_key_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.fact_reviews_review_key_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fact_reviews_review_key_seq OWNER TO admin;

--
-- Name: fact_reviews_review_key_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.fact_reviews_review_key_seq OWNED BY public.fact_reviews.review_key;


--
-- Name: dim_products product_key; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dim_products ALTER COLUMN product_key SET DEFAULT nextval('public.dim_products_product_key_seq'::regclass);


--
-- Name: dim_users user_key; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dim_users ALTER COLUMN user_key SET DEFAULT nextval('public.dim_users_user_key_seq'::regclass);


--
-- Name: fact_orders order_key; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fact_orders ALTER COLUMN order_key SET DEFAULT nextval('public.fact_orders_order_key_seq'::regclass);


--
-- Name: fact_reviews review_key; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fact_reviews ALTER COLUMN review_key SET DEFAULT nextval('public.fact_reviews_review_key_seq'::regclass);


--
-- Data for Name: dim_products; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.dim_products (product_key, product_id, name, category, price) FROM stdin;
1	1	Product 1	Sports	83.28
2	2	Product 2	Electronics	295.70
3	3	Product 3	Books	125.83
4	4	Product 4	Books	471.45
5	5	Product 5	Clothes	291.80
6	6	Product 6	Electronics	267.56
7	7	Product 7	Clothes	169.64
8	8	Product 8	Books	321.14
9	9	Product 9	Sports	300.25
10	10	Product 10	Electronics	340.67
11	11	Product 11	Books	425.82
12	12	Product 12	Books	404.49
13	13	Product 13	Electronics	68.42
14	14	Product 14	Electronics	16.37
15	15	Product 15	Sports	460.28
16	16	Product 16	Books	448.05
17	17	Product 17	Clothes	116.49
18	18	Product 18	Electronics	477.48
19	19	Product 19	Clothes	100.24
20	20	Product 20	Books	418.27
21	22	Product 22	Clothes	134.69
22	23	Product 23	Sports	194.72
23	24	Product 24	Sports	43.39
24	25	Product 25	Clothes	135.00
25	26	Product 26	Electronics	419.17
26	27	Product 27	Books	495.97
27	28	Product 28	Electronics	196.24
28	29	Product 29	Clothes	272.14
29	30	Product 30	Books	189.12
30	31	Product 31	Books	460.41
31	32	Product 32	Clothes	268.60
32	33	Product 33	Books	160.10
33	34	Product 34	Books	46.33
34	35	Product 35	Sports	317.28
35	36	Product 36	Clothes	136.38
36	37	Product 37	Books	40.96
37	38	Product 38	Books	467.38
38	39	Product 39	Electronics	225.83
39	40	Product 40	Books	114.40
40	41	Product 41	Electronics	363.58
41	42	Product 42	Books	45.91
42	43	Product 43	Electronics	14.00
43	44	Product 44	Electronics	75.92
44	45	Product 45	Books	365.53
45	46	Product 46	Books	11.87
46	47	Product 47	Clothes	263.45
47	48	Product 48	Books	273.66
48	49	Product 49	Clothes	178.82
49	50	Product 50	Electronics	406.49
50	51	Product 51	Books	103.12
51	52	Product 52	Books	116.64
52	53	Product 53	Electronics	390.51
53	54	Product 54	Electronics	132.19
54	55	Product 55	Clothes	294.62
55	56	Product 56	Clothes	185.78
56	57	Product 57	Sports	391.38
57	58	Product 58	Electronics	385.19
58	59	Product 59	Books	39.18
59	60	Product 60	Clothes	125.34
60	61	Product 61	Electronics	294.09
61	62	Product 62	Clothes	58.00
62	63	Product 63	Sports	271.64
63	64	Product 64	Clothes	105.80
64	65	Product 65	Sports	419.77
65	66	Product 66	Books	347.14
66	67	Product 67	Sports	413.20
67	68	Product 68	Books	87.98
68	69	Product 69	Sports	220.60
69	70	Product 70	Electronics	373.63
70	71	Product 71	Clothes	290.00
71	72	Product 72	Sports	172.97
72	73	Product 73	Sports	171.61
73	74	Product 74	Sports	258.50
74	75	Product 75	Books	216.38
75	76	Product 76	Books	102.49
76	77	Product 77	Books	417.79
77	78	Product 78	Electronics	325.27
78	79	Product 79	Books	193.89
79	80	Product 80	Clothes	106.26
80	81	Product 81	Books	77.48
81	82	Product 82	Books	310.23
82	83	Product 83	Electronics	389.58
83	84	Product 84	Books	268.31
84	85	Product 85	Clothes	81.08
85	86	Product 86	Books	10.55
86	87	Product 87	Sports	97.45
87	88	Product 88	Sports	305.83
88	89	Product 89	Sports	486.85
89	90	Product 90	Books	397.01
90	91	Product 91	Electronics	103.47
91	92	Product 92	Electronics	61.32
92	93	Product 93	Electronics	376.32
93	94	Product 94	Electronics	34.38
94	95	Product 95	Clothes	252.29
95	96	Product 96	Sports	222.17
96	97	Product 97	Clothes	497.25
97	98	Product 98	Clothes	190.07
98	99	Product 99	Electronics	475.54
99	100	Product 100	Sports	66.76
100	101	Product 101	Books	399.47
101	102	Product 102	Clothes	285.93
102	103	Product 103	Books	74.16
103	104	Product 104	Books	365.42
104	105	Product 105	Sports	365.05
105	106	Product 106	Sports	172.85
106	107	Product 107	Clothes	321.48
107	108	Product 108	Electronics	445.54
108	109	Product 109	Electronics	52.44
109	110	Product 110	Clothes	192.44
110	111	Product 111	Sports	346.37
111	112	Product 112	Books	35.96
112	113	Product 113	Electronics	458.81
113	114	Product 114	Books	432.24
114	115	Product 115	Sports	104.45
115	116	Product 116	Electronics	413.10
116	117	Product 117	Books	312.40
117	118	Product 118	Clothes	160.38
118	119	Product 119	Electronics	478.39
119	120	Product 120	Sports	267.36
120	121	Product 121	Books	145.82
121	122	Product 122	Sports	85.06
122	123	Product 123	Clothes	52.30
123	124	Product 124	Sports	158.98
124	125	Product 125	Electronics	345.53
125	126	Product 126	Books	186.77
126	127	Product 127	Electronics	258.88
127	128	Product 128	Sports	359.97
128	129	Product 129	Clothes	390.23
129	130	Product 130	Sports	400.38
130	131	Product 131	Books	424.75
131	132	Product 132	Clothes	229.98
132	133	Product 133	Clothes	373.55
133	134	Product 134	Clothes	417.14
134	135	Product 135	Clothes	361.40
135	136	Product 136	Clothes	63.00
136	137	Product 137	Clothes	405.86
137	138	Product 138	Electronics	52.31
138	139	Product 139	Electronics	15.07
139	140	Product 140	Electronics	16.78
140	141	Product 141	Books	195.23
141	142	Product 142	Sports	408.79
142	143	Product 143	Clothes	157.18
143	144	Product 144	Clothes	298.69
144	145	Product 145	Books	447.38
145	146	Product 146	Clothes	435.32
146	147	Product 147	Clothes	355.81
147	148	Product 148	Sports	28.06
148	149	Product 149	Books	206.19
149	150	Product 150	Sports	100.13
150	151	Product 151	Electronics	114.45
151	152	Product 152	Sports	89.23
152	153	Product 153	Electronics	215.27
153	154	Product 154	Clothes	394.85
154	155	Product 155	Books	402.87
155	156	Product 156	Electronics	466.49
156	157	Product 157	Sports	444.47
157	158	Product 158	Clothes	184.03
158	159	Product 159	Books	268.89
159	160	Product 160	Clothes	23.34
160	161	Product 161	Clothes	124.19
161	162	Product 162	Books	37.16
162	163	Product 163	Sports	469.31
163	164	Product 164	Sports	90.71
164	165	Product 165	Clothes	79.85
165	166	Product 166	Electronics	422.34
166	167	Product 167	Electronics	468.29
167	168	Product 168	Electronics	491.14
168	169	Product 169	Electronics	382.47
169	170	Product 170	Sports	227.74
170	171	Product 171	Electronics	458.06
171	172	Product 172	Clothes	48.38
172	173	Product 173	Clothes	434.59
173	174	Product 174	Sports	265.77
174	175	Product 175	Sports	220.87
175	176	Product 176	Clothes	420.67
176	177	Product 177	Books	246.83
177	178	Product 178	Books	233.39
178	179	Product 179	Electronics	227.92
179	180	Product 180	Clothes	260.47
180	181	Product 181	Sports	482.92
181	182	Product 182	Clothes	99.80
182	183	Product 183	Clothes	200.84
183	184	Product 184	Sports	14.95
184	185	Product 185	Books	211.17
185	186	Product 186	Electronics	35.48
186	187	Product 187	Sports	459.92
187	188	Product 188	Books	266.88
188	189	Product 189	Clothes	393.23
189	190	Product 190	Electronics	124.62
190	191	Product 191	Clothes	390.54
191	192	Product 192	Books	76.51
192	193	Product 193	Electronics	497.23
193	194	Product 194	Clothes	73.02
194	195	Product 195	Electronics	286.13
195	196	Product 196	Electronics	92.37
196	197	Product 197	Books	114.95
197	198	Product 198	Clothes	72.34
198	199	Product 199	Sports	298.83
199	200	Product 200	Clothes	120.37
200	201	Product 201	Clothes	78.43
201	202	Product 202	Books	87.67
202	203	Product 203	Clothes	264.56
203	204	Product 204	Electronics	461.96
204	205	Product 205	Books	91.53
205	206	Product 206	Clothes	139.12
206	207	Product 207	Sports	178.41
207	208	Product 208	Electronics	417.29
208	209	Product 209	Sports	318.98
209	210	Product 210	Sports	456.58
210	211	Product 211	Sports	190.74
211	212	Product 212	Sports	389.04
212	213	Product 213	Sports	349.22
213	214	Product 214	Sports	363.92
214	215	Product 215	Books	318.19
215	216	Product 216	Sports	343.26
216	217	Product 217	Electronics	64.25
217	218	Product 218	Books	410.28
218	219	Product 219	Electronics	293.84
219	220	Product 220	Clothes	133.03
220	221	Product 221	Clothes	259.81
221	222	Product 222	Sports	218.87
222	223	Product 223	Electronics	94.44
223	224	Product 224	Sports	462.05
224	225	Product 225	Electronics	173.30
225	226	Product 226	Sports	127.02
226	227	Product 227	Sports	367.95
227	228	Product 228	Sports	44.22
228	229	Product 229	Electronics	363.90
229	230	Product 230	Sports	199.66
230	231	Product 231	Clothes	103.58
231	232	Product 232	Clothes	276.76
232	233	Product 233	Electronics	268.84
233	234	Product 234	Sports	300.24
234	235	Product 235	Clothes	116.64
235	236	Product 236	Books	221.75
236	237	Product 237	Books	235.85
237	238	Product 238	Books	110.60
238	239	Product 239	Books	130.76
239	240	Product 240	Electronics	438.16
240	241	Product 241	Electronics	476.06
241	242	Product 242	Sports	382.26
242	243	Product 243	Electronics	278.05
243	244	Product 244	Electronics	53.87
244	245	Product 245	Books	192.50
245	246	Product 246	Sports	329.15
246	247	Product 247	Electronics	207.94
247	248	Product 248	Sports	303.87
248	249	Product 249	Books	83.38
249	250	Product 250	Books	211.87
250	251	Product 251	Sports	154.26
251	252	Product 252	Clothes	275.38
252	253	Product 253	Clothes	166.39
253	254	Product 254	Books	441.69
254	255	Product 255	Books	406.58
255	256	Product 256	Sports	234.49
256	257	Product 257	Clothes	489.16
257	258	Product 258	Clothes	161.13
258	259	Product 259	Books	217.72
259	260	Product 260	Electronics	164.58
260	261	Product 261	Books	380.10
261	262	Product 262	Electronics	355.10
262	263	Product 263	Clothes	413.34
263	264	Product 264	Clothes	373.51
264	265	Product 265	Electronics	188.26
265	266	Product 266	Books	475.95
266	267	Product 267	Sports	312.03
267	268	Product 268	Clothes	60.33
268	269	Product 269	Clothes	438.50
269	270	Product 270	Books	137.00
270	271	Product 271	Books	186.09
271	272	Product 272	Clothes	242.88
272	273	Product 273	Books	292.73
273	274	Product 274	Electronics	97.13
274	275	Product 275	Electronics	238.23
275	276	Product 276	Electronics	443.42
276	277	Product 277	Electronics	21.12
277	278	Product 278	Sports	154.54
278	279	Product 279	Electronics	31.10
279	280	Product 280	Electronics	38.40
280	281	Product 281	Clothes	99.42
281	282	Product 282	Sports	176.76
282	283	Product 283	Clothes	333.15
283	284	Product 284	Electronics	263.99
284	285	Product 285	Books	225.88
285	286	Product 286	Books	299.61
286	287	Product 287	Clothes	97.93
287	288	Product 288	Books	302.97
288	289	Product 289	Electronics	346.49
289	290	Product 290	Books	59.40
290	291	Product 291	Books	128.24
291	292	Product 292	Books	67.07
292	293	Product 293	Books	162.92
293	294	Product 294	Clothes	38.92
294	295	Product 295	Books	133.47
295	296	Product 296	Sports	227.17
296	297	Product 297	Electronics	281.65
297	298	Product 298	Clothes	450.65
298	299	Product 299	Electronics	87.99
\.


--
-- Data for Name: dim_users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.dim_users (user_key, user_id, name, email, age, signup_date) FROM stdin;
1	1	Ahmed Fathy	user1@example.com	57	2025-01-01
2	2	Ali Ibrahim	user2@example.com	58	2025-01-02
3	3	Ali Farouk	user3@example.com	18	2025-01-03
4	4	Laila Fathy	user4@example.com	30	2025-01-04
5	5	Laila Adel	user5@example.com	33	2025-01-05
6	6	Nour Nabil	user6@example.com	56	2025-01-06
7	7	Omar Farouk	user7@example.com	57	2025-01-07
8	8	Youssef Adel	user8@example.com	25	2025-01-08
9	9	Mona Farouk	user9@example.com	39	2025-01-09
10	10	Laila Nabil	user10@example.com	47	2025-01-10
11	11	Omar Tarek	user11@example.com	39	2025-01-11
12	12	Ali Mohamed	user12@example.com	38	2025-01-12
13	13	Mona Mohamed	user13@example.com	21	2025-01-13
14	14	Ali Mohamed	user14@example.com	39	2025-01-14
15	15	Ali Refat	user15@example.com	59	2025-01-15
16	16	Laila Nabil	user16@example.com	46	2025-01-16
17	17	Youssef Farouk	user17@example.com	53	2025-01-17
18	18	Ali Adel	user18@example.com	25	2025-01-18
19	19	Ali Farouk	user19@example.com	52	2025-01-19
20	20	Nour Refat	user20@example.com	29	2025-01-20
21	22	Ahmed Ibrahim	user22@example.com	60	\N
22	23	Khaled Sami	user23@example.com	53	\N
23	24	Ahmed Farouk	user24@example.com	39	\N
24	25	Omar Farouk	user25@example.com	21	\N
25	26	Mona Refat	user26@example.com	21	\N
26	27	Khaled Hassan	user27@example.com	32	\N
27	28	Khaled Hassan	user28@example.com	48	\N
28	29	Mona Hassan	user29@example.com	52	\N
29	30	Laila Adel	user30@example.com	46	\N
30	31	Laila Adel	user31@example.com	28	\N
31	32	Khaled Mohamed	user32@example.com	40	\N
32	33	Sara Fathy	user33@example.com	56	\N
33	34	Ahmed Tarek	user34@example.com	30	\N
34	35	Khaled Hassan	user35@example.com	24	\N
35	36	Laila Ibrahim	user36@example.com	38	\N
36	37	Mona Farouk	user37@example.com	46	\N
37	38	Mona Farouk	user38@example.com	34	\N
38	39	Laila Fathy	user39@example.com	36	\N
39	40	Laila Sami	user40@example.com	27	\N
40	41	Hana Hassan	user41@example.com	60	\N
41	42	Mona Hassan	user42@example.com	60	\N
42	43	Khaled Fathy	user43@example.com	47	\N
43	44	Mona Sami	user44@example.com	58	\N
44	45	Laila Mohamed	user45@example.com	20	\N
45	46	Sara Tarek	user46@example.com	30	\N
46	47	Laila Ibrahim	user47@example.com	26	\N
47	48	Khaled Mohamed	user48@example.com	31	\N
48	49	Laila Farouk	user49@example.com	59	\N
49	50	Ali Tarek	user50@example.com	56	\N
50	51	Youssef Hassan	user51@example.com	56	\N
51	52	Youssef Mohamed	user52@example.com	32	\N
52	53	Omar Ibrahim	user53@example.com	43	\N
53	54	Omar Ibrahim	user54@example.com	41	\N
54	55	Khaled Refat	user55@example.com	60	\N
55	56	Hana Mohamed	user56@example.com	26	\N
56	57	Omar Farouk	user57@example.com	24	\N
57	58	Mona Fathy	user58@example.com	20	\N
58	59	Mona Hassan	user59@example.com	56	\N
59	60	Hana Sami	user60@example.com	21	\N
60	61	Nour Tarek	user61@example.com	44	\N
61	62	Khaled Farouk	user62@example.com	34	\N
62	63	Sara Ibrahim	user63@example.com	22	\N
63	64	Ali Refat	user64@example.com	41	\N
64	65	Sara Farouk	user65@example.com	57	\N
65	66	Youssef Farouk	user66@example.com	29	\N
66	67	Hana Mohamed	user67@example.com	21	\N
67	68	Nour Fathy	user68@example.com	32	\N
68	69	Khaled Refat	user69@example.com	26	\N
69	70	Youssef Hassan	user70@example.com	55	\N
70	71	Hana Tarek	user71@example.com	45	\N
71	72	Omar Mohamed	user72@example.com	52	\N
72	73	Omar Sami	user73@example.com	45	\N
73	74	Nour Sami	user74@example.com	38	\N
74	75	Mona Adel	user75@example.com	29	\N
75	76	Youssef Ibrahim	user76@example.com	49	\N
76	77	Hana Fathy	user77@example.com	33	\N
77	78	Mona Refat	user78@example.com	49	\N
78	79	Nour Fathy	user79@example.com	31	\N
79	80	Ali Adel	user80@example.com	48	\N
80	81	Nour Ibrahim	user81@example.com	23	\N
81	82	Ahmed Adel	user82@example.com	40	\N
82	83	Sara Farouk	user83@example.com	23	\N
83	84	Mona Sami	user84@example.com	30	\N
84	85	Hana Adel	user85@example.com	24	\N
85	86	Mona Tarek	user86@example.com	27	\N
86	87	Nour Adel	user87@example.com	42	\N
87	88	Laila Sami	user88@example.com	53	\N
88	89	Khaled Mohamed	user89@example.com	21	\N
89	90	Khaled Nabil	user90@example.com	40	\N
90	91	Youssef Sami	user91@example.com	60	\N
91	92	Omar Mohamed	user92@example.com	49	\N
92	93	Omar Farouk	user93@example.com	43	\N
93	94	Ahmed Tarek	user94@example.com	18	\N
94	95	Sara Hassan	user95@example.com	26	\N
95	96	Sara Ibrahim	user96@example.com	43	\N
96	97	Mona Hassan	user97@example.com	25	\N
97	98	Youssef Hassan	user98@example.com	51	\N
98	99	Khaled Refat	user99@example.com	59	\N
99	100	Youssef Ibrahim	user100@example.com	46	\N
100	101	Laila Sami	user101@example.com	60	\N
101	102	Nour Sami	user102@example.com	41	\N
102	103	Youssef Nabil	user103@example.com	33	\N
103	104	Hana Mohamed	user104@example.com	28	\N
104	105	Omar Refat	user105@example.com	56	\N
105	106	Nour Fathy	user106@example.com	56	\N
106	107	Ali Sami	user107@example.com	53	\N
107	108	Youssef Hassan	user108@example.com	46	\N
108	109	Nour Adel	user109@example.com	40	\N
109	110	Khaled Tarek	user110@example.com	49	\N
110	111	Mona Tarek	user111@example.com	59	\N
111	112	Laila Hassan	user112@example.com	60	\N
112	113	Laila Adel	user113@example.com	57	\N
113	114	Khaled Mohamed	user114@example.com	20	\N
114	115	Omar Hassan	user115@example.com	53	\N
115	116	Nour Farouk	user116@example.com	58	\N
116	117	Khaled Fathy	user117@example.com	33	\N
117	118	Ali Mohamed	user118@example.com	51	\N
118	119	Omar Tarek	user119@example.com	38	\N
119	120	Omar Hassan	user120@example.com	25	\N
120	121	Laila Sami	user121@example.com	41	\N
121	122	Ali Sami	user122@example.com	32	\N
122	123	Laila Mohamed	user123@example.com	32	\N
123	124	Youssef Refat	user124@example.com	58	\N
124	125	Khaled Adel	user125@example.com	42	\N
125	126	Ahmed Hassan	user126@example.com	55	\N
126	127	Laila Tarek	user127@example.com	32	\N
127	128	Khaled Farouk	user128@example.com	48	\N
128	129	Nour Sami	user129@example.com	29	\N
129	130	Omar Ibrahim	user130@example.com	41	\N
130	131	Omar Farouk	user131@example.com	45	\N
131	132	Nour Farouk	user132@example.com	38	\N
132	133	Ahmed Hassan	user133@example.com	55	\N
133	134	Hana Tarek	user134@example.com	52	\N
134	135	Sara Farouk	user135@example.com	57	\N
135	136	Sara Mohamed	user136@example.com	41	\N
136	137	Mona Tarek	user137@example.com	33	\N
137	138	Sara Refat	user138@example.com	32	\N
138	139	Hana Adel	user139@example.com	27	\N
139	140	Nour Ibrahim	user140@example.com	21	\N
140	141	Nour Tarek	user141@example.com	23	\N
141	142	Omar Ibrahim	user142@example.com	43	\N
142	143	Ahmed Fathy	user143@example.com	36	\N
143	144	Sara Sami	user144@example.com	25	\N
144	145	Nour Tarek	user145@example.com	32	\N
145	146	Sara Nabil	user146@example.com	22	\N
146	147	Youssef Nabil	user147@example.com	39	\N
147	148	Sara Adel	user148@example.com	50	\N
148	149	Laila Hassan	user149@example.com	47	\N
149	150	Hana Fathy	user150@example.com	20	\N
150	151	Nour Farouk	user151@example.com	40	\N
151	152	Khaled Adel	user152@example.com	36	\N
152	153	Nour Ibrahim	user153@example.com	26	\N
153	154	Khaled Mohamed	user154@example.com	39	\N
154	155	Ahmed Nabil	user155@example.com	31	\N
155	156	Nour Mohamed	user156@example.com	49	\N
156	157	Sara Fathy	user157@example.com	45	\N
157	158	Sara Nabil	user158@example.com	29	\N
158	159	Youssef Mohamed	user159@example.com	37	\N
159	160	Ahmed Sami	user160@example.com	30	\N
160	161	Youssef Farouk	user161@example.com	25	\N
161	162	Laila Hassan	user162@example.com	41	\N
162	163	Mona Refat	user163@example.com	26	\N
163	164	Nour Ibrahim	user164@example.com	38	\N
164	165	Sara Hassan	user165@example.com	21	\N
165	166	Nour Mohamed	user166@example.com	45	\N
166	167	Sara Sami	user167@example.com	56	\N
167	168	Ahmed Fathy	user168@example.com	21	\N
168	169	Omar Farouk	user169@example.com	20	\N
169	170	Hana Hassan	user170@example.com	41	\N
170	171	Omar Adel	user171@example.com	36	\N
171	172	Hana Refat	user172@example.com	47	\N
172	173	Laila Nabil	user173@example.com	28	\N
173	174	Sara Sami	user174@example.com	32	\N
174	175	Sara Mohamed	user175@example.com	41	\N
175	176	Hana Nabil	user176@example.com	21	\N
176	177	Youssef Mohamed	user177@example.com	51	\N
177	178	Youssef Nabil	user178@example.com	21	\N
178	179	Omar Fathy	user179@example.com	50	\N
179	180	Ali Refat	user180@example.com	43	\N
180	181	Khaled Ibrahim	user181@example.com	26	\N
181	182	Laila Refat	user182@example.com	30	\N
182	183	Youssef Sami	user183@example.com	18	\N
183	184	Ali Hassan	user184@example.com	51	\N
184	185	Sara Hassan	user185@example.com	21	\N
185	186	Laila Adel	user186@example.com	31	\N
186	187	Mona Ibrahim	user187@example.com	55	\N
187	188	Sara Adel	user188@example.com	28	\N
188	189	Nour Tarek	user189@example.com	26	\N
189	190	Ali Ibrahim	user190@example.com	27	\N
190	191	Nour Sami	user191@example.com	27	\N
191	192	Hana Sami	user192@example.com	31	\N
192	193	Youssef Mohamed	user193@example.com	30	\N
193	194	Mona Mohamed	user194@example.com	31	\N
194	195	Ali Ibrahim	user195@example.com	31	\N
195	196	Ahmed Nabil	user196@example.com	29	\N
196	197	Omar Ibrahim	user197@example.com	49	\N
197	198	Mona Adel	user198@example.com	59	\N
198	199	Ali Sami	user199@example.com	52	\N
199	200	Sara Sami	user200@example.com	25	\N
200	201	Mona Sami	user201@example.com	28	\N
201	202	Omar Nabil	user202@example.com	31	\N
202	203	Sara Sami	user203@example.com	33	\N
203	204	Hana Refat	user204@example.com	34	\N
204	205	Mona Fathy	user205@example.com	53	\N
205	206	Ahmed Farouk	user206@example.com	51	\N
206	207	Hana Adel	user207@example.com	25	\N
207	208	Ali Ibrahim	user208@example.com	34	\N
208	209	Omar Farouk	user209@example.com	26	\N
209	210	Khaled Refat	user210@example.com	30	\N
210	211	Hana Fathy	user211@example.com	31	\N
211	212	Ahmed Farouk	user212@example.com	56	\N
212	213	Laila Refat	user213@example.com	48	\N
213	214	Mona Adel	user214@example.com	49	\N
214	215	Hana Nabil	user215@example.com	59	\N
215	216	Laila Mohamed	user216@example.com	60	\N
216	217	Ahmed Tarek	user217@example.com	44	\N
217	218	Laila Ibrahim	user218@example.com	51	\N
218	219	Hana Adel	user219@example.com	59	\N
219	220	Omar Refat	user220@example.com	29	\N
220	221	Omar Mohamed	user221@example.com	31	\N
221	222	Ali Nabil	user222@example.com	39	\N
222	223	Mona Fathy	user223@example.com	54	\N
223	224	Youssef Nabil	user224@example.com	49	\N
224	225	Khaled Nabil	user225@example.com	25	\N
225	226	Ali Ibrahim	user226@example.com	36	\N
226	227	Khaled Fathy	user227@example.com	25	\N
227	228	Ali Fathy	user228@example.com	35	\N
228	229	Laila Nabil	user229@example.com	50	\N
229	230	Hana Tarek	user230@example.com	54	\N
230	231	Nour Tarek	user231@example.com	43	\N
231	232	Hana Adel	user232@example.com	22	\N
232	233	Ahmed Farouk	user233@example.com	39	\N
233	234	Laila Nabil	user234@example.com	36	\N
234	235	Khaled Sami	user235@example.com	48	\N
235	236	Ahmed Mohamed	user236@example.com	22	\N
236	237	Ali Nabil	user237@example.com	56	\N
237	238	Laila Ibrahim	user238@example.com	34	\N
238	239	Hana Tarek	user239@example.com	47	\N
239	240	Mona Farouk	user240@example.com	30	\N
240	241	Mona Farouk	user241@example.com	25	\N
241	242	Nour Farouk	user242@example.com	50	\N
242	243	Laila Nabil	user243@example.com	56	\N
243	244	Nour Farouk	user244@example.com	57	\N
244	245	Omar Farouk	user245@example.com	29	\N
245	246	Laila Farouk	user246@example.com	57	\N
246	247	Sara Fathy	user247@example.com	20	\N
247	248	Hana Nabil	user248@example.com	51	\N
248	249	Omar Tarek	user249@example.com	34	\N
249	250	Sara Refat	user250@example.com	23	\N
250	251	Hana Mohamed	user251@example.com	39	\N
251	252	Ahmed Tarek	user252@example.com	18	\N
252	253	Khaled Adel	user253@example.com	38	\N
253	254	Khaled Hassan	user254@example.com	23	\N
254	255	Youssef Sami	user255@example.com	41	\N
255	256	Laila Tarek	user256@example.com	47	\N
256	257	Nour Mohamed	user257@example.com	46	\N
257	258	Ahmed Fathy	user258@example.com	58	\N
258	259	Hana Mohamed	user259@example.com	39	\N
259	260	Laila Nabil	user260@example.com	22	\N
260	261	Sara Sami	user261@example.com	20	\N
261	262	Hana Refat	user262@example.com	54	\N
262	263	Sara Farouk	user263@example.com	25	\N
263	264	Khaled Farouk	user264@example.com	42	\N
264	265	Ahmed Mohamed	user265@example.com	25	\N
265	266	Omar Mohamed	user266@example.com	38	\N
266	267	Ahmed Fathy	user267@example.com	30	\N
267	268	Ahmed Sami	user268@example.com	41	\N
268	269	Omar Adel	user269@example.com	36	\N
269	270	Sara Mohamed	user270@example.com	52	\N
270	271	Nour Ibrahim	user271@example.com	32	\N
271	272	Nour Ibrahim	user272@example.com	35	\N
272	273	Mona Mohamed	user273@example.com	55	\N
273	274	Khaled Fathy	user274@example.com	20	\N
274	275	Hana Fathy	user275@example.com	24	\N
275	276	Sara Fathy	user276@example.com	49	\N
276	277	Laila Fathy	user277@example.com	60	\N
277	278	Laila Sami	user278@example.com	55	\N
278	279	Hana Nabil	user279@example.com	29	\N
279	280	Mona Hassan	user280@example.com	34	\N
280	281	Khaled Ibrahim	user281@example.com	44	\N
281	282	Laila Adel	user282@example.com	23	\N
282	283	Laila Nabil	user283@example.com	22	\N
283	284	Omar Farouk	user284@example.com	28	\N
284	285	Khaled Sami	user285@example.com	32	\N
285	286	Youssef Tarek	user286@example.com	48	\N
286	287	Omar Refat	user287@example.com	22	\N
287	288	Hana Fathy	user288@example.com	53	\N
288	289	Ahmed Sami	user289@example.com	44	\N
289	290	Ahmed Refat	user290@example.com	49	\N
290	291	Mona Adel	user291@example.com	58	\N
291	292	Ali Farouk	user292@example.com	44	\N
292	293	Ahmed Refat	user293@example.com	28	\N
293	294	Sara Farouk	user294@example.com	19	\N
294	295	Nour Adel	user295@example.com	39	\N
295	296	Ahmed Adel	user296@example.com	32	\N
296	297	Youssef Ibrahim	user297@example.com	54	\N
297	298	Laila Tarek	user298@example.com	47	\N
298	299	Hana Refat	user299@example.com	57	\N
\.


--
-- Data for Name: fact_orders; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fact_orders (order_key, order_id, user_key, product_key, quantity, total) FROM stdin;
1	296	147	43	3	952.89
2	44	242	176	4	1468.76
3	129	242	225	3	1330.42
4	129	242	200	4	1330.42
5	216	242	282	3	1958.39
6	216	242	259	1	1958.39
7	216	242	69	2	1958.39
8	269	30	185	5	3900.50
9	269	30	101	4	3900.50
10	269	30	66	2	3900.50
11	293	30	21	3	938.85
12	57	136	229	1	2081.10
13	57	136	122	2	2081.10
14	57	136	87	3	2081.10
15	266	136	127	3	3836.13
16	266	136	179	4	3836.13
17	266	136	263	5	3836.13
18	286	64	288	3	1487.31
19	85	52	128	3	1283.38
20	85	52	74	1	1283.38
21	115	254	280	2	1237.31
22	115	254	94	1	1237.31
23	115	254	173	2	1237.31
24	81	295	273	2	2183.75
25	81	295	140	5	2183.75
26	95	295	147	1	2876.46
27	95	295	44	4	2876.46
28	95	295	270	1	2876.46
29	102	132	197	4	2236.88
30	102	132	46	4	2236.88
31	160	295	289	5	1288.15
32	172	132	180	2	1761.28
33	172	132	125	2	1761.28
34	172	132	148	5	1761.28
35	80	154	124	4	2312.86
36	80	154	282	5	2312.86
37	76	33	118	5	532.75
38	65	100	171	2	2568.67
39	65	100	71	3	2568.67
40	65	100	146	3	2568.67
41	72	114	153	4	527.08
42	82	125	252	3	1414.92
43	82	125	275	2	1414.92
44	82	125	60	4	1414.92
45	155	114	29	2	1393.34
46	155	114	295	3	1393.34
47	292	100	243	3	1490.35
48	292	100	266	1	1490.35
49	112	27	143	2	889.68
50	112	27	286	4	889.68
51	156	209	48	2	1469.23
52	156	209	164	5	1469.23
53	156	209	236	2	1469.23
54	278	27	176	3	1108.90
55	278	27	296	1	1108.90
56	278	27	33	1	1108.90
57	23	25	245	1	401.39
58	23	25	69	1	401.39
59	61	26	220	5	215.90
60	139	26	102	5	1019.45
61	78	158	\N	4	3091.38
62	78	158	222	4	3091.38
63	78	158	231	2	3091.38
64	154	43	30	1	12.81
65	192	270	196	5	3279.86
66	192	270	70	1	3279.86
67	192	270	24	5	3279.86
68	198	191	143	3	1243.17
69	263	43	126	1	25.19
70	235	102	39	1	1751.63
71	235	102	89	4	1751.63
72	162	222	237	2	901.68
73	77	284	290	1	1810.32
74	77	284	274	4	1810.32
75	220	284	142	5	1637.44
76	220	284	230	1	1637.44
77	92	127	187	5	3340.86
78	92	127	76	1	3340.86
79	92	127	72	4	3340.86
80	151	21	34	3	1584.40
81	151	21	281	1	1584.40
82	207	21	216	4	829.84
83	37	121	233	5	169.00
84	122	229	291	2	1253.30
85	122	229	90	2	1253.30
86	69	92	237	3	632.13
87	93	232	25	1	500.79
88	93	232	183	4	500.79
89	93	232	179	3	500.79
90	119	92	227	2	303.46
91	196	231	42	1	222.81
92	197	92	58	5	2039.09
93	197	92	238	1	2039.09
94	197	92	44	1	2039.09
95	257	231	152	4	1317.68
96	249	245	46	3	1482.39
97	249	245	109	4	1482.39
98	104	110	67	3	522.66
99	167	110	178	3	3018.24
100	167	110	121	3	3018.24
101	167	110	263	5	3018.24
102	177	223	85	3	1752.78
103	177	223	217	4	1752.78
104	177	223	148	4	1752.78
105	222	223	230	2	971.88
106	222	223	196	1	971.88
107	222	223	250	1	971.88
108	282	223	92	1	1070.57
109	282	223	156	5	1070.57
110	71	139	124	2	3760.28
111	71	139	186	5	3760.28
112	71	139	249	4	3760.28
113	99	131	251	4	1109.27
114	99	131	246	1	1109.27
115	272	131	189	2	1237.41
116	272	131	160	2	1237.41
117	272	131	102	5	1237.41
118	244	184	297	5	2941.44
119	244	184	216	2	2941.44
120	244	184	215	4	2941.44
121	79	145	224	3	1417.56
122	79	145	171	4	1417.56
123	79	145	169	3	1417.56
124	136	296	221	2	1121.92
125	136	296	147	2	1121.92
126	253	296	195	2	627.52
127	161	273	259	3	616.80
128	183	273	279	4	1086.24
129	228	273	29	4	1584.72
130	59	217	292	4	843.96
131	117	279	120	5	1734.35
132	146	279	158	4	3059.19
133	146	279	128	4	3059.19
134	146	279	212	5	3059.19
135	271	279	148	4	1545.86
136	271	279	250	1	1545.86
137	271	279	287	3	1545.86
138	4	6	11	2	2824.84
139	4	6	19	2	2824.84
140	4	6	4	4	2824.84
141	14	6	5	3	1823.62
142	14	6	7	2	1823.62
143	164	167	297	3	776.02
144	164	167	122	1	776.02
145	213	204	71	1	262.78
146	242	204	171	1	2876.57
147	242	204	242	4	2876.57
148	242	204	213	4	2876.57
149	17	3	16	1	190.31
150	17	3	20	2	190.31
151	89	177	34	2	1700.36
152	89	177	111	1	1700.36
153	89	177	261	3	1700.36
154	96	177	281	1	97.28
155	137	177	134	2	2946.66
156	137	177	37	4	2946.66
157	137	177	34	5	2946.66
158	250	141	55	4	1515.84
159	250	141	284	1	1515.84
160	250	141	278	1	1515.84
161	255	177	22	1	1651.47
162	255	177	234	3	1651.47
163	5	20	18	3	486.07
164	5	20	12	1	486.07
165	16	20	9	5	2082.51
166	16	20	19	1	2082.51
167	16	20	8	4	2082.51
168	285	163	108	1	734.53
169	285	163	229	3	734.53
170	239	168	24	1	445.73
171	170	138	204	3	665.01
172	170	138	260	1	665.01
173	195	138	232	1	1545.55
174	195	138	234	3	1545.55
175	45	93	140	4	1793.93
176	45	93	116	4	1793.93
177	45	93	74	1	1793.93
178	116	93	125	2	636.30
179	116	93	76	2	636.30
180	208	249	89	2	1515.28
181	208	249	189	1	1515.28
182	208	249	106	2	1515.28
183	143	56	94	5	3559.60
184	143	56	106	4	3559.60
185	224	56	289	5	452.25
186	280	56	95	3	3621.61
187	280	56	215	4	3621.61
188	280	56	164	5	3621.61
189	218	53	282	5	2414.85
190	218	53	280	5	2414.85
191	225	95	260	4	2907.46
192	225	95	97	2	2907.46
193	225	95	130	3	2907.46
194	31	47	112	3	1888.49
195	31	47	68	2	1888.49
196	134	47	128	2	1546.37
197	134	47	31	5	1546.37
198	173	47	128	3	984.60
199	270	265	211	2	698.08
200	75	162	130	1	2837.70
201	75	162	214	5	2837.70
202	75	162	114	1	2837.70
203	289	190	76	1	80.93
204	203	257	294	1	1677.26
205	203	257	190	2	1677.26
206	203	257	174	2	1677.26
207	237	257	65	4	2510.53
208	237	257	207	4	2510.53
209	237	257	94	5	2510.53
210	6	19	16	5	1445.73
211	6	19	3	1	1445.73
212	6	19	2	2	1445.73
213	10	19	19	5	2376.56
214	10	19	7	4	2376.56
215	10	19	6	3	2376.56
216	114	91	168	2	118.86
217	221	91	266	4	2979.62
218	221	91	155	2	2979.62
219	221	91	152	4	2979.62
220	179	256	83	5	3734.92
221	179	256	73	5	3734.92
222	179	256	53	2	3734.92
223	186	256	231	2	198.64
224	63	63	56	3	223.71
225	63	63	228	1	223.71
226	121	63	150	4	2304.08
227	121	63	223	3	2304.08
228	111	40	51	4	1151.86
229	111	40	150	2	1151.86
230	193	153	173	4	1448.54
231	193	153	222	2	1448.54
232	24	261	93	1	1056.46
233	24	261	150	3	1056.46
234	49	268	281	1	340.67
235	49	268	83	1	340.67
236	62	111	62	4	3129.05
237	62	111	70	2	3129.05
238	62	111	145	5	3129.05
239	163	111	244	2	1307.40
240	163	111	50	2	1307.40
241	163	111	177	3	1307.40
242	180	111	221	4	201.56
243	185	164	175	1	484.91
244	260	164	236	5	730.04
245	260	164	201	4	730.04
246	260	164	153	3	730.04
247	261	178	149	5	2686.91
248	261	178	159	4	2686.91
249	187	36	62	3	2968.24
250	187	36	158	4	2968.24
251	187	36	34	3	2968.24
252	128	60	145	2	116.60
253	201	126	277	2	696.90
254	84	196	105	4	1822.20
255	229	201	150	1	461.35
256	229	201	249	5	461.35
257	230	262	31	5	1657.36
258	230	262	150	1	1657.36
259	246	262	195	5	1771.20
260	2	9	15	1	268.24
261	2	9	7	2	268.24
262	18	9	13	1	2707.18
263	18	9	1	3	2707.18
264	18	9	9	3	2707.18
265	150	230	121	5	3286.53
266	150	230	197	5	3286.53
267	150	230	178	1	3286.53
268	294	230	247	1	440.21
269	294	230	77	4	440.21
270	39	71	188	4	3394.01
271	39	71	293	3	3394.01
272	39	71	271	1	3394.01
273	240	71	70	4	3723.56
274	240	71	286	4	3723.56
275	240	71	205	4	3723.56
276	234	174	259	2	932.80
277	147	34	84	2	967.98
278	147	34	108	3	967.98
279	35	216	28	1	636.42
280	35	216	168	1	636.42
281	35	216	83	4	636.42
282	127	216	213	4	1673.52
283	194	289	82	2	159.54
284	135	172	137	3	1329.27
285	135	172	294	4	1329.27
286	223	219	43	2	1894.58
287	223	219	219	4	1894.58
288	299	219	109	3	477.30
289	12	4	16	4	213.42
290	12	4	9	5	213.42
291	12	4	10	2	213.42
292	52	54	121	5	1032.85
293	199	99	296	3	1497.63
294	199	99	272	2	1497.63
295	22	38	247	1	534.56
296	22	38	158	3	534.56
297	22	38	278	1	534.56
298	175	22	236	3	1510.33
299	175	22	249	5	1510.33
300	175	22	85	2	1510.33
301	259	22	130	1	1727.83
302	259	22	192	5	1727.83
303	259	22	176	2	1727.83
304	130	48	120	5	2721.62
305	130	48	168	2	2721.62
306	130	48	93	1	2721.62
307	165	48	158	4	3595.88
308	165	48	254	5	3595.88
309	165	48	103	2	3595.88
310	202	48	148	5	1969.60
311	273	48	242	3	1104.72
312	275	48	166	5	1119.55
313	8	7	9	4	2207.18
314	8	7	6	3	2207.18
315	13	7	11	3	3571.37
316	13	7	14	3	3571.37
317	13	7	18	4	3571.37
318	60	161	182	4	2040.01
319	60	161	51	3	2040.01
320	171	237	274	2	1512.18
321	171	237	250	2	1512.18
322	171	237	67	1	1512.18
323	190	237	278	2	2258.17
324	190	237	173	5	2258.17
325	159	135	99	1	2331.94
326	159	135	229	5	2331.94
327	152	246	288	2	1836.98
328	152	246	29	3	1836.98
329	152	246	110	4	1836.98
330	238	246	297	3	733.47
331	238	246	269	5	733.47
332	98	170	256	2	1830.88
333	98	170	244	5	1830.88
334	118	170	127	2	393.12
335	100	276	289	1	18.06
336	205	50	168	5	534.40
337	251	193	37	1	371.99
338	26	165	232	5	1889.73
339	26	165	107	1	1889.73
340	26	165	133	5	1889.73
341	123	165	210	1	407.82
342	132	165	190	1	1314.94
343	132	165	23	4	1314.94
344	132	165	259	4	1314.94
345	204	68	207	1	314.45
346	209	165	146	3	1288.88
347	209	165	224	1	1288.88
348	209	165	44	2	1288.88
349	97	96	113	3	1233.03
350	232	233	74	1	937.81
351	232	233	160	2	937.81
352	86	62	143	5	3138.50
353	86	62	49	5	3138.50
354	226	62	128	3	595.35
355	1	10	5	1	2340.25
356	1	10	14	5	2340.25
357	7	10	17	3	1176.87
358	7	10	15	3	1176.87
359	7	10	18	2	1176.87
360	9	10	14	5	1346.71
361	9	10	4	1	1346.71
362	9	10	17	2	1346.71
363	11	10	14	3	2350.38
364	11	10	19	3	2350.38
365	113	101	289	1	289.73
366	274	101	135	5	3149.79
367	274	101	228	2	3149.79
368	274	101	40	5	3149.79
369	287	101	41	1	2323.32
370	287	101	174	4	2323.32
371	287	101	130	5	2323.32
372	74	49	195	4	1681.84
373	74	49	141	1	1681.84
374	105	266	70	3	4715.68
375	105	266	82	5	4715.68
376	105	266	90	5	4715.68
377	32	44	167	1	2421.67
378	32	44	109	4	2421.67
379	32	44	93	5	2421.67
380	107	215	192	2	351.22
381	219	215	\N	3	35.31
382	157	37	206	3	888.16
383	157	37	283	2	888.16
384	169	37	76	3	2444.28
385	169	37	224	3	2444.28
386	178	37	161	1	13.13
387	25	81	186	2	1560.24
388	25	81	161	5	1560.24
389	41	248	195	5	859.53
390	41	248	138	1	859.53
391	168	81	31	5	1565.15
392	243	248	223	2	1227.30
393	243	248	105	4	1227.30
394	254	180	212	2	780.44
395	254	180	253	2	780.44
396	291	248	114	5	83.40
397	42	287	35	1	338.21
398	42	287	162	1	338.21
399	212	287	295	2	3096.15
400	212	287	296	5	3096.15
401	212	287	64	5	3096.15
402	64	239	126	5	1579.95
403	120	79	113	5	840.40
404	144	288	26	1	1879.26
405	144	288	190	4	1879.26
406	144	288	122	1	1879.26
407	149	288	226	2	650.66
408	158	79	136	2	563.33
409	158	79	37	1	563.33
410	53	72	112	3	2441.88
411	53	72	203	3	2441.88
412	53	72	277	3	2441.88
413	124	24	67	1	2602.75
414	124	24	53	5	2602.75
415	124	24	147	3	2602.75
416	133	23	230	2	91.98
417	138	23	186	4	1252.92
418	189	23	248	4	919.56
419	38	120	69	2	828.92
420	38	120	158	4	828.92
421	126	61	271	1	1909.45
422	126	61	184	4	1909.45
423	191	124	271	5	1337.28
424	191	124	54	1	1337.28
425	191	124	259	2	1337.28
426	297	124	273	2	1779.94
427	297	124	285	3	1779.94
428	36	155	212	1	597.34
429	36	155	268	5	597.34
430	108	155	139	2	1340.51
431	108	155	284	5	1340.51
432	47	142	129	4	724.20
433	56	142	27	3	2168.40
434	56	142	27	4	2168.40
435	181	218	235	3	1179.12
436	181	218	61	3	1179.12
437	206	218	27	4	985.16
438	252	142	210	5	2833.70
439	252	142	263	3	2833.70
440	277	94	98	3	549.12
441	290	28	292	2	1866.02
442	290	28	156	4	1866.02
443	28	194	122	5	804.35
444	29	255	203	4	1884.04
445	33	194	298	5	2814.70
446	33	194	67	4	2814.70
447	33	194	213	3	2814.70
448	258	286	190	1	332.24
449	153	89	285	2	1644.44
450	153	89	150	5	1644.44
451	247	31	251	1	40.11
452	101	74	191	5	1337.96
453	101	74	144	4	1337.96
454	34	202	217	2	769.20
455	34	202	58	2	769.20
456	48	264	105	2	862.38
457	141	264	287	2	954.47
458	141	264	287	1	954.47
459	215	202	123	4	3119.07
460	215	202	269	3	3119.07
461	215	202	211	4	3119.07
462	73	271	205	1	2079.57
463	73	271	234	3	2079.57
464	73	271	150	4	2079.57
465	264	199	45	5	1520.70
466	106	108	149	1	362.50
467	233	55	252	3	1897.86
468	233	55	98	1	1897.86
469	233	55	132	4	1897.86
470	256	253	114	2	1345.55
471	256	253	78	2	1345.55
472	256	253	118	3	1345.55
473	295	253	23	1	384.21
474	66	227	288	5	2502.72
475	66	227	37	2	2502.72
476	142	212	58	3	1500.85
477	142	212	154	2	1500.85
478	142	212	255	2	1500.85
479	51	169	190	2	1474.28
480	51	169	56	4	1474.28
481	70	169	121	3	316.04
482	70	169	117	1	316.04
483	55	57	30	3	1257.12
484	267	57	92	2	418.84
485	68	203	297	5	2456.55
486	145	32	220	2	710.34
487	58	109	58	5	2144.13
488	58	109	184	2	2144.13
489	94	259	81	4	1562.57
490	94	259	107	1	1562.57
491	110	70	296	3	2094.74
492	110	70	52	5	2094.74
493	288	259	124	2	1431.55
494	288	259	23	1	1431.55
495	288	259	277	2	1431.55
496	50	115	41	1	944.36
497	50	115	105	4	944.36
498	166	115	283	4	2744.73
499	166	115	194	3	2744.73
500	19	14	9	5	1489.50
501	217	241	73	4	3860.54
502	217	241	48	5	3860.54
503	217	241	25	2	3860.54
504	227	283	156	3	1869.52
505	227	283	186	2	1869.52
506	227	283	66	3	1869.52
507	248	157	237	2	2184.28
508	248	157	129	5	2184.28
509	284	157	259	5	3391.65
510	284	157	60	5	3391.65
511	87	134	279	3	951.66
512	87	134	129	1	951.66
513	214	247	151	3	1409.31
514	231	247	286	1	1686.26
515	231	247	231	5	1686.26
516	231	247	173	3	1686.26
517	276	134	140	5	1713.84
518	276	134	21	2	1713.84
519	236	118	101	4	1546.83
520	236	118	117	5	1546.83
521	236	118	212	2	1546.83
522	15	2	18	2	118.16
523	54	200	230	4	1806.73
524	54	200	121	1	1806.73
525	200	78	186	5	1860.20
526	200	78	143	5	1860.20
527	200	78	54	1	1860.20
528	210	200	171	4	1773.70
529	210	200	227	5	1773.70
530	140	275	71	3	294.90
531	262	293	69	2	591.18
532	27	117	231	4	1804.14
533	27	117	221	3	1804.14
534	27	117	212	2	1804.14
535	90	117	24	1	474.73
536	109	117	57	2	660.18
537	148	117	275	5	3265.77
538	148	117	157	4	3265.77
539	148	117	56	4	3265.77
540	174	117	280	2	779.28
541	67	123	79	3	2787.82
542	67	123	178	1	2787.82
543	67	123	40	4	2787.82
544	88	280	267	5	328.26
545	88	280	25	2	328.26
546	211	280	86	1	2113.01
547	211	280	137	5	2113.01
548	211	280	234	5	2113.01
549	188	29	226	2	757.20
550	279	183	200	4	327.24
551	182	65	253	5	2674.14
552	182	65	166	2	2674.14
553	30	185	223	2	449.94
554	83	281	116	1	1050.72
555	83	281	166	4	1050.72
556	245	45	46	4	153.16
557	268	274	183	3	229.77
558	298	45	263	1	166.82
559	298	45	131	1	166.82
560	91	214	275	2	440.18
561	281	173	145	4	1678.14
562	281	173	88	1	1678.14
563	283	214	274	3	176.61
564	125	171	140	5	2169.38
565	125	171	36	2	2169.38
566	184	171	170	3	258.84
567	241	251	45	2	319.14
568	241	251	192	5	319.14
569	241	251	160	1	319.14
570	3	18	8	5	1936.25
571	3	18	11	1	1936.25
572	3	18	17	4	1936.25
573	20	18	1	1	376.37
574	40	137	153	1	1237.78
575	40	137	140	4	1237.78
576	40	137	66	1	1237.78
577	131	73	168	3	974.37
578	176	137	214	3	2324.34
579	176	137	160	5	2324.34
580	265	137	41	3	2737.02
581	265	137	96	1	2737.02
582	265	137	132	5	2737.02
583	46	179	50	5	1420.47
584	46	179	179	1	1420.47
585	43	35	80	1	1524.94
586	43	35	106	2	1524.94
587	43	35	207	4	1524.94
588	103	186	250	1	499.68
589	103	186	36	1	499.68
590	103	186	60	1	499.68
\.


--
-- Data for Name: fact_reviews; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.fact_reviews (review_key, review_id, user_key, product_key, rating, comment, review_date) FROM stdin;
1	186	147	172	4	This is SQL comment for product 1	\N
2	113	30	234	3	This is SQL comment for product 158	\N
3	158	30	292	4	This is SQL comment for product 251	\N
4	216	30	128	3	This is SQL comment for product 265	\N
5	259	30	95	5	This is SQL comment for product 295	\N
6	17	84	5	2	This is SQL comment for product 225	\N
7	205	64	147	2	This is SQL comment for product 227	\N
8	7	52	291	1	This is SQL comment for product 283	\N
9	167	254	2	2	This is SQL comment for product 39	\N
10	247	52	179	2	This is SQL comment for product 57	\N
11	57	295	200	4	This is SQL comment for product 248	\N
12	88	132	111	4	This is SQL comment for product 271	\N
13	282	132	112	1	This is SQL comment for product 79	\N
14	107	77	283	5	This is SQL comment for product 71	\N
15	244	154	112	2	This is SQL comment for product 138	\N
16	53	114	26	5	This is SQL comment for product 86	\N
17	229	100	135	1	This is SQL comment for product 24	\N
18	275	125	219	4	This is SQL comment for product 54	\N
19	177	27	253	3	This is SQL comment for product 196	\N
20	213	209	192	4	This is SQL comment for product 72	\N
21	283	182	290	5	This is SQL comment for product 176	\N
22	236	\N	36	4	This is SQL comment for product 123	\N
23	181	25	157	1	This is SQL comment for product 220	\N
24	75	158	276	3	This is SQL comment for product 2	\N
25	82	43	165	4	This is SQL comment for product 70	\N
26	96	158	117	5	This is SQL comment for product 200	\N
27	278	252	173	3	This is SQL comment for product 81	\N
28	108	102	137	1	This is SQL comment for product 170	\N
29	153	102	85	5	This is SQL comment for product 111	\N
30	203	235	24	2	This is SQL comment for product 94	\N
31	74	12	265	4	This is SQL comment for product 40	\N
32	101	222	184	2	This is SQL comment for product 59	\N
33	280	90	188	2	This is SQL comment for product 40	\N
34	70	284	270	1	This is SQL comment for product 246	\N
35	128	221	5	5	This is SQL comment for product 203	\N
36	69	21	283	5	This is SQL comment for product 139	\N
37	87	127	92	4	This is SQL comment for product 19	\N
38	122	127	107	1	This is SQL comment for product 291	\N
39	197	127	270	2	This is SQL comment for product 17	\N
40	115	121	125	5	This is SQL comment for product 250	\N
41	292	229	110	1	This is SQL comment for product 122	\N
42	165	189	42	3	This is SQL comment for product 197	\N
43	198	232	23	2	This is SQL comment for product 65	\N
44	297	232	98	5	This is SQL comment for product 186	\N
45	209	245	215	5	This is SQL comment for product 264	\N
46	183	110	256	4	This is SQL comment for product 53	\N
47	230	110	101	4	This is SQL comment for product 253	\N
48	140	139	252	4	This is SQL comment for product 109	\N
49	206	139	185	1	This is SQL comment for product 62	\N
50	174	290	17	4	This is SQL comment for product 10	\N
51	298	290	78	3	This is SQL comment for product 93	\N
52	55	258	291	4	This is SQL comment for product 210	\N
53	121	258	212	5	This is SQL comment for product 198	\N
54	28	296	33	2	This is SQL comment for product 84	\N
55	36	51	118	4	This is SQL comment for product 34	\N
56	210	51	213	1	This is SQL comment for product 108	\N
57	250	51	7	4	This is SQL comment for product 65	\N
58	223	273	117	1	This is SQL comment for product 161	\N
59	212	181	23	5	This is SQL comment for product 55	\N
60	255	181	125	1	This is SQL comment for product 133	\N
61	13	217	121	2	This is SQL comment for product 277	\N
62	47	279	80	4	This is SQL comment for product 37	\N
63	60	217	55	4	This is SQL comment for product 51	\N
64	79	217	211	3	This is SQL comment for product 63	\N
65	123	13	11	5	This is SQL comment for product 32	\N
66	287	279	17	2	This is SQL comment for product 120	\N
67	141	85	76	3	This is SQL comment for product 267	\N
68	143	16	44	4	This is SQL comment for product 114	\N
69	156	85	118	3	This is SQL comment for product 252	\N
70	239	6	230	5	This is SQL comment for product 99	\N
71	98	204	205	1	This is SQL comment for product 123	\N
72	49	141	61	1	This is SQL comment for product 125	\N
73	157	3	298	3	This is SQL comment for product 150	\N
74	281	141	243	2	This is SQL comment for product 127	\N
75	191	168	59	4	This is SQL comment for product 60	\N
76	42	138	49	1	This is SQL comment for product 229	\N
77	119	138	49	2	This is SQL comment for product 158	\N
78	144	282	297	1	This is SQL comment for product 85	\N
79	194	294	46	5	This is SQL comment for product 194	\N
80	111	93	141	2	This is SQL comment for product 72	\N
81	233	249	290	2	This is SQL comment for product 119	\N
82	147	56	63	4	This is SQL comment for product 87	\N
83	159	56	84	3	This is SQL comment for product 17	\N
84	27	291	36	3	This is SQL comment for product 27	\N
85	33	291	282	4	This is SQL comment for product 60	\N
86	131	53	188	1	This is SQL comment for product 155	\N
87	150	53	47	4	This is SQL comment for product 2	\N
88	189	53	6	5	This is SQL comment for product 291	\N
89	32	234	297	5	This is SQL comment for product 259	\N
90	193	234	298	4	This is SQL comment for product 265	\N
91	117	47	260	4	This is SQL comment for product 191	\N
92	271	265	151	4	This is SQL comment for product 10	\N
93	277	47	251	2	This is SQL comment for product 95	\N
94	62	5	41	2	This is SQL comment for product 164	\N
95	91	267	223	3	This is SQL comment for product 282	\N
96	102	190	147	5	This is SQL comment for product 131	\N
97	148	267	152	2	This is SQL comment for product 273	\N
98	204	267	89	3	This is SQL comment for product 295	\N
99	218	5	109	2	This is SQL comment for product 205	\N
100	51	278	175	5	This is SQL comment for product 282	\N
101	16	19	14	1	This is SQL comment for product 238	\N
102	83	256	236	5	This is SQL comment for product 83	\N
103	20	226	120	1	This is SQL comment for product 282	\N
104	106	116	244	2	This is SQL comment for product 122	\N
105	171	116	207	5	This is SQL comment for product 200	\N
106	201	63	46	2	This is SQL comment for product 77	\N
107	231	63	21	5	This is SQL comment for product 201	\N
108	240	63	94	2	This is SQL comment for product 274	\N
109	269	40	142	3	This is SQL comment for product 186	\N
110	227	42	176	2	This is SQL comment for product 198	\N
111	253	111	55	2	This is SQL comment for product 122	\N
112	261	164	118	5	This is SQL comment for product 139	\N
113	190	178	56	4	This is SQL comment for product 158	\N
114	214	188	196	1	This is SQL comment for product 235	\N
115	295	178	275	1	This is SQL comment for product 103	\N
116	93	36	128	5	This is SQL comment for product 221	\N
117	273	36	179	5	This is SQL comment for product 230	\N
118	10	60	49	4	This is SQL comment for product 186	\N
119	237	60	71	2	This is SQL comment for product 55	\N
120	66	196	271	4	This is SQL comment for product 95	\N
121	103	87	116	5	This is SQL comment for product 5	\N
122	284	87	5	4	This is SQL comment for product 123	\N
123	54	262	73	3	This is SQL comment for product 69	\N
124	76	106	206	3	This is SQL comment for product 145	\N
125	90	201	231	3	This is SQL comment for product 98	\N
126	217	262	56	4	This is SQL comment for product 219	\N
127	25	9	127	4	This is SQL comment for product 176	\N
128	105	17	209	2	This is SQL comment for product 74	\N
129	219	230	246	3	This is SQL comment for product 7	\N
130	224	17	288	4	This is SQL comment for product 274	\N
131	110	71	150	4	This is SQL comment for product 291	\N
132	1	174	226	5	This is SQL comment for product 184	\N
133	294	174	284	1	This is SQL comment for product 82	\N
134	58	34	279	2	This is SQL comment for product 210	\N
135	61	34	266	5	This is SQL comment for product 48	\N
136	89	34	267	3	This is SQL comment for product 253	\N
137	288	34	121	1	This is SQL comment for product 166	\N
138	40	228	258	3	This is SQL comment for product 225	\N
139	220	228	105	2	This is SQL comment for product 202	\N
140	4	277	30	3	This is SQL comment for product 33	\N
141	166	172	176	1	This is SQL comment for product 132	\N
142	241	277	288	1	This is SQL comment for product 291	\N
143	279	277	171	3	This is SQL comment for product 245	\N
144	5	58	283	2	This is SQL comment for product 77	\N
145	23	54	242	2	This is SQL comment for product 256	\N
146	77	4	46	3	This is SQL comment for product 76	\N
147	291	54	283	5	This is SQL comment for product 121	\N
148	109	240	117	4	This is SQL comment for product 86	\N
149	45	38	176	5	This is SQL comment for product 109	\N
150	97	22	233	3	This is SQL comment for product 203	\N
151	127	38	90	4	This is SQL comment for product 162	\N
152	146	22	103	2	This is SQL comment for product 57	\N
153	225	22	286	3	This is SQL comment for product 105	\N
154	73	175	231	4	This is SQL comment for product 3	\N
155	289	175	188	3	This is SQL comment for product 224	\N
156	138	161	214	3	This is SQL comment for product 280	\N
157	43	237	150	1	This is SQL comment for product 28	\N
158	164	243	179	4	This is SQL comment for product 197	\N
159	296	237	172	5	This is SQL comment for product 241	\N
160	192	135	294	5	This is SQL comment for product 238	\N
161	272	135	212	2	This is SQL comment for product 192	\N
162	182	246	79	3	This is SQL comment for product 297	\N
163	252	246	292	1	This is SQL comment for product 17	\N
164	149	86	51	4	This is SQL comment for product 110	\N
165	185	272	122	1	This is SQL comment for product 242	\N
166	161	193	73	1	This is SQL comment for product 97	\N
167	199	193	288	2	This is SQL comment for product 97	\N
168	19	128	25	1	This is SQL comment for product 105	\N
169	249	128	162	2	This is SQL comment for product 269	\N
170	30	96	141	4	This is SQL comment for product 1	\N
171	235	96	165	4	This is SQL comment for product 3	\N
172	264	96	181	4	This is SQL comment for product 35	\N
173	11	233	27	3	This is SQL comment for product 184	\N
174	139	263	102	1	This is SQL comment for product 207	\N
175	234	233	206	4	This is SQL comment for product 44	\N
176	285	238	145	2	This is SQL comment for product 241	\N
177	44	62	93	1	This is SQL comment for product 90	\N
178	254	62	5	3	This is SQL comment for product 199	\N
179	293	62	290	1	This is SQL comment for product 217	\N
180	84	76	117	3	This is SQL comment for product 144	\N
181	92	76	294	5	This is SQL comment for product 250	\N
182	112	10	210	3	This is SQL comment for product 114	\N
183	39	49	91	1	This is SQL comment for product 247	\N
184	31	292	78	4	This is SQL comment for product 10	\N
185	169	266	168	2	This is SQL comment for product 119	\N
186	246	266	165	1	This is SQL comment for product 268	\N
187	41	44	72	1	This is SQL comment for product 292	\N
188	184	44	284	1	This is SQL comment for product 234	\N
189	238	260	28	5	This is SQL comment for product 216	\N
190	260	260	51	4	This is SQL comment for product 97	\N
191	2	248	274	1	This is SQL comment for product 73	\N
192	29	81	137	4	This is SQL comment for product 217	\N
193	226	248	133	5	This is SQL comment for product 178	\N
194	71	239	271	1	This is SQL comment for product 164	\N
195	175	288	212	3	This is SQL comment for product 13	\N
196	18	244	88	2	This is SQL comment for product 250	\N
197	85	24	111	5	This is SQL comment for product 136	\N
198	173	72	136	5	This is SQL comment for product 182	\N
199	290	24	169	3	This is SQL comment for product 90	\N
200	125	112	207	1	This is SQL comment for product 173	\N
201	72	23	268	4	This is SQL comment for product 279	\N
202	179	159	33	1	This is SQL comment for product 204	\N
203	245	159	90	2	This is SQL comment for product 145	\N
204	257	69	241	4	This is SQL comment for product 148	\N
205	22	120	291	2	This is SQL comment for product 274	\N
206	116	124	143	3	This is SQL comment for product 188	\N
207	178	61	16	1	This is SQL comment for product 100	\N
208	262	61	163	1	This is SQL comment for product 124	\N
209	9	155	59	4	This is SQL comment for product 176	\N
210	256	155	210	3	This is SQL comment for product 69	\N
211	86	142	1	2	This is SQL comment for product 258	\N
212	118	142	\N	5	This is SQL comment for product 236	\N
213	276	218	260	5	This is SQL comment for product 114	\N
214	176	94	231	3	This is SQL comment for product 147	\N
215	215	94	79	3	This is SQL comment for product 184	\N
216	104	28	11	5	This is SQL comment for product 147	\N
217	63	\N	27	4	This is SQL comment for product 136	\N
218	155	213	205	1	This is SQL comment for product 159	\N
219	195	\N	134	4	This is SQL comment for product 270	\N
220	67	255	120	1	This is SQL comment for product 297	\N
221	24	31	55	2	This is SQL comment for product 250	\N
222	266	31	11	3	This is SQL comment for product 105	\N
223	274	59	119	3	This is SQL comment for product 129	\N
224	208	74	148	5	This is SQL comment for product 45	\N
225	35	220	275	2	This is SQL comment for product 82	\N
226	38	202	107	1	This is SQL comment for product 5	\N
227	228	202	119	1	This is SQL comment for product 281	\N
228	251	264	201	2	This is SQL comment for product 296	\N
229	299	202	9	4	This is SQL comment for product 202	\N
230	270	140	31	5	This is SQL comment for product 125	\N
231	188	271	189	1	This is SQL comment for product 11	\N
232	168	253	202	3	This is SQL comment for product 155	\N
233	263	253	280	4	This is SQL comment for product 146	\N
234	152	227	172	2	This is SQL comment for product 38	\N
235	136	169	120	1	This is SQL comment for product 43	\N
236	14	297	52	5	This is SQL comment for product 238	\N
237	26	104	283	1	This is SQL comment for product 87	\N
238	100	57	48	4	This is SQL comment for product 199	\N
239	129	187	159	5	This is SQL comment for product 3	\N
240	200	57	223	1	This is SQL comment for product 143	\N
241	3	32	189	4	This is SQL comment for product 156	\N
242	56	203	11	2	This is SQL comment for product 233	\N
243	99	203	105	5	This is SQL comment for product 281	\N
244	135	203	10	4	This is SQL comment for product 93	\N
245	242	203	52	1	This is SQL comment for product 72	\N
246	286	203	38	1	This is SQL comment for product 202	\N
247	37	82	242	1	This is SQL comment for product 4	\N
248	120	109	188	2	This is SQL comment for product 183	\N
249	232	149	63	4	This is SQL comment for product 202	\N
250	34	259	23	2	This is SQL comment for product 182	\N
251	59	67	232	5	This is SQL comment for product 5	\N
252	132	70	34	4	This is SQL comment for product 190	\N
253	180	105	148	3	This is SQL comment for product 227	\N
254	196	105	84	5	This is SQL comment for product 141	\N
255	207	259	290	3	This is SQL comment for product 23	\N
256	222	105	289	2	This is SQL comment for product 222	\N
257	265	70	133	2	This is SQL comment for product 219	\N
258	15	146	24	3	This is SQL comment for product 69	\N
259	46	14	271	1	This is SQL comment for product 81	\N
260	52	14	140	2	This is SQL comment for product 211	\N
261	137	14	248	3	This is SQL comment for product 216	\N
262	80	122	271	3	This is SQL comment for product 7	\N
263	21	157	254	4	This is SQL comment for product 100	\N
264	134	283	87	4	This is SQL comment for product 226	\N
265	162	157	68	4	This is SQL comment for product 202	\N
266	48	41	259	1	This is SQL comment for product 290	\N
267	126	41	134	1	This is SQL comment for product 129	\N
268	202	41	176	5	This is SQL comment for product 154	\N
269	64	200	122	1	This is SQL comment for product 231	\N
270	68	78	74	5	This is SQL comment for product 270	\N
271	124	200	60	3	This is SQL comment for product 65	\N
272	172	78	39	2	This is SQL comment for product 257	\N
273	8	130	92	1	This is SQL comment for product 44	\N
274	95	275	133	3	This is SQL comment for product 186	\N
275	258	130	122	2	This is SQL comment for product 213	\N
276	114	183	101	3	This is SQL comment for product 139	\N
277	221	65	272	1	This is SQL comment for product 88	\N
278	65	274	53	2	This is SQL comment for product 253	\N
279	94	45	262	4	This is SQL comment for product 269	\N
280	130	281	13	1	This is SQL comment for product 126	\N
281	145	185	138	3	This is SQL comment for product 27	\N
282	211	274	48	2	This is SQL comment for product 201	\N
283	6	214	19	3	This is SQL comment for product 151	\N
284	12	173	94	4	This is SQL comment for product 128	\N
285	268	214	234	4	This is SQL comment for product 187	\N
286	50	171	209	1	This is SQL comment for product 225	\N
287	78	171	193	1	This is SQL comment for product 30	\N
288	133	251	197	5	This is SQL comment for product 283	\N
289	160	251	260	5	This is SQL comment for product 167	\N
290	163	251	264	5	This is SQL comment for product 183	\N
291	243	137	233	3	This is SQL comment for product 178	\N
292	248	179	231	3	This is SQL comment for product 125	\N
293	151	133	293	4	This is SQL comment for product 2	\N
294	187	133	47	5	This is SQL comment for product 266	\N
295	81	186	16	4	This is SQL comment for product 26	\N
296	142	186	228	3	This is SQL comment for product 274	\N
297	154	186	120	5	This is SQL comment for product 67	\N
298	170	207	136	2	This is SQL comment for product 254	\N
299	267	35	273	5	This is SQL comment for product 138	\N
\.


--
-- Name: dim_products_product_key_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.dim_products_product_key_seq', 298, true);


--
-- Name: dim_users_user_key_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.dim_users_user_key_seq', 298, true);


--
-- Name: fact_orders_order_key_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.fact_orders_order_key_seq', 590, true);


--
-- Name: fact_reviews_review_key_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.fact_reviews_review_key_seq', 299, true);


--
-- Name: dim_products dim_products_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dim_products
    ADD CONSTRAINT dim_products_pkey PRIMARY KEY (product_key);


--
-- Name: dim_products dim_products_product_id_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dim_products
    ADD CONSTRAINT dim_products_product_id_key UNIQUE (product_id);


--
-- Name: dim_users dim_users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dim_users
    ADD CONSTRAINT dim_users_pkey PRIMARY KEY (user_key);


--
-- Name: dim_users dim_users_user_id_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dim_users
    ADD CONSTRAINT dim_users_user_id_key UNIQUE (user_id);


--
-- Name: fact_orders fact_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fact_orders
    ADD CONSTRAINT fact_orders_pkey PRIMARY KEY (order_key);


--
-- Name: fact_reviews fact_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fact_reviews
    ADD CONSTRAINT fact_reviews_pkey PRIMARY KEY (review_key);


--
-- Name: fact_reviews fact_reviews_review_id_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fact_reviews
    ADD CONSTRAINT fact_reviews_review_id_key UNIQUE (review_id);


--
-- Name: fact_orders fact_orders_product_key_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fact_orders
    ADD CONSTRAINT fact_orders_product_key_fkey FOREIGN KEY (product_key) REFERENCES public.dim_products(product_key);


--
-- Name: fact_orders fact_orders_user_key_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fact_orders
    ADD CONSTRAINT fact_orders_user_key_fkey FOREIGN KEY (user_key) REFERENCES public.dim_users(user_key);


--
-- Name: fact_reviews fact_reviews_product_key_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fact_reviews
    ADD CONSTRAINT fact_reviews_product_key_fkey FOREIGN KEY (product_key) REFERENCES public.dim_products(product_key);


--
-- Name: fact_reviews fact_reviews_user_key_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.fact_reviews
    ADD CONSTRAINT fact_reviews_user_key_fkey FOREIGN KEY (user_key) REFERENCES public.dim_users(user_key);


--
-- PostgreSQL database dump complete
--

\unrestrict uXZ9tCs7nAmgDZJQH6vsSHYp2Wr91ksH64gfe2WCVwQFjfj8Z3E4J2DkfsVWJbZ

