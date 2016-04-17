###第二個投影片3/14--------------------

##產生序列
seq(from =1, to= 9, by=2)
seq(1,9,2)
--------------------------------
##Vector向量P.60(可以做運算 需要同類物件)
1:30 # 1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
c(1,2,3,4,5) 
c("a" , "b" , "c" )#"a" "b" "c"
c(first="a" , second="b" ,third= "c" )
#first second  third 
#"a"    "b"    "c" 
------------------------------------------
vector("numeric", length = 10) #0 0 0 0 0 0 0 0 0 0
1.4:5.6 #1.4 2.4 3.4 4.4 5.4
x<-1:5 #x  1 2 3 4 5
x+3 # 4 5 6 7 8
y<-6:10
x+y #y 7  9 11 13 15
seq(1,9) == 1:9 #TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
seq(1,9, by=2)
rep(1:5, times=3)# 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5
---------------------------------------------
##向量數學運算P.63
x<-1:30
sum(x) #465
max(x) #30
min(x) #1
mean(x) #15.5
median(x) #15.5 (中位數)
sd(x) #8.803408 (標準差)
sort(x, decreasing=T) #(排序)
# 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12
#11 10  9  8  7  6  5  4  3  2  1
rank(x)
#sort(x)是???向量x???行由小到大排序的結果，返回值排序后的???值向量。
#rank()對應每個原本向量數字的位置給予由小到大的“排名”
#order()x 從小到大排序後的向量之元素, 由原來向量數字的位置顯示出來小到大的名次。
rev(x) #反轉向量
summary(x)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#1.00    8.25   15.50   15.50   22.75   30.00 
----------------------------------------------
T=1
F=0
sum(c(T,T,T,F,T,F,F)) #4
any(c(T,T,T,F,T,F,F)) #TRUE(任何一個為TRUE就TRUE
----------------------------------------------
##???????矩陣
matrix(nrow = 2, ncol = 3)
#     [,1] [,2] [,3]
#[1,]   NA   NA   NA
#[2,]   NA   NA   NA
matrix(,2, 3)
#   [,1] [,2] [,3]
#[1,]   NA   NA   NA
#[2,]   NA   NA   NA
matrix(1:6, nrow = 2, ncol = 3)
#    [,1] [,2] [,3]
#[1,]    1    3    5
#[2,]    2    4    6
m <- 1:10
dim(m) <- c(2, 5) 
n <- matrix(1:6, nrow = 2, ncol = 3)
dim(n) ##使用dim()函???返回矩???的???度???性：在???里???2行3列

###第三個投影片------------------------------

##複習
#Character: “aaa”, “2” / Numeric: 1,2,3
#Logical: TREU, FLSE
#‧ ????: ?functionName????????????????????????
#‧ +, -, *, /, ^????????????????, %%????????????????, round(6.555,digits=2) ????????
#????????, sqrt(25) ????????????
#‧ c() ????????, seq(1,9,2) 1????9????????????????????????2, 1:20 ????1????20????????????????
#‧ mean(), max(), min(), sum(), summary(), sort(), rank()
#‧ matrix(1:6, nrow = 2, ncol = 3)
##行/列結合--------------------------------------
x <- 1:3
y <- 10:12
cbind(x, y) #以"直"左右結合
#     x  y
#[1,] 1 10
#[2,] 2 11
#[3,] 3 12
rbind(x, y)#以"橫"上下結合
#[,1] [,2] [,3]
#x    1    2    3
#y   10   11   12
---------------------------------------------------
##List (可以是不同物件)
x <- list(1, "a", TRUE, 1 + 4i)
#[[1]]
#[1] 1

#[[2]]
#[1] "a"

#[[3]]
#[1] TRUE

#[[4]]
#[1] 1+4i
#x是包含????????????numeric data, characters, boolean,
#complex各種不同物件的"序列"
------------------------------------------------
##Factors(分類數據對於模型)
x<-factor(c("yes", "yes", "no", "yes", "no"))
x12a<-factor(c("yes", "yes", "no", "yes", "no"), levels =c("yes","no"))
#[1] yes yes no  yes no 
#Levels: yes no
x121<-factor(c("yes", "yes", "no", "yes", "no"), levels =c("yes","no"),
             labels = c("male","female"))
