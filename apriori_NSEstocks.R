#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#Ref:  Future trend prediction of NSE stocks using apriori algorithm
#Author: Ramanathan Perumal
#Mail: ramamet4@gmail.com
#DateModified:30/10/2016
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#libraries

library(lubridate)
library(ggplot2)
library(quantmod)
library(reshape2)
library(RColorBrewer)
library(arules)
library(dplyr)
library(arulesViz)
library(colorspace)

# time line for the data mining 
START=c("2009-01-01")
END=c("2016-10-25")

 
 symbols=c( "ACC.NS","ADANIPORTS.NS" ,"AMBUJACEM.NS" , "ASIANPAINT.NS",
 "AXISBANK.NS"  ,  "BANKBARODA.NS", "BHEL.NS",      
  "BPCL.NS",       "BHARTIARTL.NS", "BOSCHLTD.NS",   "CAIRN.NS",     
 "CIPLA.NS",      "COALINDIA.NS",  "DRREDDY.NS",    "GAIL.NS",      
 "GRASIM.NS",     "HCLTECH.NS" ,   "HDFCBANK.NS",   "HEROMOTOCO.NS",
 "HINDALCO.NS" ,  "HINDUNILVR.NS", "HDFC.NS"  ,     "ITC.NS",       
 "ICICIBANK.NS" , "IDEA.NS" ,      "INDUSINDBK.NS", "INFY.NS" ,     
 "KOTAKBANK.NS",  "LT.NS" ,        "LUPIN.NS",      "MARUTI.NS",    
 "NTPC.NS" ,      "ONGC.NS",       "POWERGRID.NS" , "PNB.NS",       
 "RELIANCE.NS",   "SBIN.NS",       "SUNPHARMA.NS" , "TCS.NS",       
 "TATAMOTORS.NS", "TATAPOWER.NS",  "TATASTEEL.NS" , "TECHM.NS",     
 "ULTRACEMCO.NS", "VEDL.NS",       "WIPRO.NS" ,     "YESBANK.NS", "ZEEL.NS")
  
 
 # nifty data
  getSymbols("^NSEI",from=START,to=END,adjust=TRUE)
  nifty <- (Cl(get("NSEI")))
  #nifty=nifty[-(1:15),]
  nifty <- data.frame(Date=as.POSIXct(index(nifty)), nifty)
  nifty$Date= as.Date(nifty$Date)
  rownames(nifty)=NULL
  colnames(nifty)[2]="nifty"
   
  #+++++++++++ 
  #nifty50 company data
  #getSymbols(symbols[1:length(symbols)],from="2016-05-01",to="2016-10-20",adjust=TRUE)
  getSymbols(symbols[1:length(symbols)],from=START,to=END,adjust=TRUE)
  prices0 <- (Cl(get(symbols[1])))
    
    for(i in 2:length(symbols))
    prices0 <- merge(prices0,(Cl(get(symbols[i]))))   
    colnames(prices0) <- symbols
    df <- data.frame(Date=as.POSIXct(index(prices0)), prices0)
    df$Date= as.Date(df$Date)
    colnames(df)=gsub(".NS","",colnames(df))
    rownames(df)=NULL
    #df=df[-(1:15),]
    
    #+++++++++++++
    df2=merge(nifty,df,id="Date")
    
    dff=df2[,-1]
    
   
    dt=apply(dff,2,function(x) {x-lag(x)})
    #dtt=data.frame(dt)
    dtt=apply(dt,2,function(x) {ifelse(x>0,1,0)})
    dtt=data.frame(dtt)
    df3=cbind(df2[,1],dtt)
    df3=df3[-1,]
    colnames(df3)[1]="Date"
   

     df4=df3[,-1]
     df5=apply(df4,2,function(x) {as.factor(as.character(x))})
     df5=data.frame(df5)
     dd <- as(df5, "transactions") 
     
     
    # creating rules with support minimum of 0.01 and confidence minimum of 0.25. 
    # We have resticted that minimum length of 2 rules and maximum length of 3 rules
    rules <- apriori(dd,
                 parameter = list(support=0.01,
                                  confidence=0.25,
                                  minlen=2,
                                  maxlen=3,
                                  target='rules' # to mine for rules
                                  ))
          

       svg("myLift.svg",width=20,height=16)
       plot(head(sort(rules, by="lift"), 50),
            method="graph", control=list(cex=1.5))     
       dev.off()     
            
       svg("mySupport.svg",width=20,height=16)    
       plot(head(sort(rules, by="support"), 50),
            method="graph",shading = "lift", control=list(cex=1.5))
        dev.off()  
        
                        
       svg("myConf.svg",width=20,height=16)    
       plot(head(sort(rules, by="confidence"), 50),
            method="graph",shading = "lift", control=list(cex=1.5))
        dev.off()                 
   
 #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    
    # To predict the trend line of selected company with related group companies movement  
   
    #for Tatamotors                              
    tata_rules<-apriori(data=dd, parameter=list(supp=0.01,conf = 0.25,minlen=2,maxlen=6), 
               appearance = list(default="lhs",rhs="TATAMOTORS=1"))
               #control = list(verbose=F))                           
    
    # inspect top 5 with lift factor
    inspect(sort(tata_rules, by='lift', decreasing = T)[1:5])  
   
    # tata group company association line algorithm with TATAMOTORS
    test1= subset(tata_rules, lhs %in% c("TATASTEEL=0","TATASTEEL=1","TATAPOWER=0","TATAPOWER=1"))
    
    # both tatapower, tatasteel and tcs are up, tatamotor is also up
    test2= subset(tata_rules, (lhs %in% "TATASTEEL=1")  & (lhs %in% "TATAPOWER=1")  & (lhs %in% "TCS=1"))
    inspect(sort(test2, by='lift', decreasing = T)[1:5])   
    

    #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     
    
  