//+------------------------------------------------------------------+
//|                                                          qqq.mq4 |
//|                       Copyright ?2006, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright ?2006, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"

//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int init()
  {
//----
       
 
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert deinitialization function                                 |
//+------------------------------------------------------------------+
int deinit()
  {
//----
   
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert start function                                            |
//+------------------------------------------------------------------+
int start()
  {

int longbuy01,longbuy02,longbuy03,longbuy04,longbuy05,longbuy06; 
int longbuy07,longbuy08,longbuy09,longbuy10,longbuy11,longbuy12; 
int longbuy13,longbuy14,longbuy15,longbuy16,longbuy17,longbuy18; 
int longbuy19,longbuy20,longbuy21,longbuy22,longbuy23,longbuy24; 

int longsell01,longsell02,longsell03,longsell04,longsell05,longsell06; 
int longsell07,longsell08,longsell09,longsell10,longsell11,longsell12; 
int longsell13,longsell14,longsell15,longsell16,longsell17,longsell18; 
int longsell19,longsell20,longsell21,longsell22,longsell23,longsell24; 
 
int shortbuy01,shortbuy02,shortbuy03,shortbuy04,shortbuy05,shortbuy06; 
int shortsell01,shortsell02,shortsell03,shortsell04,shortsell05,shortsell06; 
int orderno,longbuy,longsell;

//*********************************************************

 //將m1的16-bar的均線值及開收高低存於陣列中
 
  double ma05_01_buffer[68],ma08_01_buffer[68],  ma12_01_buffer[68],ma45_01_buffer[68], ma90_01_buffer[68] ,ma180_01_buffer[68] , ma360_01_buffer[68] , ma650_01_buffer[68];
  double open_01_buffer[68], close_01_buffer[68] ,high_01_buffer[68] , low_01_buffer[68] , time_01_buffer[68] ,volume_01_buffer[68];
  double k1_01_buffer[68],d1_01_buffer[68],k2_01_buffer[68],d2_01_buffer[68],k3_01_buffer[68],d3_01_buffer[68];
  double macdmainline_01_buffer[68],macdsignalline_01_buffer[68],ma18_01_buffer[68];
 
  int    b_01,bar68_01=ArraySize(ma05_01_buffer);

  ArraySetAsSeries(ma05_01_buffer,true);
  for(b_01=0; b_01<bar68_01 ; b_01++)
    ma05_01_buffer[b_01]=iMA(NULL,PERIOD_M1,5,0,MODE_SMA,PRICE_CLOSE,b_01);
  for(b_01=0; b_01<bar68_01 ; b_01++)
    ma08_01_buffer[b_01]=iMA(NULL,PERIOD_M1,8,0,MODE_SMA,PRICE_CLOSE,b_01);
  for(b_01=0; b_01<bar68_01 ; b_01++)
    ma12_01_buffer[b_01]=iMA(NULL,PERIOD_M1,12,0,MODE_SMA,PRICE_CLOSE,b_01);
 for(b_01=0; b_01<bar68_01 ; b_01++)
    ma18_01_buffer[b_01]=iMA(NULL,PERIOD_M1,18,0,MODE_SMA,PRICE_CLOSE,b_01);
  for(b_01=0; b_01<bar68_01 ; b_01++)
    ma45_01_buffer[b_01]=iMA(NULL,PERIOD_M1,45,0,MODE_SMA,PRICE_CLOSE,b_01);
  for(b_01=0; b_01<bar68_01 ; b_01++)
    ma90_01_buffer[b_01]=iMA(NULL,PERIOD_M1,90,0,MODE_SMA,PRICE_CLOSE,b_01);
  for(b_01=0; b_01<bar68_01 ; b_01++)
   ma180_01_buffer[b_01]=iMA(NULL,PERIOD_M1,180,0,MODE_SMA,PRICE_CLOSE,b_01);
  for(b_01=0; b_01<bar68_01 ; b_01++)
    ma360_01_buffer[b_01]=iMA(NULL,PERIOD_M1,360,0,MODE_SMA,PRICE_CLOSE,b_01);
  for(b_01=0; b_01<bar68_01 ; b_01++)
    ma650_01_buffer[b_01]=iMA(NULL,PERIOD_M1,650,0,MODE_SMA,PRICE_CLOSE,b_01);
  for(b_01=0; b_01<bar68_01 ; b_01++)
   open_01_buffer[b_01]=iOpen(NULL,PERIOD_M1,b_01);
  for(b_01=0; b_01<bar68_01 ; b_01++)
    close_01_buffer[b_01]=iClose(NULL,PERIOD_M1,b_01);
  for(b_01=0; b_01<bar68_01 ; b_01++)
    high_01_buffer[b_01]=iHigh(NULL,PERIOD_M1,b_01);
  for(b_01=0; b_01<bar68_01 ; b_01++)
    low_01_buffer[b_01]=iLow(NULL,PERIOD_M1,b_01);
//for m1-kd1,kd2,kd3
  for(b_01=0; b_01<bar68_01 ; b_01++)
    k1_01_buffer[b_01]=iStochastic(NULL,PERIOD_M1,10,3,3,MODE_SMA,0,MODE_MAIN,b_01);
  for(b_01=0; b_01<bar68_01 ; b_01++)
    d1_01_buffer[b_01]=iStochastic(NULL,PERIOD_M1,10,3,3,MODE_SMA,0,MODE_SIGNAL,b_01);
  for(b_01=0; b_01<bar68_01 ; b_01++)
    k2_01_buffer[b_01]=iStochastic(NULL,PERIOD_M1,15,6,6,MODE_SMA,0,MODE_MAIN,b_01);
  for(b_01=0; b_01<bar68_01 ; b_01++)
    d2_01_buffer[b_01]=iStochastic(NULL,PERIOD_M1,15,6,6,MODE_SMA,0,MODE_SIGNAL,b_01);
  for(b_01=0; b_01<bar68_01 ; b_01++)
    k3_01_buffer[b_01]=iStochastic(NULL,PERIOD_M1,12,8,8,MODE_SMA,0,MODE_MAIN,b_01);
  for(b_01=0; b_01<bar68_01 ; b_01++)
    d3_01_buffer[b_01]=iStochastic(NULL,PERIOD_M1,12,8,8,MODE_SMA,0,MODE_SIGNAL,b_01);
 //for macd
  for(b_01=0; b_01<bar68_01 ; b_01++)
    macdmainline_01_buffer[b_01]=iMACD(NULL,PERIOD_M1,12,26,9,PRICE_CLOSE,MODE_MAIN,b_01);
  for(b_01=0; b_01<bar68_01 ; b_01++)
    macdsignalline_01_buffer[b_01]=iMACD(NULL,PERIOD_M1,12,26,9,PRICE_CLOSE,MODE_SIGNAL,b_01);

  //記錄16-bar 及17-32-bar之最高最低價
 double m1highest16bar;
 double m1highest40bar;
 double m1lowest16bar;
 double m1lowest40bar;
 double m1highest16bartime;
 double m1highest40bartime;
 double m1lowest16bartime;
 double m1lowest40bartime;

//++++++++++++  M5  ++++++++++++++++++++++++++++++++++++++++++++++  
 
 //將m5的16-bar的均線值及開收高低存於陣列中
 
  double ma05_05_buffer[68],ma08_05_buffer[68],  ma12_05_buffer[68],ma45_05_buffer[68], ma90_05_buffer[68] ,ma180_05_buffer[68] , ma360_05_buffer[68] , ma650_05_buffer[68];
  double open_05_buffer[68], close_05_buffer[68] ,high_05_buffer[68] , low_05_buffer[68] , time_05_buffer[68] ,volume_05_buffer[68];
  double k1_05_buffer[68],d1_05_buffer[68],k2_05_buffer[68],d2_05_buffer[68],k3_05_buffer[68],d3_05_buffer[68];
  double macdmainline_05_buffer[68],macdsignalline_05_buffer[68];
 
  int    b_05,bar68_05=ArraySize(ma05_05_buffer);

  ArraySetAsSeries(ma05_05_buffer,true);
  for(b_05=0; b_05<bar68_05 ; b_05++)
    ma05_05_buffer[b_05]=iMA(NULL,PERIOD_M5,5,0,MODE_SMA,PRICE_CLOSE,b_05);
  for(b_05=0; b_05<bar68_05 ; b_05++)
    ma08_05_buffer[b_05]=iMA(NULL,PERIOD_M5,8,0,MODE_SMA,PRICE_CLOSE,b_05);
  for(b_05=0; b_05<bar68_05 ; b_05++)
    ma12_05_buffer[b_05]=iMA(NULL,PERIOD_M5,12,0,MODE_SMA,PRICE_CLOSE,b_05);
  for(b_05=0; b_05<bar68_05 ; b_05++)
    ma45_05_buffer[b_05]=iMA(NULL,PERIOD_M5,45,0,MODE_SMA,PRICE_CLOSE,b_05);
  for(b_05=0; b_05<bar68_05 ; b_05++)
    ma90_05_buffer[b_05]=iMA(NULL,PERIOD_M5,90,0,MODE_SMA,PRICE_CLOSE,b_05);
  for(b_05=0; b_05<bar68_05 ; b_05++)
   ma180_05_buffer[b_05]=iMA(NULL,PERIOD_M5,180,0,MODE_SMA,PRICE_CLOSE,b_05);
  for(b_05=0; b_05<bar68_05 ; b_05++)
    ma360_05_buffer[b_05]=iMA(NULL,PERIOD_M5,360,0,MODE_SMA,PRICE_CLOSE,b_05);
  for(b_05=0; b_05<bar68_05 ; b_05++)
    ma650_05_buffer[b_05]=iMA(NULL,PERIOD_M5,650,0,MODE_SMA,PRICE_CLOSE,b_05);
  for(b_05=0; b_05<bar68_05 ; b_05++)
   open_05_buffer[b_05]=iOpen(NULL,PERIOD_M5,b_05);
  for(b_05=0; b_05<bar68_05 ; b_05++)
    close_05_buffer[b_05]=iClose(NULL,PERIOD_M5,b_05);
  for(b_05=0; b_05<bar68_05 ; b_05++)
    high_05_buffer[b_05]=iHigh(NULL,PERIOD_M5,b_05);
  for(b_05=0; b_05<bar68_05 ; b_05++)
    low_05_buffer[b_05]=iLow(NULL,PERIOD_M5,b_05);
//for m5-kd1,kd2,kd3
  for(b_05=0; b_05<bar68_05 ; b_05++)
    k1_05_buffer[b_05]=iStochastic(NULL,PERIOD_M5,10,3,3,MODE_SMA,0,MODE_MAIN,b_05);
  for(b_05=0; b_05<bar68_05 ; b_05++)
    d1_05_buffer[b_05]=iStochastic(NULL,PERIOD_M5,10,3,3,MODE_SMA,0,MODE_SIGNAL,b_05);
  for(b_05=0; b_05<bar68_05 ; b_05++)
    k2_05_buffer[b_05]=iStochastic(NULL,PERIOD_M5,15,6,6,MODE_SMA,0,MODE_MAIN,b_05);
  for(b_05=0; b_05<bar68_05 ; b_05++)
    d2_05_buffer[b_05]=iStochastic(NULL,PERIOD_M5,15,6,6,MODE_SMA,0,MODE_SIGNAL,b_05);
  for(b_05=0; b_05<bar68_05 ; b_05++)
    k3_05_buffer[b_05]=iStochastic(NULL,PERIOD_M5,12,8,8,MODE_SMA,0,MODE_MAIN,b_05);
  for(b_05=0; b_05<bar68_05 ; b_05++)
    d3_05_buffer[b_05]=iStochastic(NULL,PERIOD_M5,12,8,8,MODE_SMA,0,MODE_SIGNAL,b_05);
  for(b_05=0; b_05<bar68_05 ; b_05++)
    volume_05_buffer[b_05]=iVolume(NULL,PERIOD_H1,b_05);
//for macd
  for(b_05=0; b_05<bar68_05 ; b_05++)
    macdmainline_05_buffer[b_05]=iMACD(NULL,PERIOD_M5,12,26,9,PRICE_CLOSE,MODE_MAIN,b_05);
  for(b_05=0; b_05<bar68_05 ; b_05++)
    macdsignalline_05_buffer[b_05]=iMACD(NULL,PERIOD_M5,12,26,9,PRICE_CLOSE,MODE_SIGNAL,b_05);
 
  //記錄16-bar 及17-32-bar之最高最低價
 double m05highest16bar;
 double m05highest40bar;
 double m05lowest16bar;
 double m05lowest40bar;
 double m05highest16bartime;
 double m05highest40bartime;
 double m05lowest16bartime;
 double m05lowest40bartime;
 
 m05highest16bar=High[iHighest(NULL,PERIOD_M5,MODE_HIGH,16,1)];   //16bar的最高價
 m05highest40bar=High[iHighest(NULL,PERIOD_M5,MODE_HIGH,40,1)];   //40bar的最高價
 m05highest16bartime=High[iHighest(NULL,PERIOD_M5,MODE_TIME,16,1)];   //16bar的最高價的時間
 m05highest40bartime=High[iHighest(NULL,PERIOD_M5,MODE_TIME,40,1)];  //40bar的最高價的時間

 m05lowest16bar=Low[iLowest(NULL,PERIOD_M5,MODE_LOW,16,1)];     //16bar的最低價
 m05lowest40bar=Low[iLowest(NULL,PERIOD_M5,MODE_LOW,40,1)];   //40bar的最低價
 m05lowest16bartime=Low[iLowest(NULL,PERIOD_M5,MODE_TIME,16,1)];    //16bar的最低價的時間
 m05lowest40bartime=Low[iLowest(NULL,PERIOD_M5,MODE_TIME,40,1)];    //40bar的最低價的時間  

//++++++++++++  M15  ++++++++++++++++++++++++++++++++++++++++++++++  

 //將M15的68-bar的均線值及開收高低存於陣列中
 
  double ma05_15_buffer[68],ma08_15_buffer[68], ma12_15_buffer[68],ma45_15_buffer[68], ma90_15_buffer[68] ,ma180_15_buffer[68] , ma360_15_buffer[68] , ma650_15_buffer[68];
  double open_15_buffer[68], close_15_buffer[68] ,high_15_buffer[68] , low_15_buffer[68] , time_15_buffer[68] ,volume_15_buffer[68];
  double k1_15_buffer[68],d1_15_buffer[68],k2_15_buffer[68],d2_15_buffer[68],k3_15_buffer[68],d3_15_buffer[68];
  double macdmainline_15_buffer[68],macdsignalline_15_buffer[68];
 
  int    b_15,bar68_15=ArraySize(ma05_15_buffer);

  ArraySetAsSeries(ma05_15_buffer,true);
  for(b_15=0; b_15<bar68_15 ; b_15++)
    ma05_15_buffer[b_15]=iMA(NULL,PERIOD_M15,5,0,MODE_SMA,PRICE_CLOSE,b_15);
  for(b_15=0; b_15<bar68_15 ; b_15++)
    ma08_15_buffer[b_15]=iMA(NULL,PERIOD_M15,8,0,MODE_SMA,PRICE_CLOSE,b_15);
  for(b_15=0; b_15<bar68_15 ; b_15++)
    ma12_15_buffer[b_15]=iMA(NULL,PERIOD_M15,12,0,MODE_SMA,PRICE_CLOSE,b_15);
  for(b_15=0; b_15<bar68_15 ; b_15++)
    ma45_15_buffer[b_15]=iMA(NULL,PERIOD_M15,45,0,MODE_SMA,PRICE_CLOSE,b_15);
  for(b_15=0; b_15<bar68_15 ; b_15++)
    ma90_15_buffer[b_15]=iMA(NULL,PERIOD_M15,90,0,MODE_SMA,PRICE_CLOSE,b_15);
  for(b_15=0; b_15<bar68_15 ; b_15++)
   ma180_15_buffer[b_15]=iMA(NULL,PERIOD_M15,180,0,MODE_SMA,PRICE_CLOSE,b_15);
  for(b_15=0; b_15<bar68_15 ; b_15++)
    ma360_15_buffer[b_15]=iMA(NULL,PERIOD_M15,360,0,MODE_SMA,PRICE_CLOSE,b_15);
  for(b_15=0; b_15<bar68_15 ; b_15++)
    ma650_15_buffer[b_15]=iMA(NULL,PERIOD_M15,650,0,MODE_SMA,PRICE_CLOSE,b_15);
  for(b_15=0; b_15<bar68_15 ; b_15++)
   open_15_buffer[b_15]=iOpen(NULL,PERIOD_M15,b_15);
  for(b_15=0; b_15<bar68_15 ; b_15++)
    close_15_buffer[b_15]=iClose(NULL,PERIOD_M15,b_15);
  for(b_15=0; b_15<bar68_15 ; b_15++)
    high_15_buffer[b_15]=iHigh(NULL,PERIOD_M15,b_15);
  for(b_15=0; b_15<bar68_15 ; b_15++)
    low_15_buffer[b_15]=iLow(NULL,PERIOD_M15,b_15);
//for M15-kd1,kd2,kd3
  for(b_15=0; b_15<bar68_15 ; b_15++)
    k1_15_buffer[b_15]=iStochastic(NULL,PERIOD_M15,10,3,3,MODE_SMA,0,MODE_MAIN,b_15);
  for(b_15=0; b_15<bar68_15 ; b_15++)
    d1_15_buffer[b_15]=iStochastic(NULL,PERIOD_M15,10,3,3,MODE_SMA,0,MODE_SIGNAL,b_15);
  for(b_15=0; b_15<bar68_15 ; b_15++)
    k2_15_buffer[b_15]=iStochastic(NULL,PERIOD_M15,15,6,6,MODE_SMA,0,MODE_MAIN,b_15);
  for(b_15=0; b_15<bar68_15 ; b_15++)
    d2_15_buffer[b_15]=iStochastic(NULL,PERIOD_M15,15,6,6,MODE_SMA,0,MODE_SIGNAL,b_15);
  for(b_15=0; b_15<bar68_15 ; b_15++)
    k3_15_buffer[b_15]=iStochastic(NULL,PERIOD_M15,12,8,8,MODE_SMA,0,MODE_MAIN,b_15);
  for(b_15=0; b_15<bar68_15 ; b_15++)
    d3_15_buffer[b_15]=iStochastic(NULL,PERIOD_M15,12,8,8,MODE_SMA,0,MODE_SIGNAL,b_15);
  for(b_15=0; b_15<bar68_15 ; b_15++)
    volume_15_buffer[b_15]=iVolume(NULL,PERIOD_H1,b_15);

 //for macd
  for(b_15=0; b_15<bar68_15 ; b_15++)
    macdmainline_15_buffer[b_15]=iMACD(NULL,PERIOD_M15,12,26,9,PRICE_CLOSE,MODE_MAIN,b_15);
  for(b_15=0; b_15<bar68_15 ; b_15++)
    macdsignalline_15_buffer[b_15]=iMACD(NULL,PERIOD_M15,12,26,9,PRICE_CLOSE,MODE_SIGNAL,b_15);

  //記錄16-bar 及17-32-bar之最高最低價
 double M15highest16bar;
 double M15highest40bar;
 double M15lowest16bar;
 double M15lowest40bar;
 double M15highest16bartime;
 double M15highest40bartime;
 double M15lowest16bartime;
 double M15lowest40bartime;
 
 M15highest16bar=High[iHighest(NULL,PERIOD_M15,MODE_HIGH,16,1)];   //16bar的最高價
 M15highest40bar=High[iHighest(NULL,PERIOD_M15,MODE_HIGH,40,1)];   //40bar的最高價
 M15highest16bartime=High[iHighest(NULL,PERIOD_M15,MODE_TIME,16,1)];   //16bar的最高價的時間
 M15highest40bartime=High[iHighest(NULL,PERIOD_M15,MODE_TIME,40,1)];  //40bar的最高價的時間

 M15lowest16bar=Low[iLowest(NULL,PERIOD_M15,MODE_LOW,16,1)];     //16bar的最低價
 M15lowest40bar=Low[iLowest(NULL,PERIOD_M15,MODE_LOW,40,1)];   //40bar的最低價
 M15lowest16bartime=Low[iLowest(NULL,PERIOD_M15,MODE_TIME,16,1)];    //16bar的最低價的時間
 M15lowest40bartime=Low[iLowest(NULL,PERIOD_M15,MODE_TIME,40,1)];    //40bar的最低價的時間  

 //加長計算bar以代替m30,h1,h4
           //m30
 double M15highest50bar;
           //h1 
 double M15highest70bar;
           //h4
 double M15highest160bar;
           //m30
 double M15lowest50bar;
            //h1
 double M15lowest70bar;
           //h4
 double M15lowest160bar;
 
 M15highest50bar=High[iHighest(NULL,PERIOD_M15,MODE_HIGH,50,1)];   //80bar的最高價
 M15highest70bar=High[iHighest(NULL,PERIOD_M15,MODE_HIGH,70,1)];   //160bar的最高價
 M15highest160bar=High[iHighest(NULL,PERIOD_M15,MODE_HIGH,160,1)];   //640bar的最高價

 M15lowest50bar=Low[iLowest(NULL,PERIOD_M15,MODE_LOW,50,1)];     //80bar的最低價
 M15lowest70bar=Low[iLowest(NULL,PERIOD_M15,MODE_LOW,70,1)];   //160bar的最低價
 M15lowest160bar=Low[iLowest(NULL,PERIOD_M15,MODE_LOW,160,1)];   //640bar的最低價
//++++++++++++  M30  ++++++++++++++++++++++++++++++++++++++++++++++  
 //將m30的68-bar的均線值及開收高低存於陣列中
 
  double ma05_30_buffer[68],ma08_30_buffer[68], ma12_30_buffer[68],ma45_30_buffer[68], ma90_30_buffer[68] ,ma180_30_buffer[68] , ma360_30_buffer[68] , ma650_30_buffer[68];
  double open_30_buffer[68], close_30_buffer[68] ,high_30_buffer[68] , low_30_buffer[68] , time_30_buffer[68] ,volume_30_buffer[68];
  double k1_30_buffer[68],d1_30_buffer[68],k2_30_buffer[68],d2_30_buffer[68],k3_30_buffer[68],d3_30_buffer[68];
  double macdmainline_30_buffer[68],macdsignalline_30_buffer[68];
 
  int    b_30,bar68_30=ArraySize(ma05_30_buffer);
  ArraySetAsSeries(ma05_30_buffer,true);
  for(b_30=0; b_30<bar68_30 ; b_30++)
    ma05_30_buffer[b_30]=iMA(NULL,PERIOD_M30,5,0,MODE_SMA,PRICE_CLOSE,b_30);
  for(b_30=0; b_30<bar68_30 ; b_30++)
    ma08_30_buffer[b_30]=iMA(NULL,PERIOD_M30,8,0,MODE_SMA,PRICE_CLOSE,b_30);
  for(b_30=0; b_30<bar68_30 ; b_30++)
    ma12_30_buffer[b_30]=iMA(NULL,PERIOD_M30,12,0,MODE_SMA,PRICE_CLOSE,b_30);
  for(b_30=0; b_30<bar68_30 ; b_30++)
    ma45_30_buffer[b_30]=iMA(NULL,PERIOD_M30,45,0,MODE_SMA,PRICE_CLOSE,b_30);
  for(b_30=0; b_30<bar68_30 ; b_30++)
    ma90_30_buffer[b_30]=iMA(NULL,PERIOD_M30,90,0,MODE_SMA,PRICE_CLOSE,b_30);
  for(b_30=0; b_30<bar68_30 ; b_30++)
    ma180_30_buffer[b_30]=iMA(NULL,PERIOD_M30,180,0,MODE_SMA,PRICE_CLOSE,b_30);
  for(b_30=0; b_30<bar68_30 ; b_30++)
    ma360_30_buffer[b_30]=iMA(NULL,PERIOD_M30,360,0,MODE_SMA,PRICE_CLOSE,b_30);
  for(b_30=0; b_30<bar68_30 ; b_30++)
    ma650_30_buffer[b_30]=iMA(NULL,PERIOD_M30,650,0,MODE_SMA,PRICE_CLOSE,b_30);
  for(b_30=0; b_30<bar68_30 ; b_30++)
    open_30_buffer[b_30]=iOpen(NULL,PERIOD_M30,b_30);
  for(b_30=0; b_30<bar68_30 ; b_30++)
    close_30_buffer[b_30]=iClose(NULL,PERIOD_M30,b_30);
  for(b_30=0; b_30<bar68_30 ; b_30++)
    high_30_buffer[b_30]=iHigh(NULL,PERIOD_M30,b_30);
  for(b_30=0; b_30<bar68_30 ; b_30++)
    low_30_buffer[b_30]=iLow(NULL,PERIOD_M30,b_30);
//for m30-kd1,kd2,kd3
  for(b_30=0; b_30<bar68_30 ; b_30++)
    k1_30_buffer[b_30]=iStochastic(NULL,PERIOD_M30,10,3,3,MODE_SMA,0,MODE_MAIN,b_30);
  for(b_30=0; b_30<bar68_30 ; b_30++)
    d1_30_buffer[b_30]=iStochastic(NULL,PERIOD_M30,10,3,3,MODE_SMA,0,MODE_SIGNAL,b_30);
  for(b_30=0; b_30<bar68_30 ; b_30++)
    k2_30_buffer[b_30]=iStochastic(NULL,PERIOD_M30,15,6,6,MODE_SMA,0,MODE_MAIN,b_30);
  for(b_30=0; b_30<bar68_30 ; b_30++)
    d2_30_buffer[b_30]=iStochastic(NULL,PERIOD_M30,15,6,6,MODE_SMA,0,MODE_SIGNAL,b_30);
  for(b_30=0; b_30<bar68_30 ; b_30++)
    k3_30_buffer[b_30]=iStochastic(NULL,PERIOD_M30,12,8,8,MODE_SMA,0,MODE_MAIN,b_30);
  for(b_30=0; b_30<bar68_30 ; b_30++)
    d3_30_buffer[b_30]=iStochastic(NULL,PERIOD_M30,12,8,8,MODE_SMA,0,MODE_SIGNAL,b_30);
  for(b_30=0; b_30<bar68_30 ; b_30++)
    volume_30_buffer[b_30]=iVolume(NULL,PERIOD_H1,b_30);

 //for macd
  for(b_30=0; b_30<bar68_30 ; b_30++)
    macdmainline_30_buffer[b_30]=iMACD(NULL,PERIOD_M30,12,26,9,PRICE_CLOSE,MODE_MAIN,b_30);
  for(b_30=0; b_30<bar68_30 ; b_30++)
    macdsignalline_30_buffer[b_30]=iMACD(NULL,PERIOD_M30,12,26,9,PRICE_CLOSE,MODE_SIGNAL,b_30);
 
 //記錄16-bar 及17-32-bar之最高最低價
 double M30highest16bar;
 double M30highest40bar;
 double M30lowest16bar;
 double M30lowest40bar;
 double M30highest16bartime;
 double M30highest40bartime;
 double M30lowest16bartime;
 double M30lowest40bartime;
 
 M30highest16bar=High[iHighest(NULL,PERIOD_M30,MODE_HIGH,16,1)];   //16bar的最高價
 M30highest40bar=High[iHighest(NULL,PERIOD_M30,MODE_HIGH,40,1)];   //40bar的最高價
 M30highest16bartime=High[iHighest(NULL,PERIOD_M30,MODE_TIME,16,1)];   //16bar的最高價的時間
 M30highest40bartime=High[iHighest(NULL,PERIOD_M30,MODE_TIME,40,1)];  //40bar的最高價的時間

 M30lowest16bar=Low[iLowest(NULL,PERIOD_M30,MODE_LOW,16,1)];     //16bar的最低價
 M30lowest40bar=Low[iLowest(NULL,PERIOD_M30,MODE_LOW,40,1)];   //40bar的最低價
 M30lowest16bartime=Low[iLowest(NULL,PERIOD_M30,MODE_TIME,16,1)];    //16bar的最低價的時間
 M30lowest40bartime=Low[iLowest(NULL,PERIOD_M30,MODE_TIME,40,1)];    //40bar的最低價的時間  

//++++++++++++  H1  ++++++++++++++++++++++++++++++++++++++++++++++  
 //將m60的68-bar的均線值及開收高低存於陣列中
 
  double ma05_60_buffer[68],ma08_60_buffer[68], ma12_60_buffer[68],ma45_60_buffer[68], ma90_60_buffer[68] ,ma180_60_buffer[68] , ma360_60_buffer[68] , ma650_60_buffer[68];
  double open_60_buffer[68], close_60_buffer[68] ,high_60_buffer[68] , low_60_buffer[68] , time_60_buffer[68] ,volume_60_buffer[68];
  double k1_60_buffer[68],d1_60_buffer[68],k2_60_buffer[68],d2_60_buffer[68],k3_60_buffer[68],d3_60_buffer[68];
  double macdmainline_60_buffer[68],macdsignalline_60_buffer[68];

  int    b_60,bar68_60=ArraySize(ma05_60_buffer);
  ArraySetAsSeries(ma05_60_buffer,true);
  for(b_60=0; b_60<bar68_60 ; b_60++)
    ma05_60_buffer[b_60]=iMA(NULL,PERIOD_H1,5,0,MODE_SMA,PRICE_CLOSE,b_60);
  for(b_60=0; b_60<bar68_60 ; b_60++)
    ma08_60_buffer[b_60]=iMA(NULL,PERIOD_H1,8,0,MODE_SMA,PRICE_CLOSE,b_60);
  for(b_60=0; b_60<bar68_60 ; b_60++)
    ma12_60_buffer[b_60]=iMA(NULL,PERIOD_H1,12,0,MODE_SMA,PRICE_CLOSE,b_60);
  for(b_60=0; b_60<bar68_60 ; b_60++)
    ma45_60_buffer[b_60]=iMA(NULL,PERIOD_H1,45,0,MODE_SMA,PRICE_CLOSE,b_60);
  for(b_60=0; b_60<bar68_60 ; b_60++)
    ma90_60_buffer[b_60]=iMA(NULL,PERIOD_H1,90,0,MODE_SMA,PRICE_CLOSE,b_60);
  for(b_60=0; b_60<bar68_60 ; b_60++)
    ma180_60_buffer[b_60]=iMA(NULL,PERIOD_H1,180,0,MODE_SMA,PRICE_CLOSE,b_60);
  for(b_60=0; b_60<bar68_60 ; b_60++)
    ma360_60_buffer[b_60]=iMA(NULL,PERIOD_H1,360,0,MODE_SMA,PRICE_CLOSE,b_60);
  for(b_60=0; b_60<bar68_60 ; b_60++)
    ma650_60_buffer[b_60]=iMA(NULL,PERIOD_H1,650,0,MODE_SMA,PRICE_CLOSE,b_60);
  for(b_60=0; b_60<bar68_60 ; b_60++)
    open_60_buffer[b_60]=iOpen(NULL,PERIOD_H1,b_60);
  for(b_60=0; b_60<bar68_60 ; b_60++)
    close_60_buffer[b_60]=iClose(NULL,PERIOD_H1,b_60);
  for(b_60=0; b_60<bar68_60 ; b_60++)
    high_60_buffer[b_60]=iHigh(NULL,PERIOD_H1,b_60);
  for(b_60=0; b_60<bar68_60 ; b_60++)
    low_60_buffer[b_60]=iLow(NULL,PERIOD_H1,b_60);
//for m60-kd1,kd2,kd3
  for(b_60=0; b_60<bar68_60 ; b_60++)
    k1_60_buffer[b_60]=iStochastic(NULL,PERIOD_H1,10,3,3,MODE_SMA,0,MODE_MAIN,b_60);
  for(b_60=0; b_60<bar68_60 ; b_60++)
    d1_60_buffer[b_60]=iStochastic(NULL,PERIOD_H1,10,3,3,MODE_SMA,0,MODE_SIGNAL,b_60);
  for(b_60=0; b_60<bar68_60 ; b_60++)
    k2_60_buffer[b_60]=iStochastic(NULL,PERIOD_H1,15,6,6,MODE_SMA,0,MODE_MAIN,b_60);
  for(b_60=0; b_60<bar68_60 ; b_60++)
    d2_60_buffer[b_60]=iStochastic(NULL,PERIOD_H1,15,6,6,MODE_SMA,0,MODE_SIGNAL,b_60);
  for(b_60=0; b_60<bar68_60 ; b_60++)
    k3_60_buffer[b_60]=iStochastic(NULL,PERIOD_H1,12,8,8,MODE_SMA,0,MODE_MAIN,b_60);
  for(b_60=0; b_60<bar68_60 ; b_60++)
    d3_60_buffer[b_60]=iStochastic(NULL,PERIOD_H1,12,8,8,MODE_SMA,0,MODE_SIGNAL,b_60);
  for(b_60=0; b_60<bar68_60 ; b_60++)
    volume_60_buffer[b_60]=iVolume(NULL,PERIOD_H1,b_60);

 //for macd
  for(b_60=0; b_60<bar68_60 ; b_60++)
    macdmainline_60_buffer[b_60]=iMACD(NULL,PERIOD_H1,12,26,9,PRICE_CLOSE,MODE_MAIN,b_60);
  for(b_60=0; b_60<bar68_60 ; b_60++)
    macdsignalline_60_buffer[b_60]=iMACD(NULL,PERIOD_H1,12,26,9,PRICE_CLOSE,MODE_SIGNAL,b_60);

  //記錄16-bar 及17-32-bar之最高最低價
 double H1highest16bar;
 double H1highest40bar;
 double H1lowest16bar;
 double H1lowest40bar;
 double H1highest16bartime;
 double H1highest40bartime;
 double H1lowest16bartime;
 double H1lowest40bartime;
 
 H1highest16bar=High[iHighest(NULL,PERIOD_H1,MODE_HIGH,16,1)];   //16bar的最高價
 H1highest40bar=High[iHighest(NULL,PERIOD_H1,MODE_HIGH,40,1)];   //40bar的最高價
 H1highest16bartime=High[iHighest(NULL,PERIOD_H1,MODE_TIME,16,1)];   //16bar的最高價的時間
 H1highest40bartime=High[iHighest(NULL,PERIOD_H1,MODE_TIME,40,1)];  //40bar的最高價的時間

 H1lowest16bar=Low[iLowest(NULL,PERIOD_H1,MODE_LOW,16,1)];     //16bar的最低價
 H1lowest40bar=Low[iLowest(NULL,PERIOD_H1,MODE_LOW,40,1)];   //40bar的最低價
 H1lowest16bartime=Low[iLowest(NULL,PERIOD_H1,MODE_TIME,16,1)];    //16bar的最低價的時間
 H1lowest40bartime=Low[iLowest(NULL,PERIOD_H1,MODE_TIME,40,1)];    //40bar的最低價的時間  

//++++++++++++  H4  ++++++++++++++++++++++++++++++++++++++++++++++  
 //將H4的68-bar的均線值及開收高低存於陣列中
 
  double ma05_240_buffer[68],ma08_240_buffer[68], ma12_240_buffer[68],ma45_240_buffer[68], ma90_240_buffer[68] ,ma180_240_buffer[68] , ma360_240_buffer[68] , ma650_240_buffer[68];
  double open_240_buffer[68], close_240_buffer[68] ,high_240_buffer[68] , low_240_buffer[68] , time_240_buffer[68] ,volume_240_buffer[68];
  double k1_240_buffer[68],d1_240_buffer[68],k2_240_buffer[68],d2_240_buffer[68],k3_240_buffer[68],d3_240_buffer[68];
  double macdmainline_240_buffer[68],macdsignalline_240_buffer[68];

  int b_240,bar68_240=ArraySize(ma05_240_buffer);
  ArraySetAsSeries(ma05_240_buffer,true);
  for(b_240=0; b_240<bar68_240 ; b_240++)
    ma05_240_buffer[b_240]=iMA(NULL,PERIOD_H4,5,0,MODE_SMA,PRICE_CLOSE,b_240);
  for(b_240=0; b_240<bar68_240 ; b_240++)
    ma08_240_buffer[b_240]=iMA(NULL,PERIOD_H4,8,0,MODE_SMA,PRICE_CLOSE,b_240);
  for(b_240=0; b_240<bar68_240 ; b_240++)
    ma12_240_buffer[b_240]=iMA(NULL,PERIOD_H4,12,0,MODE_SMA,PRICE_CLOSE,b_240);
  for(b_240=0; b_240<bar68_240 ; b_240++)
    ma45_240_buffer[b_240]=iMA(NULL,PERIOD_H4,45,0,MODE_SMA,PRICE_CLOSE,b_240);
  for(b_240=0; b_240<bar68_240 ; b_240++)
    ma90_240_buffer[b_240]=iMA(NULL,PERIOD_H4,90,0,MODE_SMA,PRICE_CLOSE,b_240);
  for(b_240=0; b_240<bar68_240 ; b_240++)
    ma180_240_buffer[b_240]=iMA(NULL,PERIOD_H4,180,0,MODE_SMA,PRICE_CLOSE,b_240);
  for(b_240=0; b_240<bar68_240 ; b_240++)
    ma360_240_buffer[b_240]=iMA(NULL,PERIOD_H4,360,0,MODE_SMA,PRICE_CLOSE,b_240);
  for(b_240=0; b_240<bar68_240 ; b_240++)
    ma650_240_buffer[b_240]=iMA(NULL,PERIOD_H4,650,0,MODE_SMA,PRICE_CLOSE,b_240);
  for(b_240=0; b_240<bar68_240 ; b_240++)
    open_240_buffer[b_240]=iOpen(NULL,PERIOD_H4,b_240);
  for(b_240=0; b_240<bar68_240 ; b_240++)
    close_240_buffer[b_240]=iClose(NULL,PERIOD_H4,b_240);
  for(b_240=0; b_240<bar68_240 ; b_240++)
    high_240_buffer[b_240]=iHigh(NULL,PERIOD_H4,b_240);
  for(b_240=0; b_240<bar68_240 ; b_240++)
    low_240_buffer[b_240]=iLow(NULL,PERIOD_H4,b_240);
  for(b_240=0; b_240<bar68_240 ; b_240++)
    volume_240_buffer[b_240]=iVolume(NULL,PERIOD_H4,b_240);
//for m60-kd1,kd2,kd3
  for(b_240=0; b_240<bar68_240 ; b_240++)
    k1_240_buffer[b_240]=iStochastic(NULL,PERIOD_H4,10,3,3,MODE_SMA,0,MODE_MAIN,b_240);
  for(b_240=0; b_240<bar68_240 ; b_240++)
    d1_240_buffer[b_240]=iStochastic(NULL,PERIOD_H4,10,3,3,MODE_SMA,0,MODE_SIGNAL,b_240);
  for(b_240=0; b_240<bar68_240 ; b_240++)
    k2_240_buffer[b_240]=iStochastic(NULL,PERIOD_H4,15,6,6,MODE_SMA,0,MODE_MAIN,b_240);
  for(b_240=0; b_240<bar68_240 ; b_240++)
    d2_240_buffer[b_240]=iStochastic(NULL,PERIOD_H4,15,6,6,MODE_SMA,0,MODE_SIGNAL,b_240);
  for(b_240=0; b_240<bar68_240 ; b_240++)
    k3_240_buffer[b_240]=iStochastic(NULL,PERIOD_H4,12,8,8,MODE_SMA,0,MODE_MAIN,b_240);
  for(b_240=0; b_240<bar68_240 ; b_240++)
    d3_240_buffer[b_240]=iStochastic(NULL,PERIOD_H4,12,8,8,MODE_SMA,0,MODE_SIGNAL,b_240);
 //for macd
  for(b_240=0; b_240<bar68_240 ; b_240++)
    macdmainline_240_buffer[b_240]=iMACD(NULL,PERIOD_H4,12,26,9,PRICE_CLOSE,MODE_MAIN,b_240);
  for(b_240=0; b_240<bar68_240 ; b_240++)
    macdsignalline_240_buffer[b_240]=iMACD(NULL,PERIOD_H4,12,26,9,PRICE_CLOSE,MODE_SIGNAL,b_240);
 
 double H4highest16bar;
 double H4highest40bar;
 double H4lowest16bar;
 double H4lowest40bar;
 double H4highest16bartime;
 double H4highest40bartime;
 double H4lowest16bartime;
 double H4lowest40bartime;
 
 //記錄16-bar 及17-32-bar之最高最低價
 H4highest16bar=High[iHighest(NULL,PERIOD_H4,MODE_HIGH,16,1)];   //16bar的最高價
 H4highest40bar=High[iHighest(NULL,PERIOD_H4,MODE_HIGH,40,1)];   //40bar的最高價
 H4highest16bartime=High[iHighest(NULL,PERIOD_H4,MODE_TIME,16,1)];   //16bar的最高價的時間
 H4highest40bartime=High[iHighest(NULL,PERIOD_H4,MODE_TIME,40,1)];  //40bar的最高價的時間

 H4lowest16bar=Low[iLowest(NULL,PERIOD_H4,MODE_LOW,16,1)];     //16bar的最低價
 H4lowest40bar=Low[iLowest(NULL,PERIOD_H4,MODE_LOW,40,1)];   //40bar的最低價
 H4lowest16bartime=Low[iLowest(NULL,PERIOD_H4,MODE_TIME,16,1)];    //16bar的最低價的時間
 H4lowest40bartime=Low[iLowest(NULL,PERIOD_H4,MODE_TIME,40,1)];    //40bar的最低價的時間  
 
 //**************************************************************************************************************

RefreshRates();

 

 //*********************************************************

 int      ticket;
 double   lots=0.1;
 int      total=OrdersTotal();
 datetime otm=OrderOpenTime();
//*********************************************************

//**********************************************************************
 double price=ObjectGetValueByShift("trendline 24048",0);
 double price1=ObjectGetValueByShift("trendline 24048",30);
// Alert (price,"   b= ",price1);
 double val;
 double val1;
 val=High[iHighest(NULL,0,MODE_HIGH,16,0)];

 val1=Low[iLowest(NULL,0,MODE_LOW,16,0)];
// Alert (val,"   low..",val1);  
datetime some_time=D'2008.01.20 06:00:25';
int shift=iBarShift("EUROUSD",PERIOD_M5,some_time);
//Alert("shift= ",shift);

int buyorder4,sellorder4;
int  AccumulationBuffer;
 
NormalizeDouble(ma45_30_buffer[1],4);
NormalizeDouble(ma45_30_buffer[2],4);
NormalizeDouble(ma45_30_buffer[3],4);
double cnt,trade,order_id,orderclosetime;
//trade=1;
   for (cnt=0;cnt<OrdersTotal();cnt++)
     {
       OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES);
     } 

        
  if (OrdersTotal()>0)
   {
   for (cnt=0;cnt<OrdersTotal();cnt++)
     {
       OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES);
 
 //**************************   oders modify  ***************************************************************88
 //**************************   oders modify  ***************************************************************88
                            //任一筆
//           if    (OrderType()==OP_BUY && (OrderMagicNumber( )==8801 || OrderMagicNumber( )==88011) &&
      //     if    (OrderType()==OP_BUY && //OrderMagicNumber( )!=8806 &&
      //            high_05_buffer[0]-OrderOpenPrice()>=0.01000 && high_05_buffer[0]-OrderOpenPrice()<=0.01010) 
                             //stoploss=OrderOpenPrice()+40*Point可以賺4點
     //             OrderModify(OrderTicket(),Ask,OrderOpenPrice()+600*Point,OrderTakeProfit(),0,Blue);
//           if    (OrderType()==OP_BUY && (OrderMagicNumber( )==8801 || OrderMagicNumber( )==88011) &&
     //      if    (OrderType()==OP_BUY && //OrderMagicNumber( )!=8806 &&
     //             high_05_buffer[0]-OrderOpenPrice()>=0.00700 && high_05_buffer[0]-OrderOpenPrice()<=0.00710) 
                             //stoploss=OrderOpenPrice()+40*Point可以賺4點
      //            OrderModify(OrderTicket(),Ask,OrderOpenPrice()+300*Point,OrderTakeProfit(),0,Blue);
 //          if    (OrderType()==OP_BUY && (OrderMagicNumber( )==8801 || OrderMagicNumber( )==88011) &&
      //     if    (OrderType()==OP_BUY && //OrderMagicNumber( )!=8806 &&
      //            high_05_buffer[0]-OrderOpenPrice()>=0.00300 && high_05_buffer[0]-OrderOpenPrice()<=0.00310) 
                             //stoploss=OrderOpenPrice()+40*Point可以賺4點
       //           OrderModify(OrderTicket(),Ask,OrderOpenPrice()+30*Point,OrderTakeProfit(),0,Blue);
                                                   //44011為反向單以安全為原則       
//           if    (OrderType()==OP_BUY && (OrderMagicNumber( )==8807 || OrderMagicNumber( )==8806) &&
           if    (OrderType()==OP_BUY &&// OrderMagicNumber( )==8806 &&
                  high_05_buffer[0]-OrderOpenPrice()>=0.00500 && high_05_buffer[0]-OrderOpenPrice()<=0.00510) 
                             //stoploss=OrderOpenPrice()+40*Point可以賺4點
                  OrderModify(OrderTicket(),Ask,OrderOpenPrice()+80*Point,OrderTakeProfit(),0,Blue);
  
          if    (OrderType()==OP_BUY && (OrderMagicNumber( )!=8807 || OrderMagicNumber( )!=8809) &&  //       if    (OrderType()==OP_BUY && // OrderMagicNumber( )==8806 &&
                 high_05_buffer[0]-OrderOpenPrice()>=0.00290 && high_05_buffer[0]-OrderOpenPrice()<=0.00300) 
                             //stoploss=OrderOpenPrice()-40*Point虧3點
                 OrderModify(OrderTicket(),Ask,OrderOpenPrice()-150*Point,OrderTakeProfit(),0,Blue);

//          if    (OrderType()==OP_BUY && (OrderMagicNumber( )==8807 || OrderMagicNumber( )==8806) &&
  //        if    (OrderType()==OP_BUY && // OrderMagicNumber( )==8806 &&
   //              high_05_buffer[0]-OrderOpenPrice()>=0.00130 && high_05_buffer[0]-OrderOpenPrice()<=0.00140) 
                             //stoploss=OrderOpenPrice()-40*Point虧3點
   //              OrderModify(OrderTicket(),Ask,OrderOpenPrice()-150*Point,OrderTakeProfit(),0,Blue);
//**********************************************************************************************************
//           if    (OrderType()==OP_SELL && (OrderMagicNumber( )==4401 || OrderMagicNumber( )==44011) &&
       //    if    (OrderType()==OP_SELL &&// OrderMagicNumber( )!=4406 &&
       //           low_05_buffer[0]-OrderOpenPrice()<=-0.01000 && low_05_buffer[0]-OrderOpenPrice()>=-0.01010) 
       //           OrderModify(OrderTicket(),Bid,OrderOpenPrice()-600*Point,OrderTakeProfit(),0,Blue);
//           if    (OrderType()==OP_SELL && (OrderMagicNumber( )==4401 || OrderMagicNumber( )==44011) &&
       //    if    (OrderType()==OP_SELL && //OrderMagicNumber( )!=4406 &&
       //           low_05_buffer[0]-OrderOpenPrice()<=-0.00700 && low_05_buffer[0]-OrderOpenPrice()>=-0.00710) 
       //           OrderModify(OrderTicket(),Bid,OrderOpenPrice()-300*Point,OrderTakeProfit(),0,Blue);
//           if    (OrderType()==OP_SELL && (OrderMagicNumber( )==4401 || OrderMagicNumber( )==44011) &&
      //     if    (OrderType()==OP_SELL && //OrderMagicNumber( )!=4406 &&
      //            low_05_buffer[0]-OrderOpenPrice()<=-0.00300 && low_05_buffer[0]-OrderOpenPrice()>=-0.00310) 
       //           OrderModify(OrderTicket(),Bid,OrderOpenPrice()-30*Point,OrderTakeProfit(),0,Blue);
                                                  //44011為反向單以安全為原則
 //          if    (OrderType()==OP_SELL && (OrderMagicNumber( )==4407 || OrderMagicNumber( )==4406) &&
           if    (OrderType()==OP_SELL && //OrderMagicNumber( )==4406 &&
                  low_05_buffer[0]-OrderOpenPrice()<=-0.00500 && low_05_buffer[0]-OrderOpenPrice()>=-0.00510) 
                  OrderModify(OrderTicket(),Bid,OrderOpenPrice()-80*Point,OrderTakeProfit(),0,Blue);
                                                 //44011為反向單以安全為原則 
            if    (OrderType()==OP_SELL && (OrderMagicNumber( )!=4407 || OrderMagicNumber( )!=4409) &&
     //     if    (OrderType()==OP_SELL && // OrderMagicNumber( )==4406 &&
                  low_05_buffer[0]-OrderOpenPrice()<=-0.00290 && low_05_buffer[0]-OrderOpenPrice()>=-0.00300) 
                 OrderModify(OrderTicket(),Bid,OrderOpenPrice()+150*Point,OrderTakeProfit(),0,Blue);
         
 //         if    (OrderType()==OP_SELL && // OrderMagicNumber( )==4406 &&
//                 low_05_buffer[0]-OrderOpenPrice()<=-0.00130 && low_05_buffer[0]-OrderOpenPrice()>=-0.00140) 
//                 OrderModify(OrderTicket(),Bid,OrderOpenPrice()+150*Point,OrderTakeProfit(),0,Blue);
      
//**************************   oders close  ***************************************************************88
//close單時如果買賣放錯位置將會一直多筆close 開單就close 
//**************************   oders close  ***************************************************************88
 
//本段已有作用                          加上此列一次會下3張單
 //          if    (OrderType()==OP_BUY && OrderMagicNumber( )==8806 && //)  || OrderMagicNumber( )==4402) &&
//          if    (OrderType()==OP_BUY && (OrderMagicNumber( )==8808 || OrderMagicNumber( )==8807 || OrderMagicNumber( )==8806) &&
//                  TimeCurrent()- OrderOpenTime()>=2000 &&  TimeCurrent()- OrderOpenTime()<=7500 && 
//                  close_15_buffer[0]-open_15_buffer[0]<=-0.00030 && close_15_buffer[1]-open_15_buffer[1]<=-0.00030)
//                  OrderClose(OrderTicket(),lots,Bid,1,Gold); 
//              if  (TimeCurrent()- OrderOpenTime()>=700 && TimeCurrent()- OrderOpenTime()<=2000 &&
//                  (close_05_buffer[1]-OrderOpenPrice()<=0.00050 && close_05_buffer[2]-OrderOpenPrice()<=0.00050) || 
                          //[0]的判斷避免反轉
//                  (close_05_buffer[0]-OrderOpenPrice()<=0.00050)) 
//                   OrderClose(OrderTicket(),lots,Bid,1,Gold);    
                                  //不判斷反向所下單
//           if    (OrderType()==OP_BUY && (OrderMagicNumber( )==8808 || OrderMagicNumber( )==8807))
       //     if    (OrderType()==OP_BUY && OrderMagicNumber( )==8801) // || OrderMagicNumber( )==88011))
                                //單位為秒,約1.5小型
       //       if  (TimeCurrent()- OrderOpenTime()>=7000 &&// TimeCurrent()- OrderOpenTime()<=5000 &&
       //           (close_15_buffer[1]-OrderOpenPrice()<=0.00050 && close_15_buffer[2]-OrderOpenPrice()<=0.00050))
                          //[0]的判斷避免反轉
 //                 (close_15_buffer[0]-OrderOpenPrice()<=0.00010)) 
        //          OrderClose(OrderTicket(),lots,Bid,1,Gold);  
                  
//            if   (TimeCurrent()- OrderOpenTime()>=1000 &&  TimeCurrent()- OrderOpenTime()<=1800 && 
//                 (close_15_buffer[0]-open_15_buffer[0]<=-0.00030)||(close_15_buffer[1]-open_15_buffer[1]<=-0.00030))
//                  OrderClose(OrderTicket(),lots,Bid,1,Gold); 
       
 //   }

 // Comment("bbbbbbbbbbb   =",TimeCurrent()- OrderOpenTime());
//if  (OrdersTotal()<2) 
                                                                
  //   if   (OrdersTotal()>0 && OrderMagicNumber()==44011) 
  //     return;
  //     else
  //     OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+300*Point,Bid-19000*Point,"My order #LS11",44011,0,Blue);
   
                       
//*****************************************************************************************************
                        // 加上此列一次會下3張單
 //           if    (OrderType()==OP_SELL &&  OrderMagicNumber( )==4406 && //) || OrderMagicNumber( )==4402) &&
//             if    (OrderType()==OP_SELL && (OrderMagicNumber( )==4408 || OrderMagicNumber( )==4407 || OrderMagicNumber( )==4406) &&
//                  TimeCurrent()- OrderOpenTime()>=2000 &&  TimeCurrent()- OrderOpenTime()<=7500 && 
//                   close_15_buffer[0]-open_15_buffer[0]>=0.00030 && close_15_buffer[1]-open_15_buffer[1]>=0.00030)
//                   OrderClose(OrderTicket(),lots,Ask,1,Gold);   


//              if  (TimeCurrent()- OrderOpenTime()>=700 && TimeCurrent()- OrderOpenTime()<=2000 &&
//                  (close_05_buffer[1]-OrderOpenPrice()>=-0.00050 && close_05_buffer[2]-OrderOpenPrice()>=-0.00050) ||
                          //[0]的判斷避免反轉
//                  (close_05_buffer[0]-OrderOpenPrice()>=-0.00050))
//                   OrderClose(OrderTicket(),lots,Ask,1,Gold);    
                                 //不判斷反向所下單
//            if    (OrderType()==OP_SELL && (OrderMagicNumber( )==4408 || OrderMagicNumber( )==4407))
     //       if    (OrderType()==OP_SELL && OrderMagicNumber( )==4401)// || OrderMagicNumber( )==44011))
//                                //單位為秒,約半小型
     //         if (TimeCurrent()- OrderOpenTime()>=7000 && //TimeCurrent()- OrderOpenTime()<=5000 &&
     //            (close_15_buffer[1]-OrderOpenPrice()>=-0.00050 && close_15_buffer[2]-OrderOpenPrice()>=-0.00050))
                           //[0]的判斷避免反轉
//                 (close_15_buffer[0]-OrderOpenPrice()>=-0.00010)) 
      //            OrderClose(OrderTicket(),lots,Ask,1,Gold);   
                 
//            if   (TimeCurrent()- OrderOpenTime()>=1000 &&  TimeCurrent()- OrderOpenTime()<=1800 && 
//                 (close_15_buffer[0]-open_15_buffer[0]>=0.00030)||(close_15_buffer[1]-open_15_buffer[1]>=0.00030))
//                  OrderClose(OrderTicket(),lots,Ask,1,Gold);   
             
//  Comment("sssssssssssssss   =",TimeCurrent()- OrderOpenTime());
  
//if  (OrdersTotal()<2) 
                                                                        
  //  if ( OrdersTotal()>0 && OrderMagicNumber() == 88011)  
  //    return;
  //    else
  //    OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-300*Point,Ask+19000*Point,"My order #LB11",88011,0,Yellow );
   
//**************************************************************************************************** 
//為免長短單衝突重覆close ,開單後1800秒內不交易 
 if (TimeCurrent()- OrderOpenTime()>=0 && TimeCurrent()- OrderOpenTime()<=1800)
 return;
 else
 
//***************************************************************************************************8 
  //**************************   oders close  ***************************************************************88
  //**************************   oders close  ***************************************************************88
 //*** close Buy  1  ***************************************************************************************** 
 
  if    (OrderType()==OP_BUY)
   {
//    if  ( OrdersTotal()>0 && OrderMagicNumber()==4401) 
      if  ( OrdersTotal()>0 && OrderMagicNumber()!=4410) 
          
 // m15 k1,k2,k3皆下降,且在50上,[1]收紅 [2]收黑 SELL
      if  ((k1_15_buffer[1]-k1_15_buffer[2]<=-3 &&  k2_15_buffer[1]-k2_15_buffer[2]<=-1 && k3_15_buffer[1]-k3_15_buffer[2]<=0 &&
            k1_15_buffer[1]>=50 &&   k2_15_buffer[1]>=50 && k3_15_buffer[1]>=50)) 
          if  (k1_05_buffer[1]-d1_05_buffer[1]<=-3 &&   k1_05_buffer[1]>=50)                               
     
   
 //H1,H4 kd值差全部>10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]>=10 && k3_60_buffer[1]-d3_60_buffer[2]>=10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]>=10 && k3_240_buffer[1]-d3_240_buffer[2]>=10) ||
 
 //H1,H4 k2,k3在低點,或H4 k1,k,k3在低點
                    (k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
                    (k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
 
 //H4 ma05 上升,macd在1150外,收盤離ma05稍有距離或kd1,kd2,kd3有開口且向上
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]>=7 && k2_240_buffer[1]-d2_240_buffer[1]>=7 && k3_240_buffer[1]-d3_240_buffer[2]>=7 &&
                     k2_240_buffer[1]<=50 && k3_240_buffer[1]<=50))) || 
 
 //H4 ma05 上升,收盤離ma05稍有距離,k1,k2,k3向上
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]>=1 && k2_240_buffer[1]-k2_240_buffer[2]>=1 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                     k1_240_buffer[1]<=70) || 

 //H4 ma05 上升,收盤離ma05稍有距離,kd1向上,k2或k3 向上
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=6 && (k2_240_buffer[1]-k2_240_buffer[2]>=1 || k3_240_buffer[1]-k3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=70) || 
                                     
 //H4 ma05 下降趨緩 ([1]-[2])-([2]-[3])>=0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])>=0.00030) ||

 //H1,H4 kd1,2,3值差全部>1
                    (k1_60_buffer[1]-d1_60_buffer[1]>=1 && k2_60_buffer[1]-d2_60_buffer[1]>=1 && k3_60_buffer[1]-d3_60_buffer[2]>=1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=1 && (k2_240_buffer[1]-d2_240_buffer[1]>=1 || k3_240_buffer[1]-d3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=60) ||
       
 //H1 kd2,kd3值差>16 或加總>35
                    (k2_60_buffer[1]-d2_60_buffer[1]>=16 && k3_60_buffer[1]-d3_60_buffer[2]>=16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])>=35) ||
       
 //H4 角度折反 k1在35下
                    (k1_240_buffer[1]-k1_240_buffer[2]>=4 &&  k1_240_buffer[2]-k1_240_buffer[3]<=-4 && k1_240_buffer[1]<=35) ||
          
 //H4 k1,k2,k3在80上,kd1,kd2,kd3都還向上開口 
                    (k1_240_buffer[1]-d1_240_buffer[1]>=3 &&  k2_240_buffer[1]-d2_240_buffer[1]>=3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]>=3 &&  k1_240_buffer[1]>=80 &&  k2_240_buffer[1]>=80 &&  k3_240_buffer[1]>=80) ||

 //m60 k1,k2,k3在80上,kd1,kd2,kd3都還向上開口 
                    (k1_60_buffer[1]-d1_60_buffer[1]>=3 &&  k2_60_buffer[1]-d2_60_buffer[1]>=3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]>=3 &&  k1_60_buffer[1]>=80 &&  k2_60_buffer[1]>=80 &&  k3_60_buffer[1]>=80) ||

 //H4 ma05[1],ma12[1]差距大於28點 ,開口漸大([1]-[2])>=10點([2]-[3])>=8點
                    (ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])>=0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])>=0.00050)) ||      
               
 //H4 k1呈水平狀但k2,k3仍大幅往上 或macd開口尚大               
                   (k1_240_buffer[1]-k1_240_buffer[2]<=3 && k1_240_buffer[1]-k1_240_buffer[2]>=-3 &&
                  ((k2_240_buffer[1]-k2_240_buffer[2]>=6 && k3_240_buffer[1]-k3_240_buffer[2]>=6) || 
                   (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001300))) ||
              
 //H1-K1,K2,K3及H4-K1  全上揚
                   (k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 &&
                    k3_60_buffer[1]-k3_60_buffer[2]>=0 && k1_240_buffer[1]-k1_240_buffer[2]>=0) ||

 //H4 MACD在範圍外
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001800 ||
                     macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001800) ||

 //H4  k1大幅向上 [1]或[2]須有一為正
                 (((k1_240_buffer[1]-k1_240_buffer[2])-(k1_240_buffer[2]-k1_240_buffer[3])>=3) && (close_240_buffer[1]-open_240_buffer[1]>=0.00030 || close_240_buffer[2]-open_240_buffer[2]>=0.00030)) ||
                   (k1_240_buffer[1]-k1_240_buffer[2]>=12 && (close_240_buffer[1]-open_240_buffer[1]>=0.00030 || close_240_buffer[2]-open_240_buffer[2]>=0.00030)))
                    return;
                    else
                    OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 

