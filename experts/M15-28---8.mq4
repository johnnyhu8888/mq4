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

 //*************   KD line  *************************

 
 double k2_1=iStochastic(NULL,PERIOD_M1,15,6,6,MODE_SMA,0,MODE_MAIN,0);
 double d2_1=iStochastic(NULL,PERIOD_M1,15,6,6,MODE_SMA,0,MODE_SIGNAL,0);
 double k2_5=iStochastic(NULL,PERIOD_M5,15,6,6,MODE_SMA,0,MODE_MAIN,0);
 double d2_5=iStochastic(NULL,PERIOD_M5,15,6,6,MODE_SMA,0,MODE_SIGNAL,0);
 double k2_15=iStochastic(NULL,PERIOD_M15,15,6,6,MODE_SMA,0,MODE_MAIN,0);
 double d2_15=iStochastic(NULL,PERIOD_M15,15,6,6,MODE_SMA,0,MODE_SIGNAL,0);
 double k2_30=iStochastic(NULL,PERIOD_M30,15,6,6,MODE_SMA,0,MODE_MAIN,0);
 double d2_30=iStochastic(NULL,PERIOD_M30,15,6,6,MODE_SMA,0,MODE_SIGNAL,0);
 double k2_60=iStochastic(NULL,PERIOD_H1,15,6,6,MODE_SMA,0,MODE_MAIN,0);
 double d2_60=iStochastic(NULL,PERIOD_H1,15,6,6,MODE_SMA,0,MODE_SIGNAL,0);
 double k2_240=iStochastic(NULL,PERIOD_H4,15,6,6,MODE_SMA,0,MODE_MAIN,0);
 double d2_240=iStochastic(NULL,PERIOD_H4,15,6,6,MODE_SMA,0,MODE_SIGNAL,0);
 double k2_1440=iStochastic(NULL,PERIOD_D1,15,6,6,MODE_SMA,0,MODE_MAIN,0);
 double d2_1440=iStochastic(NULL,PERIOD_D1,15,6,6,MODE_SMA,0,MODE_SIGNAL,0);
 double k2_10080=iStochastic(NULL,PERIOD_W1,15,6,6,MODE_SMA,0,MODE_MAIN,0);
 double d2_10080=iStochastic(NULL,PERIOD_W1,15,6,6,MODE_SMA,0,MODE_SIGNAL,0);
 
 
 double k3_1=iStochastic(NULL,PERIOD_M1,12,8,8,MODE_SMA,0,MODE_MAIN,0);
 double d3_1=iStochastic(NULL,PERIOD_M1,12,8,8,MODE_SMA,0,MODE_SIGNAL,0);
 double k3_5=iStochastic(NULL,PERIOD_M5,12,8,8,MODE_SMA,0,MODE_MAIN,0);
 double d3_5=iStochastic(NULL,PERIOD_M5,12,8,8,MODE_SMA,0,MODE_SIGNAL,0);
 double k3_15=iStochastic(NULL,PERIOD_M15,12,8,8,MODE_SMA,0,MODE_MAIN,0);
 double d3_15=iStochastic(NULL,PERIOD_M15,12,8,8,MODE_SMA,0,MODE_SIGNAL,0);
 double k3_30=iStochastic(NULL,PERIOD_M30,12,8,8,MODE_SMA,0,MODE_MAIN,0);
 double d3_30=iStochastic(NULL,PERIOD_M30,12,8,8,MODE_SMA,0,MODE_SIGNAL,0);
 double k3_60=iStochastic(NULL,PERIOD_H1,12,8,8,MODE_SMA,0,MODE_MAIN,0);
 double d3_60=iStochastic(NULL,PERIOD_H1,12,8,8,MODE_SMA,0,MODE_SIGNAL,0);
 double k3_240=iStochastic(NULL,PERIOD_H4,12,8,8,MODE_SMA,0,MODE_MAIN,0);
 double d3_240=iStochastic(NULL,PERIOD_H4,12,8,8,MODE_SMA,0,MODE_SIGNAL,0);
 double k3_1440=iStochastic(NULL,PERIOD_D1,12,8,8,MODE_SMA,0,MODE_MAIN,0);
 double d3_1440=iStochastic(NULL,PERIOD_D1,12,8,8,MODE_SMA,0,MODE_SIGNAL,0);
 double k3_10080=iStochastic(NULL,PERIOD_W1,12,8,8,MODE_SMA,0,MODE_MAIN,0);
 double d3_10080=iStochastic(NULL,PERIOD_W1,12,8,8,MODE_SMA,0,MODE_SIGNAL,0);

 double k1_1=iStochastic(NULL,PERIOD_M1,10,3,3,MODE_SMA,0,MODE_MAIN,0);
 double d1_1=iStochastic(NULL,PERIOD_M1,10,3,3,MODE_SMA,0,MODE_SIGNAL,0);
 double k1_5=iStochastic(NULL,PERIOD_M5,10,3,3,MODE_SMA,0,MODE_MAIN,0);
 double d1_5=iStochastic(NULL,PERIOD_M5,10,3,3,MODE_SMA,0,MODE_SIGNAL,0);
 double k1_15=iStochastic(NULL,PERIOD_M15,10,3,3,MODE_SMA,0,MODE_MAIN,0);
 double d1_15=iStochastic(NULL,PERIOD_M15,10,3,3,MODE_SMA,0,MODE_SIGNAL,0);
 double k1_30=iStochastic(NULL,PERIOD_M30,10,3,3,MODE_SMA,0,MODE_MAIN,0);
 double d1_30=iStochastic(NULL,PERIOD_M30,10,3,3,MODE_SMA,0,MODE_SIGNAL,0);
 double k1_60=iStochastic(NULL,PERIOD_H1,10,3,3,MODE_SMA,0,MODE_MAIN,0);
 double d1_60=iStochastic(NULL,PERIOD_H1,10,3,3,MODE_SMA,0,MODE_SIGNAL,0);
 double k1_240=iStochastic(NULL,PERIOD_H4,10,3,3,MODE_SMA,0,MODE_MAIN,0);
 double d1_240=iStochastic(NULL,PERIOD_H4,10,3,3,MODE_SMA,0,MODE_SIGNAL,0);
 double k1_1440=iStochastic(NULL,PERIOD_D1,10,3,3,MODE_SMA,0,MODE_MAIN,0);
 double d1_1440=iStochastic(NULL,PERIOD_D1,10,3,3,MODE_SMA,0,MODE_SIGNAL,0);
 double k1_10080=iStochastic(NULL,PERIOD_W1,10,3,3,MODE_SMA,0,MODE_MAIN,0);
 double d1_10080=iStochastic(NULL,PERIOD_W1,10,3,3,MODE_SMA,0,MODE_SIGNAL,0);

//*******************   MACD line  **********************************************************

 double macdmainline_1=iMACD(NULL,PERIOD_M1,12,26,9,PRICE_CLOSE,MODE_MAIN,0);
 double macdsignalline_1=iMACD(NULL,PERIOD_M1,12,26,9,PRICE_CLOSE,MODE_SIGNAL,0);
 double macdmainline_5=iMACD(NULL,PERIOD_M5,12,26,9,PRICE_CLOSE,MODE_MAIN,0);
 double macdsignalline_5=iMACD(NULL,PERIOD_M5,12,26,9,PRICE_CLOSE,MODE_SIGNAL,0);
 double macdmainline_15=iMACD(NULL,PERIOD_M15,12,26,9,PRICE_CLOSE,MODE_MAIN,0);
 double macdsignalline_15=iMACD(NULL,PERIOD_M15,12,26,9,PRICE_CLOSE,MODE_SIGNAL,0);
 double macdmainline_30=iMACD(NULL,PERIOD_M30,12,26,9,PRICE_CLOSE,MODE_MAIN,0);
 double macdsignalline_30=iMACD(NULL,PERIOD_M30,12,26,9,PRICE_CLOSE,MODE_SIGNAL,0);
 double macdmainline_60=iMACD(NULL,PERIOD_H1,12,26,9,PRICE_CLOSE,MODE_MAIN,0);
 double macdsignalline_60=iMACD(NULL,PERIOD_H1,12,26,9,PRICE_CLOSE,MODE_SIGNAL,0);
 double macdmainline_240=iMACD(NULL,PERIOD_H4,12,26,9,PRICE_CLOSE,MODE_MAIN,0);
 double macdsignalline_240=iMACD(NULL,PERIOD_H4,12,26,9,PRICE_CLOSE,MODE_SIGNAL,0);
 double macdmainline_1440=iMACD(NULL,PERIOD_D1,12,26,9,PRICE_CLOSE,MODE_MAIN,0);
 double macdsignalline_1440=iMACD(NULL,PERIOD_D1,12,26,9,PRICE_CLOSE,MODE_SIGNAL,0);
 double macdmainline_10080=iMACD(NULL,PERIOD_W1,12,26,9,PRICE_CLOSE,MODE_MAIN,0);
 double macdsignalline_10080=iMACD(NULL,PERIOD_W1,12,26,9,PRICE_CLOSE,MODE_SIGNAL,0);

 //*******************   BB line  **********************************************************
 
