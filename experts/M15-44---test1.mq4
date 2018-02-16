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
//----

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
 double m5highest16bar;
 double m5highest40bar;
 double m5lowest16bar;
 double m5lowest40bar;
 double m5highest16bartime;
 double m5highest40bartime;
 double m5lowest16bartime;
 double m5lowest40bartime;
 
 m5highest16bar=High[iHighest(NULL,PERIOD_M5,MODE_HIGH,16,1)];   //16bar的最高價
 m5highest40bar=High[iHighest(NULL,PERIOD_M5,MODE_HIGH,40,1)];   //40bar的最高價
 m5highest16bartime=High[iHighest(NULL,PERIOD_M5,MODE_TIME,16,1)];   //16bar的最高價的時間
 m5highest40bartime=High[iHighest(NULL,PERIOD_M5,MODE_TIME,40,1)];  //40bar的最高價的時間

 m5lowest16bar=Low[iLowest(NULL,PERIOD_M5,MODE_LOW,16,1)];     //16bar的最低價
 m5lowest40bar=Low[iLowest(NULL,PERIOD_M5,MODE_LOW,40,1)];   //40bar的最低價
 m5lowest16bartime=Low[iLowest(NULL,PERIOD_M5,MODE_TIME,16,1)];    //16bar的最低價的時間
 m5lowest40bartime=Low[iLowest(NULL,PERIOD_M5,MODE_TIME,40,1)];    //40bar的最低價的時間  

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
      //10000秒=2小時又36分
int  expiration=CurTime()+10000;
 
NormalizeDouble(ma45_30_buffer[1],4);
NormalizeDouble(ma45_30_buffer[2],4);
NormalizeDouble(ma45_30_buffer[3],4);
double cnt,trade,order_id;
//trade=1;
   for (cnt=0;cnt<OrdersTotal();cnt++)
     {
       OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES);
//       if (OrderSymbol()==Symbol())  trade=0 ;
     } 
 
                       
      
