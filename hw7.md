乳癌預測模型
================

資料前處理
----------

### 資料解釋

此資料來源為UCI Machine Learning Repository。

資料內共紀錄699個病人資料，用來預測病人的乳房腫瘤是良性還是陰性，裡頭包含了11個參數，例如細胞大小等等...。分類結果為二元分類，包刮陰性(malignant)與良性(benign)。

### 資料讀取

``` r
#install.packages("mlbench")
library(mlbench)
```

    ## Warning: package 'mlbench' was built under R version 3.2.5

``` r
data(BreastCancer)
str(BreastCancer)
```

    ## 'data.frame':    699 obs. of  11 variables:
    ##  $ Id             : chr  "1000025" "1002945" "1015425" "1016277" ...
    ##  $ Cl.thickness   : Ord.factor w/ 10 levels "1"<"2"<"3"<"4"<..: 5 5 3 6 4 8 1 2 2 4 ...
    ##  $ Cell.size      : Ord.factor w/ 10 levels "1"<"2"<"3"<"4"<..: 1 4 1 8 1 10 1 1 1 2 ...
    ##  $ Cell.shape     : Ord.factor w/ 10 levels "1"<"2"<"3"<"4"<..: 1 4 1 8 1 10 1 2 1 1 ...
    ##  $ Marg.adhesion  : Ord.factor w/ 10 levels "1"<"2"<"3"<"4"<..: 1 5 1 1 3 8 1 1 1 1 ...
    ##  $ Epith.c.size   : Ord.factor w/ 10 levels "1"<"2"<"3"<"4"<..: 2 7 2 3 2 7 2 2 2 2 ...
    ##  $ Bare.nuclei    : Factor w/ 10 levels "1","2","3","4",..: 1 10 2 4 1 10 10 1 1 1 ...
    ##  $ Bl.cromatin    : Factor w/ 10 levels "1","2","3","4",..: 3 3 3 3 3 9 3 3 1 2 ...
    ##  $ Normal.nucleoli: Factor w/ 10 levels "1","2","3","4",..: 1 2 1 7 1 7 1 1 1 1 ...
    ##  $ Mitoses        : Factor w/ 9 levels "1","2","3","4",..: 1 1 1 1 1 1 1 1 5 1 ...
    ##  $ Class          : Factor w/ 2 levels "benign","malignant": 1 1 1 1 1 2 1 1 1 1 ...

### 資料前處理

留下沒有缺值的資料，並把無關病情的資料拿掉(ID)

``` r
BreastCancerC<-BreastCancer[complete.cases(BreastCancer),
!names(BreastCancer) %in% c("Id")] 
c(nrow(BreastCancer),nrow(BreastCancerC))
```

    ## [1] 699 683

### 將資料隨機分為訓練組與測試組

隨機將2/3的資料分到訓練組（Test==F），剩下1/3為測試組（Test==T)

``` r
BreastCancerC$Test<-F 
BreastCancerC[
    sample(1:nrow(BreastCancerC),nrow(BreastCancerC)/3),
    ]$Test<-T 

c(sum(BreastCancerC$Test==F),sum(BreastCancerC$Test==T)) 
```

    ## [1] 456 227

可得訓練組案例數為456測試組案例數為227

預測模型建立
------------

### 模型建立

由於變數多，且多為連續變項，而輸出為二元類別變項，故選擇決策樹演算法來建立模型。

``` r
#install.packages("rpart")
library(rpart)
```

    ## Warning: package 'rpart' was built under R version 3.2.5

``` r
BreastCancerC$Class<-factor(BreastCancerC$Class,levels=c("malignant","benign"))

#set.seed(1000)          
fit<-rpart(Class~.,data=BreastCancerC[BreastCancerC$Test==F,]) 

#install.packages("rpart.plot")
library(rpart.plot)
```

    ## Warning: package 'rpart.plot' was built under R version 3.2.5