// double bb_up_1=iBands(NULL,PERIOD_M1,18,2,0,PRICE_CLOSE,MODE_UPPER,2);
// double bb_lr_1=iBands(NULL,PERIOD_M1,18,2,0,PRICE_CLOSE,MODE_LOWER,2);
// double bb_up_5=iBands(NULL,PERIOD_M5,18,2,0,PRICE_CLOSE,MODE_UPPER,2);
// double bb_lr_5=iBands(NULL,PERIOD_M5,18,2,0,PRICE_CLOSE,MODE_LOWER,2);
// double bb_up_15=iBands(NULL,PERIOD_M15,18,2,0,PRICE_CLOSE,MODE_UPPER,2);
// double bb_lr_15=iBands(NULL,PERIOD_M15,18,2,0,PRICE_CLOSE,MODE_LOWER,2);
// double bb_up_30=iBands(NULL,PERIOD_M30,18,2,0,PRICE_CLOSE,MODE_UPPER,2);
// double bb_lr_30=iBands(NULL,PERIOD_M30,18,2,0,PRICE_CLOSE,MODE_LOWER,2);
// double bb_up_60=iBands(NULL,PERIOD_H1,18,2,0,PRICE_CLOSE,MODE_UPPER,2);
// double bb_lr_60=iBands(NULL,PERIOD_H1,18,2,0,PRICE_CLOSE,MODE_LOWER,2);
// double bb_up_240=iBands(NULL,PERIOD_H4,18,2,0,PRICE_CLOSE,MODE_UPPER,2);
 
 //******************    MA line  **************************************************** 
 
 double ma05_1=iMA(NULL,PERIOD_M1,5,0,MODE_SMA,PRICE_CLOSE,0);
 double ma08_1=iMA(NULL,PERIOD_M1,8,0,MODE_SMA,PRICE_CLOSE,0);
 double ma12_1=iMA(NULL,PERIOD_M1,12,0,MODE_SMA,PRICE_CLOSE,0);
 double ma90_1=iMA(NULL,PERIOD_M1,90,0,MODE_SMA,PRICE_CLOSE,0);
 double ma180_1=iMA(NULL,PERIOD_M1,180,0,MODE_SMA,PRICE_CLOSE,0);
 double ma360_1=iMA(NULL,PERIOD_M1,360,0,MODE_SMA,PRICE_CLOSE,0);
 double ma650_1=iMA(NULL,PERIOD_M1,650,0,MODE_SMA,PRICE_CLOSE,0);
 double ma05_5=iMA(NULL,PERIOD_M5,5,0,MODE_SMA,PRICE_CLOSE,0);
 double ma08_5=iMA(NULL,PERIOD_M5,8,0,MODE_SMA,PRICE_CLOSE,0);
 double ma12_5=iMA(NULL,PERIOD_M5,12,0,MODE_SMA,PRICE_CLOSE,0);
 double ma45_5=iMA(NULL,PERIOD_M5,45,0,MODE_SMA,PRICE_CLOSE,0);
 double ma90_5=iMA(NULL,PERIOD_M5,90,0,MODE_SMA,PRICE_CLOSE,0);
 double ma180_5=iMA(NULL,PERIOD_M5,180,0,MODE_SMA,PRICE_CLOSE,0);
 double ma360_5=iMA(NULL,PERIOD_M5,360,0,MODE_SMA,PRICE_CLOSE,0);
 double ma650_5=iMA(NULL,PERIOD_M5,650,0,MODE_SMA,PRICE_CLOSE,0);
 double ma05_15=iMA(NULL,PERIOD_M15,5,0,MODE_SMA,PRICE_CLOSE,0);
 double ma08_15=iMA(NULL,PERIOD_M15,8,0,MODE_SMA,PRICE_CLOSE,0);
 double ma12_15=iMA(NULL,PERIOD_M15,12,0,MODE_SMA,PRICE_CLOSE,0);
 double ma45_15=iMA(NULL,PERIOD_M15,45,0,MODE_SMA,PRICE_CLOSE,0);
 double ma90_15=iMA(NULL,PERIOD_M15,90,0,MODE_SMA,PRICE_CLOSE,0);
 double ma180_15=iMA(NULL,PERIOD_M15,180,0,MODE_SMA,PRICE_CLOSE,0);
 double ma360_15=iMA(NULL,PERIOD_M15,360,0,MODE_SMA,PRICE_CLOSE,0);
 double ma650_15=iMA(NULL,PERIOD_M15,650,0,MODE_SMA,PRICE_CLOSE,0);
 double ma05_30=iMA(NULL,PERIOD_M30,5,0,MODE_SMA,PRICE_CLOSE,0);
 double ma08_30=iMA(NULL,PERIOD_M30,8,0,MODE_SMA,PRICE_CLOSE,0);
 double ma12_30=iMA(NULL,PERIOD_M30,12,0,MODE_SMA,PRICE_CLOSE,0);
 double ma45_30=iMA(NULL,PERIOD_M30,45,0,MODE_SMA,PRICE_CLOSE,0);
 double ma90_30=iMA(NULL,PERIOD_M30,90,0,MODE_SMA,PRICE_CLOSE,0);
 double ma180_30=iMA(NULL,PERIOD_M30,180,0,MODE_SMA,PRICE_CLOSE,0);
 double ma360_30=iMA(NULL,PERIOD_M30,360,0,MODE_SMA,PRICE_CLOSE,0);
 double ma650_30=iMA(NULL,PERIOD_M30,650,0,MODE_SMA,PRICE_CLOSE,0);
 double ma05_60=iMA(NULL,PERIOD_H1,5,0,MODE_SMA,PRICE_CLOSE,0);
 double ma08_60=iMA(NULL,PERIOD_H1,8,0,MODE_SMA,PRICE_CLOSE,0);
 double ma12_60=iMA(NULL,PERIOD_H1,12,0,MODE_SMA,PRICE_CLOSE,0);
 double ma45_60=iMA(NULL,PERIOD_H1,45,0,MODE_SMA,PRICE_CLOSE,0);
 double ma90_60=iMA(NULL,PERIOD_M1,90,0,MODE_SMA,PRICE_CLOSE,0);
 double ma180_60=iMA(NULL,PERIOD_H1,180,0,MODE_SMA,PRICE_CLOSE,0);
 double ma3640_60=iMA(NULL,PERIOD_H1,360,0,MODE_SMA,PRICE_CLOSE,0);
 double ma650_60=iMA(NULL,PERIOD_H1,650,0,MODE_SMA,PRICE_CLOSE,0);
 double ma05_240=iMA(NULL,PERIOD_H4,5,0,MODE_SMA,PRICE_CLOSE,0);
 double ma08_240=iMA(NULL,PERIOD_H4,8,0,MODE_SMA,PRICE_CLOSE,0);
 double ma12_240=iMA(NULL,PERIOD_H4,12,0,MODE_SMA,PRICE_CLOSE,0);
 double ma45_240=iMA(NULL,PERIOD_H4,45,0,MODE_SMA,PRICE_CLOSE,0);
 double ma90_240=iMA(NULL,PERIOD_H4,90,0,MODE_SMA,PRICE_CLOSE,0);
 double ma180_240=iMA(NULL,PERIOD_H4,180,0,MODE_SMA,PRICE_CLOSE,0);
 double ma360_240=iMA(NULL,PERIOD_H4,360,0,MODE_SMA,PRICE_CLOSE,0);
 double ma650_240=iMA(NULL,PERIOD_H4,650,0,MODE_SMA,PRICE_CLOSE,0);
 double ma05_1440=iMA(NULL,PERIOD_D1,5,0,MODE_SMA,PRICE_CLOSE,0);
 double ma45_1440=iMA(NULL,PERIOD_D1,45,0,MODE_SMA,PRICE_CLOSE,0);
 double ma90_1440=iMA(NULL,PERIOD_D1,90,0,MODE_SMA,PRICE_CLOSE,0);
 double ma180_1440=iMA(NULL,PERIOD_D1,180,0,MODE_SMA,PRICE_CLOSE,0);
 double ma360_1440=iMA(NULL,PERIOD_D1,360,0,MODE_SMA,PRICE_CLOSE,0);
 double ma650_1440=iMA(NULL,PERIOD_D1,650,0,MODE_SMA,PRICE_CLOSE,0);
 double ma05_10080=iMA(NULL,PERIOD_W1,5,0,MODE_SMA,PRICE_CLOSE,0);
 double ma45_10080=iMA(NULL,PERIOD_W1,45,0,MODE_SMA,PRICE_CLOSE,0);
 double ma90_10080=iMA(NULL,PERIOD_W1,90,0,MODE_SMA,PRICE_CLOSE,0);
 double ma180_10080=iMA(NULL,PERIOD_W1,180,0,MODE_SMA,PRICE_CLOSE,0);
 double ma360_10080=iMA(NULL,PERIOD_W1,360,0,MODE_SMA,PRICE_CLOSE,0);
 double ma650_10080=iMA(NULL,PERIOD_W1,650,0,MODE_SMA,PRICE_CLOSE,0);
 

 //*********************************************************

 int      ticket;
 double   lots=0.1;
 int      total=OrdersTotal();
 datetime otm=OrderOpenTime();
