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
double cnt,trade,order_id;
//trade=1;
   for (cnt=0;cnt<OrdersTotal();cnt++)
     {
       OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES);
//       if (OrderSymbol()==Symbol())  trade=0 ;
     } 
 
                       
      
//+++++++++++++++++++++++++++++++++++++++++++   BUY   1   ++++++++++++++++++++++++++++++++++++++++++++++++++          
          
  if (OrdersTotal()<=1)   
     {                                           //m15 的ma45  ma90 為斜L下跌末端型態 ma45[1]-[6]為確認為下跌 
        if (((ma45_15_buffer[1]-ma45_15_buffer[2]>=0 &&  ma45_15_buffer[1]-ma45_15_buffer[6]<=0) ||
                                                 //雖為下跌但h4 [1]尚為正大於20點
             (ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=-0.0001 && 
                              //h4 收紅 且上影線<=0.0006
              close_240_buffer[1]-open_240_buffer[1]>=0.0020 && high_240_buffer[1]-close_240_buffer[1]<=0.0055 )) && 
              ma90_15_buffer[1]-ma90_15_buffer[2]<=-0.0001 && 
                                                 //下跌末端上升要一次升過前3bar
              close_15_buffer[1]-close_15_buffer[2]>=0.0001  && // close_15_buffer[1]-close_15_buffer[3]>=0.0001 &&
      //        close_15_buffer[1]-close_15_buffer[4]>=0.0001  &&
                                             //用m15 m30 macd 控管買賣點 
              macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00010 &&
              macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]>=-0.00050 &&  macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00020 &&
              macdmainline_30_buffer[1]<=0.00110   &&   
                                                         //m60 的45,90,180  皆是斜上
             (macdmainline_60_buffer[1]<=0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]>=0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0.0003 && 
              ma180_60_buffer[1]-ma180_60_buffer[2]>=0)) &&    
                                           //k1 (k2||k3)已上升
              k1_15_buffer[1]-k1_15_buffer[2]>=1  &&  k1_15_buffer[1]-d1_15_buffer[1]>=1 &&
              k2_15_buffer[1]-k2_15_buffer[2]>=0  ||  k3_15_buffer[1]-k3_15_buffer[2]>=0)
              if ((macdmainline_15_buffer[1]>=-0.00099 && macdmainline_15_buffer[1]<=0.00099 &&
                   macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                   (k2_30_buffer[1]-d2_30_buffer[1]<=-19  &&  k3_30_buffer[1]-d3_30_buffer[1]<=-19) ||
                   (k2_60_buffer[1]-d2_60_buffer[1]<=-19  &&  k3_60_buffer[1]-d3_60_buffer[1]<=-19) ||
                         
                                  //h4  k2,k3 在47上  開口向下  不做買單 
                   (k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3全向下,或 h4,m30,m60 kd2,kd3向下開口大 或 k1,k,2,k3在極低
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-25  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                    k2_240_buffer[0]>=40 && k3_240_buffer[1]>=40) ||
                            //h4  kd1,kd2,kd3<=-10   k2,k3>=70   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-10  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-10  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-10  &&  k2_240_buffer[0]>=70 && k3_240_buffer[1]>=70) ||
                               //(m15-57) h4  kd1,kd2,kd3<=0   k1,k2,k3>=80 macd>=0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=0  &&  k2_240_buffer[1]-d2_240_buffer[1]<=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=0  &&  k1_240_buffer[0]>=80 && k2_240_buffer[0]>=80 && k3_240_buffer[1]>=80 &&
                    macdmainline_240_buffer[1]>=0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3<=-35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-35) ||
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd差值>=-350
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0100  &&  close_240_buffer[2]-open_240_buffer[2]<=-0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0020  &&
                   (k1_240_buffer[1]>=50 && k2_240_buffer[1]>=50 && k3_240_buffer[1]>=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3<=-4   ma05  [1]-[2]<=-0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-4  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 && k1_240_buffer[1]-k1_240_buffer[2]<=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  && 
                    k1_240_buffer[1]-k1_240_buffer[2]<=0 &&  k2_240_buffer[1]-k2_240_buffer[2]<=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]<=0 &&  close_240_buffer[1]-open_240_buffer[1]<=-0.0001) || 
                   (k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10) ||
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14)) 
                    return;
                    else                    
                    OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-28*Point,Ask+2000*Point,"My order #B1",8801,0,Red );
 
 //+++++++++++++++++++++++++++++++++++++++++++   BUY   2   ++++++++++++++++++++++++++++++++++++++++++++++++++          
     
                         // h1 k123在下方 皆為上升
          if  (k1_60_buffer[1]<=15 && k2_60_buffer[1]<=15 && k3_60_buffer[1]<=15  && 
               k1_60_buffer[1]-k1_60_buffer[2]>=8 &&  k2_60_buffer[1]-k2_60_buffer[2]>=0 &&  k3_60_buffer[1]-k3_60_buffer[2]>=0 &&
                                  //[1]收盤大於20點 大於[2][3][4] ma05    10點上
               close_60_buffer[1]-open_60_buffer[1]>=0.0020 && close_60_buffer[1]-close_60_buffer[2]>=0.0010 &&
               close_60_buffer[1]-close_60_buffer[3]>=0.0010 && close_60_buffer[1]-close_60_buffer[4]>=0.0010 &&
               close_60_buffer[1]-ma05_60_buffer[1]>=0.0010 && 
         
               macdmainline_30_buffer[1]<=0.00110   &&   
                                                         //m60 的45,90,180  皆是斜上
              (macdmainline_60_buffer[1]<=0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]>=0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0.0003 && 
               ma180_60_buffer[1]-ma180_60_buffer[2]>=0)))     
                                      //h4  k2,k3 在47上  開口向下  不做買單 
               if  ((k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3全向下,或 h4,m30,m60 kd2,kd3向下開口大 或 k1,k,2,k3在極低
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-25  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                    k2_240_buffer[0]>=40 && k3_240_buffer[1]>=40) ||
                            //h4  kd1,kd2,kd3<=-10   k2,k3>=70   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-10  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-10  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-10  &&  k2_240_buffer[0]>=70 && k3_240_buffer[1]>=70) ||
                               //(m15-57) h4  kd1,kd2,kd3<=0   k1,k2,k3>=80 macd>=0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=0  &&  k2_240_buffer[1]-d2_240_buffer[1]<=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=0  &&  k1_240_buffer[0]>=80 && k2_240_buffer[0]>=80 && k3_240_buffer[1]>=80 &&
                    macdmainline_240_buffer[1]>=0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3<=-35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-35) ||
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd差值>=-350
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0100  &&  close_240_buffer[2]-open_240_buffer[2]<=-0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0020  &&
                   (k1_240_buffer[1]>=50 && k2_240_buffer[1]>=50 && k3_240_buffer[1]>=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3<=-4   ma05  [1]-[2]<=-0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-4  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 && k1_240_buffer[1]-k1_240_buffer[2]<=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  && 
                    k1_240_buffer[1]-k1_240_buffer[2]<=0 &&  k2_240_buffer[1]-k2_240_buffer[2]<=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]<=0 &&  close_240_buffer[1]-open_240_buffer[1]<=-0.0001) || 
                   (k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10) ||
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14)) 
                    return;
                    else                    
                    OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-28*Point,Ask+2000*Point,"My order #B2",8802,0,Yellow );
                                             
//+++++++++++++++++++++++++++++++++++++++++++   BUY   3   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                                      //k1 一次上升大 kd1大幅交叉上 
         if ((k1_15_buffer[1]-k1_15_buffer[2]>=10  &&  k1_15_buffer[1]-d1_15_buffer[1]>=5  && close_15_buffer[1]-open_15_buffer[1]>=0.0002 &&
                                                   //設限以防過高再買進  
              k1_15_buffer[1]<=60 && k2_15_buffer[2]<=60  &&  k3_15_buffer[1]<=60 && 
                                                   //m15 的ma45  ma90 為斜L下跌末端型態 
             (ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0) || 
             (ma90_15_buffer[1]-ma90_15_buffer[2]>=0 && ma180_15_buffer[1]-ma180_15_buffer[2]>=0) &&                                  //下跌末端上升要一次升過前3bar
                                                        // 買單時 m30 m60 不可在過高位置
              macdmainline_30_buffer[1]<=0.00110   &&   
                                                         //m60 的45,90,180  皆是斜上
             (macdmainline_60_buffer[1]<=0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]>=0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0.0003 && 
              ma180_60_buffer[1]-ma180_60_buffer[2]>=0)) &&    
                                             //用m15 m30 macd 控管買賣點 
              macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00010 &&
              macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]>=-0.00050 &&  macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00020))
              if ((macdmainline_15_buffer[1]>=-0.00099 && macdmainline_15_buffer[1]<=0.00099 &&
                   macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                      //(m15-62) h4 k1,k2,k3 >=70 don't buy
                  (k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||                   
                     //(m15-64) h4 [1]為負並小於30點  kd2,kd3<=-10
                  (close_240_buffer[1]-open_240_buffer[1]<=-0.0030 &&                          
                   k2_240_buffer[1]-d2_240_buffer[1]<=-10 && k3_240_buffer[1]-d3_240_buffer[1]<=-10) ||                        
                                             //h4  k2,k3 在47上  開口向下  不做買單 
                   (k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3全向下,或 h4,m30,m60 kd2,kd3向下開口大 或 k1,k,2,k3在極低
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-25  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                    k2_240_buffer[0]>=40 && k3_240_buffer[1]>=40) ||
                            //h4  kd1,kd2,kd3<=-10   k2,k3>=70   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-10  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-10  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-10  &&  k2_240_buffer[0]>=70 && k3_240_buffer[1]>=70) ||
                               //(m15-57) h4  kd1,kd2,kd3<=0   k1,k2,k3>=80 macd>=0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=0  &&  k2_240_buffer[1]-d2_240_buffer[1]<=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=0  &&  k1_240_buffer[0]>=80 && k2_240_buffer[0]>=80 && k3_240_buffer[1]>=80 &&
                    macdmainline_240_buffer[1]>=0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3<=-35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-35) ||
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd差值>=-350
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0100  &&  close_240_buffer[2]-open_240_buffer[2]<=-0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0020  &&
                   (k1_240_buffer[1]>=50 && k2_240_buffer[1]>=50 && k3_240_buffer[1]>=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3<=-4   ma05  [1]-[2]<=-0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-4  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 && k1_240_buffer[1]-k1_240_buffer[2]<=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  && 
                    k1_240_buffer[1]-k1_240_buffer[2]<=0 &&  k2_240_buffer[1]-k2_240_buffer[2]<=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]<=0 &&  close_240_buffer[1]-open_240_buffer[1]<=-0.0001) || 
                   (k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10) ||
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14)) 
                    return;
                    else                    
                   OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-28*Point,Ask+2000*Point,"My order #B3",8803,0,Blue );
 
//+++++++++++++++++++++++++++++++++++++++++++   BUY   4   ++++++++++++++++++++++++++++++++++++++++++++++++++          
    
             //m15 的 [+4][-3][-2][+1]  && [+1]or[-2]為最低 bar實體為0.0006  較易發生條件較嚴
        if  (((close_15_buffer[1]-open_15_buffer[1]>=0.0006 && close_15_buffer[4]-open_15_buffer[4]>=0.0006  && 
               close_15_buffer[2]-open_15_buffer[2]<=-0.0006 && close_15_buffer[3]-open_15_buffer[3]<=-0.0006 &&
               k1_15_buffer[1]-k1_15_buffer[2]>=0  && close_15_buffer[1]-close_15_buffer[3]>=0.0001 &&
              (low_15_buffer[1]==M15lowest40bar ||  low_15_buffer[2]==M15lowest40bar) && 
              (ma05_15_buffer[1]-ma05_15_buffer[2]>=0 || 
              (close_15_buffer[1]-open_15_buffer[1]>=0.0001  && low_15_buffer[1]-close_15_buffer[1]<=-0.0029) ||
              (k2_15_buffer[1]-k2_15_buffer[2]>=2 && k3_15_buffer[1]-k3_15_buffer[2]>=2) ||
              (ma05_15_buffer[1]-ma05_15_buffer[2]>=-0.0006 && 
              (k2_15_buffer[1]-k2_15_buffer[2]>=0 || k3_15_buffer[1]-k3_15_buffer[2]>=0)))) ||
               
                //m15 的 [+5][-4][-3][-2][+1]  && [+1]or[-2]為最低 bar實體為0.0006  
              (close_15_buffer[1]-open_15_buffer[1]>=0.0006 && close_15_buffer[5]-open_15_buffer[5]>=0.0006  && 
               close_15_buffer[2]-open_15_buffer[2]<=-0.0006 && close_15_buffer[3]-open_15_buffer[3]<=-0.0006 &&
               close_15_buffer[4]-open_15_buffer[4]<=-0.0006 &&
               k1_15_buffer[1]-k1_15_buffer[2]>=0  && close_15_buffer[1]-close_15_buffer[3]>=0.0001 &&
              (low_15_buffer[1]==M15lowest40bar ||  low_15_buffer[2]==M15lowest40bar) && 
              (ma05_15_buffer[1]-ma05_15_buffer[2]>=-0.0001 || 
              (close_15_buffer[1]-open_15_buffer[1]>=0.0001  && low_15_buffer[1]-close_15_buffer[1]<=-0.0029) ||
              (k2_15_buffer[1]-k2_15_buffer[2]>=2 && k3_15_buffer[1]-k3_15_buffer[2]>=2) ||
              (ma05_15_buffer[1]-ma05_15_buffer[2]>=-0.0006 && 
              (k2_15_buffer[1]-k2_15_buffer[2]>=0 || k3_15_buffer[1]-k3_15_buffer[2]>=0)))) ||
               
                 //m30 的 [+4][-3][-2][+1]  && [+1]or[-2]為最低 bar實體為0.0008  較易發生條件較嚴
              (close_30_buffer[1]-open_30_buffer[1]>=0.0008 && close_30_buffer[4]-open_30_buffer[4]>=0.0008  && 
               close_30_buffer[2]-open_30_buffer[2]<=-0.0008 && close_30_buffer[3]-open_30_buffer[3]<=-0.0008 &&
               k1_30_buffer[1]-k1_30_buffer[2]>=0  && close_30_buffer[1]-close_30_buffer[3]>=0.0001 &&
              (low_30_buffer[1]==M30lowest40bar ||  low_30_buffer[2]==M30lowest40bar) && 
              (ma05_30_buffer[1]-ma05_30_buffer[2]>=0 || 
              (close_30_buffer[1]-open_30_buffer[1]>=0.0001  && low_30_buffer[1]-close_30_buffer[1]<=-0.0029) ||
              (k2_30_buffer[1]-k2_30_buffer[2]>=2 && k3_30_buffer[1]-k3_30_buffer[2]>=2) ||
              (ma05_30_buffer[1]-ma05_30_buffer[2]>=-0.0006 && 
              (k2_30_buffer[1]-k2_30_buffer[2]>=0 || k3_30_buffer[1]-k3_30_buffer[2]>=0)))) ||
                  //m30 的 [+5][-4][-3][-2][+1]  && [+1]or[-2]為最低 bar實體為0.0008  
              (close_30_buffer[1]-open_30_buffer[1]>=0.0008 && close_30_buffer[5]-open_30_buffer[5]>=0.0008  && 
               close_30_buffer[2]-open_30_buffer[2]<=-0.0008 && close_30_buffer[3]-open_30_buffer[3]<=-0.0008 &&
               close_30_buffer[4]-open_30_buffer[4]<=-0.0008 &&
               k1_30_buffer[1]-k1_30_buffer[2]>=0  && close_30_buffer[1]-close_30_buffer[3]>=0.0001 &&
              (low_30_buffer[1]==M30lowest40bar ||  low_30_buffer[2]==M30lowest40bar) && 
              (ma05_30_buffer[1]-ma05_30_buffer[2]>=-0.0001 || 
              (close_30_buffer[1]-open_30_buffer[1]>=0.0001  && low_30_buffer[1]-close_30_buffer[1]<=-0.0029) ||
              (k2_30_buffer[1]-k2_30_buffer[2]>=2 && k3_30_buffer[1]-k3_30_buffer[2]>=2) ||
              (ma05_30_buffer[1]-ma05_30_buffer[2]>=-0.0006 && 
              (k2_30_buffer[1]-k2_30_buffer[2]>=0 || k3_30_buffer[1]-k3_30_buffer[2]>=0)))) ||
             
                  //m60 的 [+4][-3][-2][+1]  && [+1]or[-2]為最低 bar實體為0.0010  較易發生條件較嚴
              (close_60_buffer[1]-open_60_buffer[2]>=-0.0001  &&
               close_60_buffer[1]-open_60_buffer[1]>=0.0010 && close_60_buffer[4]-open_60_buffer[4]>=0.0010  && 
               close_60_buffer[2]-open_60_buffer[2]<=-0.0010 && close_60_buffer[3]-open_60_buffer[3]<=-0.0010 &&
               k1_60_buffer[1]-k1_60_buffer[2]>=0  && 
              (low_60_buffer[1]==H1lowest40bar ||  low_60_buffer[2]==H1lowest40bar) && 
              (ma05_60_buffer[1]-ma05_60_buffer[2]>=0 || 
              (close_60_buffer[1]-open_60_buffer[1]>=0.0001  && low_60_buffer[1]-close_60_buffer[1]<=-0.0029) ||
              (k2_60_buffer[1]-k2_60_buffer[2]>=2 && k3_60_buffer[1]-k3_60_buffer[2]>=2) ||
              (ma05_60_buffer[1]-ma05_60_buffer[2]>=-0.0006 && 
              (k2_60_buffer[1]-k2_60_buffer[2]>=0 || k3_60_buffer[1]-k3_60_buffer[2]>=0)))) ||
                    //m60 的 [+5][-4][-3][-2][+1]  && [+1]or[-2]為最低 bar實體為0.0010  
              (close_60_buffer[1]-open_60_buffer[2]>=-0.0001  &&
               close_60_buffer[1]-open_60_buffer[1]>=0.0010 && close_60_buffer[5]-open_60_buffer[5]>=0.0010  && 
               close_60_buffer[2]-open_60_buffer[2]<=-0.0010 && close_60_buffer[3]-open_60_buffer[3]<=-0.0010 &&
               close_60_buffer[4]-open_60_buffer[4]<=-0.0010 &&
               k1_60_buffer[1]-k1_60_buffer[2]>=0  &&
              (low_60_buffer[1]==H1lowest40bar ||  low_60_buffer[2]==H1lowest40bar) && 
              (ma05_60_buffer[1]-ma05_60_buffer[2]>=-0.0001 || 
              (close_60_buffer[1]-open_60_buffer[1]>=0.0001  && low_60_buffer[1]-close_60_buffer[1]<=-0.0029) ||
              (k2_60_buffer[1]-k2_60_buffer[2]>=2 && k3_60_buffer[1]-k3_60_buffer[2]>=2) ||
              (ma05_60_buffer[1]-ma05_60_buffer[2]>=-0.0006 && 
              (k2_60_buffer[1]-k2_60_buffer[2]>=0 || k3_60_buffer[1]-k3_60_buffer[2]>=0))))) &&
               
              macdmainline_30_buffer[1]<=0.00110   &&   
                                                         //m60 的45,90,180  皆是斜上
             (macdmainline_60_buffer[1]<=0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]>=0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0.0003 && 
              ma180_60_buffer[1]-ma180_60_buffer[2]>=0)))    
                                                    //(m15-61) h4 k1,k2,k3 >=65 don't buy
              if   ((k1_240_buffer[1]>=65 && k2_240_buffer[1]>=65 && k3_240_buffer[1]>=65) ||                   
                 
                 
                                   //h4  k2,k3 在47上  開口向下  不做買單 
                   (k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3全向下,或 h4,m30,m60 kd2,kd3向下開口大 或 k1,k,2,k3在極低
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-25  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                    k2_240_buffer[0]>=40 && k3_240_buffer[1]>=40) ||
                            //h4  kd1,kd2,kd3<=-10   k2,k3>=70   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-10  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-10  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-10  &&  k2_240_buffer[0]>=70 && k3_240_buffer[1]>=70) ||
                               //(m15-57) h4  kd1,kd2,kd3<=0   k1,k2,k3>=80 macd>=0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=0  &&  k2_240_buffer[1]-d2_240_buffer[1]<=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=0  &&  k1_240_buffer[0]>=80 && k2_240_buffer[0]>=80 && k3_240_buffer[1]>=80 &&
                    macdmainline_240_buffer[1]>=0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3<=-35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-35) ||
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd差值>=-350
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0100  &&  close_240_buffer[2]-open_240_buffer[2]<=-0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0020  &&
                   (k1_240_buffer[1]>=50 && k2_240_buffer[1]>=50 && k3_240_buffer[1]>=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3<=-4   ma05  [1]-[2]<=-0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-4  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 && k1_240_buffer[1]-k1_240_buffer[2]<=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  && 
                    k1_240_buffer[1]-k1_240_buffer[2]<=0 &&  k2_240_buffer[1]-k2_240_buffer[2]<=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]<=0 &&  close_240_buffer[1]-open_240_buffer[1]<=-0.0001) || 
                   (k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10) ||
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14)) 
                    return;
                    else                    
                   OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-27*Point,Ask+2000*Point,"My order #B4",8804,0,Brown );

//+++++++++++++++++++++++++++++++++++++++++++   BUY   5   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                    
                                     //m15 長下影線 >=24點  [1]>0.0001開-低  [1]<-0.0001收-低
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
                  (macdmainline_15_buffer[1]>=-0.00099 && macdmainline_15_buffer[1]<=0.00099 &&
                   macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                                      //h4  k2,k3 在47上  開口向下  不做買單 
                   (k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3全向下,或 h4,m30,m60 kd2,kd3向下開口大 或 k1,k,2,k3在極低
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-25  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                    k2_240_buffer[0]>=40 && k3_240_buffer[1]>=40) ||
                            //h4  kd1,kd2,kd3<=-10   k2,k3>=70   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-10  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-10  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-10  &&  k2_240_buffer[0]>=70 && k3_240_buffer[1]>=70) ||
                               //(m15-57) h4  kd1,kd2,kd3<=0   k1,k2,k3>=80 macd>=0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=0  &&  k2_240_buffer[1]-d2_240_buffer[1]<=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=0  &&  k1_240_buffer[0]>=80 && k2_240_buffer[0]>=80 && k3_240_buffer[1]>=80 &&
                    macdmainline_240_buffer[1]>=0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3<=-35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-35) ||
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd差值>=-350
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0100  &&  close_240_buffer[2]-open_240_buffer[2]<=-0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0020  &&
                   (k1_240_buffer[1]>=50 && k2_240_buffer[1]>=50 && k3_240_buffer[1]>=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3<=-4   ma05  [1]-[2]<=-0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-4  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 && k1_240_buffer[1]-k1_240_buffer[2]<=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  && 
                    k1_240_buffer[1]-k1_240_buffer[2]<=0 &&  k2_240_buffer[1]-k2_240_buffer[2]<=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]<=0 &&  close_240_buffer[1]-open_240_buffer[1]<=-0.0001) || 
                   (k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10) ||
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14)) 
                    return;
                    else                    
                    OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-28*Point,Ask+2000*Point,"My order #B5",8805,0,Purple );
  
