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

 

 
 int      ticket;
 double   lots=0.1;
 int      total=OrdersTotal();
 datetime otm=OrderOpenTime();

 double price=ObjectGetValueByShift("trendline 24048",0);
 double price1=ObjectGetValueByShift("trendline 24048",30);
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
double cnt,trade,order_id;
//trade=1;
   for (cnt=0;cnt<OrdersTotal();cnt++)
     {
       OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES);
//       if (OrderSymbol()==Symbol())  trade=0 ;
     } 
 
                       
      
//+++++++++++++++++++++++++++++++++++++++++++   BUY   1   ++++++++++++++++++++++++++++++++++++++++++++++++++          
  if (OrdersTotal()<=1)   
     {                                           //m15 的ma45  ma90 為斜L下跌末端型態 
           if (ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma45_15_buffer[1]-ma45_15_buffer[6]>=-0.0016 && 
               ma90_15_buffer[1]-ma90_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[6]>=-0.0013 && 
                                                
               close_15_buffer[1]-close_15_buffer[2]>=0.0001  && 
                                             //用m15 m30 macd 控管買賣點 
               macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00015 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020 &&
               macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]>=-0.00035 &&  macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00020 &&
                                             //k1 (k2||k3)已上升  kd1>=0
               k1_15_buffer[1]-k1_15_buffer[2]>=1  &&  k1_15_buffer[1]-d1_15_buffer[1]>=1 &&
               k2_15_buffer[1]-k2_15_buffer[2]>=0  ||  k3_15_buffer[1]-k3_15_buffer[2]>=0)
               
                                                                      //m15,m30,m60 的ma45,ma90,ma180,ma360全部向下空頭排列
               if ((ma45_15_buffer[1]-ma90_15_buffer[1]<=-0.0005 && ma90_15_buffer[1]-ma180_15_buffer[1]<=-0.0005 && ma180_15_buffer[1]-ma360_15_buffer[1]<=-0.0005 && 
                    ma45_30_buffer[1]-ma90_30_buffer[1]<=-0.0005 && ma90_30_buffer[1]-ma180_30_buffer[1]<=-0.0005 &&  
                    ma45_60_buffer[1]-ma180_60_buffer[1]<=-0.0005 &&  
                    ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=0 &&
                    ma180_15_buffer[1]-ma180_15_buffer[2]<=0 && ma360_15_buffer[1]-ma360_15_buffer[2]<=0 &&
                    ma45_30_buffer[1]-ma45_30_buffer[2]<=0 && ma90_30_buffer[1]-ma90_30_buffer[2]<=0 &&
                    ma180_30_buffer[1]-ma180_30_buffer[2]<=0 && ma360_30_buffer[1]-ma360_30_buffer[2]<=0 &&
                    ma45_60_buffer[1]-ma45_60_buffer[2]<=0 && ma90_60_buffer[1]-ma90_60_buffer[2]<=0 &&
                    ma180_60_buffer[1]-ma180_60_buffer[2]<=0 && ma360_60_buffer[1]-ma360_60_buffer[2]<=0 &&
                                             //m15的收盤價不高於h4的ma08上30點
                    close_15_buffer[1]-ma08_240_buffer[1]<=0.0030 && 
                                            //m15的收盤價收紅但必須在80點內 ,下影線必須在80點內
                   (close_15_buffer[1]-open_15_buffer[1]<=0.0080 || close_15_buffer[1]-high_15_buffer[1]<=0.0080) &&
                                            //h4 [2]下影線須小於90點,[2]下影線須小於110
                    open_240_buffer[2]-low_240_buffer[2]<=0.0090 && open_240_buffer[1]-low_240_buffer[1]<=0.0100) || 
                                              //在macd正負199內不交易
                   (macdmainline_15_buffer[1]>=-0.00199 && macdmainline_15_buffer[1]<=0.00199 &&
                    macdmainline_30_buffer[1]>=-0.00199 && macdmainline_30_buffer[1]<=0.00199))
                    return;
                    else                               
                             
                    OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-28*Point,Ask+450*Point,"My order #B1",8801,0,Red );
 
//+++++++++++++++++++++++++++++++++++++++++++   BUY   2   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                      //  順ma45,ma90,ma180上升趨勢 kd1>=1 k1 (k2||k3)為向上
          if  ((ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0) ||
               (ma90_15_buffer[1]-ma90_15_buffer[2]>=0 && ma180_15_buffer[1]-ma180_15_buffer[2]>=0) &&
                                                    //用m15 m30 macd 控管買賣點 
               macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00015 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020 &&
               macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]>=-0.00035 &&  macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00020 &&
                
               k1_15_buffer[1]<=60 && k2_15_buffer[1]<=60 && k3_15_buffer[1]<=60  && 
               k1_15_buffer[1]-k1_15_buffer[2]>=1  &&  k1_15_buffer[1]-d1_15_buffer[1]>=1 && 
              (k2_15_buffer[1]-k2_15_buffer[2]>=0  ||  k3_15_buffer[1]-k3_15_buffer[2]>=0)) 
                                                //m15,m30,m60 的ma45,ma90,ma180,ma360全部向下空頭排列
               if ((ma45_15_buffer[1]-ma90_15_buffer[1]<=-0.0005 && ma90_15_buffer[1]-ma180_15_buffer[1]<=-0.0005 && ma180_15_buffer[1]-ma360_15_buffer[1]<=-0.0005 && 
                    ma45_30_buffer[1]-ma90_30_buffer[1]<=-0.0005 && ma90_30_buffer[1]-ma180_30_buffer[1]<=-0.0005 &&  
                    ma45_60_buffer[1]-ma180_60_buffer[1]<=-0.0005 &&  
                    ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=0 &&
                    ma180_15_buffer[1]-ma180_15_buffer[2]<=0 && ma360_15_buffer[1]-ma360_15_buffer[2]<=0 &&
                    ma45_30_buffer[1]-ma45_30_buffer[2]<=0 && ma90_30_buffer[1]-ma90_30_buffer[2]<=0 &&
                    ma180_30_buffer[1]-ma180_30_buffer[2]<=0 && ma360_30_buffer[1]-ma360_30_buffer[2]<=0 &&
                    ma45_60_buffer[1]-ma45_60_buffer[2]<=0 && ma90_60_buffer[1]-ma90_60_buffer[2]<=0 &&
                    ma180_60_buffer[1]-ma180_60_buffer[2]<=0 && ma360_60_buffer[1]-ma360_60_buffer[2]<=0 &&
                                             //m15的收盤價不高於h4的ma08上30點
                    close_15_buffer[1]-ma08_240_buffer[1]<=0.0030 && 
                                            //m15的收盤價收紅但必須在80點內 ,下影線必須在80點內
                   (close_15_buffer[1]-open_15_buffer[1]<=0.0080 || close_15_buffer[1]-high_15_buffer[1]<=0.0080) &&
                                           //h4 [2]下影線須小於90點,[2]下影線須小於110
                    open_240_buffer[2]-low_240_buffer[2]<=0.0090 && open_240_buffer[1]-low_240_buffer[1]<=0.0100) || 
                                              //在macd正負199內不交易
                   (macdmainline_15_buffer[1]>=-0.00199 && macdmainline_15_buffer[1]<=0.00199 &&
                    macdmainline_30_buffer[1]>=-0.00199 && macdmainline_30_buffer[1]<=0.00199))
                    return;
                    else                               
                    OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-28*Point,Ask+450*Point,"My order #B2",8802,0,Yellow );
                                             
//+++++++++++++++++++++++++++++++++++++++++++   BUY   3   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                            //在ma45,ma90,ma180斜上時,k1,k2,k3<=30 並且收紅 或收2小紅
        if   ((k1_15_buffer[1]-k1_15_buffer[2]>=5  &&  k1_15_buffer[1]-d1_15_buffer[1]>=5 &&
               k1_15_buffer[1]<=30 && k2_15_buffer[1]<=30  &&  k3_15_buffer[1]<=30 && 
             ((close_15_buffer[1]-open_15_buffer[1]>=0.0005 &&  close_15_buffer[1]-close_15_buffer[2]<=-0.0001) ||
              (close_15_buffer[1]-open_15_buffer[1]>=0 &&  close_15_buffer[2]-open_15_buffer[2]>=0)) &&
                                        
                                                   //m15 的ma45  ma90 為斜L下跌末端型態 
               (ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0) || 
               (ma90_15_buffer[1]-ma90_15_buffer[2]>=0 && ma180_15_buffer[1]-ma180_15_buffer[2]>=0) &&                                  //下跌末端上升要一次升過前3bar
                                            //用m15 m30 macd 控管買賣點 
                macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00055 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020 &&
                macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]>=-0.00065 &&  macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00020))
                                                 //m15,m30,m60 的ma45,ma90,ma180,ma360全部向下空頭排列
               if  (ma45_15_buffer[1]-ma90_15_buffer[1]<=-0.0005 && ma90_15_buffer[1]-ma180_15_buffer[1]<=-0.0005 && ma180_15_buffer[1]-ma360_15_buffer[1]<=-0.0005 && 
                    ma45_30_buffer[1]-ma90_30_buffer[1]<=-0.0005 && ma90_30_buffer[1]-ma180_30_buffer[1]<=-0.0005 &&  
                    ma45_60_buffer[1]-ma180_60_buffer[1]<=-0.0005 &&  
                    ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=0 &&
                    ma180_15_buffer[1]-ma180_15_buffer[2]<=0 && ma360_15_buffer[1]-ma360_15_buffer[2]<=0 &&
                    ma45_30_buffer[1]-ma45_30_buffer[2]<=0 && ma90_30_buffer[1]-ma90_30_buffer[2]<=0 &&
                    ma180_30_buffer[1]-ma180_30_buffer[2]<=0 && ma360_30_buffer[1]-ma360_30_buffer[2]<=0 &&
                    ma45_60_buffer[1]-ma45_60_buffer[2]<=0 && ma90_60_buffer[1]-ma90_60_buffer[2]<=0 &&
                    ma180_60_buffer[1]-ma180_60_buffer[2]<=0 && ma360_60_buffer[1]-ma360_60_buffer[2]<=0 &&
                                             //m15的收盤價不高於h4的ma08上30點
                    close_15_buffer[1]-ma08_240_buffer[1]<=0.0030 && 
                                           //m15的收盤價收紅但必須在80點內 ,下影線必須在80點內
                   (close_15_buffer[1]-open_15_buffer[1]<=0.0080 || close_15_buffer[1]-high_15_buffer[1]<=0.0080) &&
                                           //h4 [2]下影線須小於90點,[2]下影線須小於110
                    open_240_buffer[2]-low_240_buffer[2]<=0.0090 && open_240_buffer[1]-low_240_buffer[1]<=0.0100)
                    return;
                    else                               
                                       //因為順勢所以不考慮 MACD 大小於199狀況  
                    OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-28*Point,Ask+450*Point,"My order #B3",8803,0,Blue );
 