//+++++++++++++++++++++++++++++++++++++++++++   BUY   4   ++++++++++++++++++++++++++++++++++++++++++++++++++          
  if (OrdersTotal()<=1)   
     {       
                //m15 的 [+4][-3][-2][+1]  && [+1]or[-2]為最低 bar實體為0.0006  較易發生條件較嚴
        if  (((close_15_buffer[1]-open_15_buffer[2]>=0.0001  &&
               close_15_buffer[1]-open_15_buffer[1]>=0.0006 && close_15_buffer[4]-open_15_buffer[4]>=0.0006  && 
               close_15_buffer[2]-open_15_buffer[2]<=-0.0006 && close_15_buffer[3]-open_15_buffer[3]<=-0.0006 &&
               k1_15_buffer[1]-k1_15_buffer[2]>=0  &&  
              (ma05_15_buffer[1]-ma05_15_buffer[2]>=0 || (ma05_15_buffer[1]-ma05_15_buffer[2]>=-0.0004 && 
              (k2_15_buffer[1]-k2_15_buffer[2]>=0 || k3_15_buffer[1]-k3_15_buffer[2]>=0) &&
               close_15_buffer[1]-close_15_buffer[3]>=0.0001)) &&
              (low_15_buffer[1]==M15lowest40bar ||  low_15_buffer[2]==M15lowest40bar)) || 
                //m15 的 [+5][-4][-3][-2][+1]  && [+1]or[-2]為最低 bar實體為0.0006  
              (close_15_buffer[1]-open_15_buffer[2]>=0.0001  &&
               close_15_buffer[1]-open_15_buffer[1]>=0.0006 && close_15_buffer[5]-open_15_buffer[5]>=0.0006  && 
               close_15_buffer[2]-open_15_buffer[2]<=-0.0006 && close_15_buffer[3]-open_15_buffer[3]<=-0.0006 &&
               close_15_buffer[4]-open_15_buffer[4]<=-0.0006 &&
               k1_15_buffer[1]-k1_15_buffer[2]>=0  &&
              (ma05_15_buffer[1]-ma05_15_buffer[2]>=-0.0001 || (ma05_15_buffer[1]-ma05_15_buffer[2]>=-0.0004 && 
              (k2_15_buffer[1]-k2_15_buffer[2]>=0 || k3_15_buffer[1]-k3_15_buffer[2]>=0) &&
               close_15_buffer[1]-close_15_buffer[3]>=0.0001)) &&
              (low_15_buffer[1]==M15lowest40bar ||  low_15_buffer[2]==M15lowest40bar)) ||
             
                 //m30 的 [+4][-3][-2][+1]  && [+1]or[-2]為最低 bar實體為0.0008  較易發生條件較嚴
              (close_30_buffer[1]-open_30_buffer[2]>=-0.0001  &&
               close_30_buffer[1]-open_30_buffer[1]>=0.0008 && close_30_buffer[4]-open_30_buffer[4]>=0.0008  && 
               close_30_buffer[2]-open_30_buffer[2]<=-0.0008 && close_30_buffer[3]-open_30_buffer[3]<=-0.0008 &&
               k1_30_buffer[1]-k1_30_buffer[2]>=0 &&
              (ma05_30_buffer[1]-ma05_30_buffer[2]>=0 || (ma05_30_buffer[1]-ma05_30_buffer[2]>=-0.0004 && 
              (k2_30_buffer[1]-k2_30_buffer[2]>=0 || k3_30_buffer[1]-k3_30_buffer[2]>=0) &&
               close_30_buffer[1]-close_30_buffer[3]>=0.0001)) &&
              (low_30_buffer[1]==M30lowest40bar ||  low_30_buffer[2]==M30lowest40bar)) || 
               //m30 的 [+5][-4][-3][-2][+1]  && [+1]or[-2]為最低 bar實體為0.0008  
              (close_30_buffer[1]-open_30_buffer[2]>=-0.0001  &&
               close_30_buffer[1]-open_30_buffer[1]>=0.0008 && close_30_buffer[5]-open_30_buffer[5]>=0.0008  && 
               close_30_buffer[2]-open_30_buffer[2]<=-0.0008 && close_30_buffer[3]-open_30_buffer[3]<=-0.0008 &&
               close_30_buffer[4]-open_30_buffer[4]<=-0.0008 &&
               k1_30_buffer[1]-k1_30_buffer[2]>=0 &&
              (ma05_30_buffer[1]-ma05_30_buffer[2]>=-0.0001 || (ma05_30_buffer[1]-ma05_30_buffer[2]>=-0.0004 && 
              (k2_30_buffer[1]-k2_30_buffer[2]>=0 || k3_30_buffer[1]-k3_30_buffer[2]>=0) &&
               close_30_buffer[1]-close_30_buffer[3]>=0.0001)) &&
              (low_30_buffer[1]==M30lowest40bar ||  low_30_buffer[2]==M30lowest40bar)) ||
      
                  //m60 的 [+4][-3][-2][+1]  && [+1]or[-2]為最低 bar實體為0.0010  較易發生條件較嚴
              (close_60_buffer[1]-open_60_buffer[2]>=-0.0001  &&
               close_60_buffer[1]-open_60_buffer[1]>=0.0010 && close_60_buffer[4]-open_60_buffer[4]>=0.0010  && 
               close_60_buffer[2]-open_60_buffer[2]<=-0.0010 && close_60_buffer[3]-open_60_buffer[3]<=-0.0010 &&
               k1_60_buffer[1]-k1_60_buffer[2]>=0 &&
              (ma05_60_buffer[1]-ma05_60_buffer[2]>=0 || (ma05_60_buffer[1]-ma05_60_buffer[2]>=-0.0004 && 
              (k2_60_buffer[1]-k2_60_buffer[2]>=0 || k3_60_buffer[1]-k3_60_buffer[2]>=0) &&
               close_60_buffer[1]-close_60_buffer[3]>=0.0001)) &&
              (low_60_buffer[1]==H1lowest40bar ||  low_60_buffer[2]==H1lowest40bar)) || 
                 //m60 的 [+5][-4][-3][-2][+1]  && [+1]or[-2]為最低 bar實體為0.0010  
              (close_60_buffer[1]-open_60_buffer[2]>=-0.0001  &&
               close_60_buffer[1]-open_60_buffer[1]>=0.0010 && close_60_buffer[5]-open_60_buffer[5]>=0.0010  && 
               close_60_buffer[2]-open_60_buffer[2]<=-0.0010 && close_60_buffer[3]-open_60_buffer[3]<=-0.0010 &&
               close_60_buffer[4]-open_60_buffer[4]<=-0.0010 &&
               k1_60_buffer[1]-k1_60_buffer[2]>=0 &&
              (ma05_60_buffer[1]-ma05_60_buffer[2]>=-0.0001 || (ma05_60_buffer[1]-ma05_60_buffer[2]>=-0.0004 && 
              (k2_60_buffer[1]-k2_60_buffer[2]>=0 || k3_60_buffer[1]-k3_60_buffer[2]>=0) &&
               close_60_buffer[1]-close_60_buffer[3]>=0.0001)) &&
              (low_60_buffer[1]==H1lowest40bar ||  low_60_buffer[2]==H1lowest40bar))) && 
           
              macdmainline_30_buffer[1]<=0.00110   &&   
                                                         //m60 的45,90,180  皆是斜上
             (macdmainline_60_buffer[1]<=0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]>=0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0.0003 && 
              ma180_60_buffer[1]-ma180_60_buffer[2]>=0)))    
                                           //H4 k1,k2,k3全向下,或 h4, kd2,kd3向下開口大 或 k1,k,2,k3在極低
             if  ((k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19) ||
                  (k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10))
                   return;
                   else                        
                   OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-33*Point,Ask+160*Point,"My order #B4",8804,0,Brown );

        //          OrderSend(Symbol(),OP_BUYLIMIT,lots,close_30_buffer[1]-40*Point,1,Ask-35*Point,Ask+100*Point,"My order #1",8801,expiration,Yellow );