//*** close Buy  2  ***************************************************************************************** 
//    if  ( OrdersTotal()>0 && OrderMagicNumber()==4402) 
      if  ( OrdersTotal()>0 && OrderMagicNumber()!=4410) 

 //    m5 k1,k2,k3皆下降,且在50上,[1]收紅 [2]收黑 SELL
      if  ((k1_30_buffer[1]-k1_30_buffer[2]<=-3 &&  k2_30_buffer[1]-k2_30_buffer[2]<=-1 && k3_30_buffer[1]-k3_30_buffer[2]<=0 &&
            k1_30_buffer[1]>=70 &&   k2_30_buffer[1]>=75 && k3_30_buffer[1]>=75)||
           (k1_60_buffer[1]-k1_60_buffer[2]<=-3 &&  k2_60_buffer[1]-k2_60_buffer[2]<=-1 && k3_60_buffer[1]-k3_60_buffer[2]<=0 &&
            k1_60_buffer[1]>=70 &&   k2_60_buffer[1]>=75 && k3_60_buffer[1]>=75)) 
          if  (k1_05_buffer[1]-d1_05_buffer[1]<=-3 &&   k1_05_buffer[1]>=50)                               
     
   
 //H1,H4 kd值差全部>10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]>=10 && k3_60_buffer[1]-d3_60_buffer[2]>=10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]>=10 && k3_240_buffer[1]-d3_240_buffer[2]>=10) ||
 
 //H1,H4 k2,k3在低點,或H4 k1,k,k3在低點
                    (k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
                    (k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
 
 //H4 ma05 上升,macd在1150外,收盤離ma05稍有距離或kd1,kd2,kd3有開口且向上
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]>=7 && k2_240_buffer[1]-d2_240_buffer[1]>=7 && k3_240_buffer[1]-d3_240_buffer[2]>=7 &&
                     k2_240_buffer[1]<=50 && k3_240_buffer[1]<=50))) || 
 
 //H4 ma05 上升,收盤離ma05稍有距離,k1,k2,k3向上
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]>=1 && k2_240_buffer[1]-k2_240_buffer[2]>=1 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                     k1_240_buffer[1]<=70) || 

 //H4 ma05 上升,收盤離ma05稍有距離,kd1向上,k2或k3 向上
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=6 && (k2_240_buffer[1]-k2_240_buffer[2]>=1 || k3_240_buffer[1]-k3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=70) || 
                                     
 //H4 ma05 下降趨緩 ([1]-[2])-([2]-[3])>=0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])>=0.00030) ||