//+++++++++++++++++++++++++++++++++++++++++++   BUY   6   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                 //h1 [1]留下影線 >=24點  [1]>0.0001開-低  [1]<-0.0001收-低
       if  (((close_60_buffer[1]-open_60_buffer[1]<=-0.0001 && close_60_buffer[1]-open_60_buffer[1]>=-0.0006 && 
              low_60_buffer[1]-close_60_buffer[1]<=-0.0024) ||
             (close_60_buffer[1]-open_60_buffer[1]>=0.0001  && close_60_buffer[1]-open_60_buffer[1]>=-0.0006 && 
              low_60_buffer[1]-open_60_buffer[1]<=-0.0024) &&
              low_60_buffer[1]==H1lowest40bar &&
              k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 && k3_60_buffer[1]-k3_60_buffer[2]>=0) ||
                                         //[1]收紅 [2]留下影線
             ((close_60_buffer[2]-open_60_buffer[2]<=-0.0001 && close_60_buffer[2]-open_60_buffer[2]>=-0.0006 && 
              low_60_buffer[2]-close_60_buffer[2]<=-0.0024) ||
             (close_60_buffer[2]-open_60_buffer[2]>=0.0001  && close_60_buffer[1]-open_60_buffer[1]>=-0.0006 && 
              low_60_buffer[2]-open_60_buffer[2]<=-0.0024) &&
              low_60_buffer[2]==H1lowest40bar &&
              k1_60_buffer[1]-k1_60_buffer[2]>=5 && k1_60_buffer[1]-d1_60_buffer[1]>=5 &&  
              close_60_buffer[1]-open_60_buffer[1]>=0)  && 
              macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=-0.0200 && 
              macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=0.00010) 
              
              if ((close_60_buffer[2]-open_60_buffer[2]<=-0.0100 || close_60_buffer[1]-open_60_buffer[1]<=-0.0100 ||
                   macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=-0.00200 || 
                   macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=0.00050) ||
                                                 //避開下跌後之反彈
                  (open_60_buffer[3]-open_60_buffer[2]<=0.0003 && open_60_buffer[4]-open_60_buffer[2]<=0.0003) ||    
                  (open_60_buffer[2]-open_60_buffer[1]<=0.0003 && open_60_buffer[3]-open_60_buffer[1]<=0.0003) ||     
                  (macdmainline_60_buffer[1]>=-0.00099 && macdmainline_60_buffer[1]<=0.00099 &&
                   macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                                       //h4  k2,k3 在47上  開口向下  不做買單 
                   (k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3全向下,或 h4,m30,m60 kd2,kd3向下開口大 或 k1,k,2,k3在極低
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-25  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                    k2_240_buffer[0]>=40 && k3_240_buffer[1]>=40) ||
                            //h4  kd1,kd2,kd3<=-10   k2,k3>=70   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-10  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-10  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-10  &&  k2_240_buffer[0]>=70 && k3_240_buffer[1]>=70) ||
                               //(m15-57) h4  kd1,kd2,kd3<=0   k1,k2,k3>=80 macd>=0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=0  &&  k2_240_buffer[1]-d2_240_buffer[1]<=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=0  &&  k1_240_buffer[0]>=80 && k2_240_buffer[0]>=80 && k3_240_buffer[1]>=80 &&
                    macdmainline_240_buffer[1]>=0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3<=-35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-35) ||
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd差值>=-350
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0100  &&  close_240_buffer[2]-open_240_buffer[2]<=-0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0020  &&
                   (k1_240_buffer[1]>=50 && k2_240_buffer[1]>=50 && k3_240_buffer[1]>=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3<=-4   ma05  [1]-[2]<=-0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-4  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 && k1_240_buffer[1]-k1_240_buffer[2]<=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  && 
                    k1_240_buffer[1]-k1_240_buffer[2]<=0 &&  k2_240_buffer[1]-k2_240_buffer[2]<=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]<=0 &&  close_240_buffer[1]-open_240_buffer[1]<=-0.0001) || 
                   (k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10) ||
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14)) 
                    return;
                    else                    
                   OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-28*Point,Ask+2000*Point,"My order #B6",8806,0,Gold );
 
 //+++++++++++++++++++++++++++++++++++++++++++   BUY   7   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                           //(m15-61)  H4     [2]留下影線>80點  [1]>=[2] 
       if  ((close_240_buffer[2]-open_240_buffer[2]<=-0.0001 && low_240_buffer[2]-close_240_buffer[2]<=-0.0080) ||
             (close_240_buffer[2]-open_240_buffer[2]>=0.0001  && low_240_buffer[2]-open_240_buffer[2]<=-0.0080) &&
              close_240_buffer[1]-open_240_buffer[1]>=0.0001 &&
                                                          //H4 k1,k2,k3 <=30   || [2]<=-0.0250
            ((k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30  &&  k3_240_buffer[1]<=30) || (close_240_buffer[2]-open_240_buffer[2]<=-0.0250)))
   
              OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-28*Point,Ask+2000*Point,"My order #B7",8807,0,OrangeRed );
    
  //+++++++++++++++++++++++++++++++++++++++++++   BUY   8   ++++++++++++++++++++++++++++++++++++++++++++++++++          
              
                     //(m15-62)   h4 的 ma180斜上 或ma180持平 ma360 斜上   
        if   ((ma180_240_buffer[1]-ma180_240_buffer[2]>=0.0001 ||  (ma180_240_buffer[1]-ma180_240_buffer[2]>=0 &&
               ma360_240_buffer[1]-ma360_240_buffer[2]>=0.0001)) &&
                  // [1]收在ma180上的20點內  
              (close_240_buffer[1]-ma180_240_buffer[1]>=0.0001  && close_240_buffer[1]-ma180_240_buffer[1]<=0.0020) &&
                 //h4 [1]下影線超過30點
              ((close_240_buffer[1]-open_240_buffer[1]<=-0.0001 && low_240_buffer[1]-close_240_buffer[1]<=-0.0030) ||
              (close_240_buffer[1]-open_240_buffer[1]>=0.0001  && low_240_buffer[1]-open_240_buffer[1]<=-0.0030)) &&
                 //kd1>=3      
               k1_240_buffer[1]-d1_240_buffer[1]>=3 &&
                  // macd差值>=-0.00150  <=0.00100 
              (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00150 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100) &&
                   // [2]||[3]||[4]收在ma180上的20點內  
             ((close_240_buffer[2]-ma180_240_buffer[2]>=0.0001  && close_240_buffer[2]-ma180_240_buffer[2]<=0.0020) ||
              (close_240_buffer[3]-ma180_240_buffer[3]>=0.0001  && close_240_buffer[3]-ma180_240_buffer[3]<=0.0020) ||
              (close_240_buffer[4]-ma180_240_buffer[4]>=0.0001  && close_240_buffer[4]-ma180_240_buffer[4]<=0.0020)))
                       
              OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-28*Point,Ask+2000*Point,"My order #B8",8808,0,OrangeRed );

 //+++++++++++++++++++++++++++++++++++++++++++   BUY   9   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                 
         //h4 的 [+4][-3][-2][+1]  && [+1]or[-2]為最低 bar實體為0.0030 
        if   ((close_240_buffer[1]-open_240_buffer[1]>=0.0030 && close_240_buffer[4]-open_240_buffer[4]>=0.0010  && 
               close_240_buffer[2]-open_240_buffer[2]<=-0.0010 && close_240_buffer[3]-open_240_buffer[3]<=-0.0010 &&
                //(m15-61)  [1]上影線小於15點
               high_240_buffer[1]-close_240_buffer[1]<=0.0015  &&
                 //(m15-59) kd1,(kd2||kd3)>=-2 開口必須縮小 || macd差值在100內
             ((k1_240_buffer[1]-d1_240_buffer[1]>=-3  && (k2_240_buffer[1]-d2_240_buffer[1]>=-3 || k3_240_buffer[1]-d3_240_buffer[1]>=-3)) ||
                      // (m15-61)  macd差值>=-0.00150  <=0.00100 
              (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00150 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100))  &&
                  //(m15=58)  h4 收盤必須離ma05在15點內   h1   k1,k2,k3必須在45下以免已漲過高
               ma05_240_buffer[1]- close_240_buffer[1]<=0.0015 && ma05_240_buffer[1]-ma05_240_buffer[2]>=0 &&
               k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||  //  && 
          //    (low_240_buffer[1]==H4lowest40bar ||  low_240_buffer[2]==H4lowest40bar)) ||
            
                   //h4 的 [+5][-4][-3][-2][+1]  && [+1]or[-2]為最低 bar實體為0.0010   [1]>=0.0030  
              (close_240_buffer[1]-open_240_buffer[1]>=0.0030 && close_240_buffer[5]-open_240_buffer[5]>=0.0010  && 
               close_240_buffer[2]-open_240_buffer[2]<=-0.0010 && close_240_buffer[3]-open_240_buffer[3]<=-0.0010 &&
               close_240_buffer[4]-open_240_buffer[4]<=-0.0010 &&
                              //(m15-61)  [1]上影線小於15點
               high_240_buffer[1]-close_240_buffer[1]<=0.0015  &&

                         //(m15-59) kd1,(kd2||kd3)>=-2 開口必須縮小 || macd差值在100內
             ((k1_240_buffer[1]-d1_240_buffer[1]>=-3  && (k2_240_buffer[1]-d2_240_buffer[1]>=-3 || k3_240_buffer[1]-d3_240_buffer[1]>=-3)) ||
                      // (m15-61)  macd差值>=-0.00150  <=0.00100 
              (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00150 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100))  &&
                  //(m15=58)  h4 收盤必須離ma05在15點內   h1   k1,k2,k3必須在45下以免已漲過高
               ma05_240_buffer[1]- close_240_buffer[1]<=0.0015 && ma05_240_buffer[1]-ma05_240_buffer[2]>=0 &&
               k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30)  ||   //  && 
                       //在m15之下執行時   下列無法作用
      //        (low_240_buffer[1]==H4lowest40bar ||  low_240_buffer[2]==H4lowest40bar || low_240_buffer[3]==H4lowest40bar )) ||
                    
                        //(m15-61) H4 的 [+2][+1]   上影線在10點內
              (close_240_buffer[1]-open_240_buffer[1]>=0.0010 && close_240_buffer[2]-open_240_buffer[2]>=0.0010  && 
                     //  [1][2]上影線小於10點
               low_240_buffer[1]-close_240_buffer[1]>=0.0010  &&  low_240_buffer[2]-close_240_buffer[2]>=0.0010  &&             
                    //    kd1,kd2,kd3>=1 
               k1_240_buffer[1]-k1_240_buffer[2]>=1  && k2_240_buffer[1]-k2_240_buffer[2]>=1 && k3_240_buffer[1]-k3_240_buffer[2]>=1 &&
                    //   macd  差值>=-0.00100  <=0.00100
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100  &&
               macdmainline_240_buffer[1]<=-0.00350 && 
                      //k1,k2,k3<=15
               k1_240_buffer[1]<=15 && k2_240_buffer[1]<=15 && k3_240_buffer[1]<=15) ||
    
                     //h4  [4][3][2]<=-0.0050 [1]>=0.0010  ma45[1]-[2]>=0.0001
              (close_240_buffer[4]-open_240_buffer[4]<=-0.0050 && close_240_buffer[3]-open_240_buffer[3]<=-0.0050  && 
               close_240_buffer[2]-open_240_buffer[2]<=-0.0050 && close_240_buffer[1]-open_240_buffer[1]>=0.0010 &&
               ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0001) ||
          
                       //(m15-61) h4  [4]+[3]+[2]<=-0.0150 [1]>=0.0030  [1]-[2]>=-0.0010  macd  差值>=-0.00100  <=0.00100
             (((close_240_buffer[4]-open_240_buffer[4])+(close_240_buffer[3]-open_240_buffer[3])+ 
               (close_240_buffer[2]-open_240_buffer[2])<=-0.0150) && close_240_buffer[1]-open_240_buffer[1]>=0.0030 &&
                close_240_buffer[1]-close_240_buffer[2]>=-0.0010 &&
                macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100)) 
                  if    ((k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10) ||
                      (k1_240_buffer[1]<=13 && k2_240_buffer[1]<=13  &&  k3_240_buffer[1]<=13) ||
                         //(m15-64) [1]||[2]不可跌破150點 跌太多不好回頭
                      (close_240_buffer[1]-open_240_buffer[1]<=-0.0150 || close_240_buffer[2]-open_240_buffer[2]<=-0.0150) ||
                          //(m15-64) [1]||[2]不可跌破110點   kd1[1]||kd1[2]<=-20 
                      (close_240_buffer[1]-open_240_buffer[1]<=-0.0110 && k1_240_buffer[1]-d1_240_buffer[1]<=-20) ||
                      (close_240_buffer[2]-open_240_buffer[2]<=-0.0110 && k1_240_buffer[2]-d1_240_buffer[2]<=-20) ||
                   // (m15-64)  kd1,kd2,kd3<=-15
                      (k1_240_buffer[1]-d1_240_buffer[1]<=-15 && k2_240_buffer[1]-d2_240_buffer[1]<=-15 && k3_240_buffer[1]-d3_240_buffer[1]<=-15)) 
                       return;
                       else              
                       OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-30*Point,Ask+2000*Point,"My order #B9",8809,0,OrangeRed );

 //+++++++++++++++++++++++++++++++++++++++++++   BUY   10   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                 
                                    //h1 [1] 實紅超過30,50,70,100點   
                                //100 點 [1]-[2]>=0.0001  [1]-[3]>=0.0001
      if   ((((close_60_buffer[1]-open_60_buffer[1]>=0.0100 && close_60_buffer[1]-close_60_buffer[2]>=0.0001  &&
            close_60_buffer[1]-close_60_buffer[3]>=0.0001 && 
                               //kd1,kd2,kd3>=0  k1,k2,k3<=30 
            k1_60_buffer[1]-d1_60_buffer[1]>=0 && k2_60_buffer[1]-d2_60_buffer[1]>=0 && k3_60_buffer[1]-d3_60_buffer[1]>=0 &&
            k1_60_buffer[1]<=30 && k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30) ||
                               //75 點 [1]-[2]>=0~~~~[1]-[4]>=0 
           (close_60_buffer[1]-open_60_buffer[1]>=0.0075 && close_60_buffer[1]-close_60_buffer[2]>=0  &&
            close_60_buffer[1]-close_60_buffer[3]>=0 && close_60_buffer[1]-close_60_buffer[4]>=0  &&
                              //kd1,kd2,kd3>=0 k1,k2,k3<=30 
            k1_60_buffer[1]-d1_60_buffer[1]>=0 && k2_60_buffer[1]-d2_60_buffer[1]>=0 && k3_60_buffer[1]-d3_60_buffer[1]>=0 &&
            k1_60_buffer[1]<=30 && k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30) ||
                              //55 點 [1]-[2][3]>=0,[1]-[6]>=0 
           (close_60_buffer[1]-open_60_buffer[1]>=0.0055 && close_60_buffer[1]-close_60_buffer[2]>=0  &&
            close_60_buffer[1]-close_60_buffer[3]>=0 && close_60_buffer[1]-close_60_buffer[6]>=0  &&
                              //kd1,kd2,kd3>=0 k1,k2,k3<=30 
            k1_60_buffer[1]-d1_60_buffer[1]>=0 && k2_60_buffer[1]-d2_60_buffer[1]>=0 && k3_60_buffer[1]-d3_60_buffer[1]>=0 &&
            k1_60_buffer[1]<=30 && k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30) ||
                          //30 點 [1]-[2]>=0~~~~~[1]-[8]>=0 
           (close_60_buffer[1]-open_60_buffer[1]>=0.0030 && close_60_buffer[1]-close_60_buffer[2]>=0  &&
            close_60_buffer[1]-close_60_buffer[3]>=0 && close_60_buffer[1]-close_60_buffer[4]>=0  &&
            close_60_buffer[1]-close_60_buffer[5]>0 && close_60_buffer[1]-close_60_buffer[6]>=0  &&
            close_60_buffer[1]-close_60_buffer[7]>=0 && close_60_buffer[1]-close_60_buffer[8]>=0  &&
                                  //kd1,kd2,kd3>=2 k1,k2,k3<=30 
            k1_60_buffer[1]-d1_60_buffer[1]>=2 && k2_60_buffer[1]-d2_60_buffer[1]>=2 && k3_60_buffer[1]-d3_60_buffer[1]>=2 &&
            k1_60_buffer[1]<=30 && k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30))))
                          //h4  k2,k3 在47上  開口向下  不做買單 
            if    ((k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3全向下,或 h4,m30,m60 kd2,kd3向下開口大 或 k1,k,2,k3在極低
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-25  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                    k2_240_buffer[0]>=40 && k3_240_buffer[1]>=40) ||
                            //h4  kd1,kd2,kd3<=-10   k2,k3>=70   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-10  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-10  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-10  &&  k2_240_buffer[0]>=70 && k3_240_buffer[1]>=70) ||
                               //(m15-57) h4  kd1,kd2,kd3<=0   k1,k2,k3>=80 macd>=0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=0  &&  k2_240_buffer[1]-d2_240_buffer[1]<=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=0  &&  k1_240_buffer[0]>=80 && k2_240_buffer[0]>=80 && k3_240_buffer[1]>=80 &&
                    macdmainline_240_buffer[1]>=0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3<=-35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-35) ||
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd差值>=-350
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0100  &&  close_240_buffer[2]-open_240_buffer[2]<=-0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0020  &&
                   (k1_240_buffer[1]>=50 && k2_240_buffer[1]>=50 && k3_240_buffer[1]>=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3<=-4   ma05  [1]-[2]<=-0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-4  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 && k1_240_buffer[1]-k1_240_buffer[2]<=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  && 
                    k1_240_buffer[1]-k1_240_buffer[2]<=0 &&  k2_240_buffer[1]-k2_240_buffer[2]<=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]<=0 &&  close_240_buffer[1]-open_240_buffer[1]<=-0.0001) || 
                   (k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10) ||
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14)) 
                    return;
                    else                    
                    OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-38*Point,Ask+2000*Point,"My order #B10",8810,0,Gold );

 //+++++++++++++++++++++++++++++++++++++++++++   BUY   11   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                      //m30 的 [+4][-3][-2][+1]   [1]>=0.0030 
         if   ((close_30_buffer[1]-open_30_buffer[1]>=0.0030 && close_30_buffer[4]-open_30_buffer[4]>=0.0008  && 
               close_30_buffer[2]-open_30_buffer[2]<=-0.0008 && close_30_buffer[3]-open_30_buffer[3]<=-0.0008 &&
               k2_30_buffer[1]-d2_30_buffer[1]>=12 && k3_30_buffer[1]-d3_30_buffer[1]>=12 &&
               k2_30_buffer[1]<=45 && k3_30_buffer[1]<=45) || 
                       //m30 的 [+5][-4][-3][-2][+1]  [1]>=0.0015  
              (close_30_buffer[1]-open_30_buffer[1]>=0.0015 && close_30_buffer[5]-open_30_buffer[5]>=0.0010  && 
               close_30_buffer[2]-open_30_buffer[2]<=-0.0010 && close_30_buffer[3]-open_30_buffer[3]<=-0.0010 &&
               close_30_buffer[4]-open_30_buffer[4]<=-0.0010 &&
               k2_30_buffer[1]-d2_30_buffer[1]>=10 && k3_30_buffer[1]-d3_30_buffer[1]>=10 &&
               k2_30_buffer[1]<=30 && k3_30_buffer[1]<=30) || 
  
                  //m60 的 [+4][-3][-2][+1]   [1]>=0.0030 
              (close_60_buffer[1]-open_60_buffer[1]>=0.0030 && close_60_buffer[4]-open_60_buffer[4]>=0.0010  && 
               close_60_buffer[2]-open_60_buffer[2]<=-0.0010 && close_60_buffer[3]-open_60_buffer[3]<=-0.0010 &&
               k2_60_buffer[1]-d2_60_buffer[1]>=10 && k3_60_buffer[1]-d3_60_buffer[1]>=10 &&
               k2_60_buffer[1]<=55 && k3_60_buffer[1]<=55) || 
                     //m60 的 [+4][-3][-2][+1]   [1]>=0.0020 
              (close_60_buffer[1]-open_60_buffer[1]>=0.0020 && close_60_buffer[4]-open_60_buffer[4]>=0.0007  && 
               close_60_buffer[2]-open_60_buffer[2]<=-0.0007 && close_60_buffer[3]-open_60_buffer[3]<=-0.0007 &&
               k1_60_buffer[1]-d1_60_buffer[1]>=0 && k2_60_buffer[1]-d2_60_buffer[1]>=5 && k3_60_buffer[1]-d3_60_buffer[1]>=5 &&
               k2_60_buffer[1]<=20 && k3_60_buffer[1]<=20) || 
                     //m60 的 [+5][-4][-3][-2][+1]  [1]>=0.0015  
              (close_60_buffer[1]-open_60_buffer[1]>=0.0015 && close_60_buffer[5]-open_60_buffer[5]>=0.0007  && 
               close_60_buffer[2]-open_60_buffer[2]<=-0.0007 && close_60_buffer[3]-open_60_buffer[3]<=-0.0007 &&
               close_60_buffer[4]-open_60_buffer[4]<=-0.0007 &&
               k2_60_buffer[1]-d2_60_buffer[1]>=4 && k3_60_buffer[1]-d3_60_buffer[1]>=4 &&
               k2_60_buffer[1]<=35 && k3_60_buffer[1]<=35) || 

                        //m60 的 [+5][-4][+3][-2][+1]  [1]>=0.0015  
              (close_60_buffer[1]-open_60_buffer[1]>=0.0015 && close_60_buffer[5]-open_60_buffer[5]>=0.0007  && 
               close_60_buffer[2]-open_60_buffer[2]<=-0.0007 && close_60_buffer[3]-open_60_buffer[3]>=0.0007 &&
               close_60_buffer[4]-open_60_buffer[4]<=-0.0007 &&
               k1_60_buffer[1]-k1_60_buffer[2]>=0 &&  k2_60_buffer[1]-k2_60_buffer[2]>=0 && k3_60_buffer[1]-k3_60_buffer[2]>=0 &&
               k2_60_buffer[1]<=20 && k3_60_buffer[1]<=20)) 
              
                          //h4  k2,k3 在47上  開口向下  不做買單 
               if  ((k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3全向下,或 h4,m30,m60 kd2,kd3向下開口大 或 k1,k,2,k3在極低
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-25  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                    k2_240_buffer[0]>=40 && k3_240_buffer[1]>=40) ||
                            //h4  kd1,kd2,kd3<=-10   k2,k3>=70   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-10  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-10  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-10  &&  k2_240_buffer[0]>=70 && k3_240_buffer[1]>=70) ||
                               //(m15-57) h4  kd1,kd2,kd3<=0   k1,k2,k3>=80 macd>=0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=0  &&  k2_240_buffer[1]-d2_240_buffer[1]<=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=0  &&  k1_240_buffer[0]>=80 && k2_240_buffer[0]>=80 && k3_240_buffer[1]>=80 &&
                    macdmainline_240_buffer[1]>=0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3<=-35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-35) ||
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd差值>=-350
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0100  &&  close_240_buffer[2]-open_240_buffer[2]<=-0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0020  &&
                   (k1_240_buffer[1]>=50 && k2_240_buffer[1]>=50 && k3_240_buffer[1]>=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3<=-4   ma05  [1]-[2]<=-0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-4  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 && k1_240_buffer[1]-k1_240_buffer[2]<=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  && 
                    k1_240_buffer[1]-k1_240_buffer[2]<=0 &&  k2_240_buffer[1]-k2_240_buffer[2]<=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]<=0 &&  close_240_buffer[1]-open_240_buffer[1]<=-0.0001) || 
                   (k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10) ||
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14)) 
                    return;
                    else                    
                    OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-28*Point,Ask+2000*Point,"My order #B11",8811,0,Gold );

    //+++++++++++++++++++++++++++++++++++++++++++   BUY   12   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                  //m30 [2]留下影線 >=25點  [1]>0.0001開-低  [1]<-0.0001收-低
       if  (((close_30_buffer[2]-open_30_buffer[2]<=-0.0001 && low_30_buffer[2]-close_30_buffer[2]<=-0.0025) ||
             (close_30_buffer[2]-open_30_buffer[2]>=0.0001  && low_30_buffer[2]-open_30_buffer[2]<=-0.0025) &&
             (low_30_buffer[1]==M15lowest50bar || low_30_buffer[2]==M15lowest50bar) &&
                                  //       [1]收正  [1]-[2]>=0.0001   k1,k2,k3>=0  k1,k2,k3<=30
             (close_30_buffer[1]-open_30_buffer[1]>=0.0001 && close_30_buffer[1]-close_30_buffer[2]>=0.0001 &&
              k1_30_buffer[1]-k1_30_buffer[2]>=0 && k2_30_buffer[1]-k2_30_buffer[2]>=0 && k3_30_buffer[1]-k3_30_buffer[2]>=0 &&
              k1_30_buffer[1]<=30 && k2_30_buffer[1]<=30 && k3_30_buffer[1]<=30) ||
                                    //    [1]收正  [1]-[2]>=0.0001   k1,(k2||k3)>=0  k1,k2,k3<=30 kd1>=1
             (close_30_buffer[1]-open_30_buffer[1]>=0.0001 && close_30_buffer[1]-close_30_buffer[2]>=0.0001 &&
              k1_30_buffer[1]-k1_30_buffer[2]>=0 && (k2_30_buffer[1]-k2_30_buffer[2]>=0 || k3_30_buffer[1]-k3_30_buffer[2]>=0) &&
              k1_30_buffer[1]-d1_30_buffer[2]>=1 && 
              k1_30_buffer[1]<=20 && k2_30_buffer[1]<=20 && k3_30_buffer[1]<=20)) ||
              
                                     //m30 [1]&&[2]留下影線 >=25點  [1]>0.0001開-低  [1]<-0.0001收-低
            ((close_30_buffer[1]-open_30_buffer[1]<=-0.0001 && close_30_buffer[1]-open_30_buffer[1]>=-0.0010 && 
            low_30_buffer[1]-close_30_buffer[1]<=-0.0025) ||
             (close_30_buffer[1]-open_30_buffer[1]>=0.0001  && low_30_buffer[1]-open_30_buffer[1]<=-0.0025) &&
             (close_30_buffer[2]-open_30_buffer[2]<=-0.0001 && low_30_buffer[2]-close_30_buffer[2]<=-0.0025) ||
             (close_30_buffer[2]-open_30_buffer[2]>=0.0001  && low_30_buffer[2]-open_30_buffer[2]<=-0.0025) &&
              k1_30_buffer[1]<=30 && k2_30_buffer[1]<=30 && k3_30_buffer[1]<=30  &&
             (low_30_buffer[1]==M15lowest50bar || low_30_buffer[2]==M15lowest50bar) &&
                                  //       [1]收正  [1]-[2]>=0.0001   k2,k3>=0  k1,k2,k3<=30
              close_30_buffer[1]-open_30_buffer[1]>=0.0010 && close_30_buffer[1]-close_30_buffer[2]>=0.0001 &&
              k2_30_buffer[1]-k2_30_buffer[2]>=0 && k3_30_buffer[1]-k3_30_buffer[2]>=0 &&
              k1_30_buffer[1]<=30 && k2_30_buffer[1]<=30 && k3_30_buffer[1]<=30) ||
                                    // [1]留下影線 >=40點  [1]>0.0001開-低  k1,k2,k3>=1  ,k1,k2,k3<=20
            ((close_30_buffer[1]-open_30_buffer[1]>=0.0001  && low_30_buffer[1]-open_30_buffer[1]<=-0.0040) &&
              low_30_buffer[1]==M15lowest50bar &&
              k1_30_buffer[1]-k1_30_buffer[2]>=1 && k2_30_buffer[1]-k2_30_buffer[2]>=1 && k3_30_buffer[1]-k3_30_buffer[2]>=1 &&
              k1_30_buffer[1]<=20 && k2_30_buffer[1]<=20 && k3_30_buffer[1]<=20))
          
                                         
                                      //return  else  以下 buy 12   buy13  相同 和 buy1  ~  buy 11  不同
                                      //return  else  以下 buy 12   buy13  相同 和 buy1  ~  buy 11  不同

               if  ((k2_60_buffer[1]-d2_60_buffer[1]<=-25  &&  k3_60_buffer[1]-d3_60_buffer[1]<=-25) ||
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-10  && k2_60_buffer[1]-d2_60_buffer[1]<=-10  &&  k3_60_buffer[1]-d3_60_buffer[1]<=-10) ||                                   //h4  k2,k3 在47上  開口向下  不做買單 
                    (k2_60_buffer[1]-d2_60_buffer[1]<=-19  &&  k3_60_buffer[1]-d3_60_buffer[1]<=-19 && 
                     ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0010  &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0008) ||
                        //h1 [1]<=-0.0120  h4   ma05,ma08,ma12<=-0.0025
                    (close_60_buffer[1]-open_60_buffer[1]<=-0.0120 && ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0025  &&  
                     ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0025  &&  ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0025) ||

                    
                   (k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[2]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]>=55 && k3_240_buffer[1]>=55 &&  k1_240_buffer[1]-k1_240_buffer[1]<=-10  &&
                   (k2_240_buffer[1]-k2_240_buffer[1]<=-10 || k3_240_buffer[1]-k3_240_buffer[1]<=-10)) ||
                         //(m15-57)h4  [1]跌過140點
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0140) ||
                     //(m15-59) h4  ma45,ma90,ma180其中任二[1]-[2]<=0    [1]<=-0.0100
                  ((ma45_240_buffer[1]-ma45_240_buffer[2]<=0 || ma90_240_buffer[1]-ma90_240_buffer[2]<=0) &&
                   (ma90_240_buffer[1]-ma90_240_buffer[2]<=0 || ma180_240_buffer[1]-ma180_240_buffer[2]<=0) &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0100) ||  
                         //(m15-59) h4 k1||k2||k3 >=65 don't buy
                   (k1_240_buffer[1]>=65 || k2_240_buffer[1]>=65 || k3_240_buffer[1]>=65) ||                   
                      //(m15-57)h4  ma45[1][2]<=-0.0007  ma90[1][2]<=-0.0004  ma45||ma90([1]-[2])-[2]-[3])<=-0.0001 ma45,ma90間距<=0.0400 >=-0.0035
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0007  &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0004 &&
                  ((ma45_240_buffer[1]-ma45_240_buffer[2])-(ma45_240_buffer[2]-ma45_240_buffer[3])<=-0.0001  ||
                   (ma90_240_buffer[1]-ma90_240_buffer[2])-(ma90_240_buffer[2]-ma90_240_buffer[3])<=-0.0001) &&
                    //(m15-58)   ma45在ma90 下但間距<=0.0350 >=-0.0010
                    ma45_240_buffer[1]-ma90_240_buffer[1]<=0.0350 && ma45_240_buffer[1]-ma90_240_buffer[1]>=-0.0010) ||
                          //(m15-58)h4  kd1+kd2+kd3<=-49 kd1,kd2,kd3<=-7
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-49 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-7 && k2_240_buffer[1]-d2_240_buffer[1]<=-7 && k3_240_buffer[1]-d3_240_buffer[1]<=-7) ||
                     //(m15-59)(m15-58)h4  kd1+kd2+kd3<=-40 kd1,kd2,kd3<=-12
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-40 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-12 && k2_240_buffer[1]-d2_240_buffer[1]<=-12 && k3_240_buffer[1]-d3_240_buffer[1]<=-12) ||
                  
                           //(m15-61)(m15-57)h4  [1]跌過100點  (ma45<=-0.0015  || [0]<=-0.0150)
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0100 && (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0015 ||
                    close_240_buffer[0]-open_240_buffer[0]<=-0.0150)) ||
                            //(m15-57)h4 k1<=-19  k2,k3[1]-[2]<=-2
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-19  &&  k2_240_buffer[1]-k2_240_buffer[2]<=-2 &&
                    k3_240_buffer[1]-k3_240_buffer[2]<=-2) ||
                       // h4  ma05[1]-ma12[1]<=-0.0160  ma05[2]-ma12[2]<=-0.0120   ma05[1]-ma05[2]<=-0.0030
                   (ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.0160  &&  ma05_240_buffer[2]-ma12_240_buffer[2]<=-0.0120  &&
                    ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0030) ||
                          //(m15-57)h4   ma05[1]-[2]<=-0.0050  ma45[1]-[2]<=-0.0007
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0050  &&  ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0007) ||
                  
                         //h4   k2,k3<=-15 k1<=-5   macd<=-0.00300
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-5 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300) ||    
                            //h4   k1,k2,k3<=-7    macd[1]<=-0.00350  macd[2]<=-0.00250  (macd[1]-[2]<=-0.00070 || macdmain[1]-[2]<=-0.00150  macdsignal[1]-[2]<=-0.0070 
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-7  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-7 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-7 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00350 &&
                    macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]<=-0.00250 && 
                  (((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1])-(macdmainline_240_buffer[2]-macdsignalline_240_buffer[2])<=-0.00070) ||    
                    (macdmainline_240_buffer[1]-macdmainline_240_buffer[2]<=-0.00150 && macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2])<=-0.00070)) ||
                          //ma45  ma90 <=-0.0014
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0014  &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0014) ||
                          //(m15-57) h4 ma45  ma90 <=-0.0010   ma45+ma90<=-0.0029
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0010  &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0010 &&
                   (ma45_240_buffer[1]-ma45_240_buffer[2])+ (ma90_240_buffer[1]-ma90_240_buffer[2])<=-0.0029) ||

                           //H4 k1,k2,k3全向下,或 h4,m30,m60 kd2,kd3向下開口大 或 k1,k,2,k3在極低
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-2 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-25  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-25 && 
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                    k2_240_buffer[0]>=40 && k3_240_buffer[1]>=40 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-10  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-10  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-10  &&  k2_240_buffer[0]>=70 && k3_240_buffer[1]>=70 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  && 
                    k1_240_buffer[1]-k1_240_buffer[2]<=0 &&  k2_240_buffer[1]-k2_240_buffer[2]<=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]<=0 &&  close_240_buffer[1]-open_240_buffer[1]<=-0.0001 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                                       //34分 結單後34分之內不動作
                   (OrderType()==OP_BUY && TimeCurrent()-OrderCloseTime()<=2000))
                    return;
                    else      
                    OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-28*Point,Ask+2000*Point,"My order #B12",8812,0,Maroon );
   //+++++++++++++++++++++++++++++++++++++++++++   BUY   13   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                  //h1 留下影線[2] >=25點  [1]>0.0001開-低  [1]<-0.0001收-低
       if  (((close_60_buffer[2]-open_60_buffer[2]<=-0.0001 && low_60_buffer[2]-close_60_buffer[2]<=-0.0025) ||
             (close_60_buffer[2]-open_60_buffer[2]>=0.0001  && low_60_buffer[2]-open_60_buffer[2]<=-0.0025) &&
             (low_60_buffer[1]==M15lowest70bar || low_60_buffer[2]==M15lowest70bar) &&
                                  //       [1]收正  [1]-[2]>=0.0001   k1,k2,k3>=0  k1,k2,k3<=30
             (close_60_buffer[1]-open_60_buffer[1]>=0.0010 && close_60_buffer[1]-close_60_buffer[2]>=0.0001 &&
              k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 && k3_60_buffer[1]-k3_60_buffer[2]>=0 &&
              k1_60_buffer[1]<=30 && k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30) ||
                                       //    [1]收正  [1]-[2]>=0.0001   k1,(k2||k3)>=0  k1,k2,k3<=30 kd1>=1
             (close_60_buffer[1]-open_60_buffer[1]>=0.0001 && close_60_buffer[1]-close_60_buffer[2]>=0.0001 &&
              k1_60_buffer[1]-k1_60_buffer[2]>=0 && (k2_60_buffer[1]-k2_60_buffer[2]>=0 || k3_60_buffer[1]-k3_60_buffer[2]>=0) &&
              k1_60_buffer[1]-d1_60_buffer[2]>=1 && 
              k1_60_buffer[1]<=20 && k2_60_buffer[1]<=20 && k3_60_buffer[1]<=20)) ||
            
                                     //m60 [1],[2]留下影線 >=24點  [1]>0.0001開-低  [1]<-0.0001收-低  [1]>=-0.0010  <=-0.0001
            ((close_60_buffer[1]-open_60_buffer[1]<=-0.0001 && close_60_buffer[1]-open_60_buffer[1]>=-0.0010 && 
              low_60_buffer[1]-close_60_buffer[1]<=-0.0024) ||
             (close_60_buffer[1]-open_60_buffer[1]>=0.0001  && low_60_buffer[1]-open_60_buffer[1]<=-0.0024) &&
             (close_60_buffer[2]-open_60_buffer[2]<=-0.0001 && low_60_buffer[2]-close_60_buffer[2]<=-0.0024) ||
             (close_60_buffer[2]-open_60_buffer[2]>=0.0001  && low_60_buffer[2]-open_60_buffer[2]<=-0.0024) &&
              k1_60_buffer[1]<=20 && k2_60_buffer[1]<=20 && k3_60_buffer[1]<=20 &&
             (low_60_buffer[1]==M15lowest70bar || low_60_buffer[2]==M15lowest70bar)) ||
                                    // [1]留下影線 >=40點  [1]>0.0001開-低  k1,k2,k3>=1  ,k1,k2,k3<=20
            ((close_60_buffer[1]-open_60_buffer[1]>=0.0001  && low_60_buffer[1]-open_60_buffer[1]<=-0.0040) &&
              low_60_buffer[1]==M15lowest70bar &&
              k1_60_buffer[1]-k1_60_buffer[2]>=1 && k2_60_buffer[1]-k2_60_buffer[2]>=1 && k3_60_buffer[1]-k3_60_buffer[2]>=1 &&
              k1_60_buffer[1]<=20 && k2_60_buffer[1]<=20 && k3_60_buffer[1]<=20))
                         
                                            
                                      //return  else  以下 buy 12   buy13  相同 和 buy1  ~  buy 11  不同
                                      //return  else  以下 buy 12   buy13  相同 和 buy1  ~  buy 11  不同

               if  ((k2_60_buffer[1]-d2_60_buffer[1]<=-25  &&  k3_60_buffer[1]-d3_60_buffer[1]<=-25) ||
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-10  && k2_60_buffer[1]-d2_60_buffer[1]<=-10  &&  k3_60_buffer[1]-d3_60_buffer[1]<=-10) ||                                   //h4  k2,k3 在47上  開口向下  不做買單 
                    (k2_60_buffer[1]-d2_60_buffer[1]<=-19  &&  k3_60_buffer[1]-d3_60_buffer[1]<=-19 && 
                     ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0010  &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0008) ||
                        //h1 [1]<=-0.0120  h4   ma05,ma08,ma12<=-0.0025
                    (close_60_buffer[1]-open_60_buffer[1]<=-0.0120 && ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0025  &&  
                     ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0025  &&  ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0025) ||

                    
                   (k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[2]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]>=55 && k3_240_buffer[1]>=55 &&  k1_240_buffer[1]-k1_240_buffer[1]<=-10  &&
                   (k2_240_buffer[1]-k2_240_buffer[1]<=-10 || k3_240_buffer[1]-k3_240_buffer[1]<=-10)) ||
                         //(m15-57)h4  [1]跌過140點
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0140) ||
                     //(m15-59) h4  ma45,ma90,ma180其中任二[1]-[2]<=0    [1]<=-0.0100
                  ((ma45_240_buffer[1]-ma45_240_buffer[2]<=0 || ma90_240_buffer[1]-ma90_240_buffer[2]<=0) &&
                   (ma90_240_buffer[1]-ma90_240_buffer[2]<=0 || ma180_240_buffer[1]-ma180_240_buffer[2]<=0) &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0100) ||  
                         //(m15-59) h4 k1||k2||k3 >=65 don't buy
                   (k1_240_buffer[1]>=65 || k2_240_buffer[1]>=65 || k3_240_buffer[1]>=65) ||                   
                      //(m15-57)h4  ma45[1][2]<=-0.0007  ma90[1][2]<=-0.0004  ma45||ma90([1]-[2])-[2]-[3])<=-0.0001 ma45,ma90間距<=0.0400 >=-0.0035
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0007  &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0004 &&
                  ((ma45_240_buffer[1]-ma45_240_buffer[2])-(ma45_240_buffer[2]-ma45_240_buffer[3])<=-0.0001  ||
                   (ma90_240_buffer[1]-ma90_240_buffer[2])-(ma90_240_buffer[2]-ma90_240_buffer[3])<=-0.0001) &&
                    //(m15-58)   ma45在ma90 下但間距<=0.0350 >=-0.0010
                    ma45_240_buffer[1]-ma90_240_buffer[1]<=0.0350 && ma45_240_buffer[1]-ma90_240_buffer[1]>=-0.0010) ||
                          //(m15-58)h4  kd1+kd2+kd3<=-49 kd1,kd2,kd3<=-7
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-49 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-7 && k2_240_buffer[1]-d2_240_buffer[1]<=-7 && k3_240_buffer[1]-d3_240_buffer[1]<=-7) ||
                     //(m15-59)(m15-58)h4  kd1+kd2+kd3<=-40 kd1,kd2,kd3<=-12
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-40 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-12 && k2_240_buffer[1]-d2_240_buffer[1]<=-12 && k3_240_buffer[1]-d3_240_buffer[1]<=-12) ||
                  
                           //(m15-61)(m15-57)h4  [1]跌過100點  (ma45<=-0.0015  || [0]<=-0.0150)
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0100 && (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0015 ||
                    close_240_buffer[0]-open_240_buffer[0]<=-0.0150)) ||
                            //(m15-57)h4 k1<=-19  k2,k3[1]-[2]<=-2
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-19  &&  k2_240_buffer[1]-k2_240_buffer[2]<=-2 &&
                    k3_240_buffer[1]-k3_240_buffer[2]<=-2) ||
                       // h4  ma05[1]-ma12[1]<=-0.0160  ma05[2]-ma12[2]<=-0.0120   ma05[1]-ma05[2]<=-0.0030
                   (ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.0160  &&  ma05_240_buffer[2]-ma12_240_buffer[2]<=-0.0120  &&
                    ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0030) ||
                          //(m15-57)h4   ma05[1]-[2]<=-0.0050  ma45[1]-[2]<=-0.0007
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0050  &&  ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0007) ||
                  
                         //h4   k2,k3<=-15 k1<=-5   macd<=-0.00300
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-5 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300) ||    
                            //h4   k1,k2,k3<=-7    macd[1]<=-0.00350  macd[2]<=-0.00250  (macd[1]-[2]<=-0.00070 || macdmain[1]-[2]<=-0.00150  macdsignal[1]-[2]<=-0.0070 
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-7  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-7 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-7 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00350 &&
                    macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]<=-0.00250 && 
                  (((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1])-(macdmainline_240_buffer[2]-macdsignalline_240_buffer[2])<=-0.00070) ||    
                    (macdmainline_240_buffer[1]-macdmainline_240_buffer[2]<=-0.00150 && macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2])<=-0.00070)) ||
                          //ma45  ma90 <=-0.0014
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0014  &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0014) ||
                          //(m15-57) h4 ma45  ma90 <=-0.0010   ma45+ma90<=-0.0029
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0010  &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0010 &&
                   (ma45_240_buffer[1]-ma45_240_buffer[2])+ (ma90_240_buffer[1]-ma90_240_buffer[2])<=-0.0029) ||

                           //H4 k1,k2,k3全向下,或 h4,m30,m60 kd2,kd3向下開口大 或 k1,k,2,k3在極低
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-2 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-25  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-25 && 
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                    k2_240_buffer[0]>=40 && k3_240_buffer[1]>=40 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-10  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-10  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-10  &&  k2_240_buffer[0]>=70 && k3_240_buffer[1]>=70 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  && 
                    k1_240_buffer[1]-k1_240_buffer[2]<=0 &&  k2_240_buffer[1]-k2_240_buffer[2]<=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]<=0 &&  close_240_buffer[1]-open_240_buffer[1]<=-0.0001 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                                       //34分 結單後34分之內不動作
                   (OrderType()==OP_BUY && TimeCurrent()-OrderCloseTime()<=2000))
                    return;
                    else       
                    OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-28*Point,Ask+2000*Point,"My order #B13",8813,0,DeepPink );
 
     //+++++++++++++++++++++++++++++++++++++++++++   BUY   14   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                //(m15-62) h1    macd<=-0.00870   差值在-50,+50間         發生的機率不多所以不使用狀況排除法
        if    (macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=0.00040 && macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=-0.00040 &&
               macdmainline_60_buffer[1]<=-0.00870 &&
                    //k1,k2,k3  [1]-[2]>=0   k1,k2,k3<=30 || ma180 ,ma360斜上
               k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 && 
               k3_60_buffer[1]-k3_60_buffer[2]>=0 && 
             ((k1_60_buffer[1]<=30 && k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30) || (ma180_60_buffer[1]-ma180_60_buffer[2]>=0.0001 &&
               ma360_60_buffer[1]-ma360_60_buffer[2]>=0.0001)))
               if   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0011 && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0008 &&
                     ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.0004 && ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.0001)
                     return;
                     else 
                     OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-28*Point,Ask+2000*Point,"My order #B14",8814,0,LimeGreen );
  
    //+++++++++++++++++++++++++++++++++++++++++++   BUY   15   ++++++++++++++++++++++++++++++++++++++++++++++++++          
  
  
                  //(m15-63)  H4     [2][3]收黑<20點     [1]收紅>=10點  留下影線>30點   
      if     (close_240_buffer[1]-open_240_buffer[1]>=0.0010  && low_240_buffer[1]-open_240_buffer[1]<=-0.0030 &&
              close_240_buffer[2]-open_240_buffer[2]<=-0.0009  && close_240_buffer[3]-open_240_buffer[3]<=-0.0009  &&   
               // ma45 ma90 || ma90  ma180  斜上且大
             ((ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0008 &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002) ||
              (ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0006 &&  ma180_240_buffer[1]-ma180_240_buffer[2]>=0.0002)) &&
                // [1]收盤在ma05之上  不超過15點
              close_240_buffer[1]-ma05_240_buffer[1]>=0.0001  && close_240_buffer[1]-ma05_240_buffer[1]<=0.0015) 
              OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-28*Point,Ask+2000*Point,"My order #B15",8815,0,FireBrick );
     
  
  
   }
