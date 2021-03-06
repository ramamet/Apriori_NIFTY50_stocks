 ```r
>> inspect(sort(rules, by = "lift")[1:10])
``` 

         lhs                                     rhs       support   confidence
    [1]  {ICICIBANK=0,RELIANCE=0,WIPRO=0}     => {nifty=0} 0.1925658 0.9613402 
    [2]  {GRASIM=0,ICICIBANK=0,WIPRO=0}       => {nifty=0} 0.1744966 0.9575071 
    [3]  {RELIANCE=0,SBIN=0,WIPRO=0}          => {nifty=0} 0.1868869 0.9551451 
    [4]  {HDFCBANK=0,SBIN=0,WIPRO=0}          => {nifty=0} 0.1837894 0.9544236 
    [5]  {HDFCBANK=0,ICICIBANK=0,INFY=0}      => {nifty=0} 0.2018585 0.9536585 
    [6]  {HDFCBANK=0,ICICIBANK=0,WIPRO=0}     => {nifty=0} 0.1884357 0.9530026 
    [7]  {GRASIM=0,SBIN=0,WIPRO=0}            => {nifty=0} 0.1667527 0.9528024 
    [8]  {HDFCBANK=0,INFY=0,SBIN=0}           => {nifty=0} 0.1956634 0.9522613 
    [9]  {AMBUJACEM=0,HDFCBANK=0,ICICIBANK=0} => {nifty=0} 0.2157976 0.9521640 
    [10] {ACC=0,ICICIBANK=0,WIPRO=0}          => {nifty=0} 0.1910170 0.9511568 
         lift    
    [1]  1.983084
    [2]  1.975177
    [3]  1.970305
    [4]  1.968816
    [5]  1.967238
    [6]  1.965885
    [7]  1.965472
    [8]  1.964356
    [9]  1.964155
    [10] 1.962077


To predict the trend line of selected company with related group companies movement  
 
for Tatamotors,
 
 ```r
 >> tata_rules<-apriori(data=dd, parameter=list(supp=0.01,conf = 0.25,minlen=2,maxlen=6), 
               appearance = list(default="lhs",rhs="TATAMOTORS=1"))

 >> inspect(sort(tata_rules, by='lift', decreasing = T)[1:5])  
 
```  

        lhs               rhs               support confidence     lift
    [1] {CIPLA=1,                                                      
         COALINDIA=1,                                                  
         PNB=1,                                                        
         WIPRO=1}      => {TATAMOTORS=1} 0.07330924  0.8930818 1.785242
    [2] {AXISBANK=1,                                                   
         CAIRN=1,                                                      
         HINDUNILVR=1,                                                 
         TCS=1}        => {TATAMOTORS=1} 0.10738255  0.8927039 1.784486
    [3] {CAIRN=1,                                                      
         MARUTI=1,                                                     
         SBIN=1,                                                       
         SUNPHARMA=1}  => {TATAMOTORS=1} 0.11874032  0.8914729 1.782026
    [4] {CAIRN=1,                                                      
         MARUTI=1,                                                     
         PNB=1,                                                        
         SUNPHARMA=1}  => {TATAMOTORS=1} 0.11409396  0.8911290 1.781338
    [5] {AXISBANK=1,                                                   
         CAIRN=1,                                                      
         HINDUNILVR=1,                                                 
         INDUSINDBK=1} => {TATAMOTORS=1} 0.12183789  0.8905660 1.780213
     

 
 ```r
  >> inspect(sort(test2, by='lift', decreasing = T)[1:5])  
  ```  
  
  
          lhs               rhs              support confidence     lift
      [1] {DRREDDY=1,                                                   
           TCS=1,                                                       
           TATAPOWER=1,                                                 
           TATASTEEL=1}  => {TATAMOTORS=1} 0.1146102  0.8538462 1.706811
      [2] {TCS=1,                                                       
           TATAPOWER=1,                                                 
           TATASTEEL=1,                                                 
           YESBANK=1}    => {TATAMOTORS=1} 0.1316469  0.8528428 1.704805
      [3] {BHARTIARTL=1,                                                
           TCS=1,                                                       
           TATAPOWER=1,                                                 
           TATASTEEL=1}  => {TATAMOTORS=1} 0.1104801  0.8392157 1.677565
      [4] {NTPC=1,                                                      
           TCS=1,                                                       
           TATAPOWER=1,                                                 
           TATASTEEL=1}  => {TATAMOTORS=1} 0.1270005  0.8367347 1.672606
      [5] {ICICIBANK=1,                                                 
           TCS=1,                                                       
           TATAPOWER=1,                                                 
           TATASTEEL=1}  => {TATAMOTORS=1} 0.1342282  0.8360129 1.671163