//H1,H4 kd1,2,3值差全部>1
                    (k1_60_buffer[1]-d1_60_buffer[1]>=1 && k2_60_buffer[1]-d2_60_buffer[1]>=1 && k3_60_buffer[1]-d3_60_buffer[2]>=1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=1 && (k2_240_buffer[1]-d2_240_buffer[1]>=1 || k3_240_buffer[1]-d3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=60) ||
       
 //H1 kd2,kd3值差>16 或加總>35
                    (k2_60_buffer[1]-d2_60_buffer[1]>=16 && k3_60_buffer[1]-d3_60_buffer[2]>=16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])>=35) ||
       
 //H4 角度折反 k1在35下
                    (k1_240_buffer[1]-k1_240_buffer[2]>=4 &&  k1_240_buffer[2]-k1_240_buffer[3]<=-4 && k1_240_buffer[1]<=35) ||
          
 //H4 k1,k2,k3在80上,kd1,kd2,kd3都還向上開口 
                    (k1_240_buffer[1]-d1_240_buffer[1]>=3 &&  k2_240_buffer[1]-d2_240_buffer[1]>=3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]>=3 &&  k1_240_buffer[1]>=80 &&  k2_240_buffer[1]>=80 &&  k3_240_buffer[1]>=80) ||
 
 //m60 k1,k2,k3在80上,kd1,kd2,kd3都還向上開口 
                    (k1_60_buffer[1]-d1_60_buffer[1]>=3 &&  k2_60_buffer[1]-d2_60_buffer[1]>=3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]>=3 &&  k1_60_buffer[1]>=80 &&  k2_60_buffer[1]>=80 &&  k3_60_buffer[1]>=80) ||

 //H4 ma05[1],ma12[1]差距大於28點 ,開口漸大([1]-[2])>=10點([2]-[3])>=8點
                    (ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])>=0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])>=0.00050)) ||      
               
 //H4 k1呈水平狀但k2,k3仍大幅往上 或macd開口尚大               
                   (k1_240_buffer[1]-k1_240_buffer[2]<=3 && k1_240_buffer[1]-k1_240_buffer[2]>=-3 &&
                  ((k2_240_buffer[1]-k2_240_buffer[2]>=6 && k3_240_buffer[1]-k3_240_buffer[2]>=6) || 
                   (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001300))) ||
              
 //H1-K1,K2,K3及H4-K1  全上揚
                   (k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 &&
                    k3_60_buffer[1]-k3_60_buffer[2]>=0 && k1_240_buffer[1]-k1_240_buffer[2]>=0) ||

 //H4 MACD在範圍外
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001800 ||
                     macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001800) ||

 //H4  k1大幅向上 [1]或[2]須有一為正
                 (((k1_240_buffer[1]-k1_240_buffer[2])-(k1_240_buffer[2]-k1_240_buffer[3])>=3) && (close_240_buffer[1]-open_240_buffer[1]>=0.00030 || close_240_buffer[2]-open_240_buffer[2]>=0.00030)) ||
                   (k1_240_buffer[1]-k1_240_buffer[2]>=12 && (close_240_buffer[1]-open_240_buffer[1]>=0.00030 || close_240_buffer[2]-open_240_buffer[2]>=0.00030)))
                    return;
                    else
                    OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 
//*** close Buy  3  ***************************************************************************************** 
 
//    if ( OrdersTotal()>0 && OrderMagicNumber() == 4403 ) 
      if  ( OrdersTotal()>0 && OrderMagicNumber()!=4410) 

      if  ((k1_15_buffer[1]-k1_15_buffer[2]<=-6 &&  k1_15_buffer[1]>=75 &&
 // m240須在70上
            k1_15_buffer[1]-d1_15_buffer[1]<=-4 &&  k1_240_buffer[1]>=70 &&
            close_15_buffer[1]-close_15_buffer[2]<=-0.00010))

 //H1,H4 kd值差全部>10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]>=10 && k3_60_buffer[1]-d3_60_buffer[2]>=10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]>=10 && k3_240_buffer[1]-d3_240_buffer[2]>=10) ||
 
 //H1,H4 k2,k3在低點,或H4 k1,k,k3在低點
                    (k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
                    (k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
 
 //H4 ma05 上升,macd在1150外,收盤離ma05稍有距離或kd1,kd2,kd3有開口且向上
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]>=7 && k2_240_buffer[1]-d2_240_buffer[1]>=7 && k3_240_buffer[1]-d3_240_buffer[2]>=7 &&
                     k2_240_buffer[1]<=50 && k3_240_buffer[1]<=50))) || 
 
 //H4 ma05 上升,收盤離ma05稍有距離,k1,k2,k3向上
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]>=1 && k2_240_buffer[1]-k2_240_buffer[2]>=1 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                     k1_240_buffer[1]<=70) || 

 //H4 ma05 上升,收盤離ma05稍有距離,kd1向上,k2或k3 向上
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=6 && (k2_240_buffer[1]-k2_240_buffer[2]>=1 || k3_240_buffer[1]-k3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=70) || 
                                     
 //H4 ma05 下降趨緩 ([1]-[2])-([2]-[3])>=0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])>=0.00030) ||

 //H1,H4 kd1,2,3值差全部>1
                    (k1_60_buffer[1]-d1_60_buffer[1]>=1 && k2_60_buffer[1]-d2_60_buffer[1]>=1 && k3_60_buffer[1]-d3_60_buffer[2]>=1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=1 && (k2_240_buffer[1]-d2_240_buffer[1]>=1 || k3_240_buffer[1]-d3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=60) ||
       
 //H1 kd2,kd3值差>16 或加總>35
                    (k2_60_buffer[1]-d2_60_buffer[1]>=16 && k3_60_buffer[1]-d3_60_buffer[2]>=16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])>=35) ||
       
 //H4 角度折反 k1在35下
                    (k1_240_buffer[1]-k1_240_buffer[2]>=4 &&  k1_240_buffer[2]-k1_240_buffer[3]<=-4 && k1_240_buffer[1]<=35) ||
          
 //H4 k1,k2,k3在80上,kd1,kd2,kd3都還向上開口 
                    (k1_240_buffer[1]-d1_240_buffer[1]>=3 &&  k2_240_buffer[1]-d2_240_buffer[1]>=3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]>=3 &&  k1_240_buffer[1]>=80 &&  k2_240_buffer[1]>=80 &&  k3_240_buffer[1]>=80) ||

 //m60 k1,k2,k3在80上,kd1,kd2,kd3都還向上開口 
                    (k1_60_buffer[1]-d1_60_buffer[1]>=3 &&  k2_60_buffer[1]-d2_60_buffer[1]>=3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]>=3 &&  k1_60_buffer[1]>=80 &&  k2_60_buffer[1]>=80 &&  k3_60_buffer[1]>=80) ||

 //H4 ma05[1],ma12[1]差距大於28點 ,開口漸大([1]-[2])>=10點([2]-[3])>=8點
                    (ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])>=0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])>=0.00050)) ||      
               
 //H4 k1呈水平狀但k2,k3仍大幅往上 或macd開口尚大               
                   (k1_240_buffer[1]-k1_240_buffer[2]<=3 && k1_240_buffer[1]-k1_240_buffer[2]>=-3 &&
                  ((k2_240_buffer[1]-k2_240_buffer[2]>=6 && k3_240_buffer[1]-k3_240_buffer[2]>=6) || 
                   (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001300))) ||
              
 //H1-K1,K2,K3及H4-K1  全上揚
                   (k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 &&
                    k3_60_buffer[1]-k3_60_buffer[2]>=0 && k1_240_buffer[1]-k1_240_buffer[2]>=0) ||

 //H4 MACD在範圍外
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001800 ||
                     macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001800) ||

 //H4  k1大幅向上 [1]或[2]須有一為正
                 (((k1_240_buffer[1]-k1_240_buffer[2])-(k1_240_buffer[2]-k1_240_buffer[3])>=3) && (close_240_buffer[1]-open_240_buffer[1]>=0.00030 || close_240_buffer[2]-open_240_buffer[2]>=0.00030)) ||
                   (k1_240_buffer[1]-k1_240_buffer[2]>=12 && (close_240_buffer[1]-open_240_buffer[1]>=0.00030 || close_240_buffer[2]-open_240_buffer[2]>=0.00030)))
                    return;
                    else
                    OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 

//*** close Buy  4  ***************************************************************************************** 
//    if ( OrdersTotal()>0 && OrderMagicNumber() == 4404) 
      if  ( OrdersTotal()>0 && OrderMagicNumber()!=4410) 

      if  ((k1_30_buffer[1]-k1_30_buffer[2]<=-6 &&  k1_30_buffer[1]>=75 &&
            k1_30_buffer[1]-d1_30_buffer[1]<=-4 &&
            close_30_buffer[1]-close_30_buffer[2]<=-0.00010 && close_30_buffer[1]-close_30_buffer[3]<=-0.00010) ||
           (k1_60_buffer[1]-k1_60_buffer[2]<=-6 &&  k1_60_buffer[1]>=75 &&
            k1_60_buffer[1]-d1_60_buffer[1]<=-4 &&
            close_60_buffer[1]-close_60_buffer[2]<=-0.00010 && close_60_buffer[1]-close_60_buffer[3]<=-0.00010))

 //H1,H4 kd值差全部>10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]>=10 && k3_60_buffer[1]-d3_60_buffer[2]>=10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]>=10 && k3_240_buffer[1]-d3_240_buffer[2]>=10) ||
 
 //H1,H4 k2,k3在低點,或H4 k1,k,k3在低點
                    (k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
                    (k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
 
 //H4 ma05 上升,macd在1150外,收盤離ma05稍有距離或kd1,kd2,kd3有開口且向上
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]>=7 && k2_240_buffer[1]-d2_240_buffer[1]>=7 && k3_240_buffer[1]-d3_240_buffer[2]>=7 &&
                     k2_240_buffer[1]<=50 && k3_240_buffer[1]<=50))) || 
 
 //H4 ma05 上升,收盤離ma05稍有距離,k1,k2,k3向上
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]>=1 && k2_240_buffer[1]-k2_240_buffer[2]>=1 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                     k1_240_buffer[1]<=70) || 

 //H4 ma05 上升,收盤離ma05稍有距離,kd1向上,k2或k3 向上
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=6 && (k2_240_buffer[1]-k2_240_buffer[2]>=1 || k3_240_buffer[1]-k3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=70) || 
                                     
 //H4 ma05 下降趨緩 ([1]-[2])-([2]-[3])>=0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])>=0.00030) ||

 //H1,H4 kd1,2,3值差全部>1
                    (k1_60_buffer[1]-d1_60_buffer[1]>=1 && k2_60_buffer[1]-d2_60_buffer[1]>=1 && k3_60_buffer[1]-d3_60_buffer[2]>=1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=1 && (k2_240_buffer[1]-d2_240_buffer[1]>=1 || k3_240_buffer[1]-d3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=60) ||
       
 //H1 kd2,kd3值差>16 或加總>35
                    (k2_60_buffer[1]-d2_60_buffer[1]>=16 && k3_60_buffer[1]-d3_60_buffer[2]>=16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])>=35) ||
       
 //H4 角度折反 k1在35下
                    (k1_240_buffer[1]-k1_240_buffer[2]>=4 &&  k1_240_buffer[2]-k1_240_buffer[3]<=-4 && k1_240_buffer[1]<=35) ||
          
 //H4 k1,k2,k3在80上,kd1,kd2,kd3都還向上開口 
                    (k1_240_buffer[1]-d1_240_buffer[1]>=3 &&  k2_240_buffer[1]-d2_240_buffer[1]>=3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]>=3 &&  k1_240_buffer[1]>=80 &&  k2_240_buffer[1]>=80 &&  k3_240_buffer[1]>=80) ||

 //m60 k1,k2,k3在80上,kd1,kd2,kd3都還向上開口 
                    (k1_60_buffer[1]-d1_60_buffer[1]>=3 &&  k2_60_buffer[1]-d2_60_buffer[1]>=3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]>=3 &&  k1_60_buffer[1]>=80 &&  k2_60_buffer[1]>=80 &&  k3_60_buffer[1]>=80) ||

 //H4 ma05[1],ma12[1]差距大於28點 ,開口漸大([1]-[2])>=10點([2]-[3])>=8點
                    (ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])>=0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])>=0.00050)) ||      
               
 //H4 k1呈水平狀但k2,k3仍大幅往上 或macd開口尚大               
                   (k1_240_buffer[1]-k1_240_buffer[2]<=3 && k1_240_buffer[1]-k1_240_buffer[2]>=-3 &&
                  ((k2_240_buffer[1]-k2_240_buffer[2]>=6 && k3_240_buffer[1]-k3_240_buffer[2]>=6) || 
                   (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001300))) ||
              
 //H1-K1,K2,K3及H4-K1  全上揚
                   (k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 &&
                    k3_60_buffer[1]-k3_60_buffer[2]>=0 && k1_240_buffer[1]-k1_240_buffer[2]>=0) ||

 //H4 MACD在範圍外
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001800 ||
                     macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001800) ||

 //H4  k1大幅向上 [1]或[2]須有一為正
                 (((k1_240_buffer[1]-k1_240_buffer[2])-(k1_240_buffer[2]-k1_240_buffer[3])>=3) && (close_240_buffer[1]-open_240_buffer[1]>=0.00030 || close_240_buffer[2]-open_240_buffer[2]>=0.00030)) ||
                   (k1_240_buffer[1]-k1_240_buffer[2]>=12 && (close_240_buffer[1]-open_240_buffer[1]>=0.00030 || close_240_buffer[2]-open_240_buffer[2]>=0.00030)))
                    return;
                    else
                    OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 
 
//*** close Buy  5  ***************************************************************************************** 

//用在轉折所以排除條件較少      
 
//    if ( OrdersTotal()>0 && OrderMagicNumber() == 4405) 
      if  ( OrdersTotal()>0 && OrderMagicNumber()!=4410) 

 //[1]或[2]收正上影過20點
      if((((close_60_buffer[1]-open_60_buffer[1]>=0.00010 && high_60_buffer[1]-close_60_buffer[1]>=0.00200) || 
           (close_60_buffer[2]-open_60_buffer[2]>=0.00010 && high_60_buffer[2]-close_60_buffer[2]>=0.00200))  ||
 //或[1]或[2]收負上影過20點
          ((close_60_buffer[1]-open_60_buffer[1]<=-0.00010 && high_60_buffer[1]-open_60_buffer[1]>=0.00200) || 
           (close_60_buffer[2]-open_60_buffer[2]<=-0.00010 && high_60_buffer[2]-open_60_buffer[2]>=0.00200))) && 
 //[2]或[3]或[4]中有一收負
           (close_60_buffer[2]-open_60_buffer[2]<=-0.00030 || close_60_buffer[3]-open_60_buffer[3]<=-0.00030 ||  close_60_buffer[4]-open_60_buffer[4]<=-0.00030) &&         
 //ma12,ma05間距不過20點,K1,K2,K3,在50上且下降            
            ma05_60_buffer[1]-ma12_60_buffer[1]<=0.00200 &&
            k1_60_buffer[1]>=50 &&   k2_60_buffer[1]>=50 && k3_60_buffer[1]>=50 &&
            k1_60_buffer[1]-k1_60_buffer[2]<=-1 &&  k2_60_buffer[1]-k2_60_buffer[2]<=-1  &&  k3_60_buffer[1]-k3_60_buffer[2]<=-1)
            OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 
 
//*** close Buy  6  ***************************************************************************************** 

 
//*** close Buy  7  ***************************************************************************************** 

 //   if ( OrdersTotal()>0 && OrderMagicNumber() == 4407) 
      if  ( OrdersTotal()>0 && OrderMagicNumber()!=4410) 

 //ma90或ma190或m240呈下降 ([1]-[2])-([2]-[3])<=-0.00010
      if((((ma90_240_buffer[1]-ma90_240_buffer[2]) - (ma90_240_buffer[2]-ma90_240_buffer[3])<=-0.00010) ||
          ((ma180_240_buffer[1]-ma180_240_buffer[2]) - (ma180_240_buffer[2]-ma180_240_buffer[3])<=-0.00010) ||
          ((ma360_240_buffer[1]-ma360_240_buffer[2]) - (ma360_240_buffer[2]-ma360_240_buffer[3])<=-0.00010)) &&
 
 //K1,k2,k3 在高點 kd1交叉下            
            k1_240_buffer[1]>=70  &&  k2_240_buffer[1]>=75 && k3_240_buffer[1]>=75 &&

 //m60之ma05與ma12差距在15點內
            ma05_60_buffer[1]-ma12_60_buffer[1]<=0.00150 &&

 //m240之ma05與ma12差距在35點內
            ma05_240_buffer[1]-ma12_240_buffer[1]<=0.00350 &&

 //m240之ma05與ma12差距在40點內
            ma05_240_buffer[1]-ma12_240_buffer[1]<=0.00400 && 
           (k1_240_buffer[1]-d1_240_buffer[1]<=-2 || k1_240_buffer[1]-k1_240_buffer[2]<=-4))
            OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 

//*** close Buy  8  ***************************************************************************************** 

 //   if ( OrdersTotal()>0 && OrderMagicNumber() == 4408) 
       if  ( OrdersTotal()>0 && OrderMagicNumber()!=4410) 
         
 // m15 k1,k2,k3皆下降,且在50,70上
      if   (k1_15_buffer[1]-k1_15_buffer[2]<=-3 &&  k2_15_buffer[1]-k2_15_buffer[2]<=-1 && k3_15_buffer[1]-k3_15_buffer[2]<=-1 &&
            k1_15_buffer[1]>=50 &&   k2_15_buffer[1]>=70 && k3_15_buffer[1]>=70 &&
             
 //m30,m60,m240全部在70上且開始下降
            k1_30_buffer[0]-k1_30_buffer[1]<=1 && k1_30_buffer[1]>=70 &&
            k1_60_buffer[0]-k1_60_buffer[1]<=1 && k1_60_buffer[1]>=70 &&
 
 //m60之ma05與ma12差距在15點內
            ma05_60_buffer[1]-ma12_60_buffer[1]<=0.00150 &&
            k1_240_buffer[0]-k1_240_buffer[1]<=2 && k1_240_buffer[1]>=70 &&
 
 //m240之ma05與ma12差距在35點內
            ma05_240_buffer[1]-ma12_240_buffer[1]<=0.00350)
 
 //H4 k1,k2,k3在80上,kd1,kd2,kd3都還向上開口 
            if   ((k1_240_buffer[1]-d1_240_buffer[1]>=3 &&  k2_240_buffer[1]-d2_240_buffer[1]>=3 && 
                   k3_240_buffer[1]-d3_240_buffer[1]>=3 &&  k1_240_buffer[1]>=80 &&  k2_240_buffer[1]>=80 &&  k3_240_buffer[1]>=80) ||
 
 //m60 k1,k2,k3在80上,kd1,kd2,kd3都還向上開口 
                  (k1_60_buffer[1]-d1_60_buffer[1]>=3 &&  k2_60_buffer[1]-d2_60_buffer[1]>=3 && 
                   k3_60_buffer[1]-d3_60_buffer[1]>=3 &&  k1_60_buffer[1]>=80 &&  k2_60_buffer[1]>=80 &&  k3_60_buffer[1]>=80) ||
 
 //H1-K1,K2,K3及H4-K1  全上揚
                  (k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 &&
                   k3_60_buffer[1]-k3_60_buffer[2]>=0 && k1_240_buffer[1]-k1_240_buffer[2]>=0) ||
                   
 // H4  ma45,ma90,ma180,ma360,ma650 全斜上    
                  (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00030 && 
                   ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00030 && ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00030 && 
                   ma650_240_buffer[1]-ma650_240_buffer[2]>=0.00030 &&  ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280) ||

 // H4  ma45,ma90,ma180,ma360,ma650 全斜上 90,180斜度較大,45斜度較小    
                  (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00030 && 
                   ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00040 && ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00040 && 
                   ma650_240_buffer[1]-ma650_240_buffer[2]>=0.00020 &&  ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280) ||        
            
 // H4  ma45,ma90斜上,斜度較大,
                  (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00100 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00060) ||
 // H4 ma180,ma360,ma650斜上,k1,k2,k3在70上,kd1,kd2或kd3   或kd2,kd3開口向上仍大                  
                  (ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00010 && ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00020 && 
                   ma650_240_buffer[1]-ma650_240_buffer[2]>=0.00020 && 
 // H4 k1,k2或k3皆上升,且K1在75上
                  (k1_240_buffer[1]-d1_240_buffer[1]>=4 && k1_240_buffer[1]>=70 &&
                  (k2_240_buffer[1]-d2_240_buffer[1]>=4 && k2_240_buffer[1]>=70 ||
                   k3_240_buffer[1]-d3_240_buffer[1]>=4 && k3_240_buffer[1]>=70)) ||
 // H4 k2,k3皆上升,且K1在70上
                  (k2_240_buffer[1]-d2_240_buffer[1]>=4 && k2_240_buffer[1]>=70 &&
                   k3_240_buffer[1]-d3_240_buffer[1]>=4 && k3_240_buffer[1]>=70)))
                   return;
                   else
                   OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 


//*** close Buy  9  ***************************************************************************************** 

 //   if ( OrdersTotal()>0 && OrderMagicNumber() == 4409) 
       if  ( OrdersTotal()>0 && OrderMagicNumber()!=4410) 
          
 // m240 k1,k2或k3下降,且在70上
      if   (k1_240_buffer[1]>=70 &&   k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70 &&
          ((k1_240_buffer[1]-k1_240_buffer[2]<=-3 &&  (k2_240_buffer[1]-k2_240_buffer[2]<=-1 || k3_240_buffer[1]-k3_240_buffer[2]<=-1)) ||
           (k1_240_buffer[1]-d1_240_buffer[1]<=-6 && k2_240_buffer[1]-d2_240_buffer[1]<=8 &&  k3_240_buffer[1]-d3_240_buffer[1]<=8))  &&
             
 //m60之ma05與ma12差距在15點內
            ma05_60_buffer[1]-ma12_60_buffer[1]<=0.00150 &&

 //m240之ma05與ma12差距在35點內
            ma05_240_buffer[1]-ma12_240_buffer[1]<=0.00350 &&

 //[1][2]為負[3]或[4]為正
            close_240_buffer[1]-open_240_buffer[1]<=-0.00040 && close_240_buffer[2]-open_240_buffer[2]<=0 &&
           (close_240_buffer[3]-open_240_buffer[3]>=0.00040 || close_240_buffer[4]-open_240_buffer[4]>=0.00040) &&
           
 //ma180或ma360斜下
           (ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00010 || ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00010) &&                      
 
 //[1][2][3]或[2][3][4]開或收盤在ma180上下各12點間
           ((close_240_buffer[2]-ma180_240_buffer[2]<=0.00120 || close_240_buffer[2]-ma180_240_buffer[2]>=-0.00120) &&
            (close_240_buffer[3]-ma180_240_buffer[3]<=0.00120 || close_240_buffer[3]-ma180_240_buffer[3]>=-0.00120) &&
           ((close_240_buffer[4]-ma180_240_buffer[4]<=0.00120 || close_240_buffer[4]-ma180_240_buffer[4]>=-0.00120) ||
            (close_240_buffer[1]-ma180_240_buffer[1]<=0.00120 || close_240_buffer[1]-ma180_240_buffer[1]>=-0.00120))) ||
          
 //或[1][2][3]或[2][3][4]開或收盤在ma360上下各12點間
           ((close_240_buffer[2]-ma360_240_buffer[2]<=0.00120 || close_240_buffer[2]-ma360_240_buffer[2]>=-0.00120) &&
            (close_240_buffer[3]-ma360_240_buffer[3]<=0.00120 || close_240_buffer[3]-ma360_240_buffer[3]>=-0.00120) &&
           ((close_240_buffer[4]-ma360_240_buffer[4]<=0.00120 || close_240_buffer[4]-ma360_240_buffer[4]>=-0.00120) ||
            (close_240_buffer[1]-ma360_240_buffer[1]<=0.00120 || close_240_buffer[1]-ma360_240_buffer[1]>=-0.00120))))
             OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 





//*** close Buy  10  ***************************************************************************************** 