//***************************************************************************************************************************             
//+++++++++++++++++++++++++++++++++++++++++++   SELL   1   ++++++++++++++++++++++++++++++++++++++++++++++++++          
           
    if (OrdersTotal()<=1)   
     {                                               //m15 的ma45  ma90 為 ㄏ 上升末端型態  ma45[1]-[6]為確認為上升 
        if (((ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma45_15_buffer[1]-ma45_15_buffer[6]>=0) ||
                                                      //雖為上升但h4 [1]尚為負小於20點
             (ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0.0001 && 
                  //h4 收黑 且下影線>=-0.0006
              close_240_buffer[1]-open_240_buffer[1]<=-0.0020 && low_240_buffer[1]-close_240_buffer[1]>=-0.0055 )) && 
              ma90_15_buffer[1]-ma90_15_buffer[2]>=0.0001 && 
                                                     //上升末端下跌要一次跌破前3bar
              close_15_buffer[1]-close_15_buffer[2]<=-0.0001  && // close_15_buffer[1]-close_15_buffer[3]<=-0.0001 &&
        //      close_15_buffer[1]-close_15_buffer[4]<=-0.0001  &&
                                                 //用m15 m30 macd 控管買賣點 
               macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00010 &&
               macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00050 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&
               macdmainline_30_buffer[1]>=-0.00110   &&
                                                          //m60 的45,90,180  皆是斜下
              (macdmainline_60_buffer[1]>=-0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]<=-0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]<=-0.0003 && 
               ma180_60_buffer[1]-ma180_60_buffer[2]<=0))   &&    
                                                              //k1 (k2||k3)已下跌
              k1_15_buffer[1]-k1_15_buffer[2]<=-1  &&  k1_15_buffer[1]-d1_15_buffer[1]<=-1 &&
              k2_15_buffer[1]-k2_15_buffer[2]<=0  ||  k3_15_buffer[1]-k3_15_buffer[2]<=0)
              if ((macdmainline_15_buffer[1]>=-0.00099 && macdmainline_15_buffer[1]<=0.00099 &&
                   macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                  (k2_30_buffer[1]-d2_30_buffer[1]>=19  &&  k3_30_buffer[1]-d3_30_buffer[1]>=19) ||
                  (k2_60_buffer[1]-d2_60_buffer[1]>=19  &&  k3_60_buffer[1]-d3_60_buffer[1]>=19) ||
                                      //h4  在53下  開口向上  不做賣單
                   (k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3全向上,或h4,m30,m60  kd2,kd3向上開口大 或 k1,k,2,k3在極高
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=25  &&  k3_240_buffer[1]-d3_240_buffer[1]>=25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                    k2_240_buffer[0]<=60 && k3_240_buffer[1]<=60) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]>=10  && k2_240_buffer[1]-d2_240_buffer[1]>=10  &&
                    k3_240_buffer[1]-d3_240_buffer[1]>=10  && k2_240_buffer[0]<=30 && k3_240_buffer[1]<=30) ||
                            //(m15-57) h4  kd1,kd2,kd3>=0   k1,k2,k3<=20 macd<=-0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]>=0  &&  k2_240_buffer[1]-d2_240_buffer[1]>=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=0  &&  k1_240_buffer[0]<=20 && k2_240_buffer[0]<=20 && k3_240_buffer[1]<=20 &&
                    macdmainline_240_buffer[1]<=-0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3>=35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=35) ||
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd差值<=350
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0100  &&  close_240_buffer[2]-open_240_buffer[2]>=0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0020  &&
                   (k1_240_buffer[1]<=50 && k2_240_buffer[1]<=50 && k3_240_buffer[1]<=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3>=4   ma05  [1]-[2]>=0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]>=4  &&  k2_240_buffer[1]-d2_240_buffer[1]>=4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 && k1_240_buffer[1]-k1_240_buffer[2]>=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30  && 
                    k1_240_buffer[1]-k1_240_buffer[2]>=0 &&  k2_240_buffer[1]-k2_240_buffer[2]>=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]>=0 &&  close_240_buffer[1]-open_240_buffer[1]>=0.0001) || 
                   (k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90) ||
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86)) 
                    return;
                    else                        
                   OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+28*Point,Bid-2000*Point,"My order #S1",4401,0,Green );

//+++++++++++++++++++++++++++++++++++++++++++   SELL   2   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                
                         // h1 k123在上方 皆為下跌
          if  (k1_60_buffer[1]>=85 && k2_60_buffer[1]>=85 && k3_60_buffer[1]>=85  && 
               k1_60_buffer[1]-k1_60_buffer[2]<=-8 &&  k2_60_buffer[1]-k2_60_buffer[2]<=0 &&  k3_60_buffer[1]-k3_60_buffer[2]<=0 &&
                                  //[1]收盤小於20點 小於[2][3][4] ma05    10點上
               close_60_buffer[1]-open_60_buffer[1]<=-0.0020 && close_60_buffer[1]-close_60_buffer[2]<=-0.0010 &&
               close_60_buffer[1]-close_60_buffer[3]<=-0.0010 && close_60_buffer[1]-close_60_buffer[4]<=-0.0010 &&
               close_60_buffer[1]-ma05_60_buffer[1]<=-0.0010 && 
         
               macdmainline_30_buffer[1]>=-0.00110   &&
                                                          //m60 的45,90,180  皆是斜下
              (macdmainline_60_buffer[1]>=-0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]<=-0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]<=-0.0003 && 
               ma180_60_buffer[1]-ma180_60_buffer[2]<=0)))    
                                          //h4  在53下  開口向上  不做賣單
               if ((k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3全向上,或h4,m30,m60  kd2,kd3向上開口大 或 k1,k,2,k3在極高
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=25  &&  k3_240_buffer[1]-d3_240_buffer[1]>=25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                    k2_240_buffer[0]<=60 && k3_240_buffer[1]<=60) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]>=10  && k2_240_buffer[1]-d2_240_buffer[1]>=10  &&
                    k3_240_buffer[1]-d3_240_buffer[1]>=10  && k2_240_buffer[0]<=30 && k3_240_buffer[1]<=30) ||
                            //(m15-57) h4  kd1,kd2,kd3>=0   k1,k2,k3<=20 macd<=-0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]>=0  &&  k2_240_buffer[1]-d2_240_buffer[1]>=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=0  &&  k1_240_buffer[0]<=20 && k2_240_buffer[0]<=20 && k3_240_buffer[1]<=20 &&
                    macdmainline_240_buffer[1]<=-0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3>=35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=35) ||
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd差值<=350
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0100  &&  close_240_buffer[2]-open_240_buffer[2]>=0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0020  &&
                   (k1_240_buffer[1]<=50 && k2_240_buffer[1]<=50 && k3_240_buffer[1]<=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3>=4   ma05  [1]-[2]>=0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]>=4  &&  k2_240_buffer[1]-d2_240_buffer[1]>=4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 && k1_240_buffer[1]-k1_240_buffer[2]>=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30  && 
                    k1_240_buffer[1]-k1_240_buffer[2]>=0 &&  k2_240_buffer[1]-k2_240_buffer[2]>=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]>=0 &&  close_240_buffer[1]-open_240_buffer[1]>=0.0001) || 
                   (k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90) ||
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86)) 
                    return;
                    else                        
                      OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+28*Point,Bid-2000*Point,"My order #S2",4402,0,White );
      
//+++++++++++++++++++++++++++++++++++++++++++   SELL   3   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                  
                                       //k1 一次下跌深 kd1大幅交叉下 
        if     ((k1_15_buffer[1]-k1_15_buffer[2]<=-10  &&  k1_15_buffer[1]-d1_15_buffer[1]<=-5 && close_15_buffer[1]-open_15_buffer[1]<=-0.0002 &&
                                         //設限以防過低再賣出  
                k1_15_buffer[1]>=40 && k2_15_buffer[2]>=40  &&  k3_15_buffer[1]>=40 && 
               (ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=0) || 
               (ma90_15_buffer[1]-ma90_15_buffer[2]<=0 && ma180_15_buffer[1]-ma180_15_buffer[2]<=0) && 
                                                         //賣單時 m30 m60   macd 不可以在過低位置 
               macdmainline_30_buffer[1]>=-0.00110   && 
                                                          //m60 的45,90,180  皆是斜下
              (macdmainline_60_buffer[1]>=-0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]<=-0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]<=-0.0003 && 
               ma180_60_buffer[1]-ma180_60_buffer[2]<=0))   &&    
                                                               //用m15 m30 macd 控管買賣點 
               macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00010 &&
               macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00050 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020))
               if ((macdmainline_15_buffer[1]>=-0.00099 && macdmainline_15_buffer[1]<=0.00099 &&
                    macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                      //(m15-62) h4 k1,k2,k3 <=35 don't sell
                   (k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||                   
                    //(m15-64) h4 [1]為正並大於30點  kd2,kd3>=10
                  (close_240_buffer[1]-open_240_buffer[1]>=0.0030 &&                          
                   k2_240_buffer[1]-d2_240_buffer[1]>=10 && k3_240_buffer[1]-d3_240_buffer[1]>=10) ||                        
                                             
                                     
                                       //h4  在53下  開口向上  不做賣單
                   (k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3全向上,或h4,m30,m60  kd2,kd3向上開口大 或 k1,k,2,k3在極高
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=25  &&  k3_240_buffer[1]-d3_240_buffer[1]>=25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                    k2_240_buffer[0]<=60 && k3_240_buffer[1]<=60) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]>=10  && k2_240_buffer[1]-d2_240_buffer[1]>=10  &&
                    k3_240_buffer[1]-d3_240_buffer[1]>=10  && k2_240_buffer[0]<=30 && k3_240_buffer[1]<=30) ||
                            //(m15-57) h4  kd1,kd2,kd3>=0   k1,k2,k3<=20 macd<=-0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]>=0  &&  k2_240_buffer[1]-d2_240_buffer[1]>=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=0  &&  k1_240_buffer[0]<=20 && k2_240_buffer[0]<=20 && k3_240_buffer[1]<=20 &&
                    macdmainline_240_buffer[1]<=-0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3>=35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=35) ||
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd差值<=350
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0100  &&  close_240_buffer[2]-open_240_buffer[2]>=0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0020  &&
                   (k1_240_buffer[1]<=50 && k2_240_buffer[1]<=50 && k3_240_buffer[1]<=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3>=4   ma05  [1]-[2]>=0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]>=4  &&  k2_240_buffer[1]-d2_240_buffer[1]>=4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 && k1_240_buffer[1]-k1_240_buffer[2]>=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30  && 
                    k1_240_buffer[1]-k1_240_buffer[2]>=0 &&  k2_240_buffer[1]-k2_240_buffer[2]>=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]>=0 &&  close_240_buffer[1]-open_240_buffer[1]>=0.0001) || 
                   (k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90) ||
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86)) 
                    return;
                    else                               
                   OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+28*Point,Bid-2000*Point,"My order #S3",4403,0,Lime );
 
//+++++++++++++++++++++++++++++++++++++++++++   SELL   4   ++++++++++++++++++++++++++++++++++++++++++++++++++          
             
          
              //m15 的 [-4][+3][+2][-1] && [-1]or[+2]為最高 bar實體為0.0006  較易發生條件較嚴
        if  (((close_15_buffer[1]-open_15_buffer[1]<=-0.0006 && close_15_buffer[4]-open_15_buffer[4]<=-0.0006  && 
               close_15_buffer[2]-open_15_buffer[2]>=0.0006 && close_15_buffer[3]-open_15_buffer[3]>=0.0006 &&
               k1_15_buffer[1]-k1_15_buffer[2]<=0  &&  close_15_buffer[1]-open_15_buffer[2]<=-0.0001  &&
              (high_15_buffer[1]==M15highest40bar ||  high_15_buffer[2]==M15highest40bar) &&
              (ma05_15_buffer[1]-ma05_15_buffer[2]<=0 || 
              (close_15_buffer[1]-open_15_buffer[1]<=-0.0001 && high_15_buffer[1]-close_15_buffer[1]>=0.0029) ||
              (k2_15_buffer[1]-k2_15_buffer[2]<=-2 && k3_15_buffer[1]-k3_15_buffer[2]<=-2) ||
              (ma05_15_buffer[1]-ma05_15_buffer[2]<=0.0006 &&
              (k2_15_buffer[1]-k2_15_buffer[2]<=0 || k3_15_buffer[1]-k3_15_buffer[2]<=0)))) ||
               //m15 的 [-5][+4][+3][+2][-1]  && [-1]or[+2]為最高 bar實體為0.0006  
              (close_15_buffer[1]-open_15_buffer[1]<=-0.0006 && close_15_buffer[5]-open_15_buffer[5]<=-0.0006  && 
               close_15_buffer[2]-open_15_buffer[2]>=0.0006 && close_15_buffer[3]-open_15_buffer[3]>=0.0006 && 
               close_15_buffer[4]-open_15_buffer[4]>=0.0006 &&
               k1_15_buffer[1]-k1_15_buffer[2]<=0  &&  close_15_buffer[1]-open_15_buffer[2]<=-0.0001  &&
              (high_15_buffer[1]==M15highest40bar ||  high_15_buffer[2]==M15highest40bar) &&
              (ma05_15_buffer[1]-ma05_15_buffer[2]<=0.0001 || 
              (close_15_buffer[1]-open_15_buffer[1]<=-0.0001 && high_15_buffer[1]-close_15_buffer[1]>=0.0029) ||
              (k2_15_buffer[1]-k2_15_buffer[2]<=-2 && k3_15_buffer[1]-k3_15_buffer[2]<=-2) ||
              (ma05_15_buffer[1]-ma05_15_buffer[2]<=0.0006 &&
              (k2_15_buffer[1]-k2_15_buffer[2]<=0 || k3_15_buffer[1]-k3_15_buffer[2]<=0)))) ||
           
                //m30 的 [-4][+3][+2][-1] && [-1]or[+2]為最高 bar實體為0.0008  較易發生條件較嚴
              (close_30_buffer[1]-open_30_buffer[1]<=-0.0008 && close_30_buffer[4]-open_30_buffer[4]<=-0.0008  && 
               close_30_buffer[2]-open_30_buffer[2]>=0.0008 && close_30_buffer[3]-open_30_buffer[3]>=0.0008 &&
               k1_30_buffer[1]-k1_30_buffer[2]<=0  &&  close_30_buffer[1]-open_30_buffer[2]<=-0.0001  &&
              (high_30_buffer[1]==M30highest40bar ||  high_30_buffer[2]==M30highest40bar) &&
              (ma05_30_buffer[1]-ma05_30_buffer[2]<=0 || 
              (close_30_buffer[1]-open_30_buffer[1]<=-0.0001 && high_30_buffer[1]-close_30_buffer[1]>=0.0029) ||
              (k2_30_buffer[1]-k2_30_buffer[2]<=-2 && k3_30_buffer[1]-k3_30_buffer[2]<=-2) ||
              (ma05_30_buffer[1]-ma05_30_buffer[2]<=0.0006 &&
              (k2_30_buffer[1]-k2_30_buffer[2]<=0 || k3_30_buffer[1]-k3_30_buffer[2]<=0)))) ||
                 //m30 的 [-5][+4][+3][+2][-1]  && [-1]or[+2]為最高 bar實體為0.0008  
              (close_30_buffer[1]-open_30_buffer[1]<=-0.0008 && close_30_buffer[5]-open_30_buffer[5]<=-0.0008  && 
               close_30_buffer[2]-open_30_buffer[2]>=0.0008 && close_30_buffer[3]-open_30_buffer[3]>=0.0008 &&
               close_30_buffer[4]-open_30_buffer[4]>=0.0008 &&
               k1_30_buffer[1]-k1_30_buffer[2]<=0  &&  close_30_buffer[1]-open_30_buffer[2]<=-0.0001  &&
              (high_30_buffer[1]==M30highest40bar ||  high_30_buffer[2]==M30highest40bar) &&
              (ma05_30_buffer[1]-ma05_30_buffer[2]<=0.0001 ||  
              (close_30_buffer[1]-open_30_buffer[1]<=-0.0001 && high_30_buffer[1]-close_30_buffer[1]>=0.0029) ||
              (k2_30_buffer[1]-k2_30_buffer[2]<=-2 && k3_30_buffer[1]-k3_30_buffer[2]<=-2) ||
              (ma05_30_buffer[1]-ma05_30_buffer[2]<=0.0006 &&
              (k2_30_buffer[1]-k2_30_buffer[2]<=0 || k3_30_buffer[1]-k3_30_buffer[2]<=0)))) ||
                   
                  //m60 的 [-4][+3][+2][-1] && [-1]or[+2]為最高 bar實體為0.0010  較易發生條件較嚴
              (close_60_buffer[1]-open_60_buffer[2]<=0.0001  &&
               close_60_buffer[1]-open_60_buffer[1]<=-0.0010 && close_60_buffer[4]-open_60_buffer[4]<=-0.0010  && 
               close_60_buffer[2]-open_60_buffer[2]>=0.0010 && close_60_buffer[3]-open_60_buffer[3]>=0.0010 &&
               k1_60_buffer[1]-k1_60_buffer[2]<=0  &&  
              (high_60_buffer[1]==H1highest40bar ||  high_60_buffer[2]==H1highest40bar) &&
              (ma05_60_buffer[1]-ma05_60_buffer[2]<=0 || 
              (close_60_buffer[1]-open_60_buffer[1]<=-0.0001 && high_60_buffer[1]-close_60_buffer[1]>=0.0029) ||
              (k2_60_buffer[1]-k2_60_buffer[2]<=-2 && k3_60_buffer[1]-k3_60_buffer[2]<=-2) ||
              (ma05_60_buffer[1]-ma05_60_buffer[2]<=0.0006 &&
              (k2_60_buffer[1]-k2_60_buffer[2]<=0 || k3_60_buffer[1]-k3_60_buffer[2]<=0)))) ||
                  //m60 的 [-5][+4][+3][+2][-1]  && [-1]or[+2]為最高 bar實體為0.0010  
              (close_60_buffer[1]-open_60_buffer[2]<=0.0001  &&
               close_60_buffer[1]-open_60_buffer[1]<=-0.0010 && close_60_buffer[5]-open_60_buffer[5]<=-0.0010  && 
               close_60_buffer[2]-open_60_buffer[2]>=0.0010 && close_60_buffer[3]-open_60_buffer[3]>=0.0010 &&
               close_60_buffer[4]-open_60_buffer[4]>=0.0010 &&
               k1_60_buffer[1]-k1_60_buffer[2]<=0  &&  
              (high_60_buffer[1]==H1highest40bar ||  high_60_buffer[2]==H1highest40bar) &&
              (ma05_60_buffer[1]-ma05_60_buffer[2]<=0.0001 || 
              (close_60_buffer[1]-open_60_buffer[1]<=-0.0001 && high_60_buffer[1]-close_60_buffer[1]>=0.0029) ||
              (k2_60_buffer[1]-k2_60_buffer[2]<=-2 && k3_60_buffer[1]-k3_60_buffer[2]<=-2) ||
              (ma05_60_buffer[1]-ma05_60_buffer[2]<=0.0006 &&
              (k2_60_buffer[1]-k2_60_buffer[2]<=0 || k3_60_buffer[1]-k3_60_buffer[2]<=0))))) &&
              macdmainline_30_buffer[1]>=-0.00110   &&
                                                          //m60 的45,90,180  皆是斜下
              (macdmainline_60_buffer[1]>=-0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]<=-0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]<=-0.0003 && 
               ma180_60_buffer[1]-ma180_60_buffer[2]<=0)))    
                                      //(m15-61) h4 k1,k2,k3 <=35 don't sell
               if  ((k1_240_buffer[1]<=35 && k2_240_buffer[1]<=35 && k3_240_buffer[1]<=35) ||                   
                                
                                   
                                       //h4  在53下  開口向上  不做賣單
                   (k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3全向上,或h4,m30,m60  kd2,kd3向上開口大 或 k1,k,2,k3在極高
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=25  &&  k3_240_buffer[1]-d3_240_buffer[1]>=25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                    k2_240_buffer[0]<=60 && k3_240_buffer[1]<=60) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]>=10  && k2_240_buffer[1]-d2_240_buffer[1]>=10  &&
                    k3_240_buffer[1]-d3_240_buffer[1]>=10  && k2_240_buffer[0]<=30 && k3_240_buffer[1]<=30) ||
                            //(m15-57) h4  kd1,kd2,kd3>=0   k1,k2,k3<=20 macd<=-0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]>=0  &&  k2_240_buffer[1]-d2_240_buffer[1]>=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=0  &&  k1_240_buffer[0]<=20 && k2_240_buffer[0]<=20 && k3_240_buffer[1]<=20 &&
                    macdmainline_240_buffer[1]<=-0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3>=35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=35) ||
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd差值<=350
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0100  &&  close_240_buffer[2]-open_240_buffer[2]>=0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0020  &&
                   (k1_240_buffer[1]<=50 && k2_240_buffer[1]<=50 && k3_240_buffer[1]<=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3>=4   ma05  [1]-[2]>=0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]>=4  &&  k2_240_buffer[1]-d2_240_buffer[1]>=4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 && k1_240_buffer[1]-k1_240_buffer[2]>=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30  && 
                    k1_240_buffer[1]-k1_240_buffer[2]>=0 &&  k2_240_buffer[1]-k2_240_buffer[2]>=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]>=0 &&  close_240_buffer[1]-open_240_buffer[1]>=0.0001) || 
                   (k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90) ||
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86)) 
                    return;
                    else                              
                    OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+27*Point,Bid-2000*Point,"My order #S4",4404,0,Gray );
               
//+++++++++++++++++++++++++++++++++++++++++++   SELL   5   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                     
                                     //m15 上影線超過25點   [1]為負時開-高  [1]為正時收-開
    
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
               (macdmainline_15_buffer[1]>=-0.00099 && macdmainline_15_buffer[1]<=0.00099 &&
                macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                                       //h4  在53下  開口向上  不做賣單
                   (k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3全向上,或h4,m30,m60  kd2,kd3向上開口大 或 k1,k,2,k3在極高
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=25  &&  k3_240_buffer[1]-d3_240_buffer[1]>=25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                    k2_240_buffer[0]<=60 && k3_240_buffer[1]<=60) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]>=10  && k2_240_buffer[1]-d2_240_buffer[1]>=10  &&
                    k3_240_buffer[1]-d3_240_buffer[1]>=10  && k2_240_buffer[0]<=30 && k3_240_buffer[1]<=30) ||
                            //(m15-57) h4  kd1,kd2,kd3>=0   k1,k2,k3<=20 macd<=-0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]>=0  &&  k2_240_buffer[1]-d2_240_buffer[1]>=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=0  &&  k1_240_buffer[0]<=20 && k2_240_buffer[0]<=20 && k3_240_buffer[1]<=20 &&
                    macdmainline_240_buffer[1]<=-0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3>=35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=35) ||
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd差值<=350
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0100  &&  close_240_buffer[2]-open_240_buffer[2]>=0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0020  &&
                   (k1_240_buffer[1]<=50 && k2_240_buffer[1]<=50 && k3_240_buffer[1]<=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3>=4   ma05  [1]-[2]>=0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]>=4  &&  k2_240_buffer[1]-d2_240_buffer[1]>=4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 && k1_240_buffer[1]-k1_240_buffer[2]>=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30  && 
                    k1_240_buffer[1]-k1_240_buffer[2]>=0 &&  k2_240_buffer[1]-k2_240_buffer[2]>=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]>=0 &&  close_240_buffer[1]-open_240_buffer[1]>=0.0001) || 
                   (k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90) ||
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86)) 
                    return;
                    else                        
                    OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+28*Point,Bid-2000*Point,"My order #S5",4405,0,Aqua );

//+++++++++++++++++++++++++++++++++++++++++++   SELL   6   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                                         //h1 [1] 上影線超過24點   [1]為負時開-高  [1]為正時收-開
    
      if (((close_60_buffer[1]-open_60_buffer[1]<=-0.0001 && close_60_buffer[1]-open_60_buffer[1]<=0.0006  &&
            high_60_buffer[1]-open_60_buffer[1]>=0.0024) ||
           (close_60_buffer[1]-open_60_buffer[1]>=0.0001   && close_60_buffer[1]-open_60_buffer[1]<=0.0006  && 
            high_60_buffer[1]-close_60_buffer[1]>=0.0024) &&
            high_60_buffer[1]==H1highest40bar  && 
            k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 && k3_60_buffer[1]-k3_60_buffer[2]<=0) ||
                                          // [1]<=0 [2] 留上影線
          ((close_60_buffer[1]-open_60_buffer[1]<=-0.0001 && close_60_buffer[1]-open_60_buffer[1]<=0.0006  &&
            high_60_buffer[1]-open_60_buffer[1]>=0.0024) ||
           (close_60_buffer[1]-open_60_buffer[1]>=0.0001   && close_60_buffer[1]-open_60_buffer[1]<=0.0006  && 
            high_60_buffer[1]-close_60_buffer[1]>=0.0024) &&
            high_60_buffer[1]==H1highest40bar  && 
            k1_60_buffer[1]-k1_60_buffer[2]<=5 && k1_60_buffer[1]-d1_60_buffer[1]<=5 && 
            close_60_buffer[1]-open_60_buffer[1]<=0)   &&
          
            macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=0.00200 && 
           macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=-0.00010) 
                                                 //避開超過100點 
           if ((close_60_buffer[2]-open_60_buffer[2]>=0.0100 || close_60_buffer[1]-open_60_buffer[1]>=0.0100 ||
               macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=0.00200 || 
               macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=-0.00050) ||
                                                //避開下跌後之反彈
              (open_60_buffer[3]-open_60_buffer[2]>=-0.0003 && open_60_buffer[4]-open_60_buffer[2]>=-0.0003) ||    
              (open_60_buffer[2]-open_60_buffer[1]>=-0.0003 && open_60_buffer[3]-open_60_buffer[1]>=-0.0003) ||     
               (macdmainline_60_buffer[1]>=-0.00099 && macdmainline_60_buffer[1]<=0.00099 &&
                macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                                       //h4  在53下  開口向上  不做賣單
                   (k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3全向上,或h4,m30,m60  kd2,kd3向上開口大 或 k1,k,2,k3在極高
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=25  &&  k3_240_buffer[1]-d3_240_buffer[1]>=25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                    k2_240_buffer[0]<=60 && k3_240_buffer[1]<=60) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]>=10  && k2_240_buffer[1]-d2_240_buffer[1]>=10  &&
                    k3_240_buffer[1]-d3_240_buffer[1]>=10  && k2_240_buffer[0]<=30 && k3_240_buffer[1]<=30) ||
                            //(m15-57) h4  kd1,kd2,kd3>=0   k1,k2,k3<=20 macd<=-0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]>=0  &&  k2_240_buffer[1]-d2_240_buffer[1]>=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=0  &&  k1_240_buffer[0]<=20 && k2_240_buffer[0]<=20 && k3_240_buffer[1]<=20 &&
                    macdmainline_240_buffer[1]<=-0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3>=35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=35) ||
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd差值<=350
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0100  &&  close_240_buffer[2]-open_240_buffer[2]>=0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0020  &&
                   (k1_240_buffer[1]<=50 && k2_240_buffer[1]<=50 && k3_240_buffer[1]<=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3>=4   ma05  [1]-[2]>=0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]>=4  &&  k2_240_buffer[1]-d2_240_buffer[1]>=4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 && k1_240_buffer[1]-k1_240_buffer[2]>=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30  && 
                    k1_240_buffer[1]-k1_240_buffer[2]>=0 &&  k2_240_buffer[1]-k2_240_buffer[2]>=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]>=0 &&  close_240_buffer[1]-open_240_buffer[1]>=0.0001) || 
                   (k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90) ||
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86)) 
                    return;
                    else                        
                    OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+28*Point,Bid-2000*Point,"My order #S6",4406,0,Teal );
  
//+++++++++++++++++++++++++++++++++++++++++++   SELL   7   ++++++++++++++++++++++++++++++++++++++++++++++++++          
    
       
             //(m15-61)       //H4 [2] 留上影線>80點  [1]<[2]
       if  ((close_240_buffer[2]-open_240_buffer[2]<=-0.0001 && high_240_buffer[2]-open_240_buffer[2]>=0.0080) ||
            (close_240_buffer[2]-open_240_buffer[2]>=0.0001   && high_240_buffer[2]-close_240_buffer[2]>=0.0080) &&
             close_240_buffer[1]-open_240_buffer[1]<=-0.0001  && 
                                                          //H4 k1,k2,k3 >=70   || [2]>=0.0250
            ((k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70  &&  k3_240_buffer[1]>=70) || (close_240_buffer[2]-open_240_buffer[2]>=0.0250))) 
              OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+28*Point,Bid-2000*Point,"My order #S7",4407,0,Olive );
       