``` r
summary(fit)
```

    ## Call:
    ## rpart(formula = Class ~ ., data = BreastCancerC[BreastCancerC$Test == 
    ##     F, ])
    ##   n= 456 
    ## 
    ##           CP nsplit rel error    xerror       xstd
    ## 1 0.81366460      0 1.0000000 1.0000000 0.06338926
    ## 2 0.06832298      1 0.1863354 0.2546584 0.03794090
    ## 3 0.01242236      2 0.1180124 0.1739130 0.03184143
    ## 4 0.01000000      4 0.0931677 0.1739130 0.03184143
    ## 
    ## Variable importance
    ##      Cell.shape       Cell.size     Bare.nuclei     Bl.cromatin 
    ##              21              18              17              14 
    ## Normal.nucleoli    Epith.c.size    Cl.thickness         Mitoses 
    ##              14              13               1               1 
    ## 
    ## Node number 1: 456 observations,    complexity param=0.8136646
    ##   predicted class=benign     expected loss=0.3530702  P(node) =1
    ##     class counts:   161   295
    ##    probabilities: 0.353 0.647 
    ##   left son=2 (155 obs) right son=3 (301 obs)
    ##   Primary splits:
    ##       Cell.shape   splits as  RRRLLLLLLL, improve=152.3223, (0 missing)
    ##       Cell.size    splits as  RRRLLLLLLL, improve=152.3148, (0 missing)
    ##       Bare.nuclei  splits as  RRRLLLLLLL, improve=142.1449, (0 missing)
    ##       Bl.cromatin  splits as  RRRLLLLLLL, improve=132.1293, (0 missing)
    ##       Epith.c.size splits as  RRLLLLLLLL, improve=129.1679, (0 missing)
    ##   Surrogate splits:
    ##       Cell.size       splits as  RRRLLLLLLL, agree=0.943, adj=0.832, (0 split)
    ##       Bare.nuclei     splits as  RRRLLLLLLL, agree=0.890, adj=0.677, (0 split)
    ##       Epith.c.size    splits as  RRLLLLLLLL, agree=0.882, adj=0.652, (0 split)
    ##       Bl.cromatin     splits as  RRRLLLLLLL, agree=0.873, adj=0.626, (0 split)
    ##       Normal.nucleoli splits as  RRLLLLLLLL, agree=0.868, adj=0.613, (0 split)
    ## 
    ## Node number 2: 155 observations,    complexity param=0.01242236
    ##   predicted class=malignant  expected loss=0.07741935  P(node) =0.3399123
    ##     class counts:   143    12
    ##    probabilities: 0.923 0.077 
    ##   left son=4 (132 obs) right son=5 (23 obs)
    ##   Primary splits:
    ##       Bare.nuclei     splits as  RLRLLLRLLL, improve=3.949577, (0 missing)
    ##       Cell.size       splits as  RRRRLLLLLL, improve=3.211501, (0 missing)
    ##       Bl.cromatin     splits as  RRLLLLLLLL, improve=2.574203, (0 missing)
    ##       Normal.nucleoli splits as  RRLLLRRLLL, improve=2.483566, (0 missing)
    ##       Cell.shape      splits as  RRRRLLLLLL, improve=2.298763, (0 missing)
    ##   Surrogate splits:
    ##       Bl.cromatin splits as  RRLLLLLLLL, agree=0.871, adj=0.130, (0 split)
    ##       Cell.size   splits as  RLLLLLLLLL, agree=0.865, adj=0.087, (0 split)
    ## 
    ## Node number 3: 301 observations,    complexity param=0.06832298
    ##   predicted class=benign     expected loss=0.05980066  P(node) =0.6600877
    ##     class counts:    18   283
    ##    probabilities: 0.060 0.940 
    ##   left son=6 (13 obs) right son=7 (288 obs)
    ##   Primary splits:
    ##       Bare.nuclei     splits as  RRRRR-LL-L, improve=20.25102, (0 missing)
    ##       Bl.cromatin     splits as  RRRRLRLL--, improve=19.73803, (0 missing)
    ##       Normal.nucleoli splits as  RRRLLLLL--, improve=16.09981, (0 missing)
    ##       Cl.thickness    splits as  RRRRRRLLLL, improve=14.95675, (0 missing)
    ##       Cell.size       splits as  RRRLLLLLLL, improve=12.75433, (0 missing)
    ##   Surrogate splits:
    ##       Normal.nucleoli splits as  RRRLLLLR--, agree=0.973, adj=0.385, (0 split)
    ##       Bl.cromatin     splits as  RRRRLRLL--, agree=0.970, adj=0.308, (0 split)
    ##       Cl.thickness    splits as  RRRRRRRRLL, agree=0.967, adj=0.231, (0 split)
    ##       Marg.adhesion   splits as  RRRRLLLLLL, agree=0.963, adj=0.154, (0 split)
    ##       Mitoses         splits as  RRRLRL--R,  agree=0.963, adj=0.154, (0 split)
    ## 
    ## Node number 4: 132 observations
    ##   predicted class=malignant  expected loss=0.03030303  P(node) =0.2894737
    ##     class counts:   128     4
    ##    probabilities: 0.970 0.030 
    ## 
    ## Node number 5: 23 observations,    complexity param=0.01242236
    ##   predicted class=malignant  expected loss=0.3478261  P(node) =0.0504386
    ##     class counts:    15     8
    ##    probabilities: 0.652 0.348 
    ##   left son=10 (11 obs) right son=11 (12 obs)
    ##   Primary splits:
    ##       Cell.size       splits as  RRRRLLLLLL, improve=5.101449, (0 missing)
    ##       Cell.shape      splits as  RRRRRRLLLL, improve=3.577640, (0 missing)
    ##       Normal.nucleoli splits as  RRLL-R-RLL, improve=3.577640, (0 missing)
    ##       Cl.thickness    splits as  RRRRRRLLLL, improve=3.510540, (0 missing)
    ##       Marg.adhesion   splits as  RRRLLLLLLL, improve=3.510540, (0 missing)
    ##   Surrogate splits:
    ##       Cl.thickness    splits as  RRRRRRRLLL, agree=0.826, adj=0.636, (0 split)
    ##       Cell.shape      splits as  RRRRRRLLLL, agree=0.826, adj=0.636, (0 split)
    ##       Bl.cromatin     splits as  RLRRL-RL-L, agree=0.739, adj=0.455, (0 split)
    ##       Normal.nucleoli splits as  RRRL-R-RLL, agree=0.739, adj=0.455, (0 split)
    ##       Mitoses         splits as  RRL-L-RLL,  agree=0.696, adj=0.364, (0 split)
    ## 
    ## Node number 6: 13 observations
    ##   predicted class=malignant  expected loss=0.07692308  P(node) =0.02850877
    ##     class counts:    12     1
    ##    probabilities: 0.923 0.077 
    ## 
    ## Node number 7: 288 observations
    ##   predicted class=benign     expected loss=0.02083333  P(node) =0.6315789
    ##     class counts:     6   282
    ##    probabilities: 0.021 0.979 
    ## 
    ## Node number 10: 11 observations
    ##   predicted class=malignant  expected loss=0  P(node) =0.02412281
    ##     class counts:    11     0
    ##    probabilities: 1.000 0.000 
    ## 
    ## Node number 11: 12 observations
    ##   predicted class=benign     expected loss=0.3333333  P(node) =0.02631579
    ##     class counts:     4     8
    ##    probabilities: 0.333 0.667

