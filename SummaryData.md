```r
>> summary(dd) 
``` 


transactions as itemMatrix in sparse format with
 1937 rows (elements/itemsets/transactions) and
 98 columns (items) and a density of 0.4960648 

most frequent items:
HCLTECH=1 DRREDDY=1   WIPRO=1   LUPIN=1     ITC=1   (Other) 
     1024      1020      1016      1014      1013     89079 

element (itemset/transaction) length distribution:
sizes
  24   25   48   49 
   6    6  453 1472 

   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  24.00   49.00   49.00   48.61   49.00   49.00 

includes extended item information - examples:
   labels variables levels
1 nifty=0     nifty      0
2 nifty=1     nifty      1
3   ACC=0       ACC      0

includes extended transaction information - examples:
  transactionID
1             1
2             2
3             3

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

>> summary(rules)

set of 13465699 rules

rule length distribution (lhs + rhs):sizes
       2        3        4 
    9391   433903 13022405 

   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  2.000   4.000   4.000   3.966   4.000   4.000 

summary of quality measures:
    support          confidence          lift       
 Min.   :0.01033   Min.   :0.2500   Min.   :0.4729  
 1st Qu.:0.04182   1st Qu.:0.4104   1st Qu.:0.8337  
 Median :0.05111   Median :0.5036   Median :1.0173  
 Mean   :0.06390   Mean   :0.5090   Mean   :1.0260  
 3rd Qu.:0.06763   3rd Qu.:0.6013   3rd Qu.:1.2076  
 Max.   :0.40165   Max.   :0.9710   Max.   :1.9831  

mining info:
 data ntransactions support confidence
   dd          1937    0.01       0.25