//+++++++++++++++++++++++++++++++++++++++++++   SELL   8   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                       
         
                     //(m15-62)   h4 的 ma180斜下 或ma180持平 ma360 斜下   
        if   ((ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.0001 ||  (ma180_240_buffer[1]-ma180_240_buffer[2]<=0 &&
               ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.0001)) &&
                  // [1]收在ma180下的20點內  
              (close_240_buffer[1]-ma180_240_buffer[1]<=-0.0001  && close_240_buffer[1]-ma180_240_buffer[1]>=-0.0020) &&
                 //h4 [1]上影線超過30點
             ((close_240_buffer[1]-open_240_buffer[1]<=-0.0001 && high_240_buffer[1]-open_240_buffer[1]>=0.0030) ||
              (close_240_buffer[1]-open_240_buffer[1]>=0.0001   && high_240_buffer[1]-close_240_buffer[1]>=0.0030)) &&
             //kd1<=-3      
               k1_240_buffer[1]-d1_240_buffer[1]<=-3 &&
                  // macd差值<=0.00150  >=-0.00100 
              (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00150 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100) &&
                   // [2]||[3]||[4]收在ma180下的20點內  
             ((close_240_buffer[2]-ma180_240_buffer[2]<=-0.0001  && close_240_buffer[2]-ma180_240_buffer[2]>=-0.0020) ||
              (close_240_buffer[3]-ma180_240_buffer[3]<=-0.0001  && close_240_buffer[3]-ma180_240_buffer[3]>=-0.0020) ||
              (close_240_buffer[4]-ma180_240_buffer[4]<=-0.0001  && close_240_buffer[4]-ma180_240_buffer[4]>=-0.0020)))
              OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+28*Point,Bid-2000*Point,"My order #S8",4408,0,Olive );
     
 //+++++++++++++++++++++++++++++++++++++++++++   SELL   9   ++++++++++++++++++++++++++++++++++++++++++++++++++          
 
                                                             //H4 的 [-4][+3][+2][-1] && [-1]or[+2]為最高 bar實體為0.0030 
        if   ((close_240_buffer[1]-open_240_buffer[1]<=-0.0030 && close_240_buffer[4]-open_240_buffer[4]<=-0.0010  && 
               close_240_buffer[2]-open_240_buffer[2]>=0.0010 && close_240_buffer[3]-open_240_buffer[3]>=0.0010 &&
                     //(m15-61)  [1]下影線小於15點
               low_240_buffer[1]-close_240_buffer[1]<=-0.0015  &&              
                    //(m15-59) kd1,(kd2||kd3)<=3 開口必須縮小
             ((k1_240_buffer[1]-d1_240_buffer[1]<=3  && (k2_240_buffer[1]-d2_240_buffer[1]<=3 || k3_240_buffer[1]-d3_240_buffer[1]<=3)) ||
                  //(m15-61)  macd  差值<=0.00150  >=-0.00100
              (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00150 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100))  &&
               k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  &&
                   //(m15=58)  h4 收盤必須離ma05在10點內     k1,k2,k3必須在55上以免已跌過頭
               ma05_240_buffer[1]- close_240_buffer[1]>=-0.0015 &&  ma05_240_buffer[1]-ma05_240_buffer[2]<=0 &&
               k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70)  ||   // && 
      //        (high_240_buffer[1]==H4highest40bar ||  high_240_buffer[2]==H4highest40bar)) ||
              
               //H4 的 [-5][+4][+3][+2][-1]  && [-1]or[+2]為最高 bar實體為0.0010  [1]<=0.0030 
              (close_240_buffer[1]-open_240_buffer[1]<=-0.0030 && close_240_buffer[5]-open_240_buffer[5]<=-0.0010  && 
               close_240_buffer[2]-open_240_buffer[2]>=0.0010 && close_240_buffer[3]-open_240_buffer[3]>=0.0010 &&
               close_240_buffer[4]-open_240_buffer[4]>=0.0010 &&
                        //(m15-61)  [1]下影線小於15點
               low_240_buffer[1]-close_240_buffer[1]<=-0.0015  &&            
               k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  &&
                            //(m15-59) kd1,(kd2||kd3)<=3 開口必須縮小
             ((k1_240_buffer[1]-d1_240_buffer[1]<=3  && (k2_240_buffer[1]-d2_240_buffer[1]<=3 || k3_240_buffer[1]-d3_240_buffer[1]<=3)) ||
                  //(m15-61)  macd  差值<=0.00150  >=-0.00100
              (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00150 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100))  &&
               k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  &&
                   //(m15=58)  h4 收盤必須離ma05在10點內     k1,k2,k3必須在55上以免已跌過頭
               ma05_240_buffer[1]- close_240_buffer[1]>=-0.0015 && ma05_240_buffer[1]-ma05_240_buffer[2]<=0 &&
               k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) || // && 
                             //在m15之下執行時   下列無法作用
       //     (high_240_buffer[1]==H4highest40bar ||  high_240_buffer[2]==H4highest40bar || high_240_buffer[3]==H4highest40bar)) ||
             
                //   //(m15-61) H4 的 [-2][-1]   下影線在10點內
              (close_240_buffer[1]-open_240_buffer[1]<=-0.0010 && close_240_buffer[2]-open_240_buffer[2]<=-0.0010  && 
                     //  [1][2]下影線小於10點
               low_240_buffer[1]-close_240_buffer[1]<=-0.0010  &&  low_240_buffer[2]-close_240_buffer[2]<=-0.0010  &&             
                    //    k,k2,k3<=-1 
               k1_240_buffer[1]-k1_240_buffer[2]<=-1  && k2_240_buffer[1]-k2_240_buffer[2]<=-1 && k3_240_buffer[1]-k3_240_buffer[2]<=-1 &&
                    //   macd  差值<=0.00100  >=-0.00100
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100  &&
               macdmainline_240_buffer[1]>=0.00350 && 
                      //k1,k2,k3>=85
               k1_240_buffer[1]>=85 && k2_240_buffer[1]>=85 && k3_240_buffer[1]>=85) ||
                    
                             //h4  [4][3][2]>=0.0050 [1]<=-0.0010  ma45[1]-[2]<=-0.0001
              (close_240_buffer[4]-open_240_buffer[4]>=0.0050 && close_240_buffer[3]-open_240_buffer[3]>=0.0050  && 
               close_240_buffer[2]-open_240_buffer[2]>=0.0050 && close_240_buffer[1]-open_240_buffer[1]<=-0.0010 &&
               ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0001) ||
                       //(m15-61) h4  [4]+[3]+[2]>=0.0150 [1]<=-0.0030  [1]-[2]<=0.0010  macd  差值<=0.00100  >=-0.00100
             (((close_240_buffer[4]-open_240_buffer[4])+(close_240_buffer[3]-open_240_buffer[3])+ 
               (close_240_buffer[2]-open_240_buffer[2])>=0.0150) && close_240_buffer[1]-open_240_buffer[1]<=-0.0030 &&
                close_240_buffer[1]-close_240_buffer[2]<=0.0010 &&
                macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100)) 
               if    ((k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90) ||
                     (k1_240_buffer[1]>=87 && k2_240_buffer[1]>=87  &&  k3_240_buffer[1]>=87) || 
                        //(m15-64) [1]||[2]不可升過150點 升太多不好回頭
                     (close_240_buffer[1]-open_240_buffer[1]>=0.0150 || close_240_buffer[2]-open_240_buffer[2]>=0.0150) ||
                       //(m15-64) [1]||[2]不可升過110點   kd1[1]||kd1[2]>=20 
                     (close_240_buffer[1]-open_240_buffer[1]>=0.0110 && k1_240_buffer[1]-d1_240_buffer[1]>=20) ||
                     (close_240_buffer[2]-open_240_buffer[2]>=0.0110 && k1_240_buffer[2]-d1_240_buffer[2]>=20) ||
                             // (m15-64)  kd1,kd2,kd3>=15
                     (k1_240_buffer[1]-d1_240_buffer[1]>=15 && k2_240_buffer[1]-d2_240_buffer[1]>=15 && k3_240_buffer[1]-d3_240_buffer[1]>=15)) 
                      return;
                      else                        
                      OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+30*Point,Bid-2000*Point,"My order #S9",4409,0,Olive );
 
  //+++++++++++++++++++++++++++++++++++++++++++   SELL   10   ++++++++++++++++++++++++++++++++++++++++++++++++++          

    
                                         //h1 [1] 實黑超過30,50,70,100點   
                                //100 點 [1]-[2]<=0.0001  [1]-[3]<=0.0001
      if   ((((close_60_buffer[1]-open_60_buffer[1]<=-0.0100 && close_60_buffer[1]-close_60_buffer[2]<=0.0001  &&
            close_60_buffer[1]-close_60_buffer[3]<=0.0001 && 
                               //kd1,kd2,kd3<=0  k1,k2,k3>70 
            k1_60_buffer[1]-d1_60_buffer[1]<=0 && k2_60_buffer[1]-d2_60_buffer[1]<=0 && k3_60_buffer[1]-d3_60_buffer[1]<=0 &&
            k1_60_buffer[1]>=70 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70) ||
                               //75 點 [1]-[2]<=0~~~~[1]-[4]<=0 
           (close_60_buffer[1]-open_60_buffer[1]<=-0.0075 && close_60_buffer[1]-close_60_buffer[2]<=0  &&
            close_60_buffer[1]-close_60_buffer[3]<=0 && close_60_buffer[1]-close_60_buffer[4]<=0  &&
                              //kd1,kd2,kd3<=0 k1,k2,k3>70 
            k1_60_buffer[1]-d1_60_buffer[1]<=0 && k2_60_buffer[1]-d2_60_buffer[1]<=0 && k3_60_buffer[1]-d3_60_buffer[1]<=0 &&
            k1_60_buffer[1]>=70 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70) ||
                              //55 點 [1]-[2][3]<=0,[1]-[6]<=0 
           (close_60_buffer[1]-open_60_buffer[1]<=-0.0055 && close_60_buffer[1]-close_60_buffer[2]<=0  &&
            close_60_buffer[1]-close_60_buffer[3]<=0 && close_60_buffer[1]-close_60_buffer[6]<=0  &&
                              //kd1,kd2,kd3<=0 k1,k2,k3>70 
            k1_60_buffer[1]-d1_60_buffer[1]<=0 && k2_60_buffer[1]-d2_60_buffer[1]<=0 && k3_60_buffer[1]-d3_60_buffer[1]<=0 &&
            k1_60_buffer[1]>=70 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70) ||
                          //30 點 [1]-[2]<=0~~~~~[1]-[8]<=0 
           (close_60_buffer[1]-open_60_buffer[1]<=-0.0030 && close_60_buffer[1]-close_60_buffer[2]<=0  &&
            close_60_buffer[1]-close_60_buffer[3]<=0 && close_60_buffer[1]-close_60_buffer[4]<=0  &&
            close_60_buffer[1]-close_60_buffer[5]<=0 && close_60_buffer[1]-close_60_buffer[6]<=0  &&
            close_60_buffer[1]-close_60_buffer[7]<=0 && close_60_buffer[1]-close_60_buffer[8]<=0  &&
                                  //kd1,kd2,kd3<=-2 k2.k3>=85 
            k1_60_buffer[1]-d1_60_buffer[1]<=-2 && k2_60_buffer[1]-d2_60_buffer[1]<=-2 && k3_60_buffer[1]-d3_60_buffer[1]<=-2 &&
            k1_60_buffer[1]>=70 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70))))
                                   //h4  在53下  開口向上  不做賣單
             if   ((k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3全向上,或h4,m30,m60  kd2,kd3向上開口大 或 k1,k,2,k3在極高
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=25  &&  k3_240_buffer[1]-d3_240_buffer[1]>=25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                    k2_240_buffer[0]<=60 && k3_240_buffer[1]<=60) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]>=10  && k2_240_buffer[1]-d2_240_buffer[1]>=10  &&
                    k3_240_buffer[1]-d3_240_buffer[1]>=10  && k2_240_buffer[0]<=30 && k3_240_buffer[1]<=30) ||
                            //(m15-57) h4  kd1,kd2,kd3>=0   k1,k2,k3<=20 macd<=-0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]>=0  &&  k2_240_buffer[1]-d2_240_buffer[1]>=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=0  &&  k1_240_buffer[0]<=20 && k2_240_buffer[0]<=20 && k3_240_buffer[1]<=20 &&
                    macdmainline_240_buffer[1]<=-0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3>=35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=35) ||
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd差值<=350
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0100  &&  close_240_buffer[2]-open_240_buffer[2]>=0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0020  &&
                   (k1_240_buffer[1]<=50 && k2_240_buffer[1]<=50 && k3_240_buffer[1]<=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3>=4   ma05  [1]-[2]>=0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]>=4  &&  k2_240_buffer[1]-d2_240_buffer[1]>=4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 && k1_240_buffer[1]-k1_240_buffer[2]>=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30  && 
                    k1_240_buffer[1]-k1_240_buffer[2]>=0 &&  k2_240_buffer[1]-k2_240_buffer[2]>=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]>=0 &&  close_240_buffer[1]-open_240_buffer[1]>=0.0001) || 
                   (k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90) ||
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86)) 
                    return;
                    else                        
            OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+38*Point,Bid-2000*Point,"My order #S10",4410,0,Teal );
  
  //+++++++++++++++++++++++++++++++++++++++++++   SELL   11   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                      //m30 的 [-4][+3][+2][-1]   [1]<=-0.0030 
         if   ((close_30_buffer[1]-open_30_buffer[1]<=-0.0030 && close_30_buffer[4]-open_30_buffer[4]<=-0.0008  && 
               close_30_buffer[2]-open_30_buffer[2]>=0.0008 && close_30_buffer[3]-open_30_buffer[3]>=0.0008 &&
               k2_30_buffer[1]-d2_30_buffer[1]<=-12 && k3_30_buffer[1]-d3_30_buffer[1]<=-12 &&
               k2_30_buffer[1]>=55 && k3_30_buffer[1]>=55) || 
                       //m30 的 [-5][+4][+3][+2][-1]  [1]<=-0.0015  
              (close_30_buffer[1]-open_30_buffer[1]<=-0.0015 && close_30_buffer[5]-open_30_buffer[5]<=-0.0010  && 
               close_30_buffer[2]-open_30_buffer[2]>=0.0010 && close_30_buffer[3]-open_30_buffer[3]>=0.0010 &&
               close_30_buffer[4]-open_30_buffer[4]>=0.0010 &&
               k2_30_buffer[1]-d2_30_buffer[1]<=-10 && k3_30_buffer[1]-d3_30_buffer[1]<=-10 &&
               k2_30_buffer[1]>=70 && k3_30_buffer[1]>=70) || 
  
                  //m60 的 [-4][+3][+2][-1]   [1]<=-0.0030 
              (close_60_buffer[1]-open_60_buffer[1]<=-0.0030 && close_60_buffer[4]-open_60_buffer[4]<=-0.0010  && 
               close_60_buffer[2]-open_60_buffer[2]>=0.0010 && close_60_buffer[3]-open_60_buffer[3]>=0.0010 &&
               k2_60_buffer[1]-d2_60_buffer[1]<=-10 && k3_60_buffer[1]-d3_60_buffer[1]<=-10 &&
               k2_60_buffer[1]>=45 && k3_60_buffer[1]>=45) || 
                        //m60 的 [-4][+3][+2][-1]   [1]<=-0.0020 
              (close_60_buffer[1]-open_60_buffer[1]<=-0.0020 && close_60_buffer[4]-open_60_buffer[4]<=-0.0007  && 
               close_60_buffer[2]-open_60_buffer[2]>=0.0007 && close_60_buffer[3]-open_60_buffer[3]>=0.0007 &&
               k1_60_buffer[1]-d1_60_buffer[1]<=0 && k2_60_buffer[1]-d2_60_buffer[1]<=-5 && k3_60_buffer[1]-d3_60_buffer[1]<=-5 &&
               k2_60_buffer[1]>=80 && k3_60_buffer[1]>=80) || 
                      //m60 的 [_5][+4][+3][+2][-1]  [1]<=-0.0015  
              (close_60_buffer[1]-open_60_buffer[1]<=-0.0015 && close_60_buffer[5]-open_60_buffer[5]<=-0.0007  && 
               close_60_buffer[2]-open_60_buffer[2]>=0.0007 && close_60_buffer[3]-open_60_buffer[3]>=0.0007 &&
               close_60_buffer[4]-open_60_buffer[4]>=0.0007 &&
               k2_60_buffer[1]-d2_60_buffer[1]<=-4 && k3_60_buffer[1]-d3_60_buffer[1]<=-4 &&
               k2_60_buffer[1]>=65 && k3_60_buffer[1]>=65) || 

                        //m60 的 [+5][-4][+3][-2][+1]  [1]<=-0.0015  
              (close_60_buffer[1]-open_60_buffer[1]<=-0.0015 && close_60_buffer[5]-open_60_buffer[5]<=-0.0007  && 
               close_60_buffer[2]-open_60_buffer[2]>=0.0007 && close_60_buffer[3]-open_60_buffer[3]<=-0.0007 &&
               close_60_buffer[4]-open_60_buffer[4]>=0.0007 &&
               k1_60_buffer[1]-k1_60_buffer[2]<=0 &&  k2_60_buffer[1]-k2_60_buffer[2]<=0 && k3_60_buffer[1]-k3_60_buffer[2]<=0 &&
               k2_60_buffer[1]>=80 && k3_60_buffer[1]>=80)) 
                                    //h4  在53下  開口向上  不做賣單
               if ((k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3全向上,或h4,m30,m60  kd2,kd3向上開口大 或 k1,k,2,k3在極高
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=25  &&  k3_240_buffer[1]-d3_240_buffer[1]>=25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                    k2_240_buffer[0]<=60 && k3_240_buffer[1]<=60) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]>=10  && k2_240_buffer[1]-d2_240_buffer[1]>=10  &&
                    k3_240_buffer[1]-d3_240_buffer[1]>=10  && k2_240_buffer[0]<=30 && k3_240_buffer[1]<=30) ||
                            //(m15-57) h4  kd1,kd2,kd3>=0   k1,k2,k3<=20 macd<=-0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]>=0  &&  k2_240_buffer[1]-d2_240_buffer[1]>=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=0  &&  k1_240_buffer[0]<=20 && k2_240_buffer[0]<=20 && k3_240_buffer[1]<=20 &&
                    macdmainline_240_buffer[1]<=-0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3>=35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=35) ||
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd差值<=350
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0100  &&  close_240_buffer[2]-open_240_buffer[2]>=0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0020  &&
                   (k1_240_buffer[1]<=50 && k2_240_buffer[1]<=50 && k3_240_buffer[1]<=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3>=4   ma05  [1]-[2]>=0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]>=4  &&  k2_240_buffer[1]-d2_240_buffer[1]>=4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 && k1_240_buffer[1]-k1_240_buffer[2]>=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30  && 
                    k1_240_buffer[1]-k1_240_buffer[2]>=0 &&  k2_240_buffer[1]-k2_240_buffer[2]>=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]>=0 &&  close_240_buffer[1]-open_240_buffer[1]>=0.0001) || 
                   (k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90) ||
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86)) 
                    return;
                    else                        
                    OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+28*Point,Bid-2000*Point,"My order #S11",4411,0,Teal );
  //+++++++++++++++++++++++++++++++++++++++++++   SELL   12   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                        //m30 [2]上影線超過25點   [2]為負時開-高  [2]為正時收-開  
     if  (((close_30_buffer[2]-open_30_buffer[2]<=-0.0001 && high_30_buffer[2]-open_30_buffer[2]>=0.0025) ||
          (close_30_buffer[2]-open_30_buffer[2]>=0.0001  && high_30_buffer[2]-close_30_buffer[2]>=0.0025) &&
          (high_30_buffer[1]==M15highest50bar || high_30_buffer[2]==M15highest50bar) && 
                               //     [1]收負  [1]-[2]<=-0.0001   k1,k2,k3<=0  k1,k2,k3>=80
          (close_30_buffer[1]-open_30_buffer[1]<=-0.0010 && close_30_buffer[1]-close_30_buffer[2]<=-0.0001 &&
           k1_30_buffer[1]-k1_30_buffer[2]<=0 && k2_30_buffer[1]-k2_30_buffer[2]<=0 && k3_30_buffer[1]-k3_30_buffer[2]<=0   &&
           k1_30_buffer[1]>=70 && k2_30_buffer[1]>=70 && k3_30_buffer[1]>=70) ||
             //    [1]收負  [1]-[2]<=-0.0001   k1,(k2||k3)<=0  k1,k2,k3>=70 kd1<=-1
             (close_30_buffer[1]-open_30_buffer[1]<=-0.0001 && close_30_buffer[1]-close_30_buffer[2]<=-0.0001 &&
              k1_30_buffer[1]-k1_30_buffer[2]<=0 && (k2_30_buffer[1]-k2_30_buffer[2]<=0 || k3_30_buffer[1]-k3_30_buffer[2]<=0) &&
              k1_30_buffer[1]-d1_30_buffer[2]<=-1 && 
              k1_30_buffer[1]>=80 && k2_30_buffer[1]>=80 && k3_30_buffer[1]>=80)) ||
                            //m30 [1][2]上影線超過25點   [2]為負時開-高  [2]為正時收-開  [1]<=0.0010
         ((close_30_buffer[1]-open_30_buffer[1]<=-0.0001 && high_30_buffer[1]-open_30_buffer[1]>=0.0025) ||
          (close_30_buffer[1]-open_30_buffer[1]>=0.0001   && close_30_buffer[1]-open_30_buffer[1]<=0.0010   && 
          high_30_buffer[1]-close_30_buffer[1]>=0.0025) &&
          (close_30_buffer[2]-open_30_buffer[2]<=-0.0001 && high_30_buffer[2]-open_30_buffer[2]>=0.0025) ||
          (close_30_buffer[2]-open_30_buffer[2]>=0.0001  && high_30_buffer[2]-close_30_buffer[2]>=0.0025) &&
           k1_30_buffer[1]>=70 && k2_30_buffer[1]>=70 && k3_30_buffer[1]>=70 &&
          (high_30_buffer[1]==M15highest50bar || high_30_buffer[2]==M15highest50bar) && 
                               //     [1]收負  [1]-[2]<=-0.0001   k1,k2,k3<=0  k1,k2,k3>=80
           close_30_buffer[1]-open_30_buffer[1]<=-0.0010 && close_30_buffer[1]-close_30_buffer[2]<=-0.0001 &&
           k1_30_buffer[1]-k1_30_buffer[2]<=0 && k2_30_buffer[1]-k2_30_buffer[2]<=0 && k3_30_buffer[1]-k3_30_buffer[2]<=0   &&
           k1_30_buffer[1]>=70 && k2_30_buffer[1]>=70 && k3_30_buffer[1]>=70) ||
                                 // [1]留上影線超過40點   [2]為負時開-高  k1,k2,k3<=-1  ,k1,k2,k3>=80
         ((close_30_buffer[1]-open_30_buffer[1]>=0.0001  && high_30_buffer[1]-open_30_buffer[1]<=-0.0040) &&
          high_30_buffer[1]==M15highest50bar &&
          k1_30_buffer[1]-k1_30_buffer[2]<=-1 && k2_30_buffer[1]-k2_30_buffer[2]<=-1 && k3_30_buffer[1]-k3_30_buffer[2]<=-1 &&
          k1_30_buffer[1]>=80 && k2_30_buffer[1]>=80 && k3_30_buffer[1]>=80))             
                   
                 
                 
                            //return  else  以下 buy 12   buy13  相同 和 buy1  ~  buy 11  不同
                            //return  else  以下 buy 12   buy13  相同 和 buy1  ~  buy 11  不同
             
              if  ((k2_60_buffer[1]-d2_60_buffer[1]>=25  &&  k3_60_buffer[1]-d3_60_buffer[1]>=25) ||
                   (k1_60_buffer[1]-d1_60_buffer[1]>=10  && k2_60_buffer[1]-d2_60_buffer[1]>=10  &&  k3_60_buffer[1]-d3_60_buffer[1]>=10) ||                                   //h4  k2,k3 在47上  開口向下  不做買單 
                   (k2_60_buffer[1]-d2_60_buffer[1]>=19  &&  k3_60_buffer[1]-d3_60_buffer[1]>=19 && 
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0010  &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0008) ||
                        //h1 [1]>=0.0120  h4   ma05,ma08,ma12>=0.0025
                    (close_60_buffer[1]-open_60_buffer[1]>=0.0120 && ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0025  &&  
                     ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0025  &&  ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0025) ||
                                //h4  在53下  開口向上  不做賣單
                   (k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]<=45 && k3_240_buffer[1]>=45 &&  k1_240_buffer[1]-k1_240_buffer[1]>=10  &&
                   (k2_240_buffer[1]-k2_240_buffer[1]>=10 || k3_240_buffer[1]-k3_240_buffer[1]>=10)) ||
                          //(m15-57)h4  [1]升過140點
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0140) ||
                       //(m15-59) h4  ma45,ma90,ma180其中任二[1]-[2]>=0    [1]>=0.0100
                  ((ma45_240_buffer[1]-ma45_240_buffer[2]>=0 || ma90_240_buffer[1]-ma90_240_buffer[2]>=0) &&
                   (ma90_240_buffer[1]-ma90_240_buffer[2]>=0 || ma180_240_buffer[1]-ma180_240_buffer[2]>=0) &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0100) ||  
                          //(m15-59) h4 k1||k2||k3 <=35 don't sell
                   (k1_240_buffer[1]<=35 || k2_240_buffer[1]<=35 || k3_240_buffer[1]<=35) ||                   

                    //(m15-577)h4  ma45[1][2]>=0.0007  ma90[1][2]>=0.0004  ma45||ma90([1]-[2])-[2]-[3])>=0.0001 ma45,ma90間距>=-0.0400 <=0.0035
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0007  &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0004 &&
                  ((ma45_240_buffer[1]-ma45_240_buffer[2])-(ma45_240_buffer[2]-ma45_240_buffer[3])>=0.0001  ||
                   (ma90_240_buffer[1]-ma90_240_buffer[2])-(ma90_240_buffer[2]-ma90_240_buffer[3])>=0.0001) &&
                           //(m15-58)   ma45在ma90 上但間距>=-0.0350 <=0.0010
                    ma45_240_buffer[1]-ma90_240_buffer[1]>=-0.0350 && ma45_240_buffer[1]-ma90_240_buffer[1]<=0.0010) ||
                          //(m15-58)h4  kd1+kd2+kd3>=49 kd1,kd2,kd3>=7
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=49 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=7 && k2_240_buffer[1]-d2_240_buffer[1]>=7 && k3_240_buffer[1]-d3_240_buffer[1]>=7) ||
                          //(m15-58)h4  kd1+kd2+kd3>=45 kd1,kd2,kd3>=12
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=45 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=12 && k2_240_buffer[1]-d2_240_buffer[1]>=12 && k3_240_buffer[1]-d3_240_buffer[1]>=12) ||
                
                              //(m15-57)h4  [1]升過100點  ma45>=0.0015  || [0]>=0.0150
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0100 && (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0015 ||
                    close_240_buffer[0]-open_240_buffer[0]>=0.0150)) ||
                     //(m15-57)h4 k1>=19  k2,k3[1]-[2]>=2
                   (k1_240_buffer[1]-d1_240_buffer[1]>=19  &&  k2_240_buffer[1]-k2_240_buffer[2]>=2 &&
                    k3_240_buffer[1]-k3_240_buffer[2]>=2) ||
                                 // h4  ma05[1]-ma12[1]>=0.0160  ma05[2]-ma12[2]>=0.0120   ma05[1]-ma05[2]>=0.0030
                   (ma05_240_buffer[1]-ma12_240_buffer[1]>=0.0160  &&  ma05_240_buffer[2]-ma12_240_buffer[2]>=0.0120  &&
                    ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0030) ||
                               //(m15-57)h4   ma05[1]-[2]>=0.0050  ma45[1]-[2]>=0.0007
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0050  &&  ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0007) ||
                     //h4   kd2,kd3>=15 k1>=5   macd>=0.00300
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=5 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300) ||    
                            //h4   kd1,kd2,kd3>=7    macd[1]>=0.00350  macd[2]>=0.00250  (macd[1]-[2]>=0.00070) ||macdmain[1]-[2]>=0.00150  macdsignal[1]-[2]>=0.00070
                   (k2_240_buffer[1]-d2_240_buffer[1]>=7  &&  k3_240_buffer[1]-d3_240_buffer[1]>=7 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=7 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00350 &&
                    macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]>=0.00250 && 
                 (((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1])-(macdmainline_240_buffer[2]-macdsignalline_240_buffer[2])>=0.00070) ||    
                   (macdmainline_240_buffer[1]-macdmainline_240_buffer[2]>=0.00150 && macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2])>=0.00070)) ||
                                //ma45  ma90 >=0.0014
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0014  &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0014) ||
                             //(m15-57)ma45  ma90 >=0.0010   ma45+ma90>=0.0029
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0010  &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0010 &&
                   (ma45_240_buffer[1]-ma45_240_buffer[2])+ (ma90_240_buffer[1]-ma90_240_buffer[2])>=0.0029) ||

                                     //H4 k1,k2,k3全向上,或h4,m30,m60  kd2,kd3向上開口大 或 k1,k,2,k3在極高
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=2 && 
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=25  &&  k3_240_buffer[1]-d3_240_buffer[1]>=25  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                    k2_240_buffer[0]<=60 && k3_240_buffer[1]<=60  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]>=10  && k2_240_buffer[1]-d2_240_buffer[1]>=10  &&
                    k3_240_buffer[1]-d3_240_buffer[1]>=10  && k2_240_buffer[0]<=30 && k3_240_buffer[1]<=30  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                       (k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30  && 
                    k1_240_buffer[1]-k1_240_buffer[2]>=0 &&  k2_240_buffer[1]-k2_240_buffer[2]>=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]>=0 &&  close_240_buffer[1]-open_240_buffer[1]>=0.0001  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                                  //34分 結單後34分之內不動作
                   (OrderType()==OP_SELL && TimeCurrent()-OrderCloseTime()<=2000))
                    return;
                    else                                     
      
                    OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+28*Point,Bid-2000*Point,"My order #S12",4412,0,ForestGreen );

    //+++++++++++++++++++++++++++++++++++++++++++   SELL   13   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                        //h1 [2]上影線超過27點   [2]為負時開-高  [2]為正時收-開  
     if  (((close_60_buffer[2]-open_60_buffer[2]<=-0.0001 && high_60_buffer[2]-open_60_buffer[2]>=0.0025) ||
          (close_60_buffer[2]-open_60_buffer[2]>=0.0001   && high_60_buffer[2]-close_60_buffer[2]>=0.0025) &&
          (high_60_buffer[1]==M15highest70bar || high_60_buffer[2]==M15highest70bar) && 
                               //     [1]收負  [1]-[2]<=-0.0001   k1,k2,k3<=0  k1,k2,k3>=80
          (close_60_buffer[1]-open_60_buffer[1]<=-0.0010 && close_60_buffer[1]-close_60_buffer[2]<=-0.0001 &&
           k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 && k3_60_buffer[1]-k3_60_buffer[2]<=0   &&
           k1_60_buffer[1]>=70 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70) ||
          //    [1]收負  [1]-[2]<=-0.0001   k1,(k2||k3)<=0  k1,k2,k3>=70 kd1<=-1
             (close_60_buffer[1]-open_60_buffer[1]<=-0.0001 && close_60_buffer[1]-close_60_buffer[2]<=-0.0001 &&
              k1_60_buffer[1]-k1_60_buffer[2]<=0 && (k2_60_buffer[1]-k2_60_buffer[2]<=0 || k3_60_buffer[1]-k3_60_buffer[2]<=0) &&
              k1_60_buffer[1]-d1_60_buffer[2]<=-1 && 
              k1_60_buffer[1]>=80 && k2_60_buffer[1]>=80 && k3_60_buffer[1]>=80)) ||
                             //h1 [1],[2]上影線超過24點   [2]為負時開-高  [2]為正時收-開  
         ((close_60_buffer[1]-open_60_buffer[1]<=-0.0001 && high_60_buffer[1]-open_60_buffer[1]>=0.0024) ||
          (close_60_buffer[1]-open_60_buffer[1]>=0.0001   && close_30_buffer[1]-open_30_buffer[1]<=0.0010   && 
           high_60_buffer[1]-close_60_buffer[1]>=0.0024) &&
          (close_60_buffer[2]-open_60_buffer[2]<=-0.0001 && high_60_buffer[2]-open_60_buffer[2]>=0.0024) ||
          (close_60_buffer[2]-open_60_buffer[2]>=0.0001   && high_60_buffer[2]-close_60_buffer[2]>=0.0024) &&
           k1_60_buffer[1]>=80 && k2_60_buffer[1]>=80 && k3_60_buffer[1]>=80 &&
          (high_60_buffer[1]==M15highest70bar || high_60_buffer[2]==M15highest70bar)) ||
                                 // [1]留上影線超過40點   [2]為負時開-高  k1,k2,k3<=-1  ,k1,k2,k3>=80
         ((close_60_buffer[1]-open_60_buffer[1]>=0.0001  && high_60_buffer[1]-open_60_buffer[1]<=-0.0040) &&
          high_60_buffer[1]==M15highest70bar &&
          k1_60_buffer[1]-k1_60_buffer[2]<=-1 && k2_60_buffer[1]-k2_60_buffer[2]<=-1 && k3_60_buffer[1]-k3_60_buffer[2]<=-1 &&
          k1_60_buffer[1]>=80 && k2_60_buffer[1]>=80 && k3_60_buffer[1]>=80))             
                    
                            //return  else  以下 buy 12   buy13  相同 和 buy1  ~  buy 11  不同
                            //return  else  以下 buy 12   buy13  相同 和 buy1  ~  buy 11  不同
             
              if  ((k2_60_buffer[1]-d2_60_buffer[1]>=25  &&  k3_60_buffer[1]-d3_60_buffer[1]>=25) ||
                   (k1_60_buffer[1]-d1_60_buffer[1]>=10  && k2_60_buffer[1]-d2_60_buffer[1]>=10  &&  k3_60_buffer[1]-d3_60_buffer[1]>=10) ||                                   //h4  k2,k3 在47上  開口向下  不做買單 
                   (k2_60_buffer[1]-d2_60_buffer[1]>=19  &&  k3_60_buffer[1]-d3_60_buffer[1]>=19 && 
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0010  &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0008) ||
                        //h1 [1]>=0.0120  h4   ma05,ma08,ma12>=0.0025
                    (close_60_buffer[1]-open_60_buffer[1]>=0.0120 && ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0025  &&  
                     ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0025  &&  ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0025) ||
                                //h4  在53下  開口向上  不做賣單
                   (k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]<=45 && k3_240_buffer[1]>=45 &&  k1_240_buffer[1]-k1_240_buffer[1]>=10  &&
                   (k2_240_buffer[1]-k2_240_buffer[1]>=10 || k3_240_buffer[1]-k3_240_buffer[1]>=10)) ||
                          //(m15-57)h4  [1]升過140點
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0140) ||
                       //(m15-59) h4  ma45,ma90,ma180其中任二[1]-[2]>=0    [1]>=0.0100
                  ((ma45_240_buffer[1]-ma45_240_buffer[2]>=0 || ma90_240_buffer[1]-ma90_240_buffer[2]>=0) &&
                   (ma90_240_buffer[1]-ma90_240_buffer[2]>=0 || ma180_240_buffer[1]-ma180_240_buffer[2]>=0) &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0100) ||  
                          //(m15-59) h4 k1||k2||k3 <=35 don't sell
                   (k1_240_buffer[1]<=35 || k2_240_buffer[1]<=35 || k3_240_buffer[1]<=35) ||                   

                    //(m15-577)h4  ma45[1][2]>=0.0007  ma90[1][2]>=0.0004  ma45||ma90([1]-[2])-[2]-[3])>=0.0001 ma45,ma90間距>=-0.0400 <=0.0035
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0007  &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0004 &&
                  ((ma45_240_buffer[1]-ma45_240_buffer[2])-(ma45_240_buffer[2]-ma45_240_buffer[3])>=0.0001  ||
                   (ma90_240_buffer[1]-ma90_240_buffer[2])-(ma90_240_buffer[2]-ma90_240_buffer[3])>=0.0001) &&
                           //(m15-58)   ma45在ma90 上但間距>=-0.0350 <=0.0010
                    ma45_240_buffer[1]-ma90_240_buffer[1]>=-0.0350 && ma45_240_buffer[1]-ma90_240_buffer[1]<=0.0010) ||
                          //(m15-58)h4  kd1+kd2+kd3>=49 kd1,kd2,kd3>=7
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=49 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=7 && k2_240_buffer[1]-d2_240_buffer[1]>=7 && k3_240_buffer[1]-d3_240_buffer[1]>=7) ||
                          //(m15-58)h4  kd1+kd2+kd3>=45 kd1,kd2,kd3>=12
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=45 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=12 && k2_240_buffer[1]-d2_240_buffer[1]>=12 && k3_240_buffer[1]-d3_240_buffer[1]>=12) ||
                
                              //(m15-57)h4  [1]升過100點  ma45>=0.0015  || [0]>=0.0150
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0100 && (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0015 ||
                    close_240_buffer[0]-open_240_buffer[0]>=0.0150)) ||
                     //(m15-57)h4 k1>=19  k2,k3[1]-[2]>=2
                   (k1_240_buffer[1]-d1_240_buffer[1]>=19  &&  k2_240_buffer[1]-k2_240_buffer[2]>=2 &&
                    k3_240_buffer[1]-k3_240_buffer[2]>=2) ||
                                 // h4  ma05[1]-ma12[1]>=0.0160  ma05[2]-ma12[2]>=0.0120   ma05[1]-ma05[2]>=0.0030
                   (ma05_240_buffer[1]-ma12_240_buffer[1]>=0.0160  &&  ma05_240_buffer[2]-ma12_240_buffer[2]>=0.0120  &&
                    ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0030) ||
                               //(m15-57)h4   ma05[1]-[2]>=0.0050  ma45[1]-[2]>=0.0007
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0050  &&  ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0007) ||
                     //h4   kd2,kd3>=15 k1>=5   macd>=0.00300
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=5 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300) ||    
                            //h4   kd1,kd2,kd3>=7    macd[1]>=0.00350  macd[2]>=0.00250  (macd[1]-[2]>=0.00070) ||macdmain[1]-[2]>=0.00150  macdsignal[1]-[2]>=0.00070
                   (k2_240_buffer[1]-d2_240_buffer[1]>=7  &&  k3_240_buffer[1]-d3_240_buffer[1]>=7 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=7 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00350 &&
                    macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]>=0.00250 && 
                 (((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1])-(macdmainline_240_buffer[2]-macdsignalline_240_buffer[2])>=0.00070) ||    
                   (macdmainline_240_buffer[1]-macdmainline_240_buffer[2]>=0.00150 && macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2])>=0.00070)) ||
                                //ma45  ma90 >=0.0014
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0014  &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0014) ||
                             //(m15-57)ma45  ma90 >=0.0010   ma45+ma90>=0.0029
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0010  &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0010 &&
                   (ma45_240_buffer[1]-ma45_240_buffer[2])+ (ma90_240_buffer[1]-ma90_240_buffer[2])>=0.0029) ||

                                     //H4 k1,k2,k3全向上,或h4,m30,m60  kd2,kd3向上開口大 或 k1,k,2,k3在極高
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=2 && 
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=25  &&  k3_240_buffer[1]-d3_240_buffer[1]>=25  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                    k2_240_buffer[0]<=60 && k3_240_buffer[1]<=60  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]>=10  && k2_240_buffer[1]-d2_240_buffer[1]>=10  &&
                    k3_240_buffer[1]-d3_240_buffer[1]>=10  && k2_240_buffer[0]<=30 && k3_240_buffer[1]<=30  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                       (k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30  && 
                    k1_240_buffer[1]-k1_240_buffer[2]>=0 &&  k2_240_buffer[1]-k2_240_buffer[2]>=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]>=0 &&  close_240_buffer[1]-open_240_buffer[1]>=0.0001  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                                  //34分 結單後34分之內不動作
                   (OrderType()==OP_SELL && TimeCurrent()-OrderCloseTime()<=2000))
                    return;
                    else                                     
 
                    OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+28*Point,Bid-2000*Point,"My order #S13",4413,0,MidnightBlue );

   //+++++++++++++++++++++++++++++++++++++++++++   SELL   14   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                 //(m15-62) h1    macd>=0.00870   差值在-50,+50間         發生的機率不多所以不使用狀況排除法
        if    (macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=0.00040 && macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=-0.00040 &&
               macdmainline_60_buffer[1]>=0.00870 &&
                    //k1,k2,k3  [1]-[2]<=0   k1,k2,k3>=70 || ma180 ,ma360斜下
               k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 && 
               k3_60_buffer[1]-k3_60_buffer[2]<=0 && 
             ((k1_60_buffer[1]>=70 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70) || (ma180_60_buffer[1]-ma180_60_buffer[2]<=-0.0001 &&
               ma360_60_buffer[1]-ma360_60_buffer[2]<=-0.0001)))
                          //ma45  ,ma90,ma180,ma360  斜上
               if   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0011 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0008 &&
                     ma180_240_buffer[1]-ma180_240_buffer[2]>=0.0004 && ma360_240_buffer[1]-ma360_240_buffer[2]>=0.0001)
                     return;
                     else 
                     OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+28*Point,Bid-2000*Point,"My order #S14",4414,0,DimGray );
 
     //+++++++++++++++++++++++++++++++++++++++++++   SELL   15   ++++++++++++++++++++++++++++++++++++++++++++++++++          
 
                 //(m15-63)  H4     [2][3]收紅<9點     [1]收黑  留上影線>30點   
       if    (close_240_buffer[1]-open_240_buffer[1]<=-0.0010 && high_240_buffer[1]-open_240_buffer[1]>=0.0030 &&
              close_240_buffer[2]-open_240_buffer[2]>=0.0009  && close_240_buffer[3]-open_240_buffer[3]>=0.0009  &&   
               // ma45 ma90 || ma90 ma180  斜下且大
            ((ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0008 &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002) ||
             (ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0006 &&  ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.0002)) &&
                // [1]收盤在ma05之下  不超過15點
              close_240_buffer[1]-ma05_240_buffer[1]<=-0.0001  && close_240_buffer[1]-ma05_240_buffer[1]>=-0.0015) 
      
              OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+28*Point,Bid-2000*Point,"My order #S15",4415,0,SpringGreen );

  
 
  }
  


 if (OrdersTotal()>0)
 {
   for (cnt=0;cnt<OrdersTotal();cnt++)
     {
       OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES);
 
     if   (OrderType()==OP_BUY)       
      {                                             
//+++++++++++++++++++++++++++++++++++++++++++  CLOSE  BUY   1   ++++++++++++++++++++++++++++++++++++++++++++++++++          
          
                                                       //m15 的ma45  ma90 為 ㄏ 上升末端型態  ma45[1]-[6]為確認為上升 
        if (((ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma45_15_buffer[1]-ma45_15_buffer[6]>=0) ||
                                                      //雖為上升但h4 [1]尚為負小於20點
             (ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0.0001 && 
                                            //h4 收黑 且下影線>=-0.0006
              close_240_buffer[1]-open_240_buffer[1]<=-0.0020 && low_240_buffer[1]-close_240_buffer[1]>=-0.0055 )) && 
              ma90_15_buffer[1]-ma90_15_buffer[2]>=0.0001 && 
                                                     //上升末端下跌要一次跌破前3bar
              close_15_buffer[1]-close_15_buffer[2]<=-0.0001  && // close_15_buffer[1]-close_15_buffer[3]<=-0.0001 &&
        //      close_15_buffer[1]-close_15_buffer[4]<=-0.0001  &&
                                                 //用m15 m30 macd 控管買賣點 
               macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00010 &&
               macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00050 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&
               macdmainline_30_buffer[1]>=-0.00110   &&
                                                          //m60 的45,90,180  皆是斜下
              (macdmainline_60_buffer[1]>=-0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]<=-0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]<=-0.0003 && 
               ma180_60_buffer[1]-ma180_60_buffer[2]<=0))   &&    
                                                              //k1 (k2||k3)已下跌
              k1_15_buffer[1]-k1_15_buffer[2]<=-1  &&  k1_15_buffer[1]-d1_15_buffer[1]<=-1 &&
              k2_15_buffer[1]-k2_15_buffer[2]<=0  ||  k3_15_buffer[1]-k3_15_buffer[2]<=0)
              if ((macdmainline_15_buffer[1]>=-0.00099 && macdmainline_15_buffer[1]<=0.00099 &&
                   macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                  (k2_30_buffer[1]-d2_30_buffer[1]>=19  &&  k3_30_buffer[1]-d3_30_buffer[1]>=19) ||
                  (k2_60_buffer[1]-d2_60_buffer[1]>=19  &&  k3_60_buffer[1]-d3_60_buffer[1]>=19) ||
                  
                                     //h4  在53下  開口向上  不做賣單
                   (k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3全向上,或h4,m30,m60  kd2,kd3向上開口大 或 k1,k,2,k3在極高
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=25  &&  k3_240_buffer[1]-d3_240_buffer[1]>=25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                    k2_240_buffer[0]<=60 && k3_240_buffer[1]<=60) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]>=10  && k2_240_buffer[1]-d2_240_buffer[1]>=10  &&
                    k3_240_buffer[1]-d3_240_buffer[1]>=10  && k2_240_buffer[0]<=30 && k3_240_buffer[1]<=30) ||
                            //(m15-57) h4  kd1,kd2,kd3>=0   k1,k2,k3<=20 macd<=-0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]>=0  &&  k2_240_buffer[1]-d2_240_buffer[1]>=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=0  &&  k1_240_buffer[0]<=20 && k2_240_buffer[0]<=20 && k3_240_buffer[1]<=20 &&
                    macdmainline_240_buffer[1]<=-0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3>=35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=35) ||
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd差值<=350
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0100  &&  close_240_buffer[2]-open_240_buffer[2]>=0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0020  &&
                   (k1_240_buffer[1]<=50 && k2_240_buffer[1]<=50 && k3_240_buffer[1]<=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3>=4   ma05  [1]-[2]>=0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]>=4  &&  k2_240_buffer[1]-d2_240_buffer[1]>=4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 && k1_240_buffer[1]-k1_240_buffer[2]>=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30  && 
                    k1_240_buffer[1]-k1_240_buffer[2]>=0 &&  k2_240_buffer[1]-k2_240_buffer[2]>=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]>=0 &&  close_240_buffer[1]-open_240_buffer[1]>=0.0001) || 
                   (k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90) ||
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86)) 
                    return;
                    else                        
                  OrderClose(OrderTicket(),lots,Ask,1,Yellow);    