``` r
prp(fit)
```

![](hw7_files/figure-markdown_github/unnamed-chunk-4-1.png)<!-- -->

### 模型說明

由上述參數可知，以決策樹建立模型預測乳房腫瘤是否為陰性或良性，經最佳化後，所用到的參數為上圖的決策樹所示

預測模型驗證
------------

``` r
#install.packages("caret")
library(caret)
```

    ## Warning: package 'caret' was built under R version 3.2.5

    ## Loading required package: lattice

    ## Loading required package: ggplot2

    ## Warning: package 'ggplot2' was built under R version 3.2.5

``` r
MinePred<-predict(fit,newdata = BreastCancerC[BreastCancerC$Test==T,],type = "class")

sensitivity(MinePred,BreastCancerC[BreastCancerC$Test==T,]$Class)
```

    ## [1] 0.9041096

``` r
specificity(MinePred,BreastCancerC[BreastCancerC$Test==T,]$Class)
```

    ## [1] 0.961039

``` r
posPredValue(MinePred,BreastCancerC[BreastCancerC$Test==T,]$Class)
```

    ## [1] 0.9166667

``` r
negPredValue(MinePred,BreastCancerC[BreastCancerC$Test==T,]$Class)
```

    ## [1] 0.9548387

使用病患資料來預測乳房腫瘤是否為陰性或良性，以決策樹模型預測是否為陰性，可得：

-   敏感度 90.4109589%
-   特異性 96.1038961%
-   陽性預測率 91.6666667%
-   陰性預測率 95.483871%
