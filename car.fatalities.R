# report of car fatalities per capita for U.S. states
#####################################################

# source: https://crashstats.nhtsa.dot.gov/Api/Public/ViewPublication/812603
r = read.table(sep='\n', stringsAsFactors = FALSE,
    text = "Alabama 1,083 298 28% 948 268 28% -135 -12.5% -30 -10.1%
Alaska 84 30 36% 79 22 28% -5 -6.0% -8 -26.7%
Arizona 952 240 25% 1,000 278 28% +48 +5.0% +38 +15.8%
Arkansas 561 132 24% 493 140 28% -68 -12.1% +8 +6.1%
California 3,837 1,122 29% 3,602 1,120 31% -235 -6.1% -2 -0.2%
Colorado 608 161 26% 648 177 27% +40 +6.6% +16 +9.9%
Connecticut 304 116 38% 278 120 43% -26 -8.6% +4 +3.4%
Delaware 119 37 31% 119 32 27% 0 0.0% -5 -13.5%
Dist of Columbia 27 12 44% 31 16 52% +4 +14.8% +4 +33.3%
Florida 3,176 905 28% 3,112 839 27% -64 -2.0% -66 -7.3%
Georgia 1,556 384 25% 1,540 366 24% -16 -1.0% -18 -4.7%
Hawaii 120 38 32% 107 42 39% -13 -10.8% +4 +10.5%
Idaho 253 76 30% 244 60 25% -9 -3.6% -16 -21.1%
Illinois 1,078 335 31% 1,097 349 32% +19 +1.8% +14 +4.2%
Indiana 829 215 26% 914 220 24% +85 +10.3% +5 +2.3%
Iowa 402 108 27% 330 88 27% -72 -17.9% -20 -18.5%
Kansas 429 100 23% 461 102 22% +32 +7.5% +2 +2.0%
Kentucky 834 176 21% 782 181 23% -52 -6.2% +5 +2.8%
Louisiana 757 227 30% 760 212 28% +3 +0.4% -15 -6.6%
Maine 160 62 39% 172 50 29% +12 +7.5% -12 -19.4%
Maryland 522 142 27% 550 186 34% +28 +5.4% +44 +31.0%
Massachusetts 387 148 38% 350 120 34% -37 -9.6% -28 -18.9%
Michigan 1,065 244 23% 1,030 311 30% -35 -3.3% +67 +27.5%
Minnesota 392 95 24% 357 85 24% -35 -8.9% -10 -10.5%
Mississippi 687 132 19% 690 148 21% +3 +0.4% +16 +12.1%
Missouri 947 247 26% 930 254 27% -17 -1.8% +7 +2.8%
Montana 190 84 44% 186 56 30% -4 -2.1% -28 -33.3%
Nebraska 218 62 28% 228 67 29% +10 +4.6% +5 +8.1%
Nevada 329 102 31% 309 89 29% -20 -6.1% -13 -12.7%
New Hampshire 136 40 29% 102 27 26% -34 -25.0% -13 -32.5%
New Jersey 602 137 23% 624 125 20% +22 +3.7% -12 -8.8%
New Mexico 405 120 30% 379 120 32% -26 -6.4% 0 0.0%
New York 1,041 295 28% 999 295 30% -42 -4.0% 0 0.0%
North Carolina 1,450 439 30% 1,412 413 29% -38 -2.6% -26 -5.9%
North Dakota 113 52 46% 115 46 40% +2 +1.8% -6 -11.5%
Ohio 1,132 330 29% 1,179 333 28% +47 +4.2% +3 +0.9%
Oklahoma 687 190 28% 655 165 25% -32 -4.7% -25 -13.2%
Oregon 498 151 30% 437 137 31% -61 -12.2% -14 -9.3%
Pennsylvania 1,188 340 29% 1,137 314 28% -51 -4.3% -26 -7.6%
Rhode Island 51 19 37% 83 34 41% +32 +62.7% +15 +78.9%
South Carolina 1,020 341 33% 988 313 32% -32 -3.1% -28 -8.2%
South Dakota 116 45 39% 129 35 27% +13 +11.2% -10 -22.2%
Tennessee 1,037 227 22% 1,040 251 24% +3 +0.3% +24 +10.6%
Texas 3,797 1,478 39% 3,722 1,468 39% -75 -2.0% -10 -0.7%
Utah 281 53 19% 273 53 19% -8 -2.8% 0 0.0%
Vermont 62 28 45% 69 18 26% +7 +11.3% -10 -35.7%
Virginia 760 223 29% 839 246 29% +79 +10.4% +23 +10.3%
Washington 536 160 30% 565 178 32% +29 +5.4% +18 +11.3%
West Virginia 269 69 26% 303 72 24% +34 +12.6% +3 +4.3%
Wisconsin 607 197 32% 613 190 31% +6 +1.0% -7 -3.6%
Wyoming 112 34 30% 123 44 36% +11 +9.8% +10 +29.4%
National 37,806 10,996 29% 37,133 10,874 29% -673 -1.8% -122 -1.1%
Puerto Rico 279 99 35% 290 96 33% +11 +3.9% -3 -3.0%")

q = r$V1

# remove state name
states = gsub('(\\D+)\\s.*','\\1', q)

# get statistics
stats = gsub('\\D+(.*)','\\1', q)
stats = gsub('[+,%]','',stats)


m = strsplit(stats, ' ')
p = as.data.frame(m, stringsAsFactors = FALSE)

d = data.frame(
    states,
    total.fatalities.2016 = as.numeric(p[1,]),
    total.fatalities.2017 = as.numeric(p[4,]),
    stringsAsFactors = FALSE
)


# https://en.wikipedia.org/wiki/List_of_states_and_territories_of_the_United_States_by_population
r1 = read.table(sep='\n', stringsAsFactors = FALSE,
            text = "1	1	 California	39,557,045	37,254,523	6.2%	+2,302,522	53	719,219	746,359	702,885	11.96%
2	2	 Texas	28,701,845	25,145,561	14.1%	+3,556,284	36	755,312	797,273	698,503	8.68%
3	4	 Florida	21,299,325	18,801,310	13.3%	+2,498,015	27	734,459	788,864	696,468	6.44%
4	3	 New York	19,542,209	19,378,102	0.8%	+164,107	27	673,869	723,786	717,707	5.91%
5	6	 Pennsylvania	12,807,060	12,702,379	0.8%	+104,681	18	640,353	711,503	705,715	3.87%
6	5	 Illinois	12,741,080	12,830,632	-0.7%	−89,552	18	637,054	707,838	712,864	3.85%
7	7	 Ohio	11,689,442	11,536,504	1.3%	+152,938	16	649,413	730,590	721,032	3.53%
8	9	 Georgia	10,519,475	9,687,653	8.6%	+831,822	14	657,467	751,391	691,975	3.18%
9	10	 North Carolina	10,383,620	9,535,483	8.9%	+848,137	13	692,241	798,740	733,498	3.14%
10	8	 Michigan	9,995,915	9,883,640	1.1%	+112,275	14	624,735	713,994	705,974	3.02%
11	11	 New Jersey	8,908,520	8,791,894	1.3%	+116,626	12	636,323	742,377	732,658	2.69%
12	12	 Virginia	8,517,685	8,001,024	6.5%	+516,661	11	655,207	774,335	727,366	2.58%
13	13	 Washington	7,535,591	6,724,540	12.1%	+811,051	10	627,966	753,559	672,454	2.28%
14	16	 Arizona	7,171,646	6,392,017	12.2%	+779,629	9	651,968	796,850	710,224	2.17%
15	14	 Massachusetts	6,902,149	6,547,629	5.4%	+354,520	9	627,468	766,905	727,514	2.09%
16	17	 Tennessee	6,770,010	6,346,105	6.7%	+423,905	9	615,455	752,223	705,123	2.05%
17	15	 Indiana	6,691,878	6,483,802	3.2%	+208,076	9	608,353	743,542	720,422	2.02%
18	18	 Missouri	6,126,452	5,988,927	2.3%	+137,525	8	612,645	765,807	748,615	1.85%
19	19	 Maryland	6,042,718	5,773,552	4.7%	+269,166	8	604,272	755,340	721,694	1.83%
20	20	 Wisconsin	5,813,568	5,686,986	2.2%	+126,582	8	581,357	726,696	710,873	1.76%
21	22	 Colorado	5,695,564	5,029,196	13.2%	+666,368	7	632,840	813,652	720,704	1.72%
22	21	 Minnesota	5,611,179	5,303,925	5.8%	+307,254	8	561,118	701,397	662,991	1.70%
23	24	 South Carolina	5,084,127	4,625,364	9.9%	+458,763	7	564,903	726,304	660,766	1.54%
24	23	 Alabama	4,887,871	4,779,736	2.3%	+108,135	7	543,097	698,267	682,819	1.48%
25	25	 Louisiana	4,659,978	4,533,372	2.8%	+126,606	6	582,497	776,663	755,562	1.41%
26	26	 Kentucky	4,468,402	4,339,367	3.0%	+129,035	6	558,550	744,734	723,228	1.35%
27	27	 Oregon	4,190,713	3,831,074	9.4%	+359,639	5	598,673	838,143	766,215	1.27%
28	28	 Oklahoma	3,943,079	3,751,351	5.1%	+191,728	5	563,297	788,616	750,270	1.19%
29	30	 Connecticut	3,572,665	3,574,097	-0.04%	−1,432	5	510,381	714,533	714,824	1.08%
30	29	 Puerto Rico	3,195,153	3,725,789	-16.6%	−530,636	1 (non-voting)	—	3,195,153	3,725,789	0.97%
31	35	 Utah	3,161,105	2,763,885	14.4%	+397,220	4	526,851	790,276	690,972	0.96%
32	31	 Iowa	3,156,145	3,046,355	3.6%	+109,790	4	526,024	789,036	761,717	0.95%
33	36	 Nevada	3,034,392	2,700,551	12.4%	+333,841	4	505,732	758,598	675,173	0.92%
34	33	 Arkansas	3,013,825	2,915,918	3.4%	+97,907	4	502,304	753,456	728,990	0.91%
35	32	 Mississippi	2,986,530	2,967,297	0.6%	+19,233	4	497,755	746,633	742,026	0.90%
36	34	 Kansas	2,911,505	2,853,118	2.0%	+58,387	4	485,251	727,876	713,280	0.88%
37	37	 New Mexico	2,095,428	2,059,179	1.8%	+36,249	3	419,086	698,476	686,393	0.63%
38	39	 Nebraska	1,929,268	1,826,341	5.6%	+102,927	3	385,854	643,089	608,780	0.58%
39	38	 West Virginia	1,805,832	1,852,994	-2.5%	−47,162	3	361,166	601,944	617,670	0.55%
40	40	 Idaho	1,754,208	1,567,582	11.9%	+186,626	2	438,552	877,104	783,826	0.53%
41	41	 Hawaii	1,420,491	1,360,301	4.4%	+60,190	2	355,123	710,246	680,151	0.43%
42	43	 New Hampshire	1,356,458	1,316,470	3.0%	+39,988	2	339,115	678,229	658,233	0.41%
43	42	 Maine	1,338,404	1,328,361	0.8%	+10,043	2	334,601	669,202	664,181	0.40%
44	45	 Montana	1,062,305	989,415	7.4%	+72,890	1	354,102	1,062,305	989,417	0.32%
45	44	 Rhode Island	1,057,315	1,052,567	0.5%	+4,748	2	264,329	528,658	526,466	0.32%
46	46	 Delaware	967,171	897,934	7.7%	+69,237	1	322,390	967,171	897,936	0.29%
47	47	 South Dakota	882,235	814,180	8.4%	+68,055	1	294,078	882,235	814,191	0.27%
48	49	  North Dakota	760,077	672,591	13.0%	+87,486	1	253,359	760,077	672,591	0.23%
48	48	 Alaska	737,438	710,231	3.8%	+27,207	1	245,813	737,438	710,249	0.22%
49	51	 District of Columbia	702,455	601,723	16.7%	+100,732	1 (non-voting)	234,152	—	—	0.21%
50	50	 Vermont	626,299	625,741	0.09%	+558	1	208,766	626,299	625,745	0.19%
51	52	 Wyoming	577,737	563,626	2.5%	+14,111	1	192,579	577,737	563,767	0.17%")
q = r1$V1
m = strsplit(q, '\t')
p1 = as.data.frame(m, stringsAsFactors = FALSE)
states1 = gsub('^\\s+','',as.character(p1[3,]))

d1 = data.frame(
  states = states1,
  pop = as.numeric(gsub(',','',as.character(p1[4,]))),
  size = 
  stringsAsFactors = FALSE
)


# party affiliation
# https://www.pewforum.org/religious-landscape-study/compare/party-affiliation/by/state/
r2 = read.table(sep='\n', stringsAsFactors = FALSE,
                text = "Alabama	52%	13%	35%	511
Alaska	39%	29%	32%	310
Arizona	40%	21%	39%	653
Arkansas	46%	16%	38%	311
California	30%	21%	49%	3,697
Colorado	41%	17%	42%	504
Connecticut	32%	18%	50%	377
Delaware	29%	17%	55%	301
District of Columbia	11%	15%	73%	303
Florida	37%	19%	44%	2,020
Georgia	41%	18%	41%	968
Hawaii	28%	20%	51%	312
Idaho	49%	19%	32%	320
Illinois	33%	19%	48%	1,326
Indiana	42%	20%	37%	654
Iowa	41%	19%	40%	330
Kansas	46%	23%	31%	307
Kentucky	44%	13%	43%	439
Louisiana	41%	16%	43%	465
Maine	36%	17%	47%	303
Maryland	31%	14%	55%	644
Massachusetts	27%	17%	56%	704
Michigan	34%	19%	47%	982
Minnesota	39%	15%	46%	563
Mississippi	44%	14%	42%	309
Missouri	41%	18%	42%	642
Montana	49%	21%	30%	312
Nebraska	47%	17%	36%	312
Nevada	37%	18%	46%	314
New Hampshire	35%	20%	44%	303
New Jersey	30%	19%	51%	886
New Mexico	37%	15%	48%	312
New York	28%	19%	53%	1,966
North Carolina	41%	17%	43%	1,022
North Dakota	50%	18%	33%	338
Ohio	42%	18%	40%	1,132
Oklahoma	45%	15%	40%	391
Oregon	32%	21%	47%	419
Pennsylvania	39%	15%	46%	1,366
Rhode Island	30%	22%	48%	305
South Carolina	43%	18%	39%	495
South Dakota	53%	10%	37%	305
Tennessee	48%	15%	36%	661
Texas	39%	21%	40%	2,535
Utah	54%	16%	30%	315
Vermont	29%	14%	57%	306
Virginia	43%	18%	39%	882
Washington	33%	23%	44%	714
West Virginia	43%	16%	41%	309
Wisconsin	42%	16%	42%	600
Wyoming	57%	18%	25%	316")

q = r2$V1
m = strsplit(q, '\t')
p2 = as.data.frame(m, stringsAsFactors = FALSE)
states2 = gsub('^\\s+','',as.character(p2[1,]))



d2 = data.frame(
  states = states2,
  rep.percent = as.numeric(gsub('%','',p2[2,])),
  dem.percent = as.numeric(gsub('%','',p2[4,])),
    stringsAsFactors = FALSE
)



# table with results
da = merge(d,d1, by=c('states'))
da = merge(da, d2, by=c('states'))
da$fatalities.per.pop = signif(da$total.fatalities.2017 / da$pop *1E6,4)
da$aff = 'grey'
da$aff[which(da$rep.percent>(da$dem.percent+3))] = 'red'
da$aff[which(da$dem.percent>(da$rep.percent+3))] = 'blue'
da$aff = factor(da$aff)
head(da)


# make a graph
library(ggplot2)
library(ggrepel)
ggplot(da, aes(pop/1e6, fatalities.per.pop, col=aff)) +
  geom_point(size=2) +
  xlab(expression(paste("State Population (10"^6,")"))) + 
  ylab("Car Fatalities per Population") + 
  scale_color_manual(values=c("blue", "grey", "red")) +
  scale_y_continuous(limits=c(0,250)) + 
  scale_x_log10() +
  geom_text_repel(aes(label=states), vjust=-0.5) + 
  theme_bw() +
  theme(legend.position = c(0.95,0.95),
        legend.justification = c(1,1))
ggsave('fatalities.per.population.us.png', width=8, height=6, dpi=120)