//+++++++++++++++++++++++++++++++++++++++++++  CLOSE  BUY   2   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                     // h1 k123在上方 皆為下跌
          if  (k1_60_buffer[1]>=85 && k2_60_buffer[1]>=85 && k3_60_buffer[1]>=85  && 
               k1_60_buffer[1]-k1_60_buffer[2]<=-8 &&  k2_60_buffer[1]-k2_60_buffer[2]<=0 &&  k3_60_buffer[1]-k3_60_buffer[2]<=0 &&
                                  //[1]收盤小於20點 小於[2][3][4] ma05    10點上
               close_60_buffer[1]-open_60_buffer[1]<=-0.0020 && close_60_buffer[1]-close_60_buffer[2]<=-0.0010 &&
               close_60_buffer[1]-close_60_buffer[3]<=-0.0010 && close_60_buffer[1]-close_60_buffer[4]<=-0.0010 &&
               close_60_buffer[1]-ma05_60_buffer[1]<=-0.0010 && 
         
               macdmainline_30_buffer[1]>=-0.00110   &&
                                                          //m60 的45,90,180  皆是斜下
              (macdmainline_60_buffer[1]>=-0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]<=-0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]<=-0.0003 && 
               ma180_60_buffer[1]-ma180_60_buffer[2]<=0)))    
                                    //h4  在53下  開口向上  不做賣單
               if ((k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3全向上,或h4,m30,m60  kd2,kd3向上開口大 或 k1,k,2,k3在極高
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=25  &&  k3_240_buffer[1]-d3_240_buffer[1]>=25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                    k2_240_buffer[0]<=60 && k3_240_buffer[1]<=60) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]>=10  && k2_240_buffer[1]-d2_240_buffer[1]>=10  &&
                    k3_240_buffer[1]-d3_240_buffer[1]>=10  && k2_240_buffer[0]<=30 && k3_240_buffer[1]<=30) ||
                            //(m15-57) h4  kd1,kd2,kd3>=0   k1,k2,k3<=20 macd<=-0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]>=0  &&  k2_240_buffer[1]-d2_240_buffer[1]>=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=0  &&  k1_240_buffer[0]<=20 && k2_240_buffer[0]<=20 && k3_240_buffer[1]<=20 &&
                    macdmainline_240_buffer[1]<=-0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3>=35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=35) ||
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd差值<=350
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0100  &&  close_240_buffer[2]-open_240_buffer[2]>=0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0020  &&
                   (k1_240_buffer[1]<=50 && k2_240_buffer[1]<=50 && k3_240_buffer[1]<=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3>=4   ma05  [1]-[2]>=0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]>=4  &&  k2_240_buffer[1]-d2_240_buffer[1]>=4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 && k1_240_buffer[1]-k1_240_buffer[2]>=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30  && 
                    k1_240_buffer[1]-k1_240_buffer[2]>=0 &&  k2_240_buffer[1]-k2_240_buffer[2]>=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]>=0 &&  close_240_buffer[1]-open_240_buffer[1]>=0.0001) || 
                   (k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90) ||
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86)) 
                    return;
                    else                        
                    OrderClose(OrderTicket(),lots,Ask,1,Red);    

//+++++++++++++++++++++++++++++++++++++++++++  CLOSE  BUY   3   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                                                   //k1 一次下跌深 kd1大幅交叉下 
        if     ((k1_15_buffer[1]-k1_15_buffer[2]<=-10  &&  k1_15_buffer[1]-d1_15_buffer[1]<=-5 && close_15_buffer[1]-open_15_buffer[1]<=-0.0002 &&
                                         //設限以防過低再賣出  
                k1_15_buffer[1]>=40 && k2_15_buffer[2]>=40  &&  k3_15_buffer[1]>=40 && 
               (ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=0) || 
               (ma90_15_buffer[1]-ma90_15_buffer[2]<=0 && ma180_15_buffer[1]-ma180_15_buffer[2]<=0) && 
                                                         //賣單時 m30 m60   macd 不可以在過低位置 
               macdmainline_30_buffer[1]>=-0.00110   && 
                                                          //m60 的45,90,180  皆是斜下
              (macdmainline_60_buffer[1]>=-0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]<=-0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]<=-0.0003 && 
               ma180_60_buffer[1]-ma180_60_buffer[2]<=0))   &&    
                                                               //用m15 m30 macd 控管買賣點 
               macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00010 &&
               macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00050 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020))
               if ((macdmainline_15_buffer[1]>=-0.00099 && macdmainline_15_buffer[1]<=0.00099 &&
                    macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                      //(m15-62) h4 k1,k2,k3 <=30 don't sell
                   (k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||                   
                  //(m15-64) h4 [1]為正並大於30點  kd2,kd3>=10
                  (close_240_buffer[1]-open_240_buffer[1]>=0.0030 &&                          
                   k2_240_buffer[1]-d2_240_buffer[1]>=10 && k3_240_buffer[1]-d3_240_buffer[1]>=10) ||                        
                                              
                                     
                                       //h4  在53下  開口向上  不做賣單
                   (k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3全向上,或h4,m30,m60  kd2,kd3向上開口大 或 k1,k,2,k3在極高
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=25  &&  k3_240_buffer[1]-d3_240_buffer[1]>=25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                    k2_240_buffer[0]<=60 && k3_240_buffer[1]<=60) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]>=10  && k2_240_buffer[1]-d2_240_buffer[1]>=10  &&
                    k3_240_buffer[1]-d3_240_buffer[1]>=10  && k2_240_buffer[0]<=30 && k3_240_buffer[1]<=30) ||
                            //(m15-57) h4  kd1,kd2,kd3>=0   k1,k2,k3<=20 macd<=-0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]>=0  &&  k2_240_buffer[1]-d2_240_buffer[1]>=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=0  &&  k1_240_buffer[0]<=20 && k2_240_buffer[0]<=20 && k3_240_buffer[1]<=20 &&
                    macdmainline_240_buffer[1]<=-0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3>=35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=35) ||
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd差值<=350
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0100  &&  close_240_buffer[2]-open_240_buffer[2]>=0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0020  &&
                   (k1_240_buffer[1]<=50 && k2_240_buffer[1]<=50 && k3_240_buffer[1]<=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3>=4   ma05  [1]-[2]>=0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]>=4  &&  k2_240_buffer[1]-d2_240_buffer[1]>=4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 && k1_240_buffer[1]-k1_240_buffer[2]>=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30  && 
                    k1_240_buffer[1]-k1_240_buffer[2]>=0 &&  k2_240_buffer[1]-k2_240_buffer[2]>=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]>=0 &&  close_240_buffer[1]-open_240_buffer[1]>=0.0001) || 
                   (k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90) ||
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86)) 
                    return;
                    else                     
                   OrderClose(OrderTicket(),lots,Ask,1,Blue);    

//+++++++++++++++++++++++++++++++++++++++++++  CLOSE  BUY   4   ++++++++++++++++++++++++++++++++++++++++++++++++++          
         
              //m15 的 [-4][+3][+2][-1] && [-1]or[+2]為最高 bar實體為0.0006  較易發生條件較嚴
        if  (((close_15_buffer[1]-open_15_buffer[1]<=-0.0006 && close_15_buffer[4]-open_15_buffer[4]<=-0.0006  && 
               close_15_buffer[2]-open_15_buffer[2]>=0.0006 && close_15_buffer[3]-open_15_buffer[3]>=0.0006 &&
               k1_15_buffer[1]-k1_15_buffer[2]<=0  &&  close_15_buffer[1]-open_15_buffer[2]<=-0.0001  &&
              (high_15_buffer[1]==M15highest40bar ||  high_15_buffer[2]==M15highest40bar) &&
              (ma05_15_buffer[1]-ma05_15_buffer[2]<=0 || 
              (close_15_buffer[1]-open_15_buffer[1]<=-0.0001 && high_15_buffer[1]-close_15_buffer[1]>=0.0029) ||
              (k2_15_buffer[1]-k2_15_buffer[2]<=-2 && k3_15_buffer[1]-k3_15_buffer[2]<=-2) ||
              (ma05_15_buffer[1]-ma05_15_buffer[2]<=0.0006 &&
              (k2_15_buffer[1]-k2_15_buffer[2]<=0 || k3_15_buffer[1]-k3_15_buffer[2]<=0)))) ||
               //m15 的 [-5][+4][+3][+2][-1]  && [-1]or[+2]為最高 bar實體為0.0006  
              (close_15_buffer[1]-open_15_buffer[1]<=-0.0006 && close_15_buffer[5]-open_15_buffer[5]<=-0.0006  && 
               close_15_buffer[2]-open_15_buffer[2]>=0.0006 && close_15_buffer[3]-open_15_buffer[3]>=0.0006 && 
               close_15_buffer[4]-open_15_buffer[4]>=0.0006 &&
               k1_15_buffer[1]-k1_15_buffer[2]<=0  &&  close_15_buffer[1]-open_15_buffer[2]<=-0.0001  &&
              (high_15_buffer[1]==M15highest40bar ||  high_15_buffer[2]==M15highest40bar) &&
              (ma05_15_buffer[1]-ma05_15_buffer[2]<=0.0001 || 
              (close_15_buffer[1]-open_15_buffer[1]<=-0.0001 && high_15_buffer[1]-close_15_buffer[1]>=0.0029) ||
              (k2_15_buffer[1]-k2_15_buffer[2]<=-2 && k3_15_buffer[1]-k3_15_buffer[2]<=-2) ||
              (ma05_15_buffer[1]-ma05_15_buffer[2]<=0.0006 &&
              (k2_15_buffer[1]-k2_15_buffer[2]<=0 || k3_15_buffer[1]-k3_15_buffer[2]<=0)))) ||
           
                //m30 的 [-4][+3][+2][-1] && [-1]or[+2]為最高 bar實體為0.0008  較易發生條件較嚴
              (close_30_buffer[1]-open_30_buffer[1]<=-0.0008 && close_30_buffer[4]-open_30_buffer[4]<=-0.0008  && 
               close_30_buffer[2]-open_30_buffer[2]>=0.0008 && close_30_buffer[3]-open_30_buffer[3]>=0.0008 &&
               k1_30_buffer[1]-k1_30_buffer[2]<=0  &&  close_30_buffer[1]-open_30_buffer[2]<=-0.0001  &&
              (high_30_buffer[1]==M30highest40bar ||  high_30_buffer[2]==M30highest40bar) &&
              (ma05_30_buffer[1]-ma05_30_buffer[2]<=0 || 
              (close_30_buffer[1]-open_30_buffer[1]<=-0.0001 && high_30_buffer[1]-close_30_buffer[1]>=0.0029) ||
              (k2_30_buffer[1]-k2_30_buffer[2]<=-2 && k3_30_buffer[1]-k3_30_buffer[2]<=-2) ||
              (ma05_30_buffer[1]-ma05_30_buffer[2]<=0.0006 &&
              (k2_30_buffer[1]-k2_30_buffer[2]<=0 || k3_30_buffer[1]-k3_30_buffer[2]<=0)))) ||
                 //m30 的 [-5][+4][+3][+2][-1]  && [-1]or[+2]為最高 bar實體為0.0008  
              (close_30_buffer[1]-open_30_buffer[1]<=-0.0008 && close_30_buffer[5]-open_30_buffer[5]<=-0.0008  && 
               close_30_buffer[2]-open_30_buffer[2]>=0.0008 && close_30_buffer[3]-open_30_buffer[3]>=0.0008 &&
               close_30_buffer[4]-open_30_buffer[4]>=0.0008 &&
               k1_30_buffer[1]-k1_30_buffer[2]<=0  &&  close_30_buffer[1]-open_30_buffer[2]<=-0.0001  &&
              (high_30_buffer[1]==M30highest40bar ||  high_30_buffer[2]==M30highest40bar) &&
              (ma05_30_buffer[1]-ma05_30_buffer[2]<=0.0001 ||  
              (close_30_buffer[1]-open_30_buffer[1]<=-0.0001 && high_30_buffer[1]-close_30_buffer[1]>=0.0029) ||
              (k2_30_buffer[1]-k2_30_buffer[2]<=-2 && k3_30_buffer[1]-k3_30_buffer[2]<=-2) ||
              (ma05_30_buffer[1]-ma05_30_buffer[2]<=0.0006 &&
              (k2_30_buffer[1]-k2_30_buffer[2]<=0 || k3_30_buffer[1]-k3_30_buffer[2]<=0)))) ||
                   
                  //m60 的 [-4][+3][+2][-1] && [-1]or[+2]為最高 bar實體為0.0010  較易發生條件較嚴
              (close_60_buffer[1]-open_60_buffer[2]<=0.0001  &&
               close_60_buffer[1]-open_60_buffer[1]<=-0.0010 && close_60_buffer[4]-open_60_buffer[4]<=-0.0010  && 
               close_60_buffer[2]-open_60_buffer[2]>=0.0010 && close_60_buffer[3]-open_60_buffer[3]>=0.0010 &&
               k1_60_buffer[1]-k1_60_buffer[2]<=0  &&  
              (high_60_buffer[1]==H1highest40bar ||  high_60_buffer[2]==H1highest40bar) &&
              (ma05_60_buffer[1]-ma05_60_buffer[2]<=0 || 
              (close_60_buffer[1]-open_60_buffer[1]<=-0.0001 && high_60_buffer[1]-close_60_buffer[1]>=0.0029) ||
              (k2_60_buffer[1]-k2_60_buffer[2]<=-2 && k3_60_buffer[1]-k3_60_buffer[2]<=-2) ||
              (ma05_60_buffer[1]-ma05_60_buffer[2]<=0.0006 &&
              (k2_60_buffer[1]-k2_60_buffer[2]<=0 || k3_60_buffer[1]-k3_60_buffer[2]<=0)))) ||
                  //m60 的 [-5][+4][+3][+2][-1]  && [-1]or[+2]為最高 bar實體為0.0010  
              (close_60_buffer[1]-open_60_buffer[2]<=0.0001  &&
               close_60_buffer[1]-open_60_buffer[1]<=-0.0010 && close_60_buffer[5]-open_60_buffer[5]<=-0.0010  && 
               close_60_buffer[2]-open_60_buffer[2]>=0.0010 && close_60_buffer[3]-open_60_buffer[3]>=0.0010 &&
               close_60_buffer[4]-open_60_buffer[4]>=0.0010 &&
               k1_60_buffer[1]-k1_60_buffer[2]<=0  &&  
              (high_60_buffer[1]==H1highest40bar ||  high_60_buffer[2]==H1highest40bar) &&
              (ma05_60_buffer[1]-ma05_60_buffer[2]<=0.0001 || 
              (close_60_buffer[1]-open_60_buffer[1]<=-0.0001 && high_60_buffer[1]-close_60_buffer[1]>=0.0029) ||
              (k2_60_buffer[1]-k2_60_buffer[2]<=-2 && k3_60_buffer[1]-k3_60_buffer[2]<=-2) ||
              (ma05_60_buffer[1]-ma05_60_buffer[2]<=0.0006 &&
              (k2_60_buffer[1]-k2_60_buffer[2]<=0 || k3_60_buffer[1]-k3_60_buffer[2]<=0))))) &&
              macdmainline_30_buffer[1]>=-0.00110   &&
                                                          //m60 的45,90,180  皆是斜下
              (macdmainline_60_buffer[1]>=-0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]<=-0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]<=-0.0003 && 
               ma180_60_buffer[1]-ma180_60_buffer[2]<=0)))    
                                      //(m15-61) h4 k1,k2,k3 <=35 don't sell
               if  ((k1_240_buffer[1]<=35 && k2_240_buffer[1]<=35 && k3_240_buffer[1]<=35) ||                   
                                   
                                    //h4  在53下  開口向上  不做賣單
                   (k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3全向上,或h4,m30,m60  kd2,kd3向上開口大 或 k1,k,2,k3在極高
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=25  &&  k3_240_buffer[1]-d3_240_buffer[1]>=25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                    k2_240_buffer[0]<=60 && k3_240_buffer[1]<=60) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]>=10  && k2_240_buffer[1]-d2_240_buffer[1]>=10  &&
                    k3_240_buffer[1]-d3_240_buffer[1]>=10  && k2_240_buffer[0]<=30 && k3_240_buffer[1]<=30) ||
                            //(m15-57) h4  kd1,kd2,kd3>=0   k1,k2,k3<=20 macd<=-0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]>=0  &&  k2_240_buffer[1]-d2_240_buffer[1]>=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=0  &&  k1_240_buffer[0]<=20 && k2_240_buffer[0]<=20 && k3_240_buffer[1]<=20 &&
                    macdmainline_240_buffer[1]<=-0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3>=35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=35) ||
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd差值<=350
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0100  &&  close_240_buffer[2]-open_240_buffer[2]>=0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0020  &&
                   (k1_240_buffer[1]<=50 && k2_240_buffer[1]<=50 && k3_240_buffer[1]<=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3>=4   ma05  [1]-[2]>=0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]>=4  &&  k2_240_buffer[1]-d2_240_buffer[1]>=4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 && k1_240_buffer[1]-k1_240_buffer[2]>=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30  && 
                    k1_240_buffer[1]-k1_240_buffer[2]>=0 &&  k2_240_buffer[1]-k2_240_buffer[2]>=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]>=0 &&  close_240_buffer[1]-open_240_buffer[1]>=0.0001) || 
                   (k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90) ||
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86)) 
                    return;
                    else                        
                    OrderClose(OrderTicket(),lots,Ask,1,Brown);    
       
//+++++++++++++++++++++++++++++++++++++++++++CLOSE   BUY   5   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                  
                                     //m15 上影線超過25點   [1]為負時開-高  [1]為正時收-開
    
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
               (macdmainline_15_buffer[1]>=-0.00099 && macdmainline_15_buffer[1]<=0.00099 &&
                macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                                        //h4  在53下  開口向上  不做賣單
                   (k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3全向上,或h4,m30,m60  kd2,kd3向上開口大 或 k1,k,2,k3在極高
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=25  &&  k3_240_buffer[1]-d3_240_buffer[1]>=25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                    k2_240_buffer[0]<=60 && k3_240_buffer[1]<=60) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]>=10  && k2_240_buffer[1]-d2_240_buffer[1]>=10  &&
                    k3_240_buffer[1]-d3_240_buffer[1]>=10  && k2_240_buffer[0]<=30 && k3_240_buffer[1]<=30) ||
                            //(m15-57) h4  kd1,kd2,kd3>=0   k1,k2,k3<=20 macd<=-0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]>=0  &&  k2_240_buffer[1]-d2_240_buffer[1]>=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=0  &&  k1_240_buffer[0]<=20 && k2_240_buffer[0]<=20 && k3_240_buffer[1]<=20 &&
                    macdmainline_240_buffer[1]<=-0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3>=35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=35) ||
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd差值<=350
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0100  &&  close_240_buffer[2]-open_240_buffer[2]>=0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0020  &&
                   (k1_240_buffer[1]<=50 && k2_240_buffer[1]<=50 && k3_240_buffer[1]<=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3>=4   ma05  [1]-[2]>=0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]>=4  &&  k2_240_buffer[1]-d2_240_buffer[1]>=4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 && k1_240_buffer[1]-k1_240_buffer[2]>=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30  && 
                    k1_240_buffer[1]-k1_240_buffer[2]>=0 &&  k2_240_buffer[1]-k2_240_buffer[2]>=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]>=0 &&  close_240_buffer[1]-open_240_buffer[1]>=0.0001) || 
                   (k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90) ||
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86)) 
                    return;
                    else                        
                      OrderClose(OrderTicket(),lots,Ask,1,Purple);    

//+++++++++++++++++++++++++++++++++++++++++++CLOSE   BUY   6   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                             
                                           //h1 [1] 上影線超過24點   [1]為負時開-高  [1]為正時收-開
    
      if (((close_60_buffer[1]-open_60_buffer[1]<=-0.0001 && close_60_buffer[1]-open_60_buffer[1]<=0.0006  &&
            high_60_buffer[1]-open_60_buffer[1]>=0.0024) ||
           (close_60_buffer[1]-open_60_buffer[1]>=0.0001   && close_60_buffer[1]-open_60_buffer[1]<=0.0006  && 
            high_60_buffer[1]-close_60_buffer[1]>=0.0024) &&
            high_60_buffer[1]==H1highest40bar  && 
            k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 && k3_60_buffer[1]-k3_60_buffer[2]<=0) ||
                                          // [1]<=0 [2] 留上影線
          ((close_60_buffer[1]-open_60_buffer[1]<=-0.0001 && close_60_buffer[1]-open_60_buffer[1]<=0.0006  &&
            high_60_buffer[1]-open_60_buffer[1]>=0.0024) ||
           (close_60_buffer[1]-open_60_buffer[1]>=0.0001   && close_60_buffer[1]-open_60_buffer[1]<=0.0006  && 
            high_60_buffer[1]-close_60_buffer[1]>=0.0024) &&
            high_60_buffer[1]==H1highest40bar  && 
            k1_60_buffer[1]-k1_60_buffer[2]<=5 && k1_60_buffer[1]-d1_60_buffer[1]<=5 && 
            close_60_buffer[1]-open_60_buffer[1]<=0)   &&
          
            macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=0.00200 && 
           macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=-0.00010) 
                                                 //避開超過100點 
           if ((close_60_buffer[2]-open_60_buffer[2]>=0.0100 || close_60_buffer[1]-open_60_buffer[1]>=0.0100 ||
               macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=0.00200 || 
               macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=-0.00050) ||
                                                //避開下跌後之反彈
              (open_60_buffer[3]-open_60_buffer[2]>=-0.0003 && open_60_buffer[4]-open_60_buffer[2]>=-0.0003) ||    
              (open_60_buffer[2]-open_60_buffer[1]>=-0.0003 && open_60_buffer[3]-open_60_buffer[1]>=-0.0003) ||     
               (macdmainline_60_buffer[1]>=-0.00099 && macdmainline_60_buffer[1]<=0.00099 &&
                macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                                     //h4  在53下  開口向上  不做賣單
                   (k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3全向上,或h4,m30,m60  kd2,kd3向上開口大 或 k1,k,2,k3在極高
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=25  &&  k3_240_buffer[1]-d3_240_buffer[1]>=25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                    k2_240_buffer[0]<=60 && k3_240_buffer[1]<=60) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]>=10  && k2_240_buffer[1]-d2_240_buffer[1]>=10  &&
                    k3_240_buffer[1]-d3_240_buffer[1]>=10  && k2_240_buffer[0]<=30 && k3_240_buffer[1]<=30) ||
                            //(m15-57) h4  kd1,kd2,kd3>=0   k1,k2,k3<=20 macd<=-0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]>=0  &&  k2_240_buffer[1]-d2_240_buffer[1]>=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=0  &&  k1_240_buffer[0]<=20 && k2_240_buffer[0]<=20 && k3_240_buffer[1]<=20 &&
                    macdmainline_240_buffer[1]<=-0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3>=35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=35) ||
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd差值<=350
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0100  &&  close_240_buffer[2]-open_240_buffer[2]>=0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0020  &&
                   (k1_240_buffer[1]<=50 && k2_240_buffer[1]<=50 && k3_240_buffer[1]<=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3>=4   ma05  [1]-[2]>=0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]>=4  &&  k2_240_buffer[1]-d2_240_buffer[1]>=4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 && k1_240_buffer[1]-k1_240_buffer[2]>=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30  && 
                    k1_240_buffer[1]-k1_240_buffer[2]>=0 &&  k2_240_buffer[1]-k2_240_buffer[2]>=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]>=0 &&  close_240_buffer[1]-open_240_buffer[1]>=0.0001) || 
                   (k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90) ||
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86)) 
                    return;
                    else                        
                    OrderClose(OrderTicket(),lots,Ask,1,Gold);    
  
//+++++++++++++++++++++++++++++++++++++++++++CLOSE   BUY   7   ++++++++++++++++++++++++++++++++++++++++++++++++++          
            
      
             //(m15-61)       //H4 [2] 留上影線>80點  [1]<[2]
       if  ((close_240_buffer[2]-open_240_buffer[2]<=-0.0001 && high_240_buffer[2]-open_240_buffer[2]>=0.0080) ||
            (close_240_buffer[2]-open_240_buffer[2]>=0.0001   && high_240_buffer[2]-close_240_buffer[2]>=0.0080) &&
             close_240_buffer[1]-open_240_buffer[1]<=-0.0001  && 
                                                          //H4 k1,k2,k3 >=70   || [2]>=0.0250
            ((k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70  &&  k3_240_buffer[1]>=70) || (close_240_buffer[2]-open_240_buffer[2]>=0.0250))) 
        
             OrderClose(OrderTicket(),lots,Ask,1,OrangeRed);    
 