#[1] male   male   female male   female
#Levels: male female
-----------------------------------------------
##Data Frame(同列要是相同類別,不同列可以是不同列別)
x <- data.frame(foo = 1:4, bar = c(T, T, F, F))#column(直)names: foo, bar
# foo   bar
#1   1  TRUE
#2   2  TRUE
#3   3 FALSE
#4   4 FALSE
nrow(x)#橫向個數
#4
ncol(x)#直向個數
#2
names(x)<-c("fooNew","barNew")
#"fooNew" "barNew"
---------------------------------------------------
##安裝pakagew套件P.15
install.packages("SportsAnalytics")#安裝SportsAnalytics套件
library(SportsAnalytics) #將SportsAnalytics讀入
NBA1415<-fetch_NBAPlayerStatistics("14-15")
names(NBA1415)
head(NBA1415)
nrow(NBA1415)
ncol(NBA1415)

##Date
x<-as.Date("1970-01-01")
unclass(x) #0
unclass(as.Date("1971-01-01")) #365
weekdays(x) #"星期四"
months(x) #"一月"
seq(Sys.Date(), by="1 months", length.out=12)
#[1] "2016-04-16" "2016-05-16" "2016-06-16" "2016-07-16"
#[5] "2016-08-16" "2016-09-16" "2016-10-16" "2016-11-16"
#[9] "2016-12-16" "2017-01-16" "2017-02-16" "2017-03-16"
---------------------------------------------------
##Times
x<-Sys.time()#系統時間
#"2016-04-16 22:47:36 CST"
LisDate<-as.POSIXlt(x) #轉為POSIXlt
#"2016-04-16 22:47:36 CST"
IntDate<-as.POSIXct(x)#轉為POSIXct
#"2016-04-16 22:47:36 CST"
unclass(LisDate)
#$sec
#[1] 36.81731
#$min
#[1] 47.....
unclass(IntDate)
#[1] 1460818057(天)
unclass(as.Date("1970-01-02")) #和1970/1/2相差幾天
#[1] 1
unclass(as.Date("1969-12-02"))
#[1] -30
--------------------------------------------------
##P.19
#+, -, >=, >(可以運算,但是要同類別)
x <- as.Date("2012-03-01")
y <-as.Date("2012-02-28")
x-y
#Time difference of 2 days
------------------------------------------------
##Subset

#letters(R內建的資料集)
letters [1] #"a"
letters [1:10] #[1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j"
letters[c(1,3,5)]#[1] "a" "c" "e"
letters [-1:-10]#[1] "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"
head(letters,5) #前五個物件
#"a" "b" "c" "d" "e"
tail(letters,5)#後五個物件
#[1] "v" "w" "x" "y" "z"

#islands(R內建的資料集)
sort(islands)
head(sort(islands))
#Vancouver          Hainan Prince of Wales 
#12              13              13 
#Timor          Kyushu          Taiwan 
#13              14              14 
---------------------------------------------------
##Data Frame Subsetting
#‧dataFrame[row index,column index] #篩選條件為index
iris[1,2] #(Row 1, Column 2)
#‧dataFrame[,column name]
iris[,"Species"]#(取column name等於Species的那個colum)
#‧dataFrame$columnName
iris$Species#(取column name等於Species的那個colum)
#‧subset(dataFrame, logic)#篩選條件為T/F
subset(iris, Species=="virginica")#(取Species的column為virginica的所有rows)
#‧ dataFrame[logic,]#篩選條件為T/F
iris[iris$Species=="virginica",]#(取Species的column為virginica的所有rows)

iris[Species == "virginica",]
#Sepal.Length Sepal.Width Petal.Length Petal.Width Species
#  101 6.3         3.3         6.0        2.5      virginica 
#  102 5.8         2.7         5.1        1.9      virginica
irisFrame<-iris[Species == "virginica",]

iris[, "Sepal.Length"]



--------------------------------------------------------
##P.23
San<-subset(NBA1415,Team=='SAN')
San[order(San$GamesPlayed,decreasing = T),"Name"] #誰打最多場
----------------------------------------------------
##star(物件的詳細資料)
str(iris)
str(NBA1415)
------------------------------------------------
##字串切割-1

#‧分離
strsplit(想切的字,用什麼字切)
strsplit("Hello World"," ")#用空白鍵切割字串
strsplit("Hello World","")

#‧大小寫轉換
#‧toupper(), tolower()