//+++++++++++++++++++++++++++++++++++++++++++   BUY   4   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                         //m15 的ma180,ma360 or ma360,ma650 or ma650 上升幅度大    跌破ma180 ,ma360,ma650時 收黑下買單
                                             
          if   (((ma180_15_buffer[1]-ma180_15_buffer[40]>=0.0020 && ma360_15_buffer[1]-ma360_15_buffer[40]>=0.0020 &&
                  ma180_15_buffer[1]-ma360_15_buffer[1]>=0.0015 && ma360_15_buffer[1]-ma650_15_buffer[1]>=0.0015 && 
                                            //m45,m90斜度必須較小
        //        (ma45_15_buffer[1]-ma45_15_buffer[6]<=0.0013 && ma90_15_buffer[1]-ma90_15_buffer[6]<=0.0013) || 
                                          //m15  macd 差值不可太大 
                (macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00120 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020) &&
                                        //k1,k2,k3 <=18
                k1_15_buffer[1]<=18 && k2_15_buffer[1]<=18  &&  k3_15_buffer[1]<=18 && 
                                        //[1]收黑 且<-=0.0006  [1]<= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]<=-0.0006 && close_15_buffer[1]-ma180_15_buffer[1]<=-0.0006) ||
                
               
               (ma360_15_buffer[1]-ma360_15_buffer[40]>=0.0020 && ma650_15_buffer[1]-ma650_15_buffer[40]>=0.0020 &&
                ma180_15_buffer[1]-ma360_15_buffer[1]>=0.0015 && ma360_15_buffer[1]-ma650_15_buffer[1]>=0.0015 && 
                                        //m45,m90斜度必須較小
        //        (ma45_15_buffer[1]-ma45_15_buffer[6]<=0.0013 && ma90_15_buffer[1]-ma90_15_buffer[6]<=0.0013) || 
                                          //m15  macd 差值不可太大 
                (macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00120 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020) &&
                                            //k1,k2,k3 <=18
                k1_15_buffer[1]<=18 && k2_15_buffer[1]<=18  &&  k3_15_buffer[1]<=18 && 
                                        //[1]收紅 且<=-0.0006  [1]<= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]<=-0.0006 && close_15_buffer[1]-ma360_15_buffer[1]<=-0.0006) ||
                
                (ma650_15_buffer[1]-ma650_15_buffer[40]>=0.0020 &&
                 ma180_15_buffer[1]-ma360_15_buffer[1]>=0.0015 && ma360_15_buffer[1]-ma650_15_buffer[1]>=0.0015 && 
                                        //m45,m90斜度必須較小
         //       (ma45_15_buffer[1]-ma45_15_buffer[6]<=0.0013 && ma90_15_buffer[1]-ma90_15_buffer[6]<=0.0013) || 
                                          //m15  macd 差值不可太大 
                (macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00120 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020) &&
                                          //k1,k2,k3 <=18
                k1_15_buffer[1]<=18 && k2_15_buffer[1]<=18  &&  k3_15_buffer[1]<=18 && 
                                        //[1]收紅 且>=0.0006  [1]>= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]<=-0.0006 && close_15_buffer[1]-ma360_15_buffer[1]<=-0.0006))  ||
           
         
                              //m15 的ma180,ma360 or ma360,ma650 or ma650 上升幅度大
                                             
               ((ma180_15_buffer[1]-ma180_15_buffer[40]>=0.0030 && ma360_15_buffer[1]-ma360_15_buffer[40]>=0.0040 &&
                 ma180_15_buffer[1]-ma360_15_buffer[1]>=0.0015 && ma360_15_buffer[1]-ma650_15_buffer[1]>=0.0015 &&             
                                     //m45,m90斜度必須較小
       //         (ma45_15_buffer[1]-ma45_15_buffer[6]<=0.0013 && ma90_15_buffer[1]-ma90_15_buffer[6]<=0.0013) || 
                                          //m15  macd 差值不可太大 
                (macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00120 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020) &&
                                          //k1,k2,k3 <=30
                k1_15_buffer[1]<=30 && k2_15_buffer[1]<=30  &&  k3_15_buffer[1]<=30 && 
                                        //[1]收黑 且<-=0.0006  [1]<= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]<=-0.0006 && close_15_buffer[1]-ma180_15_buffer[1]<=-0.0006) ||
                
               
               (ma360_15_buffer[1]-ma360_15_buffer[40]>=0.0040 && ma650_15_buffer[1]-ma650_15_buffer[40]>=0.0040 &&
                ma180_15_buffer[1]-ma360_15_buffer[1]>=0.0015 && ma360_15_buffer[1]-ma650_15_buffer[1]>=0.0015 &&  
                                         //m45,m90斜度必須較小
       //         (ma45_15_buffer[1]-ma45_15_buffer[6]<=0.0013 && ma90_15_buffer[1]-ma90_15_buffer[6]<=0.0013) || 
                                          //m15  macd 差值不可太大 
                (macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00120 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020) &&
                                          //k1,k2,k3 <=30
                k1_15_buffer[1]<=30 && k2_15_buffer[1]<=30  &&  k3_15_buffer[1]<=30 && 
                                        //[1]收紅 且<=-0.0006  [1]<= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]<=-0.0006 && close_15_buffer[1]-ma360_15_buffer[1]<=-0.0006) ||
                
                (ma650_15_buffer[1]-ma650_15_buffer[40]>=0.0040 &&
                 ma180_15_buffer[1]-ma360_15_buffer[1]>=0.0015 && ma360_15_buffer[1]-ma650_15_buffer[1]>=0.0015 &&  
                                        //m45,m90斜度必須較小
       //         (ma45_15_buffer[1]-ma45_15_buffer[6]<=0.0013 && ma90_15_buffer[1]-ma90_15_buffer[6]<=0.0013) || 
                                          //m15  macd 差值不可太大 
                (macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00120 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020) &&
                                          //k1,k2,k3 <=30
                k1_15_buffer[1]<=30 && k2_15_buffer[1]<=30  &&  k3_15_buffer[1]<=30 && 
                                        //[1]收紅 且>=0.0006  [1]>= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]<=-0.0006 && close_15_buffer[1]-ma360_15_buffer[1]<=-0.0006)))
          
                                                 //m15,m30,m60 的ma45,ma90,ma180,ma360全部向下空頭排列
               if ((ma45_15_buffer[1]-ma90_15_buffer[1]<=-0.0005 && ma90_15_buffer[1]-ma180_15_buffer[1]<=-0.0005 && ma180_15_buffer[1]-ma360_15_buffer[1]<=-0.0005 && 
                    ma45_30_buffer[1]-ma90_30_buffer[1]<=-0.0005 && ma90_30_buffer[1]-ma180_30_buffer[1]<=-0.0005 &&  
                    ma45_60_buffer[1]-ma180_60_buffer[1]<=-0.0005 &&  
                    ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=0 &&
                    ma180_15_buffer[1]-ma180_15_buffer[2]<=0 && ma360_15_buffer[1]-ma360_15_buffer[2]<=0 &&
                    ma45_30_buffer[1]-ma45_30_buffer[2]<=0 && ma90_30_buffer[1]-ma90_30_buffer[2]<=0 &&
                    ma180_30_buffer[1]-ma180_30_buffer[2]<=0 && ma360_30_buffer[1]-ma360_30_buffer[2]<=0 &&
                    ma45_60_buffer[1]-ma45_60_buffer[2]<=0 && ma90_60_buffer[1]-ma90_60_buffer[2]<=0 &&
                    ma180_60_buffer[1]-ma180_60_buffer[2]<=0 && ma360_60_buffer[1]-ma360_60_buffer[2]<=0 &&
                                             //m15的收盤價不高於h4的ma08上30點
                    close_15_buffer[1]-ma08_240_buffer[1]<=0.0030 && 
                                           //m15的收盤價收紅但必須在80點內 ,下影線必須在80點內
                   (close_15_buffer[1]-open_15_buffer[1]<=0.0080 || close_15_buffer[1]-high_15_buffer[1]<=0.0080) &&
                                          //h4 [2]下影線須小於90點,[2]下影線須小於110
                    open_240_buffer[2]-low_240_buffer[2]<=0.0090 && open_240_buffer[1]-low_240_buffer[1]<=0.0100) || 
                                              //在macd正負199內不交易
                   (macdmainline_15_buffer[1]>=-0.00199 && macdmainline_15_buffer[1]<=0.00199 &&
                    macdmainline_30_buffer[1]>=-0.00199 && macdmainline_30_buffer[1]<=0.00199) ||
                   (k1_15_buffer[1]<=8 && k2_15_buffer[1]<=8 &&  k3_15_buffer[1]<=8))
                    return;
                    else   
                    OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-23*Point,Ask+450*Point,"My order #B4",8804,0,Brown );
                    buyorder4=OrderTicket();
    
//+++++++++++++++++++++++++++++++++++++++++++   BUY   5   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                    
                                     //長下影線 >=24點  [1]>0.0001開-低  [1]<-0.0001收-低
       if   ((close_15_buffer[1]-open_15_buffer[1]<=-0.0001 && low_15_buffer[1]-close_15_buffer[1]<=-0.0024) ||
             (close_15_buffer[1]-open_15_buffer[1]>=0.0001  && low_15_buffer[1]-open_15_buffer[1]<=-0.0024) &&
              low_15_buffer[1]==M15lowest40bar &&
              k1_15_buffer[1]-k1_15_buffer[2]>=0 && k2_15_buffer[1]-k2_15_buffer[2]>=0 && k3_15_buffer[1]-k3_15_buffer[2]>=0  &&
              macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.0090 && 
              macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00010) 
              
              if ((close_15_buffer[2]-open_15_buffer[2]<=-0.0100 || close_15_buffer[1]-open_15_buffer[1]<=-0.0100 ||
                   macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=-0.00120 || 
                   macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=0.00050) ||
                                                 //避開下跌後之反彈
                  (open_15_buffer[3]-open_15_buffer[2]<=0.0003 && open_15_buffer[4]-open_15_buffer[2]<=0.0003) ||    
                  (open_15_buffer[2]-open_15_buffer[1]<=0.0003 && open_15_buffer[3]-open_15_buffer[1]<=0.0003) ||     
                                   //m15,m30,m60 的ma45,ma90,ma180,ma360全部向下空頭排列
                   (ma45_15_buffer[1]-ma90_15_buffer[1]<=-0.0005 && ma90_15_buffer[1]-ma180_15_buffer[1]<=-0.0005 && ma180_15_buffer[1]-ma360_15_buffer[1]<=-0.0005 && 
                    ma45_30_buffer[1]-ma90_30_buffer[1]<=-0.0005 && ma90_30_buffer[1]-ma180_30_buffer[1]<=-0.0005 &&  
                    ma45_60_buffer[1]-ma180_60_buffer[1]<=-0.0005 &&  
                    ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=0 &&
                    ma180_15_buffer[1]-ma180_15_buffer[2]<=0 && ma360_15_buffer[1]-ma360_15_buffer[2]<=0 &&
                    ma45_30_buffer[1]-ma45_30_buffer[2]<=0 && ma90_30_buffer[1]-ma90_30_buffer[2]<=0 &&
                    ma180_30_buffer[1]-ma180_30_buffer[2]<=0 && ma360_30_buffer[1]-ma360_30_buffer[2]<=0 &&
                    ma45_60_buffer[1]-ma45_60_buffer[2]<=0 && ma90_60_buffer[1]-ma90_60_buffer[2]<=0 &&
                    ma180_60_buffer[1]-ma180_60_buffer[2]<=0 && ma360_60_buffer[1]-ma360_60_buffer[2]<=0 &&
                                             //m15的收盤價不高於h4的ma08上30點
                    close_15_buffer[1]-ma08_240_buffer[1]<=0.0030 && 
                                           //m15的收盤價收紅但必須在80點內 ,下影線必須在80點內
                   (close_15_buffer[1]-open_15_buffer[1]<=0.0080 || close_15_buffer[1]-high_15_buffer[1]<=0.0080) &&
                                           //h4 [2]下影線須小於90點,[2]下影線須小於110
                    open_240_buffer[2]-low_240_buffer[2]<=0.0090 && open_240_buffer[1]-low_240_buffer[1]<=0.0100 &&
                                           //不加此條有下影線一條超過90點會執行   
                    close_240_buffer[1]-open_240_buffer[1]>=0.0005) || 
                                              //在macd正負199內不交易
                   (macdmainline_15_buffer[1]>=-0.00199 && macdmainline_15_buffer[1]<=0.00199 &&
                    macdmainline_30_buffer[1]>=-0.00199 && macdmainline_30_buffer[1]<=0.00199))
                    return;
                    else                  
                    OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-23*Point,Ask+2000*Point,"My order #B5",8805,0,Purple );
  
//+++++++++++++++++++++++++++++++++++++++++++   BUY   6   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                                        //長下影線 >=40點  [1]>0.0001開-低  [1]<-0.0001收-低
         
       if   ((close_15_buffer[1]-open_15_buffer[1]<=-0.0001 && low_15_buffer[1]-close_15_buffer[1]>=0.0040) ||
             (close_15_buffer[1]-open_15_buffer[1]>=0.0001  && low_15_buffer[1]-open_15_buffer[1]>=0.0040) &&
              low_15_buffer[1]==M15lowest40bar &&
              k1_15_buffer[1]-k1_15_buffer[2]>=0 && k2_15_buffer[1]-k2_15_buffer[2]>=0 && k3_15_buffer[1]-k3_15_buffer[2]>=0)  
                                                         //避開超過100點 
              if ((close_15_buffer[2]-open_15_buffer[2]>=0.0100 || close_15_buffer[1]-open_15_buffer[1]>=0.0100 ||
                  macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=0.00120 || 
                  macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=-0.00050) ||
                                                   //避開下跌後之反彈
                 (open_15_buffer[3]-open_15_buffer[2]<=0.0003 && open_15_buffer[4]-open_15_buffer[2]<=0.0003) ||    
                 (open_15_buffer[2]-open_15_buffer[1]<=0.0003 && open_15_buffer[3]-open_15_buffer[1]<=0.0003) ||     
                                         //m15,m30,m60 的ma45,ma90,ma180,ma360全部向下空頭排列
                (ma45_15_buffer[1]-ma90_15_buffer[1]<=-0.0005 && ma90_15_buffer[1]-ma180_15_buffer[1]<=-0.0005 && ma180_15_buffer[1]-ma360_15_buffer[1]<=-0.0005 && 
                 ma45_30_buffer[1]-ma90_30_buffer[1]<=-0.0005 && ma90_30_buffer[1]-ma180_30_buffer[1]<=-0.0005 &&  
                 ma45_60_buffer[1]-ma180_60_buffer[1]<=-0.0005 &&  
                 ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=0 &&
                 ma180_15_buffer[1]-ma180_15_buffer[2]<=0 && ma360_15_buffer[1]-ma360_15_buffer[2]<=0 &&
                 ma45_30_buffer[1]-ma45_30_buffer[2]<=0 && ma90_30_buffer[1]-ma90_30_buffer[2]<=0 &&
                 ma180_30_buffer[1]-ma180_30_buffer[2]<=0 && ma360_30_buffer[1]-ma360_30_buffer[2]<=0 &&
                 ma45_60_buffer[1]-ma45_60_buffer[2]<=0 && ma90_60_buffer[1]-ma90_60_buffer[2]<=0 &&
                 ma180_60_buffer[1]-ma180_60_buffer[2]<=0 && ma360_60_buffer[1]-ma360_60_buffer[2]<=0 &&
                                          //m15的收盤價不高於h4的ma08上30點
                 close_15_buffer[1]-ma08_240_buffer[1]<=0.0030 && 
                                          //m15的收盤價收紅但必須在80點內 ,下影線必須在80點內
                (close_15_buffer[1]-open_15_buffer[1]<=0.0080 || close_15_buffer[1]-high_15_buffer[1]<=0.0080) &&
                                           //h4 [2]下影線須小於90點,[2]下影線須小於110
                 open_240_buffer[2]-low_240_buffer[2]<=0.0090 && open_240_buffer[1]-low_240_buffer[1]<=0.0100 &&
                                          //不加此條有下影線一條超過90點會執行
                 close_240_buffer[1]-open_240_buffer[1]>=0.0005) || 
                                              //在macd正負199內不交易
                (macdmainline_15_buffer[1]>=-0.00199 && macdmainline_15_buffer[1]<=0.00199 &&
                 macdmainline_30_buffer[1]>=-0.00199 && macdmainline_30_buffer[1]<=0.00199))
                 return;
                 else                  
                 OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-23*Point,Ask+2000*Point,"My order #B6",8806,0,Gold );
 
 //+++++++++++++++++++++++++++++++++++++++++++   BUY   7   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                                 //  M30 收紅,ma05,ma12間距小
       if    (close_30_buffer[1]-open_30_buffer[1]>=0.0010 && ma05_30_buffer[1]-ma12_30_buffer[1]>=-0.0012 && 
                                  //macd 已近反轉處
              macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]>=-0.00020 && 
              macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00050 &&
                                  //macd signal為上升狀態
             (macdsignalline_30_buffer[1]-macdsignalline_30_buffer[2])-(macdsignalline_30_buffer[2]-macdsignalline_30_buffer[3])>=0.00002  && 
                                        //k1,k2,k3 <=30
              k1_15_buffer[1]<=30 && k2_15_buffer[1]<=30  &&  k3_15_buffer[1]<=30) //  && 
                                  //k1,k2,k3任2個皆為上升狀
     //         k1_30_buffer[1]-k1_30_buffer[2]>=0 && (k2_30_buffer[1]-k2_30_buffer[2]>=0 || k3_30_buffer[1]-k3_30_buffer[2]>=0)  ||
     //        (k2_30_buffer[1]-k2_30_buffer[2]>=0 && k3_30_buffer[1]-k3_30_buffer[2]>=0))                                           
                                   //m15,m30,m60 的ma45,ma90,ma180,ma360全部向下空頭排列
               if  (ma45_15_buffer[1]-ma90_15_buffer[1]<=-0.0005 && ma90_15_buffer[1]-ma180_15_buffer[1]<=-0.0005 && ma180_15_buffer[1]-ma360_15_buffer[1]<=-0.0005 && 
                    ma45_30_buffer[1]-ma90_30_buffer[1]<=-0.0005 && ma90_30_buffer[1]-ma180_30_buffer[1]<=-0.0005 &&  
                    ma45_60_buffer[1]-ma180_60_buffer[1]<=-0.0005 &&  
                    ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=0 &&
                    ma180_15_buffer[1]-ma180_15_buffer[2]<=0 && ma360_15_buffer[1]-ma360_15_buffer[2]<=0 &&
                    ma45_30_buffer[1]-ma45_30_buffer[2]<=0 && ma90_30_buffer[1]-ma90_30_buffer[2]<=0 &&
                    ma180_30_buffer[1]-ma180_30_buffer[2]<=0 && ma360_30_buffer[1]-ma360_30_buffer[2]<=0 &&
                    ma45_60_buffer[1]-ma45_60_buffer[2]<=0 && ma90_60_buffer[1]-ma90_60_buffer[2]<=0 &&
                    ma180_60_buffer[1]-ma180_60_buffer[2]<=0 && ma360_60_buffer[1]-ma360_60_buffer[2]<=0 &&
                                             //m15的收盤價不高於h4的ma08上30點
                    close_15_buffer[1]-ma08_240_buffer[1]<=0.0030 && 
                                            //m15的收盤價收紅但必須在80點內 ,下影線必須在80點內
                   (close_15_buffer[1]-open_15_buffer[1]<=0.0080 || close_15_buffer[1]-high_15_buffer[1]<=0.0080) &&
                                            //h4 [2]下影線須小於90點,[2]下影線須小於110
                    open_240_buffer[2]-low_240_buffer[2]<=0.0090 && open_240_buffer[1]-low_240_buffer[1]<=0.0100) 
                    return;
                    else                               
                                       //使用 M30 不考慮 MACD 大小於199狀況  
                    OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-35*Point,Ask+2000*Point,"My order #B7",8807,0,OrangeRed );
            
     }
    
    
    

//***************************************************************************************************************************             
//+++++++++++++++++++++++++++++++++++++++++++   SELL   1   ++++++++++++++++++++++++++++++++++++++++++++++++++          
           
    if (OrdersTotal()<=1)   
     {                                   //m15 的ma45  ma90 為 ㄏ 上升末端型態
          if (ma45_15_buffer[1]-ma45_15_buffer[2]>=0 &&  ma45_15_buffer[1]-ma45_15_buffer[6]<=0.0016 && 
              ma90_15_buffer[1]-ma90_15_buffer[2]>=0 &&  ma90_15_buffer[1]-ma90_15_buffer[6]<=0.0013 && 
                                                     //上升末端下跌要一次跌破前3bar
              close_15_buffer[1]-close_15_buffer[2]<=-0.0001  &&  
                                                 //用m15 m30 macd 控管買賣點 
              macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00015 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&
              macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00035 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&
                                                   //k1 (k2||k3)已下跌
              k1_15_buffer[1]-k1_15_buffer[2]<=-1  &&  k1_15_buffer[1]-d1_15_buffer[1]<=-1 &&
              k2_15_buffer[1]-k2_15_buffer[2]<=0  ||  k3_15_buffer[1]-k3_15_buffer[2]<=0)
                                      //m15,m30,m60 的ma45,ma90,ma180,ma360全部上上多頭排列
               if ((ma45_15_buffer[1]-ma90_15_buffer[1]>=0.0005 && ma90_15_buffer[1]-ma180_15_buffer[1]>=0.0005 && ma180_15_buffer[1]-ma360_15_buffer[1]>=0.0005 && 
                   ma45_30_buffer[1]-ma90_30_buffer[1]>=0.0005 && ma90_30_buffer[1]-ma180_30_buffer[1]>=0.0005 &&  
                   ma45_60_buffer[1]-ma180_60_buffer[1]>=0.0005 &&  
                   ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0 &&
                   ma180_15_buffer[1]-ma180_15_buffer[2]>=0 && ma360_15_buffer[1]-ma360_15_buffer[2]>=0 &&
                   ma45_30_buffer[1]-ma45_30_buffer[2]>=0 && ma90_30_buffer[1]-ma90_30_buffer[2]>=0 &&
                   ma180_30_buffer[1]-ma180_30_buffer[2]>=0 && ma360_30_buffer[1]-ma360_30_buffer[2]>=0 &&
                   ma45_60_buffer[1]-ma45_60_buffer[2]>=0 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0 &&
                   ma180_60_buffer[1]-ma180_60_buffer[2]>=0 && ma360_60_buffer[1]-ma360_60_buffer[2]>=0 &&
                                             //m15的收盤價不低於h4的ma08下30點
                   close_15_buffer[1]-ma08_240_buffer[1]>=-0.0030 && 
                                             //m15的收盤價收黑但必須在80點內 ,上影線必須在80點內
                  (close_15_buffer[1]-open_15_buffer[1]>=-0.0080 || close_15_buffer[1]-high_15_buffer[1]>=-0.0080) &&
                                             //h4 [2]上影線須小於90點,[2]上影線須小於110
                   close_240_buffer[2]-high_240_buffer[2]>=-0.0090 && close_240_buffer[1]-high_240_buffer[1]>=-0.0100) || 
                                                //在macd正負199內不交易
                   (macdmainline_15_buffer[1]>=-0.00199 && macdmainline_15_buffer[1]<=0.00199 &&
                    macdmainline_30_buffer[1]>=-0.00199 && macdmainline_30_buffer[1]<=0.00199))
                    return;
                    else                               
                    OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+28*Point,Bid-450*Point,"My order #S1",4401,0,Green );
//+++++++++++++++++++++++++++++++++++++++++++   SELL   2   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                          //  順ma45,ma90,ma180下跌趨勢 kd1<=1 k1 (k2||k3)為向下

          if ((ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=0) || 
              (ma90_15_buffer[1]-ma90_15_buffer[2]<=0 && ma180_15_buffer[1]-ma180_15_buffer[2]<=0) &&
                                                    //用m15 m30 macd 控管買賣點                                                    
               macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00015 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&
               macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00035 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&
             
               k1_15_buffer[1]>=40 && k2_15_buffer[1]>=40 && k3_15_buffer[1]>=40 && 
               k1_15_buffer[1]-k1_15_buffer[2]<=-1  &&  k1_15_buffer[1]-d1_15_buffer[1]<=-1 && 
              (k2_15_buffer[1]-k2_15_buffer[2]<=0  ||  k3_15_buffer[1]-k3_15_buffer[2]<=0))         

                                     //m15,m30,m60 的ma45,ma90,ma180,ma360全部上上多頭排列
               if ((ma45_15_buffer[1]-ma90_15_buffer[1]>=0.0005 && ma90_15_buffer[1]-ma180_15_buffer[1]>=0.0005 && ma180_15_buffer[1]-ma360_15_buffer[1]>=0.0005 && 
                   ma45_30_buffer[1]-ma90_30_buffer[1]>=0.0005 && ma90_30_buffer[1]-ma180_30_buffer[1]>=0.0005 &&  
                   ma45_60_buffer[1]-ma180_60_buffer[1]>=0.0005 &&  
                   ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0 &&
                   ma180_15_buffer[1]-ma180_15_buffer[2]>=0 && ma360_15_buffer[1]-ma360_15_buffer[2]>=0 &&
                   ma45_30_buffer[1]-ma45_30_buffer[2]>=0 && ma90_30_buffer[1]-ma90_30_buffer[2]>=0 &&
                   ma180_30_buffer[1]-ma180_30_buffer[2]>=0 && ma360_30_buffer[1]-ma360_30_buffer[2]>=0 &&
                   ma45_60_buffer[1]-ma45_60_buffer[2]>=0 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0 &&
                   ma180_60_buffer[1]-ma180_60_buffer[2]>=0 && ma360_60_buffer[1]-ma360_60_buffer[2]>=0 &&
                                             //m15的收盤價不低於h4的ma08下30點
                   close_15_buffer[1]-ma08_240_buffer[1]>=-0.0030 && 
                                          //m15的收盤價收黑但必須在80點內 ,上影線必須在80點內
                  (close_15_buffer[1]-open_15_buffer[1]>=-0.0080 || close_15_buffer[1]-high_15_buffer[1]>=-0.0080) &&
                                         
                                             //h4 [2]上影線須小於90點,[2]上影線須小於110
                   close_240_buffer[2]-high_240_buffer[2]>=-0.0090 && close_240_buffer[1]-high_240_buffer[1]>=-0.0100) ||  
                                              //在macd正負199內不交易
                  (macdmainline_15_buffer[1]>=-0.00199 && macdmainline_15_buffer[1]<=0.00199 &&
                   macdmainline_30_buffer[1]>=-0.00199 && macdmainline_30_buffer[1]<=0.00199))
                   return;
                   else                               
                   OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+28*Point,Bid-450*Point,"My order #S2",4402,0,White );
      
//+++++++++++++++++++++++++++++++++++++++++++   SELL   3   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                       //在ma45,ma90,ma180斜下時,k1,k2,k3>70 並且收黑 或收2小黑
        if   ((k1_15_buffer[1]-k1_15_buffer[2]<=-5  &&  k1_15_buffer[1]-d1_15_buffer[1]<=-5 &&
               k1_15_buffer[1]>=70 && k2_15_buffer[1]>=70  &&  k3_15_buffer[1]>=70 && 
             ((close_15_buffer[1]-open_15_buffer[1]<=-0.0005 &&  close_15_buffer[1]-close_15_buffer[2]>=0.0001) ||
              (close_15_buffer[1]-open_15_buffer[1]<=0 &&  close_15_buffer[2]-open_15_buffer[2]<=0)) &&
                                        
               (ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=0) || 
               (ma90_15_buffer[1]-ma90_15_buffer[2]<=0 && ma180_15_buffer[1]-ma180_15_buffer[2]<=0) && 
                                                     
                                                 //用m15 m30 macd 控管買賣點 
                macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00055 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&
                macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00065 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020))
                                     //m15,m30,m60 的ma45,ma90,ma180,ma360全部上上多頭排列
               if ((ma45_15_buffer[1]-ma90_15_buffer[1]>=0.0005 && ma90_15_buffer[1]-ma180_15_buffer[1]>=0.0005 && ma180_15_buffer[1]-ma360_15_buffer[1]>=0.0005 && 
                   ma45_30_buffer[1]-ma90_30_buffer[1]>=0.0005 && ma90_30_buffer[1]-ma180_30_buffer[1]>=0.0005 &&  
                   ma45_60_buffer[1]-ma180_60_buffer[1]>=0.0005 &&  
                   ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0 &&
                   ma180_15_buffer[1]-ma180_15_buffer[2]>=0 && ma360_15_buffer[1]-ma360_15_buffer[2]>=0 &&
                   ma45_30_buffer[1]-ma45_30_buffer[2]>=0 && ma90_30_buffer[1]-ma90_30_buffer[2]>=0 &&
                   ma180_30_buffer[1]-ma180_30_buffer[2]>=0 && ma360_30_buffer[1]-ma360_30_buffer[2]>=0 &&
                   ma45_60_buffer[1]-ma45_60_buffer[2]>=0 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0 &&
                   ma180_60_buffer[1]-ma180_60_buffer[2]>=0 && ma360_60_buffer[1]-ma360_60_buffer[2]>=0 &&
                                             //m15的收盤價不低於h4的ma08下30點
                   close_15_buffer[1]-ma08_240_buffer[1]>=-0.0030 && 
                                           //m15的收盤價收黑但必須在80點內 ,上影線必須在80點內
                  (close_15_buffer[1]-open_15_buffer[1]>=-0.0080 || close_15_buffer[1]-high_15_buffer[1]>=-0.0080) &&
                
                                             //h4 [2]上影線須小於90點,[2]上影線須小於110
                   close_240_buffer[2]-high_240_buffer[2]>=-0.0090 && close_240_buffer[1]-high_240_buffer[1]>=-0.0100)) 
                   return;
                   else                               
                                           //因為順勢所以不考慮 MACD 大小於99狀況  
                   OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+28*Point,Bid-450*Point,"My order #S3",4403,0,Lime );
 
//+++++++++++++++++++++++++++++++++++++++++++   SELL   4   ++++++++++++++++++++++++++++++++++++++++++++++++++          
         
                              //m15 的ma180,ma360 or ma360,ma650 or ma650 下跌幅度大 升過ma180 ,ma360,ma650時 收紅下賣單
                                             
          if   (((ma180_15_buffer[1]-ma180_15_buffer[40]<=-0.0020 && ma360_15_buffer[1]-ma360_15_buffer[40]<=-0.0020 &&
                  ma180_15_buffer[1]-ma360_15_buffer[1]<=-0.0015 && ma360_15_buffer[1]-ma650_15_buffer[1]<=-0.0015 && 
                                             //m45,m90斜度必須較小
         //       (ma45_15_buffer[1]-ma45_15_buffer[6]>=-0.0013 && ma90_15_buffer[1]-ma90_15_buffer[6]>=-0.0013) || 
                                          //m15  macd 差值不可太大 
                (macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00120 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020) &&
                                        //k1,k2,k3 >=82
                k1_15_buffer[1]>=82 && k2_15_buffer[1]>=82  &&  k3_15_buffer[1]>=82 && 
                                        //[1]收紅 且>=0.0006  [1]>= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]>=0.0006 && close_15_buffer[1]-ma180_15_buffer[1]>=0.0006) ||
                
               
               (ma360_15_buffer[1]-ma360_15_buffer[40]<=-0.0020 && ma650_15_buffer[1]-ma650_15_buffer[40]<=-0.0020 &&
                ma180_15_buffer[1]-ma360_15_buffer[1]<=-0.0015 && ma360_15_buffer[1]-ma650_15_buffer[1]<=-0.0015 && 
                                          //m45,m90斜度必須較小
         //       (ma45_15_buffer[1]-ma45_15_buffer[6]>=-0.0013 && ma90_15_buffer[1]-ma90_15_buffer[6]>=-0.0013) || 
                                          //m15  macd 差值不可太大 
                (macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00120 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020) &&
                                            //k1,k2,k3 >=82
                k1_15_buffer[1]>=82 && k2_15_buffer[1]>=82  &&  k3_15_buffer[1]>=82 && 
                                        //[1]收紅 且>=0.0006  [1]>= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]>=0.0006 && close_15_buffer[1]-ma360_15_buffer[1]>=0.0006) ||
                
                (ma650_15_buffer[1]-ma650_15_buffer[40]<=-0.0020 &&
                ma180_15_buffer[1]-ma360_15_buffer[1]<=-0.0015 && ma360_15_buffer[1]-ma650_15_buffer[1]<=-0.0015 && 
                                          //m45,m90斜度必須較小
        //        (ma45_15_buffer[1]-ma45_15_buffer[6]>=-0.0013 && ma90_15_buffer[1]-ma90_15_buffer[6]>=-0.0013) || 
                                          //m15  macd 差值不可太大 
                (macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00120 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020) &&
                                        //k1,k2,k3 >=70
                k1_15_buffer[1]>=82 && k2_15_buffer[1]>=82  &&  k3_15_buffer[1]>=82 && 
                                        //[1]收紅 且>=0.0006  [1]>= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]>=0.0006 && close_15_buffer[1]-ma360_15_buffer[1]>=0.0006)) ||
           
                                  
                                  
                                       //m15 的ma180,ma360 or ma360,ma650 or ma650 下跌幅度大
                                             
               ((ma180_15_buffer[1]-ma180_15_buffer[40]<=-0.0050 && ma360_15_buffer[1]-ma360_15_buffer[40]<=-0.0040 &&
                 ma180_15_buffer[1]-ma360_15_buffer[1]<=-0.0015 && ma360_15_buffer[1]-ma650_15_buffer[1]<=-0.0015 &&                    
                                         //m45,m90斜度必須較小
        //        (ma45_15_buffer[1]-ma45_15_buffer[6]>=-0.0013 && ma90_15_buffer[1]-ma90_15_buffer[6]>=-0.0013) || 
                                          //m15  macd 差值不可太大 
                (macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00120 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020) &&
                                         //k1,k2,k3 >=70
                k1_15_buffer[1]>=70 && k2_15_buffer[1]>=70  &&  k3_15_buffer[1]>=70 && 
                                        //[1]收紅 且>=0.0006  [1]>= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]>=0.0006 && close_15_buffer[1]-ma180_15_buffer[1]>=0.0006) ||
                
               
               (ma360_15_buffer[1]-ma360_15_buffer[40]<=-0.0040 && ma650_15_buffer[1]-ma650_15_buffer[40]<=-0.0030 &&
                 ma180_15_buffer[1]-ma360_15_buffer[1]<=-0.0015 && ma360_15_buffer[1]-ma650_15_buffer[1]<=-0.0015 && 
                                         //m45,m90斜度必須較小
        //        (ma45_15_buffer[1]-ma45_15_buffer[6]>=-0.0013 && ma90_15_buffer[1]-ma90_15_buffer[6]>=-0.0013) || 
                                          //m15  macd 差值不可太大 
                (macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00120 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020) &&
                                          //k1,k2,k3 >=70
                k1_15_buffer[1]>=70 && k2_15_buffer[1]>=70  &&  k3_15_buffer[1]>=70 && 
                                        //[1]收紅 且>=0.0006  [1]>= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]>=0.0006 && close_15_buffer[1]-ma360_15_buffer[1]>=0.0006) ||
                
                (ma650_15_buffer[1]-ma650_15_buffer[40]<=-0.0030 &&
                 ma180_15_buffer[1]-ma360_15_buffer[1]<=-0.0015 && ma360_15_buffer[1]-ma650_15_buffer[1]<=-0.0015 &&  
                                        //m45,m90斜度必須較小
        //        (ma45_15_buffer[1]-ma45_15_buffer[6]>=-0.0013 && ma90_15_buffer[1]-ma90_15_buffer[6]>=-0.0013) || 
                                          //m15  macd 差值不可太大 
                (macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00120 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020) &&
                                              //k1,k2,k3 >=70
                k1_15_buffer[1]>=70 && k2_15_buffer[1]>=70  &&  k3_15_buffer[1]>=70 && 
                                        //[1]收紅 且>=0.0006  [1]>= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]>=0.0006 && close_15_buffer[1]-ma360_15_buffer[1]>=0.0006)))
           
                                          //m15,m30,m60 的ma45,ma90,ma180,ma360全部上上多頭排列
               if ((ma45_15_buffer[1]-ma90_15_buffer[1]>=0.0005 && ma90_15_buffer[1]-ma180_15_buffer[1]>=0.0005 && ma180_15_buffer[1]-ma360_15_buffer[1]>=0.0005 && 
                   ma45_30_buffer[1]-ma90_30_buffer[1]>=0.0005 && ma90_30_buffer[1]-ma180_30_buffer[1]>=0.0005 &&  
                   ma45_60_buffer[1]-ma180_60_buffer[1]>=0.0005 &&  
                   ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0 &&
                   ma180_15_buffer[1]-ma180_15_buffer[2]>=0 && ma360_15_buffer[1]-ma360_15_buffer[2]>=0 &&
                   ma45_30_buffer[1]-ma45_30_buffer[2]>=0 && ma90_30_buffer[1]-ma90_30_buffer[2]>=0 &&
                   ma180_30_buffer[1]-ma180_30_buffer[2]>=0 && ma360_30_buffer[1]-ma360_30_buffer[2]>=0 &&
                   ma45_60_buffer[1]-ma45_60_buffer[2]>=0 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0 &&
                   ma180_60_buffer[1]-ma180_60_buffer[2]>=0 && ma360_60_buffer[1]-ma360_60_buffer[2]>=0 &&
                                             //m15的收盤價不低於h4的ma08下30點
                   close_15_buffer[1]-ma08_240_buffer[1]>=-0.0030 && 
                                           //m15的收盤價收黑但必須在80點內 ,上影線必須在80點內
                  (close_15_buffer[1]-open_15_buffer[1]>=-0.0080 || close_15_buffer[1]-high_15_buffer[1]>=-0.0080) &&
                                             //h4 [2]上影線須小於90點,[2]上影線須小於110
                   close_240_buffer[2]-high_240_buffer[2]>=-0.0090 && close_240_buffer[1]-high_240_buffer[1]>=-0.0100) ||  
                                          //在macd正負199內不交易
                   (macdmainline_15_buffer[1]>=-0.00199 && macdmainline_15_buffer[1]<=0.00199 &&
                    macdmainline_30_buffer[1]>=-0.00199 && macdmainline_30_buffer[1]<=0.00199) ||
                   (k1_15_buffer[1]>=92 && k2_15_buffer[1]>=92 &&  k3_15_buffer[1]>=92))
                    return;
                    else                               
                    OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+23*Point,Bid-450*Point,"My order #S4",4404,0,Gray );
                    sellorder4=OrderTicket();
       
    //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   sell  5     +++++++++++++++++++++
                                     
                                     //上影線超過25點   [1]為負時開-高  [1]為正時收-開
    
      if  ((close_15_buffer[1]-open_15_buffer[1]<=-0.0001 && high_15_buffer[1]-open_15_buffer[1]>=0.0024) ||
          (close_15_buffer[1]-open_15_buffer[1]>=0.0001   && high_15_buffer[1]-close_15_buffer[1]>=0.0024) &&
           high_15_buffer[1]==M15highest40bar  && 
           k1_15_buffer[1]-k1_15_buffer[2]<=0 && k2_15_buffer[1]-k2_15_buffer[2]<=0 && k3_15_buffer[1]-k3_15_buffer[2]<=0   &&
           macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00090 && 
           macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00010) 
                                                 //避開超過100點 
           if ((close_15_buffer[2]-open_15_buffer[2]>=0.0100 || close_15_buffer[1]-open_15_buffer[1]>=0.0100 ||
               macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=0.00120 || 
               macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=-0.00050) ||
                                                //避開下跌後之反彈
              (open_15_buffer[3]-open_15_buffer[2]>=-0.0003 && open_15_buffer[4]-open_15_buffer[2]>=-0.0003) ||    
              (open_15_buffer[2]-open_15_buffer[1]>=-0.0003 && open_15_buffer[3]-open_15_buffer[1]>=-0.0003) ||     
                                 //m15,m30,m60 的ma45,ma90,ma180,ma360全部上上多頭排列
               (ma45_15_buffer[1]-ma90_15_buffer[1]>=0.0005 && ma90_15_buffer[1]-ma180_15_buffer[1]>=0.0005 && ma180_15_buffer[1]-ma360_15_buffer[1]>=0.0005 && 
                ma45_30_buffer[1]-ma90_30_buffer[1]>=0.0005 && ma90_30_buffer[1]-ma180_30_buffer[1]>=0.0005 &&  
                ma45_60_buffer[1]-ma180_60_buffer[1]>=0.0005 &&  
                ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0 &&
                ma180_15_buffer[1]-ma180_15_buffer[2]>=0 && ma360_15_buffer[1]-ma360_15_buffer[2]>=0 &&
                ma45_30_buffer[1]-ma45_30_buffer[2]>=0 && ma90_30_buffer[1]-ma90_30_buffer[2]>=0 &&
                ma180_30_buffer[1]-ma180_30_buffer[2]>=0 && ma360_30_buffer[1]-ma360_30_buffer[2]>=0 &&
                ma45_60_buffer[1]-ma45_60_buffer[2]>=0 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0 &&
                ma180_60_buffer[1]-ma180_60_buffer[2]>=0 && ma360_60_buffer[1]-ma360_60_buffer[2]>=0 &&
                                          //m15的收盤價不低於h4的ma08下30點
                close_15_buffer[1]-ma08_240_buffer[1]>=-0.0030 && 
                                         //m15的收盤價收黑但必須在80點內 ,上影線必須在80點內
                (close_15_buffer[1]-open_15_buffer[1]>=-0.0080 || close_15_buffer[1]-high_15_buffer[1]>=-0.0080) &&
                                          //h4 [2]上影線須小於90點,[2]上影線須小於110
                close_240_buffer[2]-high_240_buffer[2]>=-0.0090 && close_240_buffer[1]-high_240_buffer[1]>=-0.0100 &&
                                          //不加此條有上影線一條超過90點會執行
                close_240_buffer[1]-open_240_buffer[1]<=-0.0005) ||  
                                          //在macd正負199內不交易
               (macdmainline_15_buffer[1]>=-0.00199 && macdmainline_15_buffer[1]<=0.00199 &&
                macdmainline_30_buffer[1]>=-0.00199 && macdmainline_30_buffer[1]<=0.00199))
                return;
                else                   
                OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+23*Point,Bid-2000*Point,"My order #S5",4405,0,Aqua );

     //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   sell  6     +++++++++++++++++++++

                                
                                     //上影線超過40點   [1]為負時開-高  [1]為正時收-開
      if ((close_15_buffer[1]-open_15_buffer[1]<=-0.0001 && high_15_buffer[1]-open_15_buffer[1]>=0.0040) ||
          (close_15_buffer[1]-open_15_buffer[1]>=0.0001  && high_15_buffer[1]-close_15_buffer[1]>=0.0040) &&
           high_15_buffer[1]==M15highest40bar && 
           k1_15_buffer[1]-k1_15_buffer[2]<=0 && k2_15_buffer[1]-k2_15_buffer[2]<=0 && k3_15_buffer[1]-k3_15_buffer[2]<=0)  
                                                 //避開超過100點 
           if ((close_15_buffer[2]-open_15_buffer[2]>=0.0100 || close_15_buffer[1]-open_15_buffer[1]>=0.0100 ||
               macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=0.00120 || 
               macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=-0.00050) ||
                                                //避開下跌後之反彈
              (open_15_buffer[3]-open_15_buffer[2]>=-0.0003 && open_15_buffer[4]-open_15_buffer[2]>=-0.0003) ||    
              (open_15_buffer[2]-open_15_buffer[1]>=-0.0003 && open_15_buffer[3]-open_15_buffer[1]>=-0.0003) ||     
                                //m15,m30,m60 的ma45,ma90,ma180,ma360全部上上多頭排列
               (ma45_15_buffer[1]-ma90_15_buffer[1]>=0.0005 && ma90_15_buffer[1]-ma180_15_buffer[1]>=0.0005 && ma180_15_buffer[1]-ma360_15_buffer[1]>=0.0005 && 
                ma45_30_buffer[1]-ma90_30_buffer[1]>=0.0005 && ma90_30_buffer[1]-ma180_30_buffer[1]>=0.0005 &&  
                ma45_60_buffer[1]-ma180_60_buffer[1]>=0.0005 &&  
                ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0 &&
                ma180_15_buffer[1]-ma180_15_buffer[2]>=0 && ma360_15_buffer[1]-ma360_15_buffer[2]>=0 &&
                ma45_30_buffer[1]-ma45_30_buffer[2]>=0 && ma90_30_buffer[1]-ma90_30_buffer[2]>=0 &&
                ma180_30_buffer[1]-ma180_30_buffer[2]>=0 && ma360_30_buffer[1]-ma360_30_buffer[2]>=0 &&
                ma45_60_buffer[1]-ma45_60_buffer[2]>=0 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0 &&
                ma180_60_buffer[1]-ma180_60_buffer[2]>=0 && ma360_60_buffer[1]-ma360_60_buffer[2]>=0 &&
                                          //m15的收盤價不低於h4的ma08下30點
                close_15_buffer[1]-ma08_240_buffer[1]>=-0.0030 && 
                                      //m15的收盤價收黑但必須在80點內 ,上影線必須在80點內
               (close_15_buffer[1]-open_15_buffer[1]>=-0.0080 || close_15_buffer[1]-high_15_buffer[1]>=-0.0080) &&
                                          //h4 [2]上影線須小於90點,[2]上影線須小於110
                close_240_buffer[2]-high_240_buffer[2]>=-0.0090 && close_240_buffer[1]-high_240_buffer[1]>=-0.0100 &&
                                      //不加此條有上影線一條超過90點會執行   
                close_240_buffer[1]-open_240_buffer[1]<=-0.0005) ||  
                                        //在macd正負199內不交易
               (macdmainline_15_buffer[1]>=-0.00199 && macdmainline_15_buffer[1]<=0.00199 &&
                macdmainline_30_buffer[1]>=-0.00199 && macdmainline_30_buffer[1]<=0.00199))
                return;
                else              
                OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+23*Point,Bid-2000*Point,"My order #S6",4406,0,Teal );
  
     //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   sell  7     +++++++++++++++++++++

                                 // M30 收黑,ma05,ma12間距小
       if    (close_30_buffer[1]-open_30_buffer[1]<=-0.0010 && ma05_30_buffer[1]-ma12_30_buffer[1]<=0.0012 && 
                                  //macd 已近反轉處
              macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00020 && 
              macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]>=-0.00050 &&
                                  //macd signal為上升狀態
             (macdsignalline_30_buffer[1]-macdsignalline_30_buffer[2])-(macdsignalline_30_buffer[2]-macdsignalline_30_buffer[3])<=-0.00002 && 
                                                       //k1,k2,k3 >=70
              k1_15_buffer[1]>=70 && k2_15_buffer[1]>=70  &&  k3_15_buffer[1]>=70 && 
                                  //k1,k2,k3任2個皆為下跌狀態
              k1_30_buffer[1]-k1_30_buffer[2]<=0 && (k2_30_buffer[1]-k2_30_buffer[2]<=0 || k3_30_buffer[1]-k3_30_buffer[2]<=0)  ||
             (k2_30_buffer[1]-k2_30_buffer[2]<=0 && k3_30_buffer[1]-k3_30_buffer[2]<=0))                                           
                                        //m15,m30,m60 的ma45,ma90,ma180,ma360全部上上多頭排列
               if ((ma45_15_buffer[1]-ma90_15_buffer[1]>=0.0005 && ma90_15_buffer[1]-ma180_15_buffer[1]>=0.0005 && ma180_15_buffer[1]-ma360_15_buffer[1]>=0.0005 && 
                   ma45_30_buffer[1]-ma90_30_buffer[1]>=0.0005 && ma90_30_buffer[1]-ma180_30_buffer[1]>=0.0005 &&  
                   ma45_60_buffer[1]-ma180_60_buffer[1]>=0.0005 &&  
                   ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0 &&
                   ma180_15_buffer[1]-ma180_15_buffer[2]>=0 && ma360_15_buffer[1]-ma360_15_buffer[2]>=0 &&
                   ma45_30_buffer[1]-ma45_30_buffer[2]>=0 && ma90_30_buffer[1]-ma90_30_buffer[2]>=0 &&
                   ma180_30_buffer[1]-ma180_30_buffer[2]>=0 && ma360_30_buffer[1]-ma360_30_buffer[2]>=0 &&
                   ma45_60_buffer[1]-ma45_60_buffer[2]>=0 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0 &&
                   ma180_60_buffer[1]-ma180_60_buffer[2]>=0 && ma360_60_buffer[1]-ma360_60_buffer[2]>=0 &&
                                             //m15的收盤價不低於h4的ma08下30點
                   close_15_buffer[1]-ma08_240_buffer[1]>=-0.0030 && 
                                           //m15的收盤價收黑但必須在80點內 ,上影線必須在80點內
                  (close_15_buffer[1]-open_15_buffer[1]>=-0.0080 || close_15_buffer[1]-high_15_buffer[1]>=-0.0080) &&
                                            //h4 [2]上影線須小於90點,[2]上影線須小於110
                   close_240_buffer[2]-high_240_buffer[2]>=-0.0090 && close_240_buffer[1]-high_240_buffer[1]>=-0.0100 )) 
                   return;
                   else                               
                                           //使用 M60 不考慮 MACD 大小於99狀況  
                   OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+35*Point,Bid-2000*Point,"My order #S7",4407,0,Olive );
            
    
       
    }
  


 if (OrdersTotal()>0)
 {
   for (cnt=0;cnt<OrdersTotal();cnt++)
     {
       OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES);
 
//+++++++++++++++++++++++++++++++++++++++++++   CLOSE   BUY   1   ++++++++++++++++++++++++++++++++++++++++++++++++++          

     if   (OrderType()==OP_BUY)       
      {                                             
                                                //m15 的ma45  ma90 為 ㄏ 上升末端型態
          if (ma45_15_buffer[1]-ma45_15_buffer[2]>=0 &&  ma45_15_buffer[1]-ma45_15_buffer[6]<=0.0016 && 
              ma90_15_buffer[1]-ma90_15_buffer[2]>=0 &&  ma90_15_buffer[1]-ma90_15_buffer[6]<=0.0013 && 
                                                     //上升末端下跌要一次跌破前3bar
              close_15_buffer[1]-close_15_buffer[2]<=-0.0001  &&  
                                                 //用m15 m30 macd 控管買賣點 
              macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00015 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&
              macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00035 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&
                                                   //k1 (k2||k3)已下跌
              k1_15_buffer[1]-k1_15_buffer[2]<=-1  &&  k1_15_buffer[1]-d1_15_buffer[1]<=-1 &&
              k2_15_buffer[1]-k2_15_buffer[2]<=0  ||  k3_15_buffer[1]-k3_15_buffer[2]<=0)
                                       //m15,m30,m60 的ma45,ma90,ma180,ma360全部上上多頭排列
               if ((ma45_15_buffer[1]-ma90_15_buffer[1]>=0.0005 && ma90_15_buffer[1]-ma180_15_buffer[1]>=0.0005 && ma180_15_buffer[1]-ma360_15_buffer[1]>=0.0005 && 
                   ma45_30_buffer[1]-ma90_30_buffer[1]>=0.0005 && ma90_30_buffer[1]-ma180_30_buffer[1]>=0.0005 &&  
                   ma45_60_buffer[1]-ma180_60_buffer[1]>=0.0005 &&  
                   ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0 &&
                   ma180_15_buffer[1]-ma180_15_buffer[2]>=0 && ma360_15_buffer[1]-ma360_15_buffer[2]>=0 &&
                   ma45_30_buffer[1]-ma45_30_buffer[2]>=0 && ma90_30_buffer[1]-ma90_30_buffer[2]>=0 &&
                   ma180_30_buffer[1]-ma180_30_buffer[2]>=0 && ma360_30_buffer[1]-ma360_30_buffer[2]>=0 &&
                   ma45_60_buffer[1]-ma45_60_buffer[2]>=0 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0 &&
                   ma180_60_buffer[1]-ma180_60_buffer[2]>=0 && ma360_60_buffer[1]-ma360_60_buffer[2]>=0 &&
                                             //m15的收盤價不低於h4的ma08下30點
                   close_15_buffer[1]-ma08_240_buffer[1]>=-0.0030 && 
                                            //m15的收盤價收黑但必須在80點內 ,上影線必須在80點內
                  (close_15_buffer[1]-open_15_buffer[1]>=-0.0080 || close_15_buffer[1]-high_15_buffer[1]>=-0.0080) &&
                                             //h4 [2]上影線須小於90點,[2]上影線須小於110
                   close_240_buffer[2]-high_240_buffer[2]>=-0.0090 && close_240_buffer[1]-high_240_buffer[1]>=-0.0100) ||  
                                          //在macd正負199內不交易
                  (macdmainline_15_buffer[1]>=-0.00199 && macdmainline_15_buffer[1]<=0.00199 &&
                   macdmainline_30_buffer[1]>=-0.00199 && macdmainline_30_buffer[1]<=0.00199))
                   return;
                   else                               
                   OrderClose(OrderTicket(),lots,Ask,1,Red);    
    //                                                   //確定剛close買單,目前無單,不加此條會反覆close   
    //            if (TimeCurrent()-OrderCloseTime()<=100 && OrdersTotal()<=1)
                 
    //                OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+18*Point,Bid-300*Point,"My order #S2",4402,0,White );

//+++++++++++++++++++++++++++++++++++++++++++   CLOSE   BUY   2   ++++++++++++++++++++++++++++++++++++++++++++++++++          
          
                        //  順ma45,ma90,ma180下跌趨勢 kd1<=1 k1 (k2||k3)為向下

          if ((ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=0) || 
              (ma90_15_buffer[1]-ma90_15_buffer[2]<=0 && ma180_15_buffer[1]-ma180_15_buffer[2]<=0) &&
                                                    //用m15 m30 macd 控管買賣點                                                    
               macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00015 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&
               macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00035 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&
             
               k1_15_buffer[1]>=40 && k2_15_buffer[1]>=40 && k3_15_buffer[1]>=40 && 
               k1_15_buffer[1]-k1_15_buffer[2]<=-1  &&  k1_15_buffer[1]-d1_15_buffer[1]<=-1 && 
              (k2_15_buffer[1]-k2_15_buffer[2]<=0  ||  k3_15_buffer[1]-k3_15_buffer[2]<=0))         

                                    //m15,m30,m60 的ma45,ma90,ma180,ma360全部上上多頭排列
               if ((ma45_15_buffer[1]-ma90_15_buffer[1]>=0.0005 && ma90_15_buffer[1]-ma180_15_buffer[1]>=0.0005 && ma180_15_buffer[1]-ma360_15_buffer[1]>=0.0005 && 
                   ma45_30_buffer[1]-ma90_30_buffer[1]>=0.0005 && ma90_30_buffer[1]-ma180_30_buffer[1]>=0.0005 &&  
                   ma45_60_buffer[1]-ma180_60_buffer[1]>=0.0005 &&  
                   ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0 &&
                   ma180_15_buffer[1]-ma180_15_buffer[2]>=0 && ma360_15_buffer[1]-ma360_15_buffer[2]>=0 &&
                   ma45_30_buffer[1]-ma45_30_buffer[2]>=0 && ma90_30_buffer[1]-ma90_30_buffer[2]>=0 &&
                   ma180_30_buffer[1]-ma180_30_buffer[2]>=0 && ma360_30_buffer[1]-ma360_30_buffer[2]>=0 &&
                   ma45_60_buffer[1]-ma45_60_buffer[2]>=0 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0 &&
                   ma180_60_buffer[1]-ma180_60_buffer[2]>=0 && ma360_60_buffer[1]-ma360_60_buffer[2]>=0 &&
                                             //m15的收盤價不低於h4的ma08下30點
                   close_15_buffer[1]-ma08_240_buffer[1]>=-0.0030 && 
                                        //m15的收盤價收黑但必須在80點內 ,上影線必須在80點內
                  (close_15_buffer[1]-open_15_buffer[1]>=-0.0080 || close_15_buffer[1]-high_15_buffer[1]>=-0.0080) &&
                                         //h4 [2]上影線須小於90點,[2]上影線須小於110
                   close_240_buffer[2]-high_240_buffer[2]>=-0.0090 && close_240_buffer[1]-high_240_buffer[1]>=-0.0100) ||  
                                       //在macd正負199內不交易
                  (macdmainline_15_buffer[1]>=-0.00199 && macdmainline_15_buffer[1]<=0.00199 &&
                   macdmainline_30_buffer[1]>=-0.00199 && macdmainline_30_buffer[1]<=0.00199))
                   return;
                   else                               
                   OrderClose(OrderTicket(),lots,Ask,1,Yellow);    
    //                                                    //確定剛close買單,目前無單,不加此條會反覆close   
   //            if (TimeCurrent()-OrderCloseTime()<=100 && OrdersTotal()<=1)
                 
   //                OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+18*Point,Bid-300*Point,"My order #S3",4403,0,Lime );

//+++++++++++++++++++++++++++++++++++++++++++   CLOSE   BUY   3   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                   
                                           //在ma45,ma90,ma180斜下時,k1,k2,k3>70 並且收黑 或收2小黑
        if   ((k1_15_buffer[1]-k1_15_buffer[2]<=-5  &&  k1_15_buffer[1]-d1_15_buffer[1]<=-5 &&
               k1_15_buffer[1]>=70 && k2_15_buffer[1]>=70  &&  k3_15_buffer[1]>=70 && 
             ((close_15_buffer[1]-open_15_buffer[1]<=-0.0005 &&  close_15_buffer[1]-close_15_buffer[2]>=0.0001) ||
              (close_15_buffer[1]-open_15_buffer[1]<=0 &&  close_15_buffer[2]-open_15_buffer[2]<=0)) &&
                                        
               (ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=0) || 
               (ma90_15_buffer[1]-ma90_15_buffer[2]<=0 && ma180_15_buffer[1]-ma180_15_buffer[2]<=0) && 
                                                     
                                                 //用m15 m30 macd 控管買賣點 
                macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00055 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&
                macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00065 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020))
                                      //m15,m30,m60 的ma45,ma90,ma180,ma360全部上上多頭排列
               if ((ma45_15_buffer[1]-ma90_15_buffer[1]>=0.0005 && ma90_15_buffer[1]-ma180_15_buffer[1]>=0.0005 && ma180_15_buffer[1]-ma360_15_buffer[1]>=0.0005 && 
                   ma45_30_buffer[1]-ma90_30_buffer[1]>=0.0005 && ma90_30_buffer[1]-ma180_30_buffer[1]>=0.0005 &&  
                   ma45_60_buffer[1]-ma180_60_buffer[1]>=0.0005 &&  
                   ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0 &&
                   ma180_15_buffer[1]-ma180_15_buffer[2]>=0 && ma360_15_buffer[1]-ma360_15_buffer[2]>=0 &&
                   ma45_30_buffer[1]-ma45_30_buffer[2]>=0 && ma90_30_buffer[1]-ma90_30_buffer[2]>=0 &&
                   ma180_30_buffer[1]-ma180_30_buffer[2]>=0 && ma360_30_buffer[1]-ma360_30_buffer[2]>=0 &&
                   ma45_60_buffer[1]-ma45_60_buffer[2]>=0 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0 &&
                   ma180_60_buffer[1]-ma180_60_buffer[2]>=0 && ma360_60_buffer[1]-ma360_60_buffer[2]>=0 &&
                                             //m15的收盤價不低於h4的ma08下30點
                   close_15_buffer[1]-ma08_240_buffer[1]>=-0.0030 && 
                                             //m15的收盤價收黑但必須在80點內 ,上影線必須在80點內
                  (close_15_buffer[1]-open_15_buffer[1]>=-0.0080 || close_15_buffer[1]-high_15_buffer[1]>=-0.0080) &&
                                             //h4 [2]上影線須小於90點,[2]上影線須小於110
                   close_240_buffer[2]-high_240_buffer[2]>=-0.0090 && close_240_buffer[1]-high_240_buffer[1]>=-0.0100)) 
                   return;
                   else                               
                   OrderClose(OrderTicket(),lots,Ask,1,Blue);    
  //                                                     //確定剛close買單,目前無單,不加此條會反覆close   
  //             if (TimeCurrent()-OrderCloseTime()<=100 && OrdersTotal()<=1)
                 
  //                OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+18*Point,Bid-300*Point,"My order #S4",4404,0,Gray );

//+++++++++++++++++++++++++++++++++++++++++++   CLOSE   BUY   4   ++++++++++++++++++++++++++++++++++++++++++++++++++          
         
                           //m15 的ma180,ma360 or ma360,ma650 or ma650 下跌幅度大 升過ma180 ,ma360,ma650時 收紅下賣單
                                             
          if   (((ma180_15_buffer[1]-ma180_15_buffer[40]<=-0.0020 && ma360_15_buffer[1]-ma360_15_buffer[40]<=-0.0020 &&
                  ma180_15_buffer[1]-ma360_15_buffer[1]<=-0.0015 && ma360_15_buffer[1]-ma650_15_buffer[1]<=-0.0015 && 
                                             //m45,m90斜度必須較小
         //       (ma45_15_buffer[1]-ma45_15_buffer[6]>=-0.0013 && ma90_15_buffer[1]-ma90_15_buffer[6]>=-0.0013) || 
                                          //m15  macd 差值不可太大 
                (macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00120 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020) &&
                                        //k1,k2,k3 >=82
                k1_15_buffer[1]>=82 && k2_15_buffer[1]>=82  &&  k3_15_buffer[1]>=82 && 
                                        //[1]收紅 且>=0.0006  [1]>= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]>=0.0006 && close_15_buffer[1]-ma180_15_buffer[1]>=0.0006) ||
                
               
               (ma360_15_buffer[1]-ma360_15_buffer[40]<=-0.0020 && ma650_15_buffer[1]-ma650_15_buffer[40]<=-0.0020 &&
                ma180_15_buffer[1]-ma360_15_buffer[1]<=-0.0015 && ma360_15_buffer[1]-ma650_15_buffer[1]<=-0.0015 && 
                                          //m45,m90斜度必須較小
         //       (ma45_15_buffer[1]-ma45_15_buffer[6]>=-0.0013 && ma90_15_buffer[1]-ma90_15_buffer[6]>=-0.0013) || 
                                          //m15  macd 差值不可太大 
                (macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00120 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020) &&
                                            //k1,k2,k3 >=82
                k1_15_buffer[1]>=82 && k2_15_buffer[1]>=82  &&  k3_15_buffer[1]>=82 && 
                                        //[1]收紅 且>=0.0006  [1]>= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]>=0.0006 && close_15_buffer[1]-ma360_15_buffer[1]>=0.0006) ||
                
                (ma650_15_buffer[1]-ma650_15_buffer[40]<=-0.0020 &&
                ma180_15_buffer[1]-ma360_15_buffer[1]<=-0.0015 && ma360_15_buffer[1]-ma650_15_buffer[1]<=-0.0015 && 
                                          //m45,m90斜度必須較小
        //        (ma45_15_buffer[1]-ma45_15_buffer[6]>=-0.0013 && ma90_15_buffer[1]-ma90_15_buffer[6]>=-0.0013) || 
                                          //m15  macd 差值不可太大 
                (macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00120 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020) &&
                                        //k1,k2,k3 >=70
                k1_15_buffer[1]>=82 && k2_15_buffer[1]>=82  &&  k3_15_buffer[1]>=82 && 
                                        //[1]收紅 且>=0.0006  [1]>= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]>=0.0006 && close_15_buffer[1]-ma360_15_buffer[1]>=0.0006)) ||
           
                                  
                                  
                                       //m15 的ma180,ma360 or ma360,ma650 or ma650 下跌幅度大
                                             
               ((ma180_15_buffer[1]-ma180_15_buffer[40]<=-0.0050 && ma360_15_buffer[1]-ma360_15_buffer[40]<=-0.0040 &&
                 ma180_15_buffer[1]-ma360_15_buffer[1]<=-0.0015 && ma360_15_buffer[1]-ma650_15_buffer[1]<=-0.0015 &&                    
                                         //m45,m90斜度必須較小
        //        (ma45_15_buffer[1]-ma45_15_buffer[6]>=-0.0013 && ma90_15_buffer[1]-ma90_15_buffer[6]>=-0.0013) || 
                                          //m15  macd 差值不可太大 
                (macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00120 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020) &&
                                         //k1,k2,k3 >=70
                k1_15_buffer[1]>=70 && k2_15_buffer[1]>=70  &&  k3_15_buffer[1]>=70 && 
                                        //[1]收紅 且>=0.0006  [1]>= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]>=0.0006 && close_15_buffer[1]-ma180_15_buffer[1]>=0.0006) ||
                
               
               (ma360_15_buffer[1]-ma360_15_buffer[40]<=-0.0040 && ma650_15_buffer[1]-ma650_15_buffer[40]<=-0.0030 &&
                 ma180_15_buffer[1]-ma360_15_buffer[1]<=-0.0015 && ma360_15_buffer[1]-ma650_15_buffer[1]<=-0.0015 && 
                                         //m45,m90斜度必須較小
        //        (ma45_15_buffer[1]-ma45_15_buffer[6]>=-0.0013 && ma90_15_buffer[1]-ma90_15_buffer[6]>=-0.0013) || 
                                          //m15  macd 差值不可太大 
                (macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00120 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020) &&
                                          //k1,k2,k3 >=70
                k1_15_buffer[1]>=70 && k2_15_buffer[1]>=70  &&  k3_15_buffer[1]>=70 && 
                                        //[1]收紅 且>=0.0006  [1]>= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]>=0.0006 && close_15_buffer[1]-ma360_15_buffer[1]>=0.0006) ||
                
                (ma650_15_buffer[1]-ma650_15_buffer[40]<=-0.0030 &&
                 ma180_15_buffer[1]-ma360_15_buffer[1]<=-0.0015 && ma360_15_buffer[1]-ma650_15_buffer[1]<=-0.0015 &&  
                                        //m45,m90斜度必須較小
        //        (ma45_15_buffer[1]-ma45_15_buffer[6]>=-0.0013 && ma90_15_buffer[1]-ma90_15_buffer[6]>=-0.0013) || 
                                          //m15  macd 差值不可太大 
                (macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00120 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020) &&
                                              //k1,k2,k3 >=70
                k1_15_buffer[1]>=70 && k2_15_buffer[1]>=70  &&  k3_15_buffer[1]>=70 && 
                                        //[1]收紅 且>=0.0006  [1]>= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]>=0.0006 && close_15_buffer[1]-ma360_15_buffer[1]>=0.0006)))
           
                                          //m15,m30,m60 的ma45,ma90,ma180,ma360全部上上多頭排列
               if ((ma45_15_buffer[1]-ma90_15_buffer[1]>=0.0005 && ma90_15_buffer[1]-ma180_15_buffer[1]>=0.0005 && ma180_15_buffer[1]-ma360_15_buffer[1]>=0.0005 && 
                   ma45_30_buffer[1]-ma90_30_buffer[1]>=0.0005 && ma90_30_buffer[1]-ma180_30_buffer[1]>=0.0005 &&  
                   ma45_60_buffer[1]-ma180_60_buffer[1]>=0.0005 &&  
                   ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0 &&
                   ma180_15_buffer[1]-ma180_15_buffer[2]>=0 && ma360_15_buffer[1]-ma360_15_buffer[2]>=0 &&
                   ma45_30_buffer[1]-ma45_30_buffer[2]>=0 && ma90_30_buffer[1]-ma90_30_buffer[2]>=0 &&
                   ma180_30_buffer[1]-ma180_30_buffer[2]>=0 && ma360_30_buffer[1]-ma360_30_buffer[2]>=0 &&
                   ma45_60_buffer[1]-ma45_60_buffer[2]>=0 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0 &&
                   ma180_60_buffer[1]-ma180_60_buffer[2]>=0 && ma360_60_buffer[1]-ma360_60_buffer[2]>=0 &&
                                             //m15的收盤價不低於h4的ma08下30點
                   close_15_buffer[1]-ma08_240_buffer[1]>=-0.0030 && 
                                           //m15的收盤價收黑但必須在80點內 ,上影線必須在80點內
                  (close_15_buffer[1]-open_15_buffer[1]>=-0.0080 || close_15_buffer[1]-high_15_buffer[1]>=-0.0080) &&
                                             //h4 [2]上影線須小於90點,[2]上影線須小於110
                   close_240_buffer[2]-high_240_buffer[2]>=-0.0090 && close_240_buffer[1]-high_240_buffer[1]>=-0.0100) ||  
                                          //在macd正負199內不交易
                   (macdmainline_15_buffer[1]>=-0.00199 && macdmainline_15_buffer[1]<=0.00199 &&
                    macdmainline_30_buffer[1]>=-0.00199 && macdmainline_30_buffer[1]<=0.00199) ||
                   (k1_15_buffer[1]>=92 && k2_15_buffer[1]>=92 &&  k3_15_buffer[1]>=92))
                    return;
                    else                         
                   OrderClose(OrderTicket(),lots,Ask,1,Brown);    

//+++++++++++++++++++++++++++++++++++++++++++   CLOSE   BUY    5  ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                     
                                         
                                     //上影線超過25點   [1]為負時開-高  [1]為正時收-開
    
      if  ((close_15_buffer[1]-open_15_buffer[1]<=-0.0001 && high_15_buffer[1]-open_15_buffer[1]>=0.0024) ||
          (close_15_buffer[1]-open_15_buffer[1]>=0.0001   && high_15_buffer[1]-close_15_buffer[1]>=0.0024) &&
           high_15_buffer[1]==M15highest40bar  && 
           k1_15_buffer[1]-k1_15_buffer[2]<=0 && k2_15_buffer[1]-k2_15_buffer[2]<=0 && k3_15_buffer[1]-k3_15_buffer[2]<=0   &&
           macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00090 && 
           macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00010) 
                                                 //避開超過100點 
           if ((close_15_buffer[2]-open_15_buffer[2]>=0.0100 || close_15_buffer[1]-open_15_buffer[1]>=0.0100 ||
               macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=0.00120 || 
               macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=-0.00050) ||
                                                //避開下跌後之反彈
              (open_15_buffer[3]-open_15_buffer[2]>=-0.0003 && open_15_buffer[4]-open_15_buffer[2]>=-0.0003) ||    
              (open_15_buffer[2]-open_15_buffer[1]>=-0.0003 && open_15_buffer[3]-open_15_buffer[1]>=-0.0003) ||     
                                 //m15,m30,m60 的ma45,ma90,ma180,ma360全部上上多頭排列
               (ma45_15_buffer[1]-ma90_15_buffer[1]>=0.0005 && ma90_15_buffer[1]-ma180_15_buffer[1]>=0.0005 && ma180_15_buffer[1]-ma360_15_buffer[1]>=0.0005 && 
                ma45_30_buffer[1]-ma90_30_buffer[1]>=0.0005 && ma90_30_buffer[1]-ma180_30_buffer[1]>=0.0005 &&  
                ma45_60_buffer[1]-ma180_60_buffer[1]>=0.0005 &&  
                ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0 &&
                ma180_15_buffer[1]-ma180_15_buffer[2]>=0 && ma360_15_buffer[1]-ma360_15_buffer[2]>=0 &&
                ma45_30_buffer[1]-ma45_30_buffer[2]>=0 && ma90_30_buffer[1]-ma90_30_buffer[2]>=0 &&
                ma180_30_buffer[1]-ma180_30_buffer[2]>=0 && ma360_30_buffer[1]-ma360_30_buffer[2]>=0 &&
                ma45_60_buffer[1]-ma45_60_buffer[2]>=0 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0 &&
                ma180_60_buffer[1]-ma180_60_buffer[2]>=0 && ma360_60_buffer[1]-ma360_60_buffer[2]>=0 &&
                                          //m15的收盤價不低於h4的ma08下30點
                close_15_buffer[1]-ma08_240_buffer[1]>=-0.0030 && 
                                          //m15的收盤價收黑但必須在80點內 ,上影線必須在80點內
               (close_15_buffer[1]-open_15_buffer[1]>=-0.0080 || close_15_buffer[1]-high_15_buffer[1]>=-0.0080) &&
                                          //h4 [2]上影線須小於90點,[2]上影線須小於110
                close_240_buffer[2]-high_240_buffer[2]>=-0.0090 && close_240_buffer[1]-high_240_buffer[1]>=-0.0100 &&
                                          //不加此條有上影線一條超過90點會執行
                close_240_buffer[1]-open_240_buffer[1]<=-0.0005) ||  
                                          //在macd正負199內不交易
               (macdmainline_15_buffer[1]>=-0.00199 && macdmainline_15_buffer[1]<=0.00199 &&
                macdmainline_30_buffer[1]>=-0.00199 && macdmainline_30_buffer[1]<=0.00199))
                return;
                else                   
                OrderClose(OrderTicket(),lots,Ask,1,Purple);    

//+++++++++++++++++++++++++++++++++++++++++++   CLOSE   BUY   6   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                                
                                         
                                     //上影線超過40點   [1]為負時開-高  [1]為正時收-開
      if ((close_15_buffer[1]-open_15_buffer[1]<=-0.0001 && high_15_buffer[1]-open_15_buffer[1]>=0.0040) ||
          (close_15_buffer[1]-open_15_buffer[1]>=0.0001  && high_15_buffer[1]-close_15_buffer[1]>=0.0040) &&
           high_15_buffer[1]==M15highest40bar && 
           k1_15_buffer[1]-k1_15_buffer[2]<=0 && k2_15_buffer[1]-k2_15_buffer[2]<=0 && k3_15_buffer[1]-k3_15_buffer[2]<=0)  
                                                 //避開超過100點 
           if ((close_15_buffer[2]-open_15_buffer[2]>=0.0100 || close_15_buffer[1]-open_15_buffer[1]>=0.0100 ||
               macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=0.00120 || 
               macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=-0.00050) ||
                                                //避開下跌後之反彈
              (open_15_buffer[3]-open_15_buffer[2]>=-0.0003 && open_15_buffer[4]-open_15_buffer[2]>=-0.0003) ||    
              (open_15_buffer[2]-open_15_buffer[1]>=-0.0003 && open_15_buffer[3]-open_15_buffer[1]>=-0.0003) ||     
                                //m15,m30,m60 的ma45,ma90,ma180,ma360全部上上多頭排列
               (ma45_15_buffer[1]-ma90_15_buffer[1]>=0.0005 && ma90_15_buffer[1]-ma180_15_buffer[1]>=0.0005 && ma180_15_buffer[1]-ma360_15_buffer[1]>=0.0005 && 
                ma45_30_buffer[1]-ma90_30_buffer[1]>=0.0005 && ma90_30_buffer[1]-ma180_30_buffer[1]>=0.0005 &&  
                ma45_60_buffer[1]-ma180_60_buffer[1]>=0.0005 &&  
                ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0 &&
                ma180_15_buffer[1]-ma180_15_buffer[2]>=0 && ma360_15_buffer[1]-ma360_15_buffer[2]>=0 &&
                ma45_30_buffer[1]-ma45_30_buffer[2]>=0 && ma90_30_buffer[1]-ma90_30_buffer[2]>=0 &&
                ma180_30_buffer[1]-ma180_30_buffer[2]>=0 && ma360_30_buffer[1]-ma360_30_buffer[2]>=0 &&
                ma45_60_buffer[1]-ma45_60_buffer[2]>=0 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0 &&
                ma180_60_buffer[1]-ma180_60_buffer[2]>=0 && ma360_60_buffer[1]-ma360_60_buffer[2]>=0 &&
                                          //m15的收盤價不低於h4的ma08下30點
                close_15_buffer[1]-ma08_240_buffer[1]>=-0.0030 && 
                                           //m15的收盤價收黑但必須在80點內 ,上影線必須在80點內
               (close_15_buffer[1]-open_15_buffer[1]>=-0.0080 || close_15_buffer[1]-high_15_buffer[1]>=-0.0080) &&
                                            //h4 [2]上影線須小於90點,[2]上影線須小於110
                close_240_buffer[2]-high_240_buffer[2]>=-0.0090 && close_240_buffer[1]-high_240_buffer[1]>=-0.0100 &&
                                          //不加此條有上影線一條超過90點會執行
                close_240_buffer[1]-open_240_buffer[1]<=-0.0005) ||  
                                          //在macd正負199內不交易
               (macdmainline_15_buffer[1]>=-0.00199 && macdmainline_15_buffer[1]<=0.00199 &&
                macdmainline_30_buffer[1]>=-0.00199 && macdmainline_30_buffer[1]<=0.00199))
                return;
                else          
               OrderClose(OrderTicket(),lots,Ask,1,Gold);    
//+++++++++++++++++++++++++++++++++++++++++++   CLOSE   BUY   7   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                                
                                 // M30 收黑,ma05,ma12間距小
       if    (close_30_buffer[1]-open_30_buffer[1]<=-0.0010 && ma05_30_buffer[1]-ma12_30_buffer[1]<=0.0012 && 
                                  //macd 已近反轉處
              macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00020 && 
              macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]>=-0.00050 &&
                                  //macd signal為上升狀態
             (macdsignalline_30_buffer[1]-macdsignalline_30_buffer[2])-(macdsignalline_30_buffer[2]-macdsignalline_30_buffer[3])<=-0.00002 && 
                                                                                            //k1,k2,k3 >=70
              k1_15_buffer[1]>=70 && k2_15_buffer[1]>=70  &&  k3_15_buffer[1]>=70 && 
                                  //k1,k2,k3任2個皆為下跌狀態
              k1_30_buffer[1]-k1_30_buffer[2]<=0 && (k2_30_buffer[1]-k2_30_buffer[2]<=0 || k3_30_buffer[1]-k3_30_buffer[2]<=0)  ||
             (k2_30_buffer[1]-k2_30_buffer[2]<=0 && k3_30_buffer[1]-k3_30_buffer[2]<=0))                                           
                                        //m15,m30,m60 的ma45,ma90,ma180,ma360全部上上多頭排列
               if ((ma45_15_buffer[1]-ma90_15_buffer[1]>=0.0005 && ma90_15_buffer[1]-ma180_15_buffer[1]>=0.0005 && ma180_15_buffer[1]-ma360_15_buffer[1]>=0.0005 && 
                   ma45_30_buffer[1]-ma90_30_buffer[1]>=0.0005 && ma90_30_buffer[1]-ma180_30_buffer[1]>=0.0005 &&  
                   ma45_60_buffer[1]-ma180_60_buffer[1]>=0.0005 &&  
                   ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0 &&
                   ma180_15_buffer[1]-ma180_15_buffer[2]>=0 && ma360_15_buffer[1]-ma360_15_buffer[2]>=0 &&
                   ma45_30_buffer[1]-ma45_30_buffer[2]>=0 && ma90_30_buffer[1]-ma90_30_buffer[2]>=0 &&
                   ma180_30_buffer[1]-ma180_30_buffer[2]>=0 && ma360_30_buffer[1]-ma360_30_buffer[2]>=0 &&
                   ma45_60_buffer[1]-ma45_60_buffer[2]>=0 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0 &&
                   ma180_60_buffer[1]-ma180_60_buffer[2]>=0 && ma360_60_buffer[1]-ma360_60_buffer[2]>=0 &&
                                             //m15的收盤價不低於h4的ma08下30點
                   close_15_buffer[1]-ma08_240_buffer[1]>=-0.0030 && 
                                              //m15的收盤價收黑但必須在80點內 ,上影線必須在80點內
                  (close_15_buffer[1]-open_15_buffer[1]>=-0.0080 || close_15_buffer[1]-high_15_buffer[1]>=-0.0080) &&
                                              //h4 [2]上影線須小於90點,[2]上影線須小於110
                   close_240_buffer[2]-high_240_buffer[2]>=-0.0090 && close_240_buffer[1]-high_240_buffer[1]>=-0.0100)) 
                   return;
                   else                               
                                           //使用 M60 不考慮 MACD 大小於99狀況  
                   OrderClose(OrderTicket(),lots,Ask,1,OrangeRed);    
    
      }


//+++++++++++++++++++++++++++++++++++++++++++   CLOSE   SELL   1   ++++++++++++++++++++++++++++++++++++++++++++++++++          

      if  (OrderType()==OP_SELL)
       {  
                                         //m15 的ma45  ma90 為斜L下跌末端型態 
           if (ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma45_15_buffer[1]-ma45_15_buffer[6]>=-0.0016 && 
               ma90_15_buffer[1]-ma90_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[6]>=-0.0013 && 
                                                
               close_15_buffer[1]-close_15_buffer[2]>=0.0001  && 
                                             //用m15 m30 macd 控管買賣點 
               macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00015 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020 &&
               macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]>=-0.00035 &&  macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00020 &&
                                             //k1 (k2||k3)已上升  kd1>=0
               k1_15_buffer[1]-k1_15_buffer[2]>=1  &&  k1_15_buffer[1]-d1_15_buffer[1]>=1 &&
               k2_15_buffer[1]-k2_15_buffer[2]>=0  ||  k3_15_buffer[1]-k3_15_buffer[2]>=0)
                                           //m15,m30,m60 的ma45,ma90,ma180,ma360全部向下空頭排列
               if ((ma45_15_buffer[1]-ma90_15_buffer[1]<=-0.0005 && ma90_15_buffer[1]-ma180_15_buffer[1]<=-0.0005 && ma180_15_buffer[1]-ma360_15_buffer[1]<=-0.0005 && 
                    ma45_30_buffer[1]-ma90_30_buffer[1]<=-0.0005 && ma90_30_buffer[1]-ma180_30_buffer[1]<=-0.0005 &&  
                    ma45_60_buffer[1]-ma180_60_buffer[1]<=-0.0005 &&  
                    ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=0 &&
                    ma180_15_buffer[1]-ma180_15_buffer[2]<=0 && ma360_15_buffer[1]-ma360_15_buffer[2]<=0 &&
                    ma45_30_buffer[1]-ma45_30_buffer[2]<=0 && ma90_30_buffer[1]-ma90_30_buffer[2]<=0 &&
                    ma180_30_buffer[1]-ma180_30_buffer[2]<=0 && ma360_30_buffer[1]-ma360_30_buffer[2]<=0 &&
                    ma45_60_buffer[1]-ma45_60_buffer[2]<=0 && ma90_60_buffer[1]-ma90_60_buffer[2]<=0 &&
                    ma180_60_buffer[1]-ma180_60_buffer[2]<=0 && ma360_60_buffer[1]-ma360_60_buffer[2]<=0 &&
                                             //m15的收盤價不高於h4的ma08上30點
                    close_15_buffer[1]-ma08_240_buffer[1]<=0.0030 && 
                                              //m15的收盤價收紅但必須在80點內 ,下影線必須在80點內
                   (close_15_buffer[1]-open_15_buffer[1]<=0.0080 || close_15_buffer[1]-high_15_buffer[1]<=0.0080) &&
                                             //h4 [2]下影線須小於90點,[2]下影線須小於110
                    open_240_buffer[2]-low_240_buffer[2]<=0.0090 && open_240_buffer[1]-low_240_buffer[1]<=0.0100) || 
                                              //在macd正負199內不交易
                   (macdmainline_15_buffer[1]>=-0.00199 && macdmainline_15_buffer[1]<=0.00199 &&
                    macdmainline_30_buffer[1]>=-0.00199 && macdmainline_30_buffer[1]<=0.00199))
                    return;
                    else                               
                    OrderClose(OrderTicket(),lots,Bid,1,Green); 
      //                                                 //確定剛close賣單,目前無單,不加此條會反覆close  
      //         if (TimeCurrent()-OrderCloseTime()<=100 && OrdersTotal()<=1)
      //             OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-18*Point,Ask+300*Point,"My order #B2",8802,0,Yellow );
   
//+++++++++++++++++++++++++++++++++++++++++++   CLOSE   SELL   2   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                   //  順ma45,ma90,ma180上升趨勢 kd1>=1 k1 (k2||k3)為向上
          if  ((ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0) ||
               (ma90_15_buffer[1]-ma90_15_buffer[2]>=0 && ma180_15_buffer[1]-ma180_15_buffer[2]>=0) &&
                                                    //用m15 m30 macd 控管買賣點 
               macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00015 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020 &&
               macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]>=-0.00035 &&  macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00020 &&
                
               k1_15_buffer[1]<=60 && k2_15_buffer[1]<=60 && k3_15_buffer[1]<=60  && 
               k1_15_buffer[1]-k1_15_buffer[2]>=1  &&  k1_15_buffer[1]-d1_15_buffer[1]>=1 && 
              (k2_15_buffer[1]-k2_15_buffer[2]>=0  ||  k3_15_buffer[1]-k3_15_buffer[2]>=0)) 
                                                   //m15,m30,m60 的ma45,ma90,ma180,ma360全部向下空頭排列
               if ((ma45_15_buffer[1]-ma90_15_buffer[1]<=-0.0005 && ma90_15_buffer[1]-ma180_15_buffer[1]<=-0.0005 && ma180_15_buffer[1]-ma360_15_buffer[1]<=-0.0005 && 
                    ma45_30_buffer[1]-ma90_30_buffer[1]<=-0.0005 && ma90_30_buffer[1]-ma180_30_buffer[1]<=-0.0005 &&  
                    ma45_60_buffer[1]-ma180_60_buffer[1]<=-0.0005 &&  
                    ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=0 &&
                    ma180_15_buffer[1]-ma180_15_buffer[2]<=0 && ma360_15_buffer[1]-ma360_15_buffer[2]<=0 &&
                    ma45_30_buffer[1]-ma45_30_buffer[2]<=0 && ma90_30_buffer[1]-ma90_30_buffer[2]<=0 &&
                    ma180_30_buffer[1]-ma180_30_buffer[2]<=0 && ma360_30_buffer[1]-ma360_30_buffer[2]<=0 &&
                    ma45_60_buffer[1]-ma45_60_buffer[2]<=0 && ma90_60_buffer[1]-ma90_60_buffer[2]<=0 &&
                    ma180_60_buffer[1]-ma180_60_buffer[2]<=0 && ma360_60_buffer[1]-ma360_60_buffer[2]<=0 &&
                                             //m15的收盤價不高於h4的ma08上30點
                    close_15_buffer[1]-ma08_240_buffer[1]<=0.0030 && 
                                            //m15的收盤價收紅但必須在80點內 ,下影線必須在80點內
                   (close_15_buffer[1]-open_15_buffer[1]<=0.0080 || close_15_buffer[1]-high_15_buffer[1]<=0.0080) &&
                                           //h4 [2]下影線須小於90點,[2]下影線須小於110
                    open_240_buffer[2]-low_240_buffer[2]<=0.0090 && open_240_buffer[1]-low_240_buffer[1]<=0.0100) || 
                                              //在macd正負199內不交易
                   (macdmainline_15_buffer[1]>=-0.00199 && macdmainline_15_buffer[1]<=0.00199 &&
                    macdmainline_30_buffer[1]>=-0.00199 && macdmainline_30_buffer[1]<=0.00199))
                    return;
                    else                               
                    OrderClose(OrderTicket(),lots,Bid,1,White); 
       //                                                //確定剛close賣單,目前無單,不加此條會反覆close  
       //       if (TimeCurrent()-OrderCloseTime()<=100 && OrdersTotal()<=1)
       //          OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-18*Point,Ask+300*Point,"My order #B3",8803,0,Blue );
     
                     
//+++++++++++++++++++++++++++++++++++++++++++   CLOSE   SELL   3   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                                    
                                       //在ma45,ma90,ma180斜上時,k1,k2,k3<=3 並且收紅 或收2小紅
        if   ((k1_15_buffer[1]-k1_15_buffer[2]>=5  &&  k1_15_buffer[1]-d1_15_buffer[1]>=5 &&
               k1_15_buffer[1]<=30 && k2_15_buffer[1]<=30  &&  k3_15_buffer[1]<=30 && 
             ((close_15_buffer[1]-open_15_buffer[1]>=0.0005 &&  close_15_buffer[1]-close_15_buffer[2]<=-0.0001) ||
              (close_15_buffer[1]-open_15_buffer[1]>=0 &&  close_15_buffer[2]-open_15_buffer[2]>=0)) &&
                                        
                                                   //m15 的ma45  ma90 為斜L下跌末端型態 
               (ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0) || 
               (ma90_15_buffer[1]-ma90_15_buffer[2]>=0 && ma180_15_buffer[1]-ma180_15_buffer[2]>=0) &&                                  //下跌末端上升要一次升過前3bar
                                            //用m15 m30 macd 控管買賣點 
                macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00055 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020 &&
                macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]>=-0.00065 &&  macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00020))
                                                //m15,m30,m60 的ma45,ma90,ma180,ma360全部向下空頭排列
               if  (ma45_15_buffer[1]-ma90_15_buffer[1]<=-0.0005 && ma90_15_buffer[1]-ma180_15_buffer[1]<=-0.0005 && ma180_15_buffer[1]-ma360_15_buffer[1]<=-0.0005 && 
                    ma45_30_buffer[1]-ma90_30_buffer[1]<=-0.0005 && ma90_30_buffer[1]-ma180_30_buffer[1]<=-0.0005 &&  
                    ma45_60_buffer[1]-ma180_60_buffer[1]<=-0.0005 &&  
                    ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=0 &&
                    ma180_15_buffer[1]-ma180_15_buffer[2]<=0 && ma360_15_buffer[1]-ma360_15_buffer[2]<=0 &&
                    ma45_30_buffer[1]-ma45_30_buffer[2]<=0 && ma90_30_buffer[1]-ma90_30_buffer[2]<=0 &&
                    ma180_30_buffer[1]-ma180_30_buffer[2]<=0 && ma360_30_buffer[1]-ma360_30_buffer[2]<=0 &&
                    ma45_60_buffer[1]-ma45_60_buffer[2]<=0 && ma90_60_buffer[1]-ma90_60_buffer[2]<=0 &&
                    ma180_60_buffer[1]-ma180_60_buffer[2]<=0 && ma360_60_buffer[1]-ma360_60_buffer[2]<=0 &&
                                             //m15的收盤價不高於h4的ma08上30點
                    close_15_buffer[1]-ma08_240_buffer[1]<=0.0030 && 
                                           //m15的收盤價收紅但必須在80點內 ,下影線必須在80點內
                   (close_15_buffer[1]-open_15_buffer[1]<=0.0080 || close_15_buffer[1]-high_15_buffer[1]<=0.0080) &&
                                          //h4 [2]下影線須小於90點,[2]下影線須小於110
                    open_240_buffer[2]-low_240_buffer[2]<=0.0090 && open_240_buffer[1]-low_240_buffer[1]<=0.0100) 
                    return;
                    else                               
                 OrderClose(OrderTicket(),lots,Bid,1,Lime); 
      //                                                 //確定剛close賣單,目前無單,不加此條會反覆close  
      //        if (TimeCurrent()-OrderCloseTime()<=100 && OrdersTotal()<=1)
      //           OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-18*Point,Ask+300*Point,"My order #B4",8804,0,Brown );
   
//+++++++++++++++++++++++++++++++++++++++++++   CLOSE   SELL   4   ++++++++++++++++++++++++++++++++++++++++++++++++++          
               //m15 的ma180,ma360 or ma360,ma650 or ma650 上升幅度大    跌破ma180 ,ma360,ma650時 收黑下買單
                                             
          if   (((ma180_15_buffer[1]-ma180_15_buffer[40]>=0.0020 && ma360_15_buffer[1]-ma360_15_buffer[40]>=0.0020 &&
                  ma180_15_buffer[1]-ma360_15_buffer[1]>=0.0015 && ma360_15_buffer[1]-ma650_15_buffer[1]>=0.0015 && 
                                            //m45,m90斜度必須較小
        //        (ma45_15_buffer[1]-ma45_15_buffer[6]<=0.0013 && ma90_15_buffer[1]-ma90_15_buffer[6]<=0.0013) || 
                                          //m15  macd 差值不可太大 
                (macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00120 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020) &&
                                        //k1,k2,k3 <=18
                k1_15_buffer[1]<=18 && k2_15_buffer[1]<=18  &&  k3_15_buffer[1]<=18 && 
                                        //[1]收黑 且<-=0.0006  [1]<= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]<=-0.0006 && close_15_buffer[1]-ma180_15_buffer[1]<=-0.0006) ||
                
               
               (ma360_15_buffer[1]-ma360_15_buffer[40]>=0.0020 && ma650_15_buffer[1]-ma650_15_buffer[40]>=0.0020 &&
                ma180_15_buffer[1]-ma360_15_buffer[1]>=0.0015 && ma360_15_buffer[1]-ma650_15_buffer[1]>=0.0015 && 
                                        //m45,m90斜度必須較小
        //        (ma45_15_buffer[1]-ma45_15_buffer[6]<=0.0013 && ma90_15_buffer[1]-ma90_15_buffer[6]<=0.0013) || 
                                          //m15  macd 差值不可太大 
                (macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00120 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020) &&
                                            //k1,k2,k3 <=18
                k1_15_buffer[1]<=18 && k2_15_buffer[1]<=18  &&  k3_15_buffer[1]<=18 && 
                                        //[1]收紅 且<=-0.0006  [1]<= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]<=-0.0006 && close_15_buffer[1]-ma360_15_buffer[1]<=-0.0006) ||
                
                (ma650_15_buffer[1]-ma650_15_buffer[40]>=0.0020 &&
                 ma180_15_buffer[1]-ma360_15_buffer[1]>=0.0015 && ma360_15_buffer[1]-ma650_15_buffer[1]>=0.0015 && 
                                        //m45,m90斜度必須較小
         //       (ma45_15_buffer[1]-ma45_15_buffer[6]<=0.0013 && ma90_15_buffer[1]-ma90_15_buffer[6]<=0.0013) || 
                                          //m15  macd 差值不可太大 
                (macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00120 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020) &&
                                          //k1,k2,k3 <=18
                k1_15_buffer[1]<=18 && k2_15_buffer[1]<=18  &&  k3_15_buffer[1]<=18 && 
                                        //[1]收紅 且>=0.0006  [1]>= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]<=-0.0006 && close_15_buffer[1]-ma360_15_buffer[1]<=-0.0006))  ||
           
         
                              //m15 的ma180,ma360 or ma360,ma650 or ma650 上升幅度大
                                             
               ((ma180_15_buffer[1]-ma180_15_buffer[40]>=0.0030 && ma360_15_buffer[1]-ma360_15_buffer[40]>=0.0040 &&
                 ma180_15_buffer[1]-ma360_15_buffer[1]>=0.0015 && ma360_15_buffer[1]-ma650_15_buffer[1]>=0.0015 &&             
                                     //m45,m90斜度必須較小
       //         (ma45_15_buffer[1]-ma45_15_buffer[6]<=0.0013 && ma90_15_buffer[1]-ma90_15_buffer[6]<=0.0013) || 
                                          //m15  macd 差值不可太大 
                (macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00120 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020) &&
                                          //k1,k2,k3 <=30
                k1_15_buffer[1]<=30 && k2_15_buffer[1]<=30  &&  k3_15_buffer[1]<=30 && 
                                        //[1]收黑 且<-=0.0006  [1]<= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]<=-0.0006 && close_15_buffer[1]-ma180_15_buffer[1]<=-0.0006) ||
                
               
               (ma360_15_buffer[1]-ma360_15_buffer[40]>=0.0040 && ma650_15_buffer[1]-ma650_15_buffer[40]>=0.0040 &&
                ma180_15_buffer[1]-ma360_15_buffer[1]>=0.0015 && ma360_15_buffer[1]-ma650_15_buffer[1]>=0.0015 &&  
                                         //m45,m90斜度必須較小
       //         (ma45_15_buffer[1]-ma45_15_buffer[6]<=0.0013 && ma90_15_buffer[1]-ma90_15_buffer[6]<=0.0013) || 
                                          //m15  macd 差值不可太大 
                (macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00120 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020) &&
                                          //k1,k2,k3 <=30
                k1_15_buffer[1]<=30 && k2_15_buffer[1]<=30  &&  k3_15_buffer[1]<=30 && 
                                        //[1]收紅 且<=-0.0006  [1]<= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]<=-0.0006 && close_15_buffer[1]-ma360_15_buffer[1]<=-0.0006) ||
                
                (ma650_15_buffer[1]-ma650_15_buffer[40]>=0.0040 &&
                 ma180_15_buffer[1]-ma360_15_buffer[1]>=0.0015 && ma360_15_buffer[1]-ma650_15_buffer[1]>=0.0015 &&  
                                        //m45,m90斜度必須較小
       //         (ma45_15_buffer[1]-ma45_15_buffer[6]<=0.0013 && ma90_15_buffer[1]-ma90_15_buffer[6]<=0.0013) || 
                                          //m15  macd 差值不可太大 
                (macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00120 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020) &&
                                          //k1,k2,k3 <=30
                k1_15_buffer[1]<=30 && k2_15_buffer[1]<=30  &&  k3_15_buffer[1]<=30 && 
                                        //[1]收紅 且>=0.0006  [1]>= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]<=-0.0006 && close_15_buffer[1]-ma360_15_buffer[1]<=-0.0006)))
          
                                                 //m15,m30,m60 的ma45,ma90,ma180,ma360全部向下空頭排列
               if ((ma45_15_buffer[1]-ma90_15_buffer[1]<=-0.0005 && ma90_15_buffer[1]-ma180_15_buffer[1]<=-0.0005 && ma180_15_buffer[1]-ma360_15_buffer[1]<=-0.0005 && 
                    ma45_30_buffer[1]-ma90_30_buffer[1]<=-0.0005 && ma90_30_buffer[1]-ma180_30_buffer[1]<=-0.0005 &&  
                    ma45_60_buffer[1]-ma180_60_buffer[1]<=-0.0005 &&  
                    ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=0 &&
                    ma180_15_buffer[1]-ma180_15_buffer[2]<=0 && ma360_15_buffer[1]-ma360_15_buffer[2]<=0 &&
                    ma45_30_buffer[1]-ma45_30_buffer[2]<=0 && ma90_30_buffer[1]-ma90_30_buffer[2]<=0 &&
                    ma180_30_buffer[1]-ma180_30_buffer[2]<=0 && ma360_30_buffer[1]-ma360_30_buffer[2]<=0 &&
                    ma45_60_buffer[1]-ma45_60_buffer[2]<=0 && ma90_60_buffer[1]-ma90_60_buffer[2]<=0 &&
                    ma180_60_buffer[1]-ma180_60_buffer[2]<=0 && ma360_60_buffer[1]-ma360_60_buffer[2]<=0 &&
                                             //m15的收盤價不高於h4的ma08上30點
                    close_15_buffer[1]-ma08_240_buffer[1]<=0.0030 && 
                                           //m15的收盤價收紅但必須在80點內 ,下影線必須在80點內
                   (close_15_buffer[1]-open_15_buffer[1]<=0.0080 || close_15_buffer[1]-high_15_buffer[1]<=0.0080) &&
                                          //h4 [2]下影線須小於90點,[2]下影線須小於110
                    open_240_buffer[2]-low_240_buffer[2]<=0.0090 && open_240_buffer[1]-low_240_buffer[1]<=0.0100) || 
                                              //在macd正負199內不交易
                   (macdmainline_15_buffer[1]>=-0.00199 && macdmainline_15_buffer[1]<=0.00199 &&
                    macdmainline_30_buffer[1]>=-0.00199 && macdmainline_30_buffer[1]<=0.00199) ||
                   (k1_15_buffer[1]<=8 && k2_15_buffer[1]<=8 &&  k3_15_buffer[1]<=8))
                    return;
                    else   
                    OrderClose(OrderTicket(),lots,Bid,1,Gray); 

//+++++++++++++++++++++++++++++++++++++++++++   CLOSE   SELL   5   ++++++++++++++++++++++++++++++++++++++++++++++++++          
      //長下影線 >=24點  [1]>0.0001開-低  [1]<-0.0001收-低
       if   ((close_15_buffer[1]-open_15_buffer[1]<=-0.0001 && low_15_buffer[1]-close_15_buffer[1]<=-0.0024) ||
             (close_15_buffer[1]-open_15_buffer[1]>=0.0001  && low_15_buffer[1]-open_15_buffer[1]<=-0.0024) &&
              low_15_buffer[1]==M15lowest40bar &&
              k1_15_buffer[1]-k1_15_buffer[2]>=0 && k2_15_buffer[1]-k2_15_buffer[2]>=0 && k3_15_buffer[1]-k3_15_buffer[2]>=0  &&
              macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.0090 && 
              macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00010) 
              
              if ((close_15_buffer[2]-open_15_buffer[2]<=-0.0100 || close_15_buffer[1]-open_15_buffer[1]<=-0.0100 ||
                   macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=-0.00120 || 
                   macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=0.00050) ||
                                                 //避開下跌後之反彈
                  (open_15_buffer[3]-open_15_buffer[2]<=0.0003 && open_15_buffer[4]-open_15_buffer[2]<=0.0003) ||    
                  (open_15_buffer[2]-open_15_buffer[1]<=0.0003 && open_15_buffer[3]-open_15_buffer[1]<=0.0003) ||     
                                   //m15,m30,m60 的ma45,ma90,ma180,ma360全部向下空頭排列
                   (ma45_15_buffer[1]-ma90_15_buffer[1]<=-0.0005 && ma90_15_buffer[1]-ma180_15_buffer[1]<=-0.0005 && ma180_15_buffer[1]-ma360_15_buffer[1]<=-0.0005 && 
                    ma45_30_buffer[1]-ma90_30_buffer[1]<=-0.0005 && ma90_30_buffer[1]-ma180_30_buffer[1]<=-0.0005 &&  
                    ma45_60_buffer[1]-ma180_60_buffer[1]<=-0.0005 &&  
                    ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=0 &&
                    ma180_15_buffer[1]-ma180_15_buffer[2]<=0 && ma360_15_buffer[1]-ma360_15_buffer[2]<=0 &&
                    ma45_30_buffer[1]-ma45_30_buffer[2]<=0 && ma90_30_buffer[1]-ma90_30_buffer[2]<=0 &&
                    ma180_30_buffer[1]-ma180_30_buffer[2]<=0 && ma360_30_buffer[1]-ma360_30_buffer[2]<=0 &&
                    ma45_60_buffer[1]-ma45_60_buffer[2]<=0 && ma90_60_buffer[1]-ma90_60_buffer[2]<=0 &&
                    ma180_60_buffer[1]-ma180_60_buffer[2]<=0 && ma360_60_buffer[1]-ma360_60_buffer[2]<=0 &&
                                             //m15的收盤價不高於h4的ma08上30點
                    close_15_buffer[1]-ma08_240_buffer[1]<=0.0030 && 
                                             //m15的收盤價收紅但必須在80點內 ,下影線必須在80點內
                   (close_15_buffer[1]-open_15_buffer[1]<=0.0080 || close_15_buffer[1]-high_15_buffer[1]<=0.0080) &&
                                                    //h4 [2]下影線須小於90點,[2]下影線須小於110
                    open_240_buffer[2]-low_240_buffer[2]<=0.0090 && open_240_buffer[1]-low_240_buffer[1]<=0.0100 &&
                                              //不加此條有下影線一條超過90點會執行
                    close_240_buffer[1]-open_240_buffer[1]>=0.0005) || 
                                              //在macd正負199內不交易
                   (macdmainline_15_buffer[1]>=-0.00199 && macdmainline_15_buffer[1]<=0.00199 &&
                    macdmainline_30_buffer[1]>=-0.00199 && macdmainline_30_buffer[1]<=0.00199))
                    return;
                    else                  
                    OrderClose(OrderTicket(),lots,Bid,1,Aqua); 
  
//+++++++++++++++++++++++++++++++++++++++++++   CLOSE   SELL   6   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                                        //長下影線 >=40點  [1]>0.0001開-低  [1]<-0.0001收-低
         
       if   ((close_15_buffer[1]-open_15_buffer[1]<=-0.0001 && low_15_buffer[1]-close_15_buffer[1]>=0.0040) ||
             (close_15_buffer[1]-open_15_buffer[1]>=0.0001  && low_15_buffer[1]-open_15_buffer[1]>=0.0040) &&
              low_15_buffer[1]==M15lowest40bar &&
              k1_15_buffer[1]-k1_15_buffer[2]>=0 && k2_15_buffer[1]-k2_15_buffer[2]>=0 && k3_15_buffer[1]-k3_15_buffer[2]>=0)  
                                                         //避開超過100點 
              if ((close_15_buffer[2]-open_15_buffer[2]>=0.0100 || close_15_buffer[1]-open_15_buffer[1]>=0.0100 ||
                  macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=0.00120 || 
                  macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=-0.00050) ||
                                                   //避開下跌後之反彈
                 (open_15_buffer[3]-open_15_buffer[2]<=0.0003 && open_15_buffer[4]-open_15_buffer[2]<=0.0003) ||    
                 (open_15_buffer[2]-open_15_buffer[1]<=0.0003 && open_15_buffer[3]-open_15_buffer[1]<=0.0003) ||     
                                         //m15,m30,m60 的ma45,ma90,ma180,ma360全部向下空頭排列
                (ma45_15_buffer[1]-ma90_15_buffer[1]<=-0.0005 && ma90_15_buffer[1]-ma180_15_buffer[1]<=-0.0005 && ma180_15_buffer[1]-ma360_15_buffer[1]<=-0.0005 && 
                 ma45_30_buffer[1]-ma90_30_buffer[1]<=-0.0005 && ma90_30_buffer[1]-ma180_30_buffer[1]<=-0.0005 &&  
                 ma45_60_buffer[1]-ma180_60_buffer[1]<=-0.0005 &&  
                 ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=0 &&
                 ma180_15_buffer[1]-ma180_15_buffer[2]<=0 && ma360_15_buffer[1]-ma360_15_buffer[2]<=0 &&
                 ma45_30_buffer[1]-ma45_30_buffer[2]<=0 && ma90_30_buffer[1]-ma90_30_buffer[2]<=0 &&
                 ma180_30_buffer[1]-ma180_30_buffer[2]<=0 && ma360_30_buffer[1]-ma360_30_buffer[2]<=0 &&
                 ma45_60_buffer[1]-ma45_60_buffer[2]<=0 && ma90_60_buffer[1]-ma90_60_buffer[2]<=0 &&
                 ma180_60_buffer[1]-ma180_60_buffer[2]<=0 && ma360_60_buffer[1]-ma360_60_buffer[2]<=0 &&
                                          //m15的收盤價不高於h4的ma08上30點
                 close_15_buffer[1]-ma08_240_buffer[1]<=0.0030 && 
                                        //m15的收盤價收紅但必須在80點內 ,下影線必須在80點內
                (close_15_buffer[1]-open_15_buffer[1]<=0.0080 || close_15_buffer[1]-high_15_buffer[1]<=0.0080) &&
                                       //h4 [2]下影線須小於90點,[2]下影線須小於110
                 open_240_buffer[2]-low_240_buffer[2]<=0.0090 && open_240_buffer[1]-low_240_buffer[1]<=0.0100 &&
                                       //不加此條有下影線一條超過90點會執行
                 close_240_buffer[1]-open_240_buffer[1]>=0.0005) || 
                                              //在macd正負199內不交易
                (macdmainline_15_buffer[1]>=-0.00199 && macdmainline_15_buffer[1]<=0.00199 &&
                 macdmainline_30_buffer[1]>=-0.00199 && macdmainline_30_buffer[1]<=0.00199))
                 return;
                 else                  
                 OrderClose(OrderTicket(),lots,Bid,1,Teal); 
//+++++++++++++++++++++++++++++++++++++++++++   CLOSE   SELL   7   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                               
                                 //  M30 收紅,ma05,ma12間距小
       if    (close_30_buffer[1]-open_30_buffer[1]>=0.0010 && ma05_30_buffer[1]-ma12_30_buffer[1]>=-0.0012 && 
                                  //macd 已近反轉處
              macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]>=-0.00020 && 
              macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00050 &&
                                  //macd signal為上升狀態
             (macdsignalline_30_buffer[1]-macdsignalline_30_buffer[2])-(macdsignalline_30_buffer[2]-macdsignalline_30_buffer[3])>=0.00002 && 
                                                  //k1,k2,k3 <=30
              k1_15_buffer[1]<=30 && k2_15_buffer[1]<=30  &&  k3_15_buffer[1]<=30 && 
                                  //k1,k2,k3任2個皆為上升狀
              k1_30_buffer[1]-k1_30_buffer[2]>=0 && (k2_30_buffer[1]-k2_30_buffer[2]>=0 || k3_30_buffer[1]-k3_30_buffer[2]>=0)  ||
             (k2_30_buffer[1]-k2_30_buffer[2]>=0 && k3_30_buffer[1]-k3_30_buffer[2]>=0))                                           
                                    //m15,m30,m60 的ma45,ma90,ma180,ma360全部向下空頭排列
               if  (ma45_15_buffer[1]-ma90_15_buffer[1]<=-0.0005 && ma90_15_buffer[1]-ma180_15_buffer[1]<=-0.0005 && ma180_15_buffer[1]-ma360_15_buffer[1]<=-0.0005 && 
                    ma45_30_buffer[1]-ma90_30_buffer[1]<=-0.0005 && ma90_30_buffer[1]-ma180_30_buffer[1]<=-0.0005 &&  
                    ma45_60_buffer[1]-ma180_60_buffer[1]<=-0.0005 &&  
                    ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=0 &&
                    ma180_15_buffer[1]-ma180_15_buffer[2]<=0 && ma360_15_buffer[1]-ma360_15_buffer[2]<=0 &&
                    ma45_30_buffer[1]-ma45_30_buffer[2]<=0 && ma90_30_buffer[1]-ma90_30_buffer[2]<=0 &&
                    ma180_30_buffer[1]-ma180_30_buffer[2]<=0 && ma360_30_buffer[1]-ma360_30_buffer[2]<=0 &&
                    ma45_60_buffer[1]-ma45_60_buffer[2]<=0 && ma90_60_buffer[1]-ma90_60_buffer[2]<=0 &&
                    ma180_60_buffer[1]-ma180_60_buffer[2]<=0 && ma360_60_buffer[1]-ma360_60_buffer[2]<=0 &&
                                             //m15的收盤價不高於h4的ma08上30點
                    close_15_buffer[1]-ma08_240_buffer[1]<=0.0030 && 
                                            //m15的收盤價收紅但必須在80點內 ,下影線必須在80點內
                   (close_15_buffer[1]-open_15_buffer[1]<=0.0080 || close_15_buffer[1]-high_15_buffer[1]<=0.0080) &&
                                           //h4 [2]下影線須小於90點,[2]下影線須小於110
                    open_240_buffer[2]-low_240_buffer[2]<=0.0090 && open_240_buffer[1]-low_240_buffer[1]<=0.0100)  
                    return;
                    else                               
                                     
                                       //使用 M60 不考慮 MACD 大小於99狀況  
                    OrderClose(OrderTicket(),lots,Bid,1,Olive); 
  
      }

  } 
  }                

return(0);  
}
//+------------------------------------------------------------------+