//+++++++++++++++++++++++++++++++++++++++++++CLOSE   BUY   8   ++++++++++++++++++++++++++++++++++++++++++++++++++          
            
         
                     //(m15-62)   h4 的 ma180斜下 或ma180持平 ma360 斜下   
        if   ((ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.0001 ||  (ma180_240_buffer[1]-ma180_240_buffer[2]<=0 &&
               ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.0001)) &&
                  // [1]收在ma180下的20點內  
              (close_240_buffer[1]-ma180_240_buffer[1]<=-0.0001  && close_240_buffer[1]-ma180_240_buffer[1]>=-0.0020) &&
                 //h4 [1]上影線超過30點
             ((close_240_buffer[1]-open_240_buffer[1]<=-0.0001 && high_240_buffer[1]-open_240_buffer[1]>=0.0030) ||
              (close_240_buffer[1]-open_240_buffer[1]>=0.0001   && high_240_buffer[1]-close_240_buffer[1]>=0.0030)) &&
             //kd1<=-3      
               k1_240_buffer[1]-d1_240_buffer[1]<=-3 &&
                  // macd差值<=0.00150  >=-0.00100 
              (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00150 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100) &&
                   // [2]||[3]||[4]收在ma180下的20點內  
             ((close_240_buffer[2]-ma180_240_buffer[2]<=-0.0001  && close_240_buffer[2]-ma180_240_buffer[2]>=-0.0020) ||
              (close_240_buffer[3]-ma180_240_buffer[3]<=-0.0001  && close_240_buffer[3]-ma180_240_buffer[3]>=-0.0020) ||
              (close_240_buffer[4]-ma180_240_buffer[4]<=-0.0001  && close_240_buffer[4]-ma180_240_buffer[4]>=-0.0020)))
                OrderClose(OrderTicket(),lots,Ask,1,OrangeRed);    
    
 //+++++++++++++++++++++++++++++++++++++++++++   CLOSE BUY   9   ++++++++++++++++++++++++++++++++++++++++++++++++++          
 
      
                                  //H4 的 [-4][+3][+2][-1] && [-1]or[+2]為最高 bar實體為0.0030 
        if   ((close_240_buffer[1]-open_240_buffer[1]<=-0.0030 && close_240_buffer[4]-open_240_buffer[4]<=-0.0010  && 
               close_240_buffer[2]-open_240_buffer[2]>=0.0010 && close_240_buffer[3]-open_240_buffer[3]>=0.0010 &&
                     //(m15-61)  [1]下影線小於15點
               low_240_buffer[1]-close_240_buffer[1]<=-0.0015  &&              
                    //(m15-59) kd1,(kd2||kd3)<=3 開口必須縮小
             ((k1_240_buffer[1]-d1_240_buffer[1]<=3  && (k2_240_buffer[1]-d2_240_buffer[1]<=3 || k3_240_buffer[1]-d3_240_buffer[1]<=3)) ||
                  //(m15-61)  macd  差值<=0.00150  >=-0.00100
              (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00150 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100))  &&
               k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  &&
                   //(m15=58)  h4 收盤必須離ma05在10點內     k1,k2,k3必須在55上以免已跌過頭
               ma05_240_buffer[1]- close_240_buffer[1]>=-0.0015 &&  ma05_240_buffer[1]-ma05_240_buffer[2]<=0 &&
               k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70)  ||   // && 
      //        (high_240_buffer[1]==H4highest40bar ||  high_240_buffer[2]==H4highest40bar)) ||
              
               //H4 的 [-5][+4][+3][+2][-1]  && [-1]or[+2]為最高 bar實體為0.0010  [1]<=0.0030 
              (close_240_buffer[1]-open_240_buffer[1]<=-0.0030 && close_240_buffer[5]-open_240_buffer[5]<=-0.0010  && 
               close_240_buffer[2]-open_240_buffer[2]>=0.0010 && close_240_buffer[3]-open_240_buffer[3]>=0.0010 &&
               close_240_buffer[4]-open_240_buffer[4]>=0.0010 &&
                        //(m15-61)  [1]下影線小於15點
               low_240_buffer[1]-close_240_buffer[1]<=-0.0015  &&            
               k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  &&
                            //(m15-59) kd1,(kd2||kd3)<=3 開口必須縮小
             ((k1_240_buffer[1]-d1_240_buffer[1]<=3  && (k2_240_buffer[1]-d2_240_buffer[1]<=3 || k3_240_buffer[1]-d3_240_buffer[1]<=3)) ||
                  //(m15-61)  macd  差值<=0.00150  >=-0.00100
              (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00150 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100))  &&
               k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  &&
                   //(m15=58)  h4 收盤必須離ma05在10點內     k1,k2,k3必須在55上以免已跌過頭
               ma05_240_buffer[1]- close_240_buffer[1]>=-0.0015 && ma05_240_buffer[1]-ma05_240_buffer[2]<=0 &&
               k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) || // && 
                             //在m15之下執行時   下列無法作用
       //     (high_240_buffer[1]==H4highest40bar ||  high_240_buffer[2]==H4highest40bar || high_240_buffer[3]==H4highest40bar)) ||
             
                //   //(m15-61) H4 的 [-2][-1]   下影線在10點內
              (close_240_buffer[1]-open_240_buffer[1]<=-0.0010 && close_240_buffer[2]-open_240_buffer[2]<=-0.0010  && 
                     //  [1][2]下影線小於10點
               low_240_buffer[1]-close_240_buffer[1]<=-0.0010  &&  low_240_buffer[2]-close_240_buffer[2]<=-0.0010  &&             
                    //    k,k2,k3<=-1 
               k1_240_buffer[1]-k1_240_buffer[2]<=-1  && k2_240_buffer[1]-k2_240_buffer[2]<=-1 && k3_240_buffer[1]-k3_240_buffer[2]<=-1 &&
                    //   macd  差值<=0.00100  >=-0.00100
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100  &&
               macdmainline_240_buffer[1]>=0.00350 && 
                      //k1,k2,k3>=85
               k1_240_buffer[1]>=85 && k2_240_buffer[1]>=85 && k3_240_buffer[1]>=85) ||
                    
                             //h4  [4][3][2]>=0.0050 [1]<=-0.0010  ma45[1]-[2]<=-0.0001
              (close_240_buffer[4]-open_240_buffer[4]>=0.0050 && close_240_buffer[3]-open_240_buffer[3]>=0.0050  && 
               close_240_buffer[2]-open_240_buffer[2]>=0.0050 && close_240_buffer[1]-open_240_buffer[1]<=-0.0010 &&
               ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0001) ||
                       //(m15-61) h4  [4]+[3]+[2]>=0.0150 [1]<=-0.0030  [1]-[2]<=0.0010  macd  差值<=0.00100  >=-0.00100
             (((close_240_buffer[4]-open_240_buffer[4])+(close_240_buffer[3]-open_240_buffer[3])+ 
               (close_240_buffer[2]-open_240_buffer[2])>=0.0150) && close_240_buffer[1]-open_240_buffer[1]<=-0.0030 &&
                close_240_buffer[1]-close_240_buffer[2]<=0.0010 &&
                macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100)) 
               if    ((k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90) ||
                      (k1_240_buffer[1]>=87 && k2_240_buffer[1]>=87  &&  k3_240_buffer[1]>=87) || 
                         //(m15-64) [1]||[2]不可升過150點 升太多不好回頭
                      (close_240_buffer[1]-open_240_buffer[1]>=0.0150 || close_240_buffer[2]-open_240_buffer[2]>=0.0150) ||
                        //(m15-64) [1]||[2]不可升過110點   kd1[1]||kd1[2]>=20 
                      (close_240_buffer[1]-open_240_buffer[1]>=0.0110 && k1_240_buffer[1]-d1_240_buffer[1]>=20) ||
                      (close_240_buffer[2]-open_240_buffer[2]>=0.0110 && k1_240_buffer[2]-d1_240_buffer[2]>=20) ||
                              // (m15-64)  kd1,kd2,kd3>=15
                      (k1_240_buffer[1]-d1_240_buffer[1]>=15 && k2_240_buffer[1]-d2_240_buffer[1]>=15 && k3_240_buffer[1]-d3_240_buffer[1]>=15)) 
                       return;
                       else                        
                       OrderClose(OrderTicket(),lots,Ask,1,OrangeRed);    
  //+++++++++++++++++++++++++++++++++++++++++++   CLOSE BUY  10   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                        
                                         //h1 [1] 實黑超過30,50,70,100點   
                                //100 點 [1]-[2]<=0.0001  [1]-[3]<=0.0001
      if   ((((close_60_buffer[1]-open_60_buffer[1]<=-0.0100 && close_60_buffer[1]-close_60_buffer[2]<=0.0001  &&
            close_60_buffer[1]-close_60_buffer[3]<=0.0001 && 
                               //kd1,kd2,kd3<=0  k1,k2,k3>70 
            k1_60_buffer[1]-d1_60_buffer[1]<=0 && k2_60_buffer[1]-d2_60_buffer[1]<=0 && k3_60_buffer[1]-d3_60_buffer[1]<=0 &&
            k1_60_buffer[1]>=70 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70) ||
                               //75 點 [1]-[2]<=0~~~~[1]-[4]<=0 
           (close_60_buffer[1]-open_60_buffer[1]<=-0.0075 && close_60_buffer[1]-close_60_buffer[2]<=0  &&
            close_60_buffer[1]-close_60_buffer[3]<=0 && close_60_buffer[1]-close_60_buffer[4]<=0  &&
                              //kd1,kd2,kd3<=0 k1,k2,k3>70 
            k1_60_buffer[1]-d1_60_buffer[1]<=0 && k2_60_buffer[1]-d2_60_buffer[1]<=0 && k3_60_buffer[1]-d3_60_buffer[1]<=0 &&
            k1_60_buffer[1]>=70 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70) ||
                              //55 點 [1]-[2][3]<=0,[1]-[6]<=0 
           (close_60_buffer[1]-open_60_buffer[1]<=-0.0055 && close_60_buffer[1]-close_60_buffer[2]<=0  &&
            close_60_buffer[1]-close_60_buffer[3]<=0 && close_60_buffer[1]-close_60_buffer[6]<=0  &&
                              //kd1,kd2,kd3<=0 k1,k2,k3>70 
            k1_60_buffer[1]-d1_60_buffer[1]<=0 && k2_60_buffer[1]-d2_60_buffer[1]<=0 && k3_60_buffer[1]-d3_60_buffer[1]<=0 &&
            k1_60_buffer[1]>=70 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70) ||
                          //30 點 [1]-[2]<=0~~~~~[1]-[8]<=0 
           (close_60_buffer[1]-open_60_buffer[1]<=-0.0030 && close_60_buffer[1]-close_60_buffer[2]<=0  &&
            close_60_buffer[1]-close_60_buffer[3]<=0 && close_60_buffer[1]-close_60_buffer[4]<=0  &&
            close_60_buffer[1]-close_60_buffer[5]<=0 && close_60_buffer[1]-close_60_buffer[6]<=0  &&
            close_60_buffer[1]-close_60_buffer[7]<=0 && close_60_buffer[1]-close_60_buffer[8]<=0  &&
                                  //kd1,kd2,kd3<=-2 k2.k3>=85 
            k1_60_buffer[1]-d1_60_buffer[1]<=-2 && k2_60_buffer[1]-d2_60_buffer[1]<=-2 && k3_60_buffer[1]-d3_60_buffer[1]<=-2 &&
            k1_60_buffer[1]>=70 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70))))
                                    //h4  在53下  開口向上  不做賣單
            if    ((k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3全向上,或h4,m30,m60  kd2,kd3向上開口大 或 k1,k,2,k3在極高
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=25  &&  k3_240_buffer[1]-d3_240_buffer[1]>=25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                    k2_240_buffer[0]<=60 && k3_240_buffer[1]<=60) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]>=10  && k2_240_buffer[1]-d2_240_buffer[1]>=10  &&
                    k3_240_buffer[1]-d3_240_buffer[1]>=10  && k2_240_buffer[0]<=30 && k3_240_buffer[1]<=30) ||
                            //(m15-57) h4  kd1,kd2,kd3>=0   k1,k2,k3<=20 macd<=-0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]>=0  &&  k2_240_buffer[1]-d2_240_buffer[1]>=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=0  &&  k1_240_buffer[0]<=20 && k2_240_buffer[0]<=20 && k3_240_buffer[1]<=20 &&
                    macdmainline_240_buffer[1]<=-0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3>=35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=35) ||
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd差值<=350
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0100  &&  close_240_buffer[2]-open_240_buffer[2]>=0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0020  &&
                   (k1_240_buffer[1]<=50 && k2_240_buffer[1]<=50 && k3_240_buffer[1]<=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3>=4   ma05  [1]-[2]>=0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]>=4  &&  k2_240_buffer[1]-d2_240_buffer[1]>=4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 && k1_240_buffer[1]-k1_240_buffer[2]>=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30  && 
                    k1_240_buffer[1]-k1_240_buffer[2]>=0 &&  k2_240_buffer[1]-k2_240_buffer[2]>=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]>=0 &&  close_240_buffer[1]-open_240_buffer[1]>=0.0001) || 
                   (k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90) ||
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86)) 
                    return;
                    else                        
            OrderClose(OrderTicket(),lots,Ask,1,Gold);    
  //+++++++++++++++++++++++++++++++++++++++++++   CLOSE BUY  11   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                      //m30 的 [-4][+3][+2][-1]   [1]<=-0.0030 
         if   ((close_30_buffer[1]-open_30_buffer[1]<=-0.0030 && close_30_buffer[4]-open_30_buffer[4]<=-0.0008  && 
               close_30_buffer[2]-open_30_buffer[2]>=0.0008 && close_30_buffer[3]-open_30_buffer[3]>=0.0008 &&
               k2_30_buffer[1]-d2_30_buffer[1]<=-12 && k3_30_buffer[1]-d3_30_buffer[1]<=-12 &&
               k2_30_buffer[1]>=55 && k3_30_buffer[1]>=55) || 
                       //m30 的 [-5][+4][+3][+2][-1]  [1]<=-0.0015  
              (close_30_buffer[1]-open_30_buffer[1]<=-0.0015 && close_30_buffer[5]-open_30_buffer[5]<=-0.0010  && 
               close_30_buffer[2]-open_30_buffer[2]>=0.0010 && close_30_buffer[3]-open_30_buffer[3]>=0.0010 &&
               close_30_buffer[4]-open_30_buffer[4]>=0.0010 &&
               k2_30_buffer[1]-d2_30_buffer[1]<=-10 && k3_30_buffer[1]-d3_30_buffer[1]<=-10 &&
               k2_30_buffer[1]>=70 && k3_30_buffer[1]>=70) || 
  
                  //m60 的 [-4][+3][+2][-1]   [1]<=-0.0030 
              (close_60_buffer[1]-open_60_buffer[1]<=-0.0030 && close_60_buffer[4]-open_60_buffer[4]<=-0.0010  && 
               close_60_buffer[2]-open_60_buffer[2]>=0.0010 && close_60_buffer[3]-open_60_buffer[3]>=0.0010 &&
               k2_60_buffer[1]-d2_60_buffer[1]<=-10 && k3_60_buffer[1]-d3_60_buffer[1]<=-10 &&
               k2_60_buffer[1]>=45 && k3_60_buffer[1]>=45) || 
                        //m60 的 [-4][+3][+2][-1]   [1]<=-0.0020 
              (close_60_buffer[1]-open_60_buffer[1]<=-0.0020 && close_60_buffer[4]-open_60_buffer[4]<=-0.0007  && 
               close_60_buffer[2]-open_60_buffer[2]>=0.0007 && close_60_buffer[3]-open_60_buffer[3]>=0.0007 &&
               k1_60_buffer[1]-d1_60_buffer[1]<=0 && k2_60_buffer[1]-d2_60_buffer[1]<=-5 && k3_60_buffer[1]-d3_60_buffer[1]<=-5 &&
               k2_60_buffer[1]>=80 && k3_60_buffer[1]>=80) || 
                      //m60 的 [_5][+4][+3][+2][-1]  [1]<=-0.0015  
              (close_60_buffer[1]-open_60_buffer[1]<=-0.0015 && close_60_buffer[5]-open_60_buffer[5]<=-0.0007  && 
               close_60_buffer[2]-open_60_buffer[2]>=0.0007 && close_60_buffer[3]-open_60_buffer[3]>=0.0007 &&
               close_60_buffer[4]-open_60_buffer[4]>=0.0007 &&
               k2_60_buffer[1]-d2_60_buffer[1]<=-4 && k3_60_buffer[1]-d3_60_buffer[1]<=-4 &&
               k2_60_buffer[1]>=65 && k3_60_buffer[1]>=65) || 

                        //m60 的 [+5][-4][+3][-2][+1]  [1]<=-0.0015  
              (close_60_buffer[1]-open_60_buffer[1]<=-0.0015 && close_60_buffer[5]-open_60_buffer[5]<=-0.0007  && 
               close_60_buffer[2]-open_60_buffer[2]>=0.0007 && close_60_buffer[3]-open_60_buffer[3]<=-0.0007 &&
               close_60_buffer[4]-open_60_buffer[4]>=0.0007 &&
               k1_60_buffer[1]-k1_60_buffer[2]<=0 &&  k2_60_buffer[1]-k2_60_buffer[2]<=0 && k3_60_buffer[1]-k3_60_buffer[2]<=0 &&
               k2_60_buffer[1]>=80 && k3_60_buffer[1]>=80)) 
                            //h4  在53下  開口向上  不做賣單 
               if ((k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3全向上,或h4,m30,m60  kd2,kd3向上開口大 或 k1,k,2,k3在極高
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=25  &&  k3_240_buffer[1]-d3_240_buffer[1]>=25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                    k2_240_buffer[0]<=60 && k3_240_buffer[1]<=60) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]>=10  && k2_240_buffer[1]-d2_240_buffer[1]>=10  &&
                    k3_240_buffer[1]-d3_240_buffer[1]>=10  && k2_240_buffer[0]<=30 && k3_240_buffer[1]<=30) ||
                            //(m15-57) h4  kd1,kd2,kd3>=0   k1,k2,k3<=20 macd<=-0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]>=0  &&  k2_240_buffer[1]-d2_240_buffer[1]>=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=0  &&  k1_240_buffer[0]<=20 && k2_240_buffer[0]<=20 && k3_240_buffer[1]<=20 &&
                    macdmainline_240_buffer[1]<=-0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3>=35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=35) ||
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd差值<=350
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0100  &&  close_240_buffer[2]-open_240_buffer[2]>=0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0020  &&
                   (k1_240_buffer[1]<=50 && k2_240_buffer[1]<=50 && k3_240_buffer[1]<=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3>=4   ma05  [1]-[2]>=0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]>=4  &&  k2_240_buffer[1]-d2_240_buffer[1]>=4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]>=4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002 && k1_240_buffer[1]-k1_240_buffer[2]>=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0001) ||
                   (k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30  && 
                    k1_240_buffer[1]-k1_240_buffer[2]>=0 &&  k2_240_buffer[1]-k2_240_buffer[2]>=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]>=0 &&  close_240_buffer[1]-open_240_buffer[1]>=0.0001) || 
                   (k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90) ||
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86)) 
                    return;
                    else                        
                   OrderClose(OrderTicket(),lots,Ask,1,Gold);    
  //+++++++++++++++++++++++++++++++++++++++++++   CLOSE BUY  12   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                             //m30 [2]上影線超過25點   [2]為負時開-高  [2]為正時收-開  
     if  (((close_30_buffer[2]-open_30_buffer[2]<=-0.0001 && high_30_buffer[2]-open_30_buffer[2]>=0.0025) ||
          (close_30_buffer[2]-open_30_buffer[2]>=0.0001  && high_30_buffer[2]-close_30_buffer[2]>=0.0025) &&
          (high_30_buffer[1]==M15highest50bar || high_30_buffer[2]==M15highest50bar) && 
                               //     [1]收負  [1]-[2]<=-0.0001   k1,k2,k3<=0  k1,k2,k3>=80
          (close_30_buffer[1]-open_30_buffer[1]<=-0.0010 && close_30_buffer[1]-close_30_buffer[2]<=-0.0001 &&
           k1_30_buffer[1]-k1_30_buffer[2]<=0 && k2_30_buffer[1]-k2_30_buffer[2]<=0 && k3_30_buffer[1]-k3_30_buffer[2]<=0   &&
           k1_30_buffer[1]>=70 && k2_30_buffer[1]>=70 && k3_30_buffer[1]>=70) ||
             //    [1]收負  [1]-[2]<=-0.0001   k1,(k2||k3)<=0  k1,k2,k3>=70 kd1<=-1
             (close_30_buffer[1]-open_30_buffer[1]<=-0.0001 && close_30_buffer[1]-close_30_buffer[2]<=-0.0001 &&
              k1_30_buffer[1]-k1_30_buffer[2]<=0 && (k2_30_buffer[1]-k2_30_buffer[2]<=0 || k3_30_buffer[1]-k3_30_buffer[2]<=0) &&
              k1_30_buffer[1]-d1_30_buffer[2]<=-1 && 
              k1_30_buffer[1]>=80 && k2_30_buffer[1]>=80 && k3_30_buffer[1]>=80)) ||
                            //m30 [1][2]上影線超過25點   [2]為負時開-高  [2]為正時收-開  [1]<=0.0010
         ((close_30_buffer[1]-open_30_buffer[1]<=-0.0001 && high_30_buffer[1]-open_30_buffer[1]>=0.0025) ||
          (close_30_buffer[1]-open_30_buffer[1]>=0.0001   && close_30_buffer[1]-open_30_buffer[1]<=0.0010   && 
          high_30_buffer[1]-close_30_buffer[1]>=0.0025) &&
          (close_30_buffer[2]-open_30_buffer[2]<=-0.0001 && high_30_buffer[2]-open_30_buffer[2]>=0.0025) ||
          (close_30_buffer[2]-open_30_buffer[2]>=0.0001  && high_30_buffer[2]-close_30_buffer[2]>=0.0025) &&
           k1_30_buffer[1]>=70 && k2_30_buffer[1]>=70 && k3_30_buffer[1]>=70 &&
          (high_30_buffer[1]==M15highest50bar || high_30_buffer[2]==M15highest50bar) && 
                               //     [1]收負  [1]-[2]<=-0.0001   k1,k2,k3<=0  k1,k2,k3>=80
           close_30_buffer[1]-open_30_buffer[1]<=-0.0010 && close_30_buffer[1]-close_30_buffer[2]<=-0.0001 &&
           k1_30_buffer[1]-k1_30_buffer[2]<=0 && k2_30_buffer[1]-k2_30_buffer[2]<=0 && k3_30_buffer[1]-k3_30_buffer[2]<=0   &&
           k1_30_buffer[1]>=70 && k2_30_buffer[1]>=70 && k3_30_buffer[1]>=70) ||
                                 // [1]留上影線超過40點   [2]為負時開-高  k1,k2,k3<=-1  ,k1,k2,k3>=80
         ((close_30_buffer[1]-open_30_buffer[1]>=0.0001  && high_30_buffer[1]-open_30_buffer[1]<=-0.0040) &&
          high_30_buffer[1]==M15highest50bar &&
          k1_30_buffer[1]-k1_30_buffer[2]<=-1 && k2_30_buffer[1]-k2_30_buffer[2]<=-1 && k3_30_buffer[1]-k3_30_buffer[2]<=-1 &&
          k1_30_buffer[1]>=80 && k2_30_buffer[1]>=80 && k3_30_buffer[1]>=80))             
                   
                 
                 
                            //return  else  以下 buy 12   buy13  相同 和 buy1  ~  buy 11  不同
                            //return  else  以下 buy 12   buy13  相同 和 buy1  ~  buy 11  不同
             
              if  ((k2_60_buffer[1]-d2_60_buffer[1]>=25  &&  k3_60_buffer[1]-d3_60_buffer[1]>=25) ||
                   (k1_60_buffer[1]-d1_60_buffer[1]>=10  && k2_60_buffer[1]-d2_60_buffer[1]>=10  &&  k3_60_buffer[1]-d3_60_buffer[1]>=10) ||                                   //h4  k2,k3 在47上  開口向下  不做買單 
                   (k2_60_buffer[1]-d2_60_buffer[1]>=19  &&  k3_60_buffer[1]-d3_60_buffer[1]>=19 && 
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0010  &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0008) ||
                        //h1 [1]>=0.0120  h4   ma05,ma08,ma12>=0.0025
                    (close_60_buffer[1]-open_60_buffer[1]>=0.0120 && ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0025  &&  
                     ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0025  &&  ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0025) ||
                                //h4  在53下  開口向上  不做賣單
                   (k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]<=45 && k3_240_buffer[1]>=45 &&  k1_240_buffer[1]-k1_240_buffer[1]>=10  &&
                   (k2_240_buffer[1]-k2_240_buffer[1]>=10 || k3_240_buffer[1]-k3_240_buffer[1]>=10)) ||
                          //(m15-57)h4  [1]升過140點
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0140) ||
                       //(m15-59) h4  ma45,ma90,ma180其中任二[1]-[2]>=0    [1]>=0.0100
                  ((ma45_240_buffer[1]-ma45_240_buffer[2]>=0 || ma90_240_buffer[1]-ma90_240_buffer[2]>=0) &&
                   (ma90_240_buffer[1]-ma90_240_buffer[2]>=0 || ma180_240_buffer[1]-ma180_240_buffer[2]>=0) &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0100) ||  
                          //(m15-59) h4 k1||k2||k3 <=35 don't sell
                   (k1_240_buffer[1]<=35 || k2_240_buffer[1]<=35 || k3_240_buffer[1]<=35) ||                   

                    //(m15-577)h4  ma45[1][2]>=0.0007  ma90[1][2]>=0.0004  ma45||ma90([1]-[2])-[2]-[3])>=0.0001 ma45,ma90間距>=-0.0400 <=0.0035
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0007  &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0004 &&
                  ((ma45_240_buffer[1]-ma45_240_buffer[2])-(ma45_240_buffer[2]-ma45_240_buffer[3])>=0.0001  ||
                   (ma90_240_buffer[1]-ma90_240_buffer[2])-(ma90_240_buffer[2]-ma90_240_buffer[3])>=0.0001) &&
                           //(m15-58)   ma45在ma90 上但間距>=-0.0350 <=0.0010
                    ma45_240_buffer[1]-ma90_240_buffer[1]>=-0.0350 && ma45_240_buffer[1]-ma90_240_buffer[1]<=0.0010) ||
                          //(m15-58)h4  kd1+kd2+kd3>=49 kd1,kd2,kd3>=7
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=49 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=7 && k2_240_buffer[1]-d2_240_buffer[1]>=7 && k3_240_buffer[1]-d3_240_buffer[1]>=7) ||
                          //(m15-58)h4  kd1+kd2+kd3>=45 kd1,kd2,kd3>=12
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=45 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=12 && k2_240_buffer[1]-d2_240_buffer[1]>=12 && k3_240_buffer[1]-d3_240_buffer[1]>=12) ||
                
                              //(m15-57)h4  [1]升過100點  ma45>=0.0015  || [0]>=0.0150
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0100 && (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0015 ||
                    close_240_buffer[0]-open_240_buffer[0]>=0.0150)) ||
                     //(m15-57)h4 k1>=19  k2,k3[1]-[2]>=2
                   (k1_240_buffer[1]-d1_240_buffer[1]>=19  &&  k2_240_buffer[1]-k2_240_buffer[2]>=2 &&
                    k3_240_buffer[1]-k3_240_buffer[2]>=2) ||
                                 // h4  ma05[1]-ma12[1]>=0.0160  ma05[2]-ma12[2]>=0.0120   ma05[1]-ma05[2]>=0.0030
                   (ma05_240_buffer[1]-ma12_240_buffer[1]>=0.0160  &&  ma05_240_buffer[2]-ma12_240_buffer[2]>=0.0120  &&
                    ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0030) ||
                               //(m15-57)h4   ma05[1]-[2]>=0.0050  ma45[1]-[2]>=0.0007
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0050  &&  ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0007) ||
                     //h4   kd2,kd3>=15 k1>=5   macd>=0.00300
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=5 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300) ||    
                            //h4   kd1,kd2,kd3>=7    macd[1]>=0.00350  macd[2]>=0.00250  (macd[1]-[2]>=0.00070) ||macdmain[1]-[2]>=0.00150  macdsignal[1]-[2]>=0.00070
                   (k2_240_buffer[1]-d2_240_buffer[1]>=7  &&  k3_240_buffer[1]-d3_240_buffer[1]>=7 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=7 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00350 &&
                    macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]>=0.00250 && 
                 (((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1])-(macdmainline_240_buffer[2]-macdsignalline_240_buffer[2])>=0.00070) ||    
                   (macdmainline_240_buffer[1]-macdmainline_240_buffer[2]>=0.00150 && macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2])>=0.00070)) ||
                                //ma45  ma90 >=0.0014
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0014  &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0014) ||
                             //(m15-57)ma45  ma90 >=0.0010   ma45+ma90>=0.0029
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0010  &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0010 &&
                   (ma45_240_buffer[1]-ma45_240_buffer[2])+ (ma90_240_buffer[1]-ma90_240_buffer[2])>=0.0029) ||

                                     //H4 k1,k2,k3全向上,或h4,m30,m60  kd2,kd3向上開口大 或 k1,k,2,k3在極高
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=2 && 
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=25  &&  k3_240_buffer[1]-d3_240_buffer[1]>=25  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                    k2_240_buffer[0]<=60 && k3_240_buffer[1]<=60  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]>=10  && k2_240_buffer[1]-d2_240_buffer[1]>=10  &&
                    k3_240_buffer[1]-d3_240_buffer[1]>=10  && k2_240_buffer[0]<=30 && k3_240_buffer[1]<=30  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                       (k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30  && 
                    k1_240_buffer[1]-k1_240_buffer[2]>=0 &&  k2_240_buffer[1]-k2_240_buffer[2]>=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]>=0 &&  close_240_buffer[1]-open_240_buffer[1]>=0.0001  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                                  //34分 結單後34分之內不動作
                   (OrderType()==OP_SELL && TimeCurrent()-OrderCloseTime()<=2000))
                    return;
                    else                                     
 
                   OrderClose(OrderTicket(),lots,Ask,1,Gold);    

  //+++++++++++++++++++++++++++++++++++++++++++   CLOSE BUY  13   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                        //h1 [2]上影線超過27點   [2]為負時開-高  [2]為正時收-開  
     if  (((close_60_buffer[2]-open_60_buffer[2]<=-0.0001 && high_60_buffer[2]-open_60_buffer[2]>=0.0025) ||
          (close_60_buffer[2]-open_60_buffer[2]>=0.0001   && high_60_buffer[2]-close_60_buffer[2]>=0.0025) &&
          (high_60_buffer[1]==M15highest70bar || high_60_buffer[2]==M15highest70bar) && 
                               //     [1]收負  [1]-[2]<=-0.0001   k1,k2,k3<=0  k1,k2,k3>=80
          (close_60_buffer[1]-open_60_buffer[1]<=-0.0010 && close_60_buffer[1]-close_60_buffer[2]<=-0.0001 &&
           k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 && k3_60_buffer[1]-k3_60_buffer[2]<=0   &&
           k1_60_buffer[1]>=70 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70) ||
          //    [1]收負  [1]-[2]<=-0.0001   k1,(k2||k3)<=0  k1,k2,k3>=70 kd1<=-1
             (close_60_buffer[1]-open_60_buffer[1]<=-0.0001 && close_60_buffer[1]-close_60_buffer[2]<=-0.0001 &&
              k1_60_buffer[1]-k1_60_buffer[2]<=0 && (k2_60_buffer[1]-k2_60_buffer[2]<=0 || k3_60_buffer[1]-k3_60_buffer[2]<=0) &&
              k1_60_buffer[1]-d1_60_buffer[2]<=-1 && 
              k1_60_buffer[1]>=80 && k2_60_buffer[1]>=80 && k3_60_buffer[1]>=80)) ||
                             //h1 [1],[2]上影線超過24點   [2]為負時開-高  [2]為正時收-開  
         ((close_60_buffer[1]-open_60_buffer[1]<=-0.0001 && high_60_buffer[1]-open_60_buffer[1]>=0.0024) ||
          (close_60_buffer[1]-open_60_buffer[1]>=0.0001   && close_30_buffer[1]-open_30_buffer[1]<=0.0010   && 
           high_60_buffer[1]-close_60_buffer[1]>=0.0024) &&
          (close_60_buffer[2]-open_60_buffer[2]<=-0.0001 && high_60_buffer[2]-open_60_buffer[2]>=0.0024) ||
          (close_60_buffer[2]-open_60_buffer[2]>=0.0001   && high_60_buffer[2]-close_60_buffer[2]>=0.0024) &&
           k1_60_buffer[1]>=80 && k2_60_buffer[1]>=80 && k3_60_buffer[1]>=80 &&
          (high_60_buffer[1]==M15highest70bar || high_60_buffer[2]==M15highest70bar)) ||
                                 // [1]留上影線超過40點   [2]為負時開-高  k1,k2,k3<=-1  ,k1,k2,k3>=80
         ((close_60_buffer[1]-open_60_buffer[1]>=0.0001  && high_60_buffer[1]-open_60_buffer[1]<=-0.0040) &&
          high_60_buffer[1]==M15highest70bar &&
          k1_60_buffer[1]-k1_60_buffer[2]<=-1 && k2_60_buffer[1]-k2_60_buffer[2]<=-1 && k3_60_buffer[1]-k3_60_buffer[2]<=-1 &&
          k1_60_buffer[1]>=80 && k2_60_buffer[1]>=80 && k3_60_buffer[1]>=80))                
                    
                 
                            //return  else  以下 buy 12   buy13  相同 和 buy1  ~  buy 11  不同
                            //return  else  以下 buy 12   buy13  相同 和 buy1  ~  buy 11  不同
             
              if  ((k2_60_buffer[1]-d2_60_buffer[1]>=25  &&  k3_60_buffer[1]-d3_60_buffer[1]>=25) ||
                   (k1_60_buffer[1]-d1_60_buffer[1]>=10  && k2_60_buffer[1]-d2_60_buffer[1]>=10  &&  k3_60_buffer[1]-d3_60_buffer[1]>=10) ||                                   //h4  k2,k3 在47上  開口向下  不做買單 
                   (k2_60_buffer[1]-d2_60_buffer[1]>=19  &&  k3_60_buffer[1]-d3_60_buffer[1]>=19 && 
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0010  &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0008) ||
                        //h1 [1]>=0.0120  h4   ma05,ma08,ma12>=0.0025
                    (close_60_buffer[1]-open_60_buffer[1]>=0.0120 && ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0025  &&  
                     ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0025  &&  ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0025) ||
                                //h4  在53下  開口向上  不做賣單
                   (k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]<=45 && k3_240_buffer[1]>=45 &&  k1_240_buffer[1]-k1_240_buffer[1]>=10  &&
                   (k2_240_buffer[1]-k2_240_buffer[1]>=10 || k3_240_buffer[1]-k3_240_buffer[1]>=10)) ||
                          //(m15-57)h4  [1]升過140點
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0140) ||
                       //(m15-59) h4  ma45,ma90,ma180其中任二[1]-[2]>=0    [1]>=0.0100
                  ((ma45_240_buffer[1]-ma45_240_buffer[2]>=0 || ma90_240_buffer[1]-ma90_240_buffer[2]>=0) &&
                   (ma90_240_buffer[1]-ma90_240_buffer[2]>=0 || ma180_240_buffer[1]-ma180_240_buffer[2]>=0) &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0100) ||  
                          //(m15-59) h4 k1||k2||k3 <=35 don't sell
                   (k1_240_buffer[1]<=35 || k2_240_buffer[1]<=35 || k3_240_buffer[1]<=35) ||                   

                    //(m15-577)h4  ma45[1][2]>=0.0007  ma90[1][2]>=0.0004  ma45||ma90([1]-[2])-[2]-[3])>=0.0001 ma45,ma90間距>=-0.0400 <=0.0035
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0007  &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0004 &&
                  ((ma45_240_buffer[1]-ma45_240_buffer[2])-(ma45_240_buffer[2]-ma45_240_buffer[3])>=0.0001  ||
                   (ma90_240_buffer[1]-ma90_240_buffer[2])-(ma90_240_buffer[2]-ma90_240_buffer[3])>=0.0001) &&
                           //(m15-58)   ma45在ma90 上但間距>=-0.0350 <=0.0010
                    ma45_240_buffer[1]-ma90_240_buffer[1]>=-0.0350 && ma45_240_buffer[1]-ma90_240_buffer[1]<=0.0010) ||
                          //(m15-58)h4  kd1+kd2+kd3>=49 kd1,kd2,kd3>=7
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=49 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=7 && k2_240_buffer[1]-d2_240_buffer[1]>=7 && k3_240_buffer[1]-d3_240_buffer[1]>=7) ||
                          //(m15-58)h4  kd1+kd2+kd3>=45 kd1,kd2,kd3>=12
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=45 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=12 && k2_240_buffer[1]-d2_240_buffer[1]>=12 && k3_240_buffer[1]-d3_240_buffer[1]>=12) ||
                
                              //(m15-57)h4  [1]升過100點  ma45>=0.0015  || [0]>=0.0150
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0100 && (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0015 ||
                    close_240_buffer[0]-open_240_buffer[0]>=0.0150)) ||
                     //(m15-57)h4 k1>=19  k2,k3[1]-[2]>=2
                   (k1_240_buffer[1]-d1_240_buffer[1]>=19  &&  k2_240_buffer[1]-k2_240_buffer[2]>=2 &&
                    k3_240_buffer[1]-k3_240_buffer[2]>=2) ||
                                 // h4  ma05[1]-ma12[1]>=0.0160  ma05[2]-ma12[2]>=0.0120   ma05[1]-ma05[2]>=0.0030
                   (ma05_240_buffer[1]-ma12_240_buffer[1]>=0.0160  &&  ma05_240_buffer[2]-ma12_240_buffer[2]>=0.0120  &&
                    ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0030) ||
                               //(m15-57)h4   ma05[1]-[2]>=0.0050  ma45[1]-[2]>=0.0007
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0050  &&  ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0007) ||
                     //h4   kd2,kd3>=15 k1>=5   macd>=0.00300
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=5 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300) ||    
                            //h4   kd1,kd2,kd3>=7    macd[1]>=0.00350  macd[2]>=0.00250  (macd[1]-[2]>=0.00070) ||macdmain[1]-[2]>=0.00150  macdsignal[1]-[2]>=0.00070
                   (k2_240_buffer[1]-d2_240_buffer[1]>=7  &&  k3_240_buffer[1]-d3_240_buffer[1]>=7 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=7 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00350 &&
                    macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]>=0.00250 && 
                 (((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1])-(macdmainline_240_buffer[2]-macdsignalline_240_buffer[2])>=0.00070) ||    
                   (macdmainline_240_buffer[1]-macdmainline_240_buffer[2]>=0.00150 && macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2])>=0.00070)) ||
                                //ma45  ma90 >=0.0014
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0014  &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0014) ||
                             //(m15-57)ma45  ma90 >=0.0010   ma45+ma90>=0.0029
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0010  &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0010 &&
                   (ma45_240_buffer[1]-ma45_240_buffer[2])+ (ma90_240_buffer[1]-ma90_240_buffer[2])>=0.0029) ||

                                     //H4 k1,k2,k3全向上,或h4,m30,m60  kd2,kd3向上開口大 或 k1,k,2,k3在極高
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=2 && 
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=25  &&  k3_240_buffer[1]-d3_240_buffer[1]>=25  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                    k2_240_buffer[0]<=60 && k3_240_buffer[1]<=60  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]>=10  && k2_240_buffer[1]-d2_240_buffer[1]>=10  &&
                    k3_240_buffer[1]-d3_240_buffer[1]>=10  && k2_240_buffer[0]<=30 && k3_240_buffer[1]<=30  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                       (k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30  && 
                    k1_240_buffer[1]-k1_240_buffer[2]>=0 &&  k2_240_buffer[1]-k2_240_buffer[2]>=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]>=0 &&  close_240_buffer[1]-open_240_buffer[1]>=0.0001  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 區間外允許做賣單
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                                  //34分 結單後34分之內不動作
                   (OrderType()==OP_SELL && TimeCurrent()-OrderCloseTime()<=2000))
                    return;
                    else                                     
                   OrderClose(OrderTicket(),lots,Ask,1,Gold);    
  
  //+++++++++++++++++++++++++++++++++++++++++++   CLOSE BUY  14   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                 //(m15-62) h1    macd>=0.00870   差值在-50,+50間         發生的機率不多所以不使用狀況排除法
        if    (macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=0.00040 && macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=-0.00040 &&
               macdmainline_60_buffer[1]>=0.00870 &&
                    //k1,k2,k3  [1]-[2]<=0   k1,k2,k3>=70 || ma180 ,ma360斜下
               k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 && 
               k3_60_buffer[1]-k3_60_buffer[2]<=0 && 
             ((k1_60_buffer[1]>=70 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70) || (ma180_60_buffer[1]-ma180_60_buffer[2]<=-0.0001 &&
               ma360_60_buffer[1]-ma360_60_buffer[2]<=-0.0001)))
                          //ma45  ,ma90,ma180,ma360  斜上
               if   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0011 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0008 &&
                     ma180_240_buffer[1]-ma180_240_buffer[2]>=0.0004 && ma360_240_buffer[1]-ma360_240_buffer[2]>=0.0001)
                     return;
                     else 
                     OrderClose(OrderTicket(),lots,Ask,1,Sienna);    
              
  //+++++++++++++++++++++++++++++++++++++++++++   CLOSE BUY  15   ++++++++++++++++++++++++++++++++++++++++++++++++++          

      
                 //(m15-63)  H4     [2][3]收紅<9點     [1]收黑  留上影線>30點   
       if    (close_240_buffer[1]-open_240_buffer[1]<=-0.0010 && high_240_buffer[1]-open_240_buffer[1]>=0.0030 &&
              close_240_buffer[2]-open_240_buffer[2]>=0.0009  && close_240_buffer[3]-open_240_buffer[3]>=0.0009  &&   
               // ma45 ma90 || ma90 ma180  斜下且大
            ((ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0008 &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002) ||
             (ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0006 &&  ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.0002)) &&
                // [1]收盤在ma05之下  不超過15點
              close_240_buffer[1]-ma05_240_buffer[1]<=-0.0001  && close_240_buffer[1]-ma05_240_buffer[1]>=-0.0015) 
      
              OrderClose(OrderTicket(),lots,Ask,1,Sienna);    

            
    
    
      }


      if  (OrderType()==OP_SELL)
       {  

//+++++++++++++++++++++++++++++++++++++++++++  CLOSE  sell   1   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                                  //m15 的ma45  ma90 為斜L下跌末端型態 ma45[1]-[6]為確認為下跌 
        if (((ma45_15_buffer[1]-ma45_15_buffer[2]>=0 &&  ma45_15_buffer[1]-ma45_15_buffer[6]<=0) ||
                                                 //雖為下跌但h4 [1]尚為正大於20點
             (ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=-0.0001 && 
                           //h4 收紅 且上影線<=0.0006
              close_240_buffer[1]-open_240_buffer[1]>=0.0020 && high_240_buffer[1]-close_240_buffer[1]<=0.0055 )) && 
            
              ma90_15_buffer[1]-ma90_15_buffer[2]<=-0.0001 && 
                                                 //下跌末端上升要一次升過前3bar
              close_15_buffer[1]-close_15_buffer[2]>=0.0001  && // close_15_buffer[1]-close_15_buffer[3]>=0.0001 &&
      //        close_15_buffer[1]-close_15_buffer[4]>=0.0001  &&
                                             //用m15 m30 macd 控管買賣點 
              macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00010 &&
              macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]>=-0.00050 &&  macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00020 &&
              macdmainline_30_buffer[1]<=0.00110   &&   
                                                         //m60 的45,90,180  皆是斜上
             (macdmainline_60_buffer[1]<=0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]>=0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0.0003 && 
              ma180_60_buffer[1]-ma180_60_buffer[2]>=0)) &&    
                                           //k1 (k2||k3)已上升
              k1_15_buffer[1]-k1_15_buffer[2]>=1  &&  k1_15_buffer[1]-d1_15_buffer[1]>=1 &&
              k2_15_buffer[1]-k2_15_buffer[2]>=0  ||  k3_15_buffer[1]-k3_15_buffer[2]>=0)
              if ((macdmainline_15_buffer[1]>=-0.00099 && macdmainline_15_buffer[1]<=0.00099 &&
                   macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                  (k2_30_buffer[1]-d2_30_buffer[1]<=-19  &&  k3_30_buffer[1]-d3_30_buffer[1]<=-19) ||
                  (k2_60_buffer[1]-d2_60_buffer[1]<=-19  &&  k3_60_buffer[1]-d3_60_buffer[1]<=-19) ||
                                    //h4  k2,k3 在47上  開口向下  不做買單 
                   (k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3全向下,或 h4,m30,m60 kd2,kd3向下開口大 或 k1,k,2,k3在極低
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-25  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                    k2_240_buffer[0]>=40 && k3_240_buffer[1]>=40) ||
                            //h4  kd1,kd2,kd3<=-10   k2,k3>=70   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-10  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-10  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-10  &&  k2_240_buffer[0]>=70 && k3_240_buffer[1]>=70) ||
                               //(m15-57) h4  kd1,kd2,kd3<=0   k1,k2,k3>=80 macd>=0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=0  &&  k2_240_buffer[1]-d2_240_buffer[1]<=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=0  &&  k1_240_buffer[0]>=80 && k2_240_buffer[0]>=80 && k3_240_buffer[1]>=80 &&
                    macdmainline_240_buffer[1]>=0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3<=-35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-35) ||
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd差值>=-350
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0100  &&  close_240_buffer[2]-open_240_buffer[2]<=-0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0020  &&
                   (k1_240_buffer[1]>=50 && k2_240_buffer[1]>=50 && k3_240_buffer[1]>=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3<=-4   ma05  [1]-[2]<=-0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-4  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 && k1_240_buffer[1]-k1_240_buffer[2]<=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  && 
                    k1_240_buffer[1]-k1_240_buffer[2]<=0 &&  k2_240_buffer[1]-k2_240_buffer[2]<=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]<=0 &&  close_240_buffer[1]-open_240_buffer[1]<=-0.0001) || 
                   (k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10) ||
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14)) 
                    return;
                    else                    
                  OrderClose(OrderTicket(),lots,Bid,1,White); 
 //+++++++++++++++++++++++++++++++++++++++++++  CLOSE  sell   2   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                    
                         // h1 k123在下方 皆為上升
          if  (k1_60_buffer[1]<=15 && k2_60_buffer[1]<=15 && k3_60_buffer[1]<=15  && 
               k1_60_buffer[1]-k1_60_buffer[2]>=8 &&  k2_60_buffer[1]-k2_60_buffer[2]>=0 &&  k3_60_buffer[1]-k3_60_buffer[2]>=0 &&
                                  //[1]收盤大於20點 大於[2][3][4] ma05    10點上
               close_60_buffer[1]-open_60_buffer[1]>=0.0020 && close_60_buffer[1]-close_60_buffer[2]>=0.0010 &&
               close_60_buffer[1]-close_60_buffer[3]>=0.0010 && close_60_buffer[1]-close_60_buffer[4]>=0.0010 &&
               close_60_buffer[1]-ma05_60_buffer[1]>=0.0010 && 
         
               macdmainline_30_buffer[1]<=0.00110   &&   
                                                         //m60 的45,90,180  皆是斜上
              (macdmainline_60_buffer[1]<=0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]>=0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0.0003 && 
               ma180_60_buffer[1]-ma180_60_buffer[2]>=0)))     
                                      //h4  k2,k3 在47上  開口向下  不做買單 
               if ((k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3全向下,或 h4,m30,m60 kd2,kd3向下開口大 或 k1,k,2,k3在極低
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-25  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                    k2_240_buffer[0]>=40 && k3_240_buffer[1]>=40) ||
                            //h4  kd1,kd2,kd3<=-10   k2,k3>=70   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-10  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-10  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-10  &&  k2_240_buffer[0]>=70 && k3_240_buffer[1]>=70) ||
                               //(m15-57) h4  kd1,kd2,kd3<=0   k1,k2,k3>=80 macd>=0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=0  &&  k2_240_buffer[1]-d2_240_buffer[1]<=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=0  &&  k1_240_buffer[0]>=80 && k2_240_buffer[0]>=80 && k3_240_buffer[1]>=80 &&
                    macdmainline_240_buffer[1]>=0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3<=-35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-35) ||
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd差值>=-350
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0100  &&  close_240_buffer[2]-open_240_buffer[2]<=-0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0020  &&
                   (k1_240_buffer[1]>=50 && k2_240_buffer[1]>=50 && k3_240_buffer[1]>=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3<=-4   ma05  [1]-[2]<=-0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-4  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 && k1_240_buffer[1]-k1_240_buffer[2]<=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  && 
                    k1_240_buffer[1]-k1_240_buffer[2]<=0 &&  k2_240_buffer[1]-k2_240_buffer[2]<=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]<=0 &&  close_240_buffer[1]-open_240_buffer[1]<=-0.0001) || 
                   (k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10) ||
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14)) 
                    return;
                    else                    
                    OrderClose(OrderTicket(),lots,Bid,1,Green); 
                       