#‧移除前後空白
str_trim(" Hello World ") #需安裝stringr package
--------------------------------------------------------
##字串切割-2

#連接字串
#‧paste(string1, string2, sep=") #string1和string2連接,
#中間不插任何字元
#‧paste0(string1, string2, string3, string4) #功能同上
#‧paste(c(string1, string2), sep=",collapse=")
#連接的字串是向量時,須加上collapse="參數

#切割字串
#‧substr(string, start=2,stop=4)#只取第二個到第四個字元
#,生成新單字
------------------------------------------------
##搜尋字串

#‧grep(模式,字) #回傳index 類似subset
grep("Tim",NBA1415$Name)
#[1] 137 158 196 335
NBA1415[grep("Tim",NBA1415$Name),]
#   League           Name Team Position GamesPlayed
#137    NBA     Tim Duncan  SAN       PF          77
#158    NBA    Tim Frazier  POR       PG          11
#196    NBA   Tim Hardaway  NYK       SG          70
#335    NBA Timofey Mozgov  CLE        C          81
#TotalMinutesPlayed FieldGoalsMade FieldGoalsAttempted
#137               2224            419                 819
#158                241             21                  61
#196               1683            279                 717
#335               2058            318                 571
grepl("Tim",NBA1415$Name) #回傳T/F 
subset(NBA1415,grepl("Tim",Name))
---------------------------------------------
##32
which(letters>"m")
#[1] 14 15 16 17 18 19 20 21 22 23 24 25 26

#if else
#‧ifelse(logic,True要做的事,False要做的事)
ifelse(a>10,b<-10,b<-a)
--------------------------------------------------
##34
ifelse(NBA1415$GamesPlayed>30,"Hardwork","Lazy")
NBA1415$Personality<-ifelse(NBA1415$GamesPlayed>30,"Hardwork","Lazy")

#35 for
for(index in 1:10){
    print(index)
}
---------------------
    index<-1
repeat{
    if(index>10){
        break
    }
    print(index)
    index<-index+1
}
-------------------
    for(index in 1:10){
        if(index==4){
            next
        }
        print(index)
    }

--------------------
#37 (印出2014-2015球季所有球員的名字)
    for(i in 1:nrow(NBA1415)){
        print(NBA1415[i,"Name"])
    }
   #(印出2014-2015球季,球員名字內沒有a或A字母的球員名字)
for(i in 1:nrow(NBA1415)){
    if(!grepl('a|A',NBA1415[i,"Name"])){
        print(NBA1415[i,"Name"])
    }
}
#練習
for(i in 1:nrow(NBA1415)){
    if(NBA1415[i,"GamesPlayed"]>70&
       NBA1415[i,"TotalPoints"]>1500)
    {
        print(NBA1415[i,c("Name","Team","Position")])
    }
}
-----------------------------------------
##38
#出場(GamesPlayed)超過70次
NBA1415[i,"GamesPlayed"]>70
#球季總得分(TotalPoints)超過1500分
NBA1415[i,"TotalPoints"]>1500
#球員姓名(Name)/所屬球隊(Team)/守備位置(Position)
NBA1415[i,c("Name","Team","Position")]
-----------------------------------------------
##apply() 類似FOR
#‧apply(Data, MARGIN, FUN,….)
#‧Data:矩陣(Matrix),Data Frame
#‧MRGIN:????1=row, 2=column
#‧FUN:函數
#‧ …:函數要用的參數
apply(NBA1415[,c("GamesPlayed","TotalMinutesPlayed","TotalPoints")],2,mean)
apply(NBA1415,2,max)
#NBA1415的各列中,最大值是多少
-----------------------------------------
##Shortcut—>faster
#‧rowSums = apply(x, 1, sum)
#‧ rowMeans = apply(x, 1, mean)
#‧ colSums = apply(x, 2, sum)
#‧ colMeans = apply(x, 2, mean)
-----------------------------------------
##sapply() #Simplify->Vector
#如果回傳的list裡面,每個欄位長度都是1.回傳向量
#如果回傳的list裡面,每個欄位長度都依樣.回傳矩陣
#‧ sapply(Data, FUN…)
#‧Data:矩陣(Matrix),Data Frame,List,向量
#‧FUN:函數
sapply(iris, mean)
sapply(NBA1415[,c("GamesPlayed","TotalMinutesPlayed","TotalPoints")],mean)