//用在轉折所以排除條件較少      

    if ( OrdersTotal()>0 && OrderMagicNumber() == 4410) 
          
 // m15 k1,k2,k3皆下降,且在50,70上
      if   (k1_15_buffer[1]-k1_15_buffer[2]<=-3 &&  k2_15_buffer[1]-k2_15_buffer[2]<=-1 && k3_15_buffer[1]-k3_15_buffer[2]<=-1 &&
            k1_15_buffer[1]>=50 &&   k2_15_buffer[1]>=70 && k3_15_buffer[1]>=70 &&
             
 // m30 k1,k2或k3皆下降,且在60,70上
           (k1_30_buffer[1]-k1_30_buffer[2]<=-1 &&  (k2_30_buffer[1]-k2_30_buffer[2]<=-1 || k3_30_buffer[1]-k3_30_buffer[2]<=-1) && 
            k1_30_buffer[1]>=60 && k2_30_buffer[1]>=70 && k3_30_buffer[1]>=70) &&
 
 // m60 k1,k2或k3皆下降,且在60,70上或[0]較大幅度下降
         (((k1_60_buffer[1]-k1_60_buffer[2]<=-1 &&  (k2_60_buffer[1]-k2_60_buffer[2]<=-1 || k3_60_buffer[1]-k3_60_buffer[2]<=-1)) ||
           (k1_60_buffer[0]-k1_60_buffer[1]<=-5 && k1_60_buffer[0]-d1_60_buffer[0]<=-2))  &&
            k1_60_buffer[1]>=60 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70)) 

 //H1,H4 kd值差全部>10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]>=10 && k3_60_buffer[1]-d3_60_buffer[2]>=10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]>=10 && k3_240_buffer[1]-d3_240_buffer[2]>=10) ||
 
 //H1,H4 k2,k3在低點,或H4 k1,k,k3在低點
                    (k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
                    (k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
                                     
 //H1 kd2,kd3值差>16 或加總>35
                    (k2_60_buffer[1]-d2_60_buffer[1]>=16 && k3_60_buffer[1]-d3_60_buffer[2]>=16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])>=35) ||

 // m15  ma45,ma90,ma180,ma360,ma650 全斜上    
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00030 && 
                    ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00030 && ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00030 && 
                    ma650_240_buffer[1]-ma650_240_buffer[2]>=0.00030 &&  ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280) ||

 // m15  ma45,ma90,ma180,ma360,ma650 全斜上 90,180斜度較大,45斜度較小    
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00030 && 
                    ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00040 && ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00040 && 
                    ma650_240_buffer[1]-ma650_240_buffer[2]>=0.00020 &&  ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280) ||        

 //H4 MACD在範圍外
                   (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001800 ||
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001800) ||

 //H4-K1,K2,K3,MA45  全上揚
                   (k1_240_buffer[1]-k1_240_buffer[2]>=5 && k2_240_buffer[1]-k2_240_buffer[2]>=5 &&
                    k3_240_buffer[1]-k3_240_buffer[2]>=5 && ma45_240_buffer[1]-ma45_240_buffer[2]>=5) ||

 //H1-K1,K2,K3及H4-K1  全上揚
                   (k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 &&
                    k3_60_buffer[1]-k3_60_buffer[2]>=0 && k1_240_buffer[1]-k1_240_buffer[2]>=0) ||
 
 // m15  ma45,ma90斜上,斜度較大,
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00100 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00060) ||

 // H4 ma180,ma360,ma650斜上,k1,k2,k3在70上,kd1,kd2或kd3   或kd2,kd3開口向上仍大                  
                   (ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00010 && ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00020 && 
                    ma650_240_buffer[1]-ma650_240_buffer[2]>=0.00020 && 
 // H4 k1,k2或k3皆上升,且K1在75上
                   (k1_240_buffer[1]-d1_240_buffer[1]>=4 && k1_240_buffer[1]>=70 &&
                   (k2_240_buffer[1]-d2_240_buffer[1]>=4 && k2_240_buffer[1]>=70 ||
                    k3_240_buffer[1]-d3_240_buffer[1]>=4 && k3_240_buffer[1]>=70)) ||
 // H4 k2,k3皆上升,且K1在70上
                   (k2_240_buffer[1]-d2_240_buffer[1]>=4 && k2_240_buffer[1]>=70 &&
                    k3_240_buffer[1]-d3_240_buffer[1]>=4 && k3_240_buffer[1]>=70)))
                    return;
                    else
                    OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 

//*** close Buy  11  ***************************************************************************************** 
//條件和上相同僅K1[0],KD[0]稍不同  

//    if ( OrdersTotal()>0 && OrderMagicNumber() == 4411) 
      if  ( OrdersTotal()>0 && OrderMagicNumber()!=4410) 
          
 // H4   [1][3]或[1][4]或[1][5]或[1][6]為負
      if (((close_240_buffer[1]-open_240_buffer[1]<=-0.00050 &&  close_240_buffer[3]-open_240_buffer[3]<=-0.00050) ||
           (close_240_buffer[1]-open_240_buffer[1]<=-0.00050 &&  close_240_buffer[4]-open_240_buffer[4]<=-0.00050) ||
           (close_240_buffer[1]-open_240_buffer[1]<=-0.00050 &&  close_240_buffer[5]-open_240_buffer[5]<=-0.00050) ||
           (close_240_buffer[1]-open_240_buffer[1]<=-0.00050 &&  close_240_buffer[6]-open_240_buffer[6]<=-0.00050)) &&
             
 //ma45或ma90或ma180或ma360或ma650具斜度下降
           (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00030 || ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00030 ||
            ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00030 ||  ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00030 ||
            ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.00030) &&      

 // H4 k1,k2或k3皆下降,且K1在75上
           (k1_240_buffer[1]-k1_240_buffer[2]<0 &&  (k2_240_buffer[1]-k2_240_buffer[2]<0 || k3_240_buffer[1]-k3_240_buffer[2]<0) && 
           (k1_240_buffer[1]>=80 ||  (k2_240_buffer[1]>=75 &&  k3_240_buffer[1]>=75))) || 
            
 // H4 k1在高點向下          
           (k1_240_buffer[1]>=80 && k1_240_buffer[1]-k1_240_buffer[2]<=-3))
            OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 

 

//*** close Buy  21  ***************************************************************************************** 
  
                //(m15-66)   h4 的 ma180,ma360,ma650 斜下 或ma180持平 ma360 斜下   
        if   ((ma180_240_buffer[1]-ma180_240_buffer[2]<=0.00010 && ma360_240_buffer[1]-ma360_240_buffer[2]<=0.00010 &&
               ma650_240_buffer[1]-ma650_240_buffer[2]<=0.00010 &&
                  //  macd<=0.00110  >=0.00110   main && signal <=-0.00015   
               macdmainline_240_buffer[1]-macdmainline_240_buffer[2]<=-0.000150 && 
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]<=-0.000150 &&
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.001100 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.001100 &&
                     //   kd2,kd3<=-3  k2,k3>=65     close[4]||[5]||[6]||[7]<close[1]&& [2] 含w底性質         
               k2_240_buffer[1]-d2_240_buffer[1]<=-3 && k3_240_buffer[1]-d3_240_buffer[1]<=-3 &&
              (close_240_buffer[4]-open_240_buffer[1]>=0 || close_240_buffer[5]-open_240_buffer[1]>=0 ||
               close_240_buffer[6]-open_240_buffer[1]>=0 || close_240_buffer[7]-open_240_buffer[1]>=0 || 
               close_240_buffer[8]-open_240_buffer[1]>=0 || close_240_buffer[9]-open_240_buffer[1]>=0) && 
              (close_240_buffer[4]-close_240_buffer[2]>=0 || close_240_buffer[5]-close_240_buffer[2]>=0 ||
               close_240_buffer[6]-close_240_buffer[2]>=0 || close_240_buffer[7]-close_240_buffer[2]>=0 || 
               close_240_buffer[8]-close_240_buffer[2]>=0 || close_240_buffer[9]-close_240_buffer[2]>=0) && 
               k2_240_buffer[1]>=65 && k3_240_buffer[1]>=65) ||
             
                  //(m15-66)   h4 的 ma180,ma360,ma650 斜下 或ma180持平 ma360 斜下   
              (ma180_240_buffer[1]-ma180_240_buffer[2]<=0.00010 && ma360_240_buffer[1]-ma360_240_buffer[2]<=0.00010 &&
               ma650_240_buffer[1]-ma650_240_buffer[2]<=0.00010 &&
                  //  macd>=-0.00110  <=0.00110   main && signal <=-0.00015   
               macdmainline_240_buffer[1]-macdmainline_240_buffer[2]<=-0.000150 && 
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]<=-0.000150 &&
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.001100 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.001100 &&
                     //   kd2,kd3<=-3  k2,k3>=65     close[4]||[5]||[6]||[7]<close[1]&& [2] 含M頭性質         
               k2_240_buffer[1]-d2_240_buffer[1]<=-3 && k3_240_buffer[1]-d3_240_buffer[1]<=-3 &&
              (close_240_buffer[4]-open_240_buffer[1]>=0 || close_240_buffer[5]-open_240_buffer[1]>=0 ||
               close_240_buffer[6]-open_240_buffer[1]>=0 || close_240_buffer[7]-open_240_buffer[1]>=0 || 
               close_240_buffer[8]-open_240_buffer[1]>=0 || close_240_buffer[9]-open_240_buffer[1]>=0) && 
              (close_240_buffer[4]-close_240_buffer[2]>=0 || close_240_buffer[5]-close_240_buffer[2]>=0 ||
               close_240_buffer[6]-close_240_buffer[2]>=0 || close_240_buffer[7]-close_240_buffer[2]>=0 || 
               close_240_buffer[8]-close_240_buffer[2]>=0 || close_240_buffer[9]-close_240_buffer[2]>=0) && 
               k2_240_buffer[1]>=65 && k3_240_buffer[1]>=65) ||
              //(m15-67)   h4 的 ma360, ma650 斜下   ma05||ma08||ma12<=0.0001 
              (ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00010 && ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.00010 &&
              (ma05_240_buffer[1]-ma05_240_buffer[2]<=0.00010 || ma08_240_buffer[1]-ma08_240_buffer[2]<=0.00010 ||
               ma12_240_buffer[1]-ma12_240_buffer[2]<=0.00010) &&
                  //ma45,ma90已近持平  [1]-[6]<=0.0003
               ma45_240_buffer[1]-ma45_240_buffer[6]<=0.00030 && ma90_240_buffer[1]-ma90_240_buffer[6]<=0.00030 &&
                // [1]上影大於30點          [2][3]為正  
              (close_240_buffer[1]-open_240_buffer[1]<=-0.00010  && high_240_buffer[1]-close_240_buffer[1]>=0.00300)  ||
               close_240_buffer[1]-open_240_buffer[1]>=0.00010  && high_240_buffer[1]-open_240_buffer[1]>=0.00300)  &&
              (close_240_buffer[2]-open_240_buffer[2]>=0.00010 || close_240_buffer[3]-open_240_buffer[3]>=0.00010)  && 
                   //   [5]||[6]||[7]||[8]的開盤價在[1]之上   下跌後上漲留上影線         
              (close_240_buffer[5]-close_240_buffer[1]>=0 || close_240_buffer[6]-close_240_buffer[1]>=0 ||
               close_240_buffer[7]-close_240_buffer[1]>=0 || close_240_buffer[8]-close_240_buffer[1]>=0 ||
               close_240_buffer[9]-close_240_buffer[1]>=0 || close_240_buffer[10]-close_240_buffer[1]>=0) &&                 //kd2,kd3>=7     
               k2_240_buffer[1]-d2_240_buffer[1]<=-3 &&  k3_240_buffer[1]-d3_240_buffer[1]<=-3)
               if    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001100 ||
                      macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001100)
                      return;
                      else
                      OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 

//*** close Buy  22  ***************************************************************************************** 
  
                //漲後回跌至ma180後再反彈至ma45後不漲了
                //(m15-67)   h4 的 ma45斜下 ma90持平 ma180 斜上  上到下排列  ma45,ma90,ma180   
        if    (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00020 && ma90_240_buffer[1]-ma90_240_buffer[2]<=0.00010 &&
               ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00010 && ma45_240_buffer[1]-ma90_240_buffer[1]>=0.00100 &&
               ma90_240_buffer[1]-ma180_240_buffer[1]>=0.00100 &&
                     //   kd1,(kd2||kd3)<=-3  k1,k2,k3>=75             
               k1_240_buffer[1]-d1_240_buffer[1]<=-3 && (k2_240_buffer[1]-d2_240_buffer[1]<=-3 || k3_240_buffer[1]-d3_240_buffer[1]<=-3) &&
               k2_240_buffer[1]>=75 && k3_240_buffer[1]>=75 &&
               //ma05 [1]-[2]<=0 
               ma05_240_buffer[1]-ma05_240_buffer[2]<=0 &&
                   // [1]上影大於22點          [2]||[3]為正  
             ((close_240_buffer[1]-open_240_buffer[1]<=-0.00010  && high_240_buffer[1]-close_240_buffer[1]>=0.00220)  ||
              (close_240_buffer[1]-open_240_buffer[1]>=0.00010  && high_240_buffer[1]-open_240_buffer[1]>=0.00220))  &&
              (close_240_buffer[2]-open_240_buffer[2]>=0.00010 || close_240_buffer[3]-open_240_buffer[3]>=0.00010)   && 
            
                // ([2]||[3]||[4]||[5]) && ([6]||[7]||[8]||[9])  close[1]-ma45>=-0.0005 <=0.0005  收在ma45附近
             ((close_240_buffer[2]-ma45_240_buffer[2]>=-0.00050 && close_240_buffer[2]-ma45_240_buffer[2]<=0.00050) || 
              (close_240_buffer[3]-ma45_240_buffer[3]>=-0.00050 && close_240_buffer[3]-ma45_240_buffer[3]<=0.00050) || 
              (close_240_buffer[4]-ma45_240_buffer[4]>=-0.00050 && close_240_buffer[4]-ma45_240_buffer[4]<=0.00050) || 
              (close_240_buffer[5]-ma45_240_buffer[5]>=-0.00050 && close_240_buffer[5]-ma45_240_buffer[5]<=0.00050)) && 
             ((close_240_buffer[6]-ma45_240_buffer[6]>=-0.00050 && close_240_buffer[6]-ma45_240_buffer[6]<=0.00050) || 
              (close_240_buffer[7]-ma45_240_buffer[7]>=-0.00050 && close_240_buffer[7]-ma45_240_buffer[7]<=0.00050) || 
              (close_240_buffer[8]-ma45_240_buffer[8]>=-0.00050 && close_240_buffer[8]-ma45_240_buffer[8]<=0.00050) || 
              (close_240_buffer[9]-ma45_240_buffer[9]>=-0.00050 && close_240_buffer[9]-ma45_240_buffer[9]<=0.00050))) 
               OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 
       
//*** close Buy  23  ***************************************************************************************** 
 
              //跌後漲至ma180上下留上影線
                //(m15-67)   h4 的 ma90,ma180,ma360,ma650 平斜下     下到上排列  ma90,ma180,ma360,ma650   
        if    (ma90_240_buffer[1]-ma90_240_buffer[2]<0 && ma180_240_buffer[1]-ma180_240_buffer[2]<=0 &&
               ma360_240_buffer[1]-ma360_240_buffer[2]<0 && ma650_240_buffer[1]-ma650_240_buffer[2]<-0.00010 &&
               ma90_240_buffer[1]-ma180_240_buffer[1]<=0.00100 && ma90_240_buffer[1]-ma180_240_buffer[1]>=-0.00100 && 
                  //ma45 開口微下
              (ma90_240_buffer[1]-ma45_240_buffer[1])-(ma90_240_buffer[2]-ma45_240_buffer[2])<0 && 
                   //macd   signal  [1]>[2] [1]<[3] 
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]>=0.000010 &&
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[3]<=-0.000010 &&

                  // [1]上影大於22點          [2]||[3]為正  
             ((close_240_buffer[1]-open_240_buffer[1]<=-0.00010  && high_240_buffer[1]-close_240_buffer[1]>=0.00220)  ||
              (close_240_buffer[1]-open_240_buffer[1]>=0.00010  && high_240_buffer[1]-open_240_buffer[1]>=0.00220))  &&
              (close_240_buffer[2]-open_240_buffer[2]>=0.00010 || close_240_buffer[3]-open_240_buffer[3]>=0.00010)) 
               OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 
  
 
   }

 //*** close Sell  1  ********************************************************************************************************************** 
  if    (OrderType()==OP_SELL)
   {         
    
//    if ( OrdersTotal()>0 && OrderMagicNumber() == 8801) 
    if ( OrdersTotal()>0 && OrderMagicNumber() != 8810) 

//m5 k1,k2,k3皆上升,且在50下
     if   ((k1_15_buffer[1]-k1_15_buffer[2]>=3 &&  k2_15_buffer[1]-k2_15_buffer[2]>=1 && k3_15_buffer[1]-k3_15_buffer[2]>=0 &&
            k1_15_buffer[1]<=50 &&   k2_15_buffer[1]<=50 && k3_15_buffer[1]<=50))
            if    (k1_05_buffer[1]-d1_05_buffer[1]>=3 &&   k1_05_buffer[1]<=50)                               
    
 //m60,m240 kd值差全部<-10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]<=-10 && k3_60_buffer[1]-d3_60_buffer[2]<=-10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]<=-10 && k3_240_buffer[1]-d3_240_buffer[2]<=-10) ||

 //H1,H4 k2,k3在高點,或H4 k1,k,k3在高點
                    (k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
                    (k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
 
 //H4 ma05 下降,macd在1550外,收盤離ma05稍有距離或kd1,kd2,kd3有開口且向下
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-7 && k2_240_buffer[1]-d2_240_buffer[1]<=-7 && k3_240_buffer[1]-d3_240_buffer[2]<=-7 &&
                     k2_240_buffer[1]>=50 && k3_240_buffer[1]>=50))) ||

 //H4 ma05 下降,收盤離ma05稍有距離,k1,k2,k3向下
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]<=-1 && k2_240_buffer[1]-k2_240_buffer[2]<=-1 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                     k1_240_buffer[1]>=30) || 
 
 //H4 ma05 下降,收盤離ma05稍有距離,kd1向下,k2或k3 向下
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-6 && (k2_240_buffer[1]-k2_240_buffer[2]<=-1 || k3_240_buffer[1]-k3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=30) || 
                                     
 //H4 ma05 上升趨緩 ([1]-[2])-([2]-[3])<=-0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])<=-0.00030) ||

 //m60,m240 kd1,2,3值差全部<-1
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-1 && k2_60_buffer[1]-d2_60_buffer[1]<=-1 && k3_60_buffer[1]-d3_60_buffer[2]<=-1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-1 && (k2_240_buffer[1]-d2_240_buffer[1]<=-1 || k3_240_buffer[1]-d3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=40) ||
                      
 //m60 kd2,kd3值差>16 或加總>35 
                    (k2_60_buffer[1]-d2_60_buffer[1]<=-16 && k3_60_buffer[1]-d3_60_buffer[2]<=-16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])<=-35) ||
 
 //角度折反 k1在65上
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-4 &&  k1_240_buffer[2]-k1_240_buffer[3]>=4 && k1_240_buffer[1]>=65) ||

 //H4 k1,k2,k3在20下,kd1,kd2,kd3都還向下開口 
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-3 &&  k2_240_buffer[1]-d2_240_buffer[1]<=-3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]<=-3 &&  k1_240_buffer[1]<=20 &&  k2_240_buffer[1]<=20 &&  k3_240_buffer[1]<=20) ||

 //m60 k1,k2,k3在20下,kd1,kd2,kd3都還向下開口 
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-3 &&  k2_60_buffer[1]-d2_60_buffer[1]<=-3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]<=-3 &&  k1_60_buffer[1]<=20 &&  k2_60_buffer[1]<=20 &&  k3_60_buffer[1]<=20) ||

 //m240 ma05[1],ma12[1]差距大於28點 ,開口漸大([1]-[2])<=-10點([2]-[3])<=-8點
                    (ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])<=-0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])<=-0.00050)) ||      

 //m240 k1呈水平狀但k2,k3仍大幅往上 或macd開口尚大               
                    (k1_240_buffer[1]-k1_240_buffer[2]>=-3 && k1_240_buffer[1]-k1_240_buffer[2]<=3 &&
                   ((k2_240_buffer[1]-k2_240_buffer[2]<=-6 && k3_240_buffer[1]-k3_240_buffer[2]<=-6) || 
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001300))) ||
 
 //H1-K1,K2,K3及H4-K1  全下降
                    (k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 &&
                     k3_60_buffer[1]-k3_60_buffer[2]<=0 && k1_240_buffer[1]-k1_240_buffer[2]<=0) ||

 // m15  ma45,ma90,ma180,ma360,ma650 全斜下    
                    (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00030 && 
                     ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00030 && ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00030 && 
                     ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.00030 &&  ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280) ||

 // m15  ma45,ma90,ma180,ma360,ma650 全斜下 90,180斜度較大,45斜度較小    
                    (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00030 && 
                     ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00040 && ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00040 && 
                     ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.00020 &&  ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280) ||        
            
 // m15  ma45,ma90斜下,斜度較大,
                    (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00100 && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00060) ||
 
 //H4 MACD在範圍外
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001800 ||
                     macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001800) ||

 //m240  k1大幅向上 [1]或[2]須有一為正
                  (((k1_240_buffer[1]-k1_240_buffer[2])-(k1_240_buffer[2]-k1_240_buffer[3])<=-3) && (close_240_buffer[1]-open_240_buffer[1]<=-0.00030 || close_240_buffer[2]-open_240_buffer[2]<=-0.00030)) ||
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-12 && (close_240_buffer[1]-open_240_buffer[1]<=-0.00030 || close_240_buffer[2]-open_240_buffer[2]<=-0.00030)))
                     return;
                     else                              
                     OrderClose(OrderTicket(),lots,Ask,1,Gold);    
 
  //***close Sell  2  ********************************************************************************************************************** 
//    if ( OrdersTotal()>0 && OrderMagicNumber() == 8802) 
    if ( OrdersTotal()>0 && OrderMagicNumber() != 8810) 

     if   ((k1_30_buffer[1]-k1_30_buffer[2]>=3 &&  k2_30_buffer[1]-k2_30_buffer[2]>=1 && k3_30_buffer[1]-k3_30_buffer[2]>=0 &&
            k1_30_buffer[1]<=30 &&   k2_30_buffer[1]<=25 && k3_30_buffer[1]<=25) ||
           (k1_60_buffer[1]-k1_60_buffer[2]>=3 &&  k2_60_buffer[1]-k2_60_buffer[2]>=1 && k3_60_buffer[1]-k3_60_buffer[2]>=0 &&
            k1_60_buffer[1]<=30 &&   k2_60_buffer[1]<=25 && k3_60_buffer[1]<=25))
            if    (k1_05_buffer[1]-d1_05_buffer[1]>=3 &&   k1_05_buffer[1]<=50)                               
    
 //m60,m240 kd值差全部<-10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]<=-10 && k3_60_buffer[1]-d3_60_buffer[2]<=-10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]<=-10 && k3_240_buffer[1]-d3_240_buffer[2]<=-10) ||

 //H1,H4 k2,k3在高點,或H4 k1,k,k3在高點
                    (k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
                    (k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
 
 //H4 ma05 下降,macd在1550外,收盤離ma05稍有距離或kd1,kd2,kd3有開口且向下
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-7 && k2_240_buffer[1]-d2_240_buffer[1]<=-7 && k3_240_buffer[1]-d3_240_buffer[2]<=-7 &&
                     k2_240_buffer[1]>=50 && k3_240_buffer[1]>=50))) ||

 //H4 ma05 下降,收盤離ma05稍有距離,k1,k2,k3向下
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]<=-1 && k2_240_buffer[1]-k2_240_buffer[2]<=-1 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                     k1_240_buffer[1]>=30) || 
 
 //H4 ma05 下降,收盤離ma05稍有距離,kd1向下,k2或k3 向下
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-6 && (k2_240_buffer[1]-k2_240_buffer[2]<=-1 || k3_240_buffer[1]-k3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=30) || 
                                     
 //H4 ma05 上升趨緩 ([1]-[2])-([2]-[3])<=-0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])<=-0.00030) ||

 //H4 k1,k2,k3在20下,kd1,kd2,kd3都還向下開口 
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-3 &&  k2_240_buffer[1]-d2_240_buffer[1]<=-3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]<=-3 &&  k1_240_buffer[1]<=20 &&  k2_240_buffer[1]<=20 &&  k3_240_buffer[1]<=20) ||

 //m60 k1,k2,k3在20下,kd1,kd2,kd3都還向下開口 
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-3 &&  k2_60_buffer[1]-d2_60_buffer[1]<=-3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]<=-3 &&  k1_60_buffer[1]<=20 &&  k2_60_buffer[1]<=20 &&  k3_60_buffer[1]<=20) ||

 //m60,m240 kd1,2,3值差全部<-1
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-1 && k2_60_buffer[1]-d2_60_buffer[1]<=-1 && k3_60_buffer[1]-d3_60_buffer[2]<=-1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-1 && (k2_240_buffer[1]-d2_240_buffer[1]<=-1 || k3_240_buffer[1]-d3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=40) ||
                      
 //m60 kd2,kd3值差>16 或加總>35 
                    (k2_60_buffer[1]-d2_60_buffer[1]<=-16 && k3_60_buffer[1]-d3_60_buffer[2]<=-16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])<=-35) ||
 
 //角度折反 k1在65上
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-4 &&  k1_240_buffer[2]-k1_240_buffer[3]>=4 && k1_240_buffer[1]>=65) ||

 //m240 ma05[1],ma12[1]差距大於28點 ,開口漸大([1]-[2])<=-10點([2]-[3])<=-8點
                    (ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])<=-0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])<=-0.00050)) ||      

 //m240 k1呈水平狀但k2,k3仍大幅往上 或macd開口尚大               
                    (k1_240_buffer[1]-k1_240_buffer[2]>=-3 && k1_240_buffer[1]-k1_240_buffer[2]<=3 &&
                   ((k2_240_buffer[1]-k2_240_buffer[2]<=-6 && k3_240_buffer[1]-k3_240_buffer[2]<=-6) || 
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001300))) ||
 
 //H1-K1,K2,K3及H4-K1  全下降
                    (k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 &&
                     k3_60_buffer[1]-k3_60_buffer[2]<=0 && k1_240_buffer[1]-k1_240_buffer[2]<=0) ||

 // m15  ma45,ma90,ma180,ma360,ma650 全斜下    
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00030 && 
                    ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00030 && ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00030 && 
                    ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.00030 &&  ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280) ||

 // m15  ma45,ma90,ma180,ma360,ma650 全斜下 90,180斜度較大,45斜度較小    
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00030 && 
                    ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00040 && ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00040 && 
                    ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.00020 &&  ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280) ||        
            
 // m15  ma45,ma90斜下,斜度較大,
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00100 && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00060) ||

 //H4 MACD在範圍外
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001800 ||
                     macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001800) ||

 //m240  k1大幅向上 [1]或[2]須有一為正
                  (((k1_240_buffer[1]-k1_240_buffer[2])-(k1_240_buffer[2]-k1_240_buffer[3])<=-3) && (close_240_buffer[1]-open_240_buffer[1]<=-0.00030 || close_240_buffer[2]-open_240_buffer[2]<=-0.00030)) ||
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-12 && (close_240_buffer[1]-open_240_buffer[1]<=-0.00030 || close_240_buffer[2]-open_240_buffer[2]<=-0.00030)))
                     return;
                     else                                      
                     OrderClose(OrderTicket(),lots,Ask,1,Gold);    
  //***close Sell  3  ********************************************************************************************************************** 

//   if ( OrdersTotal()>0 && OrderMagicNumber() == 8803) 
    if ( OrdersTotal()>0 && OrderMagicNumber() != 8810) 
    
     if   ((k1_15_buffer[1]-k1_15_buffer[2]>=6 &&  k1_15_buffer[1]<=25 &&

 // m240須在30下
            k1_15_buffer[1]-d1_15_buffer[1]>=4 && k1_240_buffer[1]<=30 &&
            close_15_buffer[1]-close_15_buffer[2]>=0.00010 && close_15_buffer[1]-close_15_buffer[3]>=0.00010))
    
 //m60,m240 kd值差全部<-10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]<=-10 && k3_60_buffer[1]-d3_60_buffer[2]<=-10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]<=-10 && k3_240_buffer[1]-d3_240_buffer[2]<=-10) ||

 //H1,H4 k2,k3在高點,或H4 k1,k,k3在高點
                    (k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
                    (k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
 
 //H4 ma05 下降,macd在1550外,收盤離ma05稍有距離或kd1,kd2,kd3有開口且向下
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-7 && k2_240_buffer[1]-d2_240_buffer[1]<=-7 && k3_240_buffer[1]-d3_240_buffer[2]<=-7 &&
                     k2_240_buffer[1]>=50 && k3_240_buffer[1]>=50))) ||
 //H4 ma05 下降,收盤離ma05稍有距離,k1,k2,k3向下
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]<=-1 && k2_240_buffer[1]-k2_240_buffer[2]<=-1 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                     k1_240_buffer[1]>=30) || 
 
 //H4 ma05 下降,收盤離ma05稍有距離,kd1向下,k2或k3 向下
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-6 && (k2_240_buffer[1]-k2_240_buffer[2]<=-1 || k3_240_buffer[1]-k3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=30) || 
                                     
 //H4 ma05 上升趨緩 ([1]-[2])-([2]-[3])<=-0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])<=-0.00030) ||

 //H4 k1,k2,k3在20下,kd1,kd2,kd3都還向下開口 
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-3 &&  k2_240_buffer[1]-d2_240_buffer[1]<=-3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]<=-3 &&  k1_240_buffer[1]<=20 &&  k2_240_buffer[1]<=20 &&  k3_240_buffer[1]<=20) ||

 //m60,m240 kd1,2,3值差全部<-1
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-1 && k2_60_buffer[1]-d2_60_buffer[1]<=-1 && k3_60_buffer[1]-d3_60_buffer[2]<=-1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-1 && (k2_240_buffer[1]-d2_240_buffer[1]<=-1 || k3_240_buffer[1]-d3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=40) ||
                      
 //m60 kd2,kd3值差>16 或加總>35 
                    (k2_60_buffer[1]-d2_60_buffer[1]<=-16 && k3_60_buffer[1]-d3_60_buffer[2]<=-16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])<=-35) ||
 
 //角度折反 k1在65上
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-4 &&  k1_240_buffer[2]-k1_240_buffer[3]>=4 && k1_240_buffer[1]>=65) ||

 //m240 ma05[1],ma12[1]差距大於28點 ,開口漸大([1]-[2])<=-10點([2]-[3])<=-8點
                    (ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])<=-0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])<=-0.00050)) ||      

 //m240 k1呈水平狀但k2,k3仍大幅往上 或macd開口尚大               
                    (k1_240_buffer[1]-k1_240_buffer[2]>=-3 && k1_240_buffer[1]-k1_240_buffer[2]<=3 &&
                   ((k2_240_buffer[1]-k2_240_buffer[2]<=-6 && k3_240_buffer[1]-k3_240_buffer[2]<=-6) || 
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001300))) ||
 
 //H1-K1,K2,K3及H4-K1  全下降
                    (k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 &&
                     k3_60_buffer[1]-k3_60_buffer[2]<=0 && k1_240_buffer[1]-k1_240_buffer[2]<=0) ||

 // m15  ma45,ma90,ma180,ma360,ma650 全斜下    
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00030 && 
                    ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00030 && ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00030 && 
                    ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.00030 &&  ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280) ||

 // m15  ma45,ma90,ma180,ma360,ma650 全斜下 90,180斜度較大,45斜度較小    
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00030 && 
                    ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00040 && ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00040 && 
                    ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.00020 &&  ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280) ||        
            
 // m15  ma45,ma90斜下,斜度較大,
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00100 && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00060) ||

 //H4 MACD在範圍外
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001800 ||
                     macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001800) ||

 //m240  k1大幅向上 [1]或[2]須有一為正
                  (((k1_240_buffer[1]-k1_240_buffer[2])-(k1_240_buffer[2]-k1_240_buffer[3])<=-3) && (close_240_buffer[1]-open_240_buffer[1]<=-0.00030 || close_240_buffer[2]-open_240_buffer[2]<=-0.00030)) ||
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-12 && (close_240_buffer[1]-open_240_buffer[1]<=-0.00030 || close_240_buffer[2]-open_240_buffer[2]<=-0.00030)))
                     return;
                     else                                            
                     OrderClose(OrderTicket(),lots,Ask,1,Gold);    