//+++++++++++++++++++++++++++++++++++++++++++  CLOSE  sell   3   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                                    
                                                                                                //k1 一次上升大 kd1大幅交叉上 
         if ((k1_15_buffer[1]-k1_15_buffer[2]>=10  &&  k1_15_buffer[1]-d1_15_buffer[1]>=5  && close_15_buffer[1]-open_15_buffer[1]>=0.0002 &&
                                                   //設限以防過高再買進  
              k1_15_buffer[1]<=60 && k2_15_buffer[2]<=60  &&  k3_15_buffer[1]<=60 && 
                                                   //m15 的ma45  ma90 為斜L下跌末端型態 
             (ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0) || 
             (ma90_15_buffer[1]-ma90_15_buffer[2]>=0 && ma180_15_buffer[1]-ma180_15_buffer[2]>=0) &&                                  //下跌末端上升要一次升過前3bar
                                                        // 買單時 m30 m60 不可在過高位置
              macdmainline_30_buffer[1]<=0.00110   &&   
                                                         //m60 的45,90,180  皆是斜上
             (macdmainline_60_buffer[1]<=0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]>=0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0.0003 && 
              ma180_60_buffer[1]-ma180_60_buffer[2]>=0)) &&    
                                             //用m15 m30 macd 控管買賣點 
              macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00010 &&
              macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]>=-0.00050 &&  macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00020))
              if ((macdmainline_15_buffer[1]>=-0.00099 && macdmainline_15_buffer[1]<=0.00099 &&
                   macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                    //(m15-62) h4 k1,k2,k3 >=70 don't buy
                  (k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||                   
                       //(m15-64) h4 [1]為負並小於30點  kd2,kd3<=-10
                  (close_240_buffer[1]-open_240_buffer[1]<=-0.0030 &&                          
                   k2_240_buffer[1]-d2_240_buffer[1]<=-10 && k3_240_buffer[1]-d3_240_buffer[1]<=-10) ||                        
                                         
                                            
                                             //h4  k2,k3 在47上  開口向下  不做買單 
                   (k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3全向下,或 h4,m30,m60 kd2,kd3向下開口大 或 k1,k,2,k3在極低
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-25  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                    k2_240_buffer[0]>=40 && k3_240_buffer[1]>=40) ||
                            //h4  kd1,kd2,kd3<=-10   k2,k3>=70   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-10  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-10  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-10  &&  k2_240_buffer[0]>=70 && k3_240_buffer[1]>=70) ||
                               //(m15-57) h4  kd1,kd2,kd3<=0   k1,k2,k3>=80 macd>=0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=0  &&  k2_240_buffer[1]-d2_240_buffer[1]<=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=0  &&  k1_240_buffer[0]>=80 && k2_240_buffer[0]>=80 && k3_240_buffer[1]>=80 &&
                    macdmainline_240_buffer[1]>=0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3<=-35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-35) ||
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd差值>=-350
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0100  &&  close_240_buffer[2]-open_240_buffer[2]<=-0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0020  &&
                   (k1_240_buffer[1]>=50 && k2_240_buffer[1]>=50 && k3_240_buffer[1]>=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3<=-4   ma05  [1]-[2]<=-0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-4  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 && k1_240_buffer[1]-k1_240_buffer[2]<=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  && 
                    k1_240_buffer[1]-k1_240_buffer[2]<=0 &&  k2_240_buffer[1]-k2_240_buffer[2]<=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]<=0 &&  close_240_buffer[1]-open_240_buffer[1]<=-0.0001) || 
                   (k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10) ||
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14)) 
                    return;
                    else                    
                    OrderClose(OrderTicket(),lots,Bid,1,Lime); 
   
//+++++++++++++++++++++++++++++++++++++++++++  CLOSE  sell   4   ++++++++++++++++++++++++++++++++++++++++++++++++++          
            //m15 的 [+4][-3][-2][+1]  && [+1]or[-2]為最低 bar實體為0.0006  較易發生條件較嚴
        if  (((close_15_buffer[1]-open_15_buffer[1]>=0.0006 && close_15_buffer[4]-open_15_buffer[4]>=0.0006  && 
               close_15_buffer[2]-open_15_buffer[2]<=-0.0006 && close_15_buffer[3]-open_15_buffer[3]<=-0.0006 &&
               k1_15_buffer[1]-k1_15_buffer[2]>=0  && close_15_buffer[1]-close_15_buffer[3]>=0.0001 &&
              (low_15_buffer[1]==M15lowest40bar ||  low_15_buffer[2]==M15lowest40bar) && 
              (ma05_15_buffer[1]-ma05_15_buffer[2]>=0 || 
              (close_15_buffer[1]-open_15_buffer[1]>=0.0001  && low_15_buffer[1]-close_15_buffer[1]<=-0.0029) ||
              (k2_15_buffer[1]-k2_15_buffer[2]>=2 && k3_15_buffer[1]-k3_15_buffer[2]>=2) ||
              (ma05_15_buffer[1]-ma05_15_buffer[2]>=-0.0006 && 
              (k2_15_buffer[1]-k2_15_buffer[2]>=0 || k3_15_buffer[1]-k3_15_buffer[2]>=0)))) ||
               
                //m15 的 [+5][-4][-3][-2][+1]  && [+1]or[-2]為最低 bar實體為0.0006  
              (close_15_buffer[1]-open_15_buffer[1]>=0.0006 && close_15_buffer[5]-open_15_buffer[5]>=0.0006  && 
               close_15_buffer[2]-open_15_buffer[2]<=-0.0006 && close_15_buffer[3]-open_15_buffer[3]<=-0.0006 &&
               close_15_buffer[4]-open_15_buffer[4]<=-0.0006 &&
               k1_15_buffer[1]-k1_15_buffer[2]>=0  && close_15_buffer[1]-close_15_buffer[3]>=0.0001 &&
              (low_15_buffer[1]==M15lowest40bar ||  low_15_buffer[2]==M15lowest40bar) && 
              (ma05_15_buffer[1]-ma05_15_buffer[2]>=-0.0001 || 
              (close_15_buffer[1]-open_15_buffer[1]>=0.0001  && low_15_buffer[1]-close_15_buffer[1]<=-0.0029) ||
              (k2_15_buffer[1]-k2_15_buffer[2]>=2 && k3_15_buffer[1]-k3_15_buffer[2]>=2) ||
              (ma05_15_buffer[1]-ma05_15_buffer[2]>=-0.0006 && 
              (k2_15_buffer[1]-k2_15_buffer[2]>=0 || k3_15_buffer[1]-k3_15_buffer[2]>=0)))) ||
               
                 //m30 的 [+4][-3][-2][+1]  && [+1]or[-2]為最低 bar實體為0.0008  較易發生條件較嚴
              (close_30_buffer[1]-open_30_buffer[1]>=0.0008 && close_30_buffer[4]-open_30_buffer[4]>=0.0008  && 
               close_30_buffer[2]-open_30_buffer[2]<=-0.0008 && close_30_buffer[3]-open_30_buffer[3]<=-0.0008 &&
               k1_30_buffer[1]-k1_30_buffer[2]>=0  && close_30_buffer[1]-close_30_buffer[3]>=0.0001 &&
              (low_30_buffer[1]==M30lowest40bar ||  low_30_buffer[2]==M30lowest40bar) && 
              (ma05_30_buffer[1]-ma05_30_buffer[2]>=0 || 
              (close_30_buffer[1]-open_30_buffer[1]>=0.0001  && low_30_buffer[1]-close_30_buffer[1]<=-0.0029) ||
              (k2_30_buffer[1]-k2_30_buffer[2]>=2 && k3_30_buffer[1]-k3_30_buffer[2]>=2) ||
              (ma05_30_buffer[1]-ma05_30_buffer[2]>=-0.0006 && 
              (k2_30_buffer[1]-k2_30_buffer[2]>=0 || k3_30_buffer[1]-k3_30_buffer[2]>=0)))) ||
                  //m30 的 [+5][-4][-3][-2][+1]  && [+1]or[-2]為最低 bar實體為0.0008  
              (close_30_buffer[1]-open_30_buffer[1]>=0.0008 && close_30_buffer[5]-open_30_buffer[5]>=0.0008  && 
               close_30_buffer[2]-open_30_buffer[2]<=-0.0008 && close_30_buffer[3]-open_30_buffer[3]<=-0.0008 &&
               close_30_buffer[4]-open_30_buffer[4]<=-0.0008 &&
               k1_30_buffer[1]-k1_30_buffer[2]>=0  && close_30_buffer[1]-close_30_buffer[3]>=0.0001 &&
              (low_30_buffer[1]==M30lowest40bar ||  low_30_buffer[2]==M30lowest40bar) && 
              (ma05_30_buffer[1]-ma05_30_buffer[2]>=-0.0001 || 
              (close_30_buffer[1]-open_30_buffer[1]>=0.0001  && low_30_buffer[1]-close_30_buffer[1]<=-0.0029) ||
              (k2_30_buffer[1]-k2_30_buffer[2]>=2 && k3_30_buffer[1]-k3_30_buffer[2]>=2) ||
              (ma05_30_buffer[1]-ma05_30_buffer[2]>=-0.0006 && 
              (k2_30_buffer[1]-k2_30_buffer[2]>=0 || k3_30_buffer[1]-k3_30_buffer[2]>=0)))) ||
             
                  //m60 的 [+4][-3][-2][+1]  && [+1]or[-2]為最低 bar實體為0.0010  較易發生條件較嚴
              (close_60_buffer[1]-open_60_buffer[2]>=-0.0001  &&
               close_60_buffer[1]-open_60_buffer[1]>=0.0010 && close_60_buffer[4]-open_60_buffer[4]>=0.0010  && 
               close_60_buffer[2]-open_60_buffer[2]<=-0.0010 && close_60_buffer[3]-open_60_buffer[3]<=-0.0010 &&
               k1_60_buffer[1]-k1_60_buffer[2]>=0  && 
              (low_60_buffer[1]==H1lowest40bar ||  low_60_buffer[2]==H1lowest40bar) && 
              (ma05_60_buffer[1]-ma05_60_buffer[2]>=0 || 
              (close_60_buffer[1]-open_60_buffer[1]>=0.0001  && low_60_buffer[1]-close_60_buffer[1]<=-0.0029) ||
              (k2_60_buffer[1]-k2_60_buffer[2]>=2 && k3_60_buffer[1]-k3_60_buffer[2]>=2) ||
              (ma05_60_buffer[1]-ma05_60_buffer[2]>=-0.0006 && 
              (k2_60_buffer[1]-k2_60_buffer[2]>=0 || k3_60_buffer[1]-k3_60_buffer[2]>=0)))) ||
                    //m60 的 [+5][-4][-3][-2][+1]  && [+1]or[-2]為最低 bar實體為0.0010  
              (close_60_buffer[1]-open_60_buffer[2]>=-0.0001  &&
               close_60_buffer[1]-open_60_buffer[1]>=0.0010 && close_60_buffer[5]-open_60_buffer[5]>=0.0010  && 
               close_60_buffer[2]-open_60_buffer[2]<=-0.0010 && close_60_buffer[3]-open_60_buffer[3]<=-0.0010 &&
               close_60_buffer[4]-open_60_buffer[4]<=-0.0010 &&
               k1_60_buffer[1]-k1_60_buffer[2]>=0  &&
              (low_60_buffer[1]==H1lowest40bar ||  low_60_buffer[2]==H1lowest40bar) && 
              (ma05_60_buffer[1]-ma05_60_buffer[2]>=-0.0001 || 
              (close_60_buffer[1]-open_60_buffer[1]>=0.0001  && low_60_buffer[1]-close_60_buffer[1]<=-0.0029) ||
              (k2_60_buffer[1]-k2_60_buffer[2]>=2 && k3_60_buffer[1]-k3_60_buffer[2]>=2) ||
              (ma05_60_buffer[1]-ma05_60_buffer[2]>=-0.0006 && 
              (k2_60_buffer[1]-k2_60_buffer[2]>=0 || k3_60_buffer[1]-k3_60_buffer[2]>=0))))) &&
               
              macdmainline_30_buffer[1]<=0.00110   &&   
                                                         //m60 的45,90,180  皆是斜上
             (macdmainline_60_buffer[1]<=0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]>=0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0.0003 && 
              ma180_60_buffer[1]-ma180_60_buffer[2]>=0)))    
                                           //(m15-61) h4 k1,k2,k3 >=65 don't buy
              if   ((k1_240_buffer[1]>=65 && k2_240_buffer[1]>=65 && k3_240_buffer[1]>=65) ||                   
                    
                              //h4  k2,k3 在47上  開口向下  不做買單 
                   (k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3全向下,或 h4,m30,m60 kd2,kd3向下開口大 或 k1,k,2,k3在極低
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-25  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                    k2_240_buffer[0]>=40 && k3_240_buffer[1]>=40) ||
                            //h4  kd1,kd2,kd3<=-10   k2,k3>=70   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-10  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-10  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-10  &&  k2_240_buffer[0]>=70 && k3_240_buffer[1]>=70) ||
                               //(m15-57) h4  kd1,kd2,kd3<=0   k1,k2,k3>=80 macd>=0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=0  &&  k2_240_buffer[1]-d2_240_buffer[1]<=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=0  &&  k1_240_buffer[0]>=80 && k2_240_buffer[0]>=80 && k3_240_buffer[1]>=80 &&
                    macdmainline_240_buffer[1]>=0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3<=-35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-35) ||
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd差值>=-350
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0100  &&  close_240_buffer[2]-open_240_buffer[2]<=-0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0020  &&
                   (k1_240_buffer[1]>=50 && k2_240_buffer[1]>=50 && k3_240_buffer[1]>=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3<=-4   ma05  [1]-[2]<=-0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-4  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 && k1_240_buffer[1]-k1_240_buffer[2]<=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  && 
                    k1_240_buffer[1]-k1_240_buffer[2]<=0 &&  k2_240_buffer[1]-k2_240_buffer[2]<=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]<=0 &&  close_240_buffer[1]-open_240_buffer[1]<=-0.0001) || 
                   (k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10) ||
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14)) 
                    return;
                    else                    
                   OrderClose(OrderTicket(),lots,Bid,1,Gray); 
    
//+++++++++++++++++++++++++++++++++++++++++++CLOSE   SELL   5   ++++++++++++++++++++++++++++++++++++++++++++++++++          
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
                  (macdmainline_15_buffer[1]>=-0.00099 && macdmainline_15_buffer[1]<=0.00099 &&
                   macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                                   //h4  k2,k3 在47上  開口向下  不做買單 
                   (k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3全向下,或 h4,m30,m60 kd2,kd3向下開口大 或 k1,k,2,k3在極低
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-25  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                    k2_240_buffer[0]>=40 && k3_240_buffer[1]>=40) ||
                            //h4  kd1,kd2,kd3<=-10   k2,k3>=70   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-10  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-10  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-10  &&  k2_240_buffer[0]>=70 && k3_240_buffer[1]>=70) ||
                               //(m15-57) h4  kd1,kd2,kd3<=0   k1,k2,k3>=80 macd>=0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=0  &&  k2_240_buffer[1]-d2_240_buffer[1]<=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=0  &&  k1_240_buffer[0]>=80 && k2_240_buffer[0]>=80 && k3_240_buffer[1]>=80 &&
                    macdmainline_240_buffer[1]>=0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3<=-35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-35) ||
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd差值>=-350
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0100  &&  close_240_buffer[2]-open_240_buffer[2]<=-0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0020  &&
                   (k1_240_buffer[1]>=50 && k2_240_buffer[1]>=50 && k3_240_buffer[1]>=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3<=-4   ma05  [1]-[2]<=-0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-4  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 && k1_240_buffer[1]-k1_240_buffer[2]<=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  && 
                    k1_240_buffer[1]-k1_240_buffer[2]<=0 &&  k2_240_buffer[1]-k2_240_buffer[2]<=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]<=0 &&  close_240_buffer[1]-open_240_buffer[1]<=-0.0001) || 
                   (k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10) ||
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14)) 
                    return;
                    else                    
                   OrderClose(OrderTicket(),lots,Bid,1,Aqua); 
  
//+++++++++++++++++++++++++++++++++++++++++++CLOSE   SELL   6   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                  //h1 [1]留下影線 >=24點  [1]>0.0001開-低  [1]<-0.0001收-低
       if  (((close_60_buffer[1]-open_60_buffer[1]<=-0.0001 && close_60_buffer[1]-open_60_buffer[1]>=-0.0006 && 
              low_60_buffer[1]-close_60_buffer[1]<=-0.0024) ||
             (close_60_buffer[1]-open_60_buffer[1]>=0.0001  && close_60_buffer[1]-open_60_buffer[1]>=-0.0006 && 
              low_60_buffer[1]-open_60_buffer[1]<=-0.0024) &&
              low_60_buffer[1]==H1lowest40bar &&
              k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 && k3_60_buffer[1]-k3_60_buffer[2]>=0) ||
                                         //[1]收紅 [2]留下影線
             ((close_60_buffer[2]-open_60_buffer[2]<=-0.0001 && close_60_buffer[2]-open_60_buffer[2]>=-0.0006 && 
              low_60_buffer[2]-close_60_buffer[2]<=-0.0024) ||
             (close_60_buffer[2]-open_60_buffer[2]>=0.0001  && close_60_buffer[1]-open_60_buffer[1]>=-0.0006 && 
              low_60_buffer[2]-open_60_buffer[2]<=-0.0024) &&
              low_60_buffer[2]==H1lowest40bar &&
              k1_60_buffer[1]-k1_60_buffer[2]>=5 && k1_60_buffer[1]-d1_60_buffer[1]>=5 &&  
              close_60_buffer[1]-open_60_buffer[1]>=0)  && 
              macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=-0.0200 && 
              macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=0.00010) 
              
              if ((close_60_buffer[2]-open_60_buffer[2]<=-0.0100 || close_60_buffer[1]-open_60_buffer[1]<=-0.0100 ||
                   macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=-0.00200 || 
                   macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=0.00050) ||
                                                 //避開下跌後之反彈
                  (open_60_buffer[3]-open_60_buffer[2]<=0.0003 && open_60_buffer[4]-open_60_buffer[2]<=0.0003) ||    
                  (open_60_buffer[2]-open_60_buffer[1]<=0.0003 && open_60_buffer[3]-open_60_buffer[1]<=0.0003) ||     
                  (macdmainline_60_buffer[1]>=-0.00099 && macdmainline_60_buffer[1]<=0.00099 &&
                   macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                                        //h4  k2,k3 在47上  開口向下  不做買單 
                   (k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3全向下,或 h4,m30,m60 kd2,kd3向下開口大 或 k1,k,2,k3在極低
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-25  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                    k2_240_buffer[0]>=40 && k3_240_buffer[1]>=40) ||
                            //h4  kd1,kd2,kd3<=-10   k2,k3>=70   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-10  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-10  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-10  &&  k2_240_buffer[0]>=70 && k3_240_buffer[1]>=70) ||
                               //(m15-57) h4  kd1,kd2,kd3<=0   k1,k2,k3>=80 macd>=0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=0  &&  k2_240_buffer[1]-d2_240_buffer[1]<=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=0  &&  k1_240_buffer[0]>=80 && k2_240_buffer[0]>=80 && k3_240_buffer[1]>=80 &&
                    macdmainline_240_buffer[1]>=0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3<=-35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-35) ||
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd差值>=-350
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0100  &&  close_240_buffer[2]-open_240_buffer[2]<=-0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0020  &&
                   (k1_240_buffer[1]>=50 && k2_240_buffer[1]>=50 && k3_240_buffer[1]>=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3<=-4   ma05  [1]-[2]<=-0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-4  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 && k1_240_buffer[1]-k1_240_buffer[2]<=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  && 
                    k1_240_buffer[1]-k1_240_buffer[2]<=0 &&  k2_240_buffer[1]-k2_240_buffer[2]<=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]<=0 &&  close_240_buffer[1]-open_240_buffer[1]<=-0.0001) || 
                   (k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10) ||
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14)) 
                    return;
                    else                    
                  OrderClose(OrderTicket(),lots,Bid,1,Teal); 
 
//+++++++++++++++++++++++++++++++++++++++++++CLOSE   SELL   7   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                            //(m15-61)  H4     [2]留下影線>80點  [1]>=[2] 
       if  ((close_240_buffer[2]-open_240_buffer[2]<=-0.0001 && low_240_buffer[2]-close_240_buffer[2]<=-0.0080) ||
             (close_240_buffer[2]-open_240_buffer[2]>=0.0001  && low_240_buffer[2]-open_240_buffer[2]<=-0.0080) &&
              close_240_buffer[1]-open_240_buffer[1]>=0.0001 &&
                                                          //H4 k1,k2,k3 <=30   || [2]<=-0.0250
            ((k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30  &&  k3_240_buffer[1]<=30) || (close_240_buffer[2]-open_240_buffer[2]<=-0.0250)))
   
       
              OrderClose(OrderTicket(),lots,Bid,1,Olive); 
    