//*********************************************************

 
 //將m1的16-bar的均線值及開收高低存於陣列中
 
  double ma05_01_buffer[68],ma08_01_buffer[68],  ma12_01_buffer[68],ma45_01_buffer[68], ma90_01_buffer[68] ,ma180_01_buffer[68] , ma360_01_buffer[68] , ma650_01_buffer[68];
  double open_01_buffer[68], close_01_buffer[68] ,high_01_buffer[68] , low_01_buffer[68] , time_01_buffer[68] ,Volume_01_buffer[68];
  double k1_01_buffer[68],d1_01_buffer[68],k2_01_buffer[68],d2_01_buffer[68],k3_01_buffer[68],d3_01_buffer[68];
  double macdmainline_01_buffer[68],macdsignalline_01_buffer[68];
 
  int    b_01,bar68_01=ArraySize(ma05_01_buffer);

  ArraySetAsSeries(ma05_01_buffer,true);
  for(b_01=0; b_01<bar68_01 ; b_01++)
    ma05_01_buffer[b_01]=iMA(NULL,PERIOD_M1,5,0,MODE_SMA,PRICE_CLOSE,b_01);
  for(b_01=0; b_01<bar68_01 ; b_01++)
    ma08_01_buffer[b_01]=iMA(NULL,PERIOD_M1,8,0,MODE_SMA,PRICE_CLOSE,b_01);
  for(b_01=0; b_01<bar68_01 ; b_01++)
    ma12_01_buffer[b_01]=iMA(NULL,PERIOD_M1,12,0,MODE_SMA,PRICE_CLOSE,b_01);
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
 // Comment ("7=",ma05_01_buffer[7]," 6=",ma05_01_buffer[6],"  5=",ma05_01_buffer[5],"   4=",ma05_01_buffer[4],
 //         "3=",ma05_01_buffer[3]," 2=",ma05_01_buffer[2],"  1=",ma05_01_buffer[1],"   0=",ma05_01_buffer[0]);
// Comment ("7=",ma12_01_buffer[7]," 6=",ma12_01_buffer[6],"  5=",ma12_01_buffer[5],"   4=",ma12_01_buffer[4],
  //        "  3=",ma12_01_buffer[3]," 2=",ma12_01_buffer[2],"  1=",ma12_01_buffer[1],"   0=",ma12_01_buffer[0]);

 
  
  //記錄16-bar 及17-32-bar之最高最低價
 double m1highest20bar;
 double m1highest1740bar;
 double m1lowest20bar;
 double m1lowest1740bar;
 double m1highest20bartime;
 double m1highest1740bartime;
 double m1lowest20bartime;
 double m1lowest1740bartime;

 //*********************************************************

 
 //將m5的16-bar的均線值及開收高低存於陣列中
 
  double ma05_05_buffer[68],ma08_05_buffer[68],  ma12_05_buffer[68],ma45_05_buffer[68], ma90_05_buffer[68] ,ma180_05_buffer[68] , ma360_05_buffer[68] , ma650_05_buffer[68];
  double open_05_buffer[68], close_05_buffer[68] ,high_05_buffer[68] , low_05_buffer[68] , time_05_buffer[68] ,Volume_05_buffer[68];
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
 //for macd
  for(b_05=0; b_05<bar68_05 ; b_05++)
    macdmainline_05_buffer[b_05]=iMACD(NULL,PERIOD_M5,12,26,9,PRICE_CLOSE,MODE_MAIN,b_05);
  for(b_05=0; b_05<bar68_05 ; b_05++)
    macdsignalline_05_buffer[b_05]=iMACD(NULL,PERIOD_M5,12,26,9,PRICE_CLOSE,MODE_SIGNAL,b_05);
 // Comment ("7=",ma05_05_buffer[7]," 6=",ma05_05_buffer[6],"  5=",ma05_05_buffer[5],"   4=",ma05_05_buffer[4],
 //         "3=",ma05_05_buffer[3]," 2=",ma05_05_buffer[2],"  1=",ma05_05_buffer[1],"   0=",ma05_05_buffer[0]);
// Comment ("7=",ma12_05_buffer[7]," 6=",ma12_05_buffer[6],"  5=",ma12_05_buffer[5],"   4=",ma12_05_buffer[4],
  //        "  3=",ma12_05_buffer[3]," 2=",ma12_05_buffer[2],"  1=",ma12_05_buffer[1],"   0=",ma12_05_buffer[0]);

 
  
  //記錄16-bar 及17-32-bar之最高最低價
 double m5highest20bar;
 double m5highest1740bar;
 double m5lowest20bar;
 double m5lowest1740bar;
 double m5highest20bartime;
 double m5highest1740bartime;
 double m5lowest20bartime;
 double m5lowest1740bartime;
 
 m5highest20bar=High[iHighest(NULL,PERIOD_M5,MODE_HIGH,16,0)];   //20bar的最高價
 m5highest1740bar=High[iHighest(NULL,PERIOD_M5,MODE_HIGH,40,17)];   //17-40bar的最高價
 m5highest20bartime=High[iHighest(NULL,PERIOD_M5,MODE_TIME,16,0)];   //20bar的最高價的時間
 m5highest1740bartime=High[iHighest(NULL,PERIOD_M5,MODE_TIME,40,17)];  //17-40bar的最高價的時間

 m5lowest20bar=Low[iLowest(NULL,PERIOD_M5,MODE_LOW,16,0)];     //20bar的最低價
 m5lowest1740bar=Low[iLowest(NULL,PERIOD_M5,MODE_LOW,40,17)];   //17-40bar的最低價
 m5lowest20bartime=Low[iLowest(NULL,PERIOD_M5,MODE_TIME,16,0)];    //20bar的最低價的時間
 m5lowest1740bartime=Low[iLowest(NULL,PERIOD_M5,MODE_TIME,40,17)];    //17-40bar的最低價的時間  
  //Comment ("high0-16=",highest20bar,"  low0-16=",lowest20bar,"    high17-32=",highest1740bar,"   low17-40=",lowest1740bar);

 //*********************************************************

 //將M15的68-bar的均線值及開收高低存於陣列中
 
  double ma05_15_buffer[68],ma08_15_buffer[68], ma12_15_buffer[68],ma45_15_buffer[68], ma90_15_buffer[68] ,ma180_15_buffer[68] , ma360_15_buffer[68] , ma650_15_buffer[68];
  double open_15_buffer[68], close_15_buffer[68] ,high_15_buffer[68] , low_15_buffer[68] , time_15_buffer[68] ,Volume_15_buffer[68];
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
 //for macd
  for(b_15=0; b_15<bar68_15 ; b_15++)
    macdmainline_15_buffer[b_15]=iMACD(NULL,PERIOD_M15,12,26,9,PRICE_CLOSE,MODE_MAIN,b_15);
  for(b_15=0; b_15<bar68_15 ; b_15++)
    macdsignalline_15_buffer[b_15]=iMACD(NULL,PERIOD_M15,12,26,9,PRICE_CLOSE,MODE_SIGNAL,b_15);