//*** CLOSE  sell  4  ***************************************************************************************** 
       
//   if ( OrdersTotal()>0 && OrderMagicNumber() == 8804) 
    if ( OrdersTotal()>0 && OrderMagicNumber() != 8810) 
   
     if   ((k1_30_buffer[1]-k1_30_buffer[2]>=6 &&  k1_30_buffer[1]<=25 &&
            k1_30_buffer[1]-d1_30_buffer[1]>=4 &&
            close_30_buffer[1]-close_30_buffer[2]>=0.00010 && close_30_buffer[1]-close_30_buffer[3]>=0.00010) ||
           (k1_60_buffer[1]-k1_60_buffer[2]>=6 &&  k1_60_buffer[1]<=25 &&
            k1_60_buffer[1]-d1_60_buffer[1]>=4 &&
            close_60_buffer[1]-close_60_buffer[2]>=0.00010 && close_60_buffer[1]-close_60_buffer[3]>=0.00010))
    
 //m60,m240 kd值差全部<-10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]<=-10 && k3_60_buffer[1]-d3_60_buffer[2]<=-10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]<=-10 && k3_240_buffer[1]-d3_240_buffer[2]<=-10) ||

 //H1,H4 k2,k3在高點,或H4 k1,k,k3在高點
                    (k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
                    (k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
 
 //H4 ma05 下降,macd在1550外,收盤離ma05稍有距離或kd1,kd2,kd3有開口且向下
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-7 && k2_240_buffer[1]-d2_240_buffer[1]<=-7 && k3_240_buffer[1]-d3_240_buffer[2]<=-7 &&
                     k2_240_buffer[1]>=50 && k3_240_buffer[1]>=50))) ||
 //H4 ma05 下降,收盤離ma05稍有距離,k1,k2,k3向下
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]<=-1 && k2_240_buffer[1]-k2_240_buffer[2]<=-1 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                     k1_240_buffer[1]>=30) || 
 
 //H4 ma05 下降,收盤離ma05稍有距離,kd1向下,k2或k3 向下
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-6 && (k2_240_buffer[1]-k2_240_buffer[2]<=-1 || k3_240_buffer[1]-k3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=30) || 
                                     
 //H4 ma05 上升趨緩 ([1]-[2])-([2]-[3])<=-0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])<=-0.00030) ||

 //H4 k1,k2,k3在20下,kd1,kd2,kd3都還向下開口 
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-3 &&  k2_240_buffer[1]-d2_240_buffer[1]<=-3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]<=-3 &&  k1_240_buffer[1]<=20 &&  k2_240_buffer[1]<=20 &&  k3_240_buffer[1]<=20) ||

 //m60 k1,k2,k3在20下,kd1,kd2,kd3都還向下開口 
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-3 &&  k2_60_buffer[1]-d2_60_buffer[1]<=-3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]<=-3 &&  k1_60_buffer[1]<=20 &&  k2_60_buffer[1]<=20 &&  k3_60_buffer[1]<=20) ||

 //m60,m240 kd1,2,3值差全部<-1
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-1 && k2_60_buffer[1]-d2_60_buffer[1]<=-1 && k3_60_buffer[1]-d3_60_buffer[2]<=-1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-1 && (k2_240_buffer[1]-d2_240_buffer[1]<=-1 || k3_240_buffer[1]-d3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=40) ||
                      
 //m60 kd2,kd3值差>16 或加總>35 
                    (k2_60_buffer[1]-d2_60_buffer[1]<=-16 && k3_60_buffer[1]-d3_60_buffer[2]<=-16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])<=-35) ||
 
 //角度折反 k1在65上
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-4 &&  k1_240_buffer[2]-k1_240_buffer[3]>=4 && k1_240_buffer[1]>=65) ||

 //m240 ma05[1],ma12[1]差距大於28點 ,開口漸大([1]-[2])<=-10點([2]-[3])<=-8點
                    (ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])<=-0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])<=-0.00050)) ||      

 //m240 k1呈水平狀但k2,k3仍大幅往上 或macd開口尚大               
                    (k1_240_buffer[1]-k1_240_buffer[2]>=-3 && k1_240_buffer[1]-k1_240_buffer[2]<=3 &&
                   ((k2_240_buffer[1]-k2_240_buffer[2]<=-6 && k3_240_buffer[1]-k3_240_buffer[2]<=-6) || 
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001300))) ||
 
 //H1-K1,K2,K3及H4-K1  全下降
                    (k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 &&
                     k3_60_buffer[1]-k3_60_buffer[2]<=0 && k1_240_buffer[1]-k1_240_buffer[2]<=0) ||

 // m15  ma45,ma90,ma180,ma360,ma650 全斜下    
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00030 && 
                    ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00030 && ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00030 && 
                    ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.00030 &&  ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280) ||

 // m15  ma45,ma90,ma180,ma360,ma650 全斜下 90,180斜度較大,45斜度較小    
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00030 && 
                    ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00040 && ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00040 && 
                    ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.00020 &&  ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280) ||        
            
 // m15  ma45,ma90斜下,斜度較大,
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00100 && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00060) ||

 //H4 MACD在範圍外
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001800 ||
                     macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001800) ||

 //m240  k1大幅向上 [1]或[2]須有一為正
                  (((k1_240_buffer[1]-k1_240_buffer[2])-(k1_240_buffer[2]-k1_240_buffer[3])<=-3) && (close_240_buffer[1]-open_240_buffer[1]<=-0.00030 || close_240_buffer[2]-open_240_buffer[2]<=-0.00030)) ||
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-12 && (close_240_buffer[1]-open_240_buffer[1]<=-0.00030 || close_240_buffer[2]-open_240_buffer[2]<=-0.00030)))
                     return;
                     else                             
                     OrderClose(OrderTicket(),lots,Ask,1,Gold);    

//*** CLOSE  sell  5  ***************************************************************************************** 
    
//用在轉折所以排除條件較少      
 
//   if ( OrdersTotal()>0 && OrderMagicNumber() == 8805) 
    if ( OrdersTotal()>0 && OrderMagicNumber() != 8810) 
 
 //[1]或[2]收正下影過20點
      if((((close_60_buffer[1]-open_60_buffer[1]>=0.00010 && low_60_buffer[1]-open_60_buffer[1]<=-0.00200) || 
           (close_60_buffer[2]-open_60_buffer[2]>=0.00010 && low_60_buffer[2]-open_60_buffer[2]<=-0.00200))  ||
 //或[1]或[2]收負下影過20點
          ((close_60_buffer[1]-open_60_buffer[1]<=-0.00010 && low_60_buffer[1]-close_60_buffer[1]<=-0.00200) || 
           (close_60_buffer[2]-open_60_buffer[2]<=-0.00010 && low_60_buffer[2]-close_60_buffer[2]<=-0.00200))) && 
 //[2]或[3]或[4]中有一收正
           (close_60_buffer[2]-open_60_buffer[2]>=0.00030 || close_60_buffer[3]-open_60_buffer[3]>=0.00030 ||  close_60_buffer[4]-open_60_buffer[4]>=0.00030) &&         
 //ma12,ma05間距不過20點,K1,K2,K3,在50下且上升            
            ma05_60_buffer[1]-ma12_60_buffer[1]>=-0.00200 &&
            k1_60_buffer[1]<=50 &&   k2_60_buffer[1]<=50 && k3_60_buffer[1]<=50 &&
            k1_60_buffer[1]-k1_60_buffer[2]>=1 &&  k2_60_buffer[1]-k2_60_buffer[2]>=1  &&  k3_60_buffer[1]-k3_60_buffer[2]>=1)
            OrderClose(OrderTicket(),lots,Ask,1,Gold);    
 
//*** CLOSE  sell  6  ***************************************************************************************** 

 
//*** CLOSE  sell  7  ***************************************************************************************** 

 //   if ( OrdersTotal()>0 && OrderMagicNumber() == 8807) 
    if ( OrdersTotal()>0 && OrderMagicNumber() != 8810) 

 //ma90或ma190或m240呈上升 ([1]-[2])-([2]-[3])>=0.00010
      if((((ma90_240_buffer[1]-ma90_240_buffer[2]) - (ma90_240_buffer[2]-ma90_240_buffer[3])>=0.00010) ||
          ((ma180_240_buffer[1]-ma180_240_buffer[2]) - (ma180_240_buffer[2]-ma180_240_buffer[3])>=0.00010) ||
          ((ma360_240_buffer[1]-ma360_240_buffer[2]) - (ma360_240_buffer[2]-ma360_240_buffer[3])>=0.00010)) &&
 
 //m60之ma05與ma12差距在15點內
            ma05_60_buffer[1]-ma12_60_buffer[1]>=-0.00150 &&

 //m240之ma05與ma12差距在35點內
            ma05_240_buffer[1]-ma12_240_buffer[1]>=-0.00350 &&
 
 //K1,k2,k3 在低點 kd1交叉上           
            k1_240_buffer[1]<=30  &&  k2_240_buffer[1]<=25 && k3_240_buffer[1]<=25 &&
 //m240之ma05與ma12差距在40點內
            ma05_240_buffer[1]-ma12_240_buffer[1]>=-0.00400 && 
          (k1_240_buffer[1]-d1_240_buffer[1]>=2 || k1_240_buffer[1]-k1_240_buffer[2]>=4))
            OrderClose(OrderTicket(),lots,Ask,1,Gold);    
 
//*** CLOSE  sell  8  ***************************************************************************************** 

 //   if ( OrdersTotal()>0 && OrderMagicNumber() == 8808) 
     if ( OrdersTotal()>0 && OrderMagicNumber() != 8810) 
         
 // m15 k1,k2,k3皆上升 ,且在50,30下
      if   (k1_15_buffer[1]-k1_15_buffer[2]>=3 &&  k2_15_buffer[1]-k2_15_buffer[2]>=1 && k3_15_buffer[1]-k3_15_buffer[2]>=1 &&
            k1_15_buffer[1]<=50 &&   k2_15_buffer[1]<=30 && k3_15_buffer[1]<=30 &&
             
 //m30,m60,m240全部在30下且開始上升
            k1_30_buffer[0]-k1_30_buffer[1]>=-1 && k1_30_buffer[1]<=30 &&
            k1_60_buffer[0]-k1_60_buffer[1]>=-1 && k1_60_buffer[1]<=30 &&
 //m60之ma05與ma12差距在15點內
            ma05_60_buffer[1]-ma12_60_buffer[1]>=-0.00150 &&
            k1_240_buffer[0]-k1_240_buffer[1]>=-2 && k1_240_buffer[1]<=30 &&
 //m240之ma05與ma12差距在35點內
            ma05_240_buffer[1]-ma12_240_buffer[1]>=-0.00350)
 
 //H4 k1,k2,k3在20下,kd1,kd2,kd3都還向下開口 
           if    ((k1_240_buffer[1]-d1_240_buffer[1]<=-3 &&  k2_240_buffer[1]-d2_240_buffer[1]<=-3 && 
                   k3_240_buffer[1]-d3_240_buffer[1]<=-3 &&  k1_240_buffer[1]<=20 &&  k2_240_buffer[1]<=20 &&  k3_240_buffer[1]<=20) ||

 //m60 k1,k2,k3在20下,kd1,kd2,kd3都還向下開口 
                  (k1_60_buffer[1]-d1_60_buffer[1]<=-3 &&  k2_60_buffer[1]-d2_60_buffer[1]<=-3 && 
                   k3_60_buffer[1]-d3_60_buffer[1]<=-3 &&  k1_60_buffer[1]<=20 &&  k2_60_buffer[1]<=20 &&  k3_60_buffer[1]<=20) ||
 
 //H1-K1,K2,K3及H4-K1  全下降
                  (k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 &&
                   k3_60_buffer[1]-k3_60_buffer[2]<=0 && k1_240_buffer[1]-k1_240_buffer[2]<=0) ||

 // H4  ma45,ma90,ma180,ma360,ma650 全斜下    
                  (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00030 && 
                   ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00030 && ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00030 && 
                   ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.00030 &&  ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280) ||

 // H4  ma45,ma90,ma180,ma360,ma650 全斜下   90,180斜度較大,45斜度較小    
                  (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00030 && 
                   ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00040 && ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00040 && 
                   ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.00020 &&  ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280) ||        
            
 // H4  ma45,ma90斜下  ,斜度較大,
                  (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00100 && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00060) ||

 // H4 ma180,ma360,ma650斜下  ,k1,k2,k3在30下  ,kd1,kd2或kd3   或kd2,kd3開口向上仍大                  
                  (ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00010 && ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00020 && 
                   ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.00020 && 
 // H4 k1,k2或k3皆下降,且K1在30下  
                  (k1_240_buffer[1]-d1_240_buffer[1]<=-4 && k1_240_buffer[1]<=30 &&
                  (k2_240_buffer[1]-d2_240_buffer[1]<=-4 && k2_240_buffer[1]<=30 ||
                   k3_240_buffer[1]-d3_240_buffer[1]<=-4 && k3_240_buffer[1]<=30)) ||
 // H4 k2,k3皆下降,,且在30下 
                  (k2_240_buffer[1]-d2_240_buffer[1]<=-4 && k2_240_buffer[1]<=30 &&
                   k3_240_buffer[1]-d3_240_buffer[1]<=-4 && k3_240_buffer[1]<=30)))
                   return;
                   else
                   OrderClose(OrderTicket(),lots,Ask,1,Gold);    

//*** CLOSE  sell  9  ***************************************************************************************** 

 //   if ( OrdersTotal()>0 && OrderMagicNumber() == 8809) 
     if ( OrdersTotal()>0 && OrderMagicNumber() != 8810) 
         
 // m240 k1,k2或k3上升 ,且在30下
      if   (k1_240_buffer[1]<=30 &&   k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30 &&
          ((k1_240_buffer[1]-k1_240_buffer[2]>=3 &&  (k2_240_buffer[1]-k2_240_buffer[2]>=1 || k3_240_buffer[1]-k3_240_buffer[2]>=1)) ||
           (k1_240_buffer[1]-d1_240_buffer[1]>=6 && k2_240_buffer[1]-d2_240_buffer[1]>=-8 &&  k3_240_buffer[1]-d3_240_buffer[1]>=-8))  &&
             
 //m60之ma05與ma12差距在15點內
            ma05_60_buffer[1]-ma12_60_buffer[1]>=-0.00150 &&

 //m240之ma05與ma12差距在35點內
            ma05_240_buffer[1]-ma12_240_buffer[1]>=-0.00350 &&
 
 //[1][2]為正[3]或[4]為負
            close_240_buffer[1]-open_240_buffer[1]>=0.00040 && close_240_buffer[2]-open_240_buffer[2]>=0 &&
           (close_240_buffer[3]-open_240_buffer[3]<=-0.00040 || close_240_buffer[4]-open_240_buffer[4]<=-0.00040) &&
           
 //ma180或ma360斜上
           (ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00010 || ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00010) &&                      
 
 //[1][2][3]或[2][3][4]開或收盤在ma180上下各12點間
           ((close_240_buffer[2]-ma180_240_buffer[2]>=-0.00120 || close_240_buffer[2]-ma180_240_buffer[2]<=0.00120) &&
            (close_240_buffer[3]-ma180_240_buffer[3]>=-0.00120 || close_240_buffer[3]-ma180_240_buffer[3]<=0.00120) &&
           ((close_240_buffer[4]-ma180_240_buffer[4]>=-0.00120 || close_240_buffer[4]-ma180_240_buffer[4]<=0.00120) ||
            (close_240_buffer[1]-ma180_240_buffer[1]>=-0.00120 || close_240_buffer[1]-ma180_240_buffer[1]<=0.00120))) ||
          
 //或[1][2][3]或[2][3][4]開或收盤在ma360上下各12點間
           ((close_240_buffer[2]-ma360_240_buffer[2]>=-0.00120 || close_240_buffer[2]-ma360_240_buffer[2]<=0.00120) &&
            (close_240_buffer[3]-ma360_240_buffer[3]>=-0.00120 || close_240_buffer[3]-ma360_240_buffer[3]<=0.00120) &&
           ((close_240_buffer[4]-ma360_240_buffer[4]>=-0.00120 || close_240_buffer[4]-ma360_240_buffer[4]<=0.00120) ||
            (close_240_buffer[1]-ma360_240_buffer[1]>=-0.00120 || close_240_buffer[1]-ma360_240_buffer[1]<=0.00120))))
            OrderClose(OrderTicket(),lots,Ask,1,Gold);    
 
//*** CLOSE  sell  10  ***************************************************************************************** 

  //用在轉折所以排除條件較少      

    if ( OrdersTotal()>0 && OrderMagicNumber() == 8810) 
          
 // m15 k1,k2,k3皆上升 ,且在50,30下
      if   (k1_15_buffer[1]-k1_15_buffer[2]>=3 &&  k2_15_buffer[1]-k2_15_buffer[2]>=1 && k3_15_buffer[1]-k3_15_buffer[2]>=1 &&
            k1_15_buffer[1]<=50 &&   k2_15_buffer[1]<=30 && k3_15_buffer[1]<=30 &&
             
 // m30 k1,k2或k3皆上升 ,且在40,30下
           (k1_30_buffer[1]-k1_30_buffer[2]>=1 &&  (k2_30_buffer[1]-k2_30_buffer[2]>=1 || k3_30_buffer[1]-k3_30_buffer[2]>=1) && 
            k1_30_buffer[1]<=40 && k2_30_buffer[1]<=30 && k3_30_buffer[1]<=30) &&
 
 // m60 k1,k2或k3皆上升 ,且在40,30下或[0]較大幅度上升 
         (((k1_60_buffer[1]-k1_60_buffer[2]>=1 &&  (k2_60_buffer[1]-k2_60_buffer[2]>=1 || k3_60_buffer[1]-k3_60_buffer[2]>=1)) || 
           (k1_60_buffer[0]-k1_60_buffer[1]>=5 && k1_60_buffer[0]-d1_60_buffer[0]>=2))  &&
            k1_60_buffer[1]<=40 && k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30)) 
 
 //m60,m240 kd值差全部<-10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]<=-10 && k3_60_buffer[1]-d3_60_buffer[2]<=-10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]<=-10 && k3_240_buffer[1]-d3_240_buffer[2]<=-10) ||

 //H1,H4 k2,k3在高點,或H4 k1,k,k3在高點
                    (k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
                    (k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
 
 //m60 kd2,kd3值差>16 或加總>35 
                    (k2_60_buffer[1]-d2_60_buffer[1]<=-16 && k3_60_buffer[1]-d3_60_buffer[2]<=-16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])<=-35) ||
                   
 // m15  ma45,ma90,ma180,ma360,ma650 全斜下    
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00030 && 
                    ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00030 && ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00030 && 
                    ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.00030 &&  ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280) ||

 // m15  ma45,ma90,ma180,ma360,ma650 全斜下  90,180斜度較大,45斜度較小    
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00030 && 
                    ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00040 && ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00040 && 
                    ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.00020 &&  ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280) ||        

 //H4 MACD在範圍外
                   (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001800 ||
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001800) ||

 //H4-K1,K2,K3,MA45  全下降
                   (k1_240_buffer[1]-k1_240_buffer[2]<=-5 && k2_240_buffer[1]-k2_240_buffer[2]<=-5 &&
                    k3_240_buffer[1]-k3_240_buffer[2]<=-5 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-5) ||

 //H1-K1,K2,K3及H4-K1  全下降
                   (k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 &&
                    k3_60_buffer[1]-k3_60_buffer[2]<=0 && k1_240_buffer[1]-k1_240_buffer[2]<=0) ||

 // m15  ma45,ma90斜上,斜度較大,
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00100 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00060) ||
                    
 // H4 ma180,ma360,ma650斜下  ,k1,k2,k3在30下  ,kd1,kd2或kd3   或kd2,kd3開口向上仍大                  
                   (ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00010 && ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00020 && 
                    ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.00020 && 
 // H4 k1,k2或k3皆下降,且K1在30下  
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-4 && k1_240_buffer[1]<=30 &&
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-4 && k2_240_buffer[1]<=30 ||
                    k3_240_buffer[1]-d3_240_buffer[1]<=-4 && k3_240_buffer[1]<=30)) ||
 // H4 k2,k3皆下降,,且在30下 
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-4 && k2_240_buffer[1]<=30 &&
                    k3_240_buffer[1]-d3_240_buffer[1]<=-4 && k3_240_buffer[1]<=30)))
                    return;
                    else      
                    OrderClose(OrderTicket(),lots,Ask,1,Gold);    
 
//*** CLOSE  sell  11  ***************************************************************************************** 
//條件和上相同僅K1[0],KD[0]稍不同  

 //   if ( OrdersTotal()>0 && OrderMagicNumber() == 8811) 
     if ( OrdersTotal()>0 && OrderMagicNumber() != 8810) 
 
 // H4   [1][3]或[1][4]或[1][5]或[1][6]為正
      if (((close_240_buffer[1]-open_240_buffer[1]>=0.00050 &&  close_240_buffer[3]-open_240_buffer[3]>=0.00050) ||
           (close_240_buffer[1]-open_240_buffer[1]>=0.00050 &&  close_240_buffer[4]-open_240_buffer[4]>=0.00050) ||
           (close_240_buffer[1]-open_240_buffer[1]>=0.00050 &&  close_240_buffer[5]-open_240_buffer[5]>=0.00050) ||
           (close_240_buffer[1]-open_240_buffer[1]>=0.00050 &&  close_240_buffer[6]-open_240_buffer[6]>=0.00050)) &&
             
 //ma45或ma90或ma180或ma360或ma650具斜度上升
           (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00030 || ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00030 ||
            ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00030  ||  ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00030 ||
            ma650_240_buffer[1]-ma650_240_buffer[2]>=0.00030) &&      

 // H4 k1,k2或k3皆上升,且K1在25下
           (k1_240_buffer[1]-k1_240_buffer[2]>0 &&  (k2_240_buffer[1]-k2_240_buffer[2]>0 || k3_240_buffer[1]-k3_240_buffer[2]>0) && 
           (k1_240_buffer[1]<=20 ||  (k2_240_buffer[1]<=25 &&  k3_240_buffer[1]<=25))) || 
            
 // H4 k1在低點向上          
           (k1_240_buffer[1]<=20 && k1_240_buffer[1]-k1_240_buffer[2]>=3))
            OrderClose(OrderTicket(),lots,Ask,1,Gold);    

//*** CLOSE  sell  21 ***************************************************************************************** 
 //    if ( OrdersTotal()>0 && OrderMagicNumber() == 8821
    if ( OrdersTotal()>0 && OrderMagicNumber() != 8810) 
             
                  //(m15-66)   h4 的 ma180,ma360,ma650 斜上 或ma180持平 ma360 斜上   
        if   ((ma180_240_buffer[1]-ma180_240_buffer[2]>=-0.00010 && ma360_240_buffer[1]-ma360_240_buffer[2]>=-0.00010 &&
               ma650_240_buffer[1]-ma650_240_buffer[2]>=-0.00010 &&
                  //  macd>=0.00110  <=-0.00110   main && signal >=0.00015   
               macdmainline_240_buffer[1]-macdmainline_240_buffer[2]>=0.000150 && 
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]>=0.000150 &&
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.001100 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.001100 &&
                     //   kd2,kd3>=3  k2,k3<=35     close[4]||[5]||[6]||[7]>close[1]&& [2] 含w底性質         
               k2_240_buffer[1]-d2_240_buffer[1]>=3 && k3_240_buffer[1]-d3_240_buffer[1]>=3 &&
              (close_240_buffer[4]-open_240_buffer[1]<=0 || close_240_buffer[5]-open_240_buffer[1]<=0 ||
               close_240_buffer[6]-open_240_buffer[1]<=0 || close_240_buffer[7]-open_240_buffer[1]<=0 || 
               close_240_buffer[8]-open_240_buffer[1]<=0 || close_240_buffer[9]-open_240_buffer[1]<=0) && 
              (close_240_buffer[4]-close_240_buffer[2]<=0 || close_240_buffer[5]-close_240_buffer[2]<=0 ||
               close_240_buffer[6]-close_240_buffer[2]<=0 || close_240_buffer[7]-close_240_buffer[2]<=0 || 
               close_240_buffer[8]-close_240_buffer[2]<=0 || close_240_buffer[9]-close_240_buffer[2]<=0) && 
               k2_240_buffer[1]<=35 && k3_240_buffer[1]<=35) ||
  
               //(m15-66)   h4 的 ma180,ma360,ma650 斜上 或ma180持平 ma360 斜上   
              (ma180_240_buffer[1]-ma180_240_buffer[2]>=-0.00010 && ma360_240_buffer[1]-ma360_240_buffer[2]>=-0.00010 &&
               ma650_240_buffer[1]-ma650_240_buffer[2]>=-0.00010 &&
                  //  macd>=0.00110  <=-0.00110   main && signal >=0.00015   
               macdmainline_240_buffer[1]-macdmainline_240_buffer[2]>=0.000150 && 
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]>=0.000150 &&
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.001100 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.001100 &&
                     //   kd2,kd3>=3  k2,k3<=35     close[4]||[5]||[6]||[7]>close[1]&& [2] 含w底性質         
               k2_240_buffer[1]-d2_240_buffer[1]>=3 && k3_240_buffer[1]-d3_240_buffer[1]>=3 &&
              (close_240_buffer[4]-open_240_buffer[1]<=0 || close_240_buffer[5]-open_240_buffer[1]<=0 ||
               close_240_buffer[6]-open_240_buffer[1]<=0 || close_240_buffer[7]-open_240_buffer[1]<=0 || 
               close_240_buffer[8]-open_240_buffer[1]<=0 || close_240_buffer[9]-open_240_buffer[1]<=0) && 
              (close_240_buffer[4]-close_240_buffer[2]<=0 || close_240_buffer[5]-close_240_buffer[2]<=0 ||
               close_240_buffer[6]-close_240_buffer[2]<=0 || close_240_buffer[7]-close_240_buffer[2]<=0 || 
               close_240_buffer[8]-close_240_buffer[2]<=0 || close_240_buffer[9]-close_240_buffer[2]<=0) && 
               k2_240_buffer[1]<=35 && k3_240_buffer[1]<=35) ||
              //(m15-67)   h4 的 ma360, ma650 斜上   ma05||ma08||ma12>=-0.0001 
              (ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00010 && ma650_240_buffer[1]-ma650_240_buffer[2]>=0.00010 &&
              (ma05_240_buffer[1]-ma05_240_buffer[2]>=-0.00010 || ma08_240_buffer[1]-ma08_240_buffer[2]>=-0.00010 ||
               ma12_240_buffer[1]-ma12_240_buffer[2]>=-0.00010) &&
                  //ma45,ma90已近持平  [1]-[6]>=-0.0003
               ma45_240_buffer[1]-ma45_240_buffer[6]>=-0.00030 && ma90_240_buffer[1]-ma90_240_buffer[6]>=-0.00030 &&
                // [1]下影大於30點          [2],[3]為負  
              (close_240_buffer[1]-open_240_buffer[1]>=0.00010  && low_240_buffer[1]-open_240_buffer[1]<=-0.00300)  ||
               close_240_buffer[1]-open_240_buffer[1]<=-0.00010  && low_240_buffer[1]-close_240_buffer[1]<=-0.00300)  &&
              (close_240_buffer[2]-open_240_buffer[2]<=-0.00010 || close_240_buffer[3]-open_240_buffer[3]<=-0.00010)  && 
                   //   [5]||[6]||[7]||[8]的開盤價在[1]之下   下上漲後下跌留下影線         
              (open_240_buffer[5]-open_240_buffer[1]<=0 || open_240_buffer[6]-open_240_buffer[1]<=0 ||
               open_240_buffer[7]-open_240_buffer[1]<=0 || open_240_buffer[8]-open_240_buffer[1]<=0 ||
               open_240_buffer[9]-open_240_buffer[1]<=0 || open_240_buffer[10]-open_240_buffer[1]<=0) &&                 //kd2,kd3>=7     
               k2_240_buffer[1]-d2_240_buffer[1]>=3 &&  k3_240_buffer[1]-d3_240_buffer[1]>=3)
               if    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001100 ||
                      macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001100)
                      return;
                      else
                      OrderClose(OrderTicket(),lots,Ask,1,Gold);    


   }
  }  
  }