//+++++++++++++++++++++++++++++++++++++++++++CLOSE   SELL   8   ++++++++++++++++++++++++++++++++++++++++++++++++++          
         
                  
                                //(m15-62)   h4 的 ma180斜上 或ma180持平 ma360 斜上   
        if   ((ma180_240_buffer[1]-ma180_240_buffer[2]>=0.0001 ||  (ma180_240_buffer[1]-ma180_240_buffer[2]>=0 &&
               ma360_240_buffer[1]-ma360_240_buffer[2]>=0.0001)) &&
                  // [1]收在ma180上的20點內  
              (close_240_buffer[1]-ma180_240_buffer[1]>=0.0001  && close_240_buffer[1]-ma180_240_buffer[1]<=0.0020) &&
                 //h4 [1]下影線超過30點
              ((close_240_buffer[1]-open_240_buffer[1]<=-0.0001 && low_240_buffer[1]-close_240_buffer[1]<=-0.0030) ||
              (close_240_buffer[1]-open_240_buffer[1]>=0.0001  && low_240_buffer[1]-open_240_buffer[1]<=-0.0030)) &&
                 //kd1>=3      
               k1_240_buffer[1]-d1_240_buffer[1]>=3 &&
                  // macd差值>=-0.00150  <=0.00100 
              (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00150 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100) &&
                   // [2]||[3]||[4]收在ma180上的20點內  
             ((close_240_buffer[2]-ma180_240_buffer[2]>=0.0001  && close_240_buffer[2]-ma180_240_buffer[2]<=0.0020) ||
              (close_240_buffer[3]-ma180_240_buffer[3]>=0.0001  && close_240_buffer[3]-ma180_240_buffer[3]<=0.0020) ||
              (close_240_buffer[4]-ma180_240_buffer[4]>=0.0001  && close_240_buffer[4]-ma180_240_buffer[4]<=0.0020)))
    
               OrderClose(OrderTicket(),lots,Bid,1,Olive); 
                 
        
 //+++++++++++++++++++++++++++++++++++++++++++   CLOSE SELL   9   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                 
                
         //h4 的 [+4][-3][-2][+1]  && [+1]or[-2]為最低 bar實體為0.0030 
        if   ((close_240_buffer[1]-open_240_buffer[1]>=0.0030 && close_240_buffer[4]-open_240_buffer[4]>=0.0010  && 
               close_240_buffer[2]-open_240_buffer[2]<=-0.0010 && close_240_buffer[3]-open_240_buffer[3]<=-0.0010 &&
                //(m15-61)  [1]上影線小於15點
               high_240_buffer[1]-close_240_buffer[1]<=0.0015  &&
                 //(m15-59) kd1,(kd2||kd3)>=-2 開口必須縮小 || macd差值在100內
             ((k1_240_buffer[1]-d1_240_buffer[1]>=-3  && (k2_240_buffer[1]-d2_240_buffer[1]>=-3 || k3_240_buffer[1]-d3_240_buffer[1]>=-3)) ||
                      // (m15-61)  macd差值>=-0.00150  <=0.00100 
              (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00150 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100))  &&
                  //(m15=58)  h4 收盤必須離ma05在15點內   h1   k1,k2,k3必須在45下以免已漲過高
               ma05_240_buffer[1]- close_240_buffer[1]<=0.0015 && ma05_240_buffer[1]-ma05_240_buffer[2]>=0 &&
               k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||  //  && 
          //    (low_240_buffer[1]==H4lowest40bar ||  low_240_buffer[2]==H4lowest40bar)) ||
            
                   //h4 的 [+5][-4][-3][-2][+1]  && [+1]or[-2]為最低 bar實體為0.0010   [1]>=0.0030  
              (close_240_buffer[1]-open_240_buffer[1]>=0.0030 && close_240_buffer[5]-open_240_buffer[5]>=0.0010  && 
               close_240_buffer[2]-open_240_buffer[2]<=-0.0010 && close_240_buffer[3]-open_240_buffer[3]<=-0.0010 &&
               close_240_buffer[4]-open_240_buffer[4]<=-0.0010 &&
                              //(m15-61)  [1]上影線小於15點
               high_240_buffer[1]-close_240_buffer[1]<=0.0015  &&

                         //(m15-59) kd1,(kd2||kd3)>=-2 開口必須縮小 || macd差值在100內
             ((k1_240_buffer[1]-d1_240_buffer[1]>=-3  && (k2_240_buffer[1]-d2_240_buffer[1]>=-3 || k3_240_buffer[1]-d3_240_buffer[1]>=-3)) ||
                      // (m15-61)  macd差值>=-0.00150  <=0.00100 
              (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00150 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100))  &&
                  //(m15=58)  h4 收盤必須離ma05在15點內   h1   k1,k2,k3必須在45下以免已漲過高
               ma05_240_buffer[1]- close_240_buffer[1]<=0.0015 && ma05_240_buffer[1]-ma05_240_buffer[2]>=0 &&
               k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30)  ||   //  && 
                       //在m15之下執行時   下列無法作用
      //        (low_240_buffer[1]==H4lowest40bar ||  low_240_buffer[2]==H4lowest40bar || low_240_buffer[3]==H4lowest40bar )) ||
                    
                        //(m15-61) H4 的 [+2][+1]   上影線在10點內
              (close_240_buffer[1]-open_240_buffer[1]>=0.0010 && close_240_buffer[2]-open_240_buffer[2]>=0.0010  && 
                     //  [1][2]上影線小於10點
               low_240_buffer[1]-close_240_buffer[1]>=0.0010  &&  low_240_buffer[2]-close_240_buffer[2]>=0.0010  &&             
                    //    kd1,kd2,kd3>=1 
               k1_240_buffer[1]-k1_240_buffer[2]>=1  && k2_240_buffer[1]-k2_240_buffer[2]>=1 && k3_240_buffer[1]-k3_240_buffer[2]>=1 &&
                    //   macd  差值>=-0.00100  <=0.00100
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100  &&
               macdmainline_240_buffer[1]<=-0.00350 && 
                      //k1,k2,k3<=15
               k1_240_buffer[1]<=15 && k2_240_buffer[1]<=15 && k3_240_buffer[1]<=15) ||
    
                     //h4  [4][3][2]<=-0.0050 [1]>=0.0010  ma45[1]-[2]>=0.0001
              (close_240_buffer[4]-open_240_buffer[4]<=-0.0050 && close_240_buffer[3]-open_240_buffer[3]<=-0.0050  && 
               close_240_buffer[2]-open_240_buffer[2]<=-0.0050 && close_240_buffer[1]-open_240_buffer[1]>=0.0010 &&
               ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0001) ||
          
                       //(m15-61) h4  [4]+[3]+[2]<=-0.0150 [1]>=0.0030  [1]-[2]>=-0.0010  macd  差值>=-0.00100  <=0.00100
             (((close_240_buffer[4]-open_240_buffer[4])+(close_240_buffer[3]-open_240_buffer[3])+ 
               (close_240_buffer[2]-open_240_buffer[2])<=-0.0150) && close_240_buffer[1]-open_240_buffer[1]>=0.0030 &&
                close_240_buffer[1]-close_240_buffer[2]>=-0.0010 &&
                macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100)) 
                if    ((k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10) ||
                      (k1_240_buffer[1]<=13 && k2_240_buffer[1]<=13  &&  k3_240_buffer[1]<=13) ||
                         //(m15-64) [1]||[2]不可跌破150點 跌太多不好回頭
                      (close_240_buffer[1]-open_240_buffer[1]<=-0.0150 || close_240_buffer[2]-open_240_buffer[2]<=-0.0150) ||
                          //(m15-64) [1]||[2]不可跌破110點   kd1[1]||kd1[2]<=-20 
                      (close_240_buffer[1]-open_240_buffer[1]<=-0.0110 && k1_240_buffer[1]-d1_240_buffer[1]<=-20) ||
                      (close_240_buffer[2]-open_240_buffer[2]<=-0.0110 && k1_240_buffer[2]-d1_240_buffer[2]<=-20) ||
                   // (m15-64)  kd1,kd2,kd3<=-15
                      (k1_240_buffer[1]-d1_240_buffer[1]<=-15 && k2_240_buffer[1]-d2_240_buffer[1]<=-15 && k3_240_buffer[1]-d3_240_buffer[1]<=-15)) 
                       return;
                       else              
                       OrderClose(OrderTicket(),lots,Bid,1,Teal); 
   
   //+++++++++++++++++++++++++++++++++++++++++++   CLOSE SELL  10   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                
                                    //h1 [1] 實紅超過30,50,70,100點   
                                //100 點 [1]-[2]>=0.0001  [1]-[3]>=0.0001
      if   ((((close_60_buffer[1]-open_60_buffer[1]>=0.0100 && close_60_buffer[1]-close_60_buffer[2]>=0.0001  &&
            close_60_buffer[1]-close_60_buffer[3]>=0.0001 && 
                               //kd1,kd2,kd3>=0  k1,k2,k3<=30 
            k1_60_buffer[1]-d1_60_buffer[1]>=0 && k2_60_buffer[1]-d2_60_buffer[1]>=0 && k3_60_buffer[1]-d3_60_buffer[1]>=0 &&
            k1_60_buffer[1]<=30 && k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30) ||
                               //75 點 [1]-[2]>=0~~~~[1]-[4]>=0 
           (close_60_buffer[1]-open_60_buffer[1]>=0.0075 && close_60_buffer[1]-close_60_buffer[2]>=0  &&
            close_60_buffer[1]-close_60_buffer[3]>=0 && close_60_buffer[1]-close_60_buffer[4]>=0  &&
                              //kd1,kd2,kd3>=0 k1,k2,k3<=30 
            k1_60_buffer[1]-d1_60_buffer[1]>=0 && k2_60_buffer[1]-d2_60_buffer[1]>=0 && k3_60_buffer[1]-d3_60_buffer[1]>=0 &&
            k1_60_buffer[1]<=30 && k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30) ||
                              //55 點 [1]-[2][3]>=0,[1]-[6]>=0 
           (close_60_buffer[1]-open_60_buffer[1]>=0.0055 && close_60_buffer[1]-close_60_buffer[2]>=0  &&
            close_60_buffer[1]-close_60_buffer[3]>=0 && close_60_buffer[1]-close_60_buffer[6]>=0  &&
                              //kd1,kd2,kd3>=0 k1,k2,k3<=30 
            k1_60_buffer[1]-d1_60_buffer[1]>=0 && k2_60_buffer[1]-d2_60_buffer[1]>=0 && k3_60_buffer[1]-d3_60_buffer[1]>=0 &&
            k1_60_buffer[1]<=30 && k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30) ||
                          //30 點 [1]-[2]>=0~~~~~[1]-[8]>=0 
           (close_60_buffer[1]-open_60_buffer[1]>=0.0030 && close_60_buffer[1]-close_60_buffer[2]>=0  &&
            close_60_buffer[1]-close_60_buffer[3]>=0 && close_60_buffer[1]-close_60_buffer[4]>=0  &&
            close_60_buffer[1]-close_60_buffer[5]>0 && close_60_buffer[1]-close_60_buffer[6]>=0  &&
            close_60_buffer[1]-close_60_buffer[7]>=0 && close_60_buffer[1]-close_60_buffer[8]>=0  &&
                                  //kd1,kd2,kd3>=2 k1,k2,k3<=30 
            k1_60_buffer[1]-d1_60_buffer[1]>=2 && k2_60_buffer[1]-d2_60_buffer[1]>=2 && k3_60_buffer[1]-d3_60_buffer[1]>=2 &&
            k1_60_buffer[1]<=30 && k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30))))
                          //h4  k2,k3 在47上  開口向下  不做買單 
            if    ((k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3全向下,或 h4,m30,m60 kd2,kd3向下開口大 或 k1,k,2,k3在極低
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-25  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                    k2_240_buffer[0]>=40 && k3_240_buffer[1]>=40) ||
                            //h4  kd1,kd2,kd3<=-10   k2,k3>=70   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-10  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-10  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-10  &&  k2_240_buffer[0]>=70 && k3_240_buffer[1]>=70) ||
                               //(m15-57) h4  kd1,kd2,kd3<=0   k1,k2,k3>=80 macd>=0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=0  &&  k2_240_buffer[1]-d2_240_buffer[1]<=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=0  &&  k1_240_buffer[0]>=80 && k2_240_buffer[0]>=80 && k3_240_buffer[1]>=80 &&
                    macdmainline_240_buffer[1]>=0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3<=-35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-35) ||
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd差值>=-350
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0100  &&  close_240_buffer[2]-open_240_buffer[2]<=-0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0020  &&
                   (k1_240_buffer[1]>=50 && k2_240_buffer[1]>=50 && k3_240_buffer[1]>=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3<=-4   ma05  [1]-[2]<=-0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-4  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 && k1_240_buffer[1]-k1_240_buffer[2]<=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  && 
                    k1_240_buffer[1]-k1_240_buffer[2]<=0 &&  k2_240_buffer[1]-k2_240_buffer[2]<=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]<=0 &&  close_240_buffer[1]-open_240_buffer[1]<=-0.0001) || 
                   (k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10) ||
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14)) 
                    return;
                    else                    
                    OrderClose(OrderTicket(),lots,Bid,1,Teal); 
 //+++++++++++++++++++++++++++++++++++++++++++   CLOSE SELL 11   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                      //m30 的 [+4][-3][-2][+1]   [1]>=0.0030 
         if   ((close_30_buffer[1]-open_30_buffer[1]>=0.0030 && close_30_buffer[4]-open_30_buffer[4]>=0.0008  && 
               close_30_buffer[2]-open_30_buffer[2]<=-0.0008 && close_30_buffer[3]-open_30_buffer[3]<=-0.0008 &&
               k2_30_buffer[1]-d2_30_buffer[1]>=12 && k3_30_buffer[1]-d3_30_buffer[1]>=12 &&
               k2_30_buffer[1]<=45 && k3_30_buffer[1]<=45) || 
                       //m30 的 [+5][-4][-3][-2][+1]  [1]>=0.0015  
              (close_30_buffer[1]-open_30_buffer[1]>=0.0015 && close_30_buffer[5]-open_30_buffer[5]>=0.0010  && 
               close_30_buffer[2]-open_30_buffer[2]<=-0.0010 && close_30_buffer[3]-open_30_buffer[3]<=-0.0010 &&
               close_30_buffer[4]-open_30_buffer[4]<=-0.0010 &&
               k2_30_buffer[1]-d2_30_buffer[1]>=10 && k3_30_buffer[1]-d3_30_buffer[1]>=10 &&
               k2_30_buffer[1]<=30 && k3_30_buffer[1]<=30) || 
  
                  //m60 的 [+4][-3][-2][+1]   [1]>=0.0030 
              (close_60_buffer[1]-open_60_buffer[1]>=0.0030 && close_60_buffer[4]-open_60_buffer[4]>=0.0010  && 
               close_60_buffer[2]-open_60_buffer[2]<=-0.0010 && close_60_buffer[3]-open_60_buffer[3]<=-0.0010 &&
               k2_60_buffer[1]-d2_60_buffer[1]>=10 && k3_60_buffer[1]-d3_60_buffer[1]>=10 &&
               k2_60_buffer[1]<=55 && k3_60_buffer[1]<=55) || 
                       //m60 的 [+4][-3][-2][+1]   [1]>=0.0020 
              (close_60_buffer[1]-open_60_buffer[1]>=0.0020 && close_60_buffer[4]-open_60_buffer[4]>=0.0007  && 
               close_60_buffer[2]-open_60_buffer[2]<=-0.0007 && close_60_buffer[3]-open_60_buffer[3]<=-0.0007 &&
               k1_60_buffer[1]-d1_60_buffer[1]>=0 && k2_60_buffer[1]-d2_60_buffer[1]>=5 && k3_60_buffer[1]-d3_60_buffer[1]>=5 &&
               k2_60_buffer[1]<=20 && k3_60_buffer[1]<=20) || 
                       //m60 的 [+5][-4][-3][-2][+1]  [1]>=0.0015  
              (close_60_buffer[1]-open_60_buffer[1]>=0.0015 && close_60_buffer[5]-open_60_buffer[5]>=0.0007  && 
               close_60_buffer[2]-open_60_buffer[2]<=-0.0007 && close_60_buffer[3]-open_60_buffer[3]<=-0.0007 &&
               close_60_buffer[4]-open_60_buffer[4]<=-0.0007 &&
               k2_60_buffer[1]-d2_60_buffer[1]>=4 && k3_60_buffer[1]-d3_60_buffer[1]>=4 &&
               k2_60_buffer[1]<=35 && k3_60_buffer[1]<=35) || 

                        //m60 的 [+5][-4][+3][-2][+1]  [1]>=0.0015  
              (close_60_buffer[1]-open_60_buffer[1]>=0.0015 && close_60_buffer[5]-open_60_buffer[5]>=0.0007  && 
               close_60_buffer[2]-open_60_buffer[2]<=-0.0007 && close_60_buffer[3]-open_60_buffer[3]>=0.0007 &&
               close_60_buffer[4]-open_60_buffer[4]<=-0.0007 &&
               k1_60_buffer[1]-k1_60_buffer[2]>=0 &&  k2_60_buffer[1]-k2_60_buffer[2]>=0 && k3_60_buffer[1]-k3_60_buffer[2]>=0 &&
               k2_60_buffer[1]<=20 && k3_60_buffer[1]<=20)) 
                                //h4  k2,k3 在47上  開口向下  不做買單 
               if ((k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3全向下,或 h4,m30,m60 kd2,kd3向下開口大 或 k1,k,2,k3在極低
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-2) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-25  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-25) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                    k2_240_buffer[0]>=40 && k3_240_buffer[1]>=40) ||
                            //h4  kd1,kd2,kd3<=-10   k2,k3>=70   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-10  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-10  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-10  &&  k2_240_buffer[0]>=70 && k3_240_buffer[1]>=70) ||
                               //(m15-57) h4  kd1,kd2,kd3<=0   k1,k2,k3>=80 macd>=0.00900   
                   (k1_240_buffer[1]-d1_240_buffer[1]<=0  &&  k2_240_buffer[1]-d2_240_buffer[1]<=0  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=0  &&  k1_240_buffer[0]>=80 && k2_240_buffer[0]>=80 && k3_240_buffer[1]>=80 &&
                    macdmainline_240_buffer[1]>=0.00900) ||
                       //(m15-57)h4  kd1+kd2+kd3<=-35 
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-35) ||
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd差值>=-350
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0100  &&  close_240_buffer[2]-open_240_buffer[2]<=-0.0050  && 
                    ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0020  &&
                   (k1_240_buffer[1]>=50 && k2_240_buffer[1]>=50 && k3_240_buffer[1]>=50) || (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00350))  ||
                           //(m15-57)h4  kd1,kd2,kd3<=-4   ma05  [1]-[2]<=-0.0030
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-4  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-4  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-4  &&  ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0030) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0006 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0006 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0006 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0006 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0015 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0015 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0015 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0004 && ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0004 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0004 && ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 && k1_240_buffer[1]-k1_240_buffer[2]<=0 &&
                    k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0001) ||
                   (k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  && 
                    k1_240_buffer[1]-k1_240_buffer[2]<=0 &&  k2_240_buffer[1]-k2_240_buffer[2]<=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]<=0 &&  close_240_buffer[1]-open_240_buffer[1]<=-0.0001) || 
                   (k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10) ||
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14)) 
                    return;
                    else                    
                    OrderClose(OrderTicket(),lots,Bid,1,Teal); 
 //+++++++++++++++++++++++++++++++++++++++++++   CLOSE SELL 12   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                       //m30 [2]留下影線 >=25點  [1]>0.0001開-低  [1]<-0.0001收-低
       if  (((close_30_buffer[2]-open_30_buffer[2]<=-0.0001 && low_30_buffer[2]-close_30_buffer[2]<=-0.0025) ||
             (close_30_buffer[2]-open_30_buffer[2]>=0.0001  && low_30_buffer[2]-open_30_buffer[2]<=-0.0025) &&
             (low_30_buffer[1]==M15lowest50bar || low_30_buffer[2]==M15lowest50bar) &&
                                  //       [1]收正  [1]-[2]>=0.0001   k1,k2,k3>=0  k1,k2,k3<=30
             (close_30_buffer[1]-open_30_buffer[1]>=0.0001 && close_30_buffer[1]-close_30_buffer[2]>=0.0001 &&
              k1_30_buffer[1]-k1_30_buffer[2]>=0 && k2_30_buffer[1]-k2_30_buffer[2]>=0 && k3_30_buffer[1]-k3_30_buffer[2]>=0 &&
              k1_30_buffer[1]<=30 && k2_30_buffer[1]<=30 && k3_30_buffer[1]<=30) ||
                                    //    [1]收正  [1]-[2]>=0.0001   k1,(k2||k3)>=0  k1,k2,k3<=30 kd1>=1
             (close_30_buffer[1]-open_30_buffer[1]>=0.0001 && close_30_buffer[1]-close_30_buffer[2]>=0.0001 &&
              k1_30_buffer[1]-k1_30_buffer[2]>=0 && (k2_30_buffer[1]-k2_30_buffer[2]>=0 || k3_30_buffer[1]-k3_30_buffer[2]>=0) &&
              k1_30_buffer[1]-d1_30_buffer[2]>=1 && 
              k1_30_buffer[1]<=20 && k2_30_buffer[1]<=20 && k3_30_buffer[1]<=20)) ||
              
                                     //m30 [1]&&[2]留下影線 >=25點  [1]>0.0001開-低  [1]<-0.0001收-低
            ((close_30_buffer[1]-open_30_buffer[1]<=-0.0001 && close_30_buffer[1]-open_30_buffer[1]>=-0.0010 && 
            low_30_buffer[1]-close_30_buffer[1]<=-0.0025) ||
             (close_30_buffer[1]-open_30_buffer[1]>=0.0001  && low_30_buffer[1]-open_30_buffer[1]<=-0.0025) &&
             (close_30_buffer[2]-open_30_buffer[2]<=-0.0001 && low_30_buffer[2]-close_30_buffer[2]<=-0.0025) ||
             (close_30_buffer[2]-open_30_buffer[2]>=0.0001  && low_30_buffer[2]-open_30_buffer[2]<=-0.0025) &&
              k1_30_buffer[1]<=30 && k2_30_buffer[1]<=30 && k3_30_buffer[1]<=30  &&
             (low_30_buffer[1]==M15lowest50bar || low_30_buffer[2]==M15lowest50bar) &&
                                  //       [1]收正  [1]-[2]>=0.0001   k2,k3>=0  k1,k2,k3<=30
              close_30_buffer[1]-open_30_buffer[1]>=0.0010 && close_30_buffer[1]-close_30_buffer[2]>=0.0001 &&
              k2_30_buffer[1]-k2_30_buffer[2]>=0 && k3_30_buffer[1]-k3_30_buffer[2]>=0 &&
              k1_30_buffer[1]<=30 && k2_30_buffer[1]<=30 && k3_30_buffer[1]<=30) ||
                                    // [1]留下影線 >=40點  [1]>0.0001開-低  k1,k2,k3>=1  ,k1,k2,k3<=20
            ((close_30_buffer[1]-open_30_buffer[1]>=0.0001  && low_30_buffer[1]-open_30_buffer[1]<=-0.0040) &&
              low_30_buffer[1]==M15lowest50bar &&
              k1_30_buffer[1]-k1_30_buffer[2]>=1 && k2_30_buffer[1]-k2_30_buffer[2]>=1 && k3_30_buffer[1]-k3_30_buffer[2]>=1 &&
              k1_30_buffer[1]<=20 && k2_30_buffer[1]<=20 && k3_30_buffer[1]<=20))
          
          
                                         
                                      //return  else  以下 buy 12   buy13  相同 和 buy1  ~  buy 11  不同
                                      //return  else  以下 buy 12   buy13  相同 和 buy1  ~  buy 11  不同

               if  ((k2_60_buffer[1]-d2_60_buffer[1]<=-25  &&  k3_60_buffer[1]-d3_60_buffer[1]<=-25) ||
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-10  && k2_60_buffer[1]-d2_60_buffer[1]<=-10  &&  k3_60_buffer[1]-d3_60_buffer[1]<=-10) ||                                   //h4  k2,k3 在47上  開口向下  不做買單 
                    (k2_60_buffer[1]-d2_60_buffer[1]<=-19  &&  k3_60_buffer[1]-d3_60_buffer[1]<=-19 && 
                     ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0010  &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0008) ||
                        //h1 [1]<=-0.0120  h4   ma05,ma08,ma12<=-0.0025
                    (close_60_buffer[1]-open_60_buffer[1]<=-0.0120 && ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0025  &&  
                     ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0025  &&  ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0025) ||

                    
                   (k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[2]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]>=55 && k3_240_buffer[1]>=55 &&  k1_240_buffer[1]-k1_240_buffer[1]<=-10  &&
                   (k2_240_buffer[1]-k2_240_buffer[1]<=-10 || k3_240_buffer[1]-k3_240_buffer[1]<=-10)) ||
                         //(m15-57)h4  [1]跌過140點
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0140) ||
                     //(m15-59) h4  ma45,ma90,ma180其中任二[1]-[2]<=0    [1]<=-0.0100
                  ((ma45_240_buffer[1]-ma45_240_buffer[2]<=0 || ma90_240_buffer[1]-ma90_240_buffer[2]<=0) &&
                   (ma90_240_buffer[1]-ma90_240_buffer[2]<=0 || ma180_240_buffer[1]-ma180_240_buffer[2]<=0) &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0100) ||  
                         //(m15-59) h4 k1||k2||k3 >=65 don't buy
                   (k1_240_buffer[1]>=65 || k2_240_buffer[1]>=65 || k3_240_buffer[1]>=65) ||                   
                      //(m15-57)h4  ma45[1][2]<=-0.0007  ma90[1][2]<=-0.0004  ma45||ma90([1]-[2])-[2]-[3])<=-0.0001 ma45,ma90間距<=0.0400 >=-0.0035
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0007  &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0004 &&
                  ((ma45_240_buffer[1]-ma45_240_buffer[2])-(ma45_240_buffer[2]-ma45_240_buffer[3])<=-0.0001  ||
                   (ma90_240_buffer[1]-ma90_240_buffer[2])-(ma90_240_buffer[2]-ma90_240_buffer[3])<=-0.0001) &&
                    //(m15-58)   ma45在ma90 下但間距<=0.0350 >=-0.0010
                    ma45_240_buffer[1]-ma90_240_buffer[1]<=0.0350 && ma45_240_buffer[1]-ma90_240_buffer[1]>=-0.0010) ||
                          //(m15-58)h4  kd1+kd2+kd3<=-49 kd1,kd2,kd3<=-7
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-49 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-7 && k2_240_buffer[1]-d2_240_buffer[1]<=-7 && k3_240_buffer[1]-d3_240_buffer[1]<=-7) ||
                     //(m15-59)(m15-58)h4  kd1+kd2+kd3<=-40 kd1,kd2,kd3<=-12
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-40 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-12 && k2_240_buffer[1]-d2_240_buffer[1]<=-12 && k3_240_buffer[1]-d3_240_buffer[1]<=-12) ||
                  
                           //(m15-61)(m15-57)h4  [1]跌過100點  (ma45<=-0.0015  || [0]<=-0.0150)
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0100 && (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0015 ||
                    close_240_buffer[0]-open_240_buffer[0]<=-0.0150)) ||
                            //(m15-57)h4 k1<=-19  k2,k3[1]-[2]<=-2
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-19  &&  k2_240_buffer[1]-k2_240_buffer[2]<=-2 &&
                    k3_240_buffer[1]-k3_240_buffer[2]<=-2) ||
                       // h4  ma05[1]-ma12[1]<=-0.0160  ma05[2]-ma12[2]<=-0.0120   ma05[1]-ma05[2]<=-0.0030
                   (ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.0160  &&  ma05_240_buffer[2]-ma12_240_buffer[2]<=-0.0120  &&
                    ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0030) ||
                          //(m15-57)h4   ma05[1]-[2]<=-0.0050  ma45[1]-[2]<=-0.0007
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0050  &&  ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0007) ||
                  
                         //h4   k2,k3<=-15 k1<=-5   macd<=-0.00300
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-5 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300) ||    
                            //h4   k1,k2,k3<=-7    macd[1]<=-0.00350  macd[2]<=-0.00250  (macd[1]-[2]<=-0.00070 || macdmain[1]-[2]<=-0.00150  macdsignal[1]-[2]<=-0.0070 
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-7  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-7 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-7 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00350 &&
                    macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]<=-0.00250 && 
                  (((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1])-(macdmainline_240_buffer[2]-macdsignalline_240_buffer[2])<=-0.00070) ||    
                    (macdmainline_240_buffer[1]-macdmainline_240_buffer[2]<=-0.00150 && macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2])<=-0.00070)) ||
                          //ma45  ma90 <=-0.0014
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0014  &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0014) ||
                          //(m15-57) h4 ma45  ma90 <=-0.0010   ma45+ma90<=-0.0029
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0010  &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0010 &&
                   (ma45_240_buffer[1]-ma45_240_buffer[2])+ (ma90_240_buffer[1]-ma90_240_buffer[2])<=-0.0029) ||

                           //H4 k1,k2,k3全向下,或 h4,m30,m60 kd2,kd3向下開口大 或 k1,k,2,k3在極低
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-2 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-25  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-25 && 
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                    k2_240_buffer[0]>=40 && k3_240_buffer[1]>=40 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-10  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-10  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-10  &&  k2_240_buffer[0]>=70 && k3_240_buffer[1]>=70 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  && 
                    k1_240_buffer[1]-k1_240_buffer[2]<=0 &&  k2_240_buffer[1]-k2_240_buffer[2]<=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]<=0 &&  close_240_buffer[1]-open_240_buffer[1]<=-0.0001 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                                       //34分 結單後34分之內不動作
                   (OrderType()==OP_BUY && TimeCurrent()-OrderCloseTime()<=2000))
                    return;
                    else      
                    OrderClose(OrderTicket(),lots,Bid,1,Teal); 
 //+++++++++++++++++++++++++++++++++++++++++++   CLOSE SELL 13   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                 //h1 留下影線[2] >=25點  [1]>0.0001開-低  [1]<-0.0001收-低
       if  (((close_60_buffer[2]-open_60_buffer[2]<=-0.0001 && low_60_buffer[2]-close_60_buffer[2]<=-0.0025) ||
             (close_60_buffer[2]-open_60_buffer[2]>=0.0001  && low_60_buffer[2]-open_60_buffer[2]<=-0.0025) &&
             (low_60_buffer[1]==M15lowest70bar || low_60_buffer[2]==M15lowest70bar) &&
                                  //       [1]收正  [1]-[2]>=0.0001   k1,k2,k3>=0  k1,k2,k3<=30
             (close_60_buffer[1]-open_60_buffer[1]>=0.0010 && close_60_buffer[1]-close_60_buffer[2]>=0.0001 &&
              k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 && k3_60_buffer[1]-k3_60_buffer[2]>=0 &&
              k1_60_buffer[1]<=30 && k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30) ||
                                       //    [1]收正  [1]-[2]>=0.0001   k1,(k2||k3)>=0  k1,k2,k3<=30 kd1>=1
             (close_60_buffer[1]-open_60_buffer[1]>=0.0001 && close_60_buffer[1]-close_60_buffer[2]>=0.0001 &&
              k1_60_buffer[1]-k1_60_buffer[2]>=0 && (k2_60_buffer[1]-k2_60_buffer[2]>=0 || k3_60_buffer[1]-k3_60_buffer[2]>=0) &&
              k1_60_buffer[1]-d1_60_buffer[2]>=1 && 
              k1_60_buffer[1]<=20 && k2_60_buffer[1]<=20 && k3_60_buffer[1]<=20)) ||
            
                                     //m60 [1],[2]留下影線 >=24點  [1]>0.0001開-低  [1]<-0.0001收-低  [1]>=-0.0010  <=-0.0001
            ((close_60_buffer[1]-open_60_buffer[1]<=-0.0001 && close_60_buffer[1]-open_60_buffer[1]>=-0.0010 && 
              low_60_buffer[1]-close_60_buffer[1]<=-0.0024) ||
             (close_60_buffer[1]-open_60_buffer[1]>=0.0001  && low_60_buffer[1]-open_60_buffer[1]<=-0.0024) &&
             (close_60_buffer[2]-open_60_buffer[2]<=-0.0001 && low_60_buffer[2]-close_60_buffer[2]<=-0.0024) ||
             (close_60_buffer[2]-open_60_buffer[2]>=0.0001  && low_60_buffer[2]-open_60_buffer[2]<=-0.0024) &&
              k1_60_buffer[1]<=20 && k2_60_buffer[1]<=20 && k3_60_buffer[1]<=20 &&
             (low_60_buffer[1]==M15lowest70bar || low_60_buffer[2]==M15lowest70bar)) ||
                                    // [1]留下影線 >=40點  [1]>0.0001開-低  k1,k2,k3>=1  ,k1,k2,k3<=20
            ((close_60_buffer[1]-open_60_buffer[1]>=0.0001  && low_60_buffer[1]-open_60_buffer[1]<=-0.0040) &&
              low_60_buffer[1]==M15lowest70bar &&
              k1_60_buffer[1]-k1_60_buffer[2]>=1 && k2_60_buffer[1]-k2_60_buffer[2]>=1 && k3_60_buffer[1]-k3_60_buffer[2]>=1 &&
              k1_60_buffer[1]<=20 && k2_60_buffer[1]<=20 && k3_60_buffer[1]<=20))
                         
                                            
                                                                 
                                      //return  else  以下 buy 12   buy13  相同 和 buy1  ~  buy 11  不同
                                      //return  else  以下 buy 12   buy13  相同 和 buy1  ~  buy 11  不同

               if  ((k2_60_buffer[1]-d2_60_buffer[1]<=-25  &&  k3_60_buffer[1]-d3_60_buffer[1]<=-25) ||
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-10  && k2_60_buffer[1]-d2_60_buffer[1]<=-10  &&  k3_60_buffer[1]-d3_60_buffer[1]<=-10) ||                                   //h4  k2,k3 在47上  開口向下  不做買單 
                    (k2_60_buffer[1]-d2_60_buffer[1]<=-19  &&  k3_60_buffer[1]-d3_60_buffer[1]<=-19 && 
                     ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0010  &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0008) ||
                        //h1 [1]<=-0.0120  h4   ma05,ma08,ma12<=-0.0025
                    (close_60_buffer[1]-open_60_buffer[1]<=-0.0120 && ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0025  &&  
                     ma08_240_buffer[1]-ma08_240_buffer[2]<=-0.0025  &&  ma12_240_buffer[1]-ma12_240_buffer[2]<=-0.0025) ||

                    
                   (k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[2]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]>=55 && k3_240_buffer[1]>=55 &&  k1_240_buffer[1]-k1_240_buffer[1]<=-10  &&
                   (k2_240_buffer[1]-k2_240_buffer[1]<=-10 || k3_240_buffer[1]-k3_240_buffer[1]<=-10)) ||
                         //(m15-57)h4  [1]跌過140點
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0140) ||
                     //(m15-59) h4  ma45,ma90,ma180其中任二[1]-[2]<=0    [1]<=-0.0100
                  ((ma45_240_buffer[1]-ma45_240_buffer[2]<=0 || ma90_240_buffer[1]-ma90_240_buffer[2]<=0) &&
                   (ma90_240_buffer[1]-ma90_240_buffer[2]<=0 || ma180_240_buffer[1]-ma180_240_buffer[2]<=0) &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0100) ||  
                         //(m15-59) h4 k1||k2||k3 >=65 don't buy
                   (k1_240_buffer[1]>=65 || k2_240_buffer[1]>=65 || k3_240_buffer[1]>=65) ||                   
                      //(m15-57)h4  ma45[1][2]<=-0.0007  ma90[1][2]<=-0.0004  ma45||ma90([1]-[2])-[2]-[3])<=-0.0001 ma45,ma90間距<=0.0400 >=-0.0035
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0007  &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0004 &&
                  ((ma45_240_buffer[1]-ma45_240_buffer[2])-(ma45_240_buffer[2]-ma45_240_buffer[3])<=-0.0001  ||
                   (ma90_240_buffer[1]-ma90_240_buffer[2])-(ma90_240_buffer[2]-ma90_240_buffer[3])<=-0.0001) &&
                    //(m15-58)   ma45在ma90 下但間距<=0.0350 >=-0.0010
                    ma45_240_buffer[1]-ma90_240_buffer[1]<=0.0350 && ma45_240_buffer[1]-ma90_240_buffer[1]>=-0.0010) ||
                          //(m15-58)h4  kd1+kd2+kd3<=-49 kd1,kd2,kd3<=-7
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-49 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-7 && k2_240_buffer[1]-d2_240_buffer[1]<=-7 && k3_240_buffer[1]-d3_240_buffer[1]<=-7) ||
                     //(m15-59)(m15-58)h4  kd1+kd2+kd3<=-40 kd1,kd2,kd3<=-12
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-40 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-12 && k2_240_buffer[1]-d2_240_buffer[1]<=-12 && k3_240_buffer[1]-d3_240_buffer[1]<=-12) ||
                  
                           //(m15-61)(m15-57)h4  [1]跌過100點  (ma45<=-0.0015  || [0]<=-0.0150)
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0100 && (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0015 ||
                    close_240_buffer[0]-open_240_buffer[0]<=-0.0150)) ||
                            //(m15-57)h4 k1<=-19  k2,k3[1]-[2]<=-2
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-19  &&  k2_240_buffer[1]-k2_240_buffer[2]<=-2 &&
                    k3_240_buffer[1]-k3_240_buffer[2]<=-2) ||
                       // h4  ma05[1]-ma12[1]<=-0.0160  ma05[2]-ma12[2]<=-0.0120   ma05[1]-ma05[2]<=-0.0030
                   (ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.0160  &&  ma05_240_buffer[2]-ma12_240_buffer[2]<=-0.0120  &&
                    ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0030) ||
                          //(m15-57)h4   ma05[1]-[2]<=-0.0050  ma45[1]-[2]<=-0.0007
                   (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.0050  &&  ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0007) ||
                  
                         //h4   k2,k3<=-15 k1<=-5   macd<=-0.00300
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-5 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300) ||    
                            //h4   k1,k2,k3<=-7    macd[1]<=-0.00350  macd[2]<=-0.00250  (macd[1]-[2]<=-0.00070 || macdmain[1]-[2]<=-0.00150  macdsignal[1]-[2]<=-0.0070 
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-7  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-7 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-7 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00350 &&
                    macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]<=-0.00250 && 
                  (((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1])-(macdmainline_240_buffer[2]-macdsignalline_240_buffer[2])<=-0.00070) ||    
                    (macdmainline_240_buffer[1]-macdmainline_240_buffer[2]<=-0.00150 && macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2])<=-0.00070)) ||
                          //ma45  ma90 <=-0.0014
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0014  &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0014) ||
                          //(m15-57) h4 ma45  ma90 <=-0.0010   ma45+ma90<=-0.0029
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0010  &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0010 &&
                   (ma45_240_buffer[1]-ma45_240_buffer[2])+ (ma90_240_buffer[1]-ma90_240_buffer[2])<=-0.0029) ||

                           //H4 k1,k2,k3全向下,或 h4,m30,m60 kd2,kd3向下開口大 或 k1,k,2,k3在極低
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-2 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-25  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-25 && 
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                    k2_240_buffer[0]>=40 && k3_240_buffer[1]>=40 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-10  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-10  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-10  &&  k2_240_buffer[0]>=70 && k3_240_buffer[1]>=70 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  && 
                    k1_240_buffer[1]-k1_240_buffer[2]<=0 &&  k2_240_buffer[1]-k2_240_buffer[2]<=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]<=0 &&  close_240_buffer[1]-open_240_buffer[1]<=-0.0001 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 區間外允許做買單
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                                       //34分 結單後34分之內不動作
                   (OrderType()==OP_BUY && TimeCurrent()-OrderCloseTime()<=2000))
                    return;
                    else      
                    OrderClose(OrderTicket(),lots,Bid,1,Teal); 
 //+++++++++++++++++++++++++++++++++++++++++++   CLOSE SELL 14   ++++++++++++++++++++++++++++++++++++++++++++++++++          

         //(m15-62) h1    macd<=-0.00870   差值在-50,+50間         發生的機率不多所以不使用狀況排除法
        if    (macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=0.00050 && macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=-0.00050 &&
               macdmainline_60_buffer[1]<=-0.00870 &&
                    //k1,k2,k3  [1]-[2]>=0   k1,k2,k3<=30 || ma180 ,ma360斜上
               k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 && 
               k3_60_buffer[1]-k3_60_buffer[2]>=0 && 
             ((k1_60_buffer[1]<=30 && k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30) || (ma180_60_buffer[1]-ma180_60_buffer[2]>=0.0001 &&
               ma360_60_buffer[1]-ma360_60_buffer[2]>=0.0001)))
               if   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0011 && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0008 &&
                     ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.0004 && ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.0001)
                     return;
                     else 
                     OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 


 //+++++++++++++++++++++++++++++++++++++++++++   CLOSE SELL 15   ++++++++++++++++++++++++++++++++++++++++++++++++++          

        
                  //(m15-63)  H4     [2][3]收黑<20點     [1]收紅>=10點  留下影線>30點   
      if     (close_240_buffer[1]-open_240_buffer[1]>=0.0010  && low_240_buffer[1]-open_240_buffer[1]<=-0.0030 &&
              close_240_buffer[2]-open_240_buffer[2]<=-0.0009  && close_240_buffer[3]-open_240_buffer[3]<=-0.0009  &&   
               // ma45 ma90 || ma90  ma180  斜上且大
             ((ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0008 &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002) ||
              (ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0006 &&  ma180_240_buffer[1]-ma180_240_buffer[2]>=0.0002)) &&
                // [1]收盤在ma05之上  不超過15點
              close_240_buffer[1]-ma05_240_buffer[1]>=0.0001  && close_240_buffer[1]-ma05_240_buffer[1]<=0.0015) 
           OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 
       

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