// Comment ("7=",ma05_15_buffer[7]," 6=",ma05_15_buffer[6],"  5=",ma05_15_buffer[5],"   4=",ma05_15_buffer[4],
 //         "3=",ma05_15_buffer[3]," 2=",ma05_15_buffer[2],"  1=",ma05_15_buffer[1],"   0=",ma05_15_buffer[0]);
// Comment ("7=",ma12_15_buffer[7]," 6=",ma12_15_buffer[6],"  5=",ma12_15_buffer[5],"   4=",ma12_15_buffer[4],
  //        "  3=",ma12_15_buffer[3]," 2=",ma12_15_buffer[2],"  1=",ma12_15_buffer[1],"   0=",ma12_15_buffer[0]);



  //記錄16-bar 及17-32-bar之最高最低價
 double M15highest20bar;
 double M15highest1740bar;
 double M15lowest20bar;
 double M15lowest1740bar;
 double M15highest20bartime;
 double M15highest1740bartime;
 double M15lowest20bartime;
 double M15lowest1740bartime;
 
 M15highest20bar=High[iHighest(NULL,PERIOD_M15,MODE_HIGH,16,0)];   //20bar的最高價
 M15highest1740bar=High[iHighest(NULL,PERIOD_M15,MODE_HIGH,40,17)];   //17-40bar的最高價
 M15highest20bartime=High[iHighest(NULL,PERIOD_M15,MODE_TIME,16,0)];   //20bar的最高價的時間
 M15highest1740bartime=High[iHighest(NULL,PERIOD_M15,MODE_TIME,40,17)];  //17-40bar的最高價的時間

 M15lowest20bar=Low[iLowest(NULL,PERIOD_M15,MODE_LOW,16,0)];     //20bar的最低價
 M15lowest1740bar=Low[iLowest(NULL,PERIOD_M15,MODE_LOW,40,17)];   //17-40bar的最低價
 M15lowest20bartime=Low[iLowest(NULL,PERIOD_M15,MODE_TIME,16,0)];    //20bar的最低價的時間
 M15lowest1740bartime=Low[iLowest(NULL,PERIOD_M15,MODE_TIME,40,17)];    //17-40bar的最低價的時間  
 //Comment ("high0-16=",highest20bar,"  low0-16=",lowest20bar,"    high17-32=",highest1740bar,"   low17-40=",lowest1740bar);
 
//**********************************************************************
 //將m30的68-bar的均線值及開收高低存於陣列中
 
  double ma05_30_buffer[68],ma08_30_buffer[68], ma12_30_buffer[68],ma45_30_buffer[68], ma90_30_buffer[68] ,ma180_30_buffer[68] , ma360_30_buffer[68] , ma650_30_buffer[68];
  double open_30_buffer[68], close_30_buffer[68] ,high_30_buffer[68] , low_30_buffer[68] , time_30_buffer[68] ,Volume_30_buffer[68];
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
 //for macd
  for(b_30=0; b_30<bar68_30 ; b_30++)
    macdmainline_30_buffer[b_30]=iMACD(NULL,PERIOD_M30,12,26,9,PRICE_CLOSE,MODE_MAIN,b_30);
  for(b_30=0; b_30<bar68_30 ; b_30++)
    macdsignalline_30_buffer[b_30]=iMACD(NULL,PERIOD_M30,12,26,9,PRICE_CLOSE,MODE_SIGNAL,b_30);
// Comment ("7=",ma05_30_buffer[7]," 6=",ma05_30_buffer[6],"  5=",ma05_30_buffer[5],"   4=",ma05_30_buffer[4],
//          "3=",ma05_30_buffer[3]," 2=",ma05_30_buffer[2],"  1=",ma05_30_buffer[1],"   0=",ma05_30_buffer[0]);

 
 //記錄16-bar 及17-32-bar之最高最低價
 double M30highest20bar;
 double M30highest1740bar;
 double M30lowest20bar;
 double M30lowest1740bar;
 double M30highest20bartime;
 double M30highest1740bartime;
 double M30lowest20bartime;
 double M30lowest1740bartime;
 
 M30highest20bar=High[iHighest(NULL,PERIOD_M30,MODE_HIGH,16,0)];   //20bar的最高價
 M30highest1740bar=High[iHighest(NULL,PERIOD_M30,MODE_HIGH,40,17)];   //17-40bar的最高價
 M30highest20bartime=High[iHighest(NULL,PERIOD_M30,MODE_TIME,16,0)];   //20bar的最高價的時間
 M30highest1740bartime=High[iHighest(NULL,PERIOD_M30,MODE_TIME,40,17)];  //17-40bar的最高價的時間

 M30lowest20bar=Low[iLowest(NULL,PERIOD_M30,MODE_LOW,16,0)];     //20bar的最低價
 M30lowest1740bar=Low[iLowest(NULL,PERIOD_M30,MODE_LOW,40,17)];   //17-40bar的最低價
 M30lowest20bartime=Low[iLowest(NULL,PERIOD_M30,MODE_TIME,16,0)];    //20bar的最低價的時間
 M30lowest1740bartime=Low[iLowest(NULL,PERIOD_M30,MODE_TIME,40,17)];    //17-40bar的最低價的時間  
 //Comment ("high0-16=",highest20bar,"  low0-16=",lowest20bar,"    high17-32=",highest1740bar,"   low17-40=",lowest1740bar);


//**********************************************************************
 //將m60的68-bar的均線值及開收高低存於陣列中
 
  double ma05_60_buffer[68],ma08_60_buffer[68], ma12_60_buffer[68],ma45_60_buffer[68], ma90_60_buffer[68] ,ma180_60_buffer[68] , ma360_60_buffer[68] , ma650_60_buffer[68];
  double open_60_buffer[68], close_60_buffer[68] ,high_60_buffer[68] , low_60_buffer[68] , time_60_buffer[68] ,Volume_60_buffer[68];
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
 //for macd
  for(b_60=0; b_60<bar68_60 ; b_60++)
    macdmainline_60_buffer[b_60]=iMACD(NULL,PERIOD_H1,12,26,9,PRICE_CLOSE,MODE_MAIN,b_60);
  for(b_60=0; b_60<bar68_60 ; b_60++)
    macdsignalline_60_buffer[b_60]=iMACD(NULL,PERIOD_H1,12,26,9,PRICE_CLOSE,MODE_SIGNAL,b_60);