//+++++++++++++++++++++++++++++++++++++++++++   SELL   4   ++++++++++++++++++++++++++++++++++++++++++++++++++          

              //m15 的 [-4][+3][+2][-1] && [-1]or[+2]為最高 bar實體為0.0006  較易發生條件較嚴
        if  (((close_15_buffer[1]-open_15_buffer[2]<=-0.0001  && 
               close_15_buffer[1]-open_15_buffer[1]<=-0.0006 && close_15_buffer[4]-open_15_buffer[4]<=-0.0006  && 
               close_15_buffer[2]-open_15_buffer[2]>=0.0006 && close_15_buffer[3]-open_15_buffer[3]>=0.0006 &&
               k1_15_buffer[1]-k1_15_buffer[2]<=0  &&
              (ma05_15_buffer[1]-ma05_15_buffer[2]<=0 || (ma05_15_buffer[1]-ma05_15_buffer[2]<=0.0004 &&
              (k2_15_buffer[1]-k2_15_buffer[2]<=0 || k3_15_buffer[1]-k3_15_buffer[2]<=0) &&
               close_15_buffer[1]-close_15_buffer[3]<=-0.0001)) &&
              (high_15_buffer[1]==M15highest40bar ||  high_15_buffer[2]==M15highest40bar)) || 
               //m15 的 [-5][+4][+3][+2][-1]  && [-1]or[+2]為最高 bar實體為0.0006  
              (close_15_buffer[1]-open_15_buffer[2]<=-0.0001  &&
               close_15_buffer[1]-open_15_buffer[1]<=-0.0006 && close_15_buffer[5]-open_15_buffer[5]<=-0.0006  && 
               close_15_buffer[2]-open_15_buffer[2]>=0.0006 && close_15_buffer[3]-open_15_buffer[3]>=0.0006 && 
               close_15_buffer[4]-open_15_buffer[4]>=0.0006 &&
               k1_15_buffer[1]-k1_15_buffer[2]<=0 &&
              (ma05_15_buffer[1]-ma05_15_buffer[2]<=0.0001 || (ma05_15_buffer[1]-ma05_15_buffer[2]<=0.0004 &&
              (k2_15_buffer[1]-k2_15_buffer[2]<=0 || k3_15_buffer[1]-k3_15_buffer[2]<=0) &&
               close_15_buffer[1]-close_15_buffer[3]<=-0.0001)) &&
              (high_15_buffer[1]==M15highest40bar ||  high_15_buffer[2]==M15highest40bar) ) ||
       
                //m30 的 [-4][+3][+2][-1] && [-1]or[+2]為最高 bar實體為0.0008  較易發生條件較嚴
              (close_30_buffer[1]-open_30_buffer[2]<=0.0001 &&
               close_30_buffer[1]-open_30_buffer[1]<=-0.0008 && close_30_buffer[4]-open_30_buffer[4]<=-0.0008  && 
               close_30_buffer[2]-open_30_buffer[2]>=0.0008 && close_30_buffer[3]-open_30_buffer[3]>=0.0008 &&
               k1_30_buffer[1]-k1_30_buffer[2]<=0  &&
              (ma05_30_buffer[1]-ma05_30_buffer[2]<=0 || (ma05_30_buffer[1]-ma05_30_buffer[2]<=0.0004 &&
              (k2_30_buffer[1]-k2_30_buffer[2]<=0 || k3_30_buffer[1]-k3_30_buffer[2]<=0) &&
               close_30_buffer[1]-close_30_buffer[3]<=-0.0001)) &&
              (high_30_buffer[1]==M30highest40bar ||  high_30_buffer[2]==M30highest40bar)) || 
                //m30 的 [-5][+4][+3][+2][-1]  && [-1]or[+2]為最高 bar實體為0.0008  
              (close_30_buffer[1]-open_30_buffer[2]<=0.0001  &&
               close_30_buffer[1]-open_30_buffer[1]<=-0.0008 && close_30_buffer[5]-open_30_buffer[5]<=-0.0008  && 
               close_30_buffer[2]-open_30_buffer[2]>=0.0008 && close_30_buffer[3]-open_30_buffer[3]>=0.0008 &&
               close_30_buffer[4]-open_30_buffer[4]>=0.0008 &&
               k1_30_buffer[1]-k1_30_buffer[2]<=0 &&
              (ma05_30_buffer[1]-ma05_30_buffer[2]<=0.0001 || (ma05_30_buffer[1]-ma05_30_buffer[2]<=0.0004 &&
              (k2_30_buffer[1]-k2_30_buffer[2]<=0 || k3_30_buffer[1]-k3_30_buffer[2]<=0) &&
               close_30_buffer[1]-close_30_buffer[3]<=-0.0001)) &&
              (high_30_buffer[1]==M30highest40bar ||  high_30_buffer[2]==M30highest40bar) ) ||
                 
                  //m60 的 [-4][+3][+2][-1] && [-1]or[+2]為最高 bar實體為0.0010  較易發生條件較嚴
              (close_60_buffer[1]-open_60_buffer[2]<=0.0001  &&
               close_60_buffer[1]-open_60_buffer[1]<=-0.0010 && close_60_buffer[4]-open_60_buffer[4]<=-0.0010  && 
               close_60_buffer[2]-open_60_buffer[2]>=0.0010 && close_60_buffer[3]-open_60_buffer[3]>=0.0010 &&
               k1_60_buffer[1]-k1_60_buffer[2]<=0 &&  
              (ma05_60_buffer[1]-ma05_60_buffer[2]<=0 || (ma05_60_buffer[1]-ma05_60_buffer[2]<=0.0004 &&
              (k2_60_buffer[1]-k2_60_buffer[2]<=0 || k3_60_buffer[1]-k3_60_buffer[2]<=0) &&
               close_60_buffer[1]-close_60_buffer[3]<=-0.0001)) &&
              (high_60_buffer[1]==H1highest40bar ||  high_60_buffer[2]==H1highest40bar)) || 
                //m60 的 [-5][+4][+3][+2][-1]  && [-1]or[+2]為最高 bar實體為0.0010  
              (close_60_buffer[1]-open_60_buffer[2]<=0.0001  &&
               close_60_buffer[1]-open_60_buffer[1]<=-0.0010 && close_60_buffer[5]-open_60_buffer[5]<=-0.0010  && 
               close_60_buffer[2]-open_60_buffer[2]>=0.0010 && close_60_buffer[3]-open_60_buffer[3]>=0.0010 &&
               close_60_buffer[4]-open_60_buffer[4]>=0.0010 &&
               k1_60_buffer[1]-k1_60_buffer[2]<=0 &&
              (ma05_60_buffer[1]-ma05_60_buffer[2]<=0.0001 || (ma05_60_buffer[1]-ma05_60_buffer[2]<=0.0004 &&
              (k2_60_buffer[1]-k2_60_buffer[2]<=0 || k3_60_buffer[1]-k3_60_buffer[2]<=0) &&
               close_60_buffer[1]-close_60_buffer[3]<=-0.0001)) &&
              (high_60_buffer[1]==H1highest40bar ||  high_60_buffer[2]==H1highest40bar))) &&
     //          k1_60_buffer[1]>=70 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70  && 
               macdmainline_30_buffer[1]>=-0.00110   &&
                                                          //m60 的45,90,180  皆是斜下
              (macdmainline_60_buffer[1]>=-0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]<=-0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]<=-0.0003 && 
               ma180_60_buffer[1]-ma180_60_buffer[2]<=0)))    
                                      //H4 k1,k2,k3全向上,或h4, kd2,kd3向上開口大 或 k1,k,2,k3在極高
               if ((k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19) ||
                   (k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90)) 
                   return;
                   else                      
                   OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+33*Point,Bid-160*Point,"My order #S4",4404,0,Gray );

          //         OrderSend(Symbol(),OP_SELLLIMIT,lots,close_30_buffer[1]+40*Point,1,Bid+35*Point,Bid+100*Point,"My order #S4",4401,expiration,Gray );

     
      }   
        
             


 if (OrdersTotal()>0)
 {
   for (cnt=0;cnt<OrdersTotal();cnt++)
     {
       OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES);
//+++++++++++++++++++++++++++++++++++++++++++  CLOSE  BUY   4   ++++++++++++++++++++++++++++++++++++++++++++++++++          
 
     if   (OrderType()==OP_BUY)       
      {                                             
           
              //m15 的 [-4][+3][+2][-1] && [-1]or[+2]為最高 bar實體為0.0006  較易發生條件較嚴
        if  (((close_15_buffer[1]-open_15_buffer[2]<=-0.0001  && 
               close_15_buffer[1]-open_15_buffer[1]<=-0.0006 && close_15_buffer[4]-open_15_buffer[4]<=-0.0006  && 
               close_15_buffer[2]-open_15_buffer[2]>=0.0006 && close_15_buffer[3]-open_15_buffer[3]>=0.0006 &&
               k1_15_buffer[1]-k1_15_buffer[2]<=0  &&
              (ma05_15_buffer[1]-ma05_15_buffer[2]<=0 || (ma05_15_buffer[1]-ma05_15_buffer[2]<=0.0004 &&
              (k2_15_buffer[1]-k2_15_buffer[2]<=0 || k3_15_buffer[1]-k3_15_buffer[2]<=0) &&
               close_15_buffer[1]-close_15_buffer[3]<=-0.0001)) &&
              (high_15_buffer[1]==M15highest40bar ||  high_15_buffer[2]==M15highest40bar)) || 
               //m15 的 [-5][+4][+3][+2][-1]  && [-1]or[+2]為最高 bar實體為0.0006  
              (close_15_buffer[1]-open_15_buffer[2]<=-0.0001  &&
               close_15_buffer[1]-open_15_buffer[1]<=-0.0006 && close_15_buffer[5]-open_15_buffer[5]<=-0.0006  && 
               close_15_buffer[2]-open_15_buffer[2]>=0.0006 && close_15_buffer[3]-open_15_buffer[3]>=0.0006 && 
               close_15_buffer[4]-open_15_buffer[4]>=0.0006 &&
               k1_15_buffer[1]-k1_15_buffer[2]<=0 &&
              (ma05_15_buffer[1]-ma05_15_buffer[2]<=0.0001 || (ma05_15_buffer[1]-ma05_15_buffer[2]<=0.0004 &&
              (k2_15_buffer[1]-k2_15_buffer[2]<=0 || k3_15_buffer[1]-k3_15_buffer[2]<=0) &&
               close_15_buffer[1]-close_15_buffer[3]<=-0.0001)) &&
              (high_15_buffer[1]==M15highest40bar ||  high_15_buffer[2]==M15highest40bar) ) ||
       
                //m30 的 [-4][+3][+2][-1] && [-1]or[+2]為最高 bar實體為0.0008  較易發生條件較嚴
              (close_30_buffer[1]-open_30_buffer[2]<=0.0001 &&
               close_30_buffer[1]-open_30_buffer[1]<=-0.0008 && close_30_buffer[4]-open_30_buffer[4]<=-0.0008  && 
               close_30_buffer[2]-open_30_buffer[2]>=0.0008 && close_30_buffer[3]-open_30_buffer[3]>=0.0008 &&
               k1_30_buffer[1]-k1_30_buffer[2]<=0  &&
              (ma05_30_buffer[1]-ma05_30_buffer[2]<=0 || (ma05_30_buffer[1]-ma05_30_buffer[2]<=0.0004 &&
              (k2_30_buffer[1]-k2_30_buffer[2]<=0 || k3_30_buffer[1]-k3_30_buffer[2]<=0) &&
               close_30_buffer[1]-close_30_buffer[3]<=-0.0001)) &&
              (high_30_buffer[1]==M30highest40bar ||  high_30_buffer[2]==M30highest40bar)) || 
                //m30 的 [-5][+4][+3][+2][-1]  && [-1]or[+2]為最高 bar實體為0.0008  
              (close_30_buffer[1]-open_30_buffer[2]<=0.0001  &&
               close_30_buffer[1]-open_30_buffer[1]<=-0.0008 && close_30_buffer[5]-open_30_buffer[5]<=-0.0008  && 
               close_30_buffer[2]-open_30_buffer[2]>=0.0008 && close_30_buffer[3]-open_30_buffer[3]>=0.0008 &&
               close_30_buffer[4]-open_30_buffer[4]>=0.0008 &&
               k1_30_buffer[1]-k1_30_buffer[2]<=0 &&
              (ma05_30_buffer[1]-ma05_30_buffer[2]<=0.0001 || (ma05_30_buffer[1]-ma05_30_buffer[2]<=0.0004 &&
              (k2_30_buffer[1]-k2_30_buffer[2]<=0 || k3_30_buffer[1]-k3_30_buffer[2]<=0) &&
               close_30_buffer[1]-close_30_buffer[3]<=-0.0001)) &&
              (high_30_buffer[1]==M30highest40bar ||  high_30_buffer[2]==M30highest40bar) ) ||
                 
                  //m60 的 [-4][+3][+2][-1] && [-1]or[+2]為最高 bar實體為0.0010  較易發生條件較嚴
              (close_60_buffer[1]-open_60_buffer[2]<=0.0001  &&
               close_60_buffer[1]-open_60_buffer[1]<=-0.0010 && close_60_buffer[4]-open_60_buffer[4]<=-0.0010  && 
               close_60_buffer[2]-open_60_buffer[2]>=0.0010 && close_60_buffer[3]-open_60_buffer[3]>=0.0010 &&
               k1_60_buffer[1]-k1_60_buffer[2]<=0 &&  
              (ma05_60_buffer[1]-ma05_60_buffer[2]<=0 || (ma05_60_buffer[1]-ma05_60_buffer[2]<=0.0004 &&
              (k2_60_buffer[1]-k2_60_buffer[2]<=0 || k3_60_buffer[1]-k3_60_buffer[2]<=0) &&
               close_60_buffer[1]-close_60_buffer[3]<=-0.0001)) &&
              (high_60_buffer[1]==H1highest40bar ||  high_60_buffer[2]==H1highest40bar)) || 
                //m60 的 [-5][+4][+3][+2][-1]  && [-1]or[+2]為最高 bar實體為0.0010  
              (close_60_buffer[1]-open_60_buffer[2]<=0.0001  &&
               close_60_buffer[1]-open_60_buffer[1]<=-0.0010 && close_60_buffer[5]-open_60_buffer[5]<=-0.0010  && 
               close_60_buffer[2]-open_60_buffer[2]>=0.0010 && close_60_buffer[3]-open_60_buffer[3]>=0.0010 &&
               close_60_buffer[4]-open_60_buffer[4]>=0.0010 &&
               k1_60_buffer[1]-k1_60_buffer[2]<=0 &&
              (ma05_60_buffer[1]-ma05_60_buffer[2]<=0.0001 || (ma05_60_buffer[1]-ma05_60_buffer[2]<=0.0004 &&
              (k2_60_buffer[1]-k2_60_buffer[2]<=0 || k3_60_buffer[1]-k3_60_buffer[2]<=0) &&
               close_60_buffer[1]-close_60_buffer[3]<=-0.0001)) &&
              (high_60_buffer[1]==H1highest40bar ||  high_60_buffer[2]==H1highest40bar))) &&
     //          k1_60_buffer[1]>=70 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70  && 
               macdmainline_30_buffer[1]>=-0.00110   &&
                                                          //m60 的45,90,180  皆是斜下
              (macdmainline_60_buffer[1]>=-0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]<=-0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]<=-0.0003 && 
               ma180_60_buffer[1]-ma180_60_buffer[2]<=0)))    
                                      //H4 k1,k2,k3全向上,或h4, kd2,kd3向上開口大 或 k1,k,2,k3在極高
               if ((k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19) ||
                   (k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90)) 
                   return;
                   else                      

                  OrderClose(OrderTicket(),lots,Ask,1,Brown);    
       }                        
