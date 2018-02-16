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









int start()
  {
//----

//*********************************************************

 //�Nm1��16-bar�����u�Ȥζ}�����C�s��}�C��
 
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

  //�O��16-bar ��17-32-bar���̰��̧C��
 double m1highest16bar;
 double m1highest40bar;
 double m1lowest16bar;
 double m1lowest40bar;
 double m1highest16bartime;
 double m1highest40bartime;
 double m1lowest16bartime;
 double m1lowest40bartime;

//++++++++++++  M5  ++++++++++++++++++++++++++++++++++++++++++++++  
 
 //�Nm5��16-bar�����u�Ȥζ}�����C�s��}�C��
 
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
 
  //�O��16-bar ��17-32-bar���̰��̧C��
 double m5highest16bar;
 double m5highest40bar;
 double m5lowest16bar;
 double m5lowest40bar;
 double m5highest16bartime;
 double m5highest40bartime;
 double m5lowest16bartime;
 double m5lowest40bartime;
 
 m5highest16bar=High[iHighest(NULL,PERIOD_M5,MODE_HIGH,16,1)];   //16bar���̰���
 m5highest40bar=High[iHighest(NULL,PERIOD_M5,MODE_HIGH,40,1)];   //40bar���̰���
 m5highest16bartime=High[iHighest(NULL,PERIOD_M5,MODE_TIME,16,1)];   //16bar���̰������ɶ�
 m5highest40bartime=High[iHighest(NULL,PERIOD_M5,MODE_TIME,40,1)];  //40bar���̰������ɶ�

 m5lowest16bar=Low[iLowest(NULL,PERIOD_M5,MODE_LOW,16,1)];     //16bar���̧C��
 m5lowest40bar=Low[iLowest(NULL,PERIOD_M5,MODE_LOW,40,1)];   //40bar���̧C��
 m5lowest16bartime=Low[iLowest(NULL,PERIOD_M5,MODE_TIME,16,1)];    //16bar���̧C�����ɶ�
 m5lowest40bartime=Low[iLowest(NULL,PERIOD_M5,MODE_TIME,40,1)];    //40bar���̧C�����ɶ�  

//++++++++++++  M15  ++++++++++++++++++++++++++++++++++++++++++++++  

 //�NM15��68-bar�����u�Ȥζ}�����C�s��}�C��
 
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

  //�O��16-bar ��17-32-bar���̰��̧C��
 double M15highest16bar;
 double M15highest40bar;
 double M15lowest16bar;
 double M15lowest40bar;
 double M15highest16bartime;
 double M15highest40bartime;
 double M15lowest16bartime;
 double M15lowest40bartime;
 
 M15highest16bar=High[iHighest(NULL,PERIOD_M15,MODE_HIGH,16,1)];   //16bar���̰���
 M15highest40bar=High[iHighest(NULL,PERIOD_M15,MODE_HIGH,40,1)];   //40bar���̰���
 M15highest16bartime=High[iHighest(NULL,PERIOD_M15,MODE_TIME,16,1)];   //16bar���̰������ɶ�
 M15highest40bartime=High[iHighest(NULL,PERIOD_M15,MODE_TIME,40,1)];  //40bar���̰������ɶ�

 M15lowest16bar=Low[iLowest(NULL,PERIOD_M15,MODE_LOW,16,1)];     //16bar���̧C��
 M15lowest40bar=Low[iLowest(NULL,PERIOD_M15,MODE_LOW,40,1)];   //40bar���̧C��
 M15lowest16bartime=Low[iLowest(NULL,PERIOD_M15,MODE_TIME,16,1)];    //16bar���̧C�����ɶ�
 M15lowest40bartime=Low[iLowest(NULL,PERIOD_M15,MODE_TIME,40,1)];    //40bar���̧C�����ɶ�  

 //�[���p��bar�H�N��m30,h1,h4
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
 
 M15highest50bar=High[iHighest(NULL,PERIOD_M15,MODE_HIGH,50,1)];   //80bar���̰���
 M15highest70bar=High[iHighest(NULL,PERIOD_M15,MODE_HIGH,70,1)];   //160bar���̰���
 M15highest160bar=High[iHighest(NULL,PERIOD_M15,MODE_HIGH,160,1)];   //640bar���̰���

 M15lowest50bar=Low[iLowest(NULL,PERIOD_M15,MODE_LOW,50,1)];     //80bar���̧C��
 M15lowest70bar=Low[iLowest(NULL,PERIOD_M15,MODE_LOW,70,1)];   //160bar���̧C��
 M15lowest160bar=Low[iLowest(NULL,PERIOD_M15,MODE_LOW,160,1)];   //640bar���̧C��
//++++++++++++  M30  ++++++++++++++++++++++++++++++++++++++++++++++  
 //�Nm30��68-bar�����u�Ȥζ}�����C�s��}�C��
 
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
 
 //�O��16-bar ��17-32-bar���̰��̧C��
 double M30highest16bar;
 double M30highest40bar;
 double M30lowest16bar;
 double M30lowest40bar;
 double M30highest16bartime;
 double M30highest40bartime;
 double M30lowest16bartime;
 double M30lowest40bartime;
 
 M30highest16bar=High[iHighest(NULL,PERIOD_M30,MODE_HIGH,16,1)];   //16bar���̰���
 M30highest40bar=High[iHighest(NULL,PERIOD_M30,MODE_HIGH,40,1)];   //40bar���̰���
 M30highest16bartime=High[iHighest(NULL,PERIOD_M30,MODE_TIME,16,1)];   //16bar���̰������ɶ�
 M30highest40bartime=High[iHighest(NULL,PERIOD_M30,MODE_TIME,40,1)];  //40bar���̰������ɶ�

 M30lowest16bar=Low[iLowest(NULL,PERIOD_M30,MODE_LOW,16,1)];     //16bar���̧C��
 M30lowest40bar=Low[iLowest(NULL,PERIOD_M30,MODE_LOW,40,1)];   //40bar���̧C��
 M30lowest16bartime=Low[iLowest(NULL,PERIOD_M30,MODE_TIME,16,1)];    //16bar���̧C�����ɶ�
 M30lowest40bartime=Low[iLowest(NULL,PERIOD_M30,MODE_TIME,40,1)];    //40bar���̧C�����ɶ�  

//++++++++++++  H1  ++++++++++++++++++++++++++++++++++++++++++++++  
 //�Nm60��68-bar�����u�Ȥζ}�����C�s��}�C��
 
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

  //�O��16-bar ��17-32-bar���̰��̧C��
 double H1highest16bar;
 double H1highest40bar;
 double H1lowest16bar;
 double H1lowest40bar;
 double H1highest16bartime;
 double H1highest40bartime;
 double H1lowest16bartime;
 double H1lowest40bartime;
 
 H1highest16bar=High[iHighest(NULL,PERIOD_H1,MODE_HIGH,16,1)];   //16bar���̰���
 H1highest40bar=High[iHighest(NULL,PERIOD_H1,MODE_HIGH,40,1)];   //40bar���̰���
 H1highest16bartime=High[iHighest(NULL,PERIOD_H1,MODE_TIME,16,1)];   //16bar���̰������ɶ�
 H1highest40bartime=High[iHighest(NULL,PERIOD_H1,MODE_TIME,40,1)];  //40bar���̰������ɶ�

 H1lowest16bar=Low[iLowest(NULL,PERIOD_H1,MODE_LOW,16,1)];     //16bar���̧C��
 H1lowest40bar=Low[iLowest(NULL,PERIOD_H1,MODE_LOW,40,1)];   //40bar���̧C��
 H1lowest16bartime=Low[iLowest(NULL,PERIOD_H1,MODE_TIME,16,1)];    //16bar���̧C�����ɶ�
 H1lowest40bartime=Low[iLowest(NULL,PERIOD_H1,MODE_TIME,40,1)];    //40bar���̧C�����ɶ�  

//++++++++++++  H4  ++++++++++++++++++++++++++++++++++++++++++++++  
 //�NH4��68-bar�����u�Ȥζ}�����C�s��}�C��
 
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
 
 //�O��16-bar ��17-32-bar���̰��̧C��
 H4highest16bar=High[iHighest(NULL,PERIOD_H4,MODE_HIGH,16,1)];   //16bar���̰���
 H4highest40bar=High[iHighest(NULL,PERIOD_H4,MODE_HIGH,40,1)];   //40bar���̰���
 H4highest16bartime=High[iHighest(NULL,PERIOD_H4,MODE_TIME,16,1)];   //16bar���̰������ɶ�
 H4highest40bartime=High[iHighest(NULL,PERIOD_H4,MODE_TIME,40,1)];  //40bar���̰������ɶ�

 H4lowest16bar=Low[iLowest(NULL,PERIOD_H4,MODE_LOW,16,1)];     //16bar���̧C��
 H4lowest40bar=Low[iLowest(NULL,PERIOD_H4,MODE_LOW,40,1)];   //40bar���̧C��
 H4lowest16bartime=Low[iLowest(NULL,PERIOD_H4,MODE_TIME,16,1)];    //16bar���̧C�����ɶ�
 H4lowest40bartime=Low[iLowest(NULL,PERIOD_H4,MODE_TIME,40,1)];    //40bar���̧C�����ɶ�  
 
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
double cnt,trade,order_id;
//trade=1;
   for (cnt=0;cnt<OrdersTotal();cnt++)
     {
       OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES);
     } 

 //+++++++++++++++++++++++++++++++++++++++++++   BUY   1   ++++++++++++++++++++++++++++++++++++++++++++++++++          

  if  (OrdersTotal()<1 || (OrdersTotal()<3 && shortbuy01==OrderTicket() || shortbuy02==OrderTicket() || shortbuy03==OrderTicket() ||
       shortbuy04==OrderTicket() || shortbuy05==OrderTicket() ||shortbuy06==OrderTicket() ||
       shortsell01==OrderTicket() || shortsell02==OrderTicket() ||shortsell03==OrderTicket() ||
       shortsell04==OrderTicket() || shortsell05==OrderTicket() ||shortsell06==OrderTicket()))
     {
                                                 //m15 ��ma45  ma90 ����L�U�^���ݫ��A ma45[1]-[6]���T�{���U�^ 
        if (((ma45_15_buffer[1]-ma45_15_buffer[2]>=0 &&  ma45_15_buffer[1]-ma45_15_buffer[6]<=0) ||
                                                 //�����U�^��h4 [1]�|�����j��20�I
             (ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=-0.0001 && 
                              //h4 ���� �B�W�v�u<=0.0006
              close_240_buffer[1]-open_240_buffer[1]>=0.0020 && high_240_buffer[1]-close_240_buffer[1]<=0.0055 )) && 
              ma90_15_buffer[1]-ma90_15_buffer[2]<=-0.0001 && 
                                                 //�U�^���ݤW�ɭn�@���ɹL�e3bar
              close_15_buffer[1]-close_15_buffer[2]>=0.0001  && // close_15_buffer[1]-close_15_buffer[3]>=0.0001 &&
      //        close_15_buffer[1]-close_15_buffer[4]>=0.0001  &&
                                             //��m15 m30 macd ���޶R���I 
              macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00010 &&
              macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]>=-0.00050 &&  macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00020 &&
              macdmainline_30_buffer[1]<=0.00110   &&   
                                                         //m60 ��45,90,180  �ҬO�פW
             (macdmainline_60_buffer[1]<=0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]>=0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0.0003 && 
              ma180_60_buffer[1]-ma180_60_buffer[2]>=0)) &&    
                                           //k1 (k2||k3)�w�W��
              k1_15_buffer[1]-k1_15_buffer[2]>=1  &&  k1_15_buffer[1]-d1_15_buffer[1]>=1 &&
              k2_15_buffer[1]-k2_15_buffer[2]>=0  ||  k3_15_buffer[1]-k3_15_buffer[2]>=0)
              if ((macdmainline_15_buffer[1]>=-0.00099 && macdmainline_15_buffer[1]<=0.00099 &&
                   macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                   (k2_30_buffer[1]-d2_30_buffer[1]<=-19  &&  k3_30_buffer[1]-d3_30_buffer[1]<=-19) ||
                   (k2_60_buffer[1]-d2_60_buffer[1]<=-19  &&  k3_60_buffer[1]-d3_60_buffer[1]<=-19) ||
                      //(m15-65) [1]���t<=25�I macd�t��<=-0.00230
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0025 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00230) ||


                                 //h4  k2,k3 �b47�W  �}�f�V�U  �����R�� 
                   (k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3���V�U,�� h4,m30,m60 kd2,kd3�V�U�}�f�j �� k1,k,2,k3�b���C
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
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd�t��>=-350
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
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14) ||
 //�H�U�Ҧ��C�i��ԲӪ�orderticket�u�����ޤ��n���U�h�檺���p�o��                   
                     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                      longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                      longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                      longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                      longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                      longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket())) ||  
                      TimeCurrent()-OrderCloseTime()<=1000) 

                      return;
                      else

                      longbuy01=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B1",8801,0,Red );
 //+++++++++++++++++++++++++++++++++++++++++++   BUY   2   ++++++++++++++++++++++++++++++++++++++++++++++++++          
     
                         // h1 k123�b�U�� �Ҭ��W��
          if  (k1_60_buffer[1]<=15 && k2_60_buffer[1]<=15 && k3_60_buffer[1]<=15  && 
               k1_60_buffer[1]-k1_60_buffer[2]>=8 &&  k2_60_buffer[1]-k2_60_buffer[2]>=0 &&  k3_60_buffer[1]-k3_60_buffer[2]>=0 &&
                                  //[1]���L�j��20�I �j��[2][3][4] ma05    10�I�W
               close_60_buffer[1]-open_60_buffer[1]>=0.0020 && close_60_buffer[1]-close_60_buffer[2]>=0.0010 &&
               close_60_buffer[1]-close_60_buffer[3]>=0.0010 && close_60_buffer[1]-close_60_buffer[4]>=0.0010 &&
               close_60_buffer[1]-ma05_60_buffer[1]>=0.0010 && 
         
               macdmainline_30_buffer[1]<=0.00110   &&   
                                                         //m60 ��45,90,180  �ҬO�פW
              (macdmainline_60_buffer[1]<=0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]>=0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0.0003 && 
               ma180_60_buffer[1]-ma180_60_buffer[2]>=0)))     
                                      //h4  k2,k3 �b47�W  �}�f�V�U  �����R�� 
               if  ((k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3���V�U,�� h4,m30,m60 kd2,kd3�V�U�}�f�j �� k1,k,2,k3�b���C
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
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd�t��>=-350
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
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14) || 
                     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                      longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                      longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                      longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                      longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                      longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                      longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                      longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                      longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                      longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                      longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                      longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()))) 
                      return;
                      else
                      longbuy02=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B2",8802,0,Yellow );
                             
//+++++++++++++++++++++++++++++++++++++++++++   BUY   3   ++++++++++++++++++++++++++++++++++++++++++++++++++          
      
                                                      //k1 �@���W�ɤj kd1�j�T��e�W 
         if ((k1_15_buffer[1]-k1_15_buffer[2]>=10  &&  k1_15_buffer[1]-d1_15_buffer[1]>=5  && close_15_buffer[1]-open_15_buffer[1]>=0.0002 &&
                                                   //�]���H���L���A�R�i  
              k1_15_buffer[1]<=60 && k2_15_buffer[2]<=60  &&  k3_15_buffer[1]<=60 && 
                                                   //m15 ��ma45  ma90 ����L�U�^���ݫ��A 
             (ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0) || 
             (ma90_15_buffer[1]-ma90_15_buffer[2]>=0 && ma180_15_buffer[1]-ma180_15_buffer[2]>=0) &&                                  //�U�^���ݤW�ɭn�@���ɹL�e3bar
                                                        // �R��� m30 m60 ���i�b�L����m
              macdmainline_30_buffer[1]<=0.00110   &&   
                                                         //m60 ��45,90,180  �ҬO�פW
             (macdmainline_60_buffer[1]<=0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]>=0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0.0003 && 
              ma180_60_buffer[1]-ma180_60_buffer[2]>=0)) &&    
                                             //��m15 m30 macd ���޶R���I 
              macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00010 &&
              macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]>=-0.00050 &&  macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00020))
              if ((macdmainline_15_buffer[1]>=-0.00099 && macdmainline_15_buffer[1]<=0.00099 &&
                   macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                      //(m15-62) h4 k1,k2,k3 >=70 don't buy
                  (k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||                   
                     //(m15-64) h4 [1]���t�äp��30�I  kd2,kd3<=-10
                  (close_240_buffer[1]-open_240_buffer[1]<=-0.0030 &&                          
                   k2_240_buffer[1]-d2_240_buffer[1]<=-10 && k3_240_buffer[1]-d3_240_buffer[1]<=-10) ||                        
                    //(m15-64) h4 [1]macd ����>=0.00050 [1]���L���t�Ȩ�<=-25�I,[2]macd ����>=0.00030 [2]���L���t�Ȩ�<=-60�I                                
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0025 &&  close_240_buffer[2]-open_240_buffer[2]<=-0.0060 &&                          
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00050 &&
                    macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]>=0.00030) ||
                           //(m15-66) h4 [1]macd �Ȥ���0.00150 �P-0.00150�� �B kd1,kd2,kd3<=-4 �����                                
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-4 && k2_240_buffer[1]-d2_240_buffer[1]<=-4 &&
                    k3_240_buffer[1]-d3_240_buffer[1]<=-4 &&                       
                    macdmainline_240_buffer[1]>=-0.00150 && macdmainline_240_buffer[1]<=0.00150 &&
                    macdsignalline_240_buffer[1]>=-0.00150 &&  macdsignalline_240_buffer[1]<=0.00150) ||
                  //(m15-66) h4 [1]macd �Ȥ���0.00100 �P-0.00100��  �����                                
                   (macdmainline_240_buffer[1]>=-0.00100 && macdmainline_240_buffer[1]<=0.00100 &&
                    macdsignalline_240_buffer[1]>=-0.00100 &&  macdsignalline_240_buffer[1]<=0.00100) ||
                                  //(m15-66)  macd �t��<=-0.00450  signal[1]-[2]<=-0.00100
                   (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00450 &&
                    macdsignalline_240_buffer[1]- macdsignalline_240_buffer[2]<=-0.00100) ||
                        
                     
                                             //h4  k2,k3 �b47�W  �}�f�V�U  �����R�� 
                   (k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3���V�U,�� h4,m30,m60 kd2,kd3�V�U�}�f�j �� k1,k,2,k3�b���C
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
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd�t��>=-350
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
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14) || 
                     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                      longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                      longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                      longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                      longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                      longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                      longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                      longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                      longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                      longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                      longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                      longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()))) 
                      return;
                      else
                      longbuy03=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B3",8803,0,Blue );

//+++++++++++++++++++++++++++++++++++++++++++   BUY   4   ++++++++++++++++++++++++++++++++++++++++++++++++++          
    
             //m15 �� [+4][-3][-2][+1]  && [+1]or[-2]���̧C bar���鬰0.0006  �����o�ͱ�����Y
        if  (((close_15_buffer[1]-open_15_buffer[1]>=0.0006 && close_15_buffer[4]-open_15_buffer[4]>=0.0006  && 
               close_15_buffer[2]-open_15_buffer[2]<=-0.0006 && close_15_buffer[3]-open_15_buffer[3]<=-0.0006 &&
               k1_15_buffer[1]-k1_15_buffer[2]>=0  && close_15_buffer[1]-close_15_buffer[3]>=0.0001 &&
              (low_15_buffer[1]==M15lowest40bar ||  low_15_buffer[2]==M15lowest40bar) && 
              (ma05_15_buffer[1]-ma05_15_buffer[2]>=0 || 
              (close_15_buffer[1]-open_15_buffer[1]>=0.0001  && low_15_buffer[1]-close_15_buffer[1]<=-0.0029) ||
              (k2_15_buffer[1]-k2_15_buffer[2]>=2 && k3_15_buffer[1]-k3_15_buffer[2]>=2) ||
              (ma05_15_buffer[1]-ma05_15_buffer[2]>=-0.0006 && 
              (k2_15_buffer[1]-k2_15_buffer[2]>=0 || k3_15_buffer[1]-k3_15_buffer[2]>=0)))) ||
               
                //m15 �� [+5][-4][-3][-2][+1]  && [+1]or[-2]���̧C bar���鬰0.0006  
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
               
                 //m30 �� [+4][-3][-2][+1]  && [+1]or[-2]���̧C bar���鬰0.0008  �����o�ͱ�����Y
              (close_30_buffer[1]-open_30_buffer[1]>=0.0008 && close_30_buffer[4]-open_30_buffer[4]>=0.0008  && 
               close_30_buffer[2]-open_30_buffer[2]<=-0.0008 && close_30_buffer[3]-open_30_buffer[3]<=-0.0008 &&
               k1_30_buffer[1]-k1_30_buffer[2]>=0  && close_30_buffer[1]-close_30_buffer[3]>=0.0001 &&
              (low_30_buffer[1]==M30lowest40bar ||  low_30_buffer[2]==M30lowest40bar) && 
              (ma05_30_buffer[1]-ma05_30_buffer[2]>=0 || 
              (close_30_buffer[1]-open_30_buffer[1]>=0.0001  && low_30_buffer[1]-close_30_buffer[1]<=-0.0029) ||
              (k2_30_buffer[1]-k2_30_buffer[2]>=2 && k3_30_buffer[1]-k3_30_buffer[2]>=2) ||
              (ma05_30_buffer[1]-ma05_30_buffer[2]>=-0.0006 && 
              (k2_30_buffer[1]-k2_30_buffer[2]>=0 || k3_30_buffer[1]-k3_30_buffer[2]>=0)))) ||
                  //m30 �� [+5][-4][-3][-2][+1]  && [+1]or[-2]���̧C bar���鬰0.0008  
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
             
                  //m60 �� [+4][-3][-2][+1]  && [+1]or[-2]���̧C bar���鬰0.0010  �����o�ͱ�����Y
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
                    //m60 �� [+5][-4][-3][-2][+1]  && [+1]or[-2]���̧C bar���鬰0.0010  
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
                                                         //m60 ��45,90,180  �ҬO�פW
             (macdmainline_60_buffer[1]<=0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]>=0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0.0003 && 
              ma180_60_buffer[1]-ma180_60_buffer[2]>=0)))    
                                                    //(m15-61) h4 k1,k2,k3 >=65 don't buy
              if   ((k1_240_buffer[1]>=65 && k2_240_buffer[1]>=65 && k3_240_buffer[1]>=65) ||                   
                     //(m15-66) h4 [1]macd �Ȥ���0.00100 �P-0.00100��  �����                                
                   (macdmainline_240_buffer[1]>=-0.00100 && macdmainline_240_buffer[1]<=0.00100 &&
                    macdsignalline_240_buffer[1]>=-0.00100 &&  macdsignalline_240_buffer[1]<=0.00100) ||
                     
                 
                                   //h4  k2,k3 �b47�W  �}�f�V�U  �����R�� 
                   (k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                            //H4 k1,k2,k3���V�U,�� h4,m30,m60 kd2,kd3�V�U�}�f�j �� k1,k,2,k3�b���C
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
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd�t��>=-350
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
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14) || 
                     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                      longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                      longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                      longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                      longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                      longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                      longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                      longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                      longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                      longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                      longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                      longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()))) 
                      return;
                      else
                      longbuy04=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B4",8804,0,Brown );

//+++++++++++++++++++++++++++++++++++++++++++   BUY   5   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                    
                                     //m15 ���U�v�u >=24�I  [1]>0.0001�}-�C  [1]<-0.0001��-�C
       if   ((close_15_buffer[1]-open_15_buffer[1]<=-0.0001 && low_15_buffer[1]-close_15_buffer[1]<=-0.0024) ||
             (close_15_buffer[1]-open_15_buffer[1]>=0.0001  && low_15_buffer[1]-open_15_buffer[1]<=-0.0024) &&
              low_15_buffer[1]==M15lowest40bar &&
              k1_15_buffer[1]-k1_15_buffer[2]>=0 && k2_15_buffer[1]-k2_15_buffer[2]>=0 && k3_15_buffer[1]-k3_15_buffer[2]>=0  &&
              macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.0090 && 
              macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00010) 
              
              if ((close_15_buffer[2]-open_15_buffer[2]<=-0.0100 || close_15_buffer[1]-open_15_buffer[1]<=-0.0100 ||
                   macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=-0.00120 || 
                   macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=0.00050) ||
                                                 //�׶}�U�^�ᤧ�ϼu
                  (open_15_buffer[3]-open_15_buffer[2]<=0.0003 && open_15_buffer[4]-open_15_buffer[2]<=0.0003) ||    
                  (open_15_buffer[2]-open_15_buffer[1]<=0.0003 && open_15_buffer[3]-open_15_buffer[1]<=0.0003) ||     
                  (macdmainline_15_buffer[1]>=-0.00099 && macdmainline_15_buffer[1]<=0.00099 &&
                   macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                                      //h4  k2,k3 �b47�W  �}�f�V�U  �����R�� 
                   (k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3���V�U,�� h4,m30,m60 kd2,kd3�V�U�}�f�j �� k1,k,2,k3�b���C
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
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd�t��>=-350
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
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14) || 
                     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                      longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                      longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                      longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                      longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                      longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                      longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                      longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                      longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                      longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                      longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                      longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()))) 
                      return;
                      else
                      longbuy05=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B5",8805,0,Purple );
  
//+++++++++++++++++++++++++++++++++++++++++++   BUY   6   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                 //h1 [1]�d�U�v�u >=24�I  [1]>0.0001�}-�C  [1]<-0.0001��-�C
       if  (((close_60_buffer[1]-open_60_buffer[1]<=-0.0001 && close_60_buffer[1]-open_60_buffer[1]>=-0.0006 && 
              low_60_buffer[1]-close_60_buffer[1]<=-0.0024) ||
             (close_60_buffer[1]-open_60_buffer[1]>=0.0001  && close_60_buffer[1]-open_60_buffer[1]>=-0.0006 && 
              low_60_buffer[1]-open_60_buffer[1]<=-0.0024) &&
              low_60_buffer[1]==H1lowest40bar &&
              k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 && k3_60_buffer[1]-k3_60_buffer[2]>=0) ||
                                         //[1]���� [2]�d�U�v�u
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
                                                 //�׶}�U�^�ᤧ�ϼu
                  (open_60_buffer[3]-open_60_buffer[2]<=0.0003 && open_60_buffer[4]-open_60_buffer[2]<=0.0003) ||    
                  (open_60_buffer[2]-open_60_buffer[1]<=0.0003 && open_60_buffer[3]-open_60_buffer[1]<=0.0003) ||     
                  (macdmainline_60_buffer[1]>=-0.00099 && macdmainline_60_buffer[1]<=0.00099 &&
                   macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                                       //h4  k2,k3 �b47�W  �}�f�V�U  �����R�� 
                   (k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3���V�U,�� h4,m30,m60 kd2,kd3�V�U�}�f�j �� k1,k,2,k3�b���C
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
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd�t��>=-350
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
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14) || 
                     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                      longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                      longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                      longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                      longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                      longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                      longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                      longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                      longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                      longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                      longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                      longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()))) 
                      return;
                      else
                      longbuy06=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B6",8806,0,Gold );
 
 //+++++++++++++++++++++++++++++++++++++++++++   BUY   7   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                     
                         //(m15-61)  H4     [2]�d�U�v�u>80�I  [1]>=[2] 
       if  ((((close_240_buffer[2]-open_240_buffer[2]<=-0.0001 && low_240_buffer[2]-close_240_buffer[2]<=-0.0080) ||
              (close_240_buffer[2]-open_240_buffer[2]>=0.0001  && low_240_buffer[2]-open_240_buffer[2]<=-0.0080)) &&
               close_240_buffer[1]-open_240_buffer[1]>=0.0001 &&
                                                          //H4 k1,k2,k3 <=30   || [2]<=-0.0250
             ((k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30  &&  k3_240_buffer[1]<=30) || (close_240_buffer[2]-open_240_buffer[2]<=-0.0250))) ||
          
                //(m15-66)  [2]�d�U�v�u>35  k1,k2,k3>=35   ma12-ma05<=-0.0005   close[4]||[5]||[6]||[7]>close[1]&& [2] �tw���ʽ�
          (((close_240_buffer[2]-open_240_buffer[2]<=-0.0001 && low_240_buffer[2]-close_240_buffer[2]<=-0.0035) ||
            (close_240_buffer[2]-open_240_buffer[2]>=0.0001  && low_240_buffer[2]-open_240_buffer[2]<=-0.0035)) &&
            (close_240_buffer[4]-open_240_buffer[1]<=0 || close_240_buffer[5]-open_240_buffer[1]<=0 ||
             close_240_buffer[6]-open_240_buffer[1]<=0 || close_240_buffer[7]-open_240_buffer[1]<=0 || 
             close_240_buffer[8]-open_240_buffer[1]<=0 || close_240_buffer[9]-open_240_buffer[1]<=0) && 
            (close_240_buffer[4]-close_240_buffer[2]<=0 || close_240_buffer[5]-close_240_buffer[2]<=0 ||
             close_240_buffer[6]-close_240_buffer[2]<=0 || close_240_buffer[7]-close_240_buffer[2]<=0 || 
             close_240_buffer[8]-close_240_buffer[2]<=0 || close_240_buffer[9]-close_240_buffer[2]<=0) && 
           ((close_240_buffer[1]-open_240_buffer[1]>=0.0030  && ma12_240_buffer[1]-ma05_240_buffer[2]>=0.0005 && 
             k1_240_buffer[1]<=40 && k2_240_buffer[1]<=40  &&  k3_240_buffer[1]<=40) || 
            
                //(m15-66)  k1,k2,k3<=25,k2,k3>=1,d2,d3>=0,kd1,kd2>=2  macd main && signal[1]-[2]>=0.00003
             (k2_240_buffer[1]<=25  &&  k3_240_buffer[1]<=25 && k2_240_buffer[1]-k2_240_buffer[2]>=1 &&
              k3_240_buffer[1]-k3_240_buffer[2]>=1  &&  d2_240_buffer[1]-d2_240_buffer[2]>=0 &&
              d3_240_buffer[1]-d3_240_buffer[2]>=0 && k2_240_buffer[1]-d2_240_buffer[1]>=2 &&
              k3_240_buffer[1]-d3_240_buffer[1]>=2 &&
              macdmainline_240_buffer[1]-macdmainline_240_buffer[2]>=0.00003 && 
              macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]>=0.00003))) ||
        
              
                //(m15-66) H4 [2] �d�U�v�u>70�I [1]>�U�v�u100�I macd�t��[1]-[2]>50
            (((close_240_buffer[2]-open_240_buffer[2]<=-0.0001 && low_240_buffer[2]-close_240_buffer[2]<=-0.0070) ||
             (close_240_buffer[2]-open_240_buffer[2]>=0.0001   && low_240_buffer[2]-open_240_buffer[2]<=-0.0070)) &&
             ((close_240_buffer[1]-open_240_buffer[1]<=-0.0001 && low_240_buffer[1]-close_240_buffer[1]<=-0.0100) ||
             (close_240_buffer[1]-open_240_buffer[1]>=0.0001   && low_240_buffer[1]-open_240_buffer[1]<=-0.0100)) &&
              macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00370 && 
              macdmainline_240_buffer[1]>=0.00450 && macdsignalline_240_buffer[1]>=0.00050))  
                        // (m15-67) 
               if    ((k1_240_buffer[1]-d1_240_buffer[1]<=-12 &&  (k2_240_buffer[1]-d2_240_buffer[1]<=-5 || k3_240_buffer[1]-d3_240_buffer[1]<=-5) &&
                      k2_240_buffer[1]>=75 && k3_240_buffer[1]>=75) ||
                     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                      longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                      longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                      longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                      longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                      longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                      longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                      longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                      longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                      longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                      longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                      longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()))) 
                      return;
                      else
                      longbuy07=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B7",8807,0,OrangeRed );
  
  //+++++++++++++++++++++++++++++++++++++++++++   BUY   8   ++++++++++++++++++++++++++++++++++++++++++++++++++          
              
                     //(m15-62)   h4 �� ma180�פW ��ma180���� ma360 �פW   
        if   (((ma180_240_buffer[1]-ma180_240_buffer[2]>=0.0001 ||  (ma180_240_buffer[1]-ma180_240_buffer[2]>=0 &&
               ma360_240_buffer[1]-ma360_240_buffer[2]>=0.0001)) &&
                  // [1]���bma180�W��20�I��  
               close_240_buffer[1]-ma180_240_buffer[1]>=0.0001  && close_240_buffer[1]-ma180_240_buffer[1]<=0.0020 &&
                 //h4 [1]�U�v�u�W�L30�I
              ((close_240_buffer[1]-open_240_buffer[1]<=-0.0001 && low_240_buffer[1]-close_240_buffer[1]<=-0.0030) ||
              (close_240_buffer[1]-open_240_buffer[1]>=0.0001  && low_240_buffer[1]-open_240_buffer[1]<=-0.0030)) &&
                 //kd1>=3      
               k1_240_buffer[1]-d1_240_buffer[1]>=3 &&
                  // macd�t��>=-0.00150  <=0.00100 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00150 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100 &&
                   // [2]||[3]||[4]���bma180�W��20�I��  
             ((close_240_buffer[2]-ma180_240_buffer[2]>=0.0001  && close_240_buffer[2]-ma180_240_buffer[2]<=0.0020) ||
              (close_240_buffer[3]-ma180_240_buffer[3]>=0.0001  && close_240_buffer[3]-ma180_240_buffer[3]<=0.0020) ||
              (close_240_buffer[4]-ma180_240_buffer[4]>=0.0001  && close_240_buffer[4]-ma180_240_buffer[4]<=0.0020))) ||
                   
                  //(m15-66)   h4 �� ma180,ma360,ma650 ����    
              (ma180_240_buffer[1]-ma180_240_buffer[2]>=-0.0001 && ma360_240_buffer[1]-ma360_240_buffer[2]>=-0.0001 &&
               ma650_240_buffer[1]-ma650_240_buffer[2]>=-0.0001 && 
                  // [1]���bma360�W��20�I��  
               close_240_buffer[1]-ma360_240_buffer[1]>=0.0001  && close_240_buffer[1]-ma360_240_buffer[1]<=0.0020 &&
                 //h4 [1]�U�v�u�W�L30�I
              ((close_240_buffer[1]-open_240_buffer[1]<=-0.0001 && low_240_buffer[1]-close_240_buffer[1]<=-0.0030) ||
              (close_240_buffer[1]-open_240_buffer[1]>=0.0001  && low_240_buffer[1]-open_240_buffer[1]<=-0.0030)) &&
                 //kd1>=3      
               k1_240_buffer[1]-d1_240_buffer[1]>=3 &&
                   // [2]||[3]||[4]���bma360�W��20�I��  
             ((close_240_buffer[2]-ma360_240_buffer[2]>=-0.0005  && close_240_buffer[2]-ma360_240_buffer[2]<=0.0020) ||
              (close_240_buffer[3]-ma360_240_buffer[3]>=-0.0005  && close_240_buffer[3]-ma360_240_buffer[3]<=0.0020) ||
              (close_240_buffer[4]-ma360_240_buffer[4]>=-0.0005  && close_240_buffer[4]-ma360_240_buffer[4]<=0.0020))))
                            // (m15-67) 
               if   ((k1_240_buffer[1]-d1_240_buffer[1]<=-12 &&  (k2_240_buffer[1]-d2_240_buffer[1]<=-5 || k3_240_buffer[1]-d3_240_buffer[1]<=-5) &&
                      k2_240_buffer[1]>=75 && k3_240_buffer[1]>=75) ||
                     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                      longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                      longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                      longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                      longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                      longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                      longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                      longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                      longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                      longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                      longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                      longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()))) 
                      return;
                      else
                      longbuy08=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B8",8808,0,OrangeRed );

  //+++++++++++++++++++++++++++++++++++++++++++   BUY   9   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                 
          //h4 �� [+4][-3][-2][+1]  && [+1]or[-2]���̧C bar���鬰0.0030 
        if   ((close_240_buffer[1]-open_240_buffer[1]>=0.0030 && close_240_buffer[4]-open_240_buffer[4]>=0.0010  && 
               close_240_buffer[2]-open_240_buffer[2]<=-0.0010 && close_240_buffer[3]-open_240_buffer[3]<=-0.0010 &&
                //(m15-61)  [1]�W�v�u�p��15�I
               high_240_buffer[1]-close_240_buffer[1]<=0.0015  &&
                 //(m15-59) kd1,(kd2||kd3)>=-2 �}�f�����Y�p || macd�t�Ȧb100��
             ((k1_240_buffer[1]-d1_240_buffer[1]>=-3  && (k2_240_buffer[1]-d2_240_buffer[1]>=-3 || k3_240_buffer[1]-d3_240_buffer[1]>=-3)) ||
                      // (m15-61)  macd�t��>=-0.00150  <=0.00100 
              (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00150 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100))  &&
                //(m15-66)  h4 ���L������ma05�b20�I��  k2,k3�����b35�U�H�K�w���L�� kd2,kd3>=9
             ((ma05_240_buffer[1]- close_240_buffer[1]<=0.0020 && ma05_240_buffer[1]-ma05_240_buffer[2]>=0 &&
               k2_240_buffer[1]<=35 && k3_240_buffer[1]<=35 &&
               k2_240_buffer[1]-d2_240_buffer[1]>=9 && k3_240_buffer[1]-d3_240_buffer[1]>=9) ||  //  && 
          //       //(m15=58)  h4 ���L������ma05�b15�I��   h1   k1,k2,k3�����b30�U�H�K�w���L��
              (ma05_240_buffer[1]- close_240_buffer[1]<=0.0015 && ma05_240_buffer[1]-ma05_240_buffer[2]>=0 &&
               k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30))) ||  //  && 
          //    (low_240_buffer[1]==H4lowest40bar ||  low_240_buffer[2]==H4lowest40bar)) ||
            
                   //h4 �� [+5][-4][-3][-2][+1]  && [+1]or[-2]���̧C bar���鬰0.0010   [1]>=0.0030  
              (close_240_buffer[1]-open_240_buffer[1]>=0.0030 && close_240_buffer[5]-open_240_buffer[5]>=0.0010  && 
               close_240_buffer[2]-open_240_buffer[2]<=-0.0010 && close_240_buffer[3]-open_240_buffer[3]<=-0.0010 &&
               close_240_buffer[4]-open_240_buffer[4]<=-0.0010 &&
                              //(m15-61)  [1]�W�v�u�p��15�I
               high_240_buffer[1]-close_240_buffer[1]<=0.0015  &&

                         //(m15-59) kd1,(kd2||kd3)>=-2 �}�f�����Y�p || macd�t�Ȧb100��
             ((k1_240_buffer[1]-d1_240_buffer[1]>=-3  && (k2_240_buffer[1]-d2_240_buffer[1]>=-3 || k3_240_buffer[1]-d3_240_buffer[1]>=-3)) ||
                      // (m15-61)  macd�t��>=-0.00150  <=0.00100 
              (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00150 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100))  &&
                  //(m15=58)  h4 ���L������ma05�b15�I��   h1   k1,k2,k3�����b45�U�H�K�w���L��
               ma05_240_buffer[1]- close_240_buffer[1]<=0.0015 && ma05_240_buffer[1]-ma05_240_buffer[2]>=0 &&
               k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30)  ||   //  && 
                       //�bm15���U�����   �U�C�L�k�@��
      //        (low_240_buffer[1]==H4lowest40bar ||  low_240_buffer[2]==H4lowest40bar || low_240_buffer[3]==H4lowest40bar )) ||
            
                        //(m15-65) H4 �� [+5][-4][-3][2][+1]   [1]>=0.0015 [2]>=0 [3][4]<=-0.0010 [5]>=-0.0010 
              (close_240_buffer[1]-open_240_buffer[1]>=0.0015 && close_240_buffer[5]-open_240_buffer[5]>=0.0010  && 
                 //(m15-64) [2]���i�^�}150�I �^�Ӧh���n�^�Y
               close_240_buffer[2]-open_240_buffer[2]<=0 && close_240_buffer[2]-open_240_buffer[2]>=-0.0150 &&
               close_240_buffer[3]-open_240_buffer[3]<=-0.0010 &&
               close_240_buffer[4]-open_240_buffer[4]<=-0.0010 && 
                 //h4 (m15-65)  [2][3][4]���L�p����[5]���}�L�̦h5�I��
               open_240_buffer[2]-close_240_buffer[5]>=-0.0005 &&
               open_240_buffer[3]-close_240_buffer[5]>=-0.0005 && 
               open_240_buffer[4]-close_240_buffer[5]>=-0.0005 &&
               close_240_buffer[1]-close_240_buffer[5]>=-0.0005 && 
                    //(m15-62)   [1]�U�v�u���W�L5�I   k1<=50  k2,k3<=35    kd2,kd3>=4  
               high_240_buffer[1]-close_240_buffer[1]<=0.0005  && k1_240_buffer[1]<=50 && k2_240_buffer[1]<=35 && k3_240_buffer[1]<=35 && 
               k2_240_buffer[1]-d2_240_buffer[1]>=4 && k3_240_buffer[1]-d3_240_buffer[1]>=4) ||
         
                    
                        //(m15-61) H4 �� [+2][+1]   �W�v�u�b10�I��
              (close_240_buffer[1]-open_240_buffer[1]>=0.0010 && close_240_buffer[2]-open_240_buffer[2]>=0.0010  && 
                     //  [1][2]�W�v�u�p��10�I
               low_240_buffer[1]-close_240_buffer[1]>=0.0010  &&  low_240_buffer[2]-close_240_buffer[2]>=0.0010  &&             
                    //    kd1,kd2,kd3>=1 
               k1_240_buffer[1]-k1_240_buffer[2]>=1  && k2_240_buffer[1]-k2_240_buffer[2]>=1 && k3_240_buffer[1]-k3_240_buffer[2]>=1 &&
                    //   macd  �t��>=-0.00100  <=0.00100
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100  &&
               macdmainline_240_buffer[1]<=-0.00350 && 
                      //k1,k2,k3<=15
               k1_240_buffer[1]<=15 && k2_240_buffer[1]<=15 && k3_240_buffer[1]<=15) ||
    
                     //h4  [4][3][2]<=-0.0050 [1]>=0.0010  ma45[1]-[2]>=0.0001
              (close_240_buffer[4]-open_240_buffer[4]<=-0.0050 && close_240_buffer[3]-open_240_buffer[3]<=-0.0050  && 
               close_240_buffer[2]-open_240_buffer[2]<=-0.0050 && close_240_buffer[1]-open_240_buffer[1]>=0.0010 &&
               ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0001) ||
          
                       //(m15-61) h4  [4]+[3]+[2]<=-0.0150 [1]>=0.0030  [1]-[2]>=-0.0010  macd  �t��>=-0.00100  <=0.00100
             (((close_240_buffer[4]-open_240_buffer[4])+(close_240_buffer[3]-open_240_buffer[3])+ 
               (close_240_buffer[2]-open_240_buffer[2])<=-0.0150) && close_240_buffer[1]-open_240_buffer[1]>=0.0030 &&
                close_240_buffer[1]-close_240_buffer[2]>=-0.0010 &&
                macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100)) 
                  if    ((k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10) ||
                      (k1_240_buffer[1]<=13 && k2_240_buffer[1]<=13  &&  k3_240_buffer[1]<=13) ||
                         //(m15-64) [1]||[2]���i�^�}150�I �^�Ӧh���n�^�Y
                      (close_240_buffer[1]-open_240_buffer[1]<=-0.0150 || close_240_buffer[2]-open_240_buffer[2]<=-0.0150) ||
                          //(m15-64) [1]||[2]���i�^�}110�I   kd1[1]||kd1[2]<=-20 
                      (close_240_buffer[1]-open_240_buffer[1]<=-0.0110 && k1_240_buffer[1]-d1_240_buffer[1]<=-20) ||
                      (close_240_buffer[2]-open_240_buffer[2]<=-0.0110 && k1_240_buffer[2]-d1_240_buffer[2]<=-20) ||
                   // (m15-64)  kd1,kd2,kd3<=-15
                      (k1_240_buffer[1]-d1_240_buffer[1]<=-15 && k2_240_buffer[1]-d2_240_buffer[1]<=-15 && k3_240_buffer[1]-d3_240_buffer[1]<=-15) || 
                        //(m15-66)  ma360[1]-[6]<=-0.0001   ma05,ma08,ma12<=0.0015   kd1[1]<=-10  macd signal[1]-[2]<=-0.00002 
                      (ma360_240_buffer[1]-ma360_240_buffer[6]<=-0.0001 && ma05_240_buffer[1]-ma05_240_buffer[2]<=0.0015 &&
                       ma08_240_buffer[1]-ma08_240_buffer[2]<=0.0015 && ma12_240_buffer[1]-ma12_240_buffer[2]<=0.0015 &&
                       k1_240_buffer[1]-d1_240_buffer[1]<=-10 && macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]<=-0.00002) ||
                        (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                         longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                         longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                         longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                         longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                         longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                         longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                         longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                         longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                         longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                         longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                         longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()))) 
                         return;
                         else
                         longbuy09=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B9",8809,0,OrangeRed );

 //+++++++++++++++++++++++++++++++++++++++++++   BUY   10   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                 
                                    //h1 [1] ����W�L30,50,70,100�I   
                                //100 �I [1]-[2]>=0.0001  [1]-[3]>=0.0001
      if   ((((close_60_buffer[1]-open_60_buffer[1]>=0.0100 && close_60_buffer[1]-close_60_buffer[2]>=0.0001  &&
            close_60_buffer[1]-close_60_buffer[3]>=0.0001 && 
                               //kd1,kd2,kd3>=0  k1,k2,k3<=30 
            k1_60_buffer[1]-d1_60_buffer[1]>=0 && k2_60_buffer[1]-d2_60_buffer[1]>=0 && k3_60_buffer[1]-d3_60_buffer[1]>=0 &&
            k1_60_buffer[1]<=30 && k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30) ||
                               //75 �I [1]-[2]>=0~~~~[1]-[4]>=0 
           (close_60_buffer[1]-open_60_buffer[1]>=0.0075 && close_60_buffer[1]-close_60_buffer[2]>=0  &&
            close_60_buffer[1]-close_60_buffer[3]>=0 && close_60_buffer[1]-close_60_buffer[4]>=0  &&
                              //kd1,kd2,kd3>=0 k1,k2,k3<=30 
            k1_60_buffer[1]-d1_60_buffer[1]>=0 && k2_60_buffer[1]-d2_60_buffer[1]>=0 && k3_60_buffer[1]-d3_60_buffer[1]>=0 &&
            k1_60_buffer[1]<=30 && k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30) ||
                              //55 �I [1]-[2][3]>=0,[1]-[6]>=0 
           (close_60_buffer[1]-open_60_buffer[1]>=0.0055 && close_60_buffer[1]-close_60_buffer[2]>=0  &&
            close_60_buffer[1]-close_60_buffer[3]>=0 && close_60_buffer[1]-close_60_buffer[6]>=0  &&
                              //kd1,kd2,kd3>=0 k1,k2,k3<=30 
            k1_60_buffer[1]-d1_60_buffer[1]>=0 && k2_60_buffer[1]-d2_60_buffer[1]>=0 && k3_60_buffer[1]-d3_60_buffer[1]>=0 &&
            k1_60_buffer[1]<=30 && k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30) ||
                          //30 �I [1]-[2]>=0~~~~~[1]-[8]>=0 
           (close_60_buffer[1]-open_60_buffer[1]>=0.0030 && close_60_buffer[1]-close_60_buffer[2]>=0  &&
            close_60_buffer[1]-close_60_buffer[3]>=0 && close_60_buffer[1]-close_60_buffer[4]>=0  &&
            close_60_buffer[1]-close_60_buffer[5]>0 && close_60_buffer[1]-close_60_buffer[6]>=0  &&
            close_60_buffer[1]-close_60_buffer[7]>=0 && close_60_buffer[1]-close_60_buffer[8]>=0  &&
                                  //kd1,kd2,kd3>=2 k1,k2,k3<=30 
            k1_60_buffer[1]-d1_60_buffer[1]>=2 && k2_60_buffer[1]-d2_60_buffer[1]>=2 && k3_60_buffer[1]-d3_60_buffer[1]>=2 &&
            k1_60_buffer[1]<=30 && k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30))))
                          //h4  k2,k3 �b47�W  �}�f�V�U  �����R�� 
            if    ((k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3���V�U,�� h4,m30,m60 kd2,kd3�V�U�}�f�j �� k1,k,2,k3�b���C
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
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd�t��>=-350
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
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14) || 
                     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                      longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                      longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                      longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                      longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                      longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                      longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                      longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                      longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                      longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                      longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                      longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()))) 
                      return;
                      else
                      longbuy10=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B10",8810,0,Gold );

 //+++++++++++++++++++++++++++++++++++++++++++   BUY   11   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                      //m30 �� [+4][-3][-2][+1]   [1]>=0.0030 
         if   ((close_30_buffer[1]-open_30_buffer[1]>=0.0030 && close_30_buffer[4]-open_30_buffer[4]>=0.0008  && 
               close_30_buffer[2]-open_30_buffer[2]<=-0.0008 && close_30_buffer[3]-open_30_buffer[3]<=-0.0008 &&
               k2_30_buffer[1]-d2_30_buffer[1]>=12 && k3_30_buffer[1]-d3_30_buffer[1]>=12 &&
               k2_30_buffer[1]<=45 && k3_30_buffer[1]<=45) || 
                       //m30 �� [+5][-4][-3][-2][+1]  [1]>=0.0015  
              (close_30_buffer[1]-open_30_buffer[1]>=0.0015 && close_30_buffer[5]-open_30_buffer[5]>=0.0010  && 
               close_30_buffer[2]-open_30_buffer[2]<=-0.0010 && close_30_buffer[3]-open_30_buffer[3]<=-0.0010 &&
               close_30_buffer[4]-open_30_buffer[4]<=-0.0010 &&
               k2_30_buffer[1]-d2_30_buffer[1]>=10 && k3_30_buffer[1]-d3_30_buffer[1]>=10 &&
               k2_30_buffer[1]<=30 && k3_30_buffer[1]<=30) || 
  
                  //m60 �� [+4][-3][-2][+1]   [1]>=0.0030 
              (close_60_buffer[1]-open_60_buffer[1]>=0.0030 && close_60_buffer[4]-open_60_buffer[4]>=0.0010  && 
               close_60_buffer[2]-open_60_buffer[2]<=-0.0010 && close_60_buffer[3]-open_60_buffer[3]<=-0.0010 &&
               k2_60_buffer[1]-d2_60_buffer[1]>=10 && k3_60_buffer[1]-d3_60_buffer[1]>=10 &&
               k2_60_buffer[1]<=55 && k3_60_buffer[1]<=55) || 
                     //m60 �� [+4][-3][-2][+1]   [1]>=0.0020 
              (close_60_buffer[1]-open_60_buffer[1]>=0.0020 && close_60_buffer[4]-open_60_buffer[4]>=0.0007  && 
               close_60_buffer[2]-open_60_buffer[2]<=-0.0007 && close_60_buffer[3]-open_60_buffer[3]<=-0.0007 &&
               k1_60_buffer[1]-d1_60_buffer[1]>=0 && k2_60_buffer[1]-d2_60_buffer[1]>=5 && k3_60_buffer[1]-d3_60_buffer[1]>=5 &&
               k2_60_buffer[1]<=20 && k3_60_buffer[1]<=20) || 
                     //m60 �� [+5][-4][-3][-2][+1]  [1]>=0.0015  
              (close_60_buffer[1]-open_60_buffer[1]>=0.0015 && close_60_buffer[5]-open_60_buffer[5]>=0.0007  && 
               close_60_buffer[2]-open_60_buffer[2]<=-0.0007 && close_60_buffer[3]-open_60_buffer[3]<=-0.0007 &&
               close_60_buffer[4]-open_60_buffer[4]<=-0.0007 &&
               k2_60_buffer[1]-d2_60_buffer[1]>=4 && k3_60_buffer[1]-d3_60_buffer[1]>=4 &&
               k2_60_buffer[1]<=35 && k3_60_buffer[1]<=35) || 

                        //m60 �� [+5][-4][+3][-2][+1]  [1]>=0.0015  
              (close_60_buffer[1]-open_60_buffer[1]>=0.0015 && close_60_buffer[5]-open_60_buffer[5]>=0.0007  && 
               close_60_buffer[2]-open_60_buffer[2]<=-0.0007 && close_60_buffer[3]-open_60_buffer[3]>=0.0007 &&
               close_60_buffer[4]-open_60_buffer[4]<=-0.0007 &&
               k1_60_buffer[1]-k1_60_buffer[2]>=0 &&  k2_60_buffer[1]-k2_60_buffer[2]>=0 && k3_60_buffer[1]-k3_60_buffer[2]>=0 &&
               k2_60_buffer[1]<=20 && k3_60_buffer[1]<=20)) 
              
                          //h4  k2,k3 �b47�W  �}�f�V�U  �����R�� 
               if  ((k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3���V�U,�� h4,m30,m60 kd2,kd3�V�U�}�f�j �� k1,k,2,k3�b���C
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
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd�t��>=-350
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
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14) || 
                     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                      longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                      longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                      longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                      longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                      longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                      longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                      longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                      longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                      longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                      longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                      longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()))) 
                      return;
                      else
                      longbuy11=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B11",8811,0,Gold );
 
    //+++++++++++++++++++++++++++++++++++++++++++   BUY   12   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                  //m30 [2]�d�U�v�u >=25�I  [1]>0.0001�}-�C  [1]<-0.0001��-�C
       if  (((close_30_buffer[2]-open_30_buffer[2]<=-0.0001 && low_30_buffer[2]-close_30_buffer[2]<=-0.0025) ||
             (close_30_buffer[2]-open_30_buffer[2]>=0.0001  && low_30_buffer[2]-open_30_buffer[2]<=-0.0025) &&
             (low_30_buffer[1]==M15lowest50bar || low_30_buffer[2]==M15lowest50bar) &&
                                  //       [1]����  [1]-[2]>=0.0001   k1,k2,k3>=0  k1,k2,k3<=30
             (close_30_buffer[1]-open_30_buffer[1]>=0.0001 && close_30_buffer[1]-close_30_buffer[2]>=0.0001 &&
              k1_30_buffer[1]-k1_30_buffer[2]>=0 && k2_30_buffer[1]-k2_30_buffer[2]>=0 && k3_30_buffer[1]-k3_30_buffer[2]>=0 &&
              k1_30_buffer[1]<=30 && k2_30_buffer[1]<=30 && k3_30_buffer[1]<=30) ||
                                    //    [1]����  [1]-[2]>=0.0001   k1,(k2||k3)>=0  k1,k2,k3<=30 kd1>=1
             (close_30_buffer[1]-open_30_buffer[1]>=0.0001 && close_30_buffer[1]-close_30_buffer[2]>=0.0001 &&
              k1_30_buffer[1]-k1_30_buffer[2]>=0 && (k2_30_buffer[1]-k2_30_buffer[2]>=0 || k3_30_buffer[1]-k3_30_buffer[2]>=0) &&
              k1_30_buffer[1]-d1_30_buffer[2]>=1 && 
              k1_30_buffer[1]<=20 && k2_30_buffer[1]<=20 && k3_30_buffer[1]<=20)) ||
              
                                     //m30 [1]&&[2]�d�U�v�u >=25�I  [1]>0.0001�}-�C  [1]<-0.0001��-�C
            ((close_30_buffer[1]-open_30_buffer[1]<=-0.0001 && close_30_buffer[1]-open_30_buffer[1]>=-0.0010 && 
            low_30_buffer[1]-close_30_buffer[1]<=-0.0025) ||
             (close_30_buffer[1]-open_30_buffer[1]>=0.0001  && low_30_buffer[1]-open_30_buffer[1]<=-0.0025) &&
             (close_30_buffer[2]-open_30_buffer[2]<=-0.0001 && low_30_buffer[2]-close_30_buffer[2]<=-0.0025) ||
             (close_30_buffer[2]-open_30_buffer[2]>=0.0001  && low_30_buffer[2]-open_30_buffer[2]<=-0.0025) &&
              k1_30_buffer[1]<=30 && k2_30_buffer[1]<=30 && k3_30_buffer[1]<=30  &&
             (low_30_buffer[1]==M15lowest50bar || low_30_buffer[2]==M15lowest50bar) &&
                                  //       [1]����  [1]-[2]>=0.0001   k2,k3>=0  k1,k2,k3<=30
              close_30_buffer[1]-open_30_buffer[1]>=0.0010 && close_30_buffer[1]-close_30_buffer[2]>=0.0001 &&
              k2_30_buffer[1]-k2_30_buffer[2]>=0 && k3_30_buffer[1]-k3_30_buffer[2]>=0 &&
              k1_30_buffer[1]<=30 && k2_30_buffer[1]<=30 && k3_30_buffer[1]<=30) ||
                                    // [1]�d�U�v�u >=40�I  [1]>0.0001�}-�C  k1,k2,k3>=1  ,k1,k2,k3<=20
            ((close_30_buffer[1]-open_30_buffer[1]>=0.0001  && low_30_buffer[1]-open_30_buffer[1]<=-0.0040) &&
              low_30_buffer[1]==M15lowest50bar &&
              k1_30_buffer[1]-k1_30_buffer[2]>=1 && k2_30_buffer[1]-k2_30_buffer[2]>=1 && k3_30_buffer[1]-k3_30_buffer[2]>=1 &&
              k1_30_buffer[1]<=20 && k2_30_buffer[1]<=20 && k3_30_buffer[1]<=20))
          
                                         
                                      //return  else  �H�U buy 12   buy13  �ۦP �M buy1  ~  buy 11  ���P
                                      //return  else  �H�U buy 12   buy13  �ۦP �M buy1  ~  buy 11  ���P

               if  ((k2_60_buffer[1]-d2_60_buffer[1]<=-25  &&  k3_60_buffer[1]-d3_60_buffer[1]<=-25) ||
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-10  && k2_60_buffer[1]-d2_60_buffer[1]<=-10  &&  k3_60_buffer[1]-d3_60_buffer[1]<=-10) ||                                   //h4  k2,k3 �b47�W  �}�f�V�U  �����R�� 
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
                         //(m15-57)h4  [1]�^�L140�I
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0140) ||
                     //(m15-59) h4  ma45,ma90,ma180�䤤���G[1]-[2]<=0    [1]<=-0.0100
                  ((ma45_240_buffer[1]-ma45_240_buffer[2]<=0 || ma90_240_buffer[1]-ma90_240_buffer[2]<=0) &&
                   (ma90_240_buffer[1]-ma90_240_buffer[2]<=0 || ma180_240_buffer[1]-ma180_240_buffer[2]<=0) &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0100) ||  
                         //(m15-59) h4 k1||k2||k3 >=65 don't buy
                   (k1_240_buffer[1]>=65 || k2_240_buffer[1]>=65 || k3_240_buffer[1]>=65) ||                   
                      //(m15-57)h4  ma45[1][2]<=-0.0007  ma90[1][2]<=-0.0004  ma45||ma90([1]-[2])-[2]-[3])<=-0.0001 ma45,ma90���Z<=0.0400 >=-0.0035
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0007  &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0004 &&
                  ((ma45_240_buffer[1]-ma45_240_buffer[2])-(ma45_240_buffer[2]-ma45_240_buffer[3])<=-0.0001  ||
                   (ma90_240_buffer[1]-ma90_240_buffer[2])-(ma90_240_buffer[2]-ma90_240_buffer[3])<=-0.0001) &&
                    //(m15-58)   ma45�bma90 �U�����Z<=0.0350 >=-0.0010
                    ma45_240_buffer[1]-ma90_240_buffer[1]<=0.0350 && ma45_240_buffer[1]-ma90_240_buffer[1]>=-0.0010) ||
                          //(m15-58)h4  kd1+kd2+kd3<=-49 kd1,kd2,kd3<=-7
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-49 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-7 && k2_240_buffer[1]-d2_240_buffer[1]<=-7 && k3_240_buffer[1]-d3_240_buffer[1]<=-7) ||
                     //(m15-59)(m15-58)h4  kd1+kd2+kd3<=-40 kd1,kd2,kd3<=-12
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-40 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-12 && k2_240_buffer[1]-d2_240_buffer[1]<=-12 && k3_240_buffer[1]-d3_240_buffer[1]<=-12) ||
                  
                           //(m15-61)(m15-57)h4  [1]�^�L100�I  (ma45<=-0.0015  || [0]<=-0.0150)
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
                  
                      //(m15-66)  kd2,kd3[1]<=-15 k1[0]-[1]<=-5||kd1[1]<=-5   macd<=-0.00300
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                  ((k1_240_buffer[0]-k1_240_buffer[1]<=-5) || (k1_240_buffer[1]-d1_240_buffer[1]<=-5)) &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300) ||    
                    // (m15-16)  kd2,kd3[1]<=-7 k1[0]-[1]<=-7||kd1[1]<=-7      macd[1]<=-0.00350  macd[2]<=-0.00250  (macd[1]-[2]<=-0.00070 || macdmain[1]-[2]<=-0.00150  macdsignal[1]-[2]<=-0.0070 
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-7  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-7 &&
                  ((k1_240_buffer[0]-k1_240_buffer[1]<=-7) || (k1_240_buffer[1]-d1_240_buffer[1]<=-7)) &&
                     macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00350 &&
                    macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]<=-0.00250 && 
                  (((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1])-(macdmainline_240_buffer[2]-macdsignalline_240_buffer[2])<=-0.00070) ||    
                    (macdmainline_240_buffer[1]-macdmainline_240_buffer[2]<=-0.00150 && macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2])<=-0.00070)) ||
                          //ma45  ma90 <=-0.0014
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0014  &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0014) ||
                          //(m15-57) h4 ma45  ma90 <=-0.0010   ma45+ma90<=-0.0029
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0010  &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0010 &&
                   (ma45_240_buffer[1]-ma45_240_buffer[2])+ (ma90_240_buffer[1]-ma90_240_buffer[2])<=-0.0029) ||

                           //H4 k1,k2,k3���V�U,�� h4,m30,m60 kd2,kd3�V�U�}�f�j �� k1,k,2,k3�b���C
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-2 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-25  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-25 && 
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                    k2_240_buffer[0]>=40 && k3_240_buffer[1]>=40 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-10  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-10  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-10  &&  k2_240_buffer[0]>=70 && k3_240_buffer[1]>=70 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  && 
                    k1_240_buffer[1]-k1_240_buffer[2]<=0 &&  k2_240_buffer[1]-k2_240_buffer[2]<=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]<=0 &&  close_240_buffer[1]-open_240_buffer[1]<=-0.0001 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                                       //34�� �����34���������ʧ@
                   (OrderType()==OP_BUY && TimeCurrent()-OrderCloseTime()<=2000) ||
                     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                      longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                      longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                      longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                      longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                      longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                      longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                      longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                      longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                      longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                      longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                      longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()))) 
                      return;
                      else
                      longbuy12=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B12",8812,0,Maroon );

   //+++++++++++++++++++++++++++++++++++++++++++   BUY   13   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                  //h1 �d�U�v�u[2] >=25�I  [1]>0.0001�}-�C  [1]<-0.0001��-�C
       if  (((close_60_buffer[2]-open_60_buffer[2]<=-0.0001 && low_60_buffer[2]-close_60_buffer[2]<=-0.0025) ||
             (close_60_buffer[2]-open_60_buffer[2]>=0.0001  && low_60_buffer[2]-open_60_buffer[2]<=-0.0025) &&
             (low_60_buffer[1]==M15lowest70bar || low_60_buffer[2]==M15lowest70bar) &&
                                  //       [1]����  [1]-[2]>=0.0001   k1,k2,k3>=0  k1,k2,k3<=30
             (close_60_buffer[1]-open_60_buffer[1]>=0.0010 && close_60_buffer[1]-close_60_buffer[2]>=0.0001 &&
              k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 && k3_60_buffer[1]-k3_60_buffer[2]>=0 &&
              k1_60_buffer[1]<=30 && k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30) ||
                                       //    [1]����  [1]-[2]>=0.0001   k1,(k2||k3)>=0  k1,k2,k3<=30 kd1>=1
             (close_60_buffer[1]-open_60_buffer[1]>=0.0001 && close_60_buffer[1]-close_60_buffer[2]>=0.0001 &&
              k1_60_buffer[1]-k1_60_buffer[2]>=0 && (k2_60_buffer[1]-k2_60_buffer[2]>=0 || k3_60_buffer[1]-k3_60_buffer[2]>=0) &&
              k1_60_buffer[1]-d1_60_buffer[2]>=1 && 
              k1_60_buffer[1]<=20 && k2_60_buffer[1]<=20 && k3_60_buffer[1]<=20)) ||
            
                                     //m60 [1],[2]�d�U�v�u >=24�I  [1]>0.0001�}-�C  [1]<-0.0001��-�C  [1]>=-0.0010  <=-0.0001
            ((close_60_buffer[1]-open_60_buffer[1]<=-0.0001 && close_60_buffer[1]-open_60_buffer[1]>=-0.0010 && 
              low_60_buffer[1]-close_60_buffer[1]<=-0.0024) ||
             (close_60_buffer[1]-open_60_buffer[1]>=0.0001  && low_60_buffer[1]-open_60_buffer[1]<=-0.0024) &&
             (close_60_buffer[2]-open_60_buffer[2]<=-0.0001 && low_60_buffer[2]-close_60_buffer[2]<=-0.0024) ||
             (close_60_buffer[2]-open_60_buffer[2]>=0.0001  && low_60_buffer[2]-open_60_buffer[2]<=-0.0024) &&
              k1_60_buffer[1]<=20 && k2_60_buffer[1]<=20 && k3_60_buffer[1]<=20 &&
             (low_60_buffer[1]==M15lowest70bar || low_60_buffer[2]==M15lowest70bar)) ||
                                    // [1]�d�U�v�u >=40�I  [1]>0.0001�}-�C  k1,k2,k3>=1  ,k1,k2,k3<=20
            ((close_60_buffer[1]-open_60_buffer[1]>=0.0001  && low_60_buffer[1]-open_60_buffer[1]<=-0.0040) &&
              low_60_buffer[1]==M15lowest70bar &&
              k1_60_buffer[1]-k1_60_buffer[2]>=1 && k2_60_buffer[1]-k2_60_buffer[2]>=1 && k3_60_buffer[1]-k3_60_buffer[2]>=1 &&
              k1_60_buffer[1]<=20 && k2_60_buffer[1]<=20 && k3_60_buffer[1]<=20))
                         
                                            
                                      //return  else  �H�U buy 12   buy13  �ۦP �M buy1  ~  buy 11  ���P
                                      //return  else  �H�U buy 12   buy13  �ۦP �M buy1  ~  buy 11  ���P

               if  ((k2_60_buffer[1]-d2_60_buffer[1]<=-25  &&  k3_60_buffer[1]-d3_60_buffer[1]<=-25) ||
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-10  && k2_60_buffer[1]-d2_60_buffer[1]<=-10  &&  k3_60_buffer[1]-d3_60_buffer[1]<=-10) ||                                   //h4  k2,k3 �b47�W  �}�f�V�U  �����R�� 
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
                         //(m15-57)h4  [1]�^�L140�I
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0140) ||
                     //(m15-59) h4  ma45,ma90,ma180�䤤���G[1]-[2]<=0    [1]<=-0.0100
                  ((ma45_240_buffer[1]-ma45_240_buffer[2]<=0 || ma90_240_buffer[1]-ma90_240_buffer[2]<=0) &&
                   (ma90_240_buffer[1]-ma90_240_buffer[2]<=0 || ma180_240_buffer[1]-ma180_240_buffer[2]<=0) &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0100) ||  
                         //(m15-59) h4 k1||k2||k3 >=65 don't buy
                   (k1_240_buffer[1]>=65 || k2_240_buffer[1]>=65 || k3_240_buffer[1]>=65) ||                   
                      //(m15-57)h4  ma45[1][2]<=-0.0007  ma90[1][2]<=-0.0004  ma45||ma90([1]-[2])-[2]-[3])<=-0.0001 ma45,ma90���Z<=0.0400 >=-0.0035
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0007  &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0004 &&
                  ((ma45_240_buffer[1]-ma45_240_buffer[2])-(ma45_240_buffer[2]-ma45_240_buffer[3])<=-0.0001  ||
                   (ma90_240_buffer[1]-ma90_240_buffer[2])-(ma90_240_buffer[2]-ma90_240_buffer[3])<=-0.0001) &&
                    //(m15-58)   ma45�bma90 �U�����Z<=0.0350 >=-0.0010
                    ma45_240_buffer[1]-ma90_240_buffer[1]<=0.0350 && ma45_240_buffer[1]-ma90_240_buffer[1]>=-0.0010) ||
                          //(m15-58)h4  kd1+kd2+kd3<=-49 kd1,kd2,kd3<=-7
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-49 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-7 && k2_240_buffer[1]-d2_240_buffer[1]<=-7 && k3_240_buffer[1]-d3_240_buffer[1]<=-7) ||
                     //(m15-59)(m15-58)h4  kd1+kd2+kd3<=-40 kd1,kd2,kd3<=-12
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-40 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-12 && k2_240_buffer[1]-d2_240_buffer[1]<=-12 && k3_240_buffer[1]-d3_240_buffer[1]<=-12) ||
                  
                           //(m15-61)(m15-57)h4  [1]�^�L100�I  (ma45<=-0.0015  || [0]<=-0.0150)
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
                  
                      //(m15-66)  kd2,kd3[1]<=-15 k1[0]-[1]<=-5||kd1[1]<=-5   macd<=-0.00300
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                  ((k1_240_buffer[0]-k1_240_buffer[1]<=-5) || (k1_240_buffer[1]-d1_240_buffer[1]<=-5)) &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300) ||    
                    // (m15-16)  kd2,kd3[1]<=-7 k1[0]-[1]<=-7||kd1[1]<=-7 macd[1]<=-0.00350  macd[2]<=-0.00250  (macd[1]-[2]<=-0.00070 || macdmain[1]-[2]<=-0.00150  macdsignal[1]-[2]<=-0.0070 
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-7  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-7 &&
                  ((k1_240_buffer[0]-k1_240_buffer[1]<=-7) || (k1_240_buffer[1]-d1_240_buffer[1]<=-7)) &&
                     macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00350 &&
                    macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]<=-0.00250 && 
                  (((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1])-(macdmainline_240_buffer[2]-macdsignalline_240_buffer[2])<=-0.00070) ||    
                    (macdmainline_240_buffer[1]-macdmainline_240_buffer[2]<=-0.00150 && macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2])<=-0.00070)) ||
                          //ma45  ma90 <=-0.0014
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0014  &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0014) ||
                          //(m15-57) h4 ma45  ma90 <=-0.0010   ma45+ma90<=-0.0029
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0010  &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0010 &&
                   (ma45_240_buffer[1]-ma45_240_buffer[2])+ (ma90_240_buffer[1]-ma90_240_buffer[2])<=-0.0029) ||

                           //H4 k1,k2,k3���V�U,�� h4,m30,m60 kd2,kd3�V�U�}�f�j �� k1,k,2,k3�b���C
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-2 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-25  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-25 && 
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                    k2_240_buffer[0]>=40 && k3_240_buffer[1]>=40 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-10  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-10  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-10  &&  k2_240_buffer[0]>=70 && k3_240_buffer[1]>=70 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  && 
                    k1_240_buffer[1]-k1_240_buffer[2]<=0 &&  k2_240_buffer[1]-k2_240_buffer[2]<=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]<=0 &&  close_240_buffer[1]-open_240_buffer[1]<=-0.0001 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                                       //34�� �����34���������ʧ@
                   (OrderType()==OP_BUY && TimeCurrent()-OrderCloseTime()<=2000) ||
                     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                      longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                      longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                      longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                      longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                      longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                      longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                      longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                      longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                      longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                      longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                      longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()))) 
                      return;
                      else
                      longbuy13=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B13",8813,0,DeepPink );
 
     //+++++++++++++++++++++++++++++++++++++++++++   BUY   14   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                //(m15-62) h1    macd<=-0.00870   �t�Ȧb-50,+50��         �o�ͪ����v���h�ҥH���ϥΪ��p�ư��k
        if    (macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=0.00040 && macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=-0.00040 &&
               macdmainline_60_buffer[1]<=-0.00870 &&
                    //k1,k2,k3  [1]-[2]>=0   k1,k2,k3<=30 || ma180 ,ma360�פW
               k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 && 
               k3_60_buffer[1]-k3_60_buffer[2]>=0 && 
             ((k1_60_buffer[1]<=30 && k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30) || (ma180_60_buffer[1]-ma180_60_buffer[2]>=0.0001 &&
               ma360_60_buffer[1]-ma360_60_buffer[2]>=0.0001)))
               if  ((ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0011 && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0008 &&
                     ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.0004 && ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.0001) ||
                     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                      longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                      longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                      longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                      longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                      longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                      longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                      longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                      longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                      longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                      longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                      longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()))) 
                      return;
                      else
                      longbuy14=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B14",8814,0,LimeGreen );
  
    //+++++++++++++++++++++++++++++++++++++++++++   BUY   15   ++++++++++++++++++++++++++++++++++++++++++++++++++          
  
  
                  //(m15-63)  H4     [2][3]����<20�I     [1]����>=10�I  �d�U�v�u>30�I   
      if     (close_240_buffer[1]-open_240_buffer[1]>=0.0010  && low_240_buffer[1]-open_240_buffer[1]<=-0.0030 &&
              close_240_buffer[2]-open_240_buffer[2]<=-0.0009  && close_240_buffer[3]-open_240_buffer[3]<=-0.0009  &&   
               // ma45 ma90 || ma90  ma180  �פW�B�j
             ((ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0008 &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002) ||
              (ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0006 &&  ma180_240_buffer[1]-ma180_240_buffer[2]>=0.0002)) &&
                // [1]���L�bma05���W  ���W�L15�I
              close_240_buffer[1]-ma05_240_buffer[1]>=0.0001  && close_240_buffer[1]-ma05_240_buffer[1]<=0.0015) 
               // (m15-66) kd2,kd3[1]-[2]<=-7    k2,k2>=70 
              if    ((k1_240_buffer[1]-d1_240_buffer[1]<=-7 && k2_240_buffer[1]-d2_240_buffer[1]<=-7 && k3_240_buffer[1]-d3_240_buffer[1]<=-7 &&
                     k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
                     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                      longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                      longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                      longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                      longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                      longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                      longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                      longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                      longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                      longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                      longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                      longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()))) 
                      return;
                      else
                      longbuy15=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B15",8815,0,FireBrick );
    
  //+++++++++++++++++++++++++++++++++++++++++++   BUY   16   ++++++++++++++++++++++++++++++++++++++++++++++++++          
              
                   //(m15-65)   h4 �� ma650�פW             ma360�פW�u�u
         if   (ma650_240_buffer[1]-ma650_240_buffer[2]>0 &&
                  //h4 [1]���t�B�bma360���U�����W�L25�I
             ((close_240_buffer[1]-open_240_buffer[1]<=-0.0001 && close_240_buffer[1]-ma360_240_buffer[1]<=-0.0001 &&
               close_240_buffer[1]-ma360_240_buffer[1]>=-0.0025) ||
                 //h4 [1]�����B�bma360���W�����W�L25�I ��[2]�U�v�u�j��25�I
              (close_240_buffer[1]-open_240_buffer[1]>=0.0001 && close_240_buffer[1]-ma360_240_buffer[1]<=-0.0001 &&
               close_240_buffer[1]-ma360_240_buffer[1]>=-0.0025 && low_240_buffer[2]-close_240_buffer[2]<=-0.0025)) &&
                 //k2,k3[1]-[2]>=0    k2,k2<=30  k1[1]-[2]>0 || [1]�U�v�u�j��25�I
               k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
               k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30 &&
              (k1_240_buffer[1]-k1_240_buffer[2]>=0 ||  low_240_buffer[1]-close_240_buffer[1]<=-0.0025) &&  
                  // macd�t��>=-0.00150  <=0.00100 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00150 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100 && 
              // [2]||[3]||[4]||[5]���bma360�W��25�I��  
             ((close_240_buffer[2]-ma360_240_buffer[2]>=0.0001  && close_240_buffer[2]-ma360_240_buffer[2]<=0.0025) ||
              (close_240_buffer[3]-ma360_240_buffer[3]>=0.0001  && close_240_buffer[3]-ma360_240_buffer[3]<=0.0025) ||
              (close_240_buffer[4]-ma360_240_buffer[4]>=0.0001  && close_240_buffer[4]-ma360_240_buffer[4]<=0.0025) ||
              (close_240_buffer[5]-ma360_240_buffer[5]>=0.0001  && close_240_buffer[5]-ma360_240_buffer[5]<=0.0025)))
       if     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
               longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
               longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
               longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
               longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
               longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
               longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
               longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
               longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
               longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
               longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
               longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket())) 
               return;
               else
               longbuy16=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B16",8816,0,OrangeRed );
 
  //+++++++++++++++++++++++++++++++++++++++++++   BUY   17   ++++++++++++++++++++++++++++++++++++++++++++++++++          
              
                   //(m15-65)   h4 �� ma650�פW          ma180�פW�u�u
         if   (ma650_240_buffer[1]-ma650_240_buffer[2]>0.0001 &&
                  //h4 [1]���t�B�bma180���U�����W�L25�I
             ((close_240_buffer[1]-open_240_buffer[1]<=-0.0001 && close_240_buffer[1]-ma180_240_buffer[1]<=-0.0001 &&
               close_240_buffer[1]-ma180_240_buffer[1]>=-0.0025) ||
                 //h4 [1]�����B�bma180���W�����W�L25�I ��[2]�U�v�u�j��25�I
              (close_240_buffer[1]-open_240_buffer[1]>=0.0001 && close_240_buffer[1]-ma180_240_buffer[1]<=-0.0001 &&
               close_240_buffer[1]-ma180_240_buffer[1]>=-0.0025 && low_240_buffer[2]-close_240_buffer[2]<=-0.0025)) &&
                 //k2,k3[1]-[2]>=0 ||kd2,kd3>=1   k2,k2<=30  k1[1]-[2]>0 || [1]�U�v�u�j��25�I
             ((k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0) ||
              (k2_240_buffer[1]-d2_240_buffer[2]>=1 && k3_240_buffer[1]-d3_240_buffer[2]>=1)) &&
               k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30 &&
              (k1_240_buffer[1]-k1_240_buffer[2]>=0 ||  low_240_buffer[1]-close_240_buffer[1]<=-0.0025) &&  
                  // macd�t��>=-0.00150  <=0.00100 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00150 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100 && 
              // [2]||[3]||[4]||[5]���bma180�W��25�I��  
             ((close_240_buffer[2]-ma180_240_buffer[2]>=0.0001  && close_240_buffer[2]-ma180_240_buffer[2]<=0.0025) ||
              (close_240_buffer[3]-ma180_240_buffer[3]>=0.0001  && close_240_buffer[3]-ma180_240_buffer[3]<=0.0025) ||
              (close_240_buffer[4]-ma180_240_buffer[4]>=0.0001  && close_240_buffer[4]-ma180_240_buffer[4]<=0.0025) ||
              (close_240_buffer[5]-ma180_240_buffer[5]>=0.0001  && close_240_buffer[5]-ma180_240_buffer[5]<=0.0025)))
       if     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
               longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
               longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
               longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
               longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
               longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
               longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
               longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
               longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
               longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
               longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
               longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket())) 
               return;
               else
               longbuy17=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B17",8817,0,OrangeRed );

    //+++++++++++++++++++++++++++++++++++++++++++   BUY   18   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                   
               //(m15-65)  ma45�פW  ma90�����αפW   ma180,ma360,ma650�פU  ���bma45���U�w�[�^���W��[1]�d�U�v�u>25�I�B����                      
      if      (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0 &&       
                 // macd�t��>=-0.00150  <=0.00100 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00150 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100 && 
                   //   k1,k2,k3>=0  k2,k2<=30            
               k1_240_buffer[1]-k1_240_buffer[2]>=0 && k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
               k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30 &&
                 //h4 [1]�����U�v�u�j��25�I
               close_240_buffer[1]-open_240_buffer[1]>=0.0001 &&  low_240_buffer[1]-close_240_buffer[1]<=-0.0025 &&
                  // [1],[2],[3],[4],[5],[6],[7] ���bma45�U��25�I�� ���W5�I�� 
               close_240_buffer[1]-ma45_240_buffer[1]>=-0.0025  && close_240_buffer[1]-ma180_240_buffer[1]<=0.0005 &&
               close_240_buffer[2]-ma45_240_buffer[2]>=-0.0025  && close_240_buffer[2]-ma180_240_buffer[2]<=0.0005 &&
               close_240_buffer[3]-ma45_240_buffer[3]>=-0.0025  && close_240_buffer[3]-ma180_240_buffer[3]<=0.0005 &&
               close_240_buffer[4]-ma45_240_buffer[4]>=-0.0025  && close_240_buffer[4]-ma180_240_buffer[4]<=0.0005 &&
               close_240_buffer[5]-ma45_240_buffer[5]>=-0.0025  && close_240_buffer[5]-ma180_240_buffer[5]<=0.0005 &&
               close_240_buffer[6]-ma45_240_buffer[6]>=-0.0025  && close_240_buffer[6]-ma180_240_buffer[6]<=0.0005)
              if    (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                     longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                     longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                     longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                     longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                     longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                     longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                     longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                     longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                     longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                     longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                     longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket())) 
                     return;
                     else
                     longbuy18=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B18",8818,0,OrangeRed );
 
    //+++++++++++++++++++++++++++++++++++++++++++   BUY   19   ++++++++++++++++++++++++++++++++++++++++++++++++++          
 
                //(m15-65) h4  ����@�q�ɶ��^���W�h  ma �ҤU�����e�{�������
       if     (ma05_240_buffer[1]-ma05_240_buffer[10]<=0  &&  ma05_240_buffer[1]-ma05_240_buffer[10]>=-0.0010 &&
               ma45_240_buffer[1]-ma45_240_buffer[10]<=0  &&  ma45_240_buffer[1]-ma45_240_buffer[10]>=-0.0045 &&
               ma90_240_buffer[1]-ma90_240_buffer[10]<=0  &&  ma90_240_buffer[1]-ma90_240_buffer[10]>=-0.0025 &&   
               ma180_240_buffer[1]-ma180_240_buffer[10]<=0  &&  ma180_240_buffer[1]-ma180_240_buffer[10]>=-0.0025 &&
               ma360_240_buffer[1]-ma360_240_buffer[10]<=0  &&  ma360_240_buffer[1]-ma360_240_buffer[10]>=-0.0025 &&
               ma650_240_buffer[1]-ma650_240_buffer[10]<=0  &&  ma650_240_buffer[1]-ma650_240_buffer[10]>=-0.0025 &&
                // [1]~[6] macd�t��>=-0.0050  <=0.0050 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00050 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00050 && 
               macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]>=-0.00050 &&  macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]<=0.00050 && 
               macdmainline_240_buffer[3]-macdsignalline_240_buffer[3]>=-0.00050 &&  macdmainline_240_buffer[3]-macdsignalline_240_buffer[3]<=0.00050 && 
               macdmainline_240_buffer[4]-macdsignalline_240_buffer[4]>=-0.00050 &&  macdmainline_240_buffer[4]-macdsignalline_240_buffer[4]<=0.00050 && 
               macdmainline_240_buffer[5]-macdsignalline_240_buffer[5]>=-0.00050 &&  macdmainline_240_buffer[5]-macdsignalline_240_buffer[5]<=0.00050 && 
               macdmainline_240_buffer[6]-macdsignalline_240_buffer[6]>=-0.00050 &&  macdmainline_240_buffer[6]-macdsignalline_240_buffer[6]<=0.00050)// && 
                     //(m15-66)  k2,k3<=0  kd1<=-18  ma45�פU
               if ((k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0001  && 
                       //(m15-67)  k2,k3 ���פW����U�^  exit
                   ((k2_240_buffer[4]-k2_240_buffer[5]>=3 && k3_240_buffer[4]-k3_240_buffer[5]>=3) ||
                    (k2_240_buffer[5]-k2_240_buffer[6]>=3 && k3_240_buffer[5]-k3_240_buffer[6]>=3)) &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-18) ||
                      //(m15-67) h4 [1]macd �Ȥ���0.00120 �P-0.00120��  �����                                
                   (macdmainline_240_buffer[1]>=-0.00120 && macdmainline_240_buffer[1]<=0.00120 &&
                    macdsignalline_240_buffer[1]>=-0.00120 &&  macdsignalline_240_buffer[1]<=0.00120))
                   if     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                           longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                           longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                           longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                           longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                           longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                           longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                           longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                           longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                           longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                           longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                           longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket())) 
                           return;
                           else
                           longbuy19=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B19",8819,0,OrangeRed );
 
   //+++++++++++++++++++++++++++++++++++++++++++   BUY   20   ++++++++++++++++++++++++++++++++++++++++++++++++++          
       
         //(m15-66)  ma650�פW [1]>=0.0050   ma90 ���W ma45�bma650���U50�I,�B�פW���j    ma90�bma45���U50�I 
        if     (ma650_240_buffer[1]-ma650_240_buffer[2]>=0.0002  && close_240_buffer[1]-open_240_buffer[1]>=0.0050 &&
                ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0007  && ma90_240_buffer[1]-ma90_240_buffer[1]>=0.0002  &&
                ma45_240_buffer[1]-ma650_240_buffer[2]<=-0.0050  && ma90_240_buffer[1]-ma45_240_buffer[1]<=-0.0050 && 
                    //   kd1,kd2,kd3>=4  k2,k3<=35            
                k1_240_buffer[1]-d1_240_buffer[1]>=4 && k2_240_buffer[1]-d2_240_buffer[1]>=4 && k3_240_buffer[1]-d3_240_buffer[1]>=4 &&
                k2_240_buffer[1]<=35 && k3_240_buffer[1]<=35)
              if    (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                     longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                     longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                     longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                     longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                     longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                     longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                     longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                     longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                     longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                     longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                     longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket())) 
                     return;
                     else
                     longbuy20=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B20",8820,0,OrangeRed );

  //+++++++++++++++++++++++++++++++++++++++++++   BUY   21   ++++++++++++++++++++++++++++++++++++++++++++++++++          
              
                  //(m15-66)   h4 �� ma180,ma360,ma650 �פW ��ma180���� ma360 �פW   
        if   ((ma180_240_buffer[1]-ma180_240_buffer[2]>=-0.0001 && ma360_240_buffer[1]-ma360_240_buffer[2]>=-0.0001 &&
               ma650_240_buffer[1]-ma650_240_buffer[2]>=-0.0001 &&
                  //  macd>=0.00110  <=-0.00110   main && signal >=0.00015   
               macdmainline_240_buffer[1]-macdmainline_240_buffer[2]>=0.00015 && 
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]>=0.00015 &&
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00110 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00110 &&
                     //   kd2,kd3>=3  k2,k3<=35     close[4]||[5]||[6]||[7]>close[1]&& [2] �tw���ʽ�         
               k2_240_buffer[1]-d2_240_buffer[1]>=3 && k3_240_buffer[1]-d3_240_buffer[1]>=3 &&
              (close_240_buffer[4]-open_240_buffer[1]<=0 || close_240_buffer[5]-open_240_buffer[1]<=0 ||
               close_240_buffer[6]-open_240_buffer[1]<=0 || close_240_buffer[7]-open_240_buffer[1]<=0 || 
               close_240_buffer[8]-open_240_buffer[1]<=0 || close_240_buffer[9]-open_240_buffer[1]<=0) && 
              (close_240_buffer[4]-close_240_buffer[2]<=0 || close_240_buffer[5]-close_240_buffer[2]<=0 ||
               close_240_buffer[6]-close_240_buffer[2]<=0 || close_240_buffer[7]-close_240_buffer[2]<=0 || 
               close_240_buffer[8]-close_240_buffer[2]<=0 || close_240_buffer[9]-close_240_buffer[2]<=0) && 
               k2_240_buffer[1]<=35 && k3_240_buffer[1]<=35) ||
  
               //(m15-66)   h4 �� ma180,ma360,ma650 �פW ��ma180���� ma360 �פW   
              (ma180_240_buffer[1]-ma180_240_buffer[2]>=-0.0001 && ma360_240_buffer[1]-ma360_240_buffer[2]>=-0.0001 &&
               ma650_240_buffer[1]-ma650_240_buffer[2]>=-0.0001 &&
                  //  macd>=0.00110  <=-0.00110   main && signal >=0.00015   
               macdmainline_240_buffer[1]-macdmainline_240_buffer[2]>=0.00015 && 
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]>=0.00015 &&
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00110 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00110 &&
                     //   kd2,kd3>=3  k2,k3<=35     close[4]||[5]||[6]||[7]>close[1]&& [2] �tw���ʽ�         
               k2_240_buffer[1]-d2_240_buffer[1]>=3 && k3_240_buffer[1]-d3_240_buffer[1]>=3 &&
              (close_240_buffer[4]-open_240_buffer[1]<=0 || close_240_buffer[5]-open_240_buffer[1]<=0 ||
               close_240_buffer[6]-open_240_buffer[1]<=0 || close_240_buffer[7]-open_240_buffer[1]<=0 || 
               close_240_buffer[8]-open_240_buffer[1]<=0 || close_240_buffer[9]-open_240_buffer[1]<=0) && 
              (close_240_buffer[4]-close_240_buffer[2]<=0 || close_240_buffer[5]-close_240_buffer[2]<=0 ||
               close_240_buffer[6]-close_240_buffer[2]<=0 || close_240_buffer[7]-close_240_buffer[2]<=0 || 
               close_240_buffer[8]-close_240_buffer[2]<=0 || close_240_buffer[9]-close_240_buffer[2]<=0) && 
               k2_240_buffer[1]<=35 && k3_240_buffer[1]<=35) ||
              //(m15-67)   h4 �� ma360, ma650 �פW   ma05||ma08||ma12>=-0.0001 
              (ma360_240_buffer[1]-ma360_240_buffer[2]>=0.0001 && ma650_240_buffer[1]-ma650_240_buffer[2]>=0.0001 &&
              (ma05_240_buffer[1]-ma05_240_buffer[2]>=-0.0001 || ma08_240_buffer[1]-ma08_240_buffer[2]>=-0.0001 ||
               ma12_240_buffer[1]-ma12_240_buffer[2]>=-0.0001) &&
                  //ma45,ma90�w�����  [1]-[6]>=-0.0003
               ma45_240_buffer[1]-ma45_240_buffer[6]>=-0.0003 && ma90_240_buffer[1]-ma90_240_buffer[6]>=-0.0003 &&
                // [1]�U�v�j��30�I          [2],[3]���t  
              (close_240_buffer[1]-open_240_buffer[1]>=0.0001  && low_240_buffer[1]-open_240_buffer[1]<=-0.0030)  ||
               close_240_buffer[1]-open_240_buffer[1]<=-0.0001  && low_240_buffer[1]-close_240_buffer[1]<=-0.0030)  &&
              (close_240_buffer[2]-open_240_buffer[2]<=-0.0001 || close_240_buffer[3]-open_240_buffer[3]<=-0.0001)  && 
                   //   [5]||[6]||[7]||[8]���}�L���b[1]���U   �U�W����U�^�d�U�v�u         
              (open_240_buffer[5]-open_240_buffer[1]<=0 || open_240_buffer[6]-open_240_buffer[1]<=0 ||
               open_240_buffer[7]-open_240_buffer[1]<=0 || open_240_buffer[8]-open_240_buffer[1]<=0 ||
               open_240_buffer[9]-open_240_buffer[1]<=0 || open_240_buffer[10]-open_240_buffer[1]<=0) &&                 //kd2,kd3>=7     
               k2_240_buffer[1]-d2_240_buffer[1]>=3 &&  k3_240_buffer[1]-d3_240_buffer[1]>=3)
               if   (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                     longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                     longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                     longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                     longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                     longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                     longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                     longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                     longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                     longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                     longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                     longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()))
                     return;
                     else
                     longbuy21=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B21",8821,0,OrangeRed );

  //+++++++++++++++++++++++++++++++++++++++++++   BUY   22   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                //�^�Ầ��ma180��A�U�^��ma45�ᤣ�^�F
                //(m15-67)   h4 �� ma45�פW ma90���� ma180 �פU  �W��U�ƦC  ma180,ma90,ma45   
        if    (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 && ma90_240_buffer[1]-ma90_240_buffer[2]>=-0.0001 &&
               ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.0001 && ma45_240_buffer[1]-ma90_240_buffer[1]<=-0.0010 &&
               ma90_240_buffer[1]-ma180_240_buffer[1]<=-0.0010 &&
                     //   kd1,(kd2||kd3)>=3  k1,k2,k3<=25             
               k1_240_buffer[1]-d1_240_buffer[1]>=3 && (k2_240_buffer[1]-d2_240_buffer[1]>=3 || k3_240_buffer[1]-d3_240_buffer[1]>=3) &&
               k2_240_buffer[1]<=25 && k3_240_buffer[1]<=25 &&
               //ma05 [1]-[2]>=0 
               ma05_240_buffer[1]-ma05_240_buffer[2]>=0 &&
                   // [1]�U�v�j��22�I          [2]||[3]���t  
             ((close_240_buffer[1]-open_240_buffer[1]>=0.0001  && low_240_buffer[1]-open_240_buffer[1]<=-0.0022)  ||
              (close_240_buffer[1]-open_240_buffer[1]<=-0.0001  && low_240_buffer[1]-close_240_buffer[1]<=-0.0022))  &&
              (close_240_buffer[2]-open_240_buffer[2]<=-0.0001 || close_240_buffer[3]-open_240_buffer[3]<=-0.0001)   && 
            
                // ([2]||[3]||[4]||[5]) && ([6]||[7]||[8]||[9])  close[1]-ma45<=0.0005 >=-0.0005  ���bma45����
             ((close_240_buffer[2]-ma45_240_buffer[2]<=0.0005 && close_240_buffer[2]-ma45_240_buffer[2]>=-0.0005) || 
              (close_240_buffer[3]-ma45_240_buffer[3]<=0.0005 && close_240_buffer[3]-ma45_240_buffer[3]>=-0.0005) || 
              (close_240_buffer[4]-ma45_240_buffer[4]<=0.0005 && close_240_buffer[4]-ma45_240_buffer[4]>=-0.0005) || 
              (close_240_buffer[5]-ma45_240_buffer[5]<=0.0005 && close_240_buffer[5]-ma45_240_buffer[5]>=-0.0005)) && 
             ((close_240_buffer[6]-ma45_240_buffer[6]<=0.0005 && close_240_buffer[6]-ma45_240_buffer[6]>=-0.0005) || 
              (close_240_buffer[7]-ma45_240_buffer[7]<=0.0005 && close_240_buffer[7]-ma45_240_buffer[7]>=-0.0005) || 
              (close_240_buffer[8]-ma45_240_buffer[8]<=0.0005 && close_240_buffer[8]-ma45_240_buffer[8]>=-0.0005) || 
              (close_240_buffer[9]-ma45_240_buffer[9]<=0.0005 && close_240_buffer[9]-ma45_240_buffer[9]>=-0.0005))) 
              if    (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                     longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                     longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                     longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                     longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                     longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                     longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                     longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                     longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                     longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                     longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                     longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket())) 
                     return;
                     else
                     longbuy22=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B22",8822,0,OrangeRed );
       
  //+++++++++++++++++++++++++++++++++++++++++++   BUY   23   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                //����^��ma180�W�U�d�U�v�u
                //(m15-67)   h4 �� ma90,ma180,ma360,ma650 ���פW     �W��U�ƦC  ma90,ma180,ma360,ma650   
        if    (ma90_240_buffer[1]-ma90_240_buffer[2]>0 && ma180_240_buffer[1]-ma180_240_buffer[2]>=0 &&
               ma360_240_buffer[1]-ma360_240_buffer[2]>0 && ma650_240_buffer[1]-ma650_240_buffer[2]>0.0001 &&
               ma90_240_buffer[1]-ma180_240_buffer[1]>=-0.0010 && ma90_240_buffer[1]-ma180_240_buffer[1]<=0.0010 && 
                  //ma45 �}�f�L�W
              (ma90_240_buffer[1]-ma45_240_buffer[1])-(ma90_240_buffer[2]-ma45_240_buffer[2])>0 && 
                   //macd   signal  [1]<[2] [1]>[3] 
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]<=-0.00001 &&
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[3]>=0.00001 &&

                     // [1]�U�v�j��35�I          [2]||[3]���t  
             ((close_240_buffer[1]-open_240_buffer[1]>=0.0001  && low_240_buffer[1]-open_240_buffer[1]<=-0.0035)  ||
              (close_240_buffer[1]-open_240_buffer[1]<=-0.0001  && low_240_buffer[1]-close_240_buffer[1]<=-0.0035))  &&
              (close_240_buffer[2]-open_240_buffer[2]<=-0.0001 || close_240_buffer[3]-open_240_buffer[3]<=-0.0001)) 
            if   (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                  longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                  longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                  longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                  longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                  longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                  longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                  longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                  longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                  longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                  longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                  longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket())) 
                  return;
                  else
                  longbuy23=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B23",8823,0,Red );
 
       
       //   FOR TEST 
  //         if    (Day()>19)
   //            OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-19*Point,Ask+19*Point,"My order #B25",8825,0,OrangeRed );

//***************************************************************************************************************************             
//***************************************************************************************************************************             
//+++++++++++++++++++++++++++++++++++++++++++   SELL   1   ++++++++++++++++++++++++++++++++++++++++++++++++++          
    

                                        //m15 ��ma45  ma90 �� �~ �W�ɥ��ݫ��A  ma45[1]-[6]���T�{���W�� 
        if (((ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma45_15_buffer[1]-ma45_15_buffer[6]>=0) ||
                                                      //�����W�ɦ�h4 [1]�|���t�p��20�I
             (ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0.0001 && 
                  //h4 ���� �B�U�v�u>=-0.0006
              close_240_buffer[1]-open_240_buffer[1]<=-0.0020 && low_240_buffer[1]-close_240_buffer[1]>=-0.0055 )) && 
              ma90_15_buffer[1]-ma90_15_buffer[2]>=0.0001 && 
                                                     //�W�ɥ��ݤU�^�n�@���^�}�e3bar
              close_15_buffer[1]-close_15_buffer[2]<=-0.0001  && // close_15_buffer[1]-close_15_buffer[3]<=-0.0001 &&
        //      close_15_buffer[1]-close_15_buffer[4]<=-0.0001  &&
                                                 //��m15 m30 macd ���޶R���I 
               macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00010 &&
               macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00050 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&
               macdmainline_30_buffer[1]>=-0.00110   &&
                                                          //m60 ��45,90,180  �ҬO�פU
              (macdmainline_60_buffer[1]>=-0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]<=-0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]<=-0.0003 && 
               ma180_60_buffer[1]-ma180_60_buffer[2]<=0))   &&    
                                                              //k1 (k2||k3)�w�U�^
              k1_15_buffer[1]-k1_15_buffer[2]<=-1  &&  k1_15_buffer[1]-d1_15_buffer[1]<=-1 &&
              k2_15_buffer[1]-k2_15_buffer[2]<=0  ||  k3_15_buffer[1]-k3_15_buffer[2]<=0)
              if ((macdmainline_15_buffer[1]>=-0.00099 && macdmainline_15_buffer[1]<=0.00099 &&
                   macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                  (k2_30_buffer[1]-d2_30_buffer[1]>=19  &&  k3_30_buffer[1]-d3_30_buffer[1]>=19) ||
                  (k2_60_buffer[1]-d2_60_buffer[1]>=19  &&  k3_60_buffer[1]-d3_60_buffer[1]>=19) ||
                        //(m15-65) [1]����>25�I macd�t��>=0.00230
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0025 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00230) ||

                  
                                      //h4  �b53�U  �}�f�V�W  �������
                   (k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3���V�W,��h4,m30,m60  kd2,kd3�V�W�}�f�j �� k1,k,2,k3�b����
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
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd�t��<=350
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
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86) || 
                    (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                     longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                     longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                     longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                     longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                     longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                     longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                     longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                     longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                     longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                     longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                     longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket())) ||
                     TimeCurrent()-OrderCloseTime()<=1000) 
                     return;
                     else
                     longsell01=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S1",4401,0,Green );

//+++++++++++++++++++++++++++++++++++++++++++   SELL   2   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                
                         // h1 k123�b�W�� �Ҭ��U�^
          if  (k1_60_buffer[1]>=85 && k2_60_buffer[1]>=85 && k3_60_buffer[1]>=85  && 
               k1_60_buffer[1]-k1_60_buffer[2]<=-8 &&  k2_60_buffer[1]-k2_60_buffer[2]<=0 &&  k3_60_buffer[1]-k3_60_buffer[2]<=0 &&
                                  //[1]���L�p��20�I �p��[2][3][4] ma05    10�I�W
               close_60_buffer[1]-open_60_buffer[1]<=-0.0020 && close_60_buffer[1]-close_60_buffer[2]<=-0.0010 &&
               close_60_buffer[1]-close_60_buffer[3]<=-0.0010 && close_60_buffer[1]-close_60_buffer[4]<=-0.0010 &&
               close_60_buffer[1]-ma05_60_buffer[1]<=-0.0010 && 
         
               macdmainline_30_buffer[1]>=-0.00110   &&
                                                          //m60 ��45,90,180  �ҬO�פU
              (macdmainline_60_buffer[1]>=-0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]<=-0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]<=-0.0003 && 
               ma180_60_buffer[1]-ma180_60_buffer[2]<=0)))    
                                          //h4  �b53�U  �}�f�V�W  �������
               if ((k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3���V�W,��h4,m30,m60  kd2,kd3�V�W�}�f�j �� k1,k,2,k3�b����
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
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd�t��<=350
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
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86) || 
                    (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                     longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                     longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                     longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                     longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                     longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                     longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                     longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                     longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                     longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                     longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                     longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket())))
                     return;
                     else
                     longsell02=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S2",4402,0,White );
      
//+++++++++++++++++++++++++++++++++++++++++++   SELL   3   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                  
                                       //k1 �@���U�^�` kd1�j�T��e�U 
        if     ((k1_15_buffer[1]-k1_15_buffer[2]<=-10  &&  k1_15_buffer[1]-d1_15_buffer[1]<=-5 && close_15_buffer[1]-open_15_buffer[1]<=-0.0002 &&
                                         //�]���H���L�C�A��X  
                k1_15_buffer[1]>=40 && k2_15_buffer[2]>=40  &&  k3_15_buffer[1]>=40 && 
               (ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=0) || 
               (ma90_15_buffer[1]-ma90_15_buffer[2]<=0 && ma180_15_buffer[1]-ma180_15_buffer[2]<=0) && 
                                                         //���� m30 m60   macd ���i�H�b�L�C��m 
               macdmainline_30_buffer[1]>=-0.00110   && 
                                                          //m60 ��45,90,180  �ҬO�פU
              (macdmainline_60_buffer[1]>=-0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]<=-0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]<=-0.0003 && 
               ma180_60_buffer[1]-ma180_60_buffer[2]<=0))   &&    
                                                               //��m15 m30 macd ���޶R���I 
               macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00010 &&
               macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00050 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020))
               if ((macdmainline_15_buffer[1]>=-0.00099 && macdmainline_15_buffer[1]<=0.00099 &&
                    macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                      //(m15-62) h4 k1,k2,k3 <=35 don't sell
                   (k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||                   
                    //(m15-64) h4 [1]�����äj��30�I  kd2,kd3>=10
                  (close_240_buffer[1]-open_240_buffer[1]>=0.0030 &&                          
                   k2_240_buffer[1]-d2_240_buffer[1]>=10 && k3_240_buffer[1]-d3_240_buffer[1]>=10) ||                        
                  //(m15-64) h4 [1]macd �t��<=-0.00050 [1]���L�����Ȩ�>=25�I,[2]macd �t��<=-0.00030 [2]���L�����Ȩ�>=60�I                                
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0025 &&  close_240_buffer[2]-open_240_buffer[2]>=0.0060 &&                          
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00050 &&
                    macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]<=-0.00030) ||
                     //(m15-66) h4 [1]macd �Ȥ���0.00150 �P-0.00150�� �B kd1,kd2,kd3>=4 �����                                
                   (k1_240_buffer[1]-d1_240_buffer[1]>=4 && k2_240_buffer[1]-d2_240_buffer[1]>=4 &&
                    k3_240_buffer[1]-d3_240_buffer[1]>=4 &&                       
                    macdmainline_240_buffer[1]<=0.00150 && macdmainline_240_buffer[1]>=-0.00150 &&
                    macdsignalline_240_buffer[1]<=0.00150 &&  macdsignalline_240_buffer[1]>=-0.00150) ||
                    //(m15-66) h4 [1]macd �Ȥ���0.00100 �P-0.00100��  �����                                
                   (macdmainline_240_buffer[1]<=0.00100 && macdmainline_240_buffer[1]>=-0.00100 &&
                    macdsignalline_240_buffer[1]<=0.00100 &&  macdsignalline_240_buffer[1]>=-0.00100) ||
                     //(m15-66)  macd �t��>=0.00450  signal[1]-[2]>=0.00100
                   (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00450 &&
                    macdsignalline_240_buffer[1]- macdsignalline_240_buffer[2]>=0.00100) ||
                   (ma05_240_buffer[1]-ma05_240_buffer[2]>=0 && ma08_240_buffer[1]-ma08_240_buffer[2]>=-0.0001 &&
                    ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0007 && ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0001 &&
                    ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0001 && ma180_240_buffer[1]-ma180_240_buffer[2]>=-0.0001 &&
                    ma360_240_buffer[1]-ma360_240_buffer[2]>=0 && ma650_240_buffer[1]-ma650_240_buffer[2]>=0 &&
                    k1_240_buffer[1]-d1_240_buffer[1]>=1) ||
                               
                                       //h4  �b53�U  �}�f�V�W  �������
                   (k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3���V�W,��h4,m30,m60  kd2,kd3�V�W�}�f�j �� k1,k,2,k3�b����
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
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd�t��<=350
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
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86) || 
                     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                      longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                      longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                      longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                      longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                      longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                      longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                      longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                      longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                      longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                      longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                      longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()))) 
                      return;
                      else
                      longsell03=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S3",4403,0,Lime );
 
//+++++++++++++++++++++++++++++++++++++++++++   SELL   4   ++++++++++++++++++++++++++++++++++++++++++++++++++          
             
          
              //m15 �� [-4][+3][+2][-1] && [-1]or[+2]���̰� bar���鬰0.0006  �����o�ͱ�����Y
        if  (((close_15_buffer[1]-open_15_buffer[1]<=-0.0006 && close_15_buffer[4]-open_15_buffer[4]<=-0.0006  && 
               close_15_buffer[2]-open_15_buffer[2]>=0.0006 && close_15_buffer[3]-open_15_buffer[3]>=0.0006 &&
               k1_15_buffer[1]-k1_15_buffer[2]<=0  &&  close_15_buffer[1]-open_15_buffer[2]<=-0.0001  &&
              (high_15_buffer[1]==M15highest40bar ||  high_15_buffer[2]==M15highest40bar) &&
              (ma05_15_buffer[1]-ma05_15_buffer[2]<=0 || 
              (close_15_buffer[1]-open_15_buffer[1]<=-0.0001 && high_15_buffer[1]-close_15_buffer[1]>=0.0029) ||
              (k2_15_buffer[1]-k2_15_buffer[2]<=-2 && k3_15_buffer[1]-k3_15_buffer[2]<=-2) ||
              (ma05_15_buffer[1]-ma05_15_buffer[2]<=0.0006 &&
              (k2_15_buffer[1]-k2_15_buffer[2]<=0 || k3_15_buffer[1]-k3_15_buffer[2]<=0)))) ||
               //m15 �� [-5][+4][+3][+2][-1]  && [-1]or[+2]���̰� bar���鬰0.0006  
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
           
                //m30 �� [-4][+3][+2][-1] && [-1]or[+2]���̰� bar���鬰0.0008  �����o�ͱ�����Y
              (close_30_buffer[1]-open_30_buffer[1]<=-0.0008 && close_30_buffer[4]-open_30_buffer[4]<=-0.0008  && 
               close_30_buffer[2]-open_30_buffer[2]>=0.0008 && close_30_buffer[3]-open_30_buffer[3]>=0.0008 &&
               k1_30_buffer[1]-k1_30_buffer[2]<=0  &&  close_30_buffer[1]-open_30_buffer[2]<=-0.0001  &&
              (high_30_buffer[1]==M30highest40bar ||  high_30_buffer[2]==M30highest40bar) &&
              (ma05_30_buffer[1]-ma05_30_buffer[2]<=0 || 
              (close_30_buffer[1]-open_30_buffer[1]<=-0.0001 && high_30_buffer[1]-close_30_buffer[1]>=0.0029) ||
              (k2_30_buffer[1]-k2_30_buffer[2]<=-2 && k3_30_buffer[1]-k3_30_buffer[2]<=-2) ||
              (ma05_30_buffer[1]-ma05_30_buffer[2]<=0.0006 &&
              (k2_30_buffer[1]-k2_30_buffer[2]<=0 || k3_30_buffer[1]-k3_30_buffer[2]<=0)))) ||
                 //m30 �� [-5][+4][+3][+2][-1]  && [-1]or[+2]���̰� bar���鬰0.0008  
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
                   
                  //m60 �� [-4][+3][+2][-1] && [-1]or[+2]���̰� bar���鬰0.0010  �����o�ͱ�����Y
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
                  //m60 �� [-5][+4][+3][+2][-1]  && [-1]or[+2]���̰� bar���鬰0.0010  
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
                                                          //m60 ��45,90,180  �ҬO�פU
              (macdmainline_60_buffer[1]>=-0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]<=-0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]<=-0.0003 && 
               ma180_60_buffer[1]-ma180_60_buffer[2]<=0)))    
                                      //(m15-61) h4 k1,k2,k3 <=35 don't sell
               if  ((k1_240_buffer[1]<=35 && k2_240_buffer[1]<=35 && k3_240_buffer[1]<=35) ||                   
                     //(m15-66) h4 [1]macd �Ȥ���0.00100 �P-0.00100��  �����                                
                   (macdmainline_240_buffer[1]<=0.00100 && macdmainline_240_buffer[1]>=-0.00100 &&
                    macdsignalline_240_buffer[1]<=0.00100 &&  macdsignalline_240_buffer[1]>=-0.00100) ||
                               
                                   
                                       //h4  �b53�U  �}�f�V�W  �������
                   (k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                            //H4 k1,k2,k3���V�W,��h4,m30,m60  kd2,kd3�V�W�}�f�j �� k1,k,2,k3�b����
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
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd�t��<=350
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
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86) || 
                     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                      longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                      longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                      longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                      longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                      longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                      longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                      longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                      longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                      longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                      longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                      longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()))) 
                      return;
                      else
                      longsell04=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S4",4404,0,Gray );
               
//+++++++++++++++++++++++++++++++++++++++++++   SELL   5   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                     
                                     //m15 �W�v�u�W�L25�I   [1]���t�ɶ}-��  [1]�����ɦ�-�}
    
      if  ((close_15_buffer[1]-open_15_buffer[1]<=-0.0001 && high_15_buffer[1]-open_15_buffer[1]>=0.0024) ||
          (close_15_buffer[1]-open_15_buffer[1]>=0.0001   && high_15_buffer[1]-close_15_buffer[1]>=0.0024) &&
           high_15_buffer[1]==M15highest40bar  && 
           k1_15_buffer[1]-k1_15_buffer[2]<=0 && k2_15_buffer[1]-k2_15_buffer[2]<=0 && k3_15_buffer[1]-k3_15_buffer[2]<=0   &&
           macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00090 && 
           macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00010) 
                                                 //�׶}�W�L100�I 
           if ((close_15_buffer[2]-open_15_buffer[2]>=0.0100 || close_15_buffer[1]-open_15_buffer[1]>=0.0100 ||
               macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=0.00120 || 
               macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=-0.00050) ||
                                                //�׶}�U�^�ᤧ�ϼu
              (open_15_buffer[3]-open_15_buffer[2]>=-0.0003 && open_15_buffer[4]-open_15_buffer[2]>=-0.0003) ||    
              (open_15_buffer[2]-open_15_buffer[1]>=-0.0003 && open_15_buffer[3]-open_15_buffer[1]>=-0.0003) ||     
               (macdmainline_15_buffer[1]>=-0.00099 && macdmainline_15_buffer[1]<=0.00099 &&
                macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                                       //h4  �b53�U  �}�f�V�W  �������
                   (k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3���V�W,��h4,m30,m60  kd2,kd3�V�W�}�f�j �� k1,k,2,k3�b����
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
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd�t��<=350
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
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86) || 
                     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                      longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                      longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                      longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                      longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                      longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                      longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                      longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                      longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                      longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                      longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                      longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()))) 
                      return;
                      else
                      longsell05=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S5",4405,0,Aqua );

//+++++++++++++++++++++++++++++++++++++++++++   SELL   6   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                                         //h1 [1] �W�v�u�W�L24�I   [1]���t�ɶ}-��  [1]�����ɦ�-�}
    
      if (((close_60_buffer[1]-open_60_buffer[1]<=-0.0001 && close_60_buffer[1]-open_60_buffer[1]<=0.0006  &&
            high_60_buffer[1]-open_60_buffer[1]>=0.0024) ||
           (close_60_buffer[1]-open_60_buffer[1]>=0.0001   && close_60_buffer[1]-open_60_buffer[1]<=0.0006  && 
            high_60_buffer[1]-close_60_buffer[1]>=0.0024) &&
            high_60_buffer[1]==H1highest40bar  && 
            k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 && k3_60_buffer[1]-k3_60_buffer[2]<=0) ||
                                          // [1]<=0 [2] �d�W�v�u
          ((close_60_buffer[1]-open_60_buffer[1]<=-0.0001 && close_60_buffer[1]-open_60_buffer[1]<=0.0006  &&
            high_60_buffer[1]-open_60_buffer[1]>=0.0024) ||
           (close_60_buffer[1]-open_60_buffer[1]>=0.0001   && close_60_buffer[1]-open_60_buffer[1]<=0.0006  && 
            high_60_buffer[1]-close_60_buffer[1]>=0.0024) &&
            high_60_buffer[1]==H1highest40bar  && 
            k1_60_buffer[1]-k1_60_buffer[2]<=5 && k1_60_buffer[1]-d1_60_buffer[1]<=5 && 
            close_60_buffer[1]-open_60_buffer[1]<=0)   &&
          
            macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=0.00200 && 
           macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=-0.00010) 
                                                 //�׶}�W�L100�I 
           if ((close_60_buffer[2]-open_60_buffer[2]>=0.0100 || close_60_buffer[1]-open_60_buffer[1]>=0.0100 ||
               macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=0.00200 || 
               macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=-0.00050) ||
                                                //�׶}�U�^�ᤧ�ϼu
              (open_60_buffer[3]-open_60_buffer[2]>=-0.0003 && open_60_buffer[4]-open_60_buffer[2]>=-0.0003) ||    
              (open_60_buffer[2]-open_60_buffer[1]>=-0.0003 && open_60_buffer[3]-open_60_buffer[1]>=-0.0003) ||     
               (macdmainline_60_buffer[1]>=-0.00099 && macdmainline_60_buffer[1]<=0.00099 &&
                macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                                       //h4  �b53�U  �}�f�V�W  �������
                   (k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3���V�W,��h4,m30,m60  kd2,kd3�V�W�}�f�j �� k1,k,2,k3�b����
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
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd�t��<=350
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
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86) || 
                     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                      longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                      longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                      longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                      longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                      longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                      longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                      longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                      longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                      longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                      longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                      longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()))) 
                      return;
                      else
                      longsell06=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S6",4406,0,Teal );
  
//+++++++++++++++++++++++++++++++++++++++++++   SELL   7   ++++++++++++++++++++++++++++++++++++++++++++++++++          
    
       
             //(m15-61)       //H4 [2] �d�W�v�u>80�I  [1]<[2]
       if  ((((close_240_buffer[2]-open_240_buffer[2]<=-0.0001 && high_240_buffer[2]-open_240_buffer[2]>=0.0080) ||
            (close_240_buffer[2]-open_240_buffer[2]>=0.0001   && high_240_buffer[2]-close_240_buffer[2]>=0.0080)) &&
             close_240_buffer[1]-open_240_buffer[1]<=-0.0001  && 
                                                          //H4 k1,k2,k3 >=70   || [2]>=0.0250
            ((k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70  &&  k3_240_buffer[1]>=70) || (close_240_buffer[2]-open_240_buffer[2]>=0.0250))) ||
           
               //(m15-66)  [2]�d�W�v�u>35  k1,k2,k3>=60   ma12-ma05<=-0.0005   close[4]||[5]||[6]||[7]||[8]||[9]>close[1]&& [2] �t��m�Y�ʽ�
          (((close_240_buffer[2]-open_240_buffer[2]<=-0.0001 && high_240_buffer[2]-open_240_buffer[2]>=0.0035) ||
            (close_240_buffer[2]-open_240_buffer[2]>=0.0001   && high_240_buffer[2]-close_240_buffer[2]>=0.0035)) &&
           ((close_240_buffer[4]-open_240_buffer[1]>=0 || close_240_buffer[5]-open_240_buffer[1]>=0 ||
             close_240_buffer[6]-open_240_buffer[1]>=0 || close_240_buffer[7]-open_240_buffer[1]>=0 ||
             close_240_buffer[8]-open_240_buffer[1]>=0 || close_240_buffer[9]-open_240_buffer[1]>=0) && 
            (close_240_buffer[4]-close_240_buffer[2]>=0 || close_240_buffer[5]-close_240_buffer[2]>=0 ||
             close_240_buffer[6]-close_240_buffer[2]>=0 || close_240_buffer[7]-close_240_buffer[2]>=0 ||
             close_240_buffer[8]-close_240_buffer[2]>=0 || close_240_buffer[9]-close_240_buffer[2]>=0)) && 
            ((close_240_buffer[1]-open_240_buffer[1]<=-0.0030  && ma12_240_buffer[1]-ma05_240_buffer[2]<=-0.0005 && 
              k1_240_buffer[1]>=60 && k2_240_buffer[1]>=60  &&  k3_240_buffer[1]>=60) || 
            
                //(m15-66)  k1,k2,k3>=75,k2,k3<=-1,d2,d3<=0,kd1,kd2<=-2 macd main && signal[1]-[2]<=-0.00003
             (k2_240_buffer[1]>=75  &&  k3_240_buffer[1]>=75 && k2_240_buffer[1]-k2_240_buffer[2]<=-1 &&
              k3_240_buffer[1]-k3_240_buffer[2]<=-1  &&  d2_240_buffer[1]-d2_240_buffer[2]<=0 &&
              d3_240_buffer[1]-d3_240_buffer[2]<=0 && k2_240_buffer[1]-d2_240_buffer[1]<=-2 &&
              k3_240_buffer[1]-d3_240_buffer[1]<=-2 &&
              macdmainline_240_buffer[1]-macdmainline_240_buffer[2]<=-0.00003 && 
              macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]<=-0.00003))) ||
            
              //(m15-66) H4 [2] �d�W�v�u>70�I [1]>�W�v�u100�I macd�t��[1]<[2]
           (((close_240_buffer[2]-open_240_buffer[2]<=-0.0001 && high_240_buffer[2]-open_240_buffer[2]>=0.0070) ||
            (close_240_buffer[2]-open_240_buffer[2]>=0.0001   && high_240_buffer[2]-close_240_buffer[2]>=0.0070)) &&
            ((close_240_buffer[1]-open_240_buffer[1]<=-0.0001 && high_240_buffer[1]-open_240_buffer[1]>=0.0100) ||
           (close_240_buffer[1]-open_240_buffer[1]>=0.0001   && high_240_buffer[1]-close_240_buffer[1]>=0.0100)) &&
             macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00370 && 
             macdmainline_240_buffer[1]<=-0.00450 && macdsignalline_240_buffer[1]<=-0.00050))  
                             // (m15-67) 
               if   ((k1_240_buffer[1]-d1_240_buffer[1]>=12 &&  (k2_240_buffer[1]-d2_240_buffer[1]>=5 || k3_240_buffer[1]-d3_240_buffer[1]>=5) &&
                      k2_240_buffer[1]<=25 && k3_240_buffer[1]<=25) ||
                     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                      longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                      longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                      longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                      longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                      longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                      longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                      longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                      longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                      longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                      longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                      longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()))) 
                      return;
                      else
                      longsell07=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S7",4407,0,Olive );
      
//+++++++++++++++++++++++++++++++++++++++++++   SELL   8   ++++++++++++++++++++++++++++++++++++++++++++++++++          
    
                     //(m15-62)   h4 �� ma180�פU ��ma180���� ma360 �פU   
        if  (((ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.0001 ||  (ma180_240_buffer[1]-ma180_240_buffer[2]<=0 &&
               ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.0001)) &&
                  // [1]���bma180�U��20�I��  
               close_240_buffer[1]-ma180_240_buffer[1]<=-0.0001  && close_240_buffer[1]-ma180_240_buffer[1]>=-0.0020 &&
                 //h4 [1]�W�v�u�W�L30�I
             ((close_240_buffer[1]-open_240_buffer[1]<=-0.0001 && high_240_buffer[1]-open_240_buffer[1]>=0.0030) ||
              (close_240_buffer[1]-open_240_buffer[1]>=0.0001   && high_240_buffer[1]-close_240_buffer[1]>=0.0030)) &&
             //kd1<=-3      
               k1_240_buffer[1]-d1_240_buffer[1]<=-3 &&
                  // macd�t��<=0.00150  >=-0.00100 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00150 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100 &&
                   // [2]||[3]||[4]���bma180�U��20�I��  
             ((close_240_buffer[2]-ma180_240_buffer[2]<=-0.0001  && close_240_buffer[2]-ma180_240_buffer[2]>=-0.0020) ||
              (close_240_buffer[3]-ma180_240_buffer[3]<=-0.0001  && close_240_buffer[3]-ma180_240_buffer[3]>=-0.0020) ||
              (close_240_buffer[4]-ma180_240_buffer[4]<=-0.0001  && close_240_buffer[4]-ma180_240_buffer[4]>=-0.0020))) ||
            
                  //(m15-66)   h4 �� ma180,ma360,ma650 ����    
              (ma180_240_buffer[1]-ma180_240_buffer[2]<=0.0001 && ma360_240_buffer[1]-ma360_240_buffer[2]<=0.0001 &&
               ma650_240_buffer[1]-ma650_240_buffer[2]<=0.0001 && 
                  // [1]���bma360�U��20�I��  
               close_240_buffer[1]-ma360_240_buffer[1]<=-0.0001  && close_240_buffer[1]-ma360_240_buffer[1]>=-0.0020 &&
                 //h4 [1]�W�v�u�W�L30�I
              ((close_240_buffer[1]-open_240_buffer[1]>=0.0001 && high_240_buffer[1]-close_240_buffer[1]>=0.0030) ||
              (close_240_buffer[1]-open_240_buffer[1]<=-0.0001  && high_240_buffer[1]-open_240_buffer[1]>=0.0030)) &&
                 //kd1<=-3      
               k1_240_buffer[1]-d1_240_buffer[1]<=-3 &&
                   // [2]||[3]||[4]���bma360�U��20�I��  
             ((close_240_buffer[2]-ma360_240_buffer[2]<=0.0005  && close_240_buffer[2]-ma360_240_buffer[2]>=-0.0020) ||
              (close_240_buffer[3]-ma360_240_buffer[3]<=0.0005  && close_240_buffer[3]-ma360_240_buffer[3]>=-0.0020) ||
              (close_240_buffer[4]-ma360_240_buffer[4]<=0.0005  && close_240_buffer[4]-ma360_240_buffer[4]>=-0.0020))))
                   // (m15-67) 
               if   ((k1_240_buffer[1]-d1_240_buffer[1]>=12 &&  (k2_240_buffer[1]-d2_240_buffer[1]>=5 || k3_240_buffer[1]-d3_240_buffer[1]>=5) &&
                      k2_240_buffer[1]<=25 && k3_240_buffer[1]<=25) ||
                     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                      longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                      longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                      longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                      longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                      longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                      longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                      longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                      longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                      longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                      longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                      longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket())))
                      return;
                      else
                      longsell08=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S8",4408,0,Olive );
    
 //+++++++++++++++++++++++++++++++++++++++++++   SELL   9   ++++++++++++++++++++++++++++++++++++++++++++++++++          
 
                    //H4 �� [-4][+3][+2][-1] && [-1]or[+2]���̰� bar���鬰0.0030 
        if   ((close_240_buffer[1]-open_240_buffer[1]<=-0.0030 && close_240_buffer[4]-open_240_buffer[4]<=-0.0010  && 
               close_240_buffer[2]-open_240_buffer[2]>=0.0010 && close_240_buffer[3]-open_240_buffer[3]>=0.0010 &&
                     //(m15-61)  [1]�U�v�u�p��15�I
               low_240_buffer[1]-close_240_buffer[1]<=-0.0015  &&              
                    //(m15-59) kd1,(kd2||kd3)<=3 �}�f�����Y�p
             ((k1_240_buffer[1]-d1_240_buffer[1]<=3  && (k2_240_buffer[1]-d2_240_buffer[1]<=3 || k3_240_buffer[1]-d3_240_buffer[1]<=3)) ||
                  //(m15-61)  macd  �t��<=0.00150  >=-0.00100
              (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00150 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100))  &&
               k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  &&
                   //(m15=58)  h4 ���L������ma05�b10�I��     k1,k2,k3�����b55�W�H�K�w�^�L�Y
               ma05_240_buffer[1]- close_240_buffer[1]>=-0.0015 &&  ma05_240_buffer[1]-ma05_240_buffer[2]<=0 &&
               k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70)  ||   // && 
      //        (high_240_buffer[1]==H4highest40bar ||  high_240_buffer[2]==H4highest40bar)) ||
              
               //H4 �� [-5][+4][+3][+2][-1]  && [-1]or[+2]���̰� bar���鬰0.0010  [1]<=0.0030 
              (close_240_buffer[1]-open_240_buffer[1]<=-0.0030 && close_240_buffer[5]-open_240_buffer[5]<=-0.0010  && 
               close_240_buffer[2]-open_240_buffer[2]>=0.0010 && close_240_buffer[3]-open_240_buffer[3]>=0.0010 &&
               close_240_buffer[4]-open_240_buffer[4]>=0.0010 &&
                        //(m15-61)  [1]�U�v�u�p��15�I
               low_240_buffer[1]-close_240_buffer[1]<=-0.0015  &&            
               k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  &&
                            //(m15-59) kd1,(kd2||kd3)<=3 �}�f�����Y�p
             ((k1_240_buffer[1]-d1_240_buffer[1]<=3  && (k2_240_buffer[1]-d2_240_buffer[1]<=3 || k3_240_buffer[1]-d3_240_buffer[1]<=3)) ||
                  //(m15-61)  macd  �t��<=0.00150  >=-0.00100
              (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00150 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100))  &&
               k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  &&
                   //(m15=58)  h4 ���L������ma05�b10�I��     k1,k2,k3�����b55�W�H�K�w�^�L�Y
               ma05_240_buffer[1]- close_240_buffer[1]>=-0.0015 && ma05_240_buffer[1]-ma05_240_buffer[2]<=0 &&
               k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) || // && 
                             //�bm15���U�����   �U�C�L�k�@��
       //     (high_240_buffer[1]==H4highest40bar ||  high_240_buffer[2]==H4highest40bar || high_240_buffer[3]==H4highest40bar)) ||
             
                   //m15-65)H4 �� [-5][+4][+3][2][-1]   [1]<=0.0015 [2]<=0 [3][4]>=0.0010 [5]<=0.0010 
              (close_240_buffer[1]-open_240_buffer[1]<=-0.0015 && close_240_buffer[5]-open_240_buffer[5]<=-0.0010  && 
                   //(m15-64) [2]���i�ɯ}150�I �ɤӦh���n�^�Y
               close_240_buffer[2]-open_240_buffer[2]>=0 && close_240_buffer[2]-open_240_buffer[2]<=0.0150 &&
               close_240_buffer[3]-open_240_buffer[3]>=0.0010 && close_240_buffer[4]-open_240_buffer[4]>=0.0010 && 
                 //h4 (m15-62)  [2][3][4]���L�p�C��[5]�����L�̦h5�I��
               close_240_buffer[2]-open_240_buffer[5]<=0.0005 &&
               close_240_buffer[3]-open_240_buffer[5]<=0.0005 && 
               close_240_buffer[4]-open_240_buffer[5]<=0.0005 &&
               open_240_buffer[1]-open_240_buffer[5]<=0.0005 && 
                    //(m15-62)   [1]�U�v�u���W�L5�I   k1>=50  k2,k3>=65    kd2,kd3<=-4  
               low_240_buffer[1]-close_240_buffer[1]>=-0.0005  &&  k1_240_buffer[1]>=50 && k2_240_buffer[1]>=65 && k3_240_buffer[1]>=65 && 
               k2_240_buffer[1]-d2_240_buffer[1]<=-4 && k3_240_buffer[1]-d3_240_buffer[1]<=-4) ||
             
            
                //   //(m15-61) H4 �� [-2][-1]   �U�v�u�b10�I��
              (close_240_buffer[1]-open_240_buffer[1]<=-0.0010 && close_240_buffer[2]-open_240_buffer[2]<=-0.0010  && 
                     //  [1][2]�U�v�u�p��10�I
               low_240_buffer[1]-close_240_buffer[1]<=-0.0010  &&  low_240_buffer[2]-close_240_buffer[2]<=-0.0010  &&             
                    //    k,k2,k3<=-1 
               k1_240_buffer[1]-k1_240_buffer[2]<=-1  && k2_240_buffer[1]-k2_240_buffer[2]<=-1 && k3_240_buffer[1]-k3_240_buffer[2]<=-1 &&
                    //   macd  �t��<=0.00100  >=-0.00100
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100  &&
               macdmainline_240_buffer[1]>=0.00350 && 
                      //k1,k2,k3>=85
               k1_240_buffer[1]>=85 && k2_240_buffer[1]>=85 && k3_240_buffer[1]>=85) ||
                    
                             //h4  [4][3][2]>=0.0050 [1]<=-0.0010  ma45[1]-[2]<=-0.0001
              (close_240_buffer[4]-open_240_buffer[4]>=0.0050 && close_240_buffer[3]-open_240_buffer[3]>=0.0050  && 
               close_240_buffer[2]-open_240_buffer[2]>=0.0050 && close_240_buffer[1]-open_240_buffer[1]<=-0.0010 &&
               ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0001) ||
                       //(m15-61) h4  [4]+[3]+[2]>=0.0150 [1]<=-0.0030  [1]-[2]<=0.0010  macd  �t��<=0.00100  >=-0.00100
             (((close_240_buffer[4]-open_240_buffer[4])+(close_240_buffer[3]-open_240_buffer[3])+ 
               (close_240_buffer[2]-open_240_buffer[2])>=0.0150) && close_240_buffer[1]-open_240_buffer[1]<=-0.0030 &&
                close_240_buffer[1]-close_240_buffer[2]<=0.0010 &&
                macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100)) 
               if    ((k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90) ||
                     (k1_240_buffer[1]>=87 && k2_240_buffer[1]>=87  &&  k3_240_buffer[1]>=87) || 
                        //(m15-64) [1]||[2]���i�ɹL150�I �ɤӦh���n�^�Y
                     (close_240_buffer[1]-open_240_buffer[1]>=0.0150 || close_240_buffer[2]-open_240_buffer[2]>=0.0150) ||
                       //(m15-64) [1]||[2]���i�ɹL110�I   kd1[1]||kd1[2]>=20 
                     (close_240_buffer[1]-open_240_buffer[1]>=0.0110 && k1_240_buffer[1]-d1_240_buffer[1]>=20) ||
                     (close_240_buffer[2]-open_240_buffer[2]>=0.0110 && k1_240_buffer[2]-d1_240_buffer[2]>=20) ||
                             // (m15-64)  kd1,kd2,kd3>=15
                     (k1_240_buffer[1]-d1_240_buffer[1]>=15 && k2_240_buffer[1]-d2_240_buffer[1]>=15 && k3_240_buffer[1]-d3_240_buffer[1]>=15) || 
                      //(m15-66)  ma360[1]-[6]>=0.0001   ma05,ma08,ma12>=-0.0015   kd1[1]>=10  macd signal[1]-[2]>=0.00002 
                      (ma360_240_buffer[1]-ma360_240_buffer[6]>=0.0001 && ma05_240_buffer[1]-ma05_240_buffer[2]>=-0.0015 &&
                       ma08_240_buffer[1]-ma08_240_buffer[2]>=-0.0015 && ma12_240_buffer[1]-ma12_240_buffer[2]>=-0.0015 &&
                       k1_240_buffer[1]-d1_240_buffer[1]>=10 && macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]>=0.00002) ||
                        (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                         longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                         longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                         longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                         longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                         longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                         longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                         longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                         longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                         longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                         longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                         longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()))) 
                         return;
                         else
                         longsell09=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S9",4409,0,Olive );
 
  //+++++++++++++++++++++++++++++++++++++++++++   SELL   10   ++++++++++++++++++++++++++++++++++++++++++++++++++          

    
                                         //h1 [1] ��¶W�L30,50,70,100�I   
                                //100 �I [1]-[2]<=0.0001  [1]-[3]<=0.0001
      if   ((((close_60_buffer[1]-open_60_buffer[1]<=-0.0100 && close_60_buffer[1]-close_60_buffer[2]<=0.0001  &&
            close_60_buffer[1]-close_60_buffer[3]<=0.0001 && 
                               //kd1,kd2,kd3<=0  k1,k2,k3>70 
            k1_60_buffer[1]-d1_60_buffer[1]<=0 && k2_60_buffer[1]-d2_60_buffer[1]<=0 && k3_60_buffer[1]-d3_60_buffer[1]<=0 &&
            k1_60_buffer[1]>=70 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70) ||
                               //75 �I [1]-[2]<=0~~~~[1]-[4]<=0 
           (close_60_buffer[1]-open_60_buffer[1]<=-0.0075 && close_60_buffer[1]-close_60_buffer[2]<=0  &&
            close_60_buffer[1]-close_60_buffer[3]<=0 && close_60_buffer[1]-close_60_buffer[4]<=0  &&
                              //kd1,kd2,kd3<=0 k1,k2,k3>70 
            k1_60_buffer[1]-d1_60_buffer[1]<=0 && k2_60_buffer[1]-d2_60_buffer[1]<=0 && k3_60_buffer[1]-d3_60_buffer[1]<=0 &&
            k1_60_buffer[1]>=70 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70) ||
                              //55 �I [1]-[2][3]<=0,[1]-[6]<=0 
           (close_60_buffer[1]-open_60_buffer[1]<=-0.0055 && close_60_buffer[1]-close_60_buffer[2]<=0  &&
            close_60_buffer[1]-close_60_buffer[3]<=0 && close_60_buffer[1]-close_60_buffer[6]<=0  &&
                              //kd1,kd2,kd3<=0 k1,k2,k3>70 
            k1_60_buffer[1]-d1_60_buffer[1]<=0 && k2_60_buffer[1]-d2_60_buffer[1]<=0 && k3_60_buffer[1]-d3_60_buffer[1]<=0 &&
            k1_60_buffer[1]>=70 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70) ||
                          //30 �I [1]-[2]<=0~~~~~[1]-[8]<=0 
           (close_60_buffer[1]-open_60_buffer[1]<=-0.0030 && close_60_buffer[1]-close_60_buffer[2]<=0  &&
            close_60_buffer[1]-close_60_buffer[3]<=0 && close_60_buffer[1]-close_60_buffer[4]<=0  &&
            close_60_buffer[1]-close_60_buffer[5]<=0 && close_60_buffer[1]-close_60_buffer[6]<=0  &&
            close_60_buffer[1]-close_60_buffer[7]<=0 && close_60_buffer[1]-close_60_buffer[8]<=0  &&
                                  //kd1,kd2,kd3<=-2 k2.k3>=85 
            k1_60_buffer[1]-d1_60_buffer[1]<=-2 && k2_60_buffer[1]-d2_60_buffer[1]<=-2 && k3_60_buffer[1]-d3_60_buffer[1]<=-2 &&
            k1_60_buffer[1]>=70 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70))))
                                   //h4  �b53�U  �}�f�V�W  �������
             if   ((k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3���V�W,��h4,m30,m60  kd2,kd3�V�W�}�f�j �� k1,k,2,k3�b����
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
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd�t��<=350
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
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86) || 
                     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                      longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                      longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                      longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                      longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                      longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                      longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                      longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                      longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                      longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                      longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                      longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()))) 
                      return;
                      else
                      longsell10=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S10",4410,0,Teal );
 
  //+++++++++++++++++++++++++++++++++++++++++++   SELL   11   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                      //m30 �� [-4][+3][+2][-1]   [1]<=-0.0030 
         if   ((close_30_buffer[1]-open_30_buffer[1]<=-0.0030 && close_30_buffer[4]-open_30_buffer[4]<=-0.0008  && 
               close_30_buffer[2]-open_30_buffer[2]>=0.0008 && close_30_buffer[3]-open_30_buffer[3]>=0.0008 &&
               k2_30_buffer[1]-d2_30_buffer[1]<=-12 && k3_30_buffer[1]-d3_30_buffer[1]<=-12 &&
               k2_30_buffer[1]>=55 && k3_30_buffer[1]>=55) || 
                       //m30 �� [-5][+4][+3][+2][-1]  [1]<=-0.0015  
              (close_30_buffer[1]-open_30_buffer[1]<=-0.0015 && close_30_buffer[5]-open_30_buffer[5]<=-0.0010  && 
               close_30_buffer[2]-open_30_buffer[2]>=0.0010 && close_30_buffer[3]-open_30_buffer[3]>=0.0010 &&
               close_30_buffer[4]-open_30_buffer[4]>=0.0010 &&
               k2_30_buffer[1]-d2_30_buffer[1]<=-10 && k3_30_buffer[1]-d3_30_buffer[1]<=-10 &&
               k2_30_buffer[1]>=70 && k3_30_buffer[1]>=70) || 
  
                  //m60 �� [-4][+3][+2][-1]   [1]<=-0.0030 
              (close_60_buffer[1]-open_60_buffer[1]<=-0.0030 && close_60_buffer[4]-open_60_buffer[4]<=-0.0010  && 
               close_60_buffer[2]-open_60_buffer[2]>=0.0010 && close_60_buffer[3]-open_60_buffer[3]>=0.0010 &&
               k2_60_buffer[1]-d2_60_buffer[1]<=-10 && k3_60_buffer[1]-d3_60_buffer[1]<=-10 &&
               k2_60_buffer[1]>=45 && k3_60_buffer[1]>=45) || 
                        //m60 �� [-4][+3][+2][-1]   [1]<=-0.0020 
              (close_60_buffer[1]-open_60_buffer[1]<=-0.0020 && close_60_buffer[4]-open_60_buffer[4]<=-0.0007  && 
               close_60_buffer[2]-open_60_buffer[2]>=0.0007 && close_60_buffer[3]-open_60_buffer[3]>=0.0007 &&
               k1_60_buffer[1]-d1_60_buffer[1]<=0 && k2_60_buffer[1]-d2_60_buffer[1]<=-5 && k3_60_buffer[1]-d3_60_buffer[1]<=-5 &&
               k2_60_buffer[1]>=80 && k3_60_buffer[1]>=80) || 
                      //m60 �� [_5][+4][+3][+2][-1]  [1]<=-0.0015  
              (close_60_buffer[1]-open_60_buffer[1]<=-0.0015 && close_60_buffer[5]-open_60_buffer[5]<=-0.0007  && 
               close_60_buffer[2]-open_60_buffer[2]>=0.0007 && close_60_buffer[3]-open_60_buffer[3]>=0.0007 &&
               close_60_buffer[4]-open_60_buffer[4]>=0.0007 &&
               k2_60_buffer[1]-d2_60_buffer[1]<=-4 && k3_60_buffer[1]-d3_60_buffer[1]<=-4 &&
               k2_60_buffer[1]>=65 && k3_60_buffer[1]>=65) || 

                        //m60 �� [+5][-4][+3][-2][+1]  [1]<=-0.0015  
              (close_60_buffer[1]-open_60_buffer[1]<=-0.0015 && close_60_buffer[5]-open_60_buffer[5]<=-0.0007  && 
               close_60_buffer[2]-open_60_buffer[2]>=0.0007 && close_60_buffer[3]-open_60_buffer[3]<=-0.0007 &&
               close_60_buffer[4]-open_60_buffer[4]>=0.0007 &&
               k1_60_buffer[1]-k1_60_buffer[2]<=0 &&  k2_60_buffer[1]-k2_60_buffer[2]<=0 && k3_60_buffer[1]-k3_60_buffer[2]<=0 &&
               k2_60_buffer[1]>=80 && k3_60_buffer[1]>=80)) 
                                    //h4  �b53�U  �}�f�V�W  �������
               if ((k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3���V�W,��h4,m30,m60  kd2,kd3�V�W�}�f�j �� k1,k,2,k3�b����
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
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd�t��<=350
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
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86) || 
                      (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                      longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                      longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                      longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                      longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                      longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                      longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                      longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                      longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                      longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                      longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                      longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()))) 
                      return;
                      else
                      longsell11=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S11",4411,0,Teal );
 
  //+++++++++++++++++++++++++++++++++++++++++++   SELL   12   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                        //m30 [2]�W�v�u�W�L25�I   [2]���t�ɶ}-��  [2]�����ɦ�-�}  
     if  (((close_30_buffer[2]-open_30_buffer[2]<=-0.0001 && high_30_buffer[2]-open_30_buffer[2]>=0.0025) ||
          (close_30_buffer[2]-open_30_buffer[2]>=0.0001  && high_30_buffer[2]-close_30_buffer[2]>=0.0025) &&
          (high_30_buffer[1]==M15highest50bar || high_30_buffer[2]==M15highest50bar) && 
                               //     [1]���t  [1]-[2]<=-0.0001   k1,k2,k3<=0  k1,k2,k3>=80
          (close_30_buffer[1]-open_30_buffer[1]<=-0.0010 && close_30_buffer[1]-close_30_buffer[2]<=-0.0001 &&
           k1_30_buffer[1]-k1_30_buffer[2]<=0 && k2_30_buffer[1]-k2_30_buffer[2]<=0 && k3_30_buffer[1]-k3_30_buffer[2]<=0   &&
           k1_30_buffer[1]>=70 && k2_30_buffer[1]>=70 && k3_30_buffer[1]>=70) ||
             //    [1]���t  [1]-[2]<=-0.0001   k1,(k2||k3)<=0  k1,k2,k3>=70 kd1<=-1
             (close_30_buffer[1]-open_30_buffer[1]<=-0.0001 && close_30_buffer[1]-close_30_buffer[2]<=-0.0001 &&
              k1_30_buffer[1]-k1_30_buffer[2]<=0 && (k2_30_buffer[1]-k2_30_buffer[2]<=0 || k3_30_buffer[1]-k3_30_buffer[2]<=0) &&
              k1_30_buffer[1]-d1_30_buffer[2]<=-1 && 
              k1_30_buffer[1]>=80 && k2_30_buffer[1]>=80 && k3_30_buffer[1]>=80)) ||
                            //m30 [1][2]�W�v�u�W�L25�I   [2]���t�ɶ}-��  [2]�����ɦ�-�}  [1]<=0.0010
         ((close_30_buffer[1]-open_30_buffer[1]<=-0.0001 && high_30_buffer[1]-open_30_buffer[1]>=0.0025) ||
          (close_30_buffer[1]-open_30_buffer[1]>=0.0001   && close_30_buffer[1]-open_30_buffer[1]<=0.0010   && 
          high_30_buffer[1]-close_30_buffer[1]>=0.0025) &&
          (close_30_buffer[2]-open_30_buffer[2]<=-0.0001 && high_30_buffer[2]-open_30_buffer[2]>=0.0025) ||
          (close_30_buffer[2]-open_30_buffer[2]>=0.0001  && high_30_buffer[2]-close_30_buffer[2]>=0.0025) &&
           k1_30_buffer[1]>=70 && k2_30_buffer[1]>=70 && k3_30_buffer[1]>=70 &&
          (high_30_buffer[1]==M15highest50bar || high_30_buffer[2]==M15highest50bar) && 
                               //     [1]���t  [1]-[2]<=-0.0001   k1,k2,k3<=0  k1,k2,k3>=80
           close_30_buffer[1]-open_30_buffer[1]<=-0.0010 && close_30_buffer[1]-close_30_buffer[2]<=-0.0001 &&
           k1_30_buffer[1]-k1_30_buffer[2]<=0 && k2_30_buffer[1]-k2_30_buffer[2]<=0 && k3_30_buffer[1]-k3_30_buffer[2]<=0   &&
           k1_30_buffer[1]>=70 && k2_30_buffer[1]>=70 && k3_30_buffer[1]>=70) ||
                                 // [1]�d�W�v�u�W�L40�I   [2]���t�ɶ}-��  k1,k2,k3<=-1  ,k1,k2,k3>=80
         ((close_30_buffer[1]-open_30_buffer[1]>=0.0001  && high_30_buffer[1]-open_30_buffer[1]<=-0.0040) &&
          high_30_buffer[1]==M15highest50bar &&
          k1_30_buffer[1]-k1_30_buffer[2]<=-1 && k2_30_buffer[1]-k2_30_buffer[2]<=-1 && k3_30_buffer[1]-k3_30_buffer[2]<=-1 &&
          k1_30_buffer[1]>=80 && k2_30_buffer[1]>=80 && k3_30_buffer[1]>=80))             
                   
                 
                 
                            //return  else  �H�U buy 12   buy13  �ۦP �M buy1  ~  buy 11  ���P
                            //return  else  �H�U buy 12   buy13  �ۦP �M buy1  ~  buy 11  ���P
             
              if  ((k2_60_buffer[1]-d2_60_buffer[1]>=25  &&  k3_60_buffer[1]-d3_60_buffer[1]>=25) ||
                   (k1_60_buffer[1]-d1_60_buffer[1]>=10  && k2_60_buffer[1]-d2_60_buffer[1]>=10  &&  k3_60_buffer[1]-d3_60_buffer[1]>=10) ||                                   //h4  k2,k3 �b47�W  �}�f�V�U  �����R�� 
                   (k2_60_buffer[1]-d2_60_buffer[1]>=19  &&  k3_60_buffer[1]-d3_60_buffer[1]>=19 && 
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0010  &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0008) ||
                        //h1 [1]>=0.0120  h4   ma05,ma08,ma12>=0.0025
                    (close_60_buffer[1]-open_60_buffer[1]>=0.0120 && ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0025  &&  
                     ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0025  &&  ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0025) ||
                                //h4  �b53�U  �}�f�V�W  �������
                   (k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]<=45 && k3_240_buffer[1]>=45 &&  k1_240_buffer[1]-k1_240_buffer[1]>=10  &&
                   (k2_240_buffer[1]-k2_240_buffer[1]>=10 || k3_240_buffer[1]-k3_240_buffer[1]>=10)) ||
                          //(m15-57)h4  [1]�ɹL140�I
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0140) ||
                       //(m15-59) h4  ma45,ma90,ma180�䤤���G[1]-[2]>=0    [1]>=0.0100
                  ((ma45_240_buffer[1]-ma45_240_buffer[2]>=0 || ma90_240_buffer[1]-ma90_240_buffer[2]>=0) &&
                   (ma90_240_buffer[1]-ma90_240_buffer[2]>=0 || ma180_240_buffer[1]-ma180_240_buffer[2]>=0) &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0100) ||  
                          //(m15-59) h4 k1||k2||k3 <=35 don't sell
                   (k1_240_buffer[1]<=35 || k2_240_buffer[1]<=35 || k3_240_buffer[1]<=35) ||                   

                    //(m15-577)h4  ma45[1][2]>=0.0007  ma90[1][2]>=0.0004  ma45||ma90([1]-[2])-[2]-[3])>=0.0001 ma45,ma90���Z>=-0.0400 <=0.0035
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0007  &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0004 &&
                  ((ma45_240_buffer[1]-ma45_240_buffer[2])-(ma45_240_buffer[2]-ma45_240_buffer[3])>=0.0001  ||
                   (ma90_240_buffer[1]-ma90_240_buffer[2])-(ma90_240_buffer[2]-ma90_240_buffer[3])>=0.0001) &&
                           //(m15-58)   ma45�bma90 �W�����Z>=-0.0350 <=0.0010
                    ma45_240_buffer[1]-ma90_240_buffer[1]>=-0.0350 && ma45_240_buffer[1]-ma90_240_buffer[1]<=0.0010) ||
                          //(m15-58)h4  kd1+kd2+kd3>=49 kd1,kd2,kd3>=7
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=49 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=7 && k2_240_buffer[1]-d2_240_buffer[1]>=7 && k3_240_buffer[1]-d3_240_buffer[1]>=7) ||
                          //(m15-58)h4  kd1+kd2+kd3>=45 kd1,kd2,kd3>=12
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=45 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=12 && k2_240_buffer[1]-d2_240_buffer[1]>=12 && k3_240_buffer[1]-d3_240_buffer[1]>=12) ||
                
                              //(m15-57)h4  [1]�ɹL100�I  ma45>=0.0015  || [0]>=0.0150
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
                     //(m15-66)   kd2,kd3>=15 k1>=5 ||kd1>=5   macd>=0.00300
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                  ((k1_240_buffer[0]-k1_240_buffer[1]>=5) || (k1_240_buffer[1]-d1_240_buffer[1]>=5)) &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300) ||    
                      //(m15-66)kd2,kd3[1]>=7 k1[0]-[1]>=7|| kd1[1]>=7    macd[1]>=0.00350  macd[2]>=0.00250  (macd[1]-[2]>=0.00070) ||macdmain[1]-[2]>=0.00150  macdsignal[1]-[2]>=0.00070
                   (k2_240_buffer[1]-d2_240_buffer[1]>=7  &&  k3_240_buffer[1]-d3_240_buffer[1]>=7 &&
                  ((k1_240_buffer[0]-k1_240_buffer[1]>=7) || (k1_240_buffer[1]-d1_240_buffer[1]>=7)) &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00350 &&
                    macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]>=0.00250 && 
                 (((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1])-(macdmainline_240_buffer[2]-macdsignalline_240_buffer[2])>=0.00070) ||    
                   (macdmainline_240_buffer[1]-macdmainline_240_buffer[2]>=0.00150 && macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2])>=0.00070)) ||
                                //ma45  ma90 >=0.0014
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0014  &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0014) ||
                             //(m15-57)ma45  ma90 >=0.0010   ma45+ma90>=0.0029
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0010  &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0010 &&
                   (ma45_240_buffer[1]-ma45_240_buffer[2])+ (ma90_240_buffer[1]-ma90_240_buffer[2])>=0.0029) ||

                                     //H4 k1,k2,k3���V�W,��h4,m30,m60  kd2,kd3�V�W�}�f�j �� k1,k,2,k3�b����
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=2 && 
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=25  &&  k3_240_buffer[1]-d3_240_buffer[1]>=25  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                    k2_240_buffer[0]<=60 && k3_240_buffer[1]<=60  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]>=10  && k2_240_buffer[1]-d2_240_buffer[1]>=10  &&
                    k3_240_buffer[1]-d3_240_buffer[1]>=10  && k2_240_buffer[0]<=30 && k3_240_buffer[1]<=30  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                       (k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30  && 
                    k1_240_buffer[1]-k1_240_buffer[2]>=0 &&  k2_240_buffer[1]-k2_240_buffer[2]>=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]>=0 &&  close_240_buffer[1]-open_240_buffer[1]>=0.0001  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                                  //34�� �����34���������ʧ@
                   (OrderType()==OP_SELL && TimeCurrent()-OrderCloseTime()<=2000) ||
                     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                      longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                      longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                      longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                      longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                      longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                      longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                      longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                      longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                      longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                      longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                      longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()))) 
                      return;
                      else
                      longsell12=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S12",4412,0,ForestGreen );

    //+++++++++++++++++++++++++++++++++++++++++++   SELL   13   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                        //h1 [2]�W�v�u�W�L27�I   [2]���t�ɶ}-��  [2]�����ɦ�-�}  
     if  (((close_60_buffer[2]-open_60_buffer[2]<=-0.0001 && high_60_buffer[2]-open_60_buffer[2]>=0.0025) ||
          (close_60_buffer[2]-open_60_buffer[2]>=0.0001   && high_60_buffer[2]-close_60_buffer[2]>=0.0025) &&
          (high_60_buffer[1]==M15highest70bar || high_60_buffer[2]==M15highest70bar) && 
                               //     [1]���t  [1]-[2]<=-0.0001   k1,k2,k3<=0  k1,k2,k3>=80
          (close_60_buffer[1]-open_60_buffer[1]<=-0.0010 && close_60_buffer[1]-close_60_buffer[2]<=-0.0001 &&
           k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 && k3_60_buffer[1]-k3_60_buffer[2]<=0   &&
           k1_60_buffer[1]>=70 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70) ||
          //    [1]���t  [1]-[2]<=-0.0001   k1,(k2||k3)<=0  k1,k2,k3>=70 kd1<=-1
             (close_60_buffer[1]-open_60_buffer[1]<=-0.0001 && close_60_buffer[1]-close_60_buffer[2]<=-0.0001 &&
              k1_60_buffer[1]-k1_60_buffer[2]<=0 && (k2_60_buffer[1]-k2_60_buffer[2]<=0 || k3_60_buffer[1]-k3_60_buffer[2]<=0) &&
              k1_60_buffer[1]-d1_60_buffer[2]<=-1 && 
              k1_60_buffer[1]>=80 && k2_60_buffer[1]>=80 && k3_60_buffer[1]>=80)) ||
                             //h1 [1],[2]�W�v�u�W�L24�I   [2]���t�ɶ}-��  [2]�����ɦ�-�}  
         ((close_60_buffer[1]-open_60_buffer[1]<=-0.0001 && high_60_buffer[1]-open_60_buffer[1]>=0.0024) ||
          (close_60_buffer[1]-open_60_buffer[1]>=0.0001   && close_30_buffer[1]-open_30_buffer[1]<=0.0010   && 
           high_60_buffer[1]-close_60_buffer[1]>=0.0024) &&
          (close_60_buffer[2]-open_60_buffer[2]<=-0.0001 && high_60_buffer[2]-open_60_buffer[2]>=0.0024) ||
          (close_60_buffer[2]-open_60_buffer[2]>=0.0001   && high_60_buffer[2]-close_60_buffer[2]>=0.0024) &&
           k1_60_buffer[1]>=80 && k2_60_buffer[1]>=80 && k3_60_buffer[1]>=80 &&
          (high_60_buffer[1]==M15highest70bar || high_60_buffer[2]==M15highest70bar)) ||
                                 // [1]�d�W�v�u�W�L40�I   [2]���t�ɶ}-��  k1,k2,k3<=-1  ,k1,k2,k3>=80
         ((close_60_buffer[1]-open_60_buffer[1]>=0.0001  && high_60_buffer[1]-open_60_buffer[1]<=-0.0040) &&
          high_60_buffer[1]==M15highest70bar &&
          k1_60_buffer[1]-k1_60_buffer[2]<=-1 && k2_60_buffer[1]-k2_60_buffer[2]<=-1 && k3_60_buffer[1]-k3_60_buffer[2]<=-1 &&
          k1_60_buffer[1]>=80 && k2_60_buffer[1]>=80 && k3_60_buffer[1]>=80))             
                    
                            //return  else  �H�U buy 12   buy13  �ۦP �M buy1  ~  buy 11  ���P
                            //return  else  �H�U buy 12   buy13  �ۦP �M buy1  ~  buy 11  ���P
             
              if  ((k2_60_buffer[1]-d2_60_buffer[1]>=25  &&  k3_60_buffer[1]-d3_60_buffer[1]>=25) ||
                   (k1_60_buffer[1]-d1_60_buffer[1]>=10  && k2_60_buffer[1]-d2_60_buffer[1]>=10  &&  k3_60_buffer[1]-d3_60_buffer[1]>=10) ||                                   //h4  k2,k3 �b47�W  �}�f�V�U  �����R�� 
                   (k2_60_buffer[1]-d2_60_buffer[1]>=19  &&  k3_60_buffer[1]-d3_60_buffer[1]>=19 && 
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0010  &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0008) ||
                        //h1 [1]>=0.0120  h4   ma05,ma08,ma12>=0.0025
                    (close_60_buffer[1]-open_60_buffer[1]>=0.0120 && ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0025  &&  
                     ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0025  &&  ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0025) ||
                                //h4  �b53�U  �}�f�V�W  �������
                   (k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]<=45 && k3_240_buffer[1]>=45 &&  k1_240_buffer[1]-k1_240_buffer[1]>=10  &&
                   (k2_240_buffer[1]-k2_240_buffer[1]>=10 || k3_240_buffer[1]-k3_240_buffer[1]>=10)) ||
                          //(m15-57)h4  [1]�ɹL140�I
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0140) ||
                       //(m15-59) h4  ma45,ma90,ma180�䤤���G[1]-[2]>=0    [1]>=0.0100
                  ((ma45_240_buffer[1]-ma45_240_buffer[2]>=0 || ma90_240_buffer[1]-ma90_240_buffer[2]>=0) &&
                   (ma90_240_buffer[1]-ma90_240_buffer[2]>=0 || ma180_240_buffer[1]-ma180_240_buffer[2]>=0) &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0100) ||  
                          //(m15-59) h4 k1||k2||k3 <=35 don't sell
                   (k1_240_buffer[1]<=35 || k2_240_buffer[1]<=35 || k3_240_buffer[1]<=35) ||                   

                    //(m15-577)h4  ma45[1][2]>=0.0007  ma90[1][2]>=0.0004  ma45||ma90([1]-[2])-[2]-[3])>=0.0001 ma45,ma90���Z>=-0.0400 <=0.0035
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0007  &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0004 &&
                  ((ma45_240_buffer[1]-ma45_240_buffer[2])-(ma45_240_buffer[2]-ma45_240_buffer[3])>=0.0001  ||
                   (ma90_240_buffer[1]-ma90_240_buffer[2])-(ma90_240_buffer[2]-ma90_240_buffer[3])>=0.0001) &&
                           //(m15-58)   ma45�bma90 �W�����Z>=-0.0350 <=0.0010
                    ma45_240_buffer[1]-ma90_240_buffer[1]>=-0.0350 && ma45_240_buffer[1]-ma90_240_buffer[1]<=0.0010) ||
                          //(m15-58)h4  kd1+kd2+kd3>=49 kd1,kd2,kd3>=7
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=49 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=7 && k2_240_buffer[1]-d2_240_buffer[1]>=7 && k3_240_buffer[1]-d3_240_buffer[1]>=7) ||
                          //(m15-58)h4  kd1+kd2+kd3>=45 kd1,kd2,kd3>=12
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=45 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=12 && k2_240_buffer[1]-d2_240_buffer[1]>=12 && k3_240_buffer[1]-d3_240_buffer[1]>=12) ||
                
                              //(m15-57)h4  [1]�ɹL100�I  ma45>=0.0015  || [0]>=0.0150
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
                     //(m15-66)   kd2,kd3>=15 k1>=5 ||kd1>=5   macd>=0.00300
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                  ((k1_240_buffer[0]-k1_240_buffer[1]>=5) || (k1_240_buffer[1]-d1_240_buffer[1]>=5)) &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300) ||    
                      //(m15-66)kd2,kd3[1]>=7 k1[0]-[1]>=7|| kd1[1]>=7    macd[1]>=0.00350  macd[2]>=0.00250  (macd[1]-[2]>=0.00070) ||macdmain[1]-[2]>=0.00150  macdsignal[1]-[2]>=0.00070
                   (k2_240_buffer[1]-d2_240_buffer[1]>=7  &&  k3_240_buffer[1]-d3_240_buffer[1]>=7 &&
                  ((k1_240_buffer[0]-k1_240_buffer[1]>=7) || (k1_240_buffer[1]-d1_240_buffer[1]>=7)) &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00350 &&
                    macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]>=0.00250 && 
                 (((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1])-(macdmainline_240_buffer[2]-macdsignalline_240_buffer[2])>=0.00070) ||    
                   (macdmainline_240_buffer[1]-macdmainline_240_buffer[2]>=0.00150 && macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2])>=0.00070)) ||
                                //ma45  ma90 >=0.0014
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0014  &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0014) ||
                             //(m15-57)ma45  ma90 >=0.0010   ma45+ma90>=0.0029
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0010  &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0010 &&
                   (ma45_240_buffer[1]-ma45_240_buffer[2])+ (ma90_240_buffer[1]-ma90_240_buffer[2])>=0.0029) ||

                                     //H4 k1,k2,k3���V�W,��h4,m30,m60  kd2,kd3�V�W�}�f�j �� k1,k,2,k3�b����
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=2 && 
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=25  &&  k3_240_buffer[1]-d3_240_buffer[1]>=25  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                    k2_240_buffer[0]<=60 && k3_240_buffer[1]<=60  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]>=10  && k2_240_buffer[1]-d2_240_buffer[1]>=10  &&
                    k3_240_buffer[1]-d3_240_buffer[1]>=10  && k2_240_buffer[0]<=30 && k3_240_buffer[1]<=30  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                       (k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30  && 
                    k1_240_buffer[1]-k1_240_buffer[2]>=0 &&  k2_240_buffer[1]-k2_240_buffer[2]>=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]>=0 &&  close_240_buffer[1]-open_240_buffer[1]>=0.0001  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                                  //34�� �����34���������ʧ@
                   (OrderType()==OP_SELL && TimeCurrent()-OrderCloseTime()<=2000) ||
                     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                      longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                      longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                      longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                      longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                      longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                      longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                      longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                      longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                      longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                      longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                      longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket())))
                      return;
                      else
                      longsell13=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S13",4413,0,MidnightBlue );

   //+++++++++++++++++++++++++++++++++++++++++++   SELL   14   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                 //(m15-62) h1    macd>=0.00870   �t�Ȧb-50,+50��         �o�ͪ����v���h�ҥH���ϥΪ��p�ư��k
        if    (macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=0.00040 && macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=-0.00040 &&
               macdmainline_60_buffer[1]>=0.00870 &&
                    //k1,k2,k3  [1]-[2]<=0   k1,k2,k3>=70 || ma180 ,ma360�פU
               k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 && 
               k3_60_buffer[1]-k3_60_buffer[2]<=0 && 
             ((k1_60_buffer[1]>=70 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70) || (ma180_60_buffer[1]-ma180_60_buffer[2]<=-0.0001 &&
               ma360_60_buffer[1]-ma360_60_buffer[2]<=-0.0001)))
                          //ma45  ,ma90,ma180,ma360  �פW
               if   ((ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0011 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0008 &&
                     ma180_240_buffer[1]-ma180_240_buffer[2]>=0.0004 && ma360_240_buffer[1]-ma360_240_buffer[2]>=0.0001) ||
                     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                      longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                      longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                      longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                      longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                      longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                      longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                      longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                      longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                      longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                      longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                      longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()))) 
                      return;
                      else
                      longsell14=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S14",4414,0,DimGray );
 
     //+++++++++++++++++++++++++++++++++++++++++++   SELL   15   ++++++++++++++++++++++++++++++++++++++++++++++++++          
 
                 //(m15-63)  H4     [2][3]����<9�I     [1]����  �d�W�v�u>30�I   
       if    (close_240_buffer[1]-open_240_buffer[1]<=-0.0010 && high_240_buffer[1]-open_240_buffer[1]>=0.0030 &&
              close_240_buffer[2]-open_240_buffer[2]>=0.0009  && close_240_buffer[3]-open_240_buffer[3]>=0.0009  &&   
               // ma45 ma90 || ma90 ma180  �פU�B�j
            ((ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0008 &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002) ||
             (ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0006 &&  ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.0002)) &&
                // [1]���L�bma05���U  ���W�L15�I
              close_240_buffer[1]-ma05_240_buffer[1]<=-0.0001  && close_240_buffer[1]-ma05_240_buffer[1]>=-0.0015) 
              // (m15-66) kd2,kd3[1]-[2]>=7    k2,k2<=30 
              if    ((k1_240_buffer[1]-d1_240_buffer[1]>=7 && k2_240_buffer[1]-d2_240_buffer[1]>=7 && k3_240_buffer[1]-d3_240_buffer[1]>=7 &&
                     k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
                     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                      longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                      longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                      longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                      longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                      longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                      longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                      longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                      longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                      longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                      longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                      longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()))) 
                      return;
                      else
                      longsell15=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S15",4415,0,SpringGreen );

  //+++++++++++++++++++++++++++++++++++++++++++   SELL   16   ++++++++++++++++++++++++++++++++++++++++++++++++++          
              
                   //(m15-65)   h4 �� ma650�פU             ma360�פU�u�u
         if   (ma650_240_buffer[1]-ma650_240_buffer[2]<0 &&
                  //h4 [1]�����bma360���W�����W�L25�I
             ((close_240_buffer[1]-open_240_buffer[1]>=0.0001 && close_240_buffer[1]-ma360_240_buffer[1]>=0.0001 &&
               close_240_buffer[1]-ma360_240_buffer[1]<=0.0025) ||
                 //h4 [1]���t�B�bma360���U�����W�L25�I ��[2]�W�v�u�j��25�I
              (close_240_buffer[1]-open_240_buffer[1]<=-0.0001 && close_240_buffer[1]-ma360_240_buffer[1]>=0.0001 &&
               close_240_buffer[1]-ma360_240_buffer[1]<=0.0025 && high_240_buffer[2]-close_240_buffer[2]>=0.0025)) &&
                 //k2,k3[1]-[2]<=0    k2,k2>=70  k1[1]-[2]<0 || [1]�W�v�u�j��25�I
               k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
               k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70 &&
              (k1_240_buffer[1]-k1_240_buffer[2]<=0 ||  high_240_buffer[1]-close_240_buffer[1]>=0.0025) &&  
                  // macd�t��<=0.00150  >=-0.00100 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00150 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100 && 
              // [2]||[3]||[4]||[5]���bma360�U��25�I��  
             ((close_240_buffer[2]-ma360_240_buffer[2]<=-0.0001  && close_240_buffer[2]-ma360_240_buffer[2]>=-0.0025) ||
              (close_240_buffer[3]-ma360_240_buffer[3]<=-0.0001  && close_240_buffer[3]-ma360_240_buffer[3]>=-0.0025) ||
              (close_240_buffer[4]-ma360_240_buffer[4]<=-0.0001  && close_240_buffer[4]-ma360_240_buffer[4]>=-0.0025) ||
              (close_240_buffer[5]-ma360_240_buffer[5]<=-0.0001  && close_240_buffer[5]-ma360_240_buffer[5]>=-0.0025)))
       if     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
               longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
               longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
               longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
               longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
               longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
               longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
               longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
               longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
               longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
               longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
               longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket())) 
               return;
               else
               longsell16=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S16",4416,0,LightGreen );

  //+++++++++++++++++++++++++++++++++++++++++++   SELL   17   ++++++++++++++++++++++++++++++++++++++++++++++++++          
              
                   //(m15-65)   h4 �� ma650�פU          ma180�פU�u�u
         if   (ma650_240_buffer[1]-ma650_240_buffer[2]<-0.0001 &&
                  //h4 [1]�����B�bma180���W�����W�L25�I
             ((close_240_buffer[1]-open_240_buffer[1]>=0.0001 && close_240_buffer[1]-ma180_240_buffer[1]>=0.0001 &&
               close_240_buffer[1]-ma180_240_buffer[1]<=0.0025) ||
                 //h4 [1]���t�B�bma180���U�����W�L25�I ��[2]�W�v�u�j��25�I
              (close_240_buffer[1]-open_240_buffer[1]<=-0.0001 && close_240_buffer[1]-ma180_240_buffer[1]>=0.0001 &&
               close_240_buffer[1]-ma180_240_buffer[1]<=0.0025 && high_240_buffer[2]-close_240_buffer[2]>=0.0025)) &&
                 //k2,k3[1]-[2]<=0 ||kd2,kd3<=1   k2,k2>=70  k1[1]-[2]<=0 || [1]�W�v�u�j��25�I
             ((k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0) ||
              (k2_240_buffer[1]-d2_240_buffer[2]<=-1 && k3_240_buffer[1]-d3_240_buffer[2]<=-1)) &&
               k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70 &&
              (k1_240_buffer[1]-k1_240_buffer[2]<=0 ||  high_240_buffer[1]-close_240_buffer[1]>=0.0025) &&  
                  // macd�t��<=0.00150  >=-0.00100 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00150 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100 && 
              // [2]||[3]||[4]||[5]���bma180�U��25�I��  
             ((close_240_buffer[2]-ma180_240_buffer[2]<=-0.0001  && close_240_buffer[2]-ma180_240_buffer[2]>=-0.0025) ||
              (close_240_buffer[3]-ma180_240_buffer[3]<=-0.0001  && close_240_buffer[3]-ma180_240_buffer[3]>=-0.0025) ||
              (close_240_buffer[4]-ma180_240_buffer[4]<=-0.0001  && close_240_buffer[4]-ma180_240_buffer[4]>=-0.0025) ||
              (close_240_buffer[5]-ma180_240_buffer[5]<=-0.0001  && close_240_buffer[5]-ma180_240_buffer[5]>=-0.0025)))
               if     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                       longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                       longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                       longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                       longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                       longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                       longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                       longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                       longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                       longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                       longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                       longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket())) 
                       return;
                       else
                       longsell17=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S17",4417,0,LightGreen );

   //+++++++++++++++++++++++++++++++++++++++++++   SELL   18   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                   
               //(m15-65)  ma45�פU  ma90�����αפW   ma180,ma360,ma650�פW  ���bma45���W�w�[�Ӥɤ��W��[1]�d�W�v�u>25�I�B����                      
      if      (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=0 &&       
                 // macd�t��<=0.00150  >=-0.00100 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00150 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100 && 
                   //   k1,k2,k3<=0  k2,k2>=70            
               k1_240_buffer[1]-k1_240_buffer[2]<=0 && k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
               k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70 &&
                 //h4 [1]���t�W�v�u�j��25�I
               close_240_buffer[1]-open_240_buffer[1]<=-0.0001 &&  high_240_buffer[1]-close_240_buffer[1]>=0.0025 &&
                  // [1],[2],[3],[4],[5],[6],[7] ���bma45�W��25�I�� ���U5�I�� 
               close_240_buffer[1]-ma45_240_buffer[1]<=0.0025  && close_240_buffer[1]-ma180_240_buffer[1]>=-0.0005 &&
               close_240_buffer[2]-ma45_240_buffer[2]<=0.0025  && close_240_buffer[2]-ma180_240_buffer[2]>=-0.0005 &&
               close_240_buffer[3]-ma45_240_buffer[3]<=0.0025  && close_240_buffer[3]-ma180_240_buffer[3]>=-0.0005 &&
               close_240_buffer[4]-ma45_240_buffer[4]<=0.0025  && close_240_buffer[4]-ma180_240_buffer[4]>=-0.0005 &&
               close_240_buffer[5]-ma45_240_buffer[5]<=0.0025  && close_240_buffer[5]-ma180_240_buffer[5]>=-0.0005 &&
               close_240_buffer[6]-ma45_240_buffer[6]<=0.0025  && close_240_buffer[6]-ma180_240_buffer[6]>=-0.0005)
               if   (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                     longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                     longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                     longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                     longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                     longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                     longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                     longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                     longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                     longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                     longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                     longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket())) 
                     return;
                     else
                     longsell18=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S18",4418,0,MediumSeaGreen );
             
   //+++++++++++++++++++++++++++++++++++++++++++   SELL   19   ++++++++++++++++++++++++++++++++++++++++++++++++++          
 
                //(m15-65) h4  ����@�q�ɶ������W�h  ma �ҤW�ɦ��e�{�������
       if     (ma05_240_buffer[1]-ma05_240_buffer[10]>=0  &&  ma05_240_buffer[1]-ma05_240_buffer[10]<=0.0010 &&
               ma45_240_buffer[1]-ma45_240_buffer[10]>=0  &&  ma45_240_buffer[1]-ma45_240_buffer[10]<=0.0045 &&
               ma90_240_buffer[1]-ma90_240_buffer[10]>=0  &&  ma90_240_buffer[1]-ma90_240_buffer[10]<=0.0025 &&   
               ma180_240_buffer[1]-ma180_240_buffer[10]>=0  &&  ma180_240_buffer[1]-ma180_240_buffer[10]<=0.0025 &&
               ma360_240_buffer[1]-ma360_240_buffer[10]>=0  &&  ma360_240_buffer[1]-ma360_240_buffer[10]<=0.0025 &&
               ma650_240_buffer[1]-ma650_240_buffer[10]>=0  &&  ma650_240_buffer[1]-ma650_240_buffer[10]<=0.0025 &&
                // [1]~[6] macd�t��<=0.0050  >=-0.0050 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00050 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00050 && 
               macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]<=0.00050 &&  macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]>=-0.00050 && 
               macdmainline_240_buffer[3]-macdsignalline_240_buffer[3]<=0.00050 &&  macdmainline_240_buffer[3]-macdsignalline_240_buffer[3]>=-0.00050 && 
               macdmainline_240_buffer[4]-macdsignalline_240_buffer[4]<=0.00050 &&  macdmainline_240_buffer[4]-macdsignalline_240_buffer[4]>=-0.00050 && 
               macdmainline_240_buffer[5]-macdsignalline_240_buffer[5]<=0.00050 &&  macdmainline_240_buffer[5]-macdsignalline_240_buffer[5]>=-0.00050 && 
               macdmainline_240_buffer[6]-macdsignalline_240_buffer[6]<=0.00050 &&  macdmainline_240_buffer[6]-macdsignalline_240_buffer[6]>=-0.00050)// && 
                   //(m15-66)  k2,k3>=0  kd1>=18  ma45 �פW
               if ((k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0001  &&
                       //(m15-67)  k2,k3 ���פU����W��  exit
                    ((k2_240_buffer[4]-k2_240_buffer[5]<=-3 && k3_240_buffer[4]-k3_240_buffer[5]<=-3) ||
                    (k2_240_buffer[5]-k2_240_buffer[6]<=-3 && k3_240_buffer[5]-k3_240_buffer[6]<=-3)) &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=18) ||
                      //(m15-67) h4 [1]macd �Ȥ���0.00120 �P-0.00120��  �����                                
                   (macdmainline_240_buffer[1]<=0.00120 && macdmainline_240_buffer[1]>=-0.00120 &&
                    macdsignalline_240_buffer[1]<=0.00120 &&  macdsignalline_240_buffer[1]>=-0.00120) ||
                     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                      longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                      longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                      longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                      longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                      longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                      longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                      longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                      longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                      longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                      longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                      longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()))) 
                      return;
                      else
                      longsell19=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S19",4419,0,MediumSeaGreen );
  
   //+++++++++++++++++++++++++++++++++++++++++++   SELL   20   ++++++++++++++++++++++++++++++++++++++++++++++++++          
       
         //(m15-66)  ma650,�פU [1]<=-0.0050   ma90���U  ma45�bma650���W50�I,�B�פU���j    ma90�bma45���W50�I 
        if     (ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.0002  && close_240_buffer[1]-open_240_buffer[1]<=-0.0050 &&
                ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0007  && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 &&
                ma45_240_buffer[1]-ma650_240_buffer[1]>=0.0050  && ma90_240_buffer[1]-ma45_240_buffer[1]>=0.0050  && 
                    //   kd1,kd2,kd3<=-4  k2,k3>=65            
                k1_240_buffer[1]-d1_240_buffer[1]<=-4 && k2_240_buffer[1]-d2_240_buffer[1]<=-4 && k3_240_buffer[1]-d3_240_buffer[1]<=-4 &&
                k2_240_buffer[1]>=65 && k3_240_buffer[1]>=65)
               if   (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                     longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                     longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                     longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                     longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                     longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                     longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                     longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                     longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                     longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                     longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                     longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket())) 
                     return;
                     else
                     longsell20=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S20",4420,0,MediumSeaGreen );

   //+++++++++++++++++++++++++++++++++++++++++++   SELL   21   ++++++++++++++++++++++++++++++++++++++++++++++++++          
  
                //(m15-66)   h4 �� ma180,ma360,ma650 �פU ��ma180���� ma360 �פU   
        if   ((ma180_240_buffer[1]-ma180_240_buffer[2]<=0.0001 && ma360_240_buffer[1]-ma360_240_buffer[2]<=0.0001 &&
               ma650_240_buffer[1]-ma650_240_buffer[2]<=0.0001 &&
                  //  macd<=0.00110  >=0.00110   main && signal <=-0.00015   
               macdmainline_240_buffer[1]-macdmainline_240_buffer[2]<=-0.00015 && 
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]<=-0.00015 &&
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00110 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00110 &&
                     //   kd2,kd3<=-3  k2,k3>=65     close[4]||[5]||[6]||[7]<close[1]&& [2] �tw���ʽ�         
               k2_240_buffer[1]-d2_240_buffer[1]<=-3 && k3_240_buffer[1]-d3_240_buffer[1]<=-3 &&
              (close_240_buffer[4]-open_240_buffer[1]>=0 || close_240_buffer[5]-open_240_buffer[1]>=0 ||
               close_240_buffer[6]-open_240_buffer[1]>=0 || close_240_buffer[7]-open_240_buffer[1]>=0 || 
               close_240_buffer[8]-open_240_buffer[1]>=0 || close_240_buffer[9]-open_240_buffer[1]>=0) && 
              (close_240_buffer[4]-close_240_buffer[2]>=0 || close_240_buffer[5]-close_240_buffer[2]>=0 ||
               close_240_buffer[6]-close_240_buffer[2]>=0 || close_240_buffer[7]-close_240_buffer[2]>=0 || 
               close_240_buffer[8]-close_240_buffer[2]>=0 || close_240_buffer[9]-close_240_buffer[2]>=0) && 
               k2_240_buffer[1]>=65 && k3_240_buffer[1]>=65) ||
             
                  //(m15-66)   h4 �� ma180,ma360,ma650 �פU ��ma180���� ma360 �פU   
              (ma180_240_buffer[1]-ma180_240_buffer[2]<=0.0001 && ma360_240_buffer[1]-ma360_240_buffer[2]<=0.0001 &&
               ma650_240_buffer[1]-ma650_240_buffer[2]<=0.0001 &&
                  //  macd>=-0.00110  <=0.00110   main && signal <=-0.00015   
               macdmainline_240_buffer[1]-macdmainline_240_buffer[2]<=-0.00015 && 
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]<=-0.00015 &&
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00110 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00110 &&
                     //   kd2,kd3<=-3  k2,k3>=65     close[4]||[5]||[6]||[7]<close[1]&& [2] �tM�Y�ʽ�         
               k2_240_buffer[1]-d2_240_buffer[1]<=-3 && k3_240_buffer[1]-d3_240_buffer[1]<=-3 &&
              (close_240_buffer[4]-open_240_buffer[1]>=0 || close_240_buffer[5]-open_240_buffer[1]>=0 ||
               close_240_buffer[6]-open_240_buffer[1]>=0 || close_240_buffer[7]-open_240_buffer[1]>=0 || 
               close_240_buffer[8]-open_240_buffer[1]>=0 || close_240_buffer[9]-open_240_buffer[1]>=0) && 
              (close_240_buffer[4]-close_240_buffer[2]>=0 || close_240_buffer[5]-close_240_buffer[2]>=0 ||
               close_240_buffer[6]-close_240_buffer[2]>=0 || close_240_buffer[7]-close_240_buffer[2]>=0 || 
               close_240_buffer[8]-close_240_buffer[2]>=0 || close_240_buffer[9]-close_240_buffer[2]>=0) && 
               k2_240_buffer[1]>=65 && k3_240_buffer[1]>=65) ||
              //(m15-67)   h4 �� ma360, ma650 �פU   ma05||ma08||ma12<=0.0001 
              (ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.0001 && ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.0001 &&
              (ma05_240_buffer[1]-ma05_240_buffer[2]<=0.0001 || ma08_240_buffer[1]-ma08_240_buffer[2]<=0.0001 ||
               ma12_240_buffer[1]-ma12_240_buffer[2]<=0.0001) &&
                  //ma45,ma90�w�����  [1]-[6]<=0.0003
               ma45_240_buffer[1]-ma45_240_buffer[6]<=0.0003 && ma90_240_buffer[1]-ma90_240_buffer[6]<=0.0003 &&
                // [1]�W�v�j��30�I          [2][3]����  
              (close_240_buffer[1]-open_240_buffer[1]<=-0.0001  && high_240_buffer[1]-close_240_buffer[1]>=0.0030)  ||
               close_240_buffer[1]-open_240_buffer[1]>=0.0001  && high_240_buffer[1]-open_240_buffer[1]>=0.0030)  &&
              (close_240_buffer[2]-open_240_buffer[2]>=0.0001 || close_240_buffer[3]-open_240_buffer[3]>=0.0001)  && 
                   //   [5]||[6]||[7]||[8]���}�L���b[1]���W   �U�^��W���d�W�v�u         
              (close_240_buffer[5]-close_240_buffer[1]>=0 || close_240_buffer[6]-close_240_buffer[1]>=0 ||
               close_240_buffer[7]-close_240_buffer[1]>=0 || close_240_buffer[8]-close_240_buffer[1]>=0 ||
               close_240_buffer[9]-close_240_buffer[1]>=0 || close_240_buffer[10]-close_240_buffer[1]>=0) &&                 //kd2,kd3>=7     
               k2_240_buffer[1]-d2_240_buffer[1]<=-3 &&  k3_240_buffer[1]-d3_240_buffer[1]<=-3)
             if     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                     longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                     longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                     longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                     longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                     longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()) ||  
                     TimeCurrent()-OrderCloseTime()<=1000) 
                     return;
                     else
                     longsell21=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S21",4421,0,MediumSeaGreen );
 Comment( TimeCurrent(),"          opent  ",OrderOpenTime(),"      openprice",OrderOpenPrice(),"     closet",OrderCloseTime(),"      closeprice",OrderClosePrice());                 

   //+++++++++++++++++++++++++++++++++++++++++++   SELL   22   ++++++++++++++++++++++++++++++++++++++++++++++++++          
  
                //����^�^��ma180��A�ϼu��ma45�ᤣ���F
                //(m15-67)   h4 �� ma45�פU ma90���� ma180 �פW  �W��U�ƦC  ma45,ma90,ma180   
        if    (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 && ma90_240_buffer[1]-ma90_240_buffer[2]<=0.0001 &&
               ma180_240_buffer[1]-ma180_240_buffer[2]>=0.0001 && ma45_240_buffer[1]-ma90_240_buffer[1]>=0.0010 &&
               ma90_240_buffer[1]-ma180_240_buffer[1]>=0.0010 &&
                     //   kd1,(kd2||kd3)<=-3  k1,k2,k3>=75             
               k1_240_buffer[1]-d1_240_buffer[1]<=-3 && (k2_240_buffer[1]-d2_240_buffer[1]<=-3 || k3_240_buffer[1]-d3_240_buffer[1]<=-3) &&
               k2_240_buffer[1]>=75 && k3_240_buffer[1]>=75 &&
               //ma05 [1]-[2]<=0 
               ma05_240_buffer[1]-ma05_240_buffer[2]<=0 &&
                   // [1]�W�v�j��22�I          [2]||[3]����  
             ((close_240_buffer[1]-open_240_buffer[1]<=-0.0001  && high_240_buffer[1]-close_240_buffer[1]>=0.0022)  ||
              (close_240_buffer[1]-open_240_buffer[1]>=0.0001  && high_240_buffer[1]-open_240_buffer[1]>=0.0022))  &&
              (close_240_buffer[2]-open_240_buffer[2]>=0.0001 || close_240_buffer[3]-open_240_buffer[3]>=0.0001)   && 
            
                // ([2]||[3]||[4]||[5]) && ([6]||[7]||[8]||[9])  close[1]-ma45>=-0.0005 <=0.0005  ���bma45����
             ((close_240_buffer[2]-ma45_240_buffer[2]>=-0.0005 && close_240_buffer[2]-ma45_240_buffer[2]<=0.0005) || 
              (close_240_buffer[3]-ma45_240_buffer[3]>=-0.0005 && close_240_buffer[3]-ma45_240_buffer[3]<=0.0005) || 
              (close_240_buffer[4]-ma45_240_buffer[4]>=-0.0005 && close_240_buffer[4]-ma45_240_buffer[4]<=0.0005) || 
              (close_240_buffer[5]-ma45_240_buffer[5]>=-0.0005 && close_240_buffer[5]-ma45_240_buffer[5]<=0.0005)) && 
             ((close_240_buffer[6]-ma45_240_buffer[6]>=-0.0005 && close_240_buffer[6]-ma45_240_buffer[6]<=0.0005) || 
              (close_240_buffer[7]-ma45_240_buffer[7]>=-0.0005 && close_240_buffer[7]-ma45_240_buffer[7]<=0.0005) || 
              (close_240_buffer[8]-ma45_240_buffer[8]>=-0.0005 && close_240_buffer[8]-ma45_240_buffer[8]<=0.0005) || 
              (close_240_buffer[9]-ma45_240_buffer[9]>=-0.0005 && close_240_buffer[9]-ma45_240_buffer[9]<=0.0005))) 
             if     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                     longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                     longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                     longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                     longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                     longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                     longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                     longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                     longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                     longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                     longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                     longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket())) 
                     return;
                     else
                     longsell22=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S22",4422,0,MediumSeaGreen );
       
   //+++++++++++++++++++++++++++++++++++++++++++   SELL   23   ++++++++++++++++++++++++++++++++++++++++++++++++++          
 
              //�^�Ầ��ma180�W�U�d�W�v�u
                //(m15-67)   h4 �� ma90,ma180,ma360,ma650 ���פU     �U��W�ƦC  ma90,ma180,ma360,ma650   
        if    (ma90_240_buffer[1]-ma90_240_buffer[2]<0 && ma180_240_buffer[1]-ma180_240_buffer[2]<=0 &&
               ma360_240_buffer[1]-ma360_240_buffer[2]<0 && ma650_240_buffer[1]-ma650_240_buffer[2]<-0.0001 &&
               ma90_240_buffer[1]-ma180_240_buffer[1]<=0.0010 && ma90_240_buffer[1]-ma180_240_buffer[1]>=-0.0010 && 
                  //ma45 �}�f�L�U
              (ma90_240_buffer[1]-ma45_240_buffer[1])-(ma90_240_buffer[2]-ma45_240_buffer[2])<0 && 
                   //macd   signal  [1]>[2] [1]<[3] 
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]>=0.00001 &&
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[3]<=-0.00001 &&

                  // [1]�W�v�j��22�I          [2]||[3]����  
             ((close_240_buffer[1]-open_240_buffer[1]<=-0.0001  && high_240_buffer[1]-close_240_buffer[1]>=0.0022)  ||
              (close_240_buffer[1]-open_240_buffer[1]>=0.0001  && high_240_buffer[1]-open_240_buffer[1]>=0.0022))  &&
              (close_240_buffer[2]-open_240_buffer[2]>=0.0001 || close_240_buffer[3]-open_240_buffer[3]>=0.0001)) 
               if     (OrdersTotal()==1 && (longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
                       longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
                       longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
                       longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
                       longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
                       longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
                       longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
                       longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
                       longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
                       longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
                       longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
                       longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket())) 
                       return;
                       else
                       longsell23=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S23",4423,0,MediumSeaGreen );
       }

 //+++++++++++++++++++++++++++++++++++++++++++   SHORTBUY      ++++++++++++++++++++++++++++++++++++++++++++++++++          
 //+++++++++++++++++++++++++++++++++++++++++++   SHORTBUY      ++++++++++++++++++++++++++++++++++++++++++++++++++          
 //+++++++++++++++++++++++++++++++++++++++++++   SHORTBUY      ++++++++++++++++++++++++++++++++++++++++++++++++++          
  //      Comment(shortbuy01,"==",OrderTicket(),"   ",shortbuy02,"==",OrderTicket(),"       ",shortbuy03,"==",OrderTicket(),"        ",
 //       shortbuy04,"==",OrderTicket(),"        ",shortbuy05,"==",OrderTicket(),"    ",shortbuy06,"==",OrderTicket(),"    sell  ",shortsell01,"==",OrderTicket(),"     ",shortsell02,"==",OrderTicket(),"      ",shortsell03,"==",OrderTicket(),"     ",
 //       shortsell04,"==",OrderTicket(),"      ",shortsell05,"==",OrderTicket(),"      ",shortsell06,"==",OrderTicket(),"   lobuy",longbuy01,"==",OrderTicket(),"   losell",longsell21,"==",OrderTicket());

            //��������`��Ƭ�3�S������欰1
 
  if     ((OrdersTotal()<1) || (OrdersTotal()<3 && longbuy01==OrderTicket() || longbuy02==OrderTicket() || longbuy03==OrderTicket() || longbuy04==OrderTicket() ||
           longbuy05==OrderTicket() || longbuy06==OrderTicket() || longbuy07==OrderTicket() || longbuy08==OrderTicket() ||
           longbuy09==OrderTicket() || longbuy10==OrderTicket() || longbuy11==OrderTicket() || longbuy12==OrderTicket() ||
           longbuy13==OrderTicket() || longbuy14==OrderTicket() || longbuy15==OrderTicket() || longbuy16==OrderTicket() ||
           longbuy17==OrderTicket() || longbuy18==OrderTicket() || longbuy19==OrderTicket() || longbuy20==OrderTicket() ||
           longbuy21==OrderTicket() || longbuy22==OrderTicket() || longbuy23==OrderTicket() || longbuy24==OrderTicket() ||
           longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
           longsell05==OrderTicket() || longsell06==OrderTicket() || longsell07==OrderTicket() || longsell08==OrderTicket() ||
           longsell09==OrderTicket() || longsell10==OrderTicket() || longsell11==OrderTicket() || longsell12==OrderTicket() ||
           longsell13==OrderTicket() || longsell14==OrderTicket() || longsell15==OrderTicket() || longsell16==OrderTicket() ||
           longsell17==OrderTicket() || longsell18==OrderTicket() || longsell19==OrderTicket() || longsell20==OrderTicket() ||
           longsell21==OrderTicket() || longsell22==OrderTicket() || longsell23==OrderTicket() || longsell24==OrderTicket()))  
    {   
//+++++++++++++++++++++++++++++++++++++++++++ SHORT  BUY  01   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                //����^��ma45�ϼu�W
                //(m15-68)   h4 �� ma45,ma90,ma180,ma360,ma650 ���פW     
        if    (ma45_240_buffer[1]-ma45_240_buffer[2]>0 && ma90_240_buffer[1]-ma90_240_buffer[2]>0 &&
               ma180_240_buffer[1]-ma180_240_buffer[2]>0 && ma360_240_buffer[1]-ma360_240_buffer[2]>0 &&
               ma650_240_buffer[1]-ma650_240_buffer[2]>-0.0001 &&
                 //ma05���U�^���i�Ӥj
               ma05_240_buffer[1]-ma05_240_buffer[2]>=-0.0020 &&
                   //case�@   //[+1]>[2],[3],[4]    kd1��e�W  k1�j�T�W��   macd�b+-0.00160��
              (close_240_buffer[1]-open_240_buffer[1]>=0.0001  && close_240_buffer[1]-close_240_buffer[2]>=0.0001  &&
               close_240_buffer[1]-close_240_buffer[3]>=0.0001 && close_240_buffer[1]-close_240_buffer[4]>=0.0001  &&
               k1_240_buffer[1]-d1_240_buffer[1]>=3 && k1_240_buffer[1]-k1_240_buffer[2]>=6 &&  k1_240_buffer[1]<=25) ||
                 
                   //case�G   //[-3],[+2],[+1]    [-3]<=-0.0035   [1]>[2],[3]
              (close_240_buffer[1]-open_240_buffer[1]>=0.0001  && close_240_buffer[2]-open_240_buffer[2]>=0.0001  &&
               close_240_buffer[3]-open_240_buffer[3]<=-0.0035 &&
               k1_240_buffer[1]-k1_240_buffer[2]>=8 &&  k1_240_buffer[1]<=25) ||
             
                   //case�T   //[+3],[-2],[+1]   
              (close_240_buffer[1]-open_240_buffer[1]>=0.0010  && close_240_buffer[2]-open_240_buffer[2]<=-0.0001  &&
               close_240_buffer[3]-open_240_buffer[3]>=0.0010 &&
               k1_240_buffer[1]-k1_240_buffer[2]>=8 &&  k1_240_buffer[1]<=25))
               if  (OrdersTotal()==1 && (shortbuy01==OrderTicket() || shortbuy02==OrderTicket() ||shortbuy03==OrderTicket() ||
                    shortbuy04==OrderTicket() || shortbuy05==OrderTicket() || shortbuy06==OrderTicket() ||
                    shortsell01==OrderTicket() || shortsell02==OrderTicket() || shortsell03==OrderTicket() ||
                    shortsell04==OrderTicket() || shortsell05==OrderTicket() || shortsell06==OrderTicket()))   
                    return;
                    else                          
                    shortbuy01=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-28*Point,Ask+200*Point,"My order shortbuy1",1,0,Yellow);
  
  //*** Buy  1  ***************************************************************************************** 
                                            
       if (k1_05_buffer[1]<=55 && k2_05_buffer[1]<=55 && k3_05_buffer[1]<=55 && 
           k1_05_buffer[1]-k1_05_buffer[2]>=1 && k2_05_buffer[1]-k2_05_buffer[2]>=0 &&
           macdmainline_05_buffer[1]-macdsignalline_05_buffer[1]>=-0.00015 &&
           close_05_buffer[1]-open_05_buffer[1]>=0.0001  &&  close_05_buffer[2]-open_05_buffer[2]<=0 &&
           close_05_buffer[3]-open_05_buffer[3]<=0  &&  close_05_buffer[4]-open_05_buffer[4]>=0.0001) 
           if  (OrdersTotal()==1 && (shortbuy01==OrderTicket() || shortbuy02==OrderTicket() ||shortbuy03==OrderTicket() ||
                shortbuy04==OrderTicket() || shortbuy05==OrderTicket() ||shortbuy06==OrderTicket() || shortsell01==OrderTicket() || shortsell02==OrderTicket() ||shortsell03==OrderTicket() ||
                shortsell04==OrderTicket() || shortsell05==OrderTicket() ||shortsell06==OrderTicket()))   
                return;
                else      
                shortbuy02=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-30*Point,Ask+50*Point,"My order #Shortbuy2",2,0,Red );

 //*** Buy  2  ***************************************************************************************** 
                                            
       if (k1_15_buffer[1]<=50 && k2_15_buffer[1]<=50 && k3_15_buffer[1]<=50 && 
           k1_15_buffer[1]-k1_15_buffer[2]>=1 && k2_15_buffer[1]-k2_15_buffer[2]>=0 &&
           macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&
           close_15_buffer[1]-open_15_buffer[1]>=0.0001  &&  close_15_buffer[2]-open_15_buffer[2]<=0 &&
           close_15_buffer[3]-open_15_buffer[3]<=0  &&  close_15_buffer[4]-open_15_buffer[4]>=0.0001) 
           if  (OrdersTotal()==1 && (shortbuy01==OrderTicket() || shortbuy02==OrderTicket() ||shortbuy03==OrderTicket() ||
                shortbuy04==OrderTicket() || shortbuy05==OrderTicket() ||shortbuy06==OrderTicket() || shortsell01==OrderTicket() || shortsell02==OrderTicket() ||shortsell03==OrderTicket() ||
                shortsell04==OrderTicket() || shortsell05==OrderTicket() ||shortsell06==OrderTicket()))   
                return;
                else                      
                shortbuy03=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-30*Point,Ask+50*Point,"My order #Shortbuy3",3,0,Yellow );

 
 //+++++++++++++++++++++++++++++++++++++++++++   SHORT SELL    01   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                //�^�Ầ��ma45�ϼu�U
                //(m15-68)   h4 �� ma45,ma90,ma180,ma360,ma650 ���פU     
        if    (ma45_240_buffer[1]-ma45_240_buffer[2]<0 && ma90_240_buffer[1]-ma90_240_buffer[2]<0 &&
               ma180_240_buffer[1]-ma180_240_buffer[2]<0 && ma360_240_buffer[1]-ma360_240_buffer[2]<0 &&
               ma650_240_buffer[1]-ma650_240_buffer[2]<0.0001 &&
                 //ma05���W�����i�Ӥj
               ma05_240_buffer[1]-ma05_240_buffer[2]<=0.0020 &&
                   //case�@   //[-1]<[2],[3],[4]    kd1��e�U  k1�j�T�U�^   macd�b+-0.00160��
              (close_240_buffer[1]-open_240_buffer[1]<=-0.0001  && close_240_buffer[1]-close_240_buffer[2]<=-0.0001  &&
               close_240_buffer[1]-close_240_buffer[3]<=-0.0001 && close_240_buffer[1]-close_240_buffer[4]<=-0.0001  &&
               k1_240_buffer[1]-d1_240_buffer[1]<=-3 && k1_240_buffer[1]-k1_240_buffer[2]<=-6 &&  k1_240_buffer[1]>=75) ||
                 
                   //case�G   //[+3],[-2],[-1]    [+3]>=0.0035   [1]<[2],[3]
              (close_240_buffer[1]-open_240_buffer[1]<=-0.0001  && close_240_buffer[2]-open_240_buffer[2]<=-0.0001  &&
               close_240_buffer[3]-open_240_buffer[3]>=0.0035 &&
               k1_240_buffer[1]-k1_240_buffer[2]<=-8 &&  k1_240_buffer[1]>=75) ||
             
                   //case�T   //[-3],[+2],[-1]   
              (close_240_buffer[1]-open_240_buffer[1]<=-0.0010  && close_240_buffer[2]-open_240_buffer[2]>=0.0001  &&
               close_240_buffer[3]-open_240_buffer[3]<=-0.0010 &&
               k1_240_buffer[1]-k1_240_buffer[2]<=-8 &&  k1_240_buffer[1]>=75))
               if  (OrdersTotal()==1 && (shortbuy01==OrderTicket() || shortbuy02==OrderTicket() ||shortbuy03==OrderTicket() ||
                    shortbuy04==OrderTicket() || shortbuy05==OrderTicket() ||shortbuy06==OrderTicket() || shortsell01==OrderTicket() || shortsell02==OrderTicket() ||shortsell03==OrderTicket() ||
                    shortsell04==OrderTicket() || shortsell05==OrderTicket() ||shortsell06==OrderTicket()))   
                    return;
                    else         
                    shortsell01=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+28*Point,Bid-200*Point,"My order shortsell01",1,0,MediumSeaGreen );

 //+++++++++++++++++++++++++++++++++++++++++++   SHORT SELL   2   ++++++++++++++++++++++++++++++++++++++++++++++++++          
  
                 //ma15,ma30,ma60    �t�Ȥp�B�b�@�w�d��    
  //    if      (macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00070 && macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00030 &&
  //             macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00050 && macdmainline_30_buffer[1]-macdsignalline_60_buffer[1]>=-0.00020 &&
  //             macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=0.00050 && macdmainline_30_buffer[1]-macdsignalline_60_buffer[1]>=-0.00020 &&
                // m15  k1,k2,k3>70   kd1<=0   
  //             k1_15_buffer[1]-d1_15_buffer[2]<=0 &&  k1_15_buffer[1]>=70 && k2_15_buffer[1]>=70 && k3_15_buffer[1]>=70 &&
                //[1]<=0  [1]<[2],[3],[4]
  //             close_15_buffer[1]-open_15_buffer[1]<=0  &&  close_15_buffer[1]-close_15_buffer[2]<=-0.0001  &&
  //             close_15_buffer[1]-close_15_buffer[3]<=-0.0001 && close_15_buffer[1]-close_15_buffer[3]<=-0.0001)
                 //h4 ma
 //                 if  (OrdersTotal()==1 && (shortbuy01==OrderTicket() || shortbuy02==OrderTicket() ||shortbuy03==OrderTicket() ||
 //                      shortbuy04==OrderTicket() || shortbuy05==OrderTicket() ||shortbuy06==OrderTicket() || shortsell01==OrderTicket() || shortsell02==OrderTicket() ||shortsell03==OrderTicket() ||
 //                      shortsell04==OrderTicket() || shortsell05==OrderTicket() ||shortsell06==OrderTicket()))   
 //                      return;
 //                      else      
 //              shortsell02=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+28*Point,Bid-100*Point,"My order #S24",4424,0,MediumSeaGreen );
//*** sell  1  ***************************************************************************************** 
                                            
       if (k1_05_buffer[1]>=45 && k2_05_buffer[1]>=45 && k3_05_buffer[1]>=45 && 
           k1_05_buffer[1]-k1_05_buffer[2]<=-1 && k2_05_buffer[1]-k2_05_buffer[2]<=0 &&
           macdmainline_05_buffer[1]-macdsignalline_05_buffer[1]<=0.00015 &&
           close_05_buffer[1]-open_05_buffer[1]<=-0.0001  &&  close_05_buffer[2]-open_05_buffer[2]>=0 &&
           close_05_buffer[3]-open_05_buffer[3]>=0  &&  close_05_buffer[4]-open_05_buffer[4]<=-0.0001) 
           if  (OrdersTotal()==1 && (shortbuy01==OrderTicket() || shortbuy02==OrderTicket() ||shortbuy03==OrderTicket() ||
                shortbuy04==OrderTicket() || shortbuy05==OrderTicket() ||shortbuy06==OrderTicket() || shortsell01==OrderTicket() || shortsell02==OrderTicket() ||shortsell03==OrderTicket() ||
                shortsell04==OrderTicket() || shortsell05==OrderTicket() ||shortsell06==OrderTicket()))   
                return;
                else      
                shortsell02=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+30*Point,Bid-50*Point,"My order #Shortsell2",2,0,Aqua );
 //*** sell  2  ***************************************************************************************** 
                                            
       if (k1_15_buffer[1]>=50 && k2_15_buffer[1]>=50 && k3_15_buffer[1]>=50 && 
           k1_15_buffer[1]-k1_15_buffer[2]<=-1 && k2_15_buffer[1]-k2_15_buffer[2]<=0 &&
           macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020 &&
           close_15_buffer[1]-open_15_buffer[1]<=-0.0001  &&  close_15_buffer[2]-open_15_buffer[2]>=0 &&
           close_15_buffer[3]-open_15_buffer[3]>=0  &&  close_15_buffer[4]-open_15_buffer[4]<=-0.0001) 
           if  (OrdersTotal()==1 && (shortbuy01==OrderTicket() || shortbuy02==OrderTicket() ||shortbuy03==OrderTicket() ||
                shortbuy04==OrderTicket() || shortbuy05==OrderTicket() ||shortbuy06==OrderTicket() || shortsell01==OrderTicket() || shortsell02==OrderTicket() ||shortsell03==OrderTicket() ||
                shortsell04==OrderTicket() || shortsell05==OrderTicket() ||shortsell06==OrderTicket()))   
                return;
                else                     
                shortsell03=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+30*Point,Bid-50*Point,"My order #Shortsell3",3,0,Aqua );

                         // FOR TEST 
 //         if    (Day()>15)
//                 OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+20*Point,Bid-20*Point,"My order #S20",4420,0,MediumSeaGreen );
  
    }

 if (OrdersTotal()>0)
 {
   for (cnt=0;cnt<OrdersTotal();cnt++)
     {
       OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES);
 
     if   (OrderType()==OP_BUY)       
      {                                             
//+++++++++++++++++++++++++++++++++++++++++++  CLOSE  BUY   1   ++++++++++++++++++++++++++++++++++++++++++++++++++          
          
                                                       //m15 ��ma45  ma90 �� �~ �W�ɥ��ݫ��A  ma45[1]-[6]���T�{���W�� 
        if (((ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma45_15_buffer[1]-ma45_15_buffer[6]>=0) ||
                                                      //�����W�ɦ�h4 [1]�|���t�p��20�I
             (ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0.0001 && 
                                            //h4 ���� �B�U�v�u>=-0.0006
              close_240_buffer[1]-open_240_buffer[1]<=-0.0020 && low_240_buffer[1]-close_240_buffer[1]>=-0.0055 )) && 
              ma90_15_buffer[1]-ma90_15_buffer[2]>=0.0001 && 
                                                     //�W�ɥ��ݤU�^�n�@���^�}�e3bar
              close_15_buffer[1]-close_15_buffer[2]<=-0.0001  && // close_15_buffer[1]-close_15_buffer[3]<=-0.0001 &&
        //      close_15_buffer[1]-close_15_buffer[4]<=-0.0001  &&
                                                 //��m15 m30 macd ���޶R���I 
               macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00010 &&
               macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00050 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&
               macdmainline_30_buffer[1]>=-0.00110   &&
                                                          //m60 ��45,90,180  �ҬO�פU
              (macdmainline_60_buffer[1]>=-0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]<=-0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]<=-0.0003 && 
               ma180_60_buffer[1]-ma180_60_buffer[2]<=0))   &&    
                                                              //k1 (k2||k3)�w�U�^
              k1_15_buffer[1]-k1_15_buffer[2]<=-1  &&  k1_15_buffer[1]-d1_15_buffer[1]<=-1 &&
              k2_15_buffer[1]-k2_15_buffer[2]<=0  ||  k3_15_buffer[1]-k3_15_buffer[2]<=0)
              if ((macdmainline_15_buffer[1]>=-0.00099 && macdmainline_15_buffer[1]<=0.00099 &&
                   macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                  (k2_30_buffer[1]-d2_30_buffer[1]>=19  &&  k3_30_buffer[1]-d3_30_buffer[1]>=19) ||
                  (k2_60_buffer[1]-d2_60_buffer[1]>=19  &&  k3_60_buffer[1]-d3_60_buffer[1]>=19) ||
                       //(m15-65) [1]����>25�I macd�t��>=0.00230
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0025 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00230) ||

       
                                     //h4  �b53�U  �}�f�V�W  �������
                   (k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3���V�W,��h4,m30,m60  kd2,kd3�V�W�}�f�j �� k1,k,2,k3�b����
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
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd�t��<=350
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
                                     // h1 k123�b�W�� �Ҭ��U�^
          if  (k1_60_buffer[1]>=85 && k2_60_buffer[1]>=85 && k3_60_buffer[1]>=85  && 
               k1_60_buffer[1]-k1_60_buffer[2]<=-8 &&  k2_60_buffer[1]-k2_60_buffer[2]<=0 &&  k3_60_buffer[1]-k3_60_buffer[2]<=0 &&
                                  //[1]���L�p��20�I �p��[2][3][4] ma05    10�I�W
               close_60_buffer[1]-open_60_buffer[1]<=-0.0020 && close_60_buffer[1]-close_60_buffer[2]<=-0.0010 &&
               close_60_buffer[1]-close_60_buffer[3]<=-0.0010 && close_60_buffer[1]-close_60_buffer[4]<=-0.0010 &&
               close_60_buffer[1]-ma05_60_buffer[1]<=-0.0010 && 
         
               macdmainline_30_buffer[1]>=-0.00110   &&
                                                          //m60 ��45,90,180  �ҬO�פU
              (macdmainline_60_buffer[1]>=-0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]<=-0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]<=-0.0003 && 
               ma180_60_buffer[1]-ma180_60_buffer[2]<=0)))    
                                    //h4  �b53�U  �}�f�V�W  �������
               if ((k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3���V�W,��h4,m30,m60  kd2,kd3�V�W�}�f�j �� k1,k,2,k3�b����
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
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd�t��<=350
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
                                 
                                        //k1 �@���U�^�` kd1�j�T��e�U 
        if     ((k1_15_buffer[1]-k1_15_buffer[2]<=-10  &&  k1_15_buffer[1]-d1_15_buffer[1]<=-5 && close_15_buffer[1]-open_15_buffer[1]<=-0.0002 &&
                                         //�]���H���L�C�A��X  
                k1_15_buffer[1]>=40 && k2_15_buffer[2]>=40  &&  k3_15_buffer[1]>=40 && 
               (ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=0) || 
               (ma90_15_buffer[1]-ma90_15_buffer[2]<=0 && ma180_15_buffer[1]-ma180_15_buffer[2]<=0) && 
                                                         //���� m30 m60   macd ���i�H�b�L�C��m 
               macdmainline_30_buffer[1]>=-0.00110   && 
                                                          //m60 ��45,90,180  �ҬO�פU
              (macdmainline_60_buffer[1]>=-0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]<=-0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]<=-0.0003 && 
               ma180_60_buffer[1]-ma180_60_buffer[2]<=0))   &&    
                                                               //��m15 m30 macd ���޶R���I 
               macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00020 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00010 &&
               macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00050 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020))
               if ((macdmainline_15_buffer[1]>=-0.00099 && macdmainline_15_buffer[1]<=0.00099 &&
                    macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                      //(m15-62) h4 k1,k2,k3 <=35 don't sell
                   (k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||                   
                    //(m15-64) h4 [1]�����äj��30�I  kd2,kd3>=10
                  (close_240_buffer[1]-open_240_buffer[1]>=0.0030 &&                          
                   k2_240_buffer[1]-d2_240_buffer[1]>=10 && k3_240_buffer[1]-d3_240_buffer[1]>=10) ||                        
                  //(m15-64) h4 [1]macd �t��<=-0.00050 [1]���L�����Ȩ�>=25�I,[2]macd �t��<=-0.00030 [2]���L�����Ȩ�>=60�I                                
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0025 &&  close_240_buffer[2]-open_240_buffer[2]>=0.0060 &&                          
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00050 &&
                    macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]<=-0.00030) ||
                     //(m15-66) h4 [1]macd �Ȥ���0.00150 �P-0.00150�� �B kd1,kd2,kd3>=4 �����                                
                   (k1_240_buffer[1]-d1_240_buffer[1]>=4 && k2_240_buffer[1]-d2_240_buffer[1]>=4 &&
                    k3_240_buffer[1]-d3_240_buffer[1]>=4 &&                       
                    macdmainline_240_buffer[1]<=0.00150 && macdmainline_240_buffer[1]>=-0.00150 &&
                    macdsignalline_240_buffer[1]<=0.00150 &&  macdsignalline_240_buffer[1]>=-0.00150) ||
                   //(m15-66) h4 [1]macd �Ȥ���0.00100 �P-0.00100��  �����                                
                   (macdmainline_240_buffer[1]<=0.00100 && macdmainline_240_buffer[1]>=-0.00100 &&
                    macdsignalline_240_buffer[1]<=0.00100 &&  macdsignalline_240_buffer[1]>=-0.00100) ||
                         //(m15-66)  macd �t��>=0.00450  signal[1]-[2]>=0.00100
                   (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00450 &&
                    macdsignalline_240_buffer[1]- macdsignalline_240_buffer[2]>=0.00100) ||
                      
                               
                               
                                       //h4  �b53�U  �}�f�V�W  �������
                   (k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3���V�W,��h4,m30,m60  kd2,kd3�V�W�}�f�j �� k1,k,2,k3�b����
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
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd�t��<=350
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
         
              //m15 �� [-4][+3][+2][-1] && [-1]or[+2]���̰� bar���鬰0.0006  �����o�ͱ�����Y
        if  (((close_15_buffer[1]-open_15_buffer[1]<=-0.0006 && close_15_buffer[4]-open_15_buffer[4]<=-0.0006  && 
               close_15_buffer[2]-open_15_buffer[2]>=0.0006 && close_15_buffer[3]-open_15_buffer[3]>=0.0006 &&
               k1_15_buffer[1]-k1_15_buffer[2]<=0  &&  close_15_buffer[1]-open_15_buffer[2]<=-0.0001  &&
              (high_15_buffer[1]==M15highest40bar ||  high_15_buffer[2]==M15highest40bar) &&
              (ma05_15_buffer[1]-ma05_15_buffer[2]<=0 || 
              (close_15_buffer[1]-open_15_buffer[1]<=-0.0001 && high_15_buffer[1]-close_15_buffer[1]>=0.0029) ||
              (k2_15_buffer[1]-k2_15_buffer[2]<=-2 && k3_15_buffer[1]-k3_15_buffer[2]<=-2) ||
              (ma05_15_buffer[1]-ma05_15_buffer[2]<=0.0006 &&
              (k2_15_buffer[1]-k2_15_buffer[2]<=0 || k3_15_buffer[1]-k3_15_buffer[2]<=0)))) ||
               //m15 �� [-5][+4][+3][+2][-1]  && [-1]or[+2]���̰� bar���鬰0.0006  
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
           
                //m30 �� [-4][+3][+2][-1] && [-1]or[+2]���̰� bar���鬰0.0008  �����o�ͱ�����Y
              (close_30_buffer[1]-open_30_buffer[1]<=-0.0008 && close_30_buffer[4]-open_30_buffer[4]<=-0.0008  && 
               close_30_buffer[2]-open_30_buffer[2]>=0.0008 && close_30_buffer[3]-open_30_buffer[3]>=0.0008 &&
               k1_30_buffer[1]-k1_30_buffer[2]<=0  &&  close_30_buffer[1]-open_30_buffer[2]<=-0.0001  &&
              (high_30_buffer[1]==M30highest40bar ||  high_30_buffer[2]==M30highest40bar) &&
              (ma05_30_buffer[1]-ma05_30_buffer[2]<=0 || 
              (close_30_buffer[1]-open_30_buffer[1]<=-0.0001 && high_30_buffer[1]-close_30_buffer[1]>=0.0029) ||
              (k2_30_buffer[1]-k2_30_buffer[2]<=-2 && k3_30_buffer[1]-k3_30_buffer[2]<=-2) ||
              (ma05_30_buffer[1]-ma05_30_buffer[2]<=0.0006 &&
              (k2_30_buffer[1]-k2_30_buffer[2]<=0 || k3_30_buffer[1]-k3_30_buffer[2]<=0)))) ||
                 //m30 �� [-5][+4][+3][+2][-1]  && [-1]or[+2]���̰� bar���鬰0.0008  
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
                   
                  //m60 �� [-4][+3][+2][-1] && [-1]or[+2]���̰� bar���鬰0.0010  �����o�ͱ�����Y
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
                  //m60 �� [-5][+4][+3][+2][-1]  && [-1]or[+2]���̰� bar���鬰0.0010  
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
                                                          //m60 ��45,90,180  �ҬO�פU
              (macdmainline_60_buffer[1]>=-0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]<=-0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]<=-0.0003 && 
               ma180_60_buffer[1]-ma180_60_buffer[2]<=0)))    
                                      //(m15-61) h4 k1,k2,k3 <=35 don't sell
               if  ((k1_240_buffer[1]<=35 && k2_240_buffer[1]<=35 && k3_240_buffer[1]<=35) ||                   
                              //(m15-66) h4 [1]macd �Ȥ���0.00100 �P-0.00100��  �����                                
                   (macdmainline_240_buffer[1]<=0.00100 && macdmainline_240_buffer[1]>=-0.00100 &&
                    macdsignalline_240_buffer[1]<=0.00100 &&  macdsignalline_240_buffer[1]>=-0.00100) ||
                                              
                                    //h4  �b53�U  �}�f�V�W  �������
                   (k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3���V�W,��h4,m30,m60  kd2,kd3�V�W�}�f�j �� k1,k,2,k3�b����
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
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd�t��<=350
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
                                  
                                     //m15 �W�v�u�W�L25�I   [1]���t�ɶ}-��  [1]�����ɦ�-�}
    
      if  ((close_15_buffer[1]-open_15_buffer[1]<=-0.0001 && high_15_buffer[1]-open_15_buffer[1]>=0.0024) ||
          (close_15_buffer[1]-open_15_buffer[1]>=0.0001   && high_15_buffer[1]-close_15_buffer[1]>=0.0024) &&
           high_15_buffer[1]==M15highest40bar  && 
           k1_15_buffer[1]-k1_15_buffer[2]<=0 && k2_15_buffer[1]-k2_15_buffer[2]<=0 && k3_15_buffer[1]-k3_15_buffer[2]<=0   &&
           macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00090 && 
           macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00010) 
                                                 //�׶}�W�L100�I 
           if ((close_15_buffer[2]-open_15_buffer[2]>=0.0100 || close_15_buffer[1]-open_15_buffer[1]>=0.0100 ||
               macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=0.00120 || 
               macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=-0.00050) ||
                                                //�׶}�U�^�ᤧ�ϼu
              (open_15_buffer[3]-open_15_buffer[2]>=-0.0003 && open_15_buffer[4]-open_15_buffer[2]>=-0.0003) ||    
              (open_15_buffer[2]-open_15_buffer[1]>=-0.0003 && open_15_buffer[3]-open_15_buffer[1]>=-0.0003) ||     
               (macdmainline_15_buffer[1]>=-0.00099 && macdmainline_15_buffer[1]<=0.00099 &&
                macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                                        //h4  �b53�U  �}�f�V�W  �������
                   (k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3���V�W,��h4,m30,m60  kd2,kd3�V�W�}�f�j �� k1,k,2,k3�b����
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
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd�t��<=350
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
                             
                                           //h1 [1] �W�v�u�W�L24�I   [1]���t�ɶ}-��  [1]�����ɦ�-�}
    
      if (((close_60_buffer[1]-open_60_buffer[1]<=-0.0001 && close_60_buffer[1]-open_60_buffer[1]<=0.0006  &&
            high_60_buffer[1]-open_60_buffer[1]>=0.0024) ||
           (close_60_buffer[1]-open_60_buffer[1]>=0.0001   && close_60_buffer[1]-open_60_buffer[1]<=0.0006  && 
            high_60_buffer[1]-close_60_buffer[1]>=0.0024) &&
            high_60_buffer[1]==H1highest40bar  && 
            k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 && k3_60_buffer[1]-k3_60_buffer[2]<=0) ||
                                          // [1]<=0 [2] �d�W�v�u
          ((close_60_buffer[1]-open_60_buffer[1]<=-0.0001 && close_60_buffer[1]-open_60_buffer[1]<=0.0006  &&
            high_60_buffer[1]-open_60_buffer[1]>=0.0024) ||
           (close_60_buffer[1]-open_60_buffer[1]>=0.0001   && close_60_buffer[1]-open_60_buffer[1]<=0.0006  && 
            high_60_buffer[1]-close_60_buffer[1]>=0.0024) &&
            high_60_buffer[1]==H1highest40bar  && 
            k1_60_buffer[1]-k1_60_buffer[2]<=5 && k1_60_buffer[1]-d1_60_buffer[1]<=5 && 
            close_60_buffer[1]-open_60_buffer[1]<=0)   &&
          
            macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=0.00200 && 
           macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=-0.00010) 
                                                 //�׶}�W�L100�I 
           if ((close_60_buffer[2]-open_60_buffer[2]>=0.0100 || close_60_buffer[1]-open_60_buffer[1]>=0.0100 ||
               macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=0.00200 || 
               macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=-0.00050) ||
                                                //�׶}�U�^�ᤧ�ϼu
              (open_60_buffer[3]-open_60_buffer[2]>=-0.0003 && open_60_buffer[4]-open_60_buffer[2]>=-0.0003) ||    
              (open_60_buffer[2]-open_60_buffer[1]>=-0.0003 && open_60_buffer[3]-open_60_buffer[1]>=-0.0003) ||     
               (macdmainline_60_buffer[1]>=-0.00099 && macdmainline_60_buffer[1]<=0.00099 &&
                macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                                     //h4  �b53�U  �}�f�V�W  �������
                   (k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3���V�W,��h4,m30,m60  kd2,kd3�V�W�}�f�j �� k1,k,2,k3�b����
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
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd�t��<=350
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
            
                 //(m15-61)       //H4 [2] �d�W�v�u>80�I  [1]<[2]
       if  ((((close_240_buffer[2]-open_240_buffer[2]<=-0.0001 && high_240_buffer[2]-open_240_buffer[2]>=0.0080) ||
            (close_240_buffer[2]-open_240_buffer[2]>=0.0001   && high_240_buffer[2]-close_240_buffer[2]>=0.0080)) &&
             close_240_buffer[1]-open_240_buffer[1]<=-0.0001  && 
                                                          //H4 k1,k2,k3 >=70   || [2]>=0.0250
            ((k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70  &&  k3_240_buffer[1]>=70) || (close_240_buffer[2]-open_240_buffer[2]>=0.0250))) ||
           
               //(m15-66)  [2]�d�W�v�u>35  k1,k2,k3>=60   ma12-ma05<=-0.0005   close[4]||[5]||[6]||[7]||[8]||[9]>close[1]&& [2] 
          (((close_240_buffer[2]-open_240_buffer[2]<=-0.0001 && high_240_buffer[2]-open_240_buffer[2]>=0.0035) ||
            (close_240_buffer[2]-open_240_buffer[2]>=0.0001   && high_240_buffer[2]-close_240_buffer[2]>=0.0035)) &&
           ((close_240_buffer[4]-open_240_buffer[1]>=0 || close_240_buffer[5]-open_240_buffer[1]>=0 ||
             close_240_buffer[6]-open_240_buffer[1]>=0 || close_240_buffer[7]-open_240_buffer[1]>=0 ||
             close_240_buffer[8]-open_240_buffer[1]>=0 || close_240_buffer[9]-open_240_buffer[1]>=0) && 
            (close_240_buffer[4]-close_240_buffer[2]>=0 || close_240_buffer[5]-close_240_buffer[2]>=0 ||
             close_240_buffer[6]-close_240_buffer[2]>=0 || close_240_buffer[7]-close_240_buffer[2]>=0 ||
             close_240_buffer[8]-close_240_buffer[2]>=0 || close_240_buffer[9]-close_240_buffer[2]>=0)) && 
            ((close_240_buffer[1]-open_240_buffer[1]<=-0.0030  && ma12_240_buffer[1]-ma05_240_buffer[2]<=-0.0005 && 
              k1_240_buffer[1]>=60 && k2_240_buffer[1]>=60  &&  k3_240_buffer[1]>=60) || 
            
               //(m15-66)  k1,k2,k3>=75,k2,k3<=-1,d2,d3<=0,kd1,kd2<=-2 macd main && signal[1]-[2]<=-0.00003
             (k2_240_buffer[1]>=75  &&  k3_240_buffer[1]>=75 && k2_240_buffer[1]-k2_240_buffer[2]<=-1 &&
              k3_240_buffer[1]-k3_240_buffer[2]<=-1  &&  d2_240_buffer[1]-d2_240_buffer[2]<=0 &&
              d3_240_buffer[1]-d3_240_buffer[2]<=0 && k2_240_buffer[1]-d2_240_buffer[1]<=-2 &&
              k3_240_buffer[1]-d3_240_buffer[1]<=-2 &&
              macdmainline_240_buffer[1]-macdmainline_240_buffer[2]<=-0.00003 && 
              macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]<=-0.00003))) ||
          
              //(m15-66) H4 [2] �d�W�v�u>70�I [1]>�W�v�u100�I macd�t��[1]<[2]
           (((close_240_buffer[2]-open_240_buffer[2]<=-0.0001 && high_240_buffer[2]-open_240_buffer[2]>=0.0070) ||
            (close_240_buffer[2]-open_240_buffer[2]>=0.0001   && high_240_buffer[2]-close_240_buffer[2]>=0.0070)) &&
            ((close_240_buffer[1]-open_240_buffer[1]<=-0.0001 && high_240_buffer[1]-open_240_buffer[1]>=0.0100) ||
           (close_240_buffer[1]-open_240_buffer[1]>=0.0001   && high_240_buffer[1]-close_240_buffer[1]>=0.0100)) &&
             macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00370 && 
             macdmainline_240_buffer[1]<=-0.00450 && macdsignalline_240_buffer[1]<=-0.00050))  
               if    (k1_240_buffer[1]-d1_240_buffer[1]>=12 &&  (k2_240_buffer[1]-d2_240_buffer[1]>=5 || k3_240_buffer[1]-d3_240_buffer[1]>=5) &&
                      k2_240_buffer[1]<=25 && k3_240_buffer[1]<=25)
                      return;
                      else         
                      OrderClose(OrderTicket(),lots,Ask,1,OrangeRed);    
 
//+++++++++++++++++++++++++++++++++++++++++++CLOSE   BUY   8   ++++++++++++++++++++++++++++++++++++++++++++++++++          
            
         
                      //(m15-62)   h4 �� ma180�פU ��ma180���� ma360 �פU   
        if  (((ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.0001 ||  (ma180_240_buffer[1]-ma180_240_buffer[2]<=0 &&
               ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.0001)) &&
                  // [1]���bma180�U��20�I��  
               close_240_buffer[1]-ma180_240_buffer[1]<=-0.0001  && close_240_buffer[1]-ma180_240_buffer[1]>=-0.0020 &&
                 //h4 [1]�W�v�u�W�L30�I
             ((close_240_buffer[1]-open_240_buffer[1]<=-0.0001 && high_240_buffer[1]-open_240_buffer[1]>=0.0030) ||
              (close_240_buffer[1]-open_240_buffer[1]>=0.0001   && high_240_buffer[1]-close_240_buffer[1]>=0.0030)) &&
             //kd1<=-3      
               k1_240_buffer[1]-d1_240_buffer[1]<=-3 &&
                  // macd�t��<=0.00150  >=-0.00100 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00150 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100 &&
                   // [2]||[3]||[4]���bma180�U��20�I��  
             ((close_240_buffer[2]-ma180_240_buffer[2]<=-0.0001  && close_240_buffer[2]-ma180_240_buffer[2]>=-0.0020) ||
              (close_240_buffer[3]-ma180_240_buffer[3]<=-0.0001  && close_240_buffer[3]-ma180_240_buffer[3]>=-0.0020) ||
              (close_240_buffer[4]-ma180_240_buffer[4]<=-0.0001  && close_240_buffer[4]-ma180_240_buffer[4]>=-0.0020))) ||
            
                  //(m15-66)   h4 �� ma180,ma360,ma650 ����    
              (ma180_240_buffer[1]-ma180_240_buffer[2]<=0.0001 && ma360_240_buffer[1]-ma360_240_buffer[2]<=0.0001 &&
               ma650_240_buffer[1]-ma650_240_buffer[2]<=0.0001 && 
                  // [1]���bma360�U��20�I��  
               close_240_buffer[1]-ma360_240_buffer[1]<=-0.0001  && close_240_buffer[1]-ma360_240_buffer[1]>=-0.0020 &&
                 //h4 [1]�W�v�u�W�L30�I
              ((close_240_buffer[1]-open_240_buffer[1]>=0.0001 && high_240_buffer[1]-close_240_buffer[1]>=0.0030) ||
              (close_240_buffer[1]-open_240_buffer[1]<=-0.0001  && high_240_buffer[1]-open_240_buffer[1]>=0.0030)) &&
                 //kd1<=-3      
               k1_240_buffer[1]-d1_240_buffer[1]<=-3 &&
                   // [2]||[3]||[4]���bma360�U��20�I��  
             ((close_240_buffer[2]-ma360_240_buffer[2]<=0.0005  && close_240_buffer[2]-ma360_240_buffer[2]>=-0.0020) ||
              (close_240_buffer[3]-ma360_240_buffer[3]<=0.0005  && close_240_buffer[3]-ma360_240_buffer[3]>=-0.0020) ||
              (close_240_buffer[4]-ma360_240_buffer[4]<=0.0005  && close_240_buffer[4]-ma360_240_buffer[4]>=-0.0020))))
               if    (k1_240_buffer[1]-d1_240_buffer[1]>=12 &&  (k2_240_buffer[1]-d2_240_buffer[1]>=5 || k3_240_buffer[1]-d3_240_buffer[1]>=5) &&
                      k2_240_buffer[1]<=25 && k3_240_buffer[1]<=25)
                      return;
                      else                 
                      OrderClose(OrderTicket(),lots,Ask,1,OrangeRed);    
    
 //+++++++++++++++++++++++++++++++++++++++++++   CLOSE BUY   9   ++++++++++++++++++++++++++++++++++++++++++++++++++          
 
                          //H4 �� [-4][+3][+2][-1] && [-1]or[+2]���̰� bar���鬰0.0030 
        if   ((close_240_buffer[1]-open_240_buffer[1]<=-0.0030 && close_240_buffer[4]-open_240_buffer[4]<=-0.0010  && 
               close_240_buffer[2]-open_240_buffer[2]>=0.0010 && close_240_buffer[3]-open_240_buffer[3]>=0.0010 &&
                     //(m15-61)  [1]�U�v�u�p��15�I
               low_240_buffer[1]-close_240_buffer[1]<=-0.0015  &&              
                    //(m15-59) kd1,(kd2||kd3)<=3 �}�f�����Y�p
             ((k1_240_buffer[1]-d1_240_buffer[1]<=3  && (k2_240_buffer[1]-d2_240_buffer[1]<=3 || k3_240_buffer[1]-d3_240_buffer[1]<=3)) ||
                  //(m15-61)  macd  �t��<=0.00150  >=-0.00100
              (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00150 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100))  &&
               k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  &&
                   //(m15=58)  h4 ���L������ma05�b10�I��     k1,k2,k3�����b55�W�H�K�w�^�L�Y
               ma05_240_buffer[1]- close_240_buffer[1]>=-0.0015 &&  ma05_240_buffer[1]-ma05_240_buffer[2]<=0 &&
               k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70)  ||   // && 
      //        (high_240_buffer[1]==H4highest40bar ||  high_240_buffer[2]==H4highest40bar)) ||
              
               //H4 �� [-5][+4][+3][+2][-1]  && [-1]or[+2]���̰� bar���鬰0.0010  [1]<=0.0030 
              (close_240_buffer[1]-open_240_buffer[1]<=-0.0030 && close_240_buffer[5]-open_240_buffer[5]<=-0.0010  && 
               close_240_buffer[2]-open_240_buffer[2]>=0.0010 && close_240_buffer[3]-open_240_buffer[3]>=0.0010 &&
               close_240_buffer[4]-open_240_buffer[4]>=0.0010 &&
                        //(m15-61)  [1]�U�v�u�p��15�I
               low_240_buffer[1]-close_240_buffer[1]<=-0.0015  &&            
               k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  &&
                            //(m15-59) kd1,(kd2||kd3)<=3 �}�f�����Y�p
             ((k1_240_buffer[1]-d1_240_buffer[1]<=3  && (k2_240_buffer[1]-d2_240_buffer[1]<=3 || k3_240_buffer[1]-d3_240_buffer[1]<=3)) ||
                  //(m15-61)  macd  �t��<=0.00150  >=-0.00100
              (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00150 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100))  &&
               k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  &&
                   //(m15=58)  h4 ���L������ma05�b10�I��     k1,k2,k3�����b55�W�H�K�w�^�L�Y
               ma05_240_buffer[1]- close_240_buffer[1]>=-0.0015 && ma05_240_buffer[1]-ma05_240_buffer[2]<=0 &&
               k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) || // && 
                             //�bm15���U�����   �U�C�L�k�@��
       //     (high_240_buffer[1]==H4highest40bar ||  high_240_buffer[2]==H4highest40bar || high_240_buffer[3]==H4highest40bar)) ||
             
                   //m15-65)H4 �� [-5][+4][+3][2][-1]   [1]<=0.0015 [2]<=0 [3][4]>=0.0010 [5]<=0.0010 
              (close_240_buffer[1]-open_240_buffer[1]<=-0.0015 && close_240_buffer[5]-open_240_buffer[5]<=-0.0010  && 
                   //(m15-64) [2]���i�ɯ}150�I �ɤӦh���n�^�Y
               close_240_buffer[2]-open_240_buffer[2]>=0 && close_240_buffer[2]-open_240_buffer[2]<=0.0150 &&
               close_240_buffer[3]-open_240_buffer[3]>=0.0010 && close_240_buffer[4]-open_240_buffer[4]>=0.0010 && 
                 //h4 (m15-62)  [2][3][4]���L�p�C��[5]�����L�̦h5�I��
               close_240_buffer[2]-open_240_buffer[5]<=0.0005 &&
               close_240_buffer[3]-open_240_buffer[5]<=0.0005 && 
               close_240_buffer[4]-open_240_buffer[5]<=0.0005 &&
               open_240_buffer[1]-open_240_buffer[5]<=0.0005 && 
                    //(m15-62)   [1]�U�v�u���W�L5�I   k1>=50  k2,k3>=65    kd2,kd3<=-4  
               low_240_buffer[1]-close_240_buffer[1]>=-0.0005  &&  k1_240_buffer[1]>=50 && k2_240_buffer[1]>=65 && k3_240_buffer[1]>=65 && 
               k2_240_buffer[1]-d2_240_buffer[1]<=-4 && k3_240_buffer[1]-d3_240_buffer[1]<=-4) ||
             
            
                //   //(m15-61) H4 �� [-2][-1]   �U�v�u�b10�I��
              (close_240_buffer[1]-open_240_buffer[1]<=-0.0010 && close_240_buffer[2]-open_240_buffer[2]<=-0.0010  && 
                     //  [1][2]�U�v�u�p��10�I
               low_240_buffer[1]-close_240_buffer[1]<=-0.0010  &&  low_240_buffer[2]-close_240_buffer[2]<=-0.0010  &&             
                    //    k,k2,k3<=-1 
               k1_240_buffer[1]-k1_240_buffer[2]<=-1  && k2_240_buffer[1]-k2_240_buffer[2]<=-1 && k3_240_buffer[1]-k3_240_buffer[2]<=-1 &&
                    //   macd  �t��<=0.00100  >=-0.00100
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100  &&
               macdmainline_240_buffer[1]>=0.00350 && 
                      //k1,k2,k3>=85
               k1_240_buffer[1]>=85 && k2_240_buffer[1]>=85 && k3_240_buffer[1]>=85) ||
                    
                             //h4  [4][3][2]>=0.0050 [1]<=-0.0010  ma45[1]-[2]<=-0.0001
              (close_240_buffer[4]-open_240_buffer[4]>=0.0050 && close_240_buffer[3]-open_240_buffer[3]>=0.0050  && 
               close_240_buffer[2]-open_240_buffer[2]>=0.0050 && close_240_buffer[1]-open_240_buffer[1]<=-0.0010 &&
               ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0001) ||
                       //(m15-61) h4  [4]+[3]+[2]>=0.0150 [1]<=-0.0030  [1]-[2]<=0.0010  macd  �t��<=0.00100  >=-0.00100
             (((close_240_buffer[4]-open_240_buffer[4])+(close_240_buffer[3]-open_240_buffer[3])+ 
               (close_240_buffer[2]-open_240_buffer[2])>=0.0150) && close_240_buffer[1]-open_240_buffer[1]<=-0.0030 &&
                close_240_buffer[1]-close_240_buffer[2]<=0.0010 &&
                macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100)) 
               if    ((k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90) ||
                     (k1_240_buffer[1]>=87 && k2_240_buffer[1]>=87  &&  k3_240_buffer[1]>=87) || 
                        //(m15-64) [1]||[2]���i�ɹL150�I �ɤӦh���n�^�Y
                     (close_240_buffer[1]-open_240_buffer[1]>=0.0150 || close_240_buffer[2]-open_240_buffer[2]>=0.0150) ||
                       //(m15-64) [1]||[2]���i�ɹL110�I   kd1[1]||kd1[2]>=20 
                     (close_240_buffer[1]-open_240_buffer[1]>=0.0110 && k1_240_buffer[1]-d1_240_buffer[1]>=20) ||
                     (close_240_buffer[2]-open_240_buffer[2]>=0.0110 && k1_240_buffer[2]-d1_240_buffer[2]>=20) ||
                             // (m15-64)  kd1,kd2,kd3>=15
                     (k1_240_buffer[1]-d1_240_buffer[1]>=15 && k2_240_buffer[1]-d2_240_buffer[1]>=15 && k3_240_buffer[1]-d3_240_buffer[1]>=15) || 
                      //(m15-66)  ma360[1]-[6]>=0.0001   ma05,ma08,ma12>=-0.0015   kd1[1]>=10  macd signal[1]-[2]>=0.00002 
                     (ma360_240_buffer[1]-ma360_240_buffer[6]>=0.0001 && ma05_240_buffer[1]-ma05_240_buffer[2]>=-0.0015 &&
                      ma08_240_buffer[1]-ma08_240_buffer[2]>=-0.0015 && ma12_240_buffer[1]-ma12_240_buffer[2]>=-0.0015 &&
                      k1_240_buffer[1]-d1_240_buffer[1]>=10 && macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]>=0.00002))
                      return;
                      else                                   
                      OrderClose(OrderTicket(),lots,Ask,1,OrangeRed);    
  //+++++++++++++++++++++++++++++++++++++++++++   CLOSE BUY  10   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                        
                                         //h1 [1] ��¶W�L30,50,70,100�I   
                                //100 �I [1]-[2]<=0.0001  [1]-[3]<=0.0001
      if   ((((close_60_buffer[1]-open_60_buffer[1]<=-0.0100 && close_60_buffer[1]-close_60_buffer[2]<=0.0001  &&
            close_60_buffer[1]-close_60_buffer[3]<=0.0001 && 
                               //kd1,kd2,kd3<=0  k1,k2,k3>70 
            k1_60_buffer[1]-d1_60_buffer[1]<=0 && k2_60_buffer[1]-d2_60_buffer[1]<=0 && k3_60_buffer[1]-d3_60_buffer[1]<=0 &&
            k1_60_buffer[1]>=70 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70) ||
                               //75 �I [1]-[2]<=0~~~~[1]-[4]<=0 
           (close_60_buffer[1]-open_60_buffer[1]<=-0.0075 && close_60_buffer[1]-close_60_buffer[2]<=0  &&
            close_60_buffer[1]-close_60_buffer[3]<=0 && close_60_buffer[1]-close_60_buffer[4]<=0  &&
                              //kd1,kd2,kd3<=0 k1,k2,k3>70 
            k1_60_buffer[1]-d1_60_buffer[1]<=0 && k2_60_buffer[1]-d2_60_buffer[1]<=0 && k3_60_buffer[1]-d3_60_buffer[1]<=0 &&
            k1_60_buffer[1]>=70 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70) ||
                              //55 �I [1]-[2][3]<=0,[1]-[6]<=0 
           (close_60_buffer[1]-open_60_buffer[1]<=-0.0055 && close_60_buffer[1]-close_60_buffer[2]<=0  &&
            close_60_buffer[1]-close_60_buffer[3]<=0 && close_60_buffer[1]-close_60_buffer[6]<=0  &&
                              //kd1,kd2,kd3<=0 k1,k2,k3>70 
            k1_60_buffer[1]-d1_60_buffer[1]<=0 && k2_60_buffer[1]-d2_60_buffer[1]<=0 && k3_60_buffer[1]-d3_60_buffer[1]<=0 &&
            k1_60_buffer[1]>=70 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70) ||
                          //30 �I [1]-[2]<=0~~~~~[1]-[8]<=0 
           (close_60_buffer[1]-open_60_buffer[1]<=-0.0030 && close_60_buffer[1]-close_60_buffer[2]<=0  &&
            close_60_buffer[1]-close_60_buffer[3]<=0 && close_60_buffer[1]-close_60_buffer[4]<=0  &&
            close_60_buffer[1]-close_60_buffer[5]<=0 && close_60_buffer[1]-close_60_buffer[6]<=0  &&
            close_60_buffer[1]-close_60_buffer[7]<=0 && close_60_buffer[1]-close_60_buffer[8]<=0  &&
                                  //kd1,kd2,kd3<=-2 k2.k3>=85 
            k1_60_buffer[1]-d1_60_buffer[1]<=-2 && k2_60_buffer[1]-d2_60_buffer[1]<=-2 && k3_60_buffer[1]-d3_60_buffer[1]<=-2 &&
            k1_60_buffer[1]>=70 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70))))
                                    //h4  �b53�U  �}�f�V�W  �������
            if    ((k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3���V�W,��h4,m30,m60  kd2,kd3�V�W�}�f�j �� k1,k,2,k3�b����
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
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd�t��<=350
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

                      //m30 �� [-4][+3][+2][-1]   [1]<=-0.0030 
         if   ((close_30_buffer[1]-open_30_buffer[1]<=-0.0030 && close_30_buffer[4]-open_30_buffer[4]<=-0.0008  && 
               close_30_buffer[2]-open_30_buffer[2]>=0.0008 && close_30_buffer[3]-open_30_buffer[3]>=0.0008 &&
               k2_30_buffer[1]-d2_30_buffer[1]<=-12 && k3_30_buffer[1]-d3_30_buffer[1]<=-12 &&
               k2_30_buffer[1]>=55 && k3_30_buffer[1]>=55) || 
                       //m30 �� [-5][+4][+3][+2][-1]  [1]<=-0.0015  
              (close_30_buffer[1]-open_30_buffer[1]<=-0.0015 && close_30_buffer[5]-open_30_buffer[5]<=-0.0010  && 
               close_30_buffer[2]-open_30_buffer[2]>=0.0010 && close_30_buffer[3]-open_30_buffer[3]>=0.0010 &&
               close_30_buffer[4]-open_30_buffer[4]>=0.0010 &&
               k2_30_buffer[1]-d2_30_buffer[1]<=-10 && k3_30_buffer[1]-d3_30_buffer[1]<=-10 &&
               k2_30_buffer[1]>=70 && k3_30_buffer[1]>=70) || 
  
                  //m60 �� [-4][+3][+2][-1]   [1]<=-0.0030 
              (close_60_buffer[1]-open_60_buffer[1]<=-0.0030 && close_60_buffer[4]-open_60_buffer[4]<=-0.0010  && 
               close_60_buffer[2]-open_60_buffer[2]>=0.0010 && close_60_buffer[3]-open_60_buffer[3]>=0.0010 &&
               k2_60_buffer[1]-d2_60_buffer[1]<=-10 && k3_60_buffer[1]-d3_60_buffer[1]<=-10 &&
               k2_60_buffer[1]>=45 && k3_60_buffer[1]>=45) || 
                        //m60 �� [-4][+3][+2][-1]   [1]<=-0.0020 
              (close_60_buffer[1]-open_60_buffer[1]<=-0.0020 && close_60_buffer[4]-open_60_buffer[4]<=-0.0007  && 
               close_60_buffer[2]-open_60_buffer[2]>=0.0007 && close_60_buffer[3]-open_60_buffer[3]>=0.0007 &&
               k1_60_buffer[1]-d1_60_buffer[1]<=0 && k2_60_buffer[1]-d2_60_buffer[1]<=-5 && k3_60_buffer[1]-d3_60_buffer[1]<=-5 &&
               k2_60_buffer[1]>=80 && k3_60_buffer[1]>=80) || 
                      //m60 �� [_5][+4][+3][+2][-1]  [1]<=-0.0015  
              (close_60_buffer[1]-open_60_buffer[1]<=-0.0015 && close_60_buffer[5]-open_60_buffer[5]<=-0.0007  && 
               close_60_buffer[2]-open_60_buffer[2]>=0.0007 && close_60_buffer[3]-open_60_buffer[3]>=0.0007 &&
               close_60_buffer[4]-open_60_buffer[4]>=0.0007 &&
               k2_60_buffer[1]-d2_60_buffer[1]<=-4 && k3_60_buffer[1]-d3_60_buffer[1]<=-4 &&
               k2_60_buffer[1]>=65 && k3_60_buffer[1]>=65) || 

                        //m60 �� [+5][-4][+3][-2][+1]  [1]<=-0.0015  
              (close_60_buffer[1]-open_60_buffer[1]<=-0.0015 && close_60_buffer[5]-open_60_buffer[5]<=-0.0007  && 
               close_60_buffer[2]-open_60_buffer[2]>=0.0007 && close_60_buffer[3]-open_60_buffer[3]<=-0.0007 &&
               close_60_buffer[4]-open_60_buffer[4]>=0.0007 &&
               k1_60_buffer[1]-k1_60_buffer[2]<=0 &&  k2_60_buffer[1]-k2_60_buffer[2]<=0 && k3_60_buffer[1]-k3_60_buffer[2]<=0 &&
               k2_60_buffer[1]>=80 && k3_60_buffer[1]>=80)) 
                            //h4  �b53�U  �}�f�V�W  ������� 
               if ((k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                               //H4 k1,k2,k3���V�W,��h4,m30,m60  kd2,kd3�V�W�}�f�j �� k1,k,2,k3�b����
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
                            // (m15-57) h4  [1]>=0.0100  [2]>=0.0050  ma05[1]-[2]>=0.0020  k1,k2,k3<=50 || macd�t��<=350
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

                             //m30 [2]�W�v�u�W�L25�I   [2]���t�ɶ}-��  [2]�����ɦ�-�}  
     if  (((close_30_buffer[2]-open_30_buffer[2]<=-0.0001 && high_30_buffer[2]-open_30_buffer[2]>=0.0025) ||
          (close_30_buffer[2]-open_30_buffer[2]>=0.0001  && high_30_buffer[2]-close_30_buffer[2]>=0.0025) &&
          (high_30_buffer[1]==M15highest50bar || high_30_buffer[2]==M15highest50bar) && 
                               //     [1]���t  [1]-[2]<=-0.0001   k1,k2,k3<=0  k1,k2,k3>=80
          (close_30_buffer[1]-open_30_buffer[1]<=-0.0010 && close_30_buffer[1]-close_30_buffer[2]<=-0.0001 &&
           k1_30_buffer[1]-k1_30_buffer[2]<=0 && k2_30_buffer[1]-k2_30_buffer[2]<=0 && k3_30_buffer[1]-k3_30_buffer[2]<=0   &&
           k1_30_buffer[1]>=70 && k2_30_buffer[1]>=70 && k3_30_buffer[1]>=70) ||
             //    [1]���t  [1]-[2]<=-0.0001   k1,(k2||k3)<=0  k1,k2,k3>=70 kd1<=-1
             (close_30_buffer[1]-open_30_buffer[1]<=-0.0001 && close_30_buffer[1]-close_30_buffer[2]<=-0.0001 &&
              k1_30_buffer[1]-k1_30_buffer[2]<=0 && (k2_30_buffer[1]-k2_30_buffer[2]<=0 || k3_30_buffer[1]-k3_30_buffer[2]<=0) &&
              k1_30_buffer[1]-d1_30_buffer[2]<=-1 && 
              k1_30_buffer[1]>=80 && k2_30_buffer[1]>=80 && k3_30_buffer[1]>=80)) ||
                            //m30 [1][2]�W�v�u�W�L25�I   [2]���t�ɶ}-��  [2]�����ɦ�-�}  [1]<=0.0010
         ((close_30_buffer[1]-open_30_buffer[1]<=-0.0001 && high_30_buffer[1]-open_30_buffer[1]>=0.0025) ||
          (close_30_buffer[1]-open_30_buffer[1]>=0.0001   && close_30_buffer[1]-open_30_buffer[1]<=0.0010   && 
          high_30_buffer[1]-close_30_buffer[1]>=0.0025) &&
          (close_30_buffer[2]-open_30_buffer[2]<=-0.0001 && high_30_buffer[2]-open_30_buffer[2]>=0.0025) ||
          (close_30_buffer[2]-open_30_buffer[2]>=0.0001  && high_30_buffer[2]-close_30_buffer[2]>=0.0025) &&
           k1_30_buffer[1]>=70 && k2_30_buffer[1]>=70 && k3_30_buffer[1]>=70 &&
          (high_30_buffer[1]==M15highest50bar || high_30_buffer[2]==M15highest50bar) && 
                               //     [1]���t  [1]-[2]<=-0.0001   k1,k2,k3<=0  k1,k2,k3>=80
           close_30_buffer[1]-open_30_buffer[1]<=-0.0010 && close_30_buffer[1]-close_30_buffer[2]<=-0.0001 &&
           k1_30_buffer[1]-k1_30_buffer[2]<=0 && k2_30_buffer[1]-k2_30_buffer[2]<=0 && k3_30_buffer[1]-k3_30_buffer[2]<=0   &&
           k1_30_buffer[1]>=70 && k2_30_buffer[1]>=70 && k3_30_buffer[1]>=70) ||
                                 // [1]�d�W�v�u�W�L40�I   [2]���t�ɶ}-��  k1,k2,k3<=-1  ,k1,k2,k3>=80
         ((close_30_buffer[1]-open_30_buffer[1]>=0.0001  && high_30_buffer[1]-open_30_buffer[1]<=-0.0040) &&
          high_30_buffer[1]==M15highest50bar &&
          k1_30_buffer[1]-k1_30_buffer[2]<=-1 && k2_30_buffer[1]-k2_30_buffer[2]<=-1 && k3_30_buffer[1]-k3_30_buffer[2]<=-1 &&
          k1_30_buffer[1]>=80 && k2_30_buffer[1]>=80 && k3_30_buffer[1]>=80))             
                   
                 
                 
                            //return  else  �H�U buy 12   buy13  �ۦP �M buy1  ~  buy 11  ���P
                            //return  else  �H�U buy 12   buy13  �ۦP �M buy1  ~  buy 11  ���P
             
              if  ((k2_60_buffer[1]-d2_60_buffer[1]>=25  &&  k3_60_buffer[1]-d3_60_buffer[1]>=25) ||
                   (k1_60_buffer[1]-d1_60_buffer[1]>=10  && k2_60_buffer[1]-d2_60_buffer[1]>=10  &&  k3_60_buffer[1]-d3_60_buffer[1]>=10) ||                                   //h4  k2,k3 �b47�W  �}�f�V�U  �����R�� 
                   (k2_60_buffer[1]-d2_60_buffer[1]>=19  &&  k3_60_buffer[1]-d3_60_buffer[1]>=19 && 
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0010  &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0008) ||
                        //h1 [1]>=0.0120  h4   ma05,ma08,ma12>=0.0025
                    (close_60_buffer[1]-open_60_buffer[1]>=0.0120 && ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0025  &&  
                     ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0025  &&  ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0025) ||
                                //h4  �b53�U  �}�f�V�W  �������
                   (k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]<=45 && k3_240_buffer[1]>=45 &&  k1_240_buffer[1]-k1_240_buffer[1]>=10  &&
                   (k2_240_buffer[1]-k2_240_buffer[1]>=10 || k3_240_buffer[1]-k3_240_buffer[1]>=10)) ||
                          //(m15-57)h4  [1]�ɹL140�I
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0140) ||
                       //(m15-59) h4  ma45,ma90,ma180�䤤���G[1]-[2]>=0    [1]>=0.0100
                  ((ma45_240_buffer[1]-ma45_240_buffer[2]>=0 || ma90_240_buffer[1]-ma90_240_buffer[2]>=0) &&
                   (ma90_240_buffer[1]-ma90_240_buffer[2]>=0 || ma180_240_buffer[1]-ma180_240_buffer[2]>=0) &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0100) ||  
                          //(m15-59) h4 k1||k2||k3 <=35 don't sell
                   (k1_240_buffer[1]<=35 || k2_240_buffer[1]<=35 || k3_240_buffer[1]<=35) ||                   

                    //(m15-577)h4  ma45[1][2]>=0.0007  ma90[1][2]>=0.0004  ma45||ma90([1]-[2])-[2]-[3])>=0.0001 ma45,ma90���Z>=-0.0400 <=0.0035
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0007  &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0004 &&
                  ((ma45_240_buffer[1]-ma45_240_buffer[2])-(ma45_240_buffer[2]-ma45_240_buffer[3])>=0.0001  ||
                   (ma90_240_buffer[1]-ma90_240_buffer[2])-(ma90_240_buffer[2]-ma90_240_buffer[3])>=0.0001) &&
                           //(m15-58)   ma45�bma90 �W�����Z>=-0.0350 <=0.0010
                    ma45_240_buffer[1]-ma90_240_buffer[1]>=-0.0350 && ma45_240_buffer[1]-ma90_240_buffer[1]<=0.0010) ||
                          //(m15-58)h4  kd1+kd2+kd3>=49 kd1,kd2,kd3>=7
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=49 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=7 && k2_240_buffer[1]-d2_240_buffer[1]>=7 && k3_240_buffer[1]-d3_240_buffer[1]>=7) ||
                          //(m15-58)h4  kd1+kd2+kd3>=45 kd1,kd2,kd3>=12
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=45 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=12 && k2_240_buffer[1]-d2_240_buffer[1]>=12 && k3_240_buffer[1]-d3_240_buffer[1]>=12) ||
                
                              //(m15-57)h4  [1]�ɹL100�I  ma45>=0.0015  || [0]>=0.0150
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

                                     //H4 k1,k2,k3���V�W,��h4,m30,m60  kd2,kd3�V�W�}�f�j �� k1,k,2,k3�b����
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=2 && 
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=25  &&  k3_240_buffer[1]-d3_240_buffer[1]>=25  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                    k2_240_buffer[0]<=60 && k3_240_buffer[1]<=60  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]>=10  && k2_240_buffer[1]-d2_240_buffer[1]>=10  &&
                    k3_240_buffer[1]-d3_240_buffer[1]>=10  && k2_240_buffer[0]<=30 && k3_240_buffer[1]<=30  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                       (k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30  && 
                    k1_240_buffer[1]-k1_240_buffer[2]>=0 &&  k2_240_buffer[1]-k2_240_buffer[2]>=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]>=0 &&  close_240_buffer[1]-open_240_buffer[1]>=0.0001  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                                  //34�� �����34���������ʧ@
                   (OrderType()==OP_SELL && TimeCurrent()-OrderCloseTime()<=2000))
                    return;
                    else                                     
 
                   OrderClose(OrderTicket(),lots,Ask,1,Gold);    

  //+++++++++++++++++++++++++++++++++++++++++++   CLOSE BUY  13   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                        //h1 [2]�W�v�u�W�L27�I   [2]���t�ɶ}-��  [2]�����ɦ�-�}  
     if  (((close_60_buffer[2]-open_60_buffer[2]<=-0.0001 && high_60_buffer[2]-open_60_buffer[2]>=0.0025) ||
          (close_60_buffer[2]-open_60_buffer[2]>=0.0001   && high_60_buffer[2]-close_60_buffer[2]>=0.0025) &&
          (high_60_buffer[1]==M15highest70bar || high_60_buffer[2]==M15highest70bar) && 
                               //     [1]���t  [1]-[2]<=-0.0001   k1,k2,k3<=0  k1,k2,k3>=80
          (close_60_buffer[1]-open_60_buffer[1]<=-0.0010 && close_60_buffer[1]-close_60_buffer[2]<=-0.0001 &&
           k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 && k3_60_buffer[1]-k3_60_buffer[2]<=0   &&
           k1_60_buffer[1]>=70 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70) ||
          //    [1]���t  [1]-[2]<=-0.0001   k1,(k2||k3)<=0  k1,k2,k3>=70 kd1<=-1
             (close_60_buffer[1]-open_60_buffer[1]<=-0.0001 && close_60_buffer[1]-close_60_buffer[2]<=-0.0001 &&
              k1_60_buffer[1]-k1_60_buffer[2]<=0 && (k2_60_buffer[1]-k2_60_buffer[2]<=0 || k3_60_buffer[1]-k3_60_buffer[2]<=0) &&
              k1_60_buffer[1]-d1_60_buffer[2]<=-1 && 
              k1_60_buffer[1]>=80 && k2_60_buffer[1]>=80 && k3_60_buffer[1]>=80)) ||
                             //h1 [1],[2]�W�v�u�W�L24�I   [2]���t�ɶ}-��  [2]�����ɦ�-�}  
         ((close_60_buffer[1]-open_60_buffer[1]<=-0.0001 && high_60_buffer[1]-open_60_buffer[1]>=0.0024) ||
          (close_60_buffer[1]-open_60_buffer[1]>=0.0001   && close_30_buffer[1]-open_30_buffer[1]<=0.0010   && 
           high_60_buffer[1]-close_60_buffer[1]>=0.0024) &&
          (close_60_buffer[2]-open_60_buffer[2]<=-0.0001 && high_60_buffer[2]-open_60_buffer[2]>=0.0024) ||
          (close_60_buffer[2]-open_60_buffer[2]>=0.0001   && high_60_buffer[2]-close_60_buffer[2]>=0.0024) &&
           k1_60_buffer[1]>=80 && k2_60_buffer[1]>=80 && k3_60_buffer[1]>=80 &&
          (high_60_buffer[1]==M15highest70bar || high_60_buffer[2]==M15highest70bar)) ||
                                 // [1]�d�W�v�u�W�L40�I   [2]���t�ɶ}-��  k1,k2,k3<=-1  ,k1,k2,k3>=80
         ((close_60_buffer[1]-open_60_buffer[1]>=0.0001  && high_60_buffer[1]-open_60_buffer[1]<=-0.0040) &&
          high_60_buffer[1]==M15highest70bar &&
          k1_60_buffer[1]-k1_60_buffer[2]<=-1 && k2_60_buffer[1]-k2_60_buffer[2]<=-1 && k3_60_buffer[1]-k3_60_buffer[2]<=-1 &&
          k1_60_buffer[1]>=80 && k2_60_buffer[1]>=80 && k3_60_buffer[1]>=80))                
                    
                 
                            //return  else  �H�U buy 12   buy13  �ۦP �M buy1  ~  buy 11  ���P
                            //return  else  �H�U buy 12   buy13  �ۦP �M buy1  ~  buy 11  ���P
             
              if  ((k2_60_buffer[1]-d2_60_buffer[1]>=25  &&  k3_60_buffer[1]-d3_60_buffer[1]>=25) ||
                   (k1_60_buffer[1]-d1_60_buffer[1]>=10  && k2_60_buffer[1]-d2_60_buffer[1]>=10  &&  k3_60_buffer[1]-d3_60_buffer[1]>=10) ||                                   //h4  k2,k3 �b47�W  �}�f�V�U  �����R�� 
                   (k2_60_buffer[1]-d2_60_buffer[1]>=19  &&  k3_60_buffer[1]-d3_60_buffer[1]>=19 && 
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0010  &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0008) ||
                        //h1 [1]>=0.0120  h4   ma05,ma08,ma12>=0.0025
                    (close_60_buffer[1]-open_60_buffer[1]>=0.0120 && ma05_240_buffer[1]-ma05_240_buffer[2]>=0.0025  &&  
                     ma08_240_buffer[1]-ma08_240_buffer[2]>=0.0025  &&  ma12_240_buffer[1]-ma12_240_buffer[2]>=0.0025) ||
                                //h4  �b53�U  �}�f�V�W  �������
                   (k2_240_buffer[1]<=53 && k3_240_buffer[1]<=53 &&   
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]<=106 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=0 && k3_240_buffer[1]-d3_240_buffer[1]>=0) || 
                   (k2_240_buffer[1]<=45 && k3_240_buffer[1]>=45 &&  k1_240_buffer[1]-k1_240_buffer[1]>=10  &&
                   (k2_240_buffer[1]-k2_240_buffer[1]>=10 || k3_240_buffer[1]-k3_240_buffer[1]>=10)) ||
                          //(m15-57)h4  [1]�ɹL140�I
                   (close_240_buffer[1]-open_240_buffer[1]>=0.0140) ||
                       //(m15-59) h4  ma45,ma90,ma180�䤤���G[1]-[2]>=0    [1]>=0.0100
                  ((ma45_240_buffer[1]-ma45_240_buffer[2]>=0 || ma90_240_buffer[1]-ma90_240_buffer[2]>=0) &&
                   (ma90_240_buffer[1]-ma90_240_buffer[2]>=0 || ma180_240_buffer[1]-ma180_240_buffer[2]>=0) &&
                    close_240_buffer[1]-open_240_buffer[1]>=0.0100) ||  
                          //(m15-59) h4 k1||k2||k3 <=35 don't sell
                   (k1_240_buffer[1]<=35 || k2_240_buffer[1]<=35 || k3_240_buffer[1]<=35) ||                   

                    //(m15-577)h4  ma45[1][2]>=0.0007  ma90[1][2]>=0.0004  ma45||ma90([1]-[2])-[2]-[3])>=0.0001 ma45,ma90���Z>=-0.0400 <=0.0035
                   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0007  &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0004 &&
                  ((ma45_240_buffer[1]-ma45_240_buffer[2])-(ma45_240_buffer[2]-ma45_240_buffer[3])>=0.0001  ||
                   (ma90_240_buffer[1]-ma90_240_buffer[2])-(ma90_240_buffer[2]-ma90_240_buffer[3])>=0.0001) &&
                           //(m15-58)   ma45�bma90 �W�����Z>=-0.0350 <=0.0010
                    ma45_240_buffer[1]-ma90_240_buffer[1]>=-0.0350 && ma45_240_buffer[1]-ma90_240_buffer[1]<=0.0010) ||
                          //(m15-58)h4  kd1+kd2+kd3>=49 kd1,kd2,kd3>=7
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=49 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=7 && k2_240_buffer[1]-d2_240_buffer[1]>=7 && k3_240_buffer[1]-d3_240_buffer[1]>=7) ||
                          //(m15-58)h4  kd1+kd2+kd3>=45 kd1,kd2,kd3>=12
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])>=45 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=12 && k2_240_buffer[1]-d2_240_buffer[1]>=12 && k3_240_buffer[1]-d3_240_buffer[1]>=12) ||
                
                              //(m15-57)h4  [1]�ɹL100�I  ma45>=0.0015  || [0]>=0.0150
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

                                     //H4 k1,k2,k3���V�W,��h4,m30,m60  kd2,kd3�V�W�}�f�j �� k1,k,2,k3�b����
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]>=2 && 
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=19  &&  k3_240_buffer[1]-d3_240_buffer[1]>=19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00300  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=25  &&  k3_240_buffer[1]-d3_240_buffer[1]>=25  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]>=15  &&  k3_240_buffer[1]-d3_240_buffer[1]>=15 &&
                    k2_240_buffer[0]<=60 && k3_240_buffer[1]<=60  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]>=10  && k2_240_buffer[1]-d2_240_buffer[1]>=10  &&
                    k3_240_buffer[1]-d3_240_buffer[1]>=10  && k2_240_buffer[0]<=30 && k3_240_buffer[1]<=30  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                       (k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30  && 
                    k1_240_buffer[1]-k1_240_buffer[2]>=0 &&  k2_240_buffer[1]-k2_240_buffer[2]>=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]>=0 &&  close_240_buffer[1]-open_240_buffer[1]>=0.0001  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k1_240_buffer[1]>=85 && k2_240_buffer[1]>=90  &&  k3_240_buffer[1]>=90  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                   (k1_240_buffer[1]>=86 && k2_240_buffer[1]>=86  &&  k3_240_buffer[1]>=86  &&
                     //h4 ma45 [1]-[2]>=0 &&  ma45 [1]-[2]<=0.0014 �϶��~���\�����
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma45_240_buffer[1]-ma45_240_buffer[2]<=0.0014) ||
                                  //34�� �����34���������ʧ@
                   (OrderType()==OP_SELL && TimeCurrent()-OrderCloseTime()<=2000))
                    return;
                    else                                     
                   OrderClose(OrderTicket(),lots,Ask,1,Gold);    
  
  //+++++++++++++++++++++++++++++++++++++++++++   CLOSE BUY  14   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                 //(m15-62) h1    macd>=0.00870   �t�Ȧb-50,+50��         �o�ͪ����v���h�ҥH���ϥΪ��p�ư��k
        if    (macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=0.00040 && macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=-0.00040 &&
               macdmainline_60_buffer[1]>=0.00870 &&
                    //k1,k2,k3  [1]-[2]<=0   k1,k2,k3>=70 || ma180 ,ma360�פU
               k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 && 
               k3_60_buffer[1]-k3_60_buffer[2]<=0 && 
             ((k1_60_buffer[1]>=70 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70) || (ma180_60_buffer[1]-ma180_60_buffer[2]<=-0.0001 &&
               ma360_60_buffer[1]-ma360_60_buffer[2]<=-0.0001)))
                          //ma45  ,ma90,ma180,ma360  �פW
               if   (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0011 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0008 &&
                     ma180_240_buffer[1]-ma180_240_buffer[2]>=0.0004 && ma360_240_buffer[1]-ma360_240_buffer[2]>=0.0001)
                     return;
                     else 
                     OrderClose(OrderTicket(),lots,Ask,1,Sienna);    
              
  //+++++++++++++++++++++++++++++++++++++++++++   CLOSE BUY  15   ++++++++++++++++++++++++++++++++++++++++++++++++++          

     
                 //(m15-63)  H4     [2][3]����<9�I     [1]����  �d�W�v�u>30�I   
       if    (close_240_buffer[1]-open_240_buffer[1]<=-0.0010 && high_240_buffer[1]-open_240_buffer[1]>=0.0030 &&
              close_240_buffer[2]-open_240_buffer[2]>=0.0009  && close_240_buffer[3]-open_240_buffer[3]>=0.0009  &&   
               // ma45 ma90 || ma90 ma180  �פU�B�j
            ((ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0008 &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002) ||
             (ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0006 &&  ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.0002)) &&
                // [1]���L�bma05���U  ���W�L15�I
              close_240_buffer[1]-ma05_240_buffer[1]<=-0.0001  && close_240_buffer[1]-ma05_240_buffer[1]>=-0.0015) 
              // (m15-66) kd2,kd3[1]-[2]>=7    k2,k2<=30 
              if    (k1_240_buffer[1]-d1_240_buffer[1]>=7 && k2_240_buffer[1]-d2_240_buffer[1]>=7 && k3_240_buffer[1]-d3_240_buffer[1]>=7 &&
                     k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30)
                     return;
                     else
                  
              OrderClose(OrderTicket(),lots,Ask,1,Sienna);    
  //+++++++++++++++++++++++++++++++++++++++++++   CLOSE BUY  16   ++++++++++++++++++++++++++++++++++++++++++++++++++          
              
                   //(m15-65)   h4 �� ma650�פU             ma360�פU�u�u
         if   (ma650_240_buffer[1]-ma650_240_buffer[2]<0 &&
                  //h4 [1]�����bma360���W�����W�L25�I
             ((close_240_buffer[1]-open_240_buffer[1]>=0.0001 && close_240_buffer[1]-ma360_240_buffer[1]>=0.0001 &&
               close_240_buffer[1]-ma360_240_buffer[1]<=0.0025) ||
                 //h4 [1]���t�B�bma360���U�����W�L25�I ��[2]�W�v�u�j��25�I
              (close_240_buffer[1]-open_240_buffer[1]<=-0.0001 && close_240_buffer[1]-ma360_240_buffer[1]>=0.0001 &&
               close_240_buffer[1]-ma360_240_buffer[1]<=0.0025 && high_240_buffer[2]-close_240_buffer[2]>=0.0025)) &&
                 //k2,k3[1]-[2]<=0    k2,k2>=70  k1[1]-[2]<0 || [1]�W�v�u�j��25�I
               k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
               k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70 &&
              (k1_240_buffer[1]-k1_240_buffer[2]<=0 ||  high_240_buffer[1]-close_240_buffer[1]>=0.0025) &&  
                  // macd�t��<=0.00150  >=-0.00100 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00150 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100 && 
              // [2]||[3]||[4]||[5]���bma360�U��25�I��  
             ((close_240_buffer[2]-ma360_240_buffer[2]<=-0.0001  && close_240_buffer[2]-ma360_240_buffer[2]>=-0.0025) ||
              (close_240_buffer[3]-ma360_240_buffer[3]<=-0.0001  && close_240_buffer[3]-ma360_240_buffer[3]>=-0.0025) ||
              (close_240_buffer[4]-ma360_240_buffer[4]<=-0.0001  && close_240_buffer[4]-ma360_240_buffer[4]>=-0.0025) ||
              (close_240_buffer[5]-ma360_240_buffer[5]<=-0.0001  && close_240_buffer[5]-ma360_240_buffer[5]>=-0.0025)))
           
              OrderClose(OrderTicket(),lots,Ask,1,Khaki);    
  //+++++++++++++++++++++++++++++++++++++++++++   CLOSE BUY  17   ++++++++++++++++++++++++++++++++++++++++++++++++++          
              
                   //(m15-65)   h4 �� ma650�פU          ma180�פU�u�u
         if   (ma650_240_buffer[1]-ma650_240_buffer[2]<-0.0001 &&
                  //h4 [1]�����B�bma180���W�����W�L25�I
             ((close_240_buffer[1]-open_240_buffer[1]>=0.0001 && close_240_buffer[1]-ma180_240_buffer[1]>=0.0001 &&
               close_240_buffer[1]-ma180_240_buffer[1]<=0.0025) ||
                 //h4 [1]���t�B�bma180���U�����W�L25�I ��[2]�W�v�u�j��25�I
              (close_240_buffer[1]-open_240_buffer[1]<=-0.0001 && close_240_buffer[1]-ma180_240_buffer[1]>=0.0001 &&
               close_240_buffer[1]-ma180_240_buffer[1]<=0.0025 && high_240_buffer[2]-close_240_buffer[2]>=0.0025)) &&
                 //k2,k3[1]-[2]<=0 ||kd2,kd3<=1   k2,k2>=70  k1[1]-[2]<=0 || [1]�W�v�u�j��25�I
             ((k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0) ||
              (k2_240_buffer[1]-d2_240_buffer[2]<=-1 && k3_240_buffer[1]-d3_240_buffer[2]<=-1)) &&
               k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70 &&
              (k1_240_buffer[1]-k1_240_buffer[2]<=0 ||  high_240_buffer[1]-close_240_buffer[1]>=0.0025) &&  
                  // macd�t��<=0.00150  >=-0.00100 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00150 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100 && 
              // [2]||[3]||[4]||[5]���bma180�U��25�I��  
             ((close_240_buffer[2]-ma180_240_buffer[2]<=-0.0001  && close_240_buffer[2]-ma180_240_buffer[2]>=-0.0025) ||
              (close_240_buffer[3]-ma180_240_buffer[3]<=-0.0001  && close_240_buffer[3]-ma180_240_buffer[3]>=-0.0025) ||
              (close_240_buffer[4]-ma180_240_buffer[4]<=-0.0001  && close_240_buffer[4]-ma180_240_buffer[4]>=-0.0025) ||
              (close_240_buffer[5]-ma180_240_buffer[5]<=-0.0001  && close_240_buffer[5]-ma180_240_buffer[5]>=-0.0025)))
          
              OrderClose(OrderTicket(),lots,Ask,1,Khaki);    
                    
  //+++++++++++++++++++++++++++++++++++++++++++   CLOSE BUY  18   ++++++++++++++++++++++++++++++++++++++++++++++++++          
         
               //(m15-65)  ma45�פU  ma90�����αפW   ma180,ma360,ma650�פW  ���bma45���W�w�[�Ӥɤ��W��[1]�d�W�v�u>25�I�B����                      
      if      (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=0 &&       
                 // macd�t��<=0.00150  >=-0.00100 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00150 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100 && 
                   //   k1,k2,k3<=0  k2,k2>=70            
               k1_240_buffer[1]-k1_240_buffer[2]<=0 && k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
               k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70 &&
                 //h4 [1]���t�W�v�u�j��25�I
               close_240_buffer[1]-open_240_buffer[1]<=-0.0001 &&  high_240_buffer[1]-close_240_buffer[1]>=0.0025 &&
                  // [1],[2],[3],[4],[5],[6],[7] ���bma45�W��25�I�� ���U5�I�� 
               close_240_buffer[1]-ma45_240_buffer[1]<=0.0025  && close_240_buffer[1]-ma180_240_buffer[1]>=-0.0005 &&
               close_240_buffer[2]-ma45_240_buffer[2]<=0.0025  && close_240_buffer[2]-ma180_240_buffer[2]>=-0.0005 &&
               close_240_buffer[3]-ma45_240_buffer[3]<=0.0025  && close_240_buffer[3]-ma180_240_buffer[3]>=-0.0005 &&
               close_240_buffer[4]-ma45_240_buffer[4]<=0.0025  && close_240_buffer[4]-ma180_240_buffer[4]>=-0.0005 &&
               close_240_buffer[5]-ma45_240_buffer[5]<=0.0025  && close_240_buffer[5]-ma180_240_buffer[5]>=-0.0005 &&
               close_240_buffer[6]-ma45_240_buffer[6]<=0.0025  && close_240_buffer[6]-ma180_240_buffer[6]>=-0.0005)
               OrderClose(OrderTicket(),lots,Ask,1,Khaki);    
            
  //+++++++++++++++++++++++++++++++++++++++++++   CLOSE BUY  19   ++++++++++++++++++++++++++++++++++++++++++++++++++          
 
          
                //(m15-65) h4  ����@�q�ɶ������W�h  ma �ҤW�ɦ��e�{�������
       if     (ma05_240_buffer[1]-ma05_240_buffer[10]>=0  &&  ma05_240_buffer[1]-ma05_240_buffer[10]<=0.0010 &&
               ma45_240_buffer[1]-ma45_240_buffer[10]>=0  &&  ma45_240_buffer[1]-ma45_240_buffer[10]<=0.0045 &&
               ma90_240_buffer[1]-ma90_240_buffer[10]>=0  &&  ma90_240_buffer[1]-ma90_240_buffer[10]<=0.0025 &&   
               ma180_240_buffer[1]-ma180_240_buffer[10]>=0  &&  ma180_240_buffer[1]-ma180_240_buffer[10]<=0.0025 &&
               ma360_240_buffer[1]-ma360_240_buffer[10]>=0  &&  ma360_240_buffer[1]-ma360_240_buffer[10]<=0.0025 &&
               ma650_240_buffer[1]-ma650_240_buffer[10]>=0  &&  ma650_240_buffer[1]-ma650_240_buffer[10]<=0.0025 &&
                // [1]~[6] macd�t��<=0.0050  >=-0.0050 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00050 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00050 && 
               macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]<=0.00050 &&  macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]>=-0.00050 && 
               macdmainline_240_buffer[3]-macdsignalline_240_buffer[3]<=0.00050 &&  macdmainline_240_buffer[3]-macdsignalline_240_buffer[3]>=-0.00050 && 
               macdmainline_240_buffer[4]-macdsignalline_240_buffer[4]<=0.00050 &&  macdmainline_240_buffer[4]-macdsignalline_240_buffer[4]>=-0.00050 && 
               macdmainline_240_buffer[5]-macdsignalline_240_buffer[5]<=0.00050 &&  macdmainline_240_buffer[5]-macdsignalline_240_buffer[5]>=-0.00050 && 
               macdmainline_240_buffer[6]-macdsignalline_240_buffer[6]<=0.00050 &&  macdmainline_240_buffer[6]-macdsignalline_240_buffer[6]>=-0.00050)// && 
                    //(m15-66)  k2,k3>=0  kd1>=18  ma45 �פW
               if ((k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0001  &&
                       //(m15-67)  k2,k3 ���פU����W��  exit
                    ((k2_240_buffer[4]-k2_240_buffer[5]<=-3 && k3_240_buffer[4]-k3_240_buffer[5]<=-3) ||
                    (k2_240_buffer[5]-k2_240_buffer[6]<=-3 && k3_240_buffer[5]-k3_240_buffer[6]<=-3)) &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=18) ||
                      //(m15-67) h4 [1]macd �Ȥ���0.00120 �P-0.00120��  �����                                
                   (macdmainline_240_buffer[1]<=0.00120 && macdmainline_240_buffer[1]>=-0.00120 &&
                    macdsignalline_240_buffer[1]<=0.00120 &&  macdsignalline_240_buffer[1]>=-0.00120))
                    return;
                    else
                    OrderClose(OrderTicket(),lots,Ask,1,Khaki);    
  //+++++++++++++++++++++++++++++++++++++++++++   CLOSE BUY  20   ++++++++++++++++++++++++++++++++++++++++++++++++++          
       
         //(m15-66)  ma650,�פU [1]<=-0.0050   ma90���U  ma45�bma650���W50�I,�B�פU���j    ma90�bma45���W50�I 
        if     (ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.0002  && close_240_buffer[1]-open_240_buffer[1]<=-0.0050 &&
                ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0007  && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0002 &&
                ma45_240_buffer[1]-ma650_240_buffer[1]>=0.0050  && ma90_240_buffer[1]-ma45_240_buffer[1]>=0.0050  && 
                    //   kd1,kd2,kd3<=-4  k2,k3>=65            
                k1_240_buffer[1]-d1_240_buffer[1]<=-4 && k2_240_buffer[1]-d2_240_buffer[1]<=-4 && k3_240_buffer[1]-d3_240_buffer[1]<=-4 &&
                k2_240_buffer[1]>=65 && k3_240_buffer[1]>=65)
               OrderClose(OrderTicket(),lots,Ask,1,Khaki);    
  //+++++++++++++++++++++++++++++++++++++++++++   CLOSE BUY  21   ++++++++++++++++++++++++++++++++++++++++++++++++++          
  
                //(m15-66)   h4 �� ma180,ma360,ma650 �פU ��ma180���� ma360 �פU   
        if   ((ma180_240_buffer[1]-ma180_240_buffer[2]<=0.0001 && ma360_240_buffer[1]-ma360_240_buffer[2]<=0.0001 &&
               ma650_240_buffer[1]-ma650_240_buffer[2]<=0.0001 &&
                  //  macd<=0.00110  >=0.00110   main && signal <=-0.00015   
               macdmainline_240_buffer[1]-macdmainline_240_buffer[2]<=-0.00015 && 
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]<=-0.00015 &&
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00110 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00110 &&
                     //   kd2,kd3<=-3  k2,k3>=65     close[4]||[5]||[6]||[7]<close[1]&& [2] �tw���ʽ�         
               k2_240_buffer[1]-d2_240_buffer[1]<=-3 && k3_240_buffer[1]-d3_240_buffer[1]<=-3 &&
              (close_240_buffer[4]-open_240_buffer[1]>=0 || close_240_buffer[5]-open_240_buffer[1]>=0 ||
               close_240_buffer[6]-open_240_buffer[1]>=0 || close_240_buffer[7]-open_240_buffer[1]>=0 || 
               close_240_buffer[8]-open_240_buffer[1]>=0 || close_240_buffer[9]-open_240_buffer[1]>=0) && 
              (close_240_buffer[4]-close_240_buffer[2]>=0 || close_240_buffer[5]-close_240_buffer[2]>=0 ||
               close_240_buffer[6]-close_240_buffer[2]>=0 || close_240_buffer[7]-close_240_buffer[2]>=0 || 
               close_240_buffer[8]-close_240_buffer[2]>=0 || close_240_buffer[9]-close_240_buffer[2]>=0) && 
               k2_240_buffer[1]>=65 && k3_240_buffer[1]>=65) ||
             
                  //(m15-66)   h4 �� ma180,ma360,ma650 �פU ��ma180���� ma360 �פU   
              (ma180_240_buffer[1]-ma180_240_buffer[2]<=0.0001 && ma360_240_buffer[1]-ma360_240_buffer[2]<=0.0001 &&
               ma650_240_buffer[1]-ma650_240_buffer[2]<=0.0001 &&
                  //  macd>=-0.00110  <=0.00110   main && signal <=-0.00015   
               macdmainline_240_buffer[1]-macdmainline_240_buffer[2]<=-0.00015 && 
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]<=-0.00015 &&
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00110 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00110 &&
                     //   kd2,kd3<=-3  k2,k3>=65     close[4]||[5]||[6]||[7]<close[1]&& [2] �tM�Y�ʽ�         
               k2_240_buffer[1]-d2_240_buffer[1]<=-3 && k3_240_buffer[1]-d3_240_buffer[1]<=-3 &&
              (close_240_buffer[4]-open_240_buffer[1]>=0 || close_240_buffer[5]-open_240_buffer[1]>=0 ||
               close_240_buffer[6]-open_240_buffer[1]>=0 || close_240_buffer[7]-open_240_buffer[1]>=0 || 
               close_240_buffer[8]-open_240_buffer[1]>=0 || close_240_buffer[9]-open_240_buffer[1]>=0) && 
              (close_240_buffer[4]-close_240_buffer[2]>=0 || close_240_buffer[5]-close_240_buffer[2]>=0 ||
               close_240_buffer[6]-close_240_buffer[2]>=0 || close_240_buffer[7]-close_240_buffer[2]>=0 || 
               close_240_buffer[8]-close_240_buffer[2]>=0 || close_240_buffer[9]-close_240_buffer[2]>=0) && 
               k2_240_buffer[1]>=65 && k3_240_buffer[1]>=65) ||
              //(m15-67)   h4 �� ma360, ma650 �פU   ma05||ma08||ma12<=0.0001 
              (ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.0001 && ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.0001 &&
              (ma05_240_buffer[1]-ma05_240_buffer[2]<=0.0001 || ma08_240_buffer[1]-ma08_240_buffer[2]<=0.0001 ||
               ma12_240_buffer[1]-ma12_240_buffer[2]<=0.0001) &&
                  //ma45,ma90�w�����  [1]-[6]<=0.0003
               ma45_240_buffer[1]-ma45_240_buffer[6]<=0.0003 && ma90_240_buffer[1]-ma90_240_buffer[6]<=0.0003 &&
                // [1]�W�v�j��30�I          [2]||[3]����  
              (close_240_buffer[1]-open_240_buffer[1]<=-0.0001  && high_240_buffer[1]-close_240_buffer[1]>=0.0030)  ||
               close_240_buffer[1]-open_240_buffer[1]>=0.0001  && high_240_buffer[1]-open_240_buffer[1]>=0.0030)  &&
              (close_240_buffer[2]-open_240_buffer[2]>=0.0001 || close_240_buffer[3]-open_240_buffer[3]>=0.0001)  && 
                   //   [5]||[6]||[7]||[8]���}�L���b[1]���W   �U�^��W���d�W�v�u         
              (close_240_buffer[5]-close_240_buffer[1]>=0 || close_240_buffer[6]-close_240_buffer[1]>=0 ||
               close_240_buffer[7]-close_240_buffer[1]>=0 || close_240_buffer[8]-close_240_buffer[1]>=0 ||
               close_240_buffer[9]-close_240_buffer[1]>=0 || close_240_buffer[10]-close_240_buffer[1]>=0) &&                 //kd2,kd3>=7     
               k2_240_buffer[1]-d2_240_buffer[1]<=-3 &&  k3_240_buffer[1]-d3_240_buffer[1]<=-3)
               if  (TimeCurrent()-OrderCloseTime()<=1000)
                    return;
                    else 
               OrderClose(OrderTicket(),lots,Ask,1,Khaki);    
 
  
  //+++++++++++++++++++++++++++++++++++++++++++   CLOSE BUY  22   ++++++++++++++++++++++++++++++++++++++++++++++++++          

           //����^�^��ma180��A�ϼu��ma45�ᤣ���F
                //(m15-67)   h4 �� ma45�פU ma90���� ma180 �פW  �W��U�ƦC  ma45,ma90,ma180   
        if    (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0002 && ma90_240_buffer[1]-ma90_240_buffer[2]<=0.0001 &&
               ma180_240_buffer[1]-ma180_240_buffer[2]>=0.0001 && ma45_240_buffer[1]-ma90_240_buffer[1]>=0.0010 &&
               ma90_240_buffer[1]-ma180_240_buffer[1]>=0.0010 &&
                     //   kd1,(kd2||kd3)<=-3  k1,k2,k3>=75             
               k1_240_buffer[1]-d1_240_buffer[1]<=-3 && (k2_240_buffer[1]-d2_240_buffer[1]<=-3 || k3_240_buffer[1]-d3_240_buffer[1]<=-3) &&
               k2_240_buffer[1]>=75 && k3_240_buffer[1]>=75 &&
               //ma05 [1]-[2]<=0 
               ma05_240_buffer[1]-ma05_240_buffer[2]<=0 &&
                   // [1]�W�v�j��22�I          [2]||[3]����  
             ((close_240_buffer[1]-open_240_buffer[1]<=-0.0001  && high_240_buffer[1]-close_240_buffer[1]>=0.0022)  ||
              (close_240_buffer[1]-open_240_buffer[1]>=0.0001  && high_240_buffer[1]-open_240_buffer[1]>=0.0022))  &&
              (close_240_buffer[2]-open_240_buffer[2]>=0.0001 || close_240_buffer[3]-open_240_buffer[3]>=0.0001)   && 
            
                // ([2]||[3]||[4]||[5]) && ([6]||[7]||[8]||[9])  close[1]-ma45>=-0.0005 <=0.0005  ���bma45����
             ((close_240_buffer[2]-ma45_240_buffer[2]>=-0.0005 && close_240_buffer[2]-ma45_240_buffer[2]<=0.0005) || 
              (close_240_buffer[3]-ma45_240_buffer[3]>=-0.0005 && close_240_buffer[3]-ma45_240_buffer[3]<=0.0005) || 
              (close_240_buffer[4]-ma45_240_buffer[4]>=-0.0005 && close_240_buffer[4]-ma45_240_buffer[4]<=0.0005) || 
              (close_240_buffer[5]-ma45_240_buffer[5]>=-0.0005 && close_240_buffer[5]-ma45_240_buffer[5]<=0.0005)) && 
             ((close_240_buffer[6]-ma45_240_buffer[6]>=-0.0005 && close_240_buffer[6]-ma45_240_buffer[6]<=0.0005) || 
              (close_240_buffer[7]-ma45_240_buffer[7]>=-0.0005 && close_240_buffer[7]-ma45_240_buffer[7]<=0.0005) || 
              (close_240_buffer[8]-ma45_240_buffer[8]>=-0.0005 && close_240_buffer[8]-ma45_240_buffer[8]<=0.0005) || 
              (close_240_buffer[9]-ma45_240_buffer[9]>=-0.0005 && close_240_buffer[9]-ma45_240_buffer[9]<=0.0005))) 
               OrderClose(OrderTicket(),lots,Ask,1,Khaki);    
                 
   //+++++++++++++++++++++++++++++++++++++++++++   CLOSE BUY  23   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                //�^�Ầ��ma180�W�U�d�W�v�u
                //(m15-67)   h4 �� ma90,ma180,ma360,ma650 ���פU     �U��W�ƦC  ma90,ma180,ma360,ma650   
        if    (ma90_240_buffer[1]-ma90_240_buffer[2]<0 && ma180_240_buffer[1]-ma180_240_buffer[2]<=0 &&
               ma360_240_buffer[1]-ma360_240_buffer[2]<0 && ma650_240_buffer[1]-ma650_240_buffer[2]<-0.0001 &&
               ma90_240_buffer[1]-ma180_240_buffer[1]<=0.0010 && ma90_240_buffer[1]-ma180_240_buffer[1]>=-0.0010 && 
                  //ma45 �}�f�L�U
              (ma90_240_buffer[1]-ma45_240_buffer[1])-(ma90_240_buffer[2]-ma45_240_buffer[2])<0 && 
                   //macd   signal  [1]>[2] [1]<[3] 
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]>=0.00001 &&
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[3]<=-0.00001 &&

                  // [1]�W�v�j��22�I          [2]||[3]����  
             ((close_240_buffer[1]-open_240_buffer[1]<=-0.0001  && high_240_buffer[1]-close_240_buffer[1]>=0.0022)  ||
              (close_240_buffer[1]-open_240_buffer[1]>=0.0001  && high_240_buffer[1]-open_240_buffer[1]>=0.0022))  &&
              (close_240_buffer[2]-open_240_buffer[2]>=0.0001 || close_240_buffer[3]-open_240_buffer[3]>=0.0001)) 
               OrderClose(OrderTicket(),lots,Ask,1,Khaki);    
       }   
   //+++++++++++++++++++++++++++++++++++++++++++   CLOSE SHORTBUY     ++++++++++++++++++++++++++++++++++++++++++++++++++          

    if      (shortsell01==OrderTicket() || shortsell02==OrderTicket() || shortsell03==OrderTicket() || 
             shortsell04==OrderTicket() || shortsell05==OrderTicket() || shortsell06==OrderTicket()) 
        {
  //+++++++++++++++++++++++++++++++++++++++++++   CLOSE SHORTBUY  01   ++++++++++++++++++++++++++++++++++++++++++++++++++          
 
                //�^�Ầ��ma45�ϼu�U
                //(m15-68)   h4 �� ma45,ma90,ma180,ma360,ma650 ���פU     
        if    (ma45_240_buffer[1]-ma45_240_buffer[2]<0 && ma90_240_buffer[1]-ma90_240_buffer[2]<0 &&
               ma180_240_buffer[1]-ma180_240_buffer[2]<0 && ma360_240_buffer[1]-ma360_240_buffer[2]<0 &&
               ma650_240_buffer[1]-ma650_240_buffer[2]<0.0001 &&
                 //ma05���W�����i�Ӥj
               ma05_240_buffer[1]-ma05_240_buffer[2]<=0.0020 &&
                   //case�@   //[-1]<[2],[3],[4]    kd1��e�U  k1�j�T�U�^   macd�b+-0.00160��
              (close_240_buffer[1]-open_240_buffer[1]<=-0.0001  && close_240_buffer[1]-close_240_buffer[2]<=-0.0001  &&
               close_240_buffer[1]-close_240_buffer[3]<=-0.0001 && close_240_buffer[1]-close_240_buffer[4]<=-0.0001  &&
               k1_240_buffer[1]-d1_240_buffer[1]<=-3 && k1_240_buffer[1]-k1_240_buffer[2]<=-6 &&  k1_240_buffer[1]>=75) ||
                 
                   //case�G   //[+3],[-2],[-1]    [+3]>=0.0035   [1]<[2],[3]
              (close_240_buffer[1]-open_240_buffer[1]<=-0.0001  && close_240_buffer[2]-open_240_buffer[2]<=-0.0001  &&
               close_240_buffer[3]-open_240_buffer[3]>=0.0035 &&
               k1_240_buffer[1]-k1_240_buffer[2]<=-8 &&  k1_240_buffer[1]>=75) ||
             
                   //case�T   //[-3],[+2],[-1]   
              (close_240_buffer[1]-open_240_buffer[1]<=-0.0010  && close_240_buffer[2]-open_240_buffer[2]>=0.0001  &&
               close_240_buffer[3]-open_240_buffer[3]<=-0.0010 &&
               k1_240_buffer[1]-k1_240_buffer[2]<=-8 &&  k1_240_buffer[1]>=75))
               OrderClose(OrderTicket(),lots,Ask,1,Khaki);    
            
      }


      if  (OrderType()==OP_SELL)
       {  

    //      if (longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
    //          longsell05==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
    //          longsell09==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
    //          longsell13==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
    //          longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket() ||
    //          longsell01==OrderTicket() || longsell02==OrderTicket() || longsell03==OrderTicket() || longsell04==OrderTicket())
    //       {
//+++++++++++++++++++++++++++++++++++++++++++  CLOSE  sell   1   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                                  //m15 ��ma45  ma90 ����L�U�^���ݫ��A ma45[1]-[6]���T�{���U�^ 
        if (((ma45_15_buffer[1]-ma45_15_buffer[2]>=0 &&  ma45_15_buffer[1]-ma45_15_buffer[6]<=0) ||
                                                 //�����U�^��h4 [1]�|�����j��20�I
             (ma45_15_buffer[1]-ma45_15_buffer[2]<=0 && ma90_15_buffer[1]-ma90_15_buffer[2]<=-0.0001 && 
                           //h4 ���� �B�W�v�u<=0.0006
              close_240_buffer[1]-open_240_buffer[1]>=0.0020 && high_240_buffer[1]-close_240_buffer[1]<=0.0055 )) && 
            
              ma90_15_buffer[1]-ma90_15_buffer[2]<=-0.0001 && 
                                                 //�U�^���ݤW�ɭn�@���ɹL�e3bar
              close_15_buffer[1]-close_15_buffer[2]>=0.0001  && // close_15_buffer[1]-close_15_buffer[3]>=0.0001 &&
      //        close_15_buffer[1]-close_15_buffer[4]>=0.0001  &&
                                             //��m15 m30 macd ���޶R���I 
              macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00010 &&
              macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]>=-0.00050 &&  macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00020 &&
              macdmainline_30_buffer[1]<=0.00110   &&   
                                                         //m60 ��45,90,180  �ҬO�פW
             (macdmainline_60_buffer[1]<=0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]>=0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0.0003 && 
              ma180_60_buffer[1]-ma180_60_buffer[2]>=0)) &&    
                                           //k1 (k2||k3)�w�W��
              k1_15_buffer[1]-k1_15_buffer[2]>=1  &&  k1_15_buffer[1]-d1_15_buffer[1]>=1 &&
              k2_15_buffer[1]-k2_15_buffer[2]>=0  ||  k3_15_buffer[1]-k3_15_buffer[2]>=0)
              if ((macdmainline_15_buffer[1]>=-0.00099 && macdmainline_15_buffer[1]<=0.00099 &&
                   macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                  (k2_30_buffer[1]-d2_30_buffer[1]<=-19  &&  k3_30_buffer[1]-d3_30_buffer[1]<=-19) ||
                  (k2_60_buffer[1]-d2_60_buffer[1]<=-19  &&  k3_60_buffer[1]-d3_60_buffer[1]<=-19) ||
                      //(m15-65) [1]���t<=25�I macd�t��<=-0.00230
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0025 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00230) ||

               
                  //h4  k2,k3 �b47�W  �}�f�V�U  �����R�� 
                   (k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3���V�U,�� h4,m30,m60 kd2,kd3�V�U�}�f�j �� k1,k,2,k3�b���C
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
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd�t��>=-350
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
                    
                         // h1 k123�b�U�� �Ҭ��W��
          if  (k1_60_buffer[1]<=15 && k2_60_buffer[1]<=15 && k3_60_buffer[1]<=15  && 
               k1_60_buffer[1]-k1_60_buffer[2]>=8 &&  k2_60_buffer[1]-k2_60_buffer[2]>=0 &&  k3_60_buffer[1]-k3_60_buffer[2]>=0 &&
                                  //[1]���L�j��20�I �j��[2][3][4] ma05    10�I�W
               close_60_buffer[1]-open_60_buffer[1]>=0.0020 && close_60_buffer[1]-close_60_buffer[2]>=0.0010 &&
               close_60_buffer[1]-close_60_buffer[3]>=0.0010 && close_60_buffer[1]-close_60_buffer[4]>=0.0010 &&
               close_60_buffer[1]-ma05_60_buffer[1]>=0.0010 && 
         
               macdmainline_30_buffer[1]<=0.00110   &&   
                                                         //m60 ��45,90,180  �ҬO�פW
              (macdmainline_60_buffer[1]<=0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]>=0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0.0003 && 
               ma180_60_buffer[1]-ma180_60_buffer[2]>=0)))     
                                      //h4  k2,k3 �b47�W  �}�f�V�U  �����R�� 
               if ((k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3���V�U,�� h4,m30,m60 kd2,kd3�V�U�}�f�j �� k1,k,2,k3�b���C
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
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd�t��>=-350
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
                                                    
                                                         //k1 �@���W�ɤj kd1�j�T��e�W 
         if ((k1_15_buffer[1]-k1_15_buffer[2]>=10  &&  k1_15_buffer[1]-d1_15_buffer[1]>=5  && close_15_buffer[1]-open_15_buffer[1]>=0.0002 &&
                                                   //�]���H���L���A�R�i  
              k1_15_buffer[1]<=60 && k2_15_buffer[2]<=60  &&  k3_15_buffer[1]<=60 && 
                                                   //m15 ��ma45  ma90 ����L�U�^���ݫ��A 
             (ma45_15_buffer[1]-ma45_15_buffer[2]>=0 && ma90_15_buffer[1]-ma90_15_buffer[2]>=0) || 
             (ma90_15_buffer[1]-ma90_15_buffer[2]>=0 && ma180_15_buffer[1]-ma180_15_buffer[2]>=0) &&                                  //�U�^���ݤW�ɭn�@���ɹL�e3bar
                                                        // �R��� m30 m60 ���i�b�L����m
              macdmainline_30_buffer[1]<=0.00110   &&   
                                                         //m60 ��45,90,180  �ҬO�פW
             (macdmainline_60_buffer[1]<=0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]>=0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0.0003 && 
              ma180_60_buffer[1]-ma180_60_buffer[2]>=0)) &&    
                                             //��m15 m30 macd ���޶R���I 
              macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.00020 &&  macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00010 &&
              macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]>=-0.00050 &&  macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.00020))
              if ((macdmainline_15_buffer[1]>=-0.00099 && macdmainline_15_buffer[1]<=0.00099 &&
                   macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                      //(m15-62) h4 k1,k2,k3 >=70 don't buy
                  (k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||                   
                     //(m15-64) h4 [1]���t�äp��30�I  kd2,kd3<=-10
                  (close_240_buffer[1]-open_240_buffer[1]<=-0.0030 &&                          
                   k2_240_buffer[1]-d2_240_buffer[1]<=-10 && k3_240_buffer[1]-d3_240_buffer[1]<=-10) ||                        
                    //(m15-64) h4 [1]macd ����>=0.00050 [1]���L���t�Ȩ�<=-25�I,[2]macd ����>=0.00030 [2]���L���t�Ȩ�<=-60�I                                
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0025 &&  close_240_buffer[2]-open_240_buffer[2]<=-0.0060 &&                          
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00050 &&
                    macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]>=0.00030) ||
                           //(m15-66) h4 [1]macd �Ȥ���0.00150 �P-0.00150�� �B kd1,kd2,kd3<=-4 �����                                
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-4 && k2_240_buffer[1]-d2_240_buffer[1]<=-4 &&
                    k3_240_buffer[1]-d3_240_buffer[1]<=-4 &&                       
                    macdmainline_240_buffer[1]>=-0.00150 && macdmainline_240_buffer[1]<=0.00150 &&
                    macdsignalline_240_buffer[1]>=-0.00150 &&  macdsignalline_240_buffer[1]<=0.00150) ||
                      //(m15-66) h4 [1]macd �Ȥ���0.00100 �P-0.00100��  �����                                
                   (macdmainline_240_buffer[1]>=-0.00100 && macdmainline_240_buffer[1]<=0.00100 &&
                    macdsignalline_240_buffer[1]>=-0.00100 &&  macdsignalline_240_buffer[1]<=0.00100) ||
                                  //(m15-66)  macd �t��<=-0.00450  signal[1]-[2]<=-0.00100
                   (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00450 &&
                    macdsignalline_240_buffer[1]- macdsignalline_240_buffer[2]<=-0.00100) ||
                        
                     
                                             //h4  k2,k3 �b47�W  �}�f�V�U  �����R�� 
                   (k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3���V�U,�� h4,m30,m60 kd2,kd3�V�U�}�f�j �� k1,k,2,k3�b���C
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
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd�t��>=-350
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
                  //m15 �� [+4][-3][-2][+1]  && [+1]or[-2]���̧C bar���鬰0.0006  �����o�ͱ�����Y
        if  (((close_15_buffer[1]-open_15_buffer[1]>=0.0006 && close_15_buffer[4]-open_15_buffer[4]>=0.0006  && 
               close_15_buffer[2]-open_15_buffer[2]<=-0.0006 && close_15_buffer[3]-open_15_buffer[3]<=-0.0006 &&
               k1_15_buffer[1]-k1_15_buffer[2]>=0  && close_15_buffer[1]-close_15_buffer[3]>=0.0001 &&
              (low_15_buffer[1]==M15lowest40bar ||  low_15_buffer[2]==M15lowest40bar) && 
              (ma05_15_buffer[1]-ma05_15_buffer[2]>=0 || 
              (close_15_buffer[1]-open_15_buffer[1]>=0.0001  && low_15_buffer[1]-close_15_buffer[1]<=-0.0029) ||
              (k2_15_buffer[1]-k2_15_buffer[2]>=2 && k3_15_buffer[1]-k3_15_buffer[2]>=2) ||
              (ma05_15_buffer[1]-ma05_15_buffer[2]>=-0.0006 && 
              (k2_15_buffer[1]-k2_15_buffer[2]>=0 || k3_15_buffer[1]-k3_15_buffer[2]>=0)))) ||
               
                //m15 �� [+5][-4][-3][-2][+1]  && [+1]or[-2]���̧C bar���鬰0.0006  
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
               
                 //m30 �� [+4][-3][-2][+1]  && [+1]or[-2]���̧C bar���鬰0.0008  �����o�ͱ�����Y
              (close_30_buffer[1]-open_30_buffer[1]>=0.0008 && close_30_buffer[4]-open_30_buffer[4]>=0.0008  && 
               close_30_buffer[2]-open_30_buffer[2]<=-0.0008 && close_30_buffer[3]-open_30_buffer[3]<=-0.0008 &&
               k1_30_buffer[1]-k1_30_buffer[2]>=0  && close_30_buffer[1]-close_30_buffer[3]>=0.0001 &&
              (low_30_buffer[1]==M30lowest40bar ||  low_30_buffer[2]==M30lowest40bar) && 
              (ma05_30_buffer[1]-ma05_30_buffer[2]>=0 || 
              (close_30_buffer[1]-open_30_buffer[1]>=0.0001  && low_30_buffer[1]-close_30_buffer[1]<=-0.0029) ||
              (k2_30_buffer[1]-k2_30_buffer[2]>=2 && k3_30_buffer[1]-k3_30_buffer[2]>=2) ||
              (ma05_30_buffer[1]-ma05_30_buffer[2]>=-0.0006 && 
              (k2_30_buffer[1]-k2_30_buffer[2]>=0 || k3_30_buffer[1]-k3_30_buffer[2]>=0)))) ||
                  //m30 �� [+5][-4][-3][-2][+1]  && [+1]or[-2]���̧C bar���鬰0.0008  
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
             
                  //m60 �� [+4][-3][-2][+1]  && [+1]or[-2]���̧C bar���鬰0.0010  �����o�ͱ�����Y
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
                    //m60 �� [+5][-4][-3][-2][+1]  && [+1]or[-2]���̧C bar���鬰0.0010  
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
                                                         //m60 ��45,90,180  �ҬO�פW
             (macdmainline_60_buffer[1]<=0.00200 || (ma45_60_buffer[1]-ma45_60_buffer[2]>=0.0003 && ma90_60_buffer[1]-ma90_60_buffer[2]>=0.0003 && 
              ma180_60_buffer[1]-ma180_60_buffer[2]>=0)))    
                                                    //(m15-61) h4 k1,k2,k3 >=65 don't buy
              if   ((k1_240_buffer[1]>=65 && k2_240_buffer[1]>=65 && k3_240_buffer[1]>=65) ||                   
                     //(m15-66) h4 [1]macd �Ȥ���0.00100 �P-0.00100��  �����                                
                   (macdmainline_240_buffer[1]>=-0.00100 && macdmainline_240_buffer[1]<=0.00100 &&
                    macdsignalline_240_buffer[1]>=-0.00100 &&  macdsignalline_240_buffer[1]<=0.00100) ||
                     
                 
                                   //h4  k2,k3 �b47�W  �}�f�V�U  �����R�� 
                   (k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                            //H4 k1,k2,k3���V�U,�� h4,m30,m60 kd2,kd3�V�U�}�f�j �� k1,k,2,k3�b���C
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
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd�t��>=-350
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
                                       //���U�v�u >=24�I  [1]>0.0001�}-�C  [1]<-0.0001��-�C
       if   ((close_15_buffer[1]-open_15_buffer[1]<=-0.0001 && low_15_buffer[1]-close_15_buffer[1]<=-0.0024) ||
             (close_15_buffer[1]-open_15_buffer[1]>=0.0001  && low_15_buffer[1]-open_15_buffer[1]<=-0.0024) &&
              low_15_buffer[1]==M15lowest40bar &&
              k1_15_buffer[1]-k1_15_buffer[2]>=0 && k2_15_buffer[1]-k2_15_buffer[2]>=0 && k3_15_buffer[1]-k3_15_buffer[2]>=0  &&
              macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.0090 && 
              macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.00010) 
              
              if ((close_15_buffer[2]-open_15_buffer[2]<=-0.0100 || close_15_buffer[1]-open_15_buffer[1]<=-0.0100 ||
                   macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=-0.00120 || 
                   macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=0.00050) ||
                                                 //�׶}�U�^�ᤧ�ϼu
                  (open_15_buffer[3]-open_15_buffer[2]<=0.0003 && open_15_buffer[4]-open_15_buffer[2]<=0.0003) ||    
                  (open_15_buffer[2]-open_15_buffer[1]<=0.0003 && open_15_buffer[3]-open_15_buffer[1]<=0.0003) ||     
                  (macdmainline_15_buffer[1]>=-0.00099 && macdmainline_15_buffer[1]<=0.00099 &&
                   macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                                   //h4  k2,k3 �b47�W  �}�f�V�U  �����R�� 
                   (k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3���V�U,�� h4,m30,m60 kd2,kd3�V�U�}�f�j �� k1,k,2,k3�b���C
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
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd�t��>=-350
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
                                  //h1 [1]�d�U�v�u >=24�I  [1]>0.0001�}-�C  [1]<-0.0001��-�C
       if  (((close_60_buffer[1]-open_60_buffer[1]<=-0.0001 && close_60_buffer[1]-open_60_buffer[1]>=-0.0006 && 
              low_60_buffer[1]-close_60_buffer[1]<=-0.0024) ||
             (close_60_buffer[1]-open_60_buffer[1]>=0.0001  && close_60_buffer[1]-open_60_buffer[1]>=-0.0006 && 
              low_60_buffer[1]-open_60_buffer[1]<=-0.0024) &&
              low_60_buffer[1]==H1lowest40bar &&
              k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 && k3_60_buffer[1]-k3_60_buffer[2]>=0) ||
                                         //[1]���� [2]�d�U�v�u
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
                                                 //�׶}�U�^�ᤧ�ϼu
                  (open_60_buffer[3]-open_60_buffer[2]<=0.0003 && open_60_buffer[4]-open_60_buffer[2]<=0.0003) ||    
                  (open_60_buffer[2]-open_60_buffer[1]<=0.0003 && open_60_buffer[3]-open_60_buffer[1]<=0.0003) ||     
                  (macdmainline_60_buffer[1]>=-0.00099 && macdmainline_60_buffer[1]<=0.00099 &&
                   macdmainline_30_buffer[1]>=-0.00080 && macdmainline_30_buffer[1]<=0.00080) ||
                                        //h4  k2,k3 �b47�W  �}�f�V�U  �����R�� 
                   (k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3���V�U,�� h4,m30,m60 kd2,kd3�V�U�}�f�j �� k1,k,2,k3�b���C
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
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd�t��>=-350
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
         
         
                         //(m15-61)  H4     [2]�d�U�v�u>80�I  [1]>=[2] 
       if  ((((close_240_buffer[2]-open_240_buffer[2]<=-0.0001 && low_240_buffer[2]-close_240_buffer[2]<=-0.0080) ||
              (close_240_buffer[2]-open_240_buffer[2]>=0.0001  && low_240_buffer[2]-open_240_buffer[2]<=-0.0080)) &&
               close_240_buffer[1]-open_240_buffer[1]>=0.0001 &&
                                                          //H4 k1,k2,k3 <=30   || [2]<=-0.0250
             ((k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30  &&  k3_240_buffer[1]<=30) || (close_240_buffer[2]-open_240_buffer[2]<=-0.0250))) ||
          
                //(m15-66)  [2]�d�U�v�u>35  k1,k2,k3>=35   ma12-ma05<=-0.0005   close[4]||[5]||[6]||[7]>close[1]&& [2] 
          (((close_240_buffer[2]-open_240_buffer[2]<=-0.0001 && low_240_buffer[2]-close_240_buffer[2]<=-0.0035) ||
            (close_240_buffer[2]-open_240_buffer[2]>=0.0001  && low_240_buffer[2]-open_240_buffer[2]<=-0.0035)) &&
            (close_240_buffer[4]-open_240_buffer[1]<=0 || close_240_buffer[5]-open_240_buffer[1]<=0 ||
             close_240_buffer[6]-open_240_buffer[1]<=0 || close_240_buffer[7]-open_240_buffer[1]<=0 || 
             close_240_buffer[8]-open_240_buffer[1]<=0 || close_240_buffer[9]-open_240_buffer[1]<=0) && 
            (close_240_buffer[4]-close_240_buffer[2]<=0 || close_240_buffer[5]-close_240_buffer[2]<=0 ||
             close_240_buffer[6]-close_240_buffer[2]<=0 || close_240_buffer[7]-close_240_buffer[2]<=0 || 
             close_240_buffer[8]-close_240_buffer[2]<=0 || close_240_buffer[9]-close_240_buffer[2]<=0) && 
           ((close_240_buffer[1]-open_240_buffer[1]>=0.0030  && ma12_240_buffer[1]-ma05_240_buffer[2]>=0.0005 && 
             k1_240_buffer[1]<=40 && k2_240_buffer[1]<=40  &&  k3_240_buffer[1]<=40) || 
            
                 //(m15-66)  k1,k2,k3<=25,k2,k3>=1,d2,d3>=0,kd1,kd2>=2  macd main && signal[1]-[2]>=0.00003
             (k2_240_buffer[1]<=25  &&  k3_240_buffer[1]<=25 && k2_240_buffer[1]-k2_240_buffer[2]>=1 &&
              k3_240_buffer[1]-k3_240_buffer[2]>=1  &&  d2_240_buffer[1]-d2_240_buffer[2]>=0 &&
              d3_240_buffer[1]-d3_240_buffer[2]>=0 && k2_240_buffer[1]-d2_240_buffer[1]>=2 &&
              k3_240_buffer[1]-d3_240_buffer[1]>=2 &&
              macdmainline_240_buffer[1]-macdmainline_240_buffer[2]>=0.00003 && 
              macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]>=0.00003))) ||
     
         
             //(m15-66) H4 [2] �d�U�v�u>70�I [1]>�U�v�u100�I macd�t��[1]-[2]>50
            (((close_240_buffer[2]-open_240_buffer[2]<=-0.0001 && low_240_buffer[2]-close_240_buffer[2]<=-0.0070) ||
             (close_240_buffer[2]-open_240_buffer[2]>=0.0001   && low_240_buffer[2]-open_240_buffer[2]<=-0.0070)) &&
             ((close_240_buffer[1]-open_240_buffer[1]<=-0.0001 && low_240_buffer[1]-close_240_buffer[1]<=-0.0100) ||
             (close_240_buffer[1]-open_240_buffer[1]>=0.0001   && low_240_buffer[1]-open_240_buffer[1]<=-0.0100)) &&
              macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.00370 && 
              macdmainline_240_buffer[1]>=0.00450 && macdsignalline_240_buffer[1]>=0.00050))  
               if    (k1_240_buffer[1]-d1_240_buffer[1]<=-12 &&  (k2_240_buffer[1]-d2_240_buffer[1]<=-5 || k3_240_buffer[1]-d3_240_buffer[1]<=-5) &&
                      k2_240_buffer[1]>=75 && k3_240_buffer[1]>=75)
                      return;
                      else                 
                      OrderClose(OrderTicket(),lots,Bid,1,Olive); 
    
//+++++++++++++++++++++++++++++++++++++++++++CLOSE   SELL   8   ++++++++++++++++++++++++++++++++++++++++++++++++++          
         
                   //(m15-62)   h4 �� ma180�פW ��ma180���� ma360 �פW   
        if   (((ma180_240_buffer[1]-ma180_240_buffer[2]>=0.0001 ||  (ma180_240_buffer[1]-ma180_240_buffer[2]>=0 &&
               ma360_240_buffer[1]-ma360_240_buffer[2]>=0.0001)) &&
                  // [1]���bma180�W��20�I��  
               close_240_buffer[1]-ma180_240_buffer[1]>=0.0001  && close_240_buffer[1]-ma180_240_buffer[1]<=0.0020 &&
                 //h4 [1]�U�v�u�W�L30�I
              ((close_240_buffer[1]-open_240_buffer[1]<=-0.0001 && low_240_buffer[1]-close_240_buffer[1]<=-0.0030) ||
              (close_240_buffer[1]-open_240_buffer[1]>=0.0001  && low_240_buffer[1]-open_240_buffer[1]<=-0.0030)) &&
                 //kd1>=3      
               k1_240_buffer[1]-d1_240_buffer[1]>=3 &&
                  // macd�t��>=-0.00150  <=0.00100 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00150 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100 &&
                   // [2]||[3]||[4]���bma180�W��20�I��  
             ((close_240_buffer[2]-ma180_240_buffer[2]>=0.0001  && close_240_buffer[2]-ma180_240_buffer[2]<=0.0020) ||
              (close_240_buffer[3]-ma180_240_buffer[3]>=0.0001  && close_240_buffer[3]-ma180_240_buffer[3]<=0.0020) ||
              (close_240_buffer[4]-ma180_240_buffer[4]>=0.0001  && close_240_buffer[4]-ma180_240_buffer[4]<=0.0020))) ||
                   
                  //(m15-66)   h4 �� ma180,ma360,ma650 ����    
              (ma180_240_buffer[1]-ma180_240_buffer[2]>=-0.0001 && ma360_240_buffer[1]-ma360_240_buffer[2]>=-0.0001 &&
               ma650_240_buffer[1]-ma650_240_buffer[2]>=-0.0001 && 
                  // [1]���bma360�W��20�I��  
               close_240_buffer[1]-ma360_240_buffer[1]>=0.0001  && close_240_buffer[1]-ma360_240_buffer[1]<=0.0020 &&
                 //h4 [1]�U�v�u�W�L30�I
              ((close_240_buffer[1]-open_240_buffer[1]<=-0.0001 && low_240_buffer[1]-close_240_buffer[1]<=-0.0030) ||
              (close_240_buffer[1]-open_240_buffer[1]>=0.0001  && low_240_buffer[1]-open_240_buffer[1]<=-0.0030)) &&
                 //kd1>=3      
               k1_240_buffer[1]-d1_240_buffer[1]>=3 &&
                   // [2]||[3]||[4]���bma360�W��20�I��  
             ((close_240_buffer[2]-ma360_240_buffer[2]>=-0.0005  && close_240_buffer[2]-ma360_240_buffer[2]<=0.0020) ||
              (close_240_buffer[3]-ma360_240_buffer[3]>=-0.0005  && close_240_buffer[3]-ma360_240_buffer[3]<=0.0020) ||
              (close_240_buffer[4]-ma360_240_buffer[4]>=-0.0005  && close_240_buffer[4]-ma360_240_buffer[4]<=0.0020))))
               if    (k1_240_buffer[1]-d1_240_buffer[1]<=-12 &&  (k2_240_buffer[1]-d2_240_buffer[1]<=-5 || k3_240_buffer[1]-d3_240_buffer[1]<=-5) &&
                      k2_240_buffer[1]>=75 && k3_240_buffer[1]>=75)
                      return;
                      else                 
         //             OrderClose(OrderTicket(),lots,Bid,1,Olive); 
                 
        
 //+++++++++++++++++++++++++++++++++++++++++++   CLOSE SELL   9   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                 
              //h4 �� [+4][-3][-2][+1]  && [+1]or[-2]���̧C bar���鬰0.0030 
        if   ((close_240_buffer[1]-open_240_buffer[1]>=0.0030 && close_240_buffer[4]-open_240_buffer[4]>=0.0010  && 
               close_240_buffer[2]-open_240_buffer[2]<=-0.0010 && close_240_buffer[3]-open_240_buffer[3]<=-0.0010 &&
                //(m15-61)  [1]�W�v�u�p��15�I
               high_240_buffer[1]-close_240_buffer[1]<=0.0015  &&
                 //(m15-59) kd1,(kd2||kd3)>=-2 �}�f�����Y�p || macd�t�Ȧb100��
             ((k1_240_buffer[1]-d1_240_buffer[1]>=-3  && (k2_240_buffer[1]-d2_240_buffer[1]>=-3 || k3_240_buffer[1]-d3_240_buffer[1]>=-3)) ||
                      // (m15-61)  macd�t��>=-0.00150  <=0.00100 
              (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00150 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100))  &&
                //(m15-66)  h4 ���L������ma05�b20�I��  k2,k3�����b35�U�H�K�w���L�� kd2,kd3>=9
             ((ma05_240_buffer[1]- close_240_buffer[1]<=0.0020 && ma05_240_buffer[1]-ma05_240_buffer[2]>=0 &&
               k2_240_buffer[1]<=35 && k3_240_buffer[1]<=35 &&
               k2_240_buffer[1]-d2_240_buffer[1]>=9 && k3_240_buffer[1]-d3_240_buffer[1]>=9) ||  //  && 
          //       //(m15=58)  h4 ���L������ma05�b15�I��   h1   k1,k2,k3�����b30�U�H�K�w���L��
              (ma05_240_buffer[1]- close_240_buffer[1]<=0.0015 && ma05_240_buffer[1]-ma05_240_buffer[2]>=0 &&
               k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30))) ||  //  && 
          //    (low_240_buffer[1]==H4lowest40bar ||  low_240_buffer[2]==H4lowest40bar)) ||
            
                   //h4 �� [+5][-4][-3][-2][+1]  && [+1]or[-2]���̧C bar���鬰0.0010   [1]>=0.0030  
              (close_240_buffer[1]-open_240_buffer[1]>=0.0030 && close_240_buffer[5]-open_240_buffer[5]>=0.0010  && 
               close_240_buffer[2]-open_240_buffer[2]<=-0.0010 && close_240_buffer[3]-open_240_buffer[3]<=-0.0010 &&
               close_240_buffer[4]-open_240_buffer[4]<=-0.0010 &&
                              //(m15-61)  [1]�W�v�u�p��15�I
               high_240_buffer[1]-close_240_buffer[1]<=0.0015  &&

                         //(m15-59) kd1,(kd2||kd3)>=-2 �}�f�����Y�p || macd�t�Ȧb100��
             ((k1_240_buffer[1]-d1_240_buffer[1]>=-3  && (k2_240_buffer[1]-d2_240_buffer[1]>=-3 || k3_240_buffer[1]-d3_240_buffer[1]>=-3)) ||
                      // (m15-61)  macd�t��>=-0.00150  <=0.00100 
              (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00150 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100))  &&
                  //(m15=58)  h4 ���L������ma05�b15�I��   h1   k1,k2,k3�����b45�U�H�K�w���L��
               ma05_240_buffer[1]- close_240_buffer[1]<=0.0015 && ma05_240_buffer[1]-ma05_240_buffer[2]>=0 &&
               k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30)  ||   //  && 
                       //�bm15���U�����   �U�C�L�k�@��
      //        (low_240_buffer[1]==H4lowest40bar ||  low_240_buffer[2]==H4lowest40bar || low_240_buffer[3]==H4lowest40bar )) ||
            
                        //(m15-65) H4 �� [+5][-4][-3][2][+1]   [1]>=0.0015 [2]>=0 [3][4]<=-0.0010 [5]>=-0.0010 
              (close_240_buffer[1]-open_240_buffer[1]>=0.0015 && close_240_buffer[5]-open_240_buffer[5]>=0.0010  && 
                 //(m15-64) [2]���i�^�}150�I �^�Ӧh���n�^�Y
               close_240_buffer[2]-open_240_buffer[2]<=0 && close_240_buffer[2]-open_240_buffer[2]>=-0.0150 &&
               close_240_buffer[3]-open_240_buffer[3]<=-0.0010 &&
               close_240_buffer[4]-open_240_buffer[4]<=-0.0010 && 
                 //h4 (m15-65)  [2][3][4]���L�p����[5]���}�L�̦h5�I��
               open_240_buffer[2]-close_240_buffer[5]>=-0.0005 &&
               open_240_buffer[3]-close_240_buffer[5]>=-0.0005 && 
               open_240_buffer[4]-close_240_buffer[5]>=-0.0005 &&
               close_240_buffer[1]-close_240_buffer[5]>=-0.0005 && 
                    //(m15-62)   [1]�U�v�u���W�L5�I   k1<=50  k2,k3<=35    kd2,kd3>=4  
               high_240_buffer[1]-close_240_buffer[1]<=0.0005  && k1_240_buffer[1]<=50 && k2_240_buffer[1]<=35 && k3_240_buffer[1]<=35 && 
               k2_240_buffer[1]-d2_240_buffer[1]>=4 && k3_240_buffer[1]-d3_240_buffer[1]>=4) ||
         
                    
                        //(m15-61) H4 �� [+2][+1]   �W�v�u�b10�I��
              (close_240_buffer[1]-open_240_buffer[1]>=0.0010 && close_240_buffer[2]-open_240_buffer[2]>=0.0010  && 
                     //  [1][2]�W�v�u�p��10�I
               low_240_buffer[1]-close_240_buffer[1]>=0.0010  &&  low_240_buffer[2]-close_240_buffer[2]>=0.0010  &&             
                    //    kd1,kd2,kd3>=1 
               k1_240_buffer[1]-k1_240_buffer[2]>=1  && k2_240_buffer[1]-k2_240_buffer[2]>=1 && k3_240_buffer[1]-k3_240_buffer[2]>=1 &&
                    //   macd  �t��>=-0.00100  <=0.00100
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100  &&
               macdmainline_240_buffer[1]<=-0.00350 && 
                      //k1,k2,k3<=15
               k1_240_buffer[1]<=15 && k2_240_buffer[1]<=15 && k3_240_buffer[1]<=15) ||
    
                     //h4  [4][3][2]<=-0.0050 [1]>=0.0010  ma45[1]-[2]>=0.0001
              (close_240_buffer[4]-open_240_buffer[4]<=-0.0050 && close_240_buffer[3]-open_240_buffer[3]<=-0.0050  && 
               close_240_buffer[2]-open_240_buffer[2]<=-0.0050 && close_240_buffer[1]-open_240_buffer[1]>=0.0010 &&
               ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0001) ||
          
                       //(m15-61) h4  [4]+[3]+[2]<=-0.0150 [1]>=0.0030  [1]-[2]>=-0.0010  macd  �t��>=-0.00100  <=0.00100
             (((close_240_buffer[4]-open_240_buffer[4])+(close_240_buffer[3]-open_240_buffer[3])+ 
               (close_240_buffer[2]-open_240_buffer[2])<=-0.0150) && close_240_buffer[1]-open_240_buffer[1]>=0.0030 &&
                close_240_buffer[1]-close_240_buffer[2]>=-0.0010 &&
                macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00100 && macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100)) 
                  if    ((k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10) ||
                      (k1_240_buffer[1]<=13 && k2_240_buffer[1]<=13  &&  k3_240_buffer[1]<=13) ||
                         //(m15-64) [1]||[2]���i�^�}150�I �^�Ӧh���n�^�Y
                      (close_240_buffer[1]-open_240_buffer[1]<=-0.0150 || close_240_buffer[2]-open_240_buffer[2]<=-0.0150) ||
                          //(m15-64) [1]||[2]���i�^�}110�I   kd1[1]||kd1[2]<=-20 
                      (close_240_buffer[1]-open_240_buffer[1]<=-0.0110 && k1_240_buffer[1]-d1_240_buffer[1]<=-20) ||
                      (close_240_buffer[2]-open_240_buffer[2]<=-0.0110 && k1_240_buffer[2]-d1_240_buffer[2]<=-20) ||
                   // (m15-64)  kd1,kd2,kd3<=-15
                      (k1_240_buffer[1]-d1_240_buffer[1]<=-15 && k2_240_buffer[1]-d2_240_buffer[1]<=-15 && k3_240_buffer[1]-d3_240_buffer[1]<=-15) || 
                        //(m15-66)  ma360[1]-[6]<=-0.0001   ma05,ma08,ma12<=0.0015   kd1[1]<=-10  macd signal[1]-[2]<=-0.00002 
                      (ma360_240_buffer[1]-ma360_240_buffer[6]<=-0.0001 && ma05_240_buffer[1]-ma05_240_buffer[2]<=0.0015 &&
                       ma08_240_buffer[1]-ma08_240_buffer[2]<=0.0015 && ma12_240_buffer[1]-ma12_240_buffer[2]<=0.0015 &&
                       k1_240_buffer[1]-d1_240_buffer[1]<=-10 && macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]<=-0.00002))
                       return;
                       else              
   //                    OrderClose(OrderTicket(),lots,Bid,1,Teal); 
   
   //+++++++++++++++++++++++++++++++++++++++++++   CLOSE SELL  10   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                
                                          //h1 [1] ����W�L30,50,70,100�I   
                                //100 �I [1]-[2]>=0.0001  [1]-[3]>=0.0001
      if   ((((close_60_buffer[1]-open_60_buffer[1]>=0.0100 && close_60_buffer[1]-close_60_buffer[2]>=0.0001  &&
            close_60_buffer[1]-close_60_buffer[3]>=0.0001 && 
                               //kd1,kd2,kd3>=0  k1,k2,k3<=30 
            k1_60_buffer[1]-d1_60_buffer[1]>=0 && k2_60_buffer[1]-d2_60_buffer[1]>=0 && k3_60_buffer[1]-d3_60_buffer[1]>=0 &&
            k1_60_buffer[1]<=30 && k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30) ||
                               //75 �I [1]-[2]>=0~~~~[1]-[4]>=0 
           (close_60_buffer[1]-open_60_buffer[1]>=0.0075 && close_60_buffer[1]-close_60_buffer[2]>=0  &&
            close_60_buffer[1]-close_60_buffer[3]>=0 && close_60_buffer[1]-close_60_buffer[4]>=0  &&
                              //kd1,kd2,kd3>=0 k1,k2,k3<=30 
            k1_60_buffer[1]-d1_60_buffer[1]>=0 && k2_60_buffer[1]-d2_60_buffer[1]>=0 && k3_60_buffer[1]-d3_60_buffer[1]>=0 &&
            k1_60_buffer[1]<=30 && k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30) ||
                              //55 �I [1]-[2][3]>=0,[1]-[6]>=0 
           (close_60_buffer[1]-open_60_buffer[1]>=0.0055 && close_60_buffer[1]-close_60_buffer[2]>=0  &&
            close_60_buffer[1]-close_60_buffer[3]>=0 && close_60_buffer[1]-close_60_buffer[6]>=0  &&
                              //kd1,kd2,kd3>=0 k1,k2,k3<=30 
            k1_60_buffer[1]-d1_60_buffer[1]>=0 && k2_60_buffer[1]-d2_60_buffer[1]>=0 && k3_60_buffer[1]-d3_60_buffer[1]>=0 &&
            k1_60_buffer[1]<=30 && k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30) ||
                          //30 �I [1]-[2]>=0~~~~~[1]-[8]>=0 
           (close_60_buffer[1]-open_60_buffer[1]>=0.0030 && close_60_buffer[1]-close_60_buffer[2]>=0  &&
            close_60_buffer[1]-close_60_buffer[3]>=0 && close_60_buffer[1]-close_60_buffer[4]>=0  &&
            close_60_buffer[1]-close_60_buffer[5]>0 && close_60_buffer[1]-close_60_buffer[6]>=0  &&
            close_60_buffer[1]-close_60_buffer[7]>=0 && close_60_buffer[1]-close_60_buffer[8]>=0  &&
                                  //kd1,kd2,kd3>=2 k1,k2,k3<=30 
            k1_60_buffer[1]-d1_60_buffer[1]>=2 && k2_60_buffer[1]-d2_60_buffer[1]>=2 && k3_60_buffer[1]-d3_60_buffer[1]>=2 &&
            k1_60_buffer[1]<=30 && k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30))))
                          //h4  k2,k3 �b47�W  �}�f�V�U  �����R�� 
            if    ((k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3���V�U,�� h4,m30,m60 kd2,kd3�V�U�}�f�j �� k1,k,2,k3�b���C
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
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd�t��>=-350
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
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14) || 
                     (OrdersTotal()==1 && (longbuy==OrderTicket() || longsell==OrderTicket())))
                      return;
                      else
             //       OrderClose(OrderTicket(),lots,Bid,1,Teal); 
 //+++++++++++++++++++++++++++++++++++++++++++   CLOSE SELL 11   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                      //m30 �� [+4][-3][-2][+1]   [1]>=0.0030 
         if   ((close_30_buffer[1]-open_30_buffer[1]>=0.0030 && close_30_buffer[4]-open_30_buffer[4]>=0.0008  && 
               close_30_buffer[2]-open_30_buffer[2]<=-0.0008 && close_30_buffer[3]-open_30_buffer[3]<=-0.0008 &&
               k2_30_buffer[1]-d2_30_buffer[1]>=12 && k3_30_buffer[1]-d3_30_buffer[1]>=12 &&
               k2_30_buffer[1]<=45 && k3_30_buffer[1]<=45) || 
                       //m30 �� [+5][-4][-3][-2][+1]  [1]>=0.0015  
              (close_30_buffer[1]-open_30_buffer[1]>=0.0015 && close_30_buffer[5]-open_30_buffer[5]>=0.0010  && 
               close_30_buffer[2]-open_30_buffer[2]<=-0.0010 && close_30_buffer[3]-open_30_buffer[3]<=-0.0010 &&
               close_30_buffer[4]-open_30_buffer[4]<=-0.0010 &&
               k2_30_buffer[1]-d2_30_buffer[1]>=10 && k3_30_buffer[1]-d3_30_buffer[1]>=10 &&
               k2_30_buffer[1]<=30 && k3_30_buffer[1]<=30) || 
  
                  //m60 �� [+4][-3][-2][+1]   [1]>=0.0030 
              (close_60_buffer[1]-open_60_buffer[1]>=0.0030 && close_60_buffer[4]-open_60_buffer[4]>=0.0010  && 
               close_60_buffer[2]-open_60_buffer[2]<=-0.0010 && close_60_buffer[3]-open_60_buffer[3]<=-0.0010 &&
               k2_60_buffer[1]-d2_60_buffer[1]>=10 && k3_60_buffer[1]-d3_60_buffer[1]>=10 &&
               k2_60_buffer[1]<=55 && k3_60_buffer[1]<=55) || 
                       //m60 �� [+4][-3][-2][+1]   [1]>=0.0020 
              (close_60_buffer[1]-open_60_buffer[1]>=0.0020 && close_60_buffer[4]-open_60_buffer[4]>=0.0007  && 
               close_60_buffer[2]-open_60_buffer[2]<=-0.0007 && close_60_buffer[3]-open_60_buffer[3]<=-0.0007 &&
               k1_60_buffer[1]-d1_60_buffer[1]>=0 && k2_60_buffer[1]-d2_60_buffer[1]>=5 && k3_60_buffer[1]-d3_60_buffer[1]>=5 &&
               k2_60_buffer[1]<=20 && k3_60_buffer[1]<=20) || 
                       //m60 �� [+5][-4][-3][-2][+1]  [1]>=0.0015  
              (close_60_buffer[1]-open_60_buffer[1]>=0.0015 && close_60_buffer[5]-open_60_buffer[5]>=0.0007  && 
               close_60_buffer[2]-open_60_buffer[2]<=-0.0007 && close_60_buffer[3]-open_60_buffer[3]<=-0.0007 &&
               close_60_buffer[4]-open_60_buffer[4]<=-0.0007 &&
               k2_60_buffer[1]-d2_60_buffer[1]>=4 && k3_60_buffer[1]-d3_60_buffer[1]>=4 &&
               k2_60_buffer[1]<=35 && k3_60_buffer[1]<=35) || 

                        //m60 �� [+5][-4][+3][-2][+1]  [1]>=0.0015  
              (close_60_buffer[1]-open_60_buffer[1]>=0.0015 && close_60_buffer[5]-open_60_buffer[5]>=0.0007  && 
               close_60_buffer[2]-open_60_buffer[2]<=-0.0007 && close_60_buffer[3]-open_60_buffer[3]>=0.0007 &&
               close_60_buffer[4]-open_60_buffer[4]<=-0.0007 &&
               k1_60_buffer[1]-k1_60_buffer[2]>=0 &&  k2_60_buffer[1]-k2_60_buffer[2]>=0 && k3_60_buffer[1]-k3_60_buffer[2]>=0 &&
               k2_60_buffer[1]<=20 && k3_60_buffer[1]<=20)) 
                                //h4  k2,k3 �b47�W  �}�f�V�U  �����R�� 
               if ((k2_240_buffer[1]>=47 && k3_240_buffer[1]>=47 && 
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                   (k2_240_buffer[1]+k3_240_buffer[1]>=94 &&
                    k2_240_buffer[1]-d2_240_buffer[1]<=0 && k3_240_buffer[1]-d3_240_buffer[1]<=0) || 
                        //H4 k1,k2,k3���V�U,�� h4,m30,m60 kd2,kd3�V�U�}�f�j �� k1,k,2,k3�b���C
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
                            // (m15-57) h4  [1]<=-0.0100  [2]<=-0.0050  ma05[1]-[2]<=-0.0020  k1,k2,k3>=50 || macd�t��>=-350
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
                                       //m30 [2]�d�U�v�u >=25�I  [1]>0.0001�}-�C  [1]<-0.0001��-�C
       if  (((close_30_buffer[2]-open_30_buffer[2]<=-0.0001 && low_30_buffer[2]-close_30_buffer[2]<=-0.0025) ||
             (close_30_buffer[2]-open_30_buffer[2]>=0.0001  && low_30_buffer[2]-open_30_buffer[2]<=-0.0025) &&
             (low_30_buffer[1]==M15lowest50bar || low_30_buffer[2]==M15lowest50bar) &&
                                  //       [1]����  [1]-[2]>=0.0001   k1,k2,k3>=0  k1,k2,k3<=30
             (close_30_buffer[1]-open_30_buffer[1]>=0.0001 && close_30_buffer[1]-close_30_buffer[2]>=0.0001 &&
              k1_30_buffer[1]-k1_30_buffer[2]>=0 && k2_30_buffer[1]-k2_30_buffer[2]>=0 && k3_30_buffer[1]-k3_30_buffer[2]>=0 &&
              k1_30_buffer[1]<=30 && k2_30_buffer[1]<=30 && k3_30_buffer[1]<=30) ||
                                    //    [1]����  [1]-[2]>=0.0001   k1,(k2||k3)>=0  k1,k2,k3<=30 kd1>=1
             (close_30_buffer[1]-open_30_buffer[1]>=0.0001 && close_30_buffer[1]-close_30_buffer[2]>=0.0001 &&
              k1_30_buffer[1]-k1_30_buffer[2]>=0 && (k2_30_buffer[1]-k2_30_buffer[2]>=0 || k3_30_buffer[1]-k3_30_buffer[2]>=0) &&
              k1_30_buffer[1]-d1_30_buffer[2]>=1 && 
              k1_30_buffer[1]<=20 && k2_30_buffer[1]<=20 && k3_30_buffer[1]<=20)) ||
              
                                     //m30 [1]&&[2]�d�U�v�u >=25�I  [1]>0.0001�}-�C  [1]<-0.0001��-�C
            ((close_30_buffer[1]-open_30_buffer[1]<=-0.0001 && close_30_buffer[1]-open_30_buffer[1]>=-0.0010 && 
            low_30_buffer[1]-close_30_buffer[1]<=-0.0025) ||
             (close_30_buffer[1]-open_30_buffer[1]>=0.0001  && low_30_buffer[1]-open_30_buffer[1]<=-0.0025) &&
             (close_30_buffer[2]-open_30_buffer[2]<=-0.0001 && low_30_buffer[2]-close_30_buffer[2]<=-0.0025) ||
             (close_30_buffer[2]-open_30_buffer[2]>=0.0001  && low_30_buffer[2]-open_30_buffer[2]<=-0.0025) &&
              k1_30_buffer[1]<=30 && k2_30_buffer[1]<=30 && k3_30_buffer[1]<=30  &&
             (low_30_buffer[1]==M15lowest50bar || low_30_buffer[2]==M15lowest50bar) &&
                                  //       [1]����  [1]-[2]>=0.0001   k2,k3>=0  k1,k2,k3<=30
              close_30_buffer[1]-open_30_buffer[1]>=0.0010 && close_30_buffer[1]-close_30_buffer[2]>=0.0001 &&
              k2_30_buffer[1]-k2_30_buffer[2]>=0 && k3_30_buffer[1]-k3_30_buffer[2]>=0 &&
              k1_30_buffer[1]<=30 && k2_30_buffer[1]<=30 && k3_30_buffer[1]<=30) ||
                                    // [1]�d�U�v�u >=40�I  [1]>0.0001�}-�C  k1,k2,k3>=1  ,k1,k2,k3<=20
            ((close_30_buffer[1]-open_30_buffer[1]>=0.0001  && low_30_buffer[1]-open_30_buffer[1]<=-0.0040) &&
              low_30_buffer[1]==M15lowest50bar &&
              k1_30_buffer[1]-k1_30_buffer[2]>=1 && k2_30_buffer[1]-k2_30_buffer[2]>=1 && k3_30_buffer[1]-k3_30_buffer[2]>=1 &&
              k1_30_buffer[1]<=20 && k2_30_buffer[1]<=20 && k3_30_buffer[1]<=20))
          
          
                                         
                                      //return  else  �H�U buy 12   buy13  �ۦP �M buy1  ~  buy 11  ���P
                                      //return  else  �H�U buy 12   buy13  �ۦP �M buy1  ~  buy 11  ���P

               if  ((k2_60_buffer[1]-d2_60_buffer[1]<=-25  &&  k3_60_buffer[1]-d3_60_buffer[1]<=-25) ||
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-10  && k2_60_buffer[1]-d2_60_buffer[1]<=-10  &&  k3_60_buffer[1]-d3_60_buffer[1]<=-10) ||                                   //h4  k2,k3 �b47�W  �}�f�V�U  �����R�� 
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
                         //(m15-57)h4  [1]�^�L140�I
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0140) ||
                     //(m15-59) h4  ma45,ma90,ma180�䤤���G[1]-[2]<=0    [1]<=-0.0100
                  ((ma45_240_buffer[1]-ma45_240_buffer[2]<=0 || ma90_240_buffer[1]-ma90_240_buffer[2]<=0) &&
                   (ma90_240_buffer[1]-ma90_240_buffer[2]<=0 || ma180_240_buffer[1]-ma180_240_buffer[2]<=0) &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0100) ||  
                         //(m15-59) h4 k1||k2||k3 >=65 don't buy
                   (k1_240_buffer[1]>=65 || k2_240_buffer[1]>=65 || k3_240_buffer[1]>=65) ||                   
                      //(m15-57)h4  ma45[1][2]<=-0.0007  ma90[1][2]<=-0.0004  ma45||ma90([1]-[2])-[2]-[3])<=-0.0001 ma45,ma90���Z<=0.0400 >=-0.0035
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0007  &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0004 &&
                  ((ma45_240_buffer[1]-ma45_240_buffer[2])-(ma45_240_buffer[2]-ma45_240_buffer[3])<=-0.0001  ||
                   (ma90_240_buffer[1]-ma90_240_buffer[2])-(ma90_240_buffer[2]-ma90_240_buffer[3])<=-0.0001) &&
                    //(m15-58)   ma45�bma90 �U�����Z<=0.0350 >=-0.0010
                    ma45_240_buffer[1]-ma90_240_buffer[1]<=0.0350 && ma45_240_buffer[1]-ma90_240_buffer[1]>=-0.0010) ||
                          //(m15-58)h4  kd1+kd2+kd3<=-49 kd1,kd2,kd3<=-7
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-49 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-7 && k2_240_buffer[1]-d2_240_buffer[1]<=-7 && k3_240_buffer[1]-d3_240_buffer[1]<=-7) ||
                     //(m15-59)(m15-58)h4  kd1+kd2+kd3<=-40 kd1,kd2,kd3<=-12
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-40 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-12 && k2_240_buffer[1]-d2_240_buffer[1]<=-12 && k3_240_buffer[1]-d3_240_buffer[1]<=-12) ||
                  
                           //(m15-61)(m15-57)h4  [1]�^�L100�I  (ma45<=-0.0015  || [0]<=-0.0150)
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
                  
                      //(m15-66)  kd2,kd3[1]<=-15 k1[0]-[1]<=-5||kd1[1]<=-5   macd<=-0.00300
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                  ((k1_240_buffer[0]-k1_240_buffer[1]<=-5) || (k1_240_buffer[1]-d1_240_buffer[1]<=-5)) &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300) ||    
                    // (m15-16)  kd2,kd3[1]<=-7 k1[0]-[1]<=-7||kd1[1]<=-7      macd[1]<=-0.00350  macd[2]<=-0.00250  (macd[1]-[2]<=-0.00070 || macdmain[1]-[2]<=-0.00150  macdsignal[1]-[2]<=-0.0070 
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-7  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-7 &&
                  ((k1_240_buffer[0]-k1_240_buffer[1]<=-7) || (k1_240_buffer[1]-d1_240_buffer[1]<=-7)) &&
                     macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00350 &&
                    macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]<=-0.00250 && 
                  (((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1])-(macdmainline_240_buffer[2]-macdsignalline_240_buffer[2])<=-0.00070) ||    
                    (macdmainline_240_buffer[1]-macdmainline_240_buffer[2]<=-0.00150 && macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2])<=-0.00070)) ||
                          //ma45  ma90 <=-0.0014
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0014  &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0014) ||
                          //(m15-57) h4 ma45  ma90 <=-0.0010   ma45+ma90<=-0.0029
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0010  &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0010 &&
                   (ma45_240_buffer[1]-ma45_240_buffer[2])+ (ma90_240_buffer[1]-ma90_240_buffer[2])<=-0.0029) ||

                           //H4 k1,k2,k3���V�U,�� h4,m30,m60 kd2,kd3�V�U�}�f�j �� k1,k,2,k3�b���C
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-2 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-25  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-25 && 
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                    k2_240_buffer[0]>=40 && k3_240_buffer[1]>=40 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-10  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-10  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-10  &&  k2_240_buffer[0]>=70 && k3_240_buffer[1]>=70 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  && 
                    k1_240_buffer[1]-k1_240_buffer[2]<=0 &&  k2_240_buffer[1]-k2_240_buffer[2]<=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]<=0 &&  close_240_buffer[1]-open_240_buffer[1]<=-0.0001 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                                       //34�� �����34���������ʧ@
                   (OrderType()==OP_BUY && TimeCurrent()-OrderCloseTime()<=2000))
                    return;
                    else       
                    OrderClose(OrderTicket(),lots,Bid,1,Teal); 
 //+++++++++++++++++++++++++++++++++++++++++++   CLOSE SELL 13   ++++++++++++++++++++++++++++++++++++++++++++++++++          
                                 //h1 �d�U�v�u[2] >=25�I  [1]>0.0001�}-�C  [1]<-0.0001��-�C
       if  (((close_60_buffer[2]-open_60_buffer[2]<=-0.0001 && low_60_buffer[2]-close_60_buffer[2]<=-0.0025) ||
             (close_60_buffer[2]-open_60_buffer[2]>=0.0001  && low_60_buffer[2]-open_60_buffer[2]<=-0.0025) &&
             (low_60_buffer[1]==M15lowest70bar || low_60_buffer[2]==M15lowest70bar) &&
                                  //       [1]����  [1]-[2]>=0.0001   k1,k2,k3>=0  k1,k2,k3<=30
             (close_60_buffer[1]-open_60_buffer[1]>=0.0010 && close_60_buffer[1]-close_60_buffer[2]>=0.0001 &&
              k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 && k3_60_buffer[1]-k3_60_buffer[2]>=0 &&
              k1_60_buffer[1]<=30 && k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30) ||
                                       //    [1]����  [1]-[2]>=0.0001   k1,(k2||k3)>=0  k1,k2,k3<=30 kd1>=1
             (close_60_buffer[1]-open_60_buffer[1]>=0.0001 && close_60_buffer[1]-close_60_buffer[2]>=0.0001 &&
              k1_60_buffer[1]-k1_60_buffer[2]>=0 && (k2_60_buffer[1]-k2_60_buffer[2]>=0 || k3_60_buffer[1]-k3_60_buffer[2]>=0) &&
              k1_60_buffer[1]-d1_60_buffer[2]>=1 && 
              k1_60_buffer[1]<=20 && k2_60_buffer[1]<=20 && k3_60_buffer[1]<=20)) ||
            
                                     //m60 [1],[2]�d�U�v�u >=24�I  [1]>0.0001�}-�C  [1]<-0.0001��-�C  [1]>=-0.0010  <=-0.0001
            ((close_60_buffer[1]-open_60_buffer[1]<=-0.0001 && close_60_buffer[1]-open_60_buffer[1]>=-0.0010 && 
              low_60_buffer[1]-close_60_buffer[1]<=-0.0024) ||
             (close_60_buffer[1]-open_60_buffer[1]>=0.0001  && low_60_buffer[1]-open_60_buffer[1]<=-0.0024) &&
             (close_60_buffer[2]-open_60_buffer[2]<=-0.0001 && low_60_buffer[2]-close_60_buffer[2]<=-0.0024) ||
             (close_60_buffer[2]-open_60_buffer[2]>=0.0001  && low_60_buffer[2]-open_60_buffer[2]<=-0.0024) &&
              k1_60_buffer[1]<=20 && k2_60_buffer[1]<=20 && k3_60_buffer[1]<=20 &&
             (low_60_buffer[1]==M15lowest70bar || low_60_buffer[2]==M15lowest70bar)) ||
                                    // [1]�d�U�v�u >=40�I  [1]>0.0001�}-�C  k1,k2,k3>=1  ,k1,k2,k3<=20
            ((close_60_buffer[1]-open_60_buffer[1]>=0.0001  && low_60_buffer[1]-open_60_buffer[1]<=-0.0040) &&
              low_60_buffer[1]==M15lowest70bar &&
              k1_60_buffer[1]-k1_60_buffer[2]>=1 && k2_60_buffer[1]-k2_60_buffer[2]>=1 && k3_60_buffer[1]-k3_60_buffer[2]>=1 &&
              k1_60_buffer[1]<=20 && k2_60_buffer[1]<=20 && k3_60_buffer[1]<=20))
                         
                                            
                                                                 
                                      //return  else  �H�U buy 12   buy13  �ۦP �M buy1  ~  buy 11  ���P
                                      //return  else  �H�U buy 12   buy13  �ۦP �M buy1  ~  buy 11  ���P

               if  ((k2_60_buffer[1]-d2_60_buffer[1]<=-25  &&  k3_60_buffer[1]-d3_60_buffer[1]<=-25) ||
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-10  && k2_60_buffer[1]-d2_60_buffer[1]<=-10  &&  k3_60_buffer[1]-d3_60_buffer[1]<=-10) ||                                   //h4  k2,k3 �b47�W  �}�f�V�U  �����R�� 
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
                         //(m15-57)h4  [1]�^�L140�I
                   (close_240_buffer[1]-open_240_buffer[1]<=-0.0140) ||
                     //(m15-59) h4  ma45,ma90,ma180�䤤���G[1]-[2]<=0    [1]<=-0.0100
                  ((ma45_240_buffer[1]-ma45_240_buffer[2]<=0 || ma90_240_buffer[1]-ma90_240_buffer[2]<=0) &&
                   (ma90_240_buffer[1]-ma90_240_buffer[2]<=0 || ma180_240_buffer[1]-ma180_240_buffer[2]<=0) &&
                    close_240_buffer[1]-open_240_buffer[1]<=-0.0100) ||  
                         //(m15-59) h4 k1||k2||k3 >=65 don't buy
                   (k1_240_buffer[1]>=65 || k2_240_buffer[1]>=65 || k3_240_buffer[1]>=65) ||                   
                      //(m15-57)h4  ma45[1][2]<=-0.0007  ma90[1][2]<=-0.0004  ma45||ma90([1]-[2])-[2]-[3])<=-0.0001 ma45,ma90���Z<=0.0400 >=-0.0035
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0007  &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0004 &&
                  ((ma45_240_buffer[1]-ma45_240_buffer[2])-(ma45_240_buffer[2]-ma45_240_buffer[3])<=-0.0001  ||
                   (ma90_240_buffer[1]-ma90_240_buffer[2])-(ma90_240_buffer[2]-ma90_240_buffer[3])<=-0.0001) &&
                    //(m15-58)   ma45�bma90 �U�����Z<=0.0350 >=-0.0010
                    ma45_240_buffer[1]-ma90_240_buffer[1]<=0.0350 && ma45_240_buffer[1]-ma90_240_buffer[1]>=-0.0010) ||
                          //(m15-58)h4  kd1+kd2+kd3<=-49 kd1,kd2,kd3<=-7
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-49 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-7 && k2_240_buffer[1]-d2_240_buffer[1]<=-7 && k3_240_buffer[1]-d3_240_buffer[1]<=-7) ||
                     //(m15-59)(m15-58)h4  kd1+kd2+kd3<=-40 kd1,kd2,kd3<=-12
                   ((k1_240_buffer[1]-d1_240_buffer[1])+(k2_240_buffer[1]-d2_240_buffer[1])+(k3_240_buffer[1]-d3_240_buffer[1])<=-40 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-12 && k2_240_buffer[1]-d2_240_buffer[1]<=-12 && k3_240_buffer[1]-d3_240_buffer[1]<=-12) ||
                  
                           //(m15-61)(m15-57)h4  [1]�^�L100�I  (ma45<=-0.0015  || [0]<=-0.0150)
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
                  
                      //(m15-66)  kd2,kd3[1]<=-15 k1[0]-[1]<=-5||kd1[1]<=-5   macd<=-0.00300
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                  ((k1_240_buffer[0]-k1_240_buffer[1]<=-5) || (k1_240_buffer[1]-d1_240_buffer[1]<=-5)) &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300) ||    
                    // (m15-16)  kd2,kd3[1]<=-7 k1[0]-[1]<=-7||kd1[1]<=-7      macd[1]<=-0.00350  macd[2]<=-0.00250  (macd[1]-[2]<=-0.00070 || macdmain[1]-[2]<=-0.00150  macdsignal[1]-[2]<=-0.0070 
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-7  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-7 &&
                  ((k1_240_buffer[0]-k1_240_buffer[1]<=-7) || (k1_240_buffer[1]-d1_240_buffer[1]<=-7)) &&
                     macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00350 &&
                    macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]<=-0.00250 && 
                  (((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1])-(macdmainline_240_buffer[2]-macdsignalline_240_buffer[2])<=-0.00070) ||    
                    (macdmainline_240_buffer[1]-macdmainline_240_buffer[2]<=-0.00150 && macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2])<=-0.00070)) ||
                          //ma45  ma90 <=-0.0014
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0014  &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0014) ||
                          //(m15-57) h4 ma45  ma90 <=-0.0010   ma45+ma90<=-0.0029
                   (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0010  &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.0010 &&
                   (ma45_240_buffer[1]-ma45_240_buffer[2])+ (ma90_240_buffer[1]-ma90_240_buffer[2])<=-0.0029) ||

                           //H4 k1,k2,k3���V�U,�� h4,m30,m60 kd2,kd3�V�U�}�f�j �� k1,k,2,k3�b���C
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    k1_240_buffer[0]-k1_240_buffer[1]<=-2 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-19  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-19 &&
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.00300 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-25  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-25 && 
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]-d2_240_buffer[1]<=-15  &&  k3_240_buffer[1]-d3_240_buffer[1]<=-15 &&
                    k2_240_buffer[0]>=40 && k3_240_buffer[1]>=40 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k1_240_buffer[1]-d1_240_buffer[1]<=-10  &&  k2_240_buffer[1]-d2_240_buffer[1]<=-10  && 
                    k3_240_buffer[1]-d3_240_buffer[1]<=-10  &&  k2_240_buffer[0]>=70 && k3_240_buffer[1]>=70 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70  && 
                    k1_240_buffer[1]-k1_240_buffer[2]<=0 &&  k2_240_buffer[1]-k2_240_buffer[2]<=0 && 
                    k3_240_buffer[1]-k3_240_buffer[2]<=0 &&  close_240_buffer[1]-open_240_buffer[1]<=-0.0001 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k1_240_buffer[1]<=15 && k2_240_buffer[1]<=10  &&  k3_240_buffer[1]<=10 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                   (k1_240_buffer[1]<=14 && k2_240_buffer[1]<=14  &&  k3_240_buffer[1]<=14 &&
                                     //h4 ma45 [1]-[2]<=0 &&  ma45 [1]-[2]>=-0.0014 �϶��~���\���R��
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=0 && ma45_240_buffer[1]-ma45_240_buffer[2]>=-0.0014) ||
                                       //34�� �����34���������ʧ@
                   (OrderType()==OP_BUY && TimeCurrent()-OrderCloseTime()<=2000))
                    return;
                    else       
                    OrderClose(OrderTicket(),lots,Bid,1,Teal); 
 //+++++++++++++++++++++++++++++++++++++++++++   CLOSE SELL 14   ++++++++++++++++++++++++++++++++++++++++++++++++++          

         //(m15-62) h1    macd<=-0.00870   �t�Ȧb-50,+50��         �o�ͪ����v���h�ҥH���ϥΪ��p�ư��k
        if    (macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=0.00050 && macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=-0.00050 &&
               macdmainline_60_buffer[1]<=-0.00870 &&
                    //k1,k2,k3  [1]-[2]>=0   k1,k2,k3<=30 || ma180 ,ma360�פW
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

        
                  //(m15-63)  H4     [2][3]����<20�I     [1]����>=10�I  �d�U�v�u>30�I   
      if     (close_240_buffer[1]-open_240_buffer[1]>=0.0010  && low_240_buffer[1]-open_240_buffer[1]<=-0.0030 &&
              close_240_buffer[2]-open_240_buffer[2]<=-0.0009  && close_240_buffer[3]-open_240_buffer[3]<=-0.0009  &&   
               // ma45 ma90 || ma90  ma180  �פW�B�j
             ((ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0008 &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0002) ||
              (ma90_240_buffer[1]-ma90_240_buffer[2]>=0.0006 &&  ma180_240_buffer[1]-ma180_240_buffer[2]>=0.0002)) &&
                // [1]���L�bma05���W  ���W�L15�I
              close_240_buffer[1]-ma05_240_buffer[1]>=0.0001  && close_240_buffer[1]-ma05_240_buffer[1]<=0.0015) 
               // (m15-66) kd2,kd3[1]-[2]<=-7    k2,k2>=70 
              if    (k1_240_buffer[1]-d1_240_buffer[1]<=-7 && k2_240_buffer[1]-d2_240_buffer[1]<=-7 && k3_240_buffer[1]-d3_240_buffer[1]<=-7 &&
                     k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70)
                     return;
                     else 
                     OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 
 //+++++++++++++++++++++++++++++++++++++++++++   CLOSE SELL 16   ++++++++++++++++++++++++++++++++++++++++++++++++++          
              
                   //(m15-65)   h4 �� ma650�פW             ma360�פW�u�u
         if   (ma650_240_buffer[1]-ma650_240_buffer[2]>0 &&
                  //h4 [1]���t�B�bma360���U�����W�L25�I
             ((close_240_buffer[1]-open_240_buffer[1]<=-0.0001 && close_240_buffer[1]-ma360_240_buffer[1]<=-0.0001 &&
               close_240_buffer[1]-ma360_240_buffer[1]>=-0.0025) ||
                 //h4 [1]�����B�bma360���W�����W�L25�I ��[2]�U�v�u�j��25�I
              (close_240_buffer[1]-open_240_buffer[1]>=0.0001 && close_240_buffer[1]-ma360_240_buffer[1]<=-0.0001 &&
               close_240_buffer[1]-ma360_240_buffer[1]>=-0.0025 && low_240_buffer[2]-close_240_buffer[2]<=-0.0025)) &&
                 //k2,k3[1]-[2]>=0    k2,k2<=30  k1[1]-[2]>0 || [1]�U�v�u�j��25�I
               k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
               k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30 &&
              (k1_240_buffer[1]-k1_240_buffer[2]>=0 ||  low_240_buffer[1]-close_240_buffer[1]<=-0.0025) &&  
                  // macd�t��>=-0.00150  <=0.00100 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00150 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100 && 
              // [2]||[3]||[4]||[5]���bma360�W��25�I��  
             ((close_240_buffer[2]-ma360_240_buffer[2]>=0.0001  && close_240_buffer[2]-ma360_240_buffer[2]<=0.0025) ||
              (close_240_buffer[3]-ma360_240_buffer[3]>=0.0001  && close_240_buffer[3]-ma360_240_buffer[3]<=0.0025) ||
              (close_240_buffer[4]-ma360_240_buffer[4]>=0.0001  && close_240_buffer[4]-ma360_240_buffer[4]<=0.0025) ||
              (close_240_buffer[5]-ma360_240_buffer[5]>=0.0001  && close_240_buffer[5]-ma360_240_buffer[5]<=0.0025)))
           
              OrderClose(OrderTicket(),lots,Bid,1,LawnGreen); 
  
 //+++++++++++++++++++++++++++++++++++++++++++   CLOSE SELL 17   ++++++++++++++++++++++++++++++++++++++++++++++++++          
              
                   //(m15-65)   h4 �� ma650�פW          ma180�פW�u�u
         if   (ma650_240_buffer[1]-ma650_240_buffer[2]>0.0001 &&
                  //h4 [1]���t�B�bma180���U�����W�L25�I
             ((close_240_buffer[1]-open_240_buffer[1]<=-0.0001 && close_240_buffer[1]-ma180_240_buffer[1]<=-0.0001 &&
               close_240_buffer[1]-ma180_240_buffer[1]>=-0.0025) ||
                 //h4 [1]�����B�bma180���W�����W�L25�I ��[2]�U�v�u�j��25�I
              (close_240_buffer[1]-open_240_buffer[1]>=0.0001 && close_240_buffer[1]-ma180_240_buffer[1]<=-0.0001 &&
               close_240_buffer[1]-ma180_240_buffer[1]>=-0.0025 && low_240_buffer[2]-close_240_buffer[2]<=-0.0025)) &&
                 //k2,k3[1]-[2]>=0 ||kd2,kd3>=1   k2,k2<=30  k1[1]-[2]>0 || [1]�U�v�u�j��25�I
             ((k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0) ||
              (k2_240_buffer[1]-d2_240_buffer[2]>=1 && k3_240_buffer[1]-d3_240_buffer[2]>=1)) &&
               k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30 &&
              (k1_240_buffer[1]-k1_240_buffer[2]>=0 ||  low_240_buffer[1]-close_240_buffer[1]<=-0.0025) &&  
                  // macd�t��>=-0.00150  <=0.00100 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00150 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100 && 
              // [2]||[3]||[4]||[5]���bma180�W��25�I��  
             ((close_240_buffer[2]-ma180_240_buffer[2]>=0.0001  && close_240_buffer[2]-ma180_240_buffer[2]<=0.0025) ||
              (close_240_buffer[3]-ma180_240_buffer[3]>=0.0001  && close_240_buffer[3]-ma180_240_buffer[3]<=0.0025) ||
              (close_240_buffer[4]-ma180_240_buffer[4]>=0.0001  && close_240_buffer[4]-ma180_240_buffer[4]<=0.0025) ||
              (close_240_buffer[5]-ma180_240_buffer[5]>=0.0001  && close_240_buffer[5]-ma180_240_buffer[5]<=0.0025)))
          
              OrderClose(OrderTicket(),lots,Bid,1,LawnGreen); 
 
 //+++++++++++++++++++++++++++++++++++++++++++   CLOSE SELL 18   ++++++++++++++++++++++++++++++++++++++++++++++++++          
  
          //(m15-65)  ma45�פW  ma90�����αפW   ma180,ma360,ma650�פU  ���bma45���U�w�[�^���W��[1]�d�U�v�u>25�I�B����                      
      if      (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0 &&       
                 // macd�t��>=-0.00150  <=0.00100 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00150 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00100 && 
                   //   k1,k2,k3>=0  k2,k2<=30            
               k1_240_buffer[1]-k1_240_buffer[2]>=0 && k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
               k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30 &&
                 //h4 [1]�����U�v�u�j��25�I
               close_240_buffer[1]-open_240_buffer[1]>=0.0001 &&  low_240_buffer[1]-close_240_buffer[1]<=-0.0025 &&
                  // [1],[2],[3],[4],[5],[6],[7] ���bma45�U��25�I�� ���W5�I�� 
               close_240_buffer[1]-ma45_240_buffer[1]>=-0.0025  && close_240_buffer[1]-ma180_240_buffer[1]<=0.0005 &&
               close_240_buffer[2]-ma45_240_buffer[2]>=-0.0025  && close_240_buffer[2]-ma180_240_buffer[2]<=0.0005 &&
               close_240_buffer[3]-ma45_240_buffer[3]>=-0.0025  && close_240_buffer[3]-ma180_240_buffer[3]<=0.0005 &&
               close_240_buffer[4]-ma45_240_buffer[4]>=-0.0025  && close_240_buffer[4]-ma180_240_buffer[4]<=0.0005 &&
               close_240_buffer[5]-ma45_240_buffer[5]>=-0.0025  && close_240_buffer[5]-ma180_240_buffer[5]<=0.0005 &&
               close_240_buffer[6]-ma45_240_buffer[6]>=-0.0025  && close_240_buffer[6]-ma180_240_buffer[6]<=0.0005)
               OrderClose(OrderTicket(),lots,Bid,1,LawnGreen); 
 
 //+++++++++++++++++++++++++++++++++++++++++++   CLOSE SELL 19   ++++++++++++++++++++++++++++++++++++++++++++++++++          
 
                  //(m15-65) h4  ����@�q�ɶ��^���W�h  ma �ҤU�����e�{�������
       if     (ma05_240_buffer[1]-ma05_240_buffer[10]<=0  &&  ma05_240_buffer[1]-ma05_240_buffer[10]>=-0.0010 &&
               ma45_240_buffer[1]-ma45_240_buffer[10]<=0  &&  ma45_240_buffer[1]-ma45_240_buffer[10]>=-0.0045 &&
               ma90_240_buffer[1]-ma90_240_buffer[10]<=0  &&  ma90_240_buffer[1]-ma90_240_buffer[10]>=-0.0025 &&   
               ma180_240_buffer[1]-ma180_240_buffer[10]<=0  &&  ma180_240_buffer[1]-ma180_240_buffer[10]>=-0.0025 &&
               ma360_240_buffer[1]-ma360_240_buffer[10]<=0  &&  ma360_240_buffer[1]-ma360_240_buffer[10]>=-0.0025 &&
               ma650_240_buffer[1]-ma650_240_buffer[10]<=0  &&  ma650_240_buffer[1]-ma650_240_buffer[10]>=-0.0025 &&
                // [1]~[6] macd�t��>=-0.0050  <=0.0050 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00050 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00050 && 
               macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]>=-0.00050 &&  macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]<=0.00050 && 
               macdmainline_240_buffer[3]-macdsignalline_240_buffer[3]>=-0.00050 &&  macdmainline_240_buffer[3]-macdsignalline_240_buffer[3]<=0.00050 && 
               macdmainline_240_buffer[4]-macdsignalline_240_buffer[4]>=-0.00050 &&  macdmainline_240_buffer[4]-macdsignalline_240_buffer[4]<=0.00050 && 
               macdmainline_240_buffer[5]-macdsignalline_240_buffer[5]>=-0.00050 &&  macdmainline_240_buffer[5]-macdsignalline_240_buffer[5]<=0.00050 && 
               macdmainline_240_buffer[6]-macdsignalline_240_buffer[6]>=-0.00050 &&  macdmainline_240_buffer[6]-macdsignalline_240_buffer[6]<=0.00050)// && 
                //(m15-66)  k2,k3<=0  kd1<=-18  ma45�פU
               if ((k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.0001  && 
                       //(m15-67)  k2,k3 ���פW����U�^  exit
                   ((k2_240_buffer[4]-k2_240_buffer[5]>=3 && k3_240_buffer[4]-k3_240_buffer[5]>=3) ||
                    (k2_240_buffer[5]-k2_240_buffer[6]>=3 && k3_240_buffer[5]-k3_240_buffer[6]>=3)) &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-18) ||
                      //(m15-67) h4 [1]macd �Ȥ���0.00120 �P-0.00120��  �����                                
                   (macdmainline_240_buffer[1]>=-0.00120 && macdmainline_240_buffer[1]<=0.00120 &&
                    macdsignalline_240_buffer[1]>=-0.00120 &&  macdsignalline_240_buffer[1]<=0.00120))
                    return;
                    else
                    OrderClose(OrderTicket(),lots,Bid,1,LawnGreen); 
 //+++++++++++++++++++++++++++++++++++++++++++   CLOSE SELL 20   ++++++++++++++++++++++++++++++++++++++++++++++++++          
       
          //(m15-66)  ma650�פW [1]>=0.0050   ma90 ���W ma45�bma650���U50�I,�B�פW���j    ma90�bma45���U50�I 
        if     (ma650_240_buffer[1]-ma650_240_buffer[2]>=0.0002  && close_240_buffer[1]-open_240_buffer[1]>=0.0050 &&
                ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0007  && ma90_240_buffer[1]-ma90_240_buffer[1]>=0.0002  &&
                ma45_240_buffer[1]-ma650_240_buffer[2]<=-0.0050  && ma90_240_buffer[1]-ma45_240_buffer[1]<=-0.0050 && 
                    //   kd1,kd2,kd3>=4  k2,k3<=35            
                k1_240_buffer[1]-d1_240_buffer[1]>=4 && k2_240_buffer[1]-d2_240_buffer[1]>=4 && k3_240_buffer[1]-d3_240_buffer[1]>=4 &&
                k2_240_buffer[1]<=35 && k3_240_buffer[1]<=35)
                OrderClose(OrderTicket(),lots,Bid,1,LawnGreen); 
 //+++++++++++++++++++++++++++++++++++++++++++   CLOSE SELL 21   ++++++++++++++++++++++++++++++++++++++++++++++++++          
              
                   //(m15-66)   h4 �� ma180,ma360,ma650 �פW ��ma180���� ma360 �פW   
        if   ((ma180_240_buffer[1]-ma180_240_buffer[2]>=-0.0001 && ma360_240_buffer[1]-ma360_240_buffer[2]>=-0.0001 &&
               ma650_240_buffer[1]-ma650_240_buffer[2]>=-0.0001 &&
                  //  macd>=0.00110  <=-0.00110   main && signal >=0.00015   
               macdmainline_240_buffer[1]-macdmainline_240_buffer[2]>=0.00015 && 
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]>=0.00015 &&
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00110 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00110 &&
                     //   kd2,kd3>=3  k2,k3<=35     close[4]||[5]||[6]||[7]>close[1]&& [2] �tw���ʽ�         
               k2_240_buffer[1]-d2_240_buffer[1]>=3 && k3_240_buffer[1]-d3_240_buffer[1]>=3 &&
              (close_240_buffer[4]-open_240_buffer[1]<=0 || close_240_buffer[5]-open_240_buffer[1]<=0 ||
               close_240_buffer[6]-open_240_buffer[1]<=0 || close_240_buffer[7]-open_240_buffer[1]<=0 || 
               close_240_buffer[8]-open_240_buffer[1]<=0 || close_240_buffer[9]-open_240_buffer[1]<=0) && 
              (close_240_buffer[4]-close_240_buffer[2]<=0 || close_240_buffer[5]-close_240_buffer[2]<=0 ||
               close_240_buffer[6]-close_240_buffer[2]<=0 || close_240_buffer[7]-close_240_buffer[2]<=0 || 
               close_240_buffer[8]-close_240_buffer[2]<=0 || close_240_buffer[9]-close_240_buffer[2]<=0) && 
               k2_240_buffer[1]<=35 && k3_240_buffer[1]<=35) ||
  
               //(m15-66)   h4 �� ma180,ma360,ma650 �פW ��ma180���� ma360 �פW   
              (ma180_240_buffer[1]-ma180_240_buffer[2]>=-0.0001 && ma360_240_buffer[1]-ma360_240_buffer[2]>=-0.0001 &&
               ma650_240_buffer[1]-ma650_240_buffer[2]>=-0.0001 &&
                  //  macd>=0.00110  <=-0.00110   main && signal >=0.00015   
               macdmainline_240_buffer[1]-macdmainline_240_buffer[2]>=0.00015 && 
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]>=0.00015 &&
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00110 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00110 &&
                     //   kd2,kd3>=3  k2,k3<=35     close[4]||[5]||[6]||[7]>close[1]&& [2] �tw���ʽ�         
               k2_240_buffer[1]-d2_240_buffer[1]>=3 && k3_240_buffer[1]-d3_240_buffer[1]>=3 &&
              (close_240_buffer[4]-open_240_buffer[1]<=0 || close_240_buffer[5]-open_240_buffer[1]<=0 ||
               close_240_buffer[6]-open_240_buffer[1]<=0 || close_240_buffer[7]-open_240_buffer[1]<=0 || 
               close_240_buffer[8]-open_240_buffer[1]<=0 || close_240_buffer[9]-open_240_buffer[1]<=0) && 
              (close_240_buffer[4]-close_240_buffer[2]<=0 || close_240_buffer[5]-close_240_buffer[2]<=0 ||
               close_240_buffer[6]-close_240_buffer[2]<=0 || close_240_buffer[7]-close_240_buffer[2]<=0 || 
               close_240_buffer[8]-close_240_buffer[2]<=0 || close_240_buffer[9]-close_240_buffer[2]<=0) && 
               k2_240_buffer[1]<=35 && k3_240_buffer[1]<=35) ||
              //(m15-67)   h4 �� ma360, ma650 �פW   ma05||ma08||ma12>=-0.0001 
              (ma360_240_buffer[1]-ma360_240_buffer[2]>=0.0001 && ma650_240_buffer[1]-ma650_240_buffer[2]>=0.0001 &&
              (ma05_240_buffer[1]-ma05_240_buffer[2]>=-0.0001 || ma08_240_buffer[1]-ma08_240_buffer[2]>=-0.0001 ||
               ma12_240_buffer[1]-ma12_240_buffer[2]>=-0.0001) &&
                  //ma45,ma90�w�����  [1]-[6]>=-0.0003
               ma45_240_buffer[1]-ma45_240_buffer[6]>=-0.0003 && ma90_240_buffer[1]-ma90_240_buffer[6]>=-0.0003 &&
                // [1]�U�v�j��30�I          [2],[3]���t  
              (close_240_buffer[1]-open_240_buffer[1]>=0.0001  && low_240_buffer[1]-open_240_buffer[1]<=-0.0030)  ||
               close_240_buffer[1]-open_240_buffer[1]<=-0.0001  && low_240_buffer[1]-close_240_buffer[1]<=-0.0030)  &&
              (close_240_buffer[2]-open_240_buffer[2]<=-0.0001 || close_240_buffer[3]-open_240_buffer[3]<=-0.0001)  && 
                   //   [5]||[6]||[7]||[8]���}�L���b[1]���U   �U�W����U�^�d�U�v�u         
              (open_240_buffer[5]-open_240_buffer[1]<=0 || open_240_buffer[6]-open_240_buffer[1]<=0 ||
               open_240_buffer[7]-open_240_buffer[1]<=0 || open_240_buffer[8]-open_240_buffer[1]<=0 ||
               open_240_buffer[9]-open_240_buffer[1]<=0 || open_240_buffer[10]-open_240_buffer[1]<=0) &&                 //kd2,kd3>=7     
               k2_240_buffer[1]-d2_240_buffer[1]>=3 &&  k3_240_buffer[1]-d3_240_buffer[1]>=3)
               OrderClose(OrderTicket(),lots,Bid,1,LawnGreen); 
 //+++++++++++++++++++++++++++++++++++++++++++   CLOSE SELL 22   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                //�^�Ầ��ma180��A�U�^��ma45�ᤣ�^�F
                //(m15-67)   h4 �� ma45�פW ma90���� ma180 �פU  �W��U�ƦC  ma180,ma90,ma45   
        if    (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.0002 && ma90_240_buffer[1]-ma90_240_buffer[2]>=-0.0001 &&
               ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.0001 && ma45_240_buffer[1]-ma90_240_buffer[1]<=-0.0010 &&
               ma90_240_buffer[1]-ma180_240_buffer[1]<=-0.0010 &&
                     //   kd1,(kd2||kd3)>=3  k1,k2,k3<=25             
               k1_240_buffer[1]-d1_240_buffer[1]>=3 && (k2_240_buffer[1]-d2_240_buffer[1]>=3 || k3_240_buffer[1]-d3_240_buffer[1]>=3) &&
               k2_240_buffer[1]<=25 && k3_240_buffer[1]<=25 &&
               //ma05 [1]-[2]>=0 
               ma05_240_buffer[1]-ma05_240_buffer[2]>=0 &&
                   // [1]�U�v�j��22�I          [2]||[3]���t  
             ((close_240_buffer[1]-open_240_buffer[1]>=0.0001  && low_240_buffer[1]-open_240_buffer[1]<=-0.0022)  ||
              (close_240_buffer[1]-open_240_buffer[1]<=-0.0001  && low_240_buffer[1]-close_240_buffer[1]<=-0.0022))  &&
              (close_240_buffer[2]-open_240_buffer[2]<=-0.0001 || close_240_buffer[3]-open_240_buffer[3]<=-0.0001)   && 
            
                // ([2]||[3]||[4]||[5]) && ([6]||[7]||[8]||[9])  close[1]-ma45<=0.0005 >=-0.0005  ���bma45����
             ((close_240_buffer[2]-ma45_240_buffer[2]<=0.0005 && close_240_buffer[2]-ma45_240_buffer[2]>=-0.0005) || 
              (close_240_buffer[3]-ma45_240_buffer[3]<=0.0005 && close_240_buffer[3]-ma45_240_buffer[3]>=-0.0005) || 
              (close_240_buffer[4]-ma45_240_buffer[4]<=0.0005 && close_240_buffer[4]-ma45_240_buffer[4]>=-0.0005) || 
              (close_240_buffer[5]-ma45_240_buffer[5]<=0.0005 && close_240_buffer[5]-ma45_240_buffer[5]>=-0.0005)) && 
             ((close_240_buffer[6]-ma45_240_buffer[6]<=0.0005 && close_240_buffer[6]-ma45_240_buffer[6]>=-0.0005) || 
              (close_240_buffer[7]-ma45_240_buffer[7]<=0.0005 && close_240_buffer[7]-ma45_240_buffer[7]>=-0.0005) || 
              (close_240_buffer[8]-ma45_240_buffer[8]<=0.0005 && close_240_buffer[8]-ma45_240_buffer[8]>=-0.0005) || 
              (close_240_buffer[9]-ma45_240_buffer[9]<=0.0005 && close_240_buffer[9]-ma45_240_buffer[9]>=-0.0005))) 
               OrderClose(OrderTicket(),lots,Bid,1,LawnGreen); 
 //+++++++++++++++++++++++++++++++++++++++++++   CLOSE SELL 23   ++++++++++++++++++++++++++++++++++++++++++++++++++          

                //����^��ma180�W�U�d�U�v�u
                //(m15-67)   h4 �� ma90,ma180,ma360,ma650 ���פW     �W��U�ƦC  ma90,ma180,ma360,ma650   
        if    (ma90_240_buffer[1]-ma90_240_buffer[2]>0 && ma180_240_buffer[1]-ma180_240_buffer[2]>=0 &&
               ma360_240_buffer[1]-ma360_240_buffer[2]>0 && ma650_240_buffer[1]-ma650_240_buffer[2]>0.0001 &&
               ma90_240_buffer[1]-ma180_240_buffer[1]>=-0.0010 && ma90_240_buffer[1]-ma180_240_buffer[1]<=0.0010 && 
                  //ma45 �}�f�L�W
              (ma90_240_buffer[1]-ma45_240_buffer[1])-(ma90_240_buffer[2]-ma45_240_buffer[2])>0 && 
                   //macd   signal  [1]<[2] [1]>[3] 
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]<=-0.00001 &&
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[3]>=0.00001 &&

                     // [1]�U�v�j��35�I          [2]||[3]���t  
             ((close_240_buffer[1]-open_240_buffer[1]>=0.0001  && low_240_buffer[1]-open_240_buffer[1]<=-0.0035)  ||
              (close_240_buffer[1]-open_240_buffer[1]<=-0.0001  && low_240_buffer[1]-close_240_buffer[1]<=-0.0035))  &&
              (close_240_buffer[2]-open_240_buffer[2]<=-0.0001 || close_240_buffer[3]-open_240_buffer[3]<=-0.0001)) 
               OrderClose(OrderTicket(),lots,Bid,1,LawnGreen); 
          }
 //+++++++++++++++++++++++++++++++++++++++++++   CLOSE SHORTSELL     ++++++++++++++++++++++++++++++++++++++++++++++++++          

    if      (shortbuy01==OrderTicket() || shortbuy02==OrderTicket() || shortbuy03==OrderTicket() || 
             shortbuy04==OrderTicket() || shortbuy05==OrderTicket() || shortbuy06==OrderTicket()) 
       {
  //+++++++++++++++++++++++++++++++++++++++++++   CLOSE SHORTSELL  01   ++++++++++++++++++++++++++++++++++++++++++++++++++          
 
                //����^��ma45�ϼu�W
                //(m15-68)   h4 �� ma45,ma90,ma180,ma360,ma650 ���פW     
        if    (ma45_240_buffer[1]-ma45_240_buffer[2]>=0 && ma90_240_buffer[1]-ma90_240_buffer[2]>=0 &&
               ma180_240_buffer[1]-ma180_240_buffer[2]>=0 && ma360_240_buffer[1]-ma360_240_buffer[2]>=0 &&
               ma650_240_buffer[1]-ma650_240_buffer[2]>=0 &&
                 //ma05���U�^���i�Ӥj
               ma05_240_buffer[1]-ma05_240_buffer[2]>=-0.0025 &&
                   //case�@   //[+1]>[2],[3],[4] [1]>=0.0035    kd1��e�W  k1�j�T�W��   macd�b+-0.00160��
              (close_240_buffer[1]-open_240_buffer[1]>=0.0035  && close_240_buffer[1]-close_240_buffer[2]>=0.0001  &&
               close_240_buffer[1]-close_240_buffer[3]>=0.0001 && close_240_buffer[1]-close_240_buffer[4]>=0.0001  &&
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.00160 &&  
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.00160 &&
               k1_240_buffer[1]-d1_240_buffer[1]>=3 && k1_240_buffer[1]-k1_240_buffer[2]>=8 &&  k1_240_buffer[1]<=25) ||
                 
                   //case�G   //[-3],[+2],[+1]    [-3]<=-0.0035   [1]>[2],[3]
              (close_240_buffer[1]-open_240_buffer[1]>=0.0001  && close_240_buffer[2]-open_240_buffer[2]>=0.0001  &&
               close_240_buffer[3]-open_240_buffer[3]<=-0.0035 && close_240_buffer[1]-close_240_buffer[4]>=0.0001  &&
               close_240_buffer[1]-close_240_buffer[2]>=0  && close_240_buffer[1]-close_240_buffer[3]>=0 &&
               k1_240_buffer[1]-k1_240_buffer[2]>=8 &&  k1_240_buffer[1]<=25) ||
                   //case�T   //[+3],[-2],[+1]   
              (close_240_buffer[1]-open_240_buffer[1]>=0.0010  && close_240_buffer[2]-open_240_buffer[2]<=-0.0001  &&
               close_240_buffer[3]-open_240_buffer[3]>=0.0010 && close_240_buffer[1]-close_240_buffer[4]>=0.0001  &&
               close_240_buffer[1]-close_240_buffer[2]>=0  && close_240_buffer[1]-close_240_buffer[3]>=0 &&
               k1_240_buffer[1]-k1_240_buffer[2]>=8 &&  k1_240_buffer[1]<=25))
               OrderClose(OrderTicket(),lots,Bid,1,Lime); 
    
                                  

      }
//***  Ordermodify   ********************************************************************************** 
                                                         //�p�G�bOrderTakeProfit()��m��J�p�즳����Q�I(Bid-80*Point)��
                                                         //�h�N���|����Q,���찱�l����
                                 //��  high[1] �~�t���|�Ӥj  �����w�����_�h�ϦV���¤]�|���
  //      if (OrderType()==OP_BUY && high_15_buffer[0]-OrderOpenPrice()>=0.0201)
  //          OrderModify(OrderTicket(),OrderOpenPrice(),M15highest16bar-30*Point,OrderTakeProfit(),0,Blue);
       
  //      if (OrderType()==OP_BUY && high_15_buffer[0]-OrderOpenPrice()>=0.0085  && high_15_buffer[0]-OrderOpenPrice()<=0.0200)
  //          OrderModify(OrderTicket(),OrderOpenPrice(),M15highest16bar-35*Point,OrderTakeProfit(),0,Blue);
                  
  //      if (OrderType()==OP_BUY && high_15_buffer[0]-OrderOpenPrice()>=0.0010  && high_15_buffer[0]-OrderOpenPrice()<=0.0100) 
    //        OrderModify(OrderTicket(),OrderOpenPrice(),M15highest16bar-50*Point,OrderTakeProfit(),0,Blue);

         
                                                 //�p��2���H�W�ק�,������Ȥj����b�W��,�åB�n����Ȥp���d�� 
                                    //�� low[1] �~�t���|�Ӥj   �����w���§_�h�ϦV�����]�|���    
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