NBA1415[,c("GamesPlayed","TotalMinutesPlayed","TotalPoints")]

#比較
NBA1415[,"GamesPlayed"]
NBA1415[NBA1415$GamesPlayed,]
iris[iris$Species=="virginica",]
----------------------------------------
##lapply() 用在list ->要搭配split()才可以分群
#‧ lapply(Data, FUN…)
#‧ Data:矩陣(Matrix),DataFrame,List
#‧FUN:函數
#lapply(iris, mean)
-----------------------------------------
##tapply() 用在向量->本身可分群
#‧ Data:向量
#‧INDEX:分類因子
tapply(NBA1415$Name,NBA1415$Team,length)
## ATL BOS BRO CHA CHI CLE DAL DEN DET GSW HOU IND LAC LAL MEM MIA MIL MIN
## 15 15 17 16 14 16 16 15 15 15 16 15 19 18 17 18 17 20
## NOR NYK OKL ORL PHI PHO POR SAC SAN TOR UTA WAS
## 19 16 16 15 19 16 16 17 15 15 17 17
tapply(NBA1415$TotalPoints,NBA1415$Team,max)
-----------------------------------------
##split()  (tapply()的朋友)
#‧tapply()的部分功能:替向量做分群
split(1:30,gl(3, 10))#一到30的向量,用第二個參數做分群
 #$`1`
#[1]  1  2  3  4  5  6  7  8  9 10
#$`2`
#[1] 11 12 13 14 15 16 17 18 19 20
#$`3`
#[1] 21 22 23 24 25 26 27 28 29 30 
#---->輸出結果是list 應該要想到lapply()
---------------------------------------------
#split()+lapply() #split()分群後的向量,用lapply()做運算
lapply(split(1:30,gl(3, 10)),mean)

---------------------------------------------
lapply(split(1:30,gl(3, 10)),mean) #分群後算mean
#$`1`
#[1] 5.5
#$`2`
#[1] 15.5
#$`3`
#[1] 25.5
tapply(1:30,gl(3, 10),mean) #分群後算mean
# 1    2    3 
#5.5 15.5 25.5 
-----------------------------
##split() -2
#‧對Data Frame做分群
#‧split(Data,分群依據)
NBA1415Team<-split(NBA1415,NBA1415$Team) #就會有30個list表示30隊
---------------------------------------------------
#‧搭配apply家族使用
NBA1415Team<-split(NBA1415[,c("TotalPoints","GamesPlayed")],NBA1415$Team)
#根據隊伍做分類依據,要得DATA是"TotalPoints","GamesPlayed"
lapply(NBA1415Team, colMeans) #回傳list
#算出分累後的平均,回傳LIST
#$ATL
#TotalPoints GamesPlayed 
#567.13333    59.53333 
#$BOS
#TotalPoints GamesPlayed 
#541.4        59.4 
sapply(NBA1415Team, colMeans)
#算出分累後的平均,回傳dataframe
#ATL   BOS       BRO      CHA       CHI
#TotalPoints 567.13333 541.4 502.17647 494.1250 590.35714
#GamesPlayed  59.53333  59.4  53.17647  55.1875  58.64286
#CLE     DAL   DEN       DET      GSW      HOU
#TotalPoints 549.75 562.375 474.0 519.66667 601.0667 592.6875
#GamesPlayed  53.75  60.875  53.8  54.86667  60.0000  56.1875
--------------------------------------------
##split()-3
#‧使用多個分群依據(隊伍、守備位置)
#‧用list將分群依據包起來
 #‧split(資料,list(分類依據1,分類依據2))
 #‧split(NBA1415[,c(“TotalPoints","GamesPlayed")],list(NBA1415$Team,NBA1415$Position))
NBA1415TP<-split(NBA1415[,c("TotalPoints","GamesPlayed")],list(NBA1415$Team,NBA1415$Position))
lapply(NBA1415TP, colMeans)
sapply(NBA1415TP, colMeans)
#同時針對隊伍和守備位置做分群
-----------------------------------------
##類似apply家族的函數:aggregate()
#‧像tapply(NBA1415$TotalPoints,NBA1415$Team,mean), split(), lapply()
#‧aggregate(資料,by=分組依據,FUN=函數功能)
aggregate(NBA1415$TotalPoints,
    by=list(NBA1415$Team,NBA1415$Position), FUN=mean)