// Comment ("7=",ma05_60_buffer[7]," 6=",ma05_60_buffer[6],"  5=",ma05_60_buffer[5],"   4=",ma05_60_buffer[4],
//          "3=",ma05_60_buffer[3]," 2=",ma05_60_buffer[2],"  1=",ma05_60_buffer[1],"   0=",ma05_60_buffer[0]);


  //記錄16-bar 及17-32-bar之最高最低價
 double H1highest20bar;
 double H1highest1740bar;
 double H1lowest20bar;
 double H1lowest1740bar;
 double H1highest20bartime;
 double H1highest1740bartime;
 double H1lowest20bartime;
 double H1lowest1740bartime;
 
 H1highest20bar=High[iHighest(NULL,PERIOD_H1,MODE_HIGH,16,0)];   //20bar的最高價
 H1highest1740bar=High[iHighest(NULL,PERIOD_H1,MODE_HIGH,40,17)];   //17-40bar的最高價
 H1highest20bartime=High[iHighest(NULL,PERIOD_H1,MODE_TIME,16,0)];   //20bar的最高價的時間
 H1highest1740bartime=High[iHighest(NULL,PERIOD_H1,MODE_TIME,40,17)];  //17-40bar的最高價的時間

 H1lowest20bar=Low[iLowest(NULL,PERIOD_H1,MODE_LOW,16,0)];     //20bar的最低價
 H1lowest1740bar=Low[iLowest(NULL,PERIOD_H1,MODE_LOW,40,17)];   //17-40bar的最低價
 H1lowest20bartime=Low[iLowest(NULL,PERIOD_H1,MODE_TIME,16,0)];    //20bar的最低價的時間
 H1lowest1740bartime=Low[iLowest(NULL,PERIOD_H1,MODE_TIME,40,17)];    //17-40bar的最低價的時間  
 //Comment ("high0-16=",highest20bar,"  low0-16=",lowest20bar,"    high17-32=",highest1740bar,"   low17-40=",lowest1740bar);


//**********************************************************************
 //將H4的68-bar的均線值及開收高低存於陣列中
 
  double ma05_240_buffer[68],ma08_240_buffer[68], ma12_240_buffer[68],ma45_240_buffer[68], ma90_240_buffer[68] ,ma180_240_buffer[68] , ma360_240_buffer[68] , ma650_240_buffer[68];
  double open_240_buffer[68], close_240_buffer[68] ,high_240_buffer[68] , low_240_buffer[68] , time_240_buffer[68] ,Volume_240_buffer[68];
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

// Comment ("7=",ma05_60_buffer[7]," 6=",ma05_60_buffer[6],"  5=",ma05_60_buffer[5],"   4=",ma05_60_buffer[4],
//          "3=",ma05_60_buffer[3]," 2=",ma05_60_buffer[2],"  1=",ma05_60_buffer[1],"   0=",ma05_60_buffer[0]);


 double H4highest20bar;
 double H4highest1740bar;
 double H4lowest20bar;
 double H4lowest1740bar;
 double H4highest20bartime;
 double H4highest1740bartime;
 double H4lowest20bartime;
 double H4lowest1740bartime;
 
 //記錄16-bar 及17-32-bar之最高最低價
 H4highest20bar=High[iHighest(NULL,PERIOD_H4,MODE_HIGH,16,0)];   //20bar的最高價
 H4highest1740bar=High[iHighest(NULL,PERIOD_H4,MODE_HIGH,40,17)];   //17-40bar的最高價
 H4highest20bartime=High[iHighest(NULL,PERIOD_H4,MODE_TIME,16,0)];   //20bar的最高價的時間
 H4highest1740bartime=High[iHighest(NULL,PERIOD_H4,MODE_TIME,40,17)];  //17-40bar的最高價的時間

 H4lowest20bar=Low[iLowest(NULL,PERIOD_H4,MODE_LOW,16,0)];     //20bar的最低價
 H4lowest1740bar=Low[iLowest(NULL,PERIOD_H4,MODE_LOW,40,17)];   //17-40bar的最低價
 H4lowest20bartime=Low[iLowest(NULL,PERIOD_H4,MODE_TIME,16,0)];    //20bar的最低價的時間
 H4lowest1740bartime=Low[iLowest(NULL,PERIOD_H4,MODE_TIME,40,17)];    //17-40bar的最低價的時間  

 //Comment ("high0-16=",highest20bar,"  low0-16=",lowest20bar,"    high17-32=",highest1740bar,"   low17-40=",lowest1740bar);
 
 
 //**************************************************************************************************************

 
 

 
 
 
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
 
                       
      