//+++++++++++++++++++++++++++++++++++++++++++CLOSE   SELL   4   ++++++++++++++++++++++++++++++++++++++++++++++++++          
     if   (OrderType()==OP_SELL)       
      {  
                 //m15 的 [+4][-3][-2][+1]  && [+1]or[-2]為最低 bar實體為0.0006  較易發生條件較嚴
        if  (((close_15_buffer[1]-open_15_buffer[2]>=0.0001  &&
               close_15_buffer[1]-open_15_buffer[1]>=0.0006 && close_15_buffer[4]-open_15_buffer[4]>=0.0006  && 
               close_15_buffer[2]-open_15_buffer[2]<=-0.0006 && close_15_buffer[3]-open_15_buffer[3]<=-0.0006 &&
               k1_15_buffer[1]-k1_15_buffer[2]>=0  &&  
              (ma05_15_buffer[1]-ma05_15_buffer[2]>=0 || (ma05_15_buffer[1]-ma05_15_buffer[2]>=-0.0004 && 
              (k2_15_buffer[1]-k2_15_buffer[2]>=0 || k3_15_buffer[1]-k3_15_buffer[2]>=0) &&
               close_15_buffer[1]-close_15_buffer[3]>=0.0001)) &&
              (low_15_buffer[1]==M15lowest40bar ||  low_15_buffer[2]==M15lowest40bar)) || 
                //m15 的 [+5][-4][-3][-2][+1]  && [+1]or[-2]為最低 bar實體為0.0006  
              (close_15_buffer[1]-open_15_buffer[2]>=0.0001  &&
               close_15_buffer[1]-open_15_buffer[1]>=0.0006 && close_15_buffer[5]-open_15_buffer[5]>=0.0006  && 
               close_15_buffer[2]-open_15_buffer[2]<=-0.0006 && close_15_buffer[3]-open_15_buffer[3]<=-0.0006 &&
               close_15_buffer[4]-open_15_buffer[4]<=-0.0006 &&
               k1_15_buffer[1]-k1_15_buffer[2]>=0  &&
              (ma05_15_buffer[1]-ma05_15_buffer[2]>=-0.0001 || (ma05_15_buffer[1]-ma05_15_buffer[2]>=-0.0004 && 
              (k2_15_buffer[1]-k2_15_buffer[2]>=0 || k3_15_buffer[1]-k3_15_buffer[2]>=0) &&
               close_15_buffer[1]-close_15_buffer[3]>=0.0001)) &&
              (low_15_buffer[1]==M15lowest40bar ||  low_15_buffer[2]==M15lowest40bar)) ||
             
                 //m30 的 [+4][-3][-2][+1]  && [+1]or[-2]為最低 bar實體為0.0008  較易發生條件較嚴
              (close_30_buffer[1]-open_30_buffer[2]>=-0.0001  &&
               close_30_buffer[1]-open_30_buffer[1]>=0.0008 && close_30_buffer[4]-open_30_buffer[4]>=0.0008  && 
               close_30_buffer[2]-open_30_buffer[2]<=-0.0008 && close_30_buffer[3]-open_30_buffer[3]<=-0.0008 &&
               k1_30_buffer[1]-k1_30_buffer[2]>=0 &&
              (ma05_30_buffer[1]-ma05_30_buffer[2]>=0 || (ma05_30_buffer[1]-ma05_30_buffer[2]>=-0.0004 && 
              (k2_30_buffer[1]-k2_30_buffer[2]>=0 || k3_30_buffer[1]-k3_30_buffer[2]>=0) &&
               close_30_buffer[1]-close_30_buffer[3]>=0.0001)) &&
              (low_30_buffer[1]==M30lowest40bar ||  low_30_buffer[2]==M30lowest40bar)) || 
               //m30 的 [+5][-4][-3][-2][+1]  && [+1]or[-2]為最低 bar實體為0.0008  
              (close_30_buffer[1]-open_30_buffer[2]>=-0.0001  &&
               close_30_buffer[1]-open_30_buffer[1]>=0.0008 && close_30_buffer[5]-open_30_buffer[5]>=0.0008  && 
               close_30_buffer[2]-open_30_buffer[2]<=-0.0008 && close_30_buffer[3]-open_30_buffer[3]<=-0.0008 &&
               close_30_buffer[4]-open_30_buffer[4]<=-0.0008 &&
               k1_30_buffer[1]-k1_30_buffer[2]>=0 &&
              (ma05_30_buffer[1]-ma05_30_buffer[2]>=-0.0001 || (ma05_30_buffer[1]-ma05_30_buffer[2]>=-0.0004 && 
              (k2_30_buffer[1]-k2_30_buffer[2]>=0 || k3_30_buffer[1]-k3_30_buffer[2]>=0) &&
               close_30_buffer[1]-close_30_buffer[3]>=0.0001)) &&
              (low_30_buffer[1]==M30lowest40bar ||  low_30_buffer[2]==M30lowest40bar)) ||
      
                  //m60 的 [+4][-3][-2][+1]  && [+1]or[-2]為最低 bar實體為0.0010  較易發生條件較嚴
              (close_60_buffer[1]-open_60_buffer[2]>=-0.0001  &&
               close_60_buffer[1]-open_60_buffer[1]>=0.0010 && close_60_buffer[4]-open_60_buffer[4]>=0.0010  && 
               close_60_buffer[2]-open_60_buffer[2]<=-0.0010 && close_60_buffer[3]-open_60_buffer[3]<=-0.0010 &&
               k1_60_buffer[1]-k1_60_buffer[2]>=0 &&
              (ma05_60_buffer[1]-ma05_60_buffer[2]>=0 || (ma05_60_buffer[1]-ma05_60_buffer[2]>=-0.0004 && 
              (k2_60_buffer[1]-k2_60_buffer[2]>=0 || k3_60_buffer[1]-k3_60_buffer[2]>=0) &&
               close_60_buffer[1]-close_60_buffer[3]>=0.0001)) &&
              (low_60_buffer[1]==H1lowest40bar ||  low_60_buffer[2]==H1lowest40bar)) || 
                 //m60 的 [+5][-4][-3][-2][+1]  && [+1]or[-2]為最低 bar實體為0.0010  
              (close_60_buffer[1]-open_60_buffer[2]>=-0.0001  &&
               close_60_buffer[1]-open_60_buffer[1]>=0.0010 && close_60_buffer[5]-open_60_buffer[5]>=0.0010  && 
               close_60_buffer[2]-open_60_buffer[2]<=-0.0010 && close_60_buffer[3]-open_60_buffer[3]<=-0.0010 &&
               close_60_buffer[4]-open_60_buffer[4]<=-0.0010 &&
               k1_60_buffer[1]-k1_60_buffer[2]>=0 &&
              (ma05_60_buffer[1]-ma05_60_buffer[2]>=-0.0001 || (ma05_60_buffer[1]-ma05_60_buffer[2]>=-0.0004 && 
              (k2_60_buffer[1]-k2_60_buffer[2]>=0 || k3_60_buffer[1]-k3_60_buffer[2]>=0) &&
               close_60_buffer[1]-close_60_buffer[3]>=0.0001)) &&
              (low_60_buffer[1]==H1lowest40bar ||  low_60_buffer[2]==H1lowest40bar))) && 
           
              macdmainline_30_buffer[1]<=0.00110   &&   
                                                         //m60 的45,90,180  皆是斜上
             (macdmainline_60_buffer[1]<=0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]>=0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0.0003 && 
              ma180_60_buffer[1]-ma180_60_buffer[2]>=0)))    
                                           //H4 k1,k2,k3全向下,或 h4, kd2,kd3向下開口大 或 k1,k,2,k3在極低
             if  ((k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19) ||
                  (k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10))
                   return;
                   else                        
          
                   OrderClose(OrderTicket(),lots,Bid,1,Gray); 

      }