//***************************************************************************************************************************************
//BUY
//***************************************************************************************************************************************
 
 //********** Buy  1  *********************************************************************************************************************************** 
           
if  (OrdersTotal()<5) 
  
    if ( OrdersTotal()>0 && OrderMagicNumber() == 8801) 
      return;
      else
//m5 k1,k2,k3皆上升,且在50下
     if   ((k1_15_buffer[1]-k1_15_buffer[2]>=3 &&  k2_15_buffer[1]-k2_15_buffer[2]>=1 && k3_15_buffer[1]-k3_15_buffer[2]>=0 &&
            k1_15_buffer[1]<=50 &&   k2_15_buffer[1]<=50 && k3_15_buffer[1]<=50))
            if    (k1_05_buffer[1]-d1_05_buffer[1]>=3 &&   k1_05_buffer[1]<=50)                               
    
 //m60,m240 kd值差全部<-10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]<=-10 && k3_60_buffer[1]-d3_60_buffer[2]<=-10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]<=-10 && k3_240_buffer[1]-d3_240_buffer[2]<=-10) ||

 //H1,H4 k2,k3在高點,或H4 k1,k,k3在高點
                    (k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
                    (k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
 
 //H4 ma05 下降,macd在1550外,收盤離ma05稍有距離或kd1,kd2,kd3有開口且向下
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-7 && k2_240_buffer[1]-d2_240_buffer[1]<=-7 && k3_240_buffer[1]-d3_240_buffer[2]<=-7 &&
                     k2_240_buffer[1]>=50 && k3_240_buffer[1]>=50))) || 

 //H4 ma05 下降,收盤離ma05稍有距離,k1,k2,k3向下
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]<=-1 && k2_240_buffer[1]-k2_240_buffer[2]<=-1 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                     k1_240_buffer[1]>=30) || 
 
 //H4 ma05 下降,收盤離ma05稍有距離,kd1向下,k2或k3 向下
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-6 && (k2_240_buffer[1]-k2_240_buffer[2]<=-1 || k3_240_buffer[1]-k3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=30) || 
                                     
 //H4 ma05 上升趨緩 ([1]-[2])-([2]-[3])<=-0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])<=-0.00030) ||

 //m60,m240 kd1,2,3值差全部<-1
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-1 && k2_60_buffer[1]-d2_60_buffer[1]<=-1 && k3_60_buffer[1]-d3_60_buffer[2]<=-1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-1 && (k2_240_buffer[1]-d2_240_buffer[1]<=-1 || k3_240_buffer[1]-d3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=40) ||
                      
 //m60 kd2,kd3值差>16 或加總>35 
                    (k2_60_buffer[1]-d2_60_buffer[1]<=-16 && k3_60_buffer[1]-d3_60_buffer[2]<=-16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])<=-35) ||
 
 //角度折反 k1在65上
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-4 &&  k1_240_buffer[2]-k1_240_buffer[3]>=4 && k1_240_buffer[1]>=65) ||

 //H4 k1,k2,k3在20下,kd1,kd2,kd3都還向下開口 
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-3 &&  k2_240_buffer[1]-d2_240_buffer[1]<=-3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]<=-3 &&  k1_240_buffer[1]<=20 &&  k2_240_buffer[1]<=20 &&  k3_240_buffer[1]<=20) ||

 //m60 k1,k2,k3在20下,kd1,kd2,kd3都還向下開口 
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-3 &&  k2_60_buffer[1]-d2_60_buffer[1]<=-3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]<=-3 &&  k1_60_buffer[1]<=20 &&  k2_60_buffer[1]<=20 &&  k3_60_buffer[1]<=20) ||

 //m240 ma05[1],ma12[1]差距大於28點 ,開口漸大([1]-[2])<=-10點([2]-[3])<=-8點
                    (ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])<=-0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])<=-0.00050)) ||      

 //m240 k1呈水平狀但k2,k3仍大幅往上 或macd開口尚大               
                    (k1_240_buffer[1]-k1_240_buffer[2]>=-3 && k1_240_buffer[1]-k1_240_buffer[2]<=3 &&
                   ((k2_240_buffer[1]-k2_240_buffer[2]<=-6 && k3_240_buffer[1]-k3_240_buffer[2]<=-6) || 
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001300))) ||
 
 //H1-K1,K2,K3及H4-K1  全下降
                    (k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 &&
                     k3_60_buffer[1]-k3_60_buffer[2]<=0 && k1_240_buffer[1]-k1_240_buffer[2]<=0) ||

 //H4 MACD在範圍外
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001800 ||
                     macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001800) ||

 //m240  k1大幅向上 [1]或[2]須有一為正
                  (((k1_240_buffer[1]-k1_240_buffer[2])-(k1_240_buffer[2]-k1_240_buffer[3])<=-3) && (close_240_buffer[1]-open_240_buffer[1]<=-0.00030 || close_240_buffer[2]-open_240_buffer[2]<=-0.00030)) ||
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-12 && (close_240_buffer[1]-open_240_buffer[1]<=-0.00030 || close_240_buffer[2]-open_240_buffer[2]<=-0.00030)))
                     return;
                     else                         
                     OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-300*Point,Ask+6900*Point,"My order #B1",8801,0,Yellow );

 //********** Buy  2  *********************************************************************************************************************************** 
    
    if ( OrdersTotal()>0 && OrderMagicNumber() == 8802) 
      return;
      else
//    m5 k1,k2,k3皆上升,且在50下,[1]收黑  BUY
     if   ((k1_30_buffer[1]-k1_30_buffer[2]>=3 &&  k2_30_buffer[1]-k2_30_buffer[2]>=1 && k3_30_buffer[1]-k3_30_buffer[2]>=0 &&
            k1_30_buffer[1]<=30 &&   k2_30_buffer[1]<=25 && k3_30_buffer[1]<=25) ||
           (k1_60_buffer[1]-k1_60_buffer[2]>=3 &&  k2_60_buffer[1]-k2_60_buffer[2]>=1 && k3_60_buffer[1]-k3_60_buffer[2]>=0 &&
            k1_60_buffer[1]<=30 &&   k2_60_buffer[1]<=25 && k3_60_buffer[1]<=25))
            if    (k1_05_buffer[1]-d1_05_buffer[1]>=3 &&   k1_05_buffer[1]<=50)                               
    
 //m60,m240 kd值差全部<-10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]<=-10 && k3_60_buffer[1]-d3_60_buffer[2]<=-10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]<=-10 && k3_240_buffer[1]-d3_240_buffer[2]<=-10) ||

 //H1,H4 k2,k3在高點,或H4 k1,k,k3在高點
                    (k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
                    (k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
 
 //H4 ma05 下降,macd在1550外,收盤離ma05稍有距離或kd1,kd2,kd3有開口且向下
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-7 && k2_240_buffer[1]-d2_240_buffer[1]<=-7 && k3_240_buffer[1]-d3_240_buffer[2]<=-7 &&
                     k2_240_buffer[1]>=50 && k3_240_buffer[1]>=50))) ||

 //H4 ma05 下降,收盤離ma05稍有距離,k1,k2,k3向下
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]<=-1 && k2_240_buffer[1]-k2_240_buffer[2]<=-1 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                     k1_240_buffer[1]>=30) || 
 
 //H4 ma05 下降,收盤離ma05稍有距離,kd1向下,k2或k3 向下
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-6 && (k2_240_buffer[1]-k2_240_buffer[2]<=-1 || k3_240_buffer[1]-k3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=30) || 
                                     
 //H4 ma05 上升趨緩 ([1]-[2])-([2]-[3])<=-0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])<=-0.00030) ||

 //m60,m240 kd1,2,3值差全部<-1
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-1 && k2_60_buffer[1]-d2_60_buffer[1]<=-1 && k3_60_buffer[1]-d3_60_buffer[2]<=-1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-1 && (k2_240_buffer[1]-d2_240_buffer[1]<=-1 || k3_240_buffer[1]-d3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=40) ||
                      
 //m60 kd2,kd3值差>16 或加總>35 
                    (k2_60_buffer[1]-d2_60_buffer[1]<=-16 && k3_60_buffer[1]-d3_60_buffer[2]<=-16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])<=-35) ||
 
 //角度折反 k1在65上
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-4 &&  k1_240_buffer[2]-k1_240_buffer[3]>=4 && k1_240_buffer[1]>=65) ||

 //H4 k1,k2,k3在20下,kd1,kd2,kd3都還向下開口 
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-3 &&  k2_240_buffer[1]-d2_240_buffer[1]<=-3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]<=-3 &&  k1_240_buffer[1]<=20 &&  k2_240_buffer[1]<=20 &&  k3_240_buffer[1]<=20) ||

 //m60 k1,k2,k3在20下,kd1,kd2,kd3都還向下開口 
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-3 &&  k2_60_buffer[1]-d2_60_buffer[1]<=-3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]<=-3 &&  k1_60_buffer[1]<=20 &&  k2_60_buffer[1]<=20 &&  k3_60_buffer[1]<=20) ||

 //m240 ma05[1],ma12[1]差距大於28點 ,開口漸大([1]-[2])<=-10點([2]-[3])<=-8點
                    (ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])<=-0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])<=-0.00050)) ||      

 //m240 k1呈水平狀但k2,k3仍大幅往上 或macd開口尚大               
                    (k1_240_buffer[1]-k1_240_buffer[2]>=-3 && k1_240_buffer[1]-k1_240_buffer[2]<=3 &&
                   ((k2_240_buffer[1]-k2_240_buffer[2]<=-6 && k3_240_buffer[1]-k3_240_buffer[2]<=-6) || 
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001300))) ||
 
 //H1-K1,K2,K3及H4-K1  全下降
                    (k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 &&
                     k3_60_buffer[1]-k3_60_buffer[2]<=0 && k1_240_buffer[1]-k1_240_buffer[2]<=0) ||

 //H4 MACD在範圍外
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001800 ||
                     macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001800) ||

 //m240  k1大幅向上 [1]或[2]須有一為正
                  (((k1_240_buffer[1]-k1_240_buffer[2])-(k1_240_buffer[2]-k1_240_buffer[3])<=-3) && (close_240_buffer[1]-open_240_buffer[1]<=-0.00030 || close_240_buffer[2]-open_240_buffer[2]<=-0.00030)) ||
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-12 && (close_240_buffer[1]-open_240_buffer[1]<=-0.00030 || close_240_buffer[2]-open_240_buffer[2]<=-0.00030)))
                     return;
                     else               
                     OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-300*Point,Ask+6900*Point,"My order #B2",8802,0,Aqua);

 //********** Buy  3  *********************************************************************************************************************************** 
    
//用在轉折所以排除條件較少      
 
   if ( OrdersTotal()>0 && OrderMagicNumber() == 8803) 
      return;
      else

     if   ((k1_15_buffer[1]-k1_15_buffer[2]>=6 &&  k1_15_buffer[1]<=25 &&

 // m240須在30下
            k1_15_buffer[1]-d1_15_buffer[1]>=4 && k1_240_buffer[1]<=30 &&
            close_15_buffer[1]-close_15_buffer[2]>=0.00010 && close_15_buffer[1]-close_15_buffer[3]>=0.00010))
           
 //m60,m240 kd值差全部<-10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]<=-10 && k3_60_buffer[1]-d3_60_buffer[2]<=-10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]<=-10 && k3_240_buffer[1]-d3_240_buffer[2]<=-10) ||

 //H1,H4 k2,k3在高點,或H4 k1,k,k3在高點
                    (k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
                    (k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
 
 //H4 ma05 下降,macd在1550外,收盤離ma05稍有距離或kd1,kd2,kd3有開口且向下
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-7 && k2_240_buffer[1]-d2_240_buffer[1]<=-7 && k3_240_buffer[1]-d3_240_buffer[2]<=-7 &&
                      k2_240_buffer[1]>=50 && k3_240_buffer[1]>=50))) ||

 //H4 ma05 下降,收盤離ma05稍有距離,k1,k2,k3向下
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]<=-1 && k2_240_buffer[1]-k2_240_buffer[2]<=-1 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                     k1_240_buffer[1]>=30) || 
 
 //H4 ma05 下降,收盤離ma05稍有距離,kd1向下,k2或k3 向下
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-6 && (k2_240_buffer[1]-k2_240_buffer[2]<=-1 || k3_240_buffer[1]-k3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=30) || 
                                     
 //H4 ma05 上升趨緩 ([1]-[2])-([2]-[3])<=-0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])<=-0.00030) ||

 //m60,m240 kd1,2,3值差全部<-1
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-1 && k2_60_buffer[1]-d2_60_buffer[1]<=-1 && k3_60_buffer[1]-d3_60_buffer[2]<=-1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-1 && (k2_240_buffer[1]-d2_240_buffer[1]<=-1 || k3_240_buffer[1]-d3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=40) ||
                      
 //m60 kd2,kd3值差>16 或加總>35 
                    (k2_60_buffer[1]-d2_60_buffer[1]<=-16 && k3_60_buffer[1]-d3_60_buffer[2]<=-16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])<=-35) ||
 
 //角度折反 k1在65上
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-4 &&  k1_240_buffer[2]-k1_240_buffer[3]>=4 && k1_240_buffer[1]>=65) ||

 //H4 k1,k2,k3在20下,kd1,kd2,kd3都還向下開口 
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-3 &&  k2_240_buffer[1]-d2_240_buffer[1]<=-3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]<=-3 &&  k1_240_buffer[1]<=20 &&  k2_240_buffer[1]<=20 &&  k3_240_buffer[1]<=20) ||

 //m60 k1,k2,k3在20下,kd1,kd2,kd3都還向下開口 
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-3 &&  k2_60_buffer[1]-d2_60_buffer[1]<=-3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]<=-3 &&  k1_60_buffer[1]<=20 &&  k2_60_buffer[1]<=20 &&  k3_60_buffer[1]<=20) ||

 //m240 ma05[1],ma12[1]差距大於28點 ,開口漸大([1]-[2])<=-10點([2]-[3])<=-8點
                    (ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])<=-0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])<=-0.00050)) ||      

 //m240 k1呈水平狀但k2,k3仍大幅往上 或macd開口尚大               
                    (k1_240_buffer[1]-k1_240_buffer[2]>=-3 && k1_240_buffer[1]-k1_240_buffer[2]<=3 &&
                   ((k2_240_buffer[1]-k2_240_buffer[2]<=-6 && k3_240_buffer[1]-k3_240_buffer[2]<=-6) || 
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001300))) ||
 
 //H1-K1,K2,K3及H4-K1  全下降
                    (k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 &&
                     k3_60_buffer[1]-k3_60_buffer[2]<=0 && k1_240_buffer[1]-k1_240_buffer[2]<=0) ||

 //H4 MACD在範圍外
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001800 ||
                     macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001800) ||

 //m240  k1大幅向上 [1]或[2]須有一為正
                  (((k1_240_buffer[1]-k1_240_buffer[2])-(k1_240_buffer[2]-k1_240_buffer[3])<=-3) && (close_240_buffer[1]-open_240_buffer[1]<=-0.00030 || close_240_buffer[2]-open_240_buffer[2]<=-0.00030)) ||
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-12 && (close_240_buffer[1]-open_240_buffer[1]<=-0.00030 || close_240_buffer[2]-open_240_buffer[2]<=-0.00030)))
                     return;
                     else                            
                     OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-300*Point,Ask+6900*Point,"My order #B3",8803,0,Yellow );
 
 //********** Buy  4  *********************************************************************************************************************************** 
    
//用在轉折所以排除條件較少      
 
   if ( OrdersTotal()>0 && OrderMagicNumber() == 8804) 
      return;
      else
   
     if   ((k1_30_buffer[1]-k1_30_buffer[2]>=6 &&  k1_30_buffer[1]<=25 &&
            k1_30_buffer[1]-d1_30_buffer[1]>=4 &&
            close_30_buffer[1]-close_30_buffer[2]>=0.00010 && close_30_buffer[1]-close_30_buffer[3]>=0.00010) ||
           (k1_60_buffer[1]-k1_60_buffer[2]>=6 &&  k1_60_buffer[1]<=25 &&
            k1_60_buffer[1]-d1_60_buffer[1]>=4 &&
            close_60_buffer[1]-close_60_buffer[2]>=0.00010 && close_60_buffer[1]-close_60_buffer[3]>=0.00010))
           
 //m60,m240 kd值差全部<-10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]<=-10 && k3_60_buffer[1]-d3_60_buffer[2]<=-10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]<=-10 && k3_240_buffer[1]-d3_240_buffer[2]<=-10) ||

 //H1,H4 k2,k3在高點,或H4 k1,k,k3在高點
                    (k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
                    (k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
 
 //H4 ma05 下降,macd在1550外,收盤離ma05稍有距離或kd1,kd2,kd3有開口且向下
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-7 && k2_240_buffer[1]-d2_240_buffer[1]<=-7 && k3_240_buffer[1]-d3_240_buffer[2]<=-7 &&
                       k2_240_buffer[1]>=50 && k3_240_buffer[1]>=50))) ||

 //H4 ma05 下降,收盤離ma05稍有距離,k1,k2,k3向下
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]<=-1 && k2_240_buffer[1]-k2_240_buffer[2]<=-1 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                     k1_240_buffer[1]>=30) || 
 
 //H4 ma05 下降,收盤離ma05稍有距離,kd1向下,k2或k3 向下
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-6 && (k2_240_buffer[1]-k2_240_buffer[2]<=-1 || k3_240_buffer[1]-k3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=30) || 
                                     
 //H4 ma05 上升趨緩 ([1]-[2])-([2]-[3])<=-0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])<=-0.00030) ||


 //m60,m240 kd1,2,3值差全部<-1
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-1 && k2_60_buffer[1]-d2_60_buffer[1]<=-1 && k3_60_buffer[1]-d3_60_buffer[2]<=-1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-1 && (k2_240_buffer[1]-d2_240_buffer[1]<=-1 || k3_240_buffer[1]-d3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=40) ||
                      
 //m60 kd2,kd3值差>16 或加總>35 
                    (k2_60_buffer[1]-d2_60_buffer[1]<=-16 && k3_60_buffer[1]-d3_60_buffer[2]<=-16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])<=-35) ||
 
 //角度折反 k1在65上
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-4 &&  k1_240_buffer[2]-k1_240_buffer[3]>=4 && k1_240_buffer[1]>=65) ||

 //H4 k1,k2,k3在20下,kd1,kd2,kd3都還向下開口 
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-3 &&  k2_240_buffer[1]-d2_240_buffer[1]<=-3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]<=-3 &&  k1_240_buffer[1]<=20 &&  k2_240_buffer[1]<=20 &&  k3_240_buffer[1]<=20) ||

 //m60 k1,k2,k3在20下,kd1,kd2,kd3都還向下開口 
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-3 &&  k2_60_buffer[1]-d2_60_buffer[1]<=-3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]<=-3 &&  k1_60_buffer[1]<=20 &&  k2_60_buffer[1]<=20 &&  k3_60_buffer[1]<=20) ||

 //m240 ma05[1],ma12[1]差距大於28點 ,開口漸大([1]-[2])<=-10點([2]-[3])<=-8點
                    (ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])<=-0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])<=-0.00050)) ||      

 //m240 k1呈水平狀但k2,k3仍大幅往上 或macd開口尚大               
                    (k1_240_buffer[1]-k1_240_buffer[2]>=-3 && k1_240_buffer[1]-k1_240_buffer[2]<=3 &&
                   ((k2_240_buffer[1]-k2_240_buffer[2]<=-6 && k3_240_buffer[1]-k3_240_buffer[2]<=-6) || 
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001300))) ||
 
 //H1-K1,K2,K3及H4-K1  全下降
                    (k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 &&
                     k3_60_buffer[1]-k3_60_buffer[2]<=0 && k1_240_buffer[1]-k1_240_buffer[2]<=0) ||

 //H4 MACD在範圍外
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001800 ||
                     macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001800) ||

 //m240  k1大幅向上 [1]或[2]須有一為正
                  (((k1_240_buffer[1]-k1_240_buffer[2])-(k1_240_buffer[2]-k1_240_buffer[3])<=-3) && (close_240_buffer[1]-open_240_buffer[1]<=-0.00030 || close_240_buffer[2]-open_240_buffer[2]<=-0.00030)) ||
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-12 && (close_240_buffer[1]-open_240_buffer[1]<=-0.00030 || close_240_buffer[2]-open_240_buffer[2]<=-0.00030)))
                     return;
                     else                   
                     OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-300*Point,Ask+6900*Point,"My order #B4",8804,0,Aqua);

 //********** Buy  5  *********************************************************************************************************************************** 
    
   if ( OrdersTotal()>0 && OrderMagicNumber() == 8805) 
      return;
      else
   
 //[1]或[2]收正下影過20點
      if((((close_60_buffer[1]-open_60_buffer[1]>=0.00010 && low_60_buffer[1]-open_60_buffer[1]<=-0.00200) || 
           (close_60_buffer[2]-open_60_buffer[2]>=0.00010 && low_60_buffer[2]-open_60_buffer[2]<=-0.00200))  ||
 //或[1]或[2]收負下影過20點
          ((close_60_buffer[1]-open_60_buffer[1]<=-0.00010 && low_60_buffer[1]-close_60_buffer[1]<=-0.00200) || 
           (close_60_buffer[2]-open_60_buffer[2]<=-0.00010 && low_60_buffer[2]-close_60_buffer[2]<=-0.00200))) && 
 //[2]或[3]或[4]中有一收正
           (close_60_buffer[2]-open_60_buffer[2]>=0.00030 || close_60_buffer[3]-open_60_buffer[3]>=0.00030 ||  close_60_buffer[4]-open_60_buffer[4]>=0.00030) &&         
 //ma12,ma05間距不過20點,K1,K2,K3,在50下且上升            
            ma05_60_buffer[1]-ma12_60_buffer[1]>=-0.00200 &&
            k1_60_buffer[1]<=50 &&   k2_60_buffer[1]<=50 && k3_60_buffer[1]<=50 &&
            k1_60_buffer[1]-k1_60_buffer[2]>=1 &&  k2_60_buffer[1]-k2_60_buffer[2]>=1  &&  k3_60_buffer[1]-k3_60_buffer[2]>=1)
            OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-30*Point,Ask+6900*Point,"My order #B5",8805,0,Aqua);

 //********** Buy  6  *********************************************************************************************************************************** 


 //********** Buy  7  *********************************************************************************************************************************** 

    if ( OrdersTotal()>0 && OrderMagicNumber() == 8807) 
      return;
      else

 //ma90或ma190或m240呈上升 ([1]-[2])-([2]-[3])>=0.00010
      if((((ma90_240_buffer[1]-ma90_240_buffer[2]) - (ma90_240_buffer[2]-ma90_240_buffer[3])>=0.00010) ||
          ((ma180_240_buffer[1]-ma180_240_buffer[2]) - (ma180_240_buffer[2]-ma180_240_buffer[3])>=0.00010) ||
          ((ma360_240_buffer[1]-ma360_240_buffer[2]) - (ma360_240_buffer[2]-ma360_240_buffer[3])>=0.00010)) &&
 
 //K1,k2,k3 在低點 kd1交叉上           
           k1_240_buffer[1]<=30  &&  k2_240_buffer[1]<=25 && k3_240_buffer[1]<=25 &&
 
 //m60之ma05與ma12差距在15點內
            ma05_60_buffer[1]-ma12_60_buffer[1]>=-0.00150 &&

 //m240之ma05與ma12差距在35點內
            ma05_240_buffer[1]-ma12_240_buffer[1]>=-0.00350 &&

//m240之ma05與ma12差距在40點內
            ma05_240_buffer[1]-ma12_240_buffer[1]>=-0.00400 && 
          (k1_240_buffer[1]-d1_240_buffer[1]>=2 || k1_240_buffer[1]-k1_240_buffer[2]>=4))
            OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-600*Point,Ask+6900*Point,"My order #B7",8807,0,Aqua);
 
 //********** Buy  8  *********************************************************************************************************************************** 

    if ( OrdersTotal()>0 && OrderMagicNumber() == 8808) 
      return;
      else
          
 // m15 k1,k2,k3皆上升 ,且在50,30下
      if   (k1_15_buffer[1]-k1_15_buffer[2]>=3 &&  k2_15_buffer[1]-k2_15_buffer[2]>=1 && k3_15_buffer[1]-k3_15_buffer[2]>=1 &&
            k1_15_buffer[1]<=50 &&   k2_15_buffer[1]<=30 && k3_15_buffer[1]<=30 &&
             
 //m30,m60,m240全部在30下且開始上升
            k1_30_buffer[0]-k1_30_buffer[1]>=-1 && k1_30_buffer[1]<=30 &&
            k1_60_buffer[0]-k1_60_buffer[1]>=-1 && k1_60_buffer[1]<=30 &&
 //m60之ma05與ma12差距在15點內
            ma05_60_buffer[1]-ma12_60_buffer[1]>=-0.00150 &&
            k1_240_buffer[0]-k1_240_buffer[1]>=-2 && k1_240_buffer[1]<=30 &&
 //m240之ma05與ma12差距在35點內
            ma05_240_buffer[1]-ma12_240_buffer[1]>=-0.00350)

 //H4 k1,k2,k3在20下,kd1,kd2,kd3都還向下開口 
           if    ((k1_240_buffer[1]-d1_240_buffer[1]<=-3 &&  k2_240_buffer[1]-d2_240_buffer[1]<=-3 && 
                   k3_240_buffer[1]-d3_240_buffer[1]<=-3 &&  k1_240_buffer[1]<=20 &&  k2_240_buffer[1]<=20 &&  k3_240_buffer[1]<=20) ||

 //m60 k1,k2,k3在20下,kd1,kd2,kd3都還向下開口 
                  (k1_60_buffer[1]-d1_60_buffer[1]<=-3 &&  k2_60_buffer[1]-d2_60_buffer[1]<=-3 && 
                   k3_60_buffer[1]-d3_60_buffer[1]<=-3 &&  k1_60_buffer[1]<=20 &&  k2_60_buffer[1]<=20 &&  k3_60_buffer[1]<=20) ||
 
 //H1-K1,K2,K3及H4-K1  全下降
                  (k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 &&
                   k3_60_buffer[1]-k3_60_buffer[2]<=0 && k1_240_buffer[1]-k1_240_buffer[2]<=0) ||

 // H4  ma45,ma90,ma180,ma360,ma650 全斜下    
                  (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00030 && 
                   ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00030 && ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00030 && 
                   ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.00030 &&  ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280) ||

 // H4  ma45,ma90,ma180,ma360,ma650 全斜下   90,180斜度較大,45斜度較小    
                  (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00030 && 
                   ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00040 && ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00040 && 
                   ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.00020 &&  ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280) ||        
            
 // H4  ma45,ma90斜下  ,斜度較大,
                  (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00100 && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00060) ||

 // H4 ma180,ma360,ma650斜下  ,k1,k2,k3在30下  ,kd1,kd2或kd3   或kd2,kd3開口向上仍大                  
                  (ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00010 && ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00020 && 
                   ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.00020 && 
 // H4 k1,k2或k3皆下降,且K1在30下  
                  (k1_240_buffer[1]-d1_240_buffer[1]<=-4 && k1_240_buffer[1]<=30 &&
                  (k2_240_buffer[1]-d2_240_buffer[1]<=-4 && k2_240_buffer[1]<=30 ||
                   k3_240_buffer[1]-d3_240_buffer[1]<=-4 && k3_240_buffer[1]<=30)) ||
 // H4 k2,k3皆下降,,且在30下 
                  (k2_240_buffer[1]-d2_240_buffer[1]<=-4 && k2_240_buffer[1]<=30 &&
                   k3_240_buffer[1]-d3_240_buffer[1]<=-4 && k3_240_buffer[1]<=30)))
                   return;
                   else
                   OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-300*Point,Ask+6900*Point,"My order #B8",8808,0,Yellow);
 
 //********** Buy  9  *********************************************************************************************************************************** 

    if ( OrdersTotal()>0 && OrderMagicNumber() == 8809) 
      return;
      else
          
 // m240 k1,k2或k3上升 ,且在30下
      if   (k1_240_buffer[1]<=30 &&   k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30 &&
          ((k1_240_buffer[1]-k1_240_buffer[2]>=3 &&  (k2_240_buffer[1]-k2_240_buffer[2]>=1 || k3_240_buffer[1]-k3_240_buffer[2]>=1)) ||
           (k1_240_buffer[1]-d1_240_buffer[1]>=6 && k2_240_buffer[1]-d2_240_buffer[1]>=-8 &&  k3_240_buffer[1]-d3_240_buffer[1]>=-8))  &&
             
 //m60之ma05與ma12差距在15點內
            ma05_60_buffer[1]-ma12_60_buffer[1]>=-0.00150 &&

 //m240之ma05與ma12差距在35點內
            ma05_240_buffer[1]-ma12_240_buffer[1]>=-0.00350 &&
 //[1][2]為正[3]或[4]為負
            close_240_buffer[1]-open_240_buffer[1]>=0.00040 && close_240_buffer[2]-open_240_buffer[2]>=0 &&
           (close_240_buffer[3]-open_240_buffer[3]<=-0.00040 || close_240_buffer[4]-open_240_buffer[4]<=-0.00040) &&
           
 //ma180或ma360斜上
           (ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00010 || ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00010) &&                      
 
 //[1][2][3]或[2][3][4]開或收盤在ma180上下各12點間
           ((close_240_buffer[2]-ma180_240_buffer[2]>=-0.00120 || close_240_buffer[2]-ma180_240_buffer[2]<=0.00120) &&
            (close_240_buffer[3]-ma180_240_buffer[3]>=-0.00120 || close_240_buffer[3]-ma180_240_buffer[3]<=0.00120) &&
           ((close_240_buffer[4]-ma180_240_buffer[4]>=-0.00120 || close_240_buffer[4]-ma180_240_buffer[4]<=0.00120) ||
            (close_240_buffer[1]-ma180_240_buffer[1]>=-0.00120 || close_240_buffer[1]-ma180_240_buffer[1]<=0.00120))) ||
          
 //或[1][2][3]或[2][3][4]開或收盤在ma360上下各12點間
           ((close_240_buffer[2]-ma360_240_buffer[2]>=-0.00120 || close_240_buffer[2]-ma360_240_buffer[2]<=0.00120) &&
            (close_240_buffer[3]-ma360_240_buffer[3]>=-0.00120 || close_240_buffer[3]-ma360_240_buffer[3]<=0.00120) &&
           ((close_240_buffer[4]-ma360_240_buffer[4]>=-0.00120 || close_240_buffer[4]-ma360_240_buffer[4]<=0.00120) ||
            (close_240_buffer[1]-ma360_240_buffer[1]>=-0.00120 || close_240_buffer[1]-ma360_240_buffer[1]<=0.00120))))
            OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-600*Point,Ask+6900*Point,"My order #B9",8809,0,Aqua);

 //********** Buy  10  *********************************************************************************************************************************** 
   //用在轉折所以排除條件較少      

    if ( OrdersTotal()>0 && OrderMagicNumber() == 8810) 
      return;
      else
 // m15 k1,k2,k3皆上升 ,且在50,30下
      if   (k1_15_buffer[1]-k1_15_buffer[2]>=3 &&  k2_15_buffer[1]-k2_15_buffer[2]>=1 && k3_15_buffer[1]-k3_15_buffer[2]>=1 &&
            k1_15_buffer[1]<=50 &&   k2_15_buffer[1]<=30 && k3_15_buffer[1]<=30 &&
             
 // m30 k1,k2或k3皆上升 ,且在40,30下
           (k1_30_buffer[1]-k1_30_buffer[2]>=1 &&  (k2_30_buffer[1]-k2_30_buffer[2]>=1 || k3_30_buffer[1]-k3_30_buffer[2]>=1) && 
            k1_30_buffer[1]<=40 && k2_30_buffer[1]<=30 && k3_30_buffer[1]<=30) &&
 
 // m60 k1,k2或k3皆上升 ,且在40,30下或[0]較大幅度上升 
         (((k1_60_buffer[1]-k1_60_buffer[2]>=1 &&  (k2_60_buffer[1]-k2_60_buffer[2]>=1 || k3_60_buffer[1]-k3_60_buffer[2]>=1)) || 
           (k1_60_buffer[0]-k1_60_buffer[1]>=5 && k1_60_buffer[0]-d1_60_buffer[0]>=2))  &&
            k1_60_buffer[1]<=40 && k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30)) 
 
 //m60,m240 kd值差全部<-10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]<=-10 && k3_60_buffer[1]-d3_60_buffer[2]<=-10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]<=-10 && k3_240_buffer[1]-d3_240_buffer[2]<=-10) ||

 //H1,H4 k2,k3在高點,或H4 k1,k,k3在高點
                    (k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
                    (k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
 
 //m60 kd2,kd3值差>16 或加總>35 
                    (k2_60_buffer[1]-d2_60_buffer[1]<=-16 && k3_60_buffer[1]-d3_60_buffer[2]<=-16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])<=-35) ||
                   
 // m15  ma45,ma90,ma180,ma360,ma650 全斜下    
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00030 && 
                    ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00030 && ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00030 && 
                    ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.00030 &&  ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280) ||

 // m15  ma45,ma90,ma180,ma360,ma650 全斜下  90,180斜度較大,45斜度較小    
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00030 && 
                    ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00040 && ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00040 && 
                    ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.00020 &&  ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280) ||        

 //H4 MACD在範圍外
                   (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001800 ||
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001800) ||

 //H4-K1,K2,K3,MA45  全下降
                   (k1_240_buffer[1]-k1_240_buffer[2]<=-5 && k2_240_buffer[1]-k2_240_buffer[2]<=-5 &&
                    k3_240_buffer[1]-k3_240_buffer[2]<=-5 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-5) ||

 //H1-K1,K2,K3及H4-K1  全下降
                   (k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 &&
                    k3_60_buffer[1]-k3_60_buffer[2]<=0 && k1_240_buffer[1]-k1_240_buffer[2]<=0) ||

 // m15  ma45,ma90斜上,斜度較大,
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00100 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00060) ||
                    
 // H4 ma180,ma360,ma650斜下  ,k1,k2,k3在30下  ,kd1,kd2或kd3   或kd2,kd3開口向上仍大                  
                   (ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00010 && ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00020 && 
                    ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.00020 && 
 // H4 k1,k2或k3皆下降,且K1在30下  
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-4 && k1_240_buffer[1]<=30 &&
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-4 && k2_240_buffer[1]<=30 ||
                    k3_240_buffer[1]-d3_240_buffer[1]<=-4 && k3_240_buffer[1]<=30)) ||
 // H4 k2,k3皆下降,,且在30下 
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-4 && k2_240_buffer[1]<=30 &&
                    k3_240_buffer[1]-d3_240_buffer[1]<=-4 && k3_240_buffer[1]<=30)))
                    return;
                    else      
                    OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-300*Point,Ask+2000*Point,"My order #B10",8810,0,Aqua);
 

 //********** Buy  11  *********************************************************************************************************************************** 