//*** Buy  1  ***************************************************************************************** 
          
  if (OrdersTotal()<=1)   
     {                                           //m15 的ma45  ma90 為斜L下跌末端型態 
           if (ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=-0.0001 && 
                                                 //下跌末端上升要一次升過前3bar
              close_15_buffer[1]-close_15_buffer[2]>=0.0001  && // close_15_buffer[1]-close_15_buffer[3]>=0.0001 &&
      //        close_15_buffer[1]-close_15_buffer[4]>=0.0001  &&
                                             //用m15 m30 macd 控管買賣點 
              macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00010 &&
              macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]>=-0.00050 &&  macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00010 &&
                                             //k1 (k2||k3)已上升
              k1_15_buffer[1]-k1_15_buffer[2]>=1  &&  k1_15_buffer[1]-d1_15_buffer[1]>=1 &&
              k2_15_buffer[1]-k2_15_buffer[2]>=0  ||  k3_15_buffer[1]-k3_15_buffer[2]>=0)
              if   ((macdmainline_15_buffer[1]>=-0.00060 && macdmainline_15_buffer[1]<=0.00060 &&
                    macdsignalline_30_buffer[1]>=-0.00060 && macdsignalline_30_buffer[1]<=0.00060) ||
                   
                   (ma05_60_buffer[1]-ma05_60_buffer[2]<=-0.0002 && ma08_60_buffer[1]-ma08_60_buffer[2]<=-0.0002 &&
                    ma12_60_buffer[1]-ma12_60_buffer[2]<=-0.0002 && ma05_60_buffer[1]-ma12_60_buffer[2]<=-0.0012 &&
                    macdsignalline_60_buffer[1]-macdsignalline_60_buffer[2]<=-0.00025 &&
                    close_60_buffer[1]-ma08_60_buffer[1]<=0.0004))
                   return;
                   else                        
           
                   OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-28*Point,Ask+450*Point,"My order #B1",8801,0,Red );
 
 //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    2     +++++++++++++++++++++
          if  ((ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0) ||
               (ma90_15_buffer[1]-ma90_15_buffer[2]>=0 && ma180_15_buffer[1]-ma180_15_buffer[2]>=0) &&
                                                    //用m15 m30 macd 控管買賣點 
               macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00010 && 
               macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]>=-0.00050 &&  macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00010 &&

               k1_15_buffer[1]<=60 && k2_15_buffer[1]<=60 && k3_15_buffer[1]<=60  && 
                k1_15_buffer[1]-k1_15_buffer[2]>=1  &&  k1_15_buffer[1]-d1_15_buffer[1]>=1 && 
               (k2_15_buffer[1]-k2_15_buffer[2]>=0  ||  k3_15_buffer[1]-k3_15_buffer[2]>=0)) 
               if   ((macdmainline_15_buffer[1]>=-0.00060 && macdmainline_15_buffer[1]<=0.00060 &&
                    macdsignalline_30_buffer[1]>=-0.00060 && macdsignalline_30_buffer[1]<=0.00060) ||
                   
                   (ma05_60_buffer[1]-ma05_60_buffer[2]<=-0.0002 && ma08_60_buffer[1]-ma08_60_buffer[2]<=-0.0002 &&
                    ma12_60_buffer[1]-ma12_60_buffer[2]<=-0.0002 && ma05_60_buffer[1]-ma12_60_buffer[2]<=-0.0012 &&
                    macdsignalline_60_buffer[1]-macdsignalline_60_buffer[2]<=-0.00025 &&
                    close_60_buffer[1]-ma08_60_buffer[1]<=0.0004))
                     return;
                     else                                
           
                     OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-28*Point,Ask+450*Point,"My order #B2",8802,0,Yellow );
                                             
 //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    3     +++++++++++++++++++++
                                                      //k1 一次上升大 kd1大幅交叉上 
         if   ((k1_15_buffer[1]-k1_15_buffer[2]>=10  &&  k1_15_buffer[1]-d1_15_buffer[1]>=5  &&
                                                   //m15 的ma45  ma90 為斜L下跌末端型態 
               (ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0) || 
               (ma90_15_buffer[1]-ma90_15_buffer[2]>=0 && ma180_15_buffer[1]-ma180_15_buffer[2]>=0) &&                                  //下跌末端上升要一次升過前3bar
                                            //用m15 m30 macd 控管買賣點 
              macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00010 &&
              macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]>=-0.00050 &&  macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00010))
              if   ((macdmainline_15_buffer[1]>=-0.00060 && macdmainline_15_buffer[1]<=0.00060 &&
                    macdsignalline_30_buffer[1]>=-0.00060 && macdsignalline_30_buffer[1]<=0.00060) ||
                   
                   (ma05_60_buffer[1]-ma05_60_buffer[2]<=-0.0002 && ma08_60_buffer[1]-ma08_60_buffer[2]<=-0.0002 &&
                    ma12_60_buffer[1]-ma12_60_buffer[2]<=-0.0002 && ma05_60_buffer[1]-ma12_60_buffer[2]<=-0.0012 &&
                    macdsignalline_60_buffer[1]-macdsignalline_60_buffer[2]<=-0.00025 &&
                    close_60_buffer[1]-ma08_60_buffer[1]<=0.0004))
                    return;
                    else                               
           
                   OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-28*Point,Ask+450*Point,"My order #B3",8803,0,Blue );
 
 //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    4     +++++++++++++++++++++
                                                         //m15 的ma180,ma360 or ma360,ma650 or ma650 上升幅度大
                                             
          if   ((ma180_15_buffer[1]-ma180_15_buffer[40]>=0.0020 && ma360_15_buffer[1]-ma360_15_buffer[40]>=0.0020 &&
                                        //k1,k2,k3 <=30
                k1_15_buffer[1]<=30 && k2_15_buffer[1]<=30  &&  k3_15_buffer[1]<=30 && 
                                        //[1]收黑 且<-=0.0006  [1]<= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]<=-0.0006 && close_15_buffer[1]-ma180_15_buffer[1]<=-0.0006) ||
                
               
               (ma360_15_buffer[1]-ma360_15_buffer[40]>=0.0020 && ma650_15_buffer[1]-ma650_15_buffer[40]>=0.0020 &&
                                        //k1,k2,k3 <=30
                k1_15_buffer[1]<=30 && k2_15_buffer[1]<=30  &&  k3_15_buffer[1]<=30 && 
                                        //[1]收紅 且<=-0.0006  [1]<= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]<=-0.0006 && close_15_buffer[1]-ma360_15_buffer[1]<=-0.0006) ||
                
                (ma650_15_buffer[1]-ma650_15_buffer[40]>=0.0020 &&
                                        //k1,k2,k3 >=70
                k1_15_buffer[1]<=30 && k2_15_buffer[1]<=30  &&  k3_15_buffer[1]<=30 && 
                                        //[1]收紅 且>=0.0006  [1]>= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]<=-0.0006 && close_15_buffer[1]-ma360_15_buffer[1]<=-0.0006)) 
           
                 
               if   ((macdmainline_15_buffer[1]>=-0.00060 && macdmainline_15_buffer[1]<=0.00060 &&
                    macdsignalline_30_buffer[1]>=-0.00060 && macdsignalline_30_buffer[1]<=0.00060) ||
                   
                   (ma05_60_buffer[1]-ma05_60_buffer[2]<=-0.0002 && ma08_60_buffer[1]-ma08_60_buffer[2]<=-0.0002 &&
                    ma12_60_buffer[1]-ma12_60_buffer[2]<=-0.0002 && ma05_60_buffer[1]-ma12_60_buffer[2]<=-0.0012 &&
                    macdsignalline_60_buffer[1]-macdsignalline_60_buffer[2]<=-0.00025 &&
                    close_60_buffer[1]-ma08_60_buffer[1]<=0.0004))
                     return;
                     else   
                     OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-23*Point,Ask+450*Point,"My order #B4",8804,0,Brown );
                     buyorder4=OrderTicket();
    
            
     }
    
    
    

//***************************************************************************************************************************             
//*** Sell  1  ********************************************************************************************************************** 
           
    if (OrdersTotal()<=1)   
     {                                               //m15 的ma45  ma90 為 ㄏ 上升末端型態
          if (ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0.0001 && 
                                                     //上升末端下跌要一次跌破前3bar
              close_15_buffer[1]-close_15_buffer[2]<=-0.0001  && // close_15_buffer[1]-close_15_buffer[3]<=-0.0001 &&
        //      close_15_buffer[1]-close_15_buffer[4]<=-0.0001  &&
                                                 //用m15 m30 macd 控管買賣點 
               macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00010 &&
               macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00050 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00010 &&
                                                   //k1 (k2||k3)已下跌
              k1_15_buffer[1]-k1_15_buffer[2]<=-1  &&  k1_15_buffer[1]-d1_15_buffer[1]<=-1 &&
              k2_15_buffer[1]-k2_15_buffer[2]<=0  ||  k3_15_buffer[1]-k3_15_buffer[2]<=0)
            
              if   ((macdmainline_15_buffer[1]>=-0.00060 && macdmainline_15_buffer[1]<=0.00060 &&
                    macdsignalline_30_buffer[1]>=-0.00060 && macdsignalline_30_buffer[1]<=0.00060) ||
                   
                   (ma05_60_buffer[1]-ma05_60_buffer[2]>=0.0002 && ma08_60_buffer[1]-ma08_60_buffer[2]>=0.0002 &&
                    ma12_60_buffer[1]-ma12_60_buffer[2]>=0.0002 && ma05_60_buffer[1]-ma12_60_buffer[2]>=0.0012 &&
                    macdsignalline_60_buffer[1]-macdsignalline_60_buffer[2]>=0.00025 &&
                    close_60_buffer[1]-ma08_60_buffer[1]>=-0.0004))
                 
                   return;
                   else                             
           
                                     
              OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+28*Point,Bid-450*Point,"My order #S1",4401,0,Green );
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  2  +++++++++++++++++++++++++++++++++++++
          if  ((ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=0) || 
               (ma90_15_buffer[1]-ma90_15_buffer[2]<=0 && ma180_15_buffer[1]-ma180_15_buffer[2]<=0) &&
                                                    //用m15 m30 macd 控管買賣點                                                    
               macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=0.00010 &&
               macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00050 &&  macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]>=0.00010 &&

               k1_15_buffer[1]>=40 && k2_15_buffer[1]>=40 && k3_15_buffer[1]>=40 && 
               k1_15_buffer[1]-k1_15_buffer[2]<=-1  &&  k1_15_buffer[1]-d1_15_buffer[1]<=-1 && 
               (k2_15_buffer[1]-k2_15_buffer[2]<=0  ||  k3_15_buffer[1]-k3_15_buffer[2]<=0))         
              if   ((macdmainline_15_buffer[1]>=-0.00060 && macdmainline_15_buffer[1]<=0.00060 &&
                    macdsignalline_30_buffer[1]>=-0.00060 && macdsignalline_30_buffer[1]<=0.00060) ||
                   
                   (ma05_60_buffer[1]-ma05_60_buffer[2]>=0.0002 && ma08_60_buffer[1]-ma08_60_buffer[2]>=0.0002 &&
                    ma12_60_buffer[1]-ma12_60_buffer[2]>=0.0002 && ma05_60_buffer[1]-ma12_60_buffer[2]>=0.0012 &&
                    macdsignalline_60_buffer[1]-macdsignalline_60_buffer[2]>=0.00025 &&
                    close_60_buffer[1]-ma08_60_buffer[1]>=-0.0004))
                                 
                 
               OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+28*Point,Bid-450*Point,"My order #S2",4402,0,White );
      
 //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  3  +++++++++++++++++++++++++++++++++++++
                                       //k1 一次下跌深 kd1大幅交叉下 
        if     ((k1_15_buffer[1]-k1_15_buffer[2]<=-10  &&  k1_15_buffer[1]-d1_15_buffer[1]<=-5 &&
                                        
               (ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=0) || 
               (ma90_15_buffer[1]-ma90_15_buffer[2]<=0 && ma180_15_buffer[1]-ma180_15_buffer[2]<=0) && 
                                                     
                                                 //用m15 m30 macd 控管買賣點 
               macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00010 &&
               macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00050 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00010))
              
              if   ((macdmainline_15_buffer[1]>=-0.00060 && macdmainline_15_buffer[1]<=0.00060 &&
                    macdsignalline_30_buffer[1]>=-0.00060 && macdsignalline_30_buffer[1]<=0.00060) ||
                   
                   (ma05_60_buffer[1]-ma05_60_buffer[2]>=0.0002 && ma08_60_buffer[1]-ma08_60_buffer[2]>=0.0002 &&
                    ma12_60_buffer[1]-ma12_60_buffer[2]>=0.0002 && ma05_60_buffer[1]-ma12_60_buffer[2]>=0.0012 &&
                    macdsignalline_60_buffer[1]-macdsignalline_60_buffer[2]>=0.00025 &&
                    close_60_buffer[1]-ma08_60_buffer[1]>=-0.0004))
                   return;
                   else                               
                   OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+28*Point,Bid-450*Point,"My order #S3",4403,0,Lime );
 
 //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    4     +++++++++++++++++++++
         
                                        //m15 的ma180,ma360 or ma360,ma650 or ma650 下跌幅度大
                                             
          if   ((ma180_15_buffer[1]-ma180_15_buffer[40]<=-0.0020 && ma360_15_buffer[1]-ma360_15_buffer[40]<=-0.0020 &&
                                        //k1,k2,k3 >=70
                k1_15_buffer[1]>=70 && k2_15_buffer[1]>=70  &&  k3_15_buffer[1]>=70 && 
                                        //[1]收紅 且>=0.0006  [1]>= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]>=0.0006 && close_15_buffer[1]-ma180_15_buffer[1]>=0.0006) ||
                
               
               (ma360_15_buffer[1]-ma360_15_buffer[40]<=-0.0020 && ma650_15_buffer[1]-ma650_15_buffer[40]<=-0.0020 &&
                                        //k1,k2,k3 >=70
                k1_15_buffer[1]>=70 && k2_15_buffer[1]>=70  &&  k3_15_buffer[1]>=70 && 
                                        //[1]收紅 且>=0.0006  [1]>= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]>=0.0006 && close_15_buffer[1]-ma360_15_buffer[1]>=0.0006) ||
                
                (ma650_15_buffer[1]-ma650_15_buffer[40]<=-0.0020 &&
                                        //k1,k2,k3 >=70
                k1_15_buffer[1]>=70 && k2_15_buffer[1]>=70  &&  k3_15_buffer[1]>=70 && 
                                        //[1]收紅 且>=0.0006  [1]>= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]>=0.0006 && close_15_buffer[1]-ma360_15_buffer[1]>=0.0006)) 
           
              if   ((macdmainline_15_buffer[1]>=-0.00060 && macdmainline_15_buffer[1]<=0.00060 &&
                    macdsignalline_30_buffer[1]>=-0.00060 && macdsignalline_30_buffer[1]<=0.00060) ||
                   
                   (ma05_60_buffer[1]-ma05_60_buffer[2]>=0.0002 && ma08_60_buffer[1]-ma08_60_buffer[2]>=0.0002 &&
                    ma12_60_buffer[1]-ma12_60_buffer[2]>=0.0002 && ma05_60_buffer[1]-ma12_60_buffer[2]>=0.0012 &&
                    macdsignalline_60_buffer[1]-macdsignalline_60_buffer[2]>=0.00025 &&
                    close_60_buffer[1]-ma08_60_buffer[1]>=-0.0004))
      
                   return;
                   else   
            
                 OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+23*Point,Bid-450*Point,"My order #S4",4404,0,Gray );
                 sellorder4=OrderTicket();
       
    }
  


 if (OrdersTotal()>0)
 {
   for (cnt=0;cnt<OrdersTotal();cnt++)
     {
       OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES);
 
//***  CLOSE Buy    ********************************************************************************** 

     if   (OrderType()==OP_BUY)       
      {                                             
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    1     +++++++++++++++++++++

          if  ((ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=0) || 
               (ma90_15_buffer[1]-ma90_15_buffer[2]<=0 && ma180_15_buffer[1]-ma180_15_buffer[2]<=0) &&
                                                    //用m15 m30 macd 控管買賣點                                                    
               macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=0.00010 &&
               macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00050 &&  macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]>=0.00010 &&

               k1_15_buffer[1]>=40 && k2_15_buffer[1]>=40 && k3_15_buffer[1]>=40 && 
               k1_15_buffer[1]-k1_15_buffer[2]<=-1  &&  k1_15_buffer[1]-d1_15_buffer[1]<=-1 && 
               (k2_15_buffer[1]-k2_15_buffer[2]<=0  ||  k3_15_buffer[1]-k3_15_buffer[2]<=0))         
                OrderClose(OrderTicket(),lots,Ask,1,Red);    
    //                                                   //確定剛close買單,目前無單,不加此條會反覆close   
    //            if (TimeCurrent()-OrderCloseTime()<=100 && OrdersTotal()<=1)
                 
    //                OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+18*Point,Bid-300*Point,"My order #S2",4402,0,White );

  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    2     +++++++++++++++++++++
          
                                                     //m15 的ma45  ma90 為 ㄏ 上升末端型態
          if  ((ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0.0001) || 
               (ma90_15_buffer[1]-ma90_15_buffer[2]>=0 && ma180_15_buffer[1]-ma180_15_buffer[2]>=0.0001) && 
                                                     //上升末端下跌要一次跌破前3bar
              close_15_buffer[1]-close_15_buffer[2]<=-0.0001  && // close_15_buffer[1]-close_15_buffer[3]<=-0.0001 &&
     //         close_15_buffer[1]-close_15_buffer[4]<=-0.0001  &&
                                                 //用m15 m30 macd 控管買賣點 
               macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00010 &&
               macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00050 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00010 &&
                                                   //k1 (k2||k3)已下跌
              k1_15_buffer[1]-k1_15_buffer[2]<=-1  &&  k1_15_buffer[1]-d1_15_buffer[1]<=-1 &&
              (k2_15_buffer[1]-k2_15_buffer[2]<=0  ||  k3_15_buffer[1]-k3_15_buffer[2]<=0))
              OrderClose(OrderTicket(),lots,Ask,1,Yellow);    
   //                                                    //確定剛close買單,目前無單,不加此條會反覆close   
   //            if (TimeCurrent()-OrderCloseTime()<=100 && OrdersTotal()<=1)
                 
   //                OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+18*Point,Bid-300*Point,"My order #S3",4403,0,Lime );

 //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    3     +++++++++++++++++++++
                   
                                              //k1 一次下跌深 kd1大幅交叉下 
        if     ((k1_15_buffer[1]-k1_15_buffer[2]<=-10  &&  k1_15_buffer[1]-d1_15_buffer[1]<=-5 &&
                                        
               (ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=0) || 
               (ma90_15_buffer[1]-ma90_15_buffer[2]<=0 && ma180_15_buffer[1]-ma180_15_buffer[2]<=0) && 
                                                     
                                                 //用m15 m30 macd 控管買賣點 
               macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00010 &&
               macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00050 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00010))
                                            
               OrderClose(OrderTicket(),lots,Ask,1,Blue);    
  //                                                     //確定剛close買單,目前無單,不加此條會反覆close   
  //             if (TimeCurrent()-OrderCloseTime()<=100 && OrdersTotal()<=1)
                 
  //                OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+18*Point,Bid-300*Point,"My order #S4",4404,0,Gray );

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    4     +++++++++++++++++++++
         
                                       //m15 的ma180,ma360 or ma360,ma650 or ma650 下跌幅度大
                                             
          if   ((ma180_15_buffer[1]-ma180_15_buffer[40]<=-0.0020 && ma360_15_buffer[1]-ma360_15_buffer[40]<=-0.0020 &&
                                        //k1,k2,k3 >=70
                k1_15_buffer[1]>=70 && k2_15_buffer[1]>=70  &&  k3_15_buffer[1]>=70 && 
                                        //[1]收紅 且>=0.0006  [1]>= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]>=0.0006 && close_15_buffer[1]-ma180_15_buffer[1]>=0.0006) ||
                
               
               (ma360_15_buffer[1]-ma360_15_buffer[40]<=-0.0020 && ma650_15_buffer[1]-ma650_15_buffer[40]<=-0.0020 &&
                                        //k1,k2,k3 >=70
                k1_15_buffer[1]>=70 && k2_15_buffer[1]>=70  &&  k3_15_buffer[1]>=70 && 
                                        //[1]收紅 且>=0.0006  [1]>= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]>=0.0006 && close_15_buffer[1]-ma360_15_buffer[1]>=0.0006) ||
                
                (ma650_15_buffer[1]-ma650_15_buffer[40]<=-0.0020 &&
                                        //k1,k2,k3 >=70
                k1_15_buffer[1]>=70 && k2_15_buffer[1]>=70  &&  k3_15_buffer[1]>=70 && 
                                        //[1]收紅 且>=0.0006  [1]>= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]>=0.0006 && close_15_buffer[1]-ma360_15_buffer[1]>=0.0006)) 
           
                OrderClose(OrderTicket(),lots,Ask,1,Brown); 
                   
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    5     +++++++++++++++++++++
                                          //m60 大幅下跌
               if  (ma05_60_buffer[1]-ma05_60_buffer[2]<=-0.0002 && ma08_60_buffer[1]-ma08_60_buffer[2]<=-0.0002 &&
                    ma12_60_buffer[1]-ma12_60_buffer[2]<=-0.0002 && ma05_60_buffer[1]-ma12_60_buffer[2]<=-0.0012 &&
                    macdsignalline_60_buffer[1]-macdsignalline_60_buffer[2]<=-0.00025 &&
                    close_60_buffer[1]-ma08_60_buffer[1]<=0.0004)
                     
                    OrderClose(OrderTicket(),lots,Ask,1,Brown); 

   
      }


//***  CLOSE Sell    ********************************************************************************** 

      if  (OrderType()==OP_SELL)
       {  
 //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    1     +++++++++++++++++++++
          if  ((ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0) ||
               (ma90_15_buffer[1]-ma90_15_buffer[2]>=0 && ma180_15_buffer[1]-ma180_15_buffer[2]>=0) &&
                                                    //用m15 m30 macd 控管買賣點 
               macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00010 && 
               macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]>=-0.00050 &&  macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00010 &&

               k1_15_buffer[1]<=60 && k2_15_buffer[1]<=60 && k3_15_buffer[1]<=60  && 
                k1_15_buffer[1]-k1_15_buffer[2]>=1  &&  k1_15_buffer[1]-d1_15_buffer[1]>=1 && 
               (k2_15_buffer[1]-k2_15_buffer[2]>=0  ||  k3_15_buffer[1]-k3_15_buffer[2]>=0)) 
                OrderClose(OrderTicket(),lots,Bid,1,Green); 
      //                                                 //確定剛close賣單,目前無單,不加此條會反覆close  
      //         if (TimeCurrent()-OrderCloseTime()<=100 && OrdersTotal()<=1)
      //             OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-18*Point,Ask+300*Point,"My order #B2",8802,0,Yellow );
   
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    2     +++++++++++++++++++++
           
                                                   //m15 的ma45  ma90 為斜L下跌末端型態 
          if  ((ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=-0.0001) || 
               (ma90_15_buffer[1]-ma90_15_buffer[2]<=0 && ma180_15_buffer[1]-ma180_15_buffer[2]<=-0.0001) &&                                  //下跌末端上升要一次升過前3bar
                                                    //下跌末端上升要一次漲過前3bar
              close_15_buffer[1]-close_15_buffer[2]>=0.0001  &&  //close_15_buffer[1]-close_15_buffer[3]>=0.0001 &&
         //     close_15_buffer[1]-close_15_buffer[4]>=0.0001  &&
                                             //用m15 m30 macd 控管買賣點 
              macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00010 &&
              macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]>=-0.00050 &&  macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00010 &&
                                             //k1 (k2||k3)已上升
              k1_15_buffer[1]-k1_15_buffer[2]>=1  &&  k1_15_buffer[1]-d1_15_buffer[1]>=1 &&
              (k2_15_buffer[1]-k2_15_buffer[2]>=0  ||  k3_15_buffer[1]-k3_15_buffer[2]>=0))
              OrderClose(OrderTicket(),lots,Bid,1,White); 
       //                                                //確定剛close賣單,目前無單,不加此條會反覆close  
       //       if (TimeCurrent()-OrderCloseTime()<=100 && OrdersTotal()<=1)
       //          OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-18*Point,Ask+300*Point,"My order #B3",8803,0,Blue );
     
                     
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    3     +++++++++++++++++++++
                                                    
                                                      //k1 一次上升大 kd1大幅交叉上 
         if   ((k1_15_buffer[1]-k1_15_buffer[2]>=10  &&  k1_15_buffer[1]-d1_15_buffer[1]>=5  &&
                                                   //m15 的ma45  ma90 為斜L下跌末端型態 
               (ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0) || 
               (ma90_15_buffer[1]-ma90_15_buffer[2]>=0 && ma180_15_buffer[1]-ma180_15_buffer[2]>=0) &&                                  //下跌末端上升要一次升過前3bar
                                            //用m15 m30 macd 控管買賣點 
              macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00010 &&
              macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]>=-0.00050 &&  macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00010))
            
              OrderClose(OrderTicket(),lots,Bid,1,Lime); 
      //                                                 //確定剛close賣單,目前無單,不加此條會反覆close  
      //        if (TimeCurrent()-OrderCloseTime()<=100 && OrdersTotal()<=1)
      //           OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-18*Point,Ask+300*Point,"My order #B4",8804,0,Brown );
   
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    4     +++++++++++++++++++++
                                                                     //m15 的ma180,ma360 or ma360,ma650 or ma650 上升幅度大
                                             
          if   ((ma180_15_buffer[1]-ma180_15_buffer[40]>=0.0020 && ma360_15_buffer[1]-ma360_15_buffer[40]>=0.0020 &&
                                        //k1,k2,k3 <=30
                k1_15_buffer[1]<=30 && k2_15_buffer[1]<=30  &&  k3_15_buffer[1]<=30 && 
                                        //[1]收黑 且<-=0.0006  [1]<= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]<=-0.0006 && close_15_buffer[1]-ma180_15_buffer[1]<=-0.0006) ||
                
               
               (ma360_15_buffer[1]-ma360_15_buffer[40]>=0.0020 && ma650_15_buffer[1]-ma650_15_buffer[40]>=0.0020 &&
                                        //k1,k2,k3 <=30
                k1_15_buffer[1]<=30 && k2_15_buffer[1]<=30  &&  k3_15_buffer[1]<=30 && 
                                        //[1]收紅 且<=-0.0006  [1]<= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]<=-0.0006 && close_15_buffer[1]-ma360_15_buffer[1]<=-0.0006) ||
                
                (ma650_15_buffer[1]-ma650_15_buffer[40]>=0.0020 &&
                                        //k1,k2,k3 >=70
                k1_15_buffer[1]<=30 && k2_15_buffer[1]<=30  &&  k3_15_buffer[1]<=30 && 
                                        //[1]收紅 且>=0.0006  [1]>= ma180,ma360,ma650 0.0006 
                close_15_buffer[1]-open_15_buffer[1]<=-0.0006 && close_15_buffer[1]-ma360_15_buffer[1]<=-0.0006)) 
            
           
                OrderClose(OrderTicket(),lots,Bid,1,Gray); 
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    5     +++++++++++++++++++++
                                         //m60 大幅上升中 
              if    (ma05_60_buffer[1]-ma05_60_buffer[2]>=0.0002 && ma08_60_buffer[1]-ma08_60_buffer[2]>=0.0002 &&
                    ma12_60_buffer[1]-ma12_60_buffer[2]>=0.0002 && ma05_60_buffer[1]-ma12_60_buffer[2]>=0.0012 &&
                    macdsignalline_60_buffer[1]-macdsignalline_60_buffer[2]>=0.00025 &&
                    close_60_buffer[1]-ma08_60_buffer[1]>=-0.0004)
              
                    OrderClose(OrderTicket(),lots,Bid,1,Aqua); 

     
      }

  } 
  }                
    
return(0);  
}
//+------------------------------------------------------------------+