//***  Ordermodify   ********************************************************************************** 
                                                         //如果在OrderTakeProfit()位置輸入如原有之獲利點(Bid-80*Point)時
                                                         //則將不會或獲利,直到停損為止
                                 //用  high[1] 誤差不會太大  須限定收紅否則反向收黑也會更改
  //      if (OrderType()==OP_BUY && high_15_buffer[0]-OrderOpenPrice()>=0.0201)
  //          OrderModify(OrderTicket(),OrderOpenPrice(),M15highest16bar-30*Point,OrderTakeProfit(),0,Blue);
       
  //      if (OrderType()==OP_BUY && high_15_buffer[0]-OrderOpenPrice()>=0.0085  && high_15_buffer[0]-OrderOpenPrice()<=0.0200)
  //          OrderModify(OrderTicket(),OrderOpenPrice(),M15highest16bar-35*Point,OrderTakeProfit(),0,Blue);
                  
  //      if (OrderType()==OP_BUY && high_15_buffer[0]-OrderOpenPrice()>=0.0010  && high_15_buffer[0]-OrderOpenPrice()<=0.0100) 
    //        OrderModify(OrderTicket(),OrderOpenPrice(),M15highest16bar-50*Point,OrderTakeProfit(),0,Blue);

         
                                                 //如有2次以上修改,必須把值大的放在上面,並且要限制值小的範圍 
                                    //用 low[1] 誤差不會太大   須限定收黑否則反向收紅也會更改    
   //     if (OrderType()==OP_SELL && low_15_buffer[0]-OrderOpenPrice()<=-0.0201)
   //         OrderModify(OrderTicket(),OrderOpenPrice(),M15lowest16bar+30*Point,OrderTakeProfit(),0,Blue);
                   
   //     if (OrderType()==OP_SELL && low_15_buffer[0]-OrderOpenPrice()<=-0.0085  && low_15_buffer[0]-OrderOpenPrice()>=-0.0200)
   //         OrderModify(OrderTicket(),OrderOpenPrice(),M15lowest16bar+35*Point,OrderTakeProfit(),0,Blue);
        
   //     if (OrderType()==OP_SELL && low_15_buffer[0]-OrderOpenPrice()<=-0.0010  && low_15_buffer[0]-OrderOpenPrice()>=-0.0100)
   //         OrderModify(OrderTicket(),OrderOpenPrice(),M15lowest16bar+50*Point,OrderTakeProfit(),0,Blue);




  } 
  }                

return(0);  
}
//+------------------------------------------------------------------+