aggregate(NBA1415$TotalPoints, by=list(NBA1415$Team,NBA1415$Position), FUN=mean, na.rm=TRUE)
#以隊伍還有守備位置做分組依據,算出NBA1415$TotalPoints
#這個data的mean

#‧aggregate(formula, data=資料,FUN=函數功能)
aggregate(TotalPoints ~ Team+Position, data = NBA1415, mean)
#這裡分類依據直接用~欄位1+欄位2

#‧Formula: if you need all, put [.] into the formula
# .~Team+Position
---------------------------------------------------------------
##若有NA值如何忽略 (加上 , na.rm=T)
x<-c(1,2,3,4,5)
mean(x)
x<-c(x,NA)
mean(x)
mean(x, na.rm=T)
sum(x)
sum(x, na.rm=T)
--------------------------------------------------
##List Subsetting
#單括號取得list
#[[]]雙括號取得"值"
#$Name取得"值"
---------------------------------------------------
#移除NA
#‧ Subset
x <- c(1, 2, NA, 4, NA, 5)
x[! is.na(x)]
# 1 2 4 5

#complete.cases()可以使用在data frme,取出所有欄位都不是NA的row

---------------------------------------------------------
###第三個投影片3/28-------------------------------------

##複習Vector組合
x<-1:3
y<-10:12
cbind(x, y)#組合colum(直的由左而右)
## x y
## [1,] 1 10
## [2,] 2 11
## [3,] 3 12
rbind(x, y) #組合ROW
## [,1] [,2] [,3]
## x 1 2 3
## y 10 11 12

head(NBA1415,3) #表格前三行
NBA1415[1:3,] #取前三行(同上) ->subset

------------------------------------------
##複習subset
    
head(NBA1415[,"Name"])#取名為Name的那一列Column,同NBA1415$Name
## [1] "Quincy Acy" "Jordan Adams" "Steven Adams" "Jeff Adrien"
## [5] "Arron Afflalo" "Alexis Ajinca"

head(NBA1415[NBA1415$Team=="SAN",]) #取Team是SAN的所有行Row
#,同subset(NBA1415, Team=="SAN")
## League Name Team Position GamesPlayed TotalMinutesPlayed
## 16 NBA Kyle Anderson SAN SG 33 355
## 26 NBA Jeff Ayres SAN PF 51 386
## 39 NBA Aron Baynes SAN PF 70 1126
## 43 NBA Marco Belinelli SAN SG 62 1386
## 56 NBA Matt Bonner SAN PF 72 938
## 126 NBA Boris Diaw SAN PF 81 1987
## FieldGoalsMade FieldGoalsAttempted ThreesMade ThreesAttempted 6/80
-------------------------------------
##複習字串比對
grep("Tim",NBA1415$Name) #回傳符合條件的row(直)index
## [1] 137 158 196 335

head(grepl("Tim",NBA1415$Name)) #回傳T/F
## [1] FALSE FALSE FALSE FALSE FALSE FALSE

NBA1415[grep("Tim",NBA1415$Name),] #搭被subset
## League Name Team Position GamesPlayed TotalMinutesPlayed
## 137 NBA Tim Duncan SAN PF 77 2224
## 158 NBA Tim Frazier POR PG 11 241
## 196 NBA Tim Hardaway NYK SG 70 1683
## 335 NBA Timofey Mozgov CLE C 81 2058
## FieldGoalsMade FieldGoalsAttempted ThreesMade ThreesAttempted
## 137 419 819 2 7

--------------------------------
#作業 for
    for(i in 1:nrow(NBA1415)){
        if(NBA1415[i,"GamesPlayed"]>70&NBA1415[i,"TotalPoints"]>1500){
            print(NBA1415[i,c("Name","Team","Position")])
        }
    }

#作業sunset更快
subset(NBA1415,GamesPlayed>70&
           TotalPoints>1500)[,c("Name","Team","Position")]

#Data Frame的subset[]也可以搞定
NBA1415[NBA1415$GamesPlayed>70&
            NBA1415$TotalPoints>1500,
        c("Name","Team","Position")]