//條件和上相同僅K1[0],KD[0]稍不同  

    if ( OrdersTotal()>0 && OrderMagicNumber() == 8811) 
      return;
      else
 // H4   [1][3]或[1][4]或[1][5]或[1][6]為正
      if (((close_240_buffer[1]-open_240_buffer[1]>=0.00050 &&  close_240_buffer[3]-open_240_buffer[3]>=0.00050) ||
           (close_240_buffer[1]-open_240_buffer[1]>=0.00050 &&  close_240_buffer[4]-open_240_buffer[4]>=0.00050) ||
           (close_240_buffer[1]-open_240_buffer[1]>=0.00050 &&  close_240_buffer[5]-open_240_buffer[5]>=0.00050) ||
           (close_240_buffer[1]-open_240_buffer[1]>=0.00050 &&  close_240_buffer[6]-open_240_buffer[6]>=0.00050)) &&
             
 //ma45或ma90或ma180或ma360或ma650具斜度上升
           (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00030 || ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00030 ||
            ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00030  ||  ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00030 ||
            ma650_240_buffer[1]-ma650_240_buffer[2]>=0.00030) &&      

 // H4 k1,k2或k3皆上升,且K1在25下
           (k1_240_buffer[1]-k1_240_buffer[2]>0 &&  (k2_240_buffer[1]-k2_240_buffer[2]>0 || k3_240_buffer[1]-k3_240_buffer[2]>0) && 
           (k1_240_buffer[1]<=20 ||  (k2_240_buffer[1]<=25 &&  k3_240_buffer[1]<=25))) || 
            
 // H4 k1在低點向上          
           (k1_240_buffer[1]<=20 && k1_240_buffer[1]-k1_240_buffer[2]>=3))
            OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-300*Point,Ask+6900*Point,"My order #B11",8811,0,Yellow);



  //+++++++++++++++++++++++++++++++++++++++++++   BUY   21   ++++++++++++++++++++++++++++++++++++++++++++++++++          
 if ( OrdersTotal()>0 && OrderMagicNumber() == 8821) 
      return;
      else
             
                  //(m15-66)   h4 的 ma180,ma360,ma650 斜上 或ma180持平 ma360 斜上   
        if   ((ma180_240_buffer[1]-ma180_240_buffer[2]>=-0.00010 && ma360_240_buffer[1]-ma360_240_buffer[2]>=-0.00010 &&
               ma650_240_buffer[1]-ma650_240_buffer[2]>=-0.00010 &&
                  //  macd>=0.00110  <=-0.00110   main && signal >=0.00015   
               macdmainline_240_buffer[1]-macdmainline_240_buffer[2]>=0.000150 && 
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]>=0.000150 &&
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.001100 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.001100 &&
                     //   kd2,kd3>=3  k2,k3<=35     close[4]||[5]||[6]||[7]>close[1]&& [2] 含w底性質         
               k2_240_buffer[1]-d2_240_buffer[1]>=3 && k3_240_buffer[1]-d3_240_buffer[1]>=3 &&
              (close_240_buffer[4]-open_240_buffer[1]<=0 || close_240_buffer[5]-open_240_buffer[1]<=0 ||
               close_240_buffer[6]-open_240_buffer[1]<=0 || close_240_buffer[7]-open_240_buffer[1]<=0 || 
               close_240_buffer[8]-open_240_buffer[1]<=0 || close_240_buffer[9]-open_240_buffer[1]<=0) && 
              (close_240_buffer[4]-close_240_buffer[2]<=0 || close_240_buffer[5]-close_240_buffer[2]<=0 ||
               close_240_buffer[6]-close_240_buffer[2]<=0 || close_240_buffer[7]-close_240_buffer[2]<=0 || 
               close_240_buffer[8]-close_240_buffer[2]<=0 || close_240_buffer[9]-close_240_buffer[2]<=0) && 
               k2_240_buffer[1]<=35 && k3_240_buffer[1]<=35) ||
  
               //(m15-66)   h4 的 ma180,ma360,ma650 斜上 或ma180持平 ma360 斜上   
              (ma180_240_buffer[1]-ma180_240_buffer[2]>=-0.00010 && ma360_240_buffer[1]-ma360_240_buffer[2]>=-0.00010 &&
               ma650_240_buffer[1]-ma650_240_buffer[2]>=-0.00010 &&
                  //  macd>=0.00110  <=-0.00110   main && signal >=0.00015   
               macdmainline_240_buffer[1]-macdmainline_240_buffer[2]>=0.000150 && 
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]>=0.000150 &&
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.001100 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.001100 &&
                     //   kd2,kd3>=3  k2,k3<=35     close[4]||[5]||[6]||[7]>close[1]&& [2] 含w底性質         
               k2_240_buffer[1]-d2_240_buffer[1]>=3 && k3_240_buffer[1]-d3_240_buffer[1]>=3 &&
              (close_240_buffer[4]-open_240_buffer[1]<=0 || close_240_buffer[5]-open_240_buffer[1]<=0 ||
               close_240_buffer[6]-open_240_buffer[1]<=0 || close_240_buffer[7]-open_240_buffer[1]<=0 || 
               close_240_buffer[8]-open_240_buffer[1]<=0 || close_240_buffer[9]-open_240_buffer[1]<=0) && 
              (close_240_buffer[4]-close_240_buffer[2]<=0 || close_240_buffer[5]-close_240_buffer[2]<=0 ||
               close_240_buffer[6]-close_240_buffer[2]<=0 || close_240_buffer[7]-close_240_buffer[2]<=0 || 
               close_240_buffer[8]-close_240_buffer[2]<=0 || close_240_buffer[9]-close_240_buffer[2]<=0) && 
               k2_240_buffer[1]<=35 && k3_240_buffer[1]<=35) ||
              //(m15-67)   h4 的 ma360, ma650 斜上   ma05||ma08||ma12>=-0.0001 
              (ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00010 && ma650_240_buffer[1]-ma650_240_buffer[2]>=0.00010 &&
              (ma05_240_buffer[1]-ma05_240_buffer[2]>=-0.00010 || ma08_240_buffer[1]-ma08_240_buffer[2]>=-0.00010 ||
               ma12_240_buffer[1]-ma12_240_buffer[2]>=-0.00010) &&
                  //ma45,ma90已近持平  [1]-[6]>=-0.0003
               ma45_240_buffer[1]-ma45_240_buffer[6]>=-0.00030 && ma90_240_buffer[1]-ma90_240_buffer[6]>=-0.00030 &&
                // [1]下影大於30點          [2],[3]為負  
              (close_240_buffer[1]-open_240_buffer[1]>=0.00010  && low_240_buffer[1]-open_240_buffer[1]<=-0.00300)  ||
               close_240_buffer[1]-open_240_buffer[1]<=-0.00010  && low_240_buffer[1]-close_240_buffer[1]<=-0.00300)  &&
              (close_240_buffer[2]-open_240_buffer[2]<=-0.00010 || close_240_buffer[3]-open_240_buffer[3]<=-0.00010)  && 
                   //   [5]||[6]||[7]||[8]的開盤價在[1]之下   下上漲後下跌留下影線         
              (open_240_buffer[5]-open_240_buffer[1]<=0 || open_240_buffer[6]-open_240_buffer[1]<=0 ||
               open_240_buffer[7]-open_240_buffer[1]<=0 || open_240_buffer[8]-open_240_buffer[1]<=0 ||
               open_240_buffer[9]-open_240_buffer[1]<=0 || open_240_buffer[10]-open_240_buffer[1]<=0) &&                 //kd2,kd3>=7     
               k2_240_buffer[1]-d2_240_buffer[1]>=3 &&  k3_240_buffer[1]-d3_240_buffer[1]>=3)
               if    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001100 ||
                      macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001100)
                      return;
                      else
                      OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-300*Point,Ask+3000*Point,"My order #B21",8821,0,OrangeRed );



//***************************************************************************************************************************************
//SELL
//***************************************************************************************************************************************
 //********** Sell  1  *********************************************************************************************************************************** 
    
    if  ( OrdersTotal()>0 && OrderMagicNumber()==4401) 
       return;
       else
 // m15 k1,k2,k3皆下降,且在50上,[1]收紅 [2]收黑 SELL
      if  ((k1_15_buffer[1]-k1_15_buffer[2]<=-3 &&  k2_15_buffer[1]-k2_15_buffer[2]<=-1 && k3_15_buffer[1]-k3_15_buffer[2]<=0 &&
            k1_15_buffer[1]>=50 &&   k2_15_buffer[1]>=50 && k3_15_buffer[1]>=50)) 
          if  (k1_05_buffer[1]-d1_05_buffer[1]<=-3 &&   k1_05_buffer[1]>=50)                               
          
 //H1,H4 kd值差全部>10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]>=10 && k3_60_buffer[1]-d3_60_buffer[2]>=10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]>=10 && k3_240_buffer[1]-d3_240_buffer[2]>=10) ||
 
 //H1,H4 k2,k3在低點,或H4 k1,k,k3在低點
                    (k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
                    (k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
 
 //H4 ma05 上升,macd在1150外,收盤離ma05稍有距離或kd1,kd2,kd3有開口且向上
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]>=7 && k2_240_buffer[1]-d2_240_buffer[1]>=7 && k3_240_buffer[1]-d3_240_buffer[2]>=7 &&
                     k2_240_buffer[1]<=50 && k3_240_buffer[1]<=50))) || 
 
 //H4 ma05 上升,收盤離ma05稍有距離,k1,k2,k3向上
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]>=1 && k2_240_buffer[1]-k2_240_buffer[2]>=1 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                     k1_240_buffer[1]<=70) || 

 //H4 ma05 上升,收盤離ma05稍有距離,kd1向上,k2或k3 向上
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=6 && (k2_240_buffer[1]-k2_240_buffer[2]>=1 || k3_240_buffer[1]-k3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=70) || 
                                     
 //H4 ma05 下降趨緩 ([1]-[2])-([2]-[3])>=0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])>=0.00030) ||

//H1,H4 kd1,2,3值差全部>1
                    (k1_60_buffer[1]-d1_60_buffer[1]>=1 && k2_60_buffer[1]-d2_60_buffer[1]>=1 && k3_60_buffer[1]-d3_60_buffer[2]>=1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=1 && (k2_240_buffer[1]-d2_240_buffer[1]>=1 || k3_240_buffer[1]-d3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=60) ||
       
 //H1 kd2,kd3值差>16 或加總>35
                    (k2_60_buffer[1]-d2_60_buffer[1]>=16 && k3_60_buffer[1]-d3_60_buffer[2]>=16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])>=35) ||
       
 //H4 角度折反 k1在35下
                    (k1_240_buffer[1]-k1_240_buffer[2]>=4 &&  k1_240_buffer[2]-k1_240_buffer[3]<=-4 && k1_240_buffer[1]<=35) ||

 //H4 k1,k2,k3在80上,kd1,kd2,kd3都還向上開口 
                    (k1_240_buffer[1]-d1_240_buffer[1]>=3 &&  k2_240_buffer[1]-d2_240_buffer[1]>=3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]>=3 &&  k1_240_buffer[1]>=80 &&  k2_240_buffer[1]>=80 &&  k3_240_buffer[1]>=80) ||
 
 //m60 k1,k2,k3在80上,kd1,kd2,kd3都還向上開口 
                    (k1_60_buffer[1]-d1_60_buffer[1]>=3 &&  k2_60_buffer[1]-d2_60_buffer[1]>=3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]>=3 &&  k1_60_buffer[1]>=80 &&  k2_60_buffer[1]>=80 &&  k3_60_buffer[1]>=80) ||
          
 //H4 ma05[1],ma12[1]差距大於28點 ,開口漸大([1]-[2])>=10點([2]-[3])>=8點
                    (ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])>=0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])>=0.00050)) ||      
               
 //H4 k1呈水平狀但k2,k3仍大幅往上 或macd開口尚大               
                   (k1_240_buffer[1]-k1_240_buffer[2]<=3 && k1_240_buffer[1]-k1_240_buffer[2]>=-3 &&
                  ((k2_240_buffer[1]-k2_240_buffer[2]>=6 && k3_240_buffer[1]-k3_240_buffer[2]>=6) || 
                   (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001300))) ||
              
 //H1-K1,K2,K3及H4-K1  全上揚
                   (k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 &&
                    k3_60_buffer[1]-k3_60_buffer[2]>=0 && k1_240_buffer[1]-k1_240_buffer[2]>=0) ||
                    
                    
 // m15  ma45,ma90,ma180,ma360,ma650 全斜上    
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00030 && 
                    ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00030 && ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00030 && 
                    ma650_240_buffer[1]-ma650_240_buffer[2]>=0.00030 &&  ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280) ||

 // m15  ma45,ma90,ma180,ma360,ma650 全斜上 90,180斜度較大,45斜度較小    
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00030 && 
                    ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00040 && ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00040 && 
                    ma650_240_buffer[1]-ma650_240_buffer[2]>=0.00020 &&  ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280) ||        
            
 // m15  ma45,ma90斜上,斜度較大,
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00100 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00060) ||

 //H4 MACD在範圍外
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001800 ||
                     macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001800) ||

//H4  k1大幅向上 [1]或[2]須有一為正
                 (((k1_240_buffer[1]-k1_240_buffer[2])-(k1_240_buffer[2]-k1_240_buffer[3])>=3) && (close_240_buffer[1]-open_240_buffer[1]>=0.00030 || close_240_buffer[2]-open_240_buffer[2]>=0.00030)) ||
                   (k1_240_buffer[1]-k1_240_buffer[2]>=12 && (close_240_buffer[1]-open_240_buffer[1]>=0.00030 || close_240_buffer[2]-open_240_buffer[2]>=0.00030)))
                    return;
                    else
                    OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+300*Point,Bid-6900*Point,"My order #S1",4401,0,Blue);

 //********** Sell  2  *********************************************************************************************************************************** 
    if  ( OrdersTotal()>0 && OrderMagicNumber()==4402) 
       return;
       else
          
 //    m5 k1,k2,k3皆下降,且在50上,[1]收紅 [2]收黑 SELL
      if  ((k1_30_buffer[1]-k1_30_buffer[2]<=-3 &&  k2_30_buffer[1]-k2_30_buffer[2]<=-1 && k3_30_buffer[1]-k3_30_buffer[2]<=0 &&
            k1_30_buffer[1]>=70 &&   k2_30_buffer[1]>=75 && k3_30_buffer[1]>=75)||
           (k1_60_buffer[1]-k1_60_buffer[2]<=-3 &&  k2_60_buffer[1]-k2_60_buffer[2]<=-1 && k3_60_buffer[1]-k3_60_buffer[2]<=0 &&
            k1_60_buffer[1]>=70 &&   k2_60_buffer[1]>=75 && k3_60_buffer[1]>=75)) 
          if  (k1_05_buffer[1]-d1_05_buffer[1]<=-3 &&   k1_05_buffer[1]>=50)                               
     
   
 //H1,H4 kd值差全部>10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]>=10 && k3_60_buffer[1]-d3_60_buffer[2]>=10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]>=10 && k3_240_buffer[1]-d3_240_buffer[2]>=10) ||
 
 //H1,H4 k2,k3在低點,或H4 k1,k,k3在低點
                    (k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
                    (k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
 
 //H4 ma05 上升,macd在1150外,收盤離ma05稍有距離或kd1,kd2,kd3有開口且向上
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]>=7 && k2_240_buffer[1]-d2_240_buffer[1]>=7 && k3_240_buffer[1]-d3_240_buffer[2]>=7 &&
                     k2_240_buffer[1]<=50 && k3_240_buffer[1]<=50))) || 
 
 //H4 ma05 上升,收盤離ma05稍有距離,k1,k2,k3向上
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]>=1 && k2_240_buffer[1]-k2_240_buffer[2]>=1 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                     k1_240_buffer[1]<=70) || 

 //H4 ma05 上升,收盤離ma05稍有距離,kd1向上,k2或k3 向上
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=6 && (k2_240_buffer[1]-k2_240_buffer[2]>=1 || k3_240_buffer[1]-k3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=70) || 
                                     
 //H4 ma05 下降趨緩 ([1]-[2])-([2]-[3])>=0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])>=0.00030) ||

 //H1,H4 kd1,2,3值差全部>1
                    (k1_60_buffer[1]-d1_60_buffer[1]>=1 && k2_60_buffer[1]-d2_60_buffer[1]>=1 && k3_60_buffer[1]-d3_60_buffer[2]>=1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=1 && (k2_240_buffer[1]-d2_240_buffer[1]>=1 || k3_240_buffer[1]-d3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=60) ||
       
 //H1 kd2,kd3值差>16 或加總>35
                    (k2_60_buffer[1]-d2_60_buffer[1]>=16 && k3_60_buffer[1]-d3_60_buffer[2]>=16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])>=35) ||
       
 //H4 角度折反 k1在35下
                    (k1_240_buffer[1]-k1_240_buffer[2]>=4 &&  k1_240_buffer[2]-k1_240_buffer[3]<=-4 && k1_240_buffer[1]<=35) ||
          
 //H4 k1,k2,k3在80上,kd1,kd2,kd3都還向上開口 
                    (k1_240_buffer[1]-d1_240_buffer[1]>=3 &&  k2_240_buffer[1]-d2_240_buffer[1]>=3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]>=3 &&  k1_240_buffer[1]>=80 &&  k2_240_buffer[1]>=80 &&  k3_240_buffer[1]>=80) ||
 
 //m60 k1,k2,k3在80上,kd1,kd2,kd3都還向上開口 
                    (k1_60_buffer[1]-d1_60_buffer[1]>=3 &&  k2_60_buffer[1]-d2_60_buffer[1]>=3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]>=3 &&  k1_60_buffer[1]>=80 &&  k2_60_buffer[1]>=80 &&  k3_60_buffer[1]>=80) ||

 //H4 ma05[1],ma12[1]差距大於28點 ,開口漸大([1]-[2])>=10點([2]-[3])>=8點
                    (ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])>=0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])>=0.00050)) ||      
               
 //H4 k1呈水平狀但k2,k3仍大幅往上 或macd開口尚大               
                   (k1_240_buffer[1]-k1_240_buffer[2]<=3 && k1_240_buffer[1]-k1_240_buffer[2]>=-3 &&
                  ((k2_240_buffer[1]-k2_240_buffer[2]>=6 && k3_240_buffer[1]-k3_240_buffer[2]>=6) || 
                   (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001300))) ||
              
 //H1-K1,K2,K3及H4-K1  全上揚
                   (k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 &&
                    k3_60_buffer[1]-k3_60_buffer[2]>=0 && k1_240_buffer[1]-k1_240_buffer[2]>=0) ||

  // m15  ma45,ma90,ma180,ma360,ma650 全斜上    
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00030 && 
                    ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00030 && ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00030 && 
                    ma650_240_buffer[1]-ma650_240_buffer[2]>=0.00030 &&  ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280) ||

 // m15  ma45,ma90,ma180,ma360,ma650 全斜上 90,180斜度較大,45斜度較小    
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00030 && 
                    ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00040 && ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00040 && 
                    ma650_240_buffer[1]-ma650_240_buffer[2]>=0.00020 &&  ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280) ||        
            
 // m15  ma45,ma90斜上,斜度較大,
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00100 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00060) ||

 //H4 MACD在範圍外
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001800 ||
                     macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001800) ||

 //H4  k1大幅向上 [1]或[2]須有一為正
                 (((k1_240_buffer[1]-k1_240_buffer[2])-(k1_240_buffer[2]-k1_240_buffer[3])>=3) && (close_240_buffer[1]-open_240_buffer[1]>=0.00030 || close_240_buffer[2]-open_240_buffer[2]>=0.00030)) ||
                   (k1_240_buffer[1]-k1_240_buffer[2]>=12 && (close_240_buffer[1]-open_240_buffer[1]>=0.00030 || close_240_buffer[2]-open_240_buffer[2]>=0.00030)))
                    return;
                    else
                    OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+300*Point,Bid-6900*Point,"My order #S2",4402,0,Green);

 //********** Sell  3  *********************************************************************************************************************************** 