## Name Team Position
## 9 Lamarcu Aldridge POR PF
## 112 Stephen Curry GSW PG
## 142 Monta Ellis DAL SG
## 197 James Harden HOU SG
## 231 Kyrie Irving CLE PG
-----------------------------------------------
    San<-subset(NBA1415,Team=='SAN')
order(San$TotalPoints,decreasing = T)    
#馬刺隊個人總得分
## [1] 7 11 13 9 8 6 4 10 3 14 12 5 2 1 15

San[order(San$TotalPoints,decreasing = T)[1],
    c("Name","Team","TotalPoints")]
#馬刺隊個人總得分最高分的人
## Name Team TotalPoints
## 137 Tim Duncan SAN 1070
-----------------------------------------
## for+unique()取出每隊最高分的球員
unique(NBA1415$Team) #取不重複隊名
## [1] NYK MEM OKL MIN POR NOR PHI IND DAL MIA BRO SAN MIL DET ATL HOU DEN
## [18] CHI GSW LAC PHO BOS WAS UTA SAC CHA LAL TOR CLE ORL
## 30 Levels: ATL BOS BRO CHA CHI CLE DAL DEN DET GSW HOU IND LAC LAL ... WAS

for(team in unique(NBA1415$Team)){
    selectTeam<-subset(NBA1415,Team==team)
    print(selectTeam[order(selectTeam$TotalPoints,decreasing = T)[1],
                     c("Name","Team","TotalPoints")])
}
##Name Team TotalPoints
##19 Carmelo Anthony  NYK         966
##Name Team TotalPoints
##166 Marc Gasol  MEM        1413
##Name Team TotalPoints
---------------------------------------
##用rbind()把輸出整理成一個data frame
    FinalOutput<-NULL
for(team in unique(NBA1415$Team)){
    selectTeam<-subset(NBA1415,Team==team)
    FinalOutput<-rbind(FinalOutput,selectTeam
                       [order(selectTeam$TotalPoints,decreasing = T)[1],
                       c("Name","Team","TotalPoints")])
}
FinalOutput
## Name Team TotalPoints
## 19 Carmelo Anthony NYK 966
## 166 Marc Gasol MEM 1413
## 470 Russel Westbrook OKL 1886
## 473 Andrew Wiggins MIN 1387

---------------------------
##apply複習
apply(NBA1415[,c("GamesPlayed","TotalMinutesPlayed","TotalPoints")]
          ,2,mean)
#NBA1415球季,出場數.出場總分鐘數.總分的最大值各是多少
#apply(Data, MARGIN, FUN,…)
## GamesPlayed TotalMinutesPlayed TotalPoints
## 52.81707 1210.46341 499.95935
-------------------------------
##apply()快速功能
rowSums = apply(x, 1, sum)
rowMeans = apply(x, 1, mean)
colSums = apply(x, 2, sum)
colMeans = apply(x, 2, mean)
--------------------------------
##sapply()
sapply(NBA1415[,c("GamesPlayed","TotalMinutesPlayed","TotalPoints")],
           mean)
#NBA1415球季,出場數.出場總分鐘數.總分的平均值各是多少
## GamesPlayed TotalMinutesPlayed TotalPoints
## 52.81707 1210.46341 499.95935

#同等於
apply(NBA1415[,c("GamesPlayed","TotalMinutesPlayed","TotalPoints")]
      ,2,mean)
--------------------------------------
lapply(): List   
lapply(iris, mean)
## $Sepal.Length
## [1] 5.843333
##
## $Sepal.Width
## [1] 3.057333
lapply(NBA1415[,c("GamesPlayed","TotalMinutesPlayed","TotalPoints")],
       mean)
#NBA1415球季,出場數.出場總分鐘數.總分的平均值各是多少
## $GamesPlayed
## [1] 52.81707
##
## $TotalMinutesPlayed
## [1] 1210.463
##
## $TotalPoints
## [1] 499.9593
--------------------------------
##定義新函數
    round2<-function(vector){
        round(vector,digits = 2)
    }
round2(3.886)
## [1] 3.89
------------------------------------
round2Lazy<-function(vector,nothing){
    round(vector,digits = 2)
}
round2(3.886)
##沒用到nothing參數程式也不會出錯
--------------------------------------
f <- function(a, b) {
    print(a)
    print(b)
}
f(45)
## [1] 45
#沒有輸入b也不會檢查,只在執行print(b)才出現錯誤訊息