//用在轉折所以排除條件較少      
 
    if ( OrdersTotal()>0 && OrderMagicNumber() == 4403 ) 
      return;
      else

      if  ((k1_15_buffer[1]-k1_15_buffer[2]<=-6 &&  k1_15_buffer[1]>=75 &&
 // m240須在70上
            k1_15_buffer[1]-d1_15_buffer[1]<=-4 &&  k1_240_buffer[1]>=70 &&
            close_15_buffer[1]-close_15_buffer[2]<=-0.00010))

 //H1,H4 kd值差全部>10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]>=10 && k3_60_buffer[1]-d3_60_buffer[2]>=10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]>=10 && k3_240_buffer[1]-d3_240_buffer[2]>=10) ||
 
 //H1,H4 k2,k3在低點,或H4 k1,k,k3在低點
                    (k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
                    (k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
 
 //H4 ma05 上升,macd在1150外,收盤離ma05稍有距離或kd1,kd2,kd3有開口且向上
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]>=7 && k2_240_buffer[1]-d2_240_buffer[1]>=7 && k3_240_buffer[1]-d3_240_buffer[2]>=7 &&
                     k2_240_buffer[1]<=50 && k3_240_buffer[1]<=50))) || 
 
 //H4 ma05 上升,收盤離ma05稍有距離,k1,k2,k3向上
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]>=1 && k2_240_buffer[1]-k2_240_buffer[2]>=1 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                     k1_240_buffer[1]<=70) || 

 //H4 ma05 上升,收盤離ma05稍有距離,kd1向上,k2或k3 向上
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=6 && (k2_240_buffer[1]-k2_240_buffer[2]>=1 || k3_240_buffer[1]-k3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=70) || 
                                     
 //H4 ma05 下降趨緩 ([1]-[2])-([2]-[3])>=0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])>=0.00030) ||

 //H1,H4 kd1,2,3值差全部>1
                    (k1_60_buffer[1]-d1_60_buffer[1]>=1 && k2_60_buffer[1]-d2_60_buffer[1]>=1 && k3_60_buffer[1]-d3_60_buffer[2]>=1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=1 && (k2_240_buffer[1]-d2_240_buffer[1]>=1 || k3_240_buffer[1]-d3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=60) ||
       
 //H1 kd2,kd3值差>16 或加總>35
                    (k2_60_buffer[1]-d2_60_buffer[1]>=16 && k3_60_buffer[1]-d3_60_buffer[2]>=16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])>=35) ||
       
 //H4 角度折反 k1在35下
                    (k1_240_buffer[1]-k1_240_buffer[2]>=4 &&  k1_240_buffer[2]-k1_240_buffer[3]<=-4 && k1_240_buffer[1]<=35) ||
          
 //H4 k1,k2,k3在80上,kd1,kd2,kd3都還向上開口 
                    (k1_240_buffer[1]-d1_240_buffer[1]>=3 &&  k2_240_buffer[1]-d2_240_buffer[1]>=3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]>=3 &&  k1_240_buffer[1]>=80 &&  k2_240_buffer[1]>=80 &&  k3_240_buffer[1]>=80) ||
 
 //m60 k1,k2,k3在80上,kd1,kd2,kd3都還向上開口 
                    (k1_60_buffer[1]-d1_60_buffer[1]>=3 &&  k2_60_buffer[1]-d2_60_buffer[1]>=3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]>=3 &&  k1_60_buffer[1]>=80 &&  k2_60_buffer[1]>=80 &&  k3_60_buffer[1]>=80) ||

 //H4 ma05[1],ma12[1]差距大於28點 ,開口漸大([1]-[2])>=10點([2]-[3])>=8點
                    (ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])>=0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])>=0.00050)) ||      
               
 //H4 k1呈水平狀但k2,k3仍大幅往上 或macd開口尚大               
                   (k1_240_buffer[1]-k1_240_buffer[2]<=3 && k1_240_buffer[1]-k1_240_buffer[2]>=-3 &&
                  ((k2_240_buffer[1]-k2_240_buffer[2]>=6 && k3_240_buffer[1]-k3_240_buffer[2]>=6) || 
                   (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001300))) ||
              
 //H1-K1,K2,K3及H4-K1  全上揚
                   (k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 &&
                    k3_60_buffer[1]-k3_60_buffer[2]>=0 && k1_240_buffer[1]-k1_240_buffer[2]>=0) ||

  // m15  ma45,ma90,ma180,ma360,ma650 全斜上    
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00030 && 
                    ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00030 && ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00030 && 
                    ma650_240_buffer[1]-ma650_240_buffer[2]>=0.00030 &&  ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280) ||

 // m15  ma45,ma90,ma180,ma360,ma650 全斜上 90,180斜度較大,45斜度較小    
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00030 && 
                    ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00040 && ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00040 && 
                    ma650_240_buffer[1]-ma650_240_buffer[2]>=0.00020 &&  ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280) ||        
            
 // m15  ma45,ma90斜上,斜度較大,
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00100 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00060) ||

 //H4 MACD在範圍外
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001800 ||
                     macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001800) ||

 //H4  k1大幅向上 [1]或[2]須有一為正
                 (((k1_240_buffer[1]-k1_240_buffer[2])-(k1_240_buffer[2]-k1_240_buffer[3])>=3) && (close_240_buffer[1]-open_240_buffer[1]>=0.00030 || close_240_buffer[2]-open_240_buffer[2]>=0.00030)) ||
                   (k1_240_buffer[1]-k1_240_buffer[2]>=12 && (close_240_buffer[1]-open_240_buffer[1]>=0.00030 || close_240_buffer[2]-open_240_buffer[2]>=0.00030)))
                    return;
                    else
                    OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+300*Point,Bid-6900*Point,"My order #S3",4403,0,Blue);
              
 //********** Sell  4  *********************************************************************************************************************************** 

    if ( OrdersTotal()>0 && OrderMagicNumber() == 4404) 
      return;
      else

      if  ((k1_30_buffer[1]-k1_30_buffer[2]<=-6 &&  k1_30_buffer[1]>=75 &&
            k1_30_buffer[1]-d1_30_buffer[1]<=-4 &&
            close_30_buffer[1]-close_30_buffer[2]<=-0.00010 && close_30_buffer[1]-close_30_buffer[3]<=-0.00010) ||
           (k1_60_buffer[1]-k1_60_buffer[2]<=-6 &&  k1_60_buffer[1]>=75 &&
            k1_60_buffer[1]-d1_60_buffer[1]<=-4 &&
            close_60_buffer[1]-close_60_buffer[2]<=-0.00010 && close_60_buffer[1]-close_60_buffer[3]<=-0.00010))

 //H1,H4 kd值差全部>10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]>=10 && k3_60_buffer[1]-d3_60_buffer[2]>=10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]>=10 && k3_240_buffer[1]-d3_240_buffer[2]>=10) ||
 
 //H1,H4 k2,k3在低點,或H4 k1,k,k3在低點
                    (k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
                    (k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
 
 //H4 ma05 上升,macd在1150外,收盤離ma05稍有距離或kd1,kd2,kd3有開口且向上
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]>=7 && k2_240_buffer[1]-d2_240_buffer[1]>=7 && k3_240_buffer[1]-d3_240_buffer[2]>=7 &&
                     k2_240_buffer[1]<=50 && k3_240_buffer[1]<=50))) || 
 
 //H4 ma05 上升,收盤離ma05稍有距離,k1,k2,k3向上
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]>=1 && k2_240_buffer[1]-k2_240_buffer[2]>=1 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                     k1_240_buffer[1]<=70) || 

 //H4 ma05 上升,收盤離ma05稍有距離,kd1向上,k2或k3 向上
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=6 && (k2_240_buffer[1]-k2_240_buffer[2]>=1 || k3_240_buffer[1]-k3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=70) || 
                                     
 //H4 ma05 下降趨緩 ([1]-[2])-([2]-[3])>=0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])>=0.00030) ||

 //H1,H4 kd1,2,3值差全部>1
                    (k1_60_buffer[1]-d1_60_buffer[1]>=1 && k2_60_buffer[1]-d2_60_buffer[1]>=1 && k3_60_buffer[1]-d3_60_buffer[2]>=1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=1 && (k2_240_buffer[1]-d2_240_buffer[1]>=1 || k3_240_buffer[1]-d3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=60) ||
       
 //H1 kd2,kd3值差>16 或加總>35
                    (k2_60_buffer[1]-d2_60_buffer[1]>=16 && k3_60_buffer[1]-d3_60_buffer[2]>=16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])>=35) ||
       
 //H4 角度折反 k1在35下
                    (k1_240_buffer[1]-k1_240_buffer[2]>=4 &&  k1_240_buffer[2]-k1_240_buffer[3]<=-4 && k1_240_buffer[1]<=35) ||
          
 //H4 k1,k2,k3在80上,kd1,kd2,kd3都還向上開口 
                    (k1_240_buffer[1]-d1_240_buffer[1]>=3 &&  k2_240_buffer[1]-d2_240_buffer[1]>=3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]>=3 &&  k1_240_buffer[1]>=80 &&  k2_240_buffer[1]>=80 &&  k3_240_buffer[1]>=80) ||

 //m60 k1,k2,k3在80上,kd1,kd2,kd3都還向上開口 
                    (k1_60_buffer[1]-d1_60_buffer[1]>=3 &&  k2_60_buffer[1]-d2_60_buffer[1]>=3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]>=3 &&  k1_60_buffer[1]>=80 &&  k2_60_buffer[1]>=80 &&  k3_60_buffer[1]>=80) ||

 //H4 ma05[1],ma12[1]差距大於28點 ,開口漸大([1]-[2])>=10點([2]-[3])>=8點
                    (ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])>=0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])>=0.00050)) ||      
               
 //H4 k1呈水平狀但k2,k3仍大幅往上 或macd開口尚大               
                   (k1_240_buffer[1]-k1_240_buffer[2]<=3 && k1_240_buffer[1]-k1_240_buffer[2]>=-3 &&
                  ((k2_240_buffer[1]-k2_240_buffer[2]>=6 && k3_240_buffer[1]-k3_240_buffer[2]>=6) || 
                   (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001300))) ||
              
 //H1-K1,K2,K3及H4-K1  全上揚
                   (k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 &&
                    k3_60_buffer[1]-k3_60_buffer[2]>=0 && k1_240_buffer[1]-k1_240_buffer[2]>=0) ||
 
 // m15  ma45,ma90,ma180,ma360,ma650 全斜上    
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00030 && 
                    ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00030 && ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00030 && 
                    ma650_240_buffer[1]-ma650_240_buffer[2]>=0.00030 &&  ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280) ||

 // m15  ma45,ma90,ma180,ma360,ma650 全斜上 90,180斜度較大,45斜度較小    
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00030 && 
                    ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00040 && ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00040 && 
                    ma650_240_buffer[1]-ma650_240_buffer[2]>=0.00020 &&  ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280) ||        
            
 // m15  ma45,ma90斜上,斜度較大,
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00100 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00060) ||

 //H4 MACD在範圍外
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001800 ||
                     macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001800) ||

 //H4  k1大幅向上 [1]或[2]須有一為正
                 (((k1_240_buffer[1]-k1_240_buffer[2])-(k1_240_buffer[2]-k1_240_buffer[3])>=3) && (close_240_buffer[1]-open_240_buffer[1]>=0.00030 || close_240_buffer[2]-open_240_buffer[2]>=0.00030)) ||
                   (k1_240_buffer[1]-k1_240_buffer[2]>=12 && (close_240_buffer[1]-open_240_buffer[1]>=0.00030 || close_240_buffer[2]-open_240_buffer[2]>=0.00030)))
                    return;
                    else
                    OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+300*Point,Bid-6900*Point,"My order #S4",4404,0,Green);
               
 //********** Sell  5  *********************************************************************************************************************************** 

    if ( OrdersTotal()>0 && OrderMagicNumber() == 4405) 
      return;
      else

 //[1]或[2]收正上影過20點
      if((((close_60_buffer[1]-open_60_buffer[1]>=0.00010 && high_60_buffer[1]-close_60_buffer[1]>=0.00200) || 
           (close_60_buffer[2]-open_60_buffer[2]>=0.00010 && high_60_buffer[2]-close_60_buffer[2]>=0.00200))  ||
 
 //或[1]或[2]收負上影過20點
          ((close_60_buffer[1]-open_60_buffer[1]<=-0.00010 && high_60_buffer[1]-open_60_buffer[1]>=0.00200) || 
           (close_60_buffer[2]-open_60_buffer[2]<=-0.00010 && high_60_buffer[2]-open_60_buffer[2]>=0.00200))) && 
 
 //[2]或[3]或[4]中有一收負
           (close_60_buffer[2]-open_60_buffer[2]<=-0.00030 || close_60_buffer[3]-open_60_buffer[3]<=-0.00030 ||  close_60_buffer[4]-open_60_buffer[4]<=-0.00030) &&         
 
 //ma12,ma05間距不過20點,K1,K2,K3,在50上且下降            
            ma05_60_buffer[1]-ma12_60_buffer[1]<=0.00200 &&
            k1_60_buffer[1]>=50 &&   k2_60_buffer[1]>=50 && k3_60_buffer[1]>=50 &&
            k1_60_buffer[1]-k1_60_buffer[2]<=-1 &&  k2_60_buffer[1]-k2_60_buffer[2]<=-1  &&  k3_60_buffer[1]-k3_60_buffer[2]<=-1)
            OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+300*Point,Bid-6900*Point,"My order #S5",4405,0,Green);
               
 //********** Sell  6  *********************************************************************************************************************************** 

 //********** Sell  7  *********************************************************************************************************************************** 

    if ( OrdersTotal()>0 && OrderMagicNumber() == 4407) 
      return;
      else
 //ma90或ma190或m240呈下降 ([1]-[2])-([2]-[3])<=-0.00010
      if((((ma90_240_buffer[1]-ma90_240_buffer[2]) - (ma90_240_buffer[2]-ma90_240_buffer[3])<=-0.00010) ||
          ((ma180_240_buffer[1]-ma180_240_buffer[2]) - (ma180_240_buffer[2]-ma180_240_buffer[3])<=-0.00010) ||
          ((ma360_240_buffer[1]-ma360_240_buffer[2]) - (ma360_240_buffer[2]-ma360_240_buffer[3])<=-0.00010)) &&
 
 //K1,k2,k3 在高點 kd1交叉下            
            k1_240_buffer[1]>=70  &&  k2_240_buffer[1]>=75 && k3_240_buffer[1]>=75 &&

 //m60之ma05與ma12差距在15點內
            ma05_60_buffer[1]-ma12_60_buffer[1]<=0.00150 &&

 //m240之ma05與ma12差距在35點內
            ma05_240_buffer[1]-ma12_240_buffer[1]<=0.00350 &&

 //m240之ma05與ma12差距在40點內
            ma05_240_buffer[1]-ma12_240_buffer[1]<=0.00400 && 
           (k1_240_buffer[1]-d1_240_buffer[1]<=-2 || k1_240_buffer[1]-k1_240_buffer[2]<=-4))
            OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+600*Point,Bid-6900*Point,"My order #S7",4407,0,Green);

 //********** Sell  8  *********************************************************************************************************************************** 

    if ( OrdersTotal()>0 && OrderMagicNumber() == 4408) 
      return;
      else
          
 // m15 k1,k2,k3皆下降,且在50,70上
      if   (k1_15_buffer[1]-k1_15_buffer[2]<=-3 &&  k2_15_buffer[1]-k2_15_buffer[2]<=-1 && k3_15_buffer[1]-k3_15_buffer[2]<=-1 &&
            k1_15_buffer[1]>=50 &&   k2_15_buffer[1]>=70 && k3_15_buffer[1]>=70 &&
             
 //m30,m60,m240全部在70上且開始下降
            k1_30_buffer[0]-k1_30_buffer[1]<=1 && k1_30_buffer[1]>=70 &&
            k1_60_buffer[0]-k1_60_buffer[1]<=1 && k1_60_buffer[1]>=70 &&
 
 //m60之ma05與ma12差距在15點內
            ma05_60_buffer[1]-ma12_60_buffer[1]<=0.00150 &&
            k1_240_buffer[0]-k1_240_buffer[1]<=2 && k1_240_buffer[1]>=70 &&
 
 //m240之ma05與ma12差距在35點內
            ma05_240_buffer[1]-ma12_240_buffer[1]<=0.00350)

 //H4 k1,k2,k3在80上,kd1,kd2,kd3都還向上開口 
            if   ((k1_240_buffer[1]-d1_240_buffer[1]>=3 &&  k2_240_buffer[1]-d2_240_buffer[1]>=3 && 
                   k3_240_buffer[1]-d3_240_buffer[1]>=3 &&  k1_240_buffer[1]>=80 &&  k2_240_buffer[1]>=80 &&  k3_240_buffer[1]>=80) ||
 
 //m60 k1,k2,k3在80上,kd1,kd2,kd3都還向上開口 
                  (k1_60_buffer[1]-d1_60_buffer[1]>=3 &&  k2_60_buffer[1]-d2_60_buffer[1]>=3 && 
                   k3_60_buffer[1]-d3_60_buffer[1]>=3 &&  k1_60_buffer[1]>=80 &&  k2_60_buffer[1]>=80 &&  k3_60_buffer[1]>=80) ||
 
 //H1-K1,K2,K3及H4-K1  全上揚
                  (k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 &&
                   k3_60_buffer[1]-k3_60_buffer[2]>=0 && k1_240_buffer[1]-k1_240_buffer[2]>=0) ||
                   
 // H4  ma45,ma90,ma180,ma360,ma650 全斜上    
                  (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00030 && 
                   ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00030 && ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00030 && 
                   ma650_240_buffer[1]-ma650_240_buffer[2]>=0.00030 &&  ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280) ||

 // H4  ma45,ma90,ma180,ma360,ma650 全斜上 90,180斜度較大,45斜度較小    
                  (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00030 && 
                   ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00040 && ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00040 && 
                   ma650_240_buffer[1]-ma650_240_buffer[2]>=0.00020 &&  ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280) ||        
            
 // H4  ma45,ma90斜上,斜度較大,
                  (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00100 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00060) ||
 // H4 ma180,ma360,ma650斜上,k1,k2,k3在70上,kd1,kd2或kd3   或kd2,kd3開口向上仍大                  
                  (ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00010 && ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00020 && 
                   ma650_240_buffer[1]-ma650_240_buffer[2]>=0.00020 && 
 // H4 k1,k2或k3皆上升,且K1在75上
                  (k1_240_buffer[1]-d1_240_buffer[1]>=4 && k1_240_buffer[1]>=70 &&
                  (k2_240_buffer[1]-d2_240_buffer[1]>=4 && k2_240_buffer[1]>=70 ||
                   k3_240_buffer[1]-d3_240_buffer[1]>=4 && k3_240_buffer[1]>=70)) ||
 // H4 k2,k3皆上升,且K1在70上
                  (k2_240_buffer[1]-d2_240_buffer[1]>=4 && k2_240_buffer[1]>=70 &&
                   k3_240_buffer[1]-d3_240_buffer[1]>=4 && k3_240_buffer[1]>=70)))
                   return;
                   else
                   OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+300*Point,Bid-6900*Point,"My order #S8",4408,0,Blue);
 
 //********** Sell  9  *********************************************************************************************************************************** 

    if ( OrdersTotal()>0 && OrderMagicNumber() == 4409) 
      return;
      else
          
 // m240 k1,k2或k3下降,且在70上
      if   (k1_240_buffer[1]>=70 &&   k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70 &&
          ((k1_240_buffer[1]-k1_240_buffer[2]<=-3 &&  (k2_240_buffer[1]-k2_240_buffer[2]<=-1 || k3_240_buffer[1]-k3_240_buffer[2]<=-1)) ||
           (k1_240_buffer[1]-d1_240_buffer[1]<=-6 && k2_240_buffer[1]-d2_240_buffer[1]<=8 &&  k3_240_buffer[1]-d3_240_buffer[1]<=8))  &&
             
 //m60之ma05與ma12差距在15點內
            ma05_60_buffer[1]-ma12_60_buffer[1]<=0.00150 &&

 //m240之ma05與ma12差距在35點內
            ma05_240_buffer[1]-ma12_240_buffer[1]<=0.00350 &&

 //[1][2]為負[3]或[4]為正
            close_240_buffer[1]-open_240_buffer[1]<=-0.00040 && close_240_buffer[2]-open_240_buffer[2]<=0 &&
           (close_240_buffer[3]-open_240_buffer[3]>=0.00040 || close_240_buffer[4]-open_240_buffer[4]>=0.00040) &&
           
 //ma180或ma360斜下
           (ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00010 || ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00010) &&                      
 
 //[1][2][3]或[2][3][4]開或收盤在ma180上下各12點間
           ((close_240_buffer[2]-ma180_240_buffer[2]<=0.00120 || close_240_buffer[2]-ma180_240_buffer[2]>=-0.00120) &&
            (close_240_buffer[3]-ma180_240_buffer[3]<=0.00120 || close_240_buffer[3]-ma180_240_buffer[3]>=-0.00120) &&
           ((close_240_buffer[4]-ma180_240_buffer[4]<=0.00120 || close_240_buffer[4]-ma180_240_buffer[4]>=-0.00120) ||
            (close_240_buffer[1]-ma180_240_buffer[1]<=0.00120 || close_240_buffer[1]-ma180_240_buffer[1]>=-0.00120))) ||
          
 //或[1][2][3]或[2][3][4]開或收盤在ma360上下各12點間
           ((close_240_buffer[2]-ma360_240_buffer[2]<=0.00120 || close_240_buffer[2]-ma360_240_buffer[2]>=-0.00120) &&
            (close_240_buffer[3]-ma360_240_buffer[3]<=0.00120 || close_240_buffer[3]-ma360_240_buffer[3]>=-0.00120) &&
           ((close_240_buffer[4]-ma360_240_buffer[4]<=0.00120 || close_240_buffer[4]-ma360_240_buffer[4]>=-0.00120) ||
            (close_240_buffer[1]-ma360_240_buffer[1]<=0.00120 || close_240_buffer[1]-ma360_240_buffer[1]>=-0.00120))))
            OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+600*Point,Bid-6900*Point,"My order #S9",4409,0,Green);

 //********** Sell  10  *********************************************************************************************************************************** 
//用在轉折所以排除條件較少 做短單     

    if ( OrdersTotal()>0 && OrderMagicNumber() == 4410) 
      return;
      else
          
 // m15 k1,k2,k3皆下降,且在50,70上
      if   (k1_15_buffer[1]-k1_15_buffer[2]<=-3 &&  k2_15_buffer[1]-k2_15_buffer[2]<=-1 && k3_15_buffer[1]-k3_15_buffer[2]<=-1 &&
            k1_15_buffer[1]>=50 &&   k2_15_buffer[1]>=70 && k3_15_buffer[1]>=70 &&
             
 // m30 k1,k2或k3皆下降,且在60,70上
           (k1_30_buffer[1]-k1_30_buffer[2]<=-1 &&  (k2_30_buffer[1]-k2_30_buffer[2]<=-1 || k3_30_buffer[1]-k3_30_buffer[2]<=-1) && 
            k1_30_buffer[1]>=60 && k2_30_buffer[1]>=70 && k3_30_buffer[1]>=70) &&
 
 // m60 k1,k2或k3皆下降,且在60,70上或[0]較大幅度下降
         (((k1_60_buffer[1]-k1_60_buffer[2]<=-1 &&  (k2_60_buffer[1]-k2_60_buffer[2]<=-1 || k3_60_buffer[1]-k3_60_buffer[2]<=-1)) ||
           (k1_60_buffer[0]-k1_60_buffer[1]<=-5 && k1_60_buffer[0]-d1_60_buffer[0]<=-2))  &&
            k1_60_buffer[1]>=60 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70)) 

 //H1,H4 kd值差全部>10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]>=10 && k3_60_buffer[1]-d3_60_buffer[2]>=10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]>=10 && k3_240_buffer[1]-d3_240_buffer[2]>=10) ||
 
 //H1,H4 k2,k3在低點,或H4 k1,k,k3在低點
                    (k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
                    (k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
                                     
 //H1 kd2,kd3值差>16 或加總>35
                    (k2_60_buffer[1]-d2_60_buffer[1]>=16 && k3_60_buffer[1]-d3_60_buffer[2]>=16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])>=35) ||

 // m15  ma45,ma90,ma180,ma360,ma650 全斜上    
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00030 && 
                    ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00030 && ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00030 && 
                    ma650_240_buffer[1]-ma650_240_buffer[2]>=0.00030 &&  ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280) ||

 // m15  ma45,ma90,ma180,ma360,ma650 全斜上 90,180斜度較大,45斜度較小    
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00030 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00030 && 
                    ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00040 && ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00040 && 
                    ma650_240_buffer[1]-ma650_240_buffer[2]>=0.00020 &&  ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280) ||        

 //H4 MACD在範圍外
                   (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001800 ||
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001800) ||

 //H4-K1,K2,K3,MA45  全上揚
                   (k1_240_buffer[1]-k1_240_buffer[2]>=5 && k2_240_buffer[1]-k2_240_buffer[2]>=5 &&
                    k3_240_buffer[1]-k3_240_buffer[2]>=5 && ma45_240_buffer[1]-ma45_240_buffer[2]>=5) ||

 //H1-K1,K2,K3及H4-K1  全上揚
                   (k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 &&
                    k3_60_buffer[1]-k3_60_buffer[2]>=0 && k1_240_buffer[1]-k1_240_buffer[2]>=0) ||
 
 // m15  ma45,ma90斜上,斜度較大,
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00100 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00060) ||
                                        
 // H4 ma180,ma360,ma650斜上,k1,k2,k3在70上,kd1,kd2或kd3   或kd2,kd3開口向上仍大                  
                   (ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00010 && ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00020 && 
                    ma650_240_buffer[1]-ma650_240_buffer[2]>=0.00020 && 
 // H4 k1,k2或k3皆上升,且K1在75上
                   (k1_240_buffer[1]-d1_240_buffer[1]>=4 && k1_240_buffer[1]>=70 &&
                   (k2_240_buffer[1]-d2_240_buffer[1]>=4 && k2_240_buffer[1]>=70 ||
                    k3_240_buffer[1]-d3_240_buffer[1]>=4 && k3_240_buffer[1]>=70)) ||
 // H4 k2,k3皆上升,且K1在70上
                   (k2_240_buffer[1]-d2_240_buffer[1]>=4 && k2_240_buffer[1]>=70 &&
                    k3_240_buffer[1]-d3_240_buffer[1]>=4 && k3_240_buffer[1]>=70)))
                    return;
                    else                   
                    OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+300*Point,Bid-2000*Point,"My order #S10",4410,0,Blue);

 //********** Sell  11  *********************************************************************************************************************************** 

    if ( OrdersTotal()>0 && OrderMagicNumber() == 4411) 
      return;
      else
          
 // H4   [1][3]或[1][4]或[1][5]或[1][6]為負
      if (((close_240_buffer[1]-open_240_buffer[1]<=-0.00050 &&  close_240_buffer[3]-open_240_buffer[3]<=-0.00050) ||
           (close_240_buffer[1]-open_240_buffer[1]<=-0.00050 &&  close_240_buffer[4]-open_240_buffer[4]<=-0.00050) ||
           (close_240_buffer[1]-open_240_buffer[1]<=-0.00050 &&  close_240_buffer[5]-open_240_buffer[5]<=-0.00050) ||
           (close_240_buffer[1]-open_240_buffer[1]<=-0.00050 &&  close_240_buffer[6]-open_240_buffer[6]<=-0.00050)) &&
             
 //ma45或ma90或ma180或ma360或ma650具斜度下降
           (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00030 || ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00030 ||
            ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00030 ||  ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00030 ||
            ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.00030) &&      

 // H4 k1,k2或k3皆下降,且K1在75上
           (k1_240_buffer[1]-k1_240_buffer[2]<0 &&  (k2_240_buffer[1]-k2_240_buffer[2]<0 || k3_240_buffer[1]-k3_240_buffer[2]<0) && 
           (k1_240_buffer[1]>=80 ||  (k2_240_buffer[1]>=75 &&  k3_240_buffer[1]>=75))) || 
            
 // H4 k1在高點向下          
           (k1_240_buffer[1]>=80 && k1_240_buffer[1]-k1_240_buffer[2]<=-3))
            OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+300*Point,Bid-6900*Point,"My order #S11",4411,0,Green);



//+++++++++++++++++++++++++++++++++++++++++++   SELL   21   ++++++++++++++++++++++++++++++++++++++++++++++++++          
    if ( OrdersTotal()>0 && OrderMagicNumber() == 4421) 
      return;
      else

             //(m15-66)   h4 的 ma180,ma360,ma650 斜下 或ma180持平 ma360 斜下   
     if   ((ma180_240_buffer[1]-ma180_240_buffer[2]<=0.00010 && ma360_240_buffer[1]-ma360_240_buffer[2]<=0.00010 &&
            ma650_240_buffer[1]-ma650_240_buffer[2]<=0.00010 &&
               //  macd<=0.00110  >=0.00110   main && signal <=-0.00015   
            macdmainline_240_buffer[1]-macdmainline_240_buffer[2]<=-0.000150 && 
            macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]<=-0.000150 &&
            macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.001100 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.001100 &&
                  //   kd2,kd3<=-3  k2,k3>=65     close[4]||[5]||[6]||[7]<close[1]&& [2] 含w底性質         
            k2_240_buffer[1]-d2_240_buffer[1]<=-3 && k3_240_buffer[1]-d3_240_buffer[1]<=-3 &&
           (close_240_buffer[4]-open_240_buffer[1]>=0 || close_240_buffer[5]-open_240_buffer[1]>=0 ||
            close_240_buffer[6]-open_240_buffer[1]>=0 || close_240_buffer[7]-open_240_buffer[1]>=0 || 
            close_240_buffer[8]-open_240_buffer[1]>=0 || close_240_buffer[9]-open_240_buffer[1]>=0) && 
           (close_240_buffer[4]-close_240_buffer[2]>=0 || close_240_buffer[5]-close_240_buffer[2]>=0 ||
            close_240_buffer[6]-close_240_buffer[2]>=0 || close_240_buffer[7]-close_240_buffer[2]>=0 || 
            close_240_buffer[8]-close_240_buffer[2]>=0 || close_240_buffer[9]-close_240_buffer[2]>=0) && 
            k2_240_buffer[1]>=65 && k3_240_buffer[1]>=65) ||
          
           //(m15-67)   h4 的 ma360, ma650 斜下   ma05||ma08||ma12<=0.0001 
           (ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00010 && ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.00010 &&
           (ma05_240_buffer[1]-ma05_240_buffer[2]<=0.00010 || ma08_240_buffer[1]-ma08_240_buffer[2]<=0.00010 ||
            ma12_240_buffer[1]-ma12_240_buffer[2]<=0.00010) &&
               //ma45,ma90已近持平  [1]-[6]<=0.0003
            ma45_240_buffer[1]-ma45_240_buffer[6]<=0.00030 && ma90_240_buffer[1]-ma90_240_buffer[6]<=0.00030 &&
             // [1]上影大於30點          [2][3]為正  
           (close_240_buffer[1]-open_240_buffer[1]<=-0.00010  && high_240_buffer[1]-close_240_buffer[1]>=0.00300)  ||
            close_240_buffer[1]-open_240_buffer[1]>=0.00010  && high_240_buffer[1]-open_240_buffer[1]>=0.00300)  &&
           (close_240_buffer[2]-open_240_buffer[2]>=0.00010 || close_240_buffer[3]-open_240_buffer[3]>=0.00010)  && 
                //   [5]||[6]||[7]||[8]的開盤價在[1]之上   下跌後上漲留上影線         
           (close_240_buffer[5]-close_240_buffer[1]>=0 || close_240_buffer[6]-close_240_buffer[1]>=0 ||
            close_240_buffer[7]-close_240_buffer[1]>=0 || close_240_buffer[8]-close_240_buffer[1]>=0 ||
            close_240_buffer[9]-close_240_buffer[1]>=0 || close_240_buffer[10]-close_240_buffer[1]>=0) &&                 //kd2,kd3>=7     
            k2_240_buffer[1]-d2_240_buffer[1]<=-3 &&  k3_240_buffer[1]-d3_240_buffer[1]<=-3)
            if    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.001100 ||
                   macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.001100)
                   return;
                   else
                   OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+300*Point,Bid-3000*Point,"My order #S21",4421,0,MediumSeaGreen );



return(0);  
}
//+------------------------------------------------------------------+

