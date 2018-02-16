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
 double m05highest16bar;
 double m05highest40bar;
 double m05lowest16bar;
 double m05lowest40bar;
 double m05highest16bartime;
 double m05highest40bartime;
 double m05lowest16bartime;
 double m05lowest40bartime;
 
 m05highest16bar=High[iHighest(NULL,PERIOD_M5,MODE_HIGH,16,1)];   //16bar���̰���
 m05highest40bar=High[iHighest(NULL,PERIOD_M5,MODE_HIGH,40,1)];   //40bar���̰���
 m05highest16bartime=High[iHighest(NULL,PERIOD_M5,MODE_TIME,16,1)];   //16bar���̰������ɶ�
 m05highest40bartime=High[iHighest(NULL,PERIOD_M5,MODE_TIME,40,1)];  //40bar���̰������ɶ�

 m05lowest16bar=Low[iLowest(NULL,PERIOD_M5,MODE_LOW,16,1)];     //16bar���̧C��
 m05lowest40bar=Low[iLowest(NULL,PERIOD_M5,MODE_LOW,40,1)];   //40bar���̧C��
 m05lowest16bartime=Low[iLowest(NULL,PERIOD_M5,MODE_TIME,16,1)];    //16bar���̧C�����ɶ�
 m05lowest40bartime=Low[iLowest(NULL,PERIOD_M5,MODE_TIME,40,1)];    //40bar���̧C�����ɶ�  

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
double cnt,trade,order_id,orderclosetime;
//trade=1;
   for (cnt=0;cnt<OrdersTotal();cnt++)
     {
       OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES);
     } 

 //*** long Buy  1  ***************************************************************************************** 
           
if  (OrdersTotal()<1) 

     {
         
         //    m5 k1,k2,k3�ҤW��,�B�b50�U,[1]����  BUY

     if  (((k1_15_buffer[0]-k1_15_buffer[1]>=3 &&  k2_15_buffer[0]-k2_15_buffer[1]>=1 && k3_15_buffer[0]-k3_15_buffer[1]>=0 &&
            k1_15_buffer[1]<=50 &&   k2_15_buffer[1]<=50 && k3_15_buffer[1]<=50) ||
         
           (k1_30_buffer[0]-k1_30_buffer[1]>=3 &&  k2_30_buffer[0]-k2_30_buffer[1]>=1 && k3_30_buffer[0]-k3_30_buffer[1]>=0 &&
            k1_30_buffer[1]<=50 &&   k2_30_buffer[1]<=50 && k3_30_buffer[1]<=50))) 
            if    (k1_05_buffer[1]-d1_05_buffer[1]>=3 &&   k1_05_buffer[1]<=50)                               
    
                         //m60 m240   k2,k3�|�b�W��,�B�}�f�ܤj  �����R��
            if   ((k2_60_buffer[1]>=45 && k3_60_buffer[1]>=45 &&
                   k2_60_buffer[1]-d2_60_buffer[2]<=-20 && k3_240_buffer[1]-d3_240_buffer[2]<=-20) ||
                  (k2_60_buffer[1]>=50 && k3_60_buffer[1]>=50 &&
                 ((k1_60_buffer[1]-d1_60_buffer[2])+(k2_60_buffer[1]-d2_60_buffer[2])+(k3_60_buffer[1]-d3_60_buffer[2]))<50) ||
                  (k2_240_buffer[1]>=45 && k3_240_buffer[1]>=45 &&
                   k2_240_buffer[1]-d2_240_buffer[2]<=-20 && k3_240_buffer[1]-d3_240_buffer[2]<=-20) || 
                  (k2_240_buffer[1]>=50 && k3_240_buffer[1]>=50 &&
                 ((k1_240_buffer[1]-d1_240_buffer[2])+(k2_240_buffer[1]-d2_240_buffer[2])+(k3_240_buffer[1]-d3_240_buffer[2]))<50) ||
                                    //ma05 �}�f�j���R��
                   ((ma05_15_buffer[1]-ma05_15_buffer[1])-(ma05_15_buffer[2]-ma05_15_buffer[2]))-
                   ((ma05_15_buffer[2]-ma05_15_buffer[2])-(ma05_15_buffer[3]-ma05_15_buffer[3]))<=-0.00010 ||  
                   ((ma05_30_buffer[1]-ma05_30_buffer[1])-(ma05_30_buffer[2]-ma05_30_buffer[2]))-
                   ((ma05_30_buffer[2]-ma05_30_buffer[2])-(ma05_30_buffer[3]-ma05_30_buffer[3]))<=-0.00010 ||  
                   ((ma05_60_buffer[1]-ma05_60_buffer[1])-(ma05_60_buffer[2]-ma05_60_buffer[2]))-
                   ((ma05_60_buffer[2]-ma05_60_buffer[2])-(ma05_60_buffer[3]-ma05_60_buffer[3]))<=-0.00010 ||  
                   ((ma05_240_buffer[1]-ma05_240_buffer[1])-(ma05_240_buffer[2]-ma05_240_buffer[2]))-
                   ((ma05_240_buffer[2]-ma05_240_buffer[2])-(ma05_240_buffer[3]-ma05_240_buffer[3]))<=-0.00010 ||
                                        //macd �t�ȥ[�j
                    macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=-0.001200 ||
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.002500 ||
                  
                    macdmainline_60_buffer[1]-macdmainline_60_buffer[2]<=-0.000010 &&
                    macdmainline_60_buffer[2]-macdmainline_60_buffer[3]<=-0.000010 &&
                    macdsignalline_60_buffer[1]-macdsignalline_60_buffer[2]<=-0.000010 &&
                    macdsignalline_60_buffer[2]-macdsignalline_60_buffer[3]<=-0.000010 ||
                   
                    macdmainline_240_buffer[1]-macdmainline_240_buffer[2]<=-0.000010 &&
                    macdmainline_240_buffer[2]-macdmainline_240_buffer[3]<=-0.000010 &&
                    macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]<=-0.000010 &&
                    macdsignalline_240_buffer[2]-macdsignalline_240_buffer[3]<=-0.000010)
                  return;
                  else
                  longbuy01=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-300*Point,Ask+9000*Point,"My order #LB1",8801,0,Yellow );
//*** long Buy  2  ***************************************************************************************** 
    
                         //k1,2,3,d1,2,3�Ҧb�ܤU,����,macd�Y�p   
     if   ((k1_15_buffer[1]<=15 &&   k2_15_buffer[1]<=15 && k3_15_buffer[1]<=15 &&  
            d1_15_buffer[1]<=15 &&   d2_15_buffer[1]<=15 && d3_15_buffer[1]<=20 &&
            macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.000500 &&
          ((macdmainline_15_buffer[1]-macdsignalline_15_buffer[1])-(macdmainline_15_buffer[2]-macdsignalline_15_buffer[2]))-
          ((macdmainline_15_buffer[2]-macdsignalline_15_buffer[2])-(macdmainline_15_buffer[3]-macdsignalline_15_buffer[3]))>=0.000050 &&  
            close_15_buffer[1]-open_15_buffer[1]<=-0.00001) ||
            
                  //k1,2,3,d1,2,3�Ҧb�ܤU,����,macd�Y�p   
           (k1_30_buffer[1]<=15 &&   k2_30_buffer[1]<=15 && k3_30_buffer[1]<=15 &&  
            d1_30_buffer[1]<=15 &&   d2_30_buffer[1]<=15 && d3_30_buffer[1]<=20 &&
            macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]>=-0.000500 &&
          ((macdmainline_30_buffer[1]-macdsignalline_30_buffer[1])-(macdmainline_30_buffer[2]-macdsignalline_30_buffer[2]))-
          ((macdmainline_30_buffer[2]-macdsignalline_30_buffer[2])-(macdmainline_30_buffer[3]-macdsignalline_30_buffer[3]))>=0.000050 &&  
            close_30_buffer[1]-open_30_buffer[1]<=-0.00001))
                         //m60 m240   k2,k3�|�b�W��,�B�}�f�ܤj  �����R��
            if   ((k2_60_buffer[1]>=45 && k3_60_buffer[1]>=45 &&
                   k2_60_buffer[1]-d2_60_buffer[2]<=-20 && k3_240_buffer[1]-d3_240_buffer[2]<=-20) ||
                  (k2_60_buffer[1]>=50 && k3_60_buffer[1]>=50 &&
                 ((k1_60_buffer[1]-d1_60_buffer[2])+(k2_60_buffer[1]-d2_60_buffer[2])+(k3_60_buffer[1]-d3_60_buffer[2]))<50) ||
                  (k2_240_buffer[1]>=45 && k3_240_buffer[1]>=45 &&
                   k2_240_buffer[1]-d2_240_buffer[2]<=-20 && k3_240_buffer[1]-d3_240_buffer[2]<=-20) || 
                  (k2_240_buffer[1]>=50 && k3_240_buffer[1]>=50 &&
                 ((k1_240_buffer[1]-d1_240_buffer[2])+(k2_240_buffer[1]-d2_240_buffer[2])+(k3_240_buffer[1]-d3_240_buffer[2]))<50) ||
                                 //ma05 �}�f�j���R��
                ((ma05_15_buffer[1]-ma05_15_buffer[1])-(ma05_15_buffer[2]-ma05_15_buffer[2]))-
                ((ma05_15_buffer[2]-ma05_15_buffer[2])-(ma05_15_buffer[3]-ma05_15_buffer[3]))<=-0.00010 ||  
                ((ma05_30_buffer[1]-ma05_30_buffer[1])-(ma05_30_buffer[2]-ma05_30_buffer[2]))-
                ((ma05_30_buffer[2]-ma05_30_buffer[2])-(ma05_30_buffer[3]-ma05_30_buffer[3]))<=-0.00010 ||  
                ((ma05_60_buffer[1]-ma05_60_buffer[1])-(ma05_60_buffer[2]-ma05_60_buffer[2]))-
                ((ma05_60_buffer[2]-ma05_60_buffer[2])-(ma05_60_buffer[3]-ma05_60_buffer[3]))<=-0.00010 ||  
                ((ma05_240_buffer[1]-ma05_240_buffer[1])-(ma05_240_buffer[2]-ma05_240_buffer[2]))-
                ((ma05_240_buffer[2]-ma05_240_buffer[2])-(ma05_240_buffer[3]-ma05_240_buffer[3]))<=-0.00010 ||
                                        //macd �t�ȥ[�j
                    macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=-0.001200 ||
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.002500 ||
                  
                    macdmainline_60_buffer[1]-macdmainline_60_buffer[2]<=-0.000010 &&
                    macdmainline_60_buffer[2]-macdmainline_60_buffer[3]<=-0.000010 &&
                    macdsignalline_60_buffer[1]-macdsignalline_60_buffer[2]<=-0.000010 &&
                    macdsignalline_60_buffer[2]-macdsignalline_60_buffer[3]<=-0.000010 ||
                   
                    macdmainline_240_buffer[1]-macdmainline_240_buffer[2]<=-0.000010 &&
                    macdmainline_240_buffer[2]-macdmainline_240_buffer[3]<=-0.000010 &&
                    macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]<=-0.000010 &&
                    macdsignalline_240_buffer[2]-macdsignalline_240_buffer[3]<=-0.000010)
                  return;
                  else
             longbuy02=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-300*Point,Ask+9000*Point,"My order #LB2",8802,0,Yellow );
     

//*** long Buy  3  ***************************************************************************************** 

                                 //ma05 �}�f�j���R��
        if    ((((ma05_15_buffer[1]-ma05_15_buffer[1])-(ma05_15_buffer[2]-ma05_15_buffer[2]))-
                ((ma05_15_buffer[2]-ma05_15_buffer[2])-(ma05_15_buffer[3]-ma05_15_buffer[3]))>=0.00010  &&
                 (close_15_buffer[1]-open_15_buffer[1]<=-0.00010)) ||  
               (((ma05_30_buffer[1]-ma05_30_buffer[1])-(ma05_30_buffer[2]-ma05_30_buffer[2]))-
                ((ma05_30_buffer[2]-ma05_30_buffer[2])-(ma05_30_buffer[3]-ma05_30_buffer[3]))>=0.00010 &&  
                 (close_30_buffer[1]-open_30_buffer[1]<=-0.00010)) ||  
               (((ma05_60_buffer[1]-ma05_60_buffer[1])-(ma05_60_buffer[2]-ma05_60_buffer[2]))-
                ((ma05_60_buffer[2]-ma05_60_buffer[2])-(ma05_60_buffer[3]-ma05_60_buffer[3]))>=0.00010 &&  
                 (close_60_buffer[1]-open_60_buffer[1]<=-0.00010)) ||  
               (((ma05_240_buffer[1]-ma05_240_buffer[1])-(ma05_240_buffer[2]-ma05_240_buffer[2]))-
                ((ma05_240_buffer[2]-ma05_240_buffer[2])-(ma05_240_buffer[3]-ma05_240_buffer[3]))>=0.00010 &&
                 (close_240_buffer[1]-open_240_buffer[1]<=-0.00030))) 
                  longbuy03=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-300*Point,Ask+9000*Point,"My order #LB3",8803,0,Yellow );

 //*** long Sell  1  ********************************************************************************************************************** 
           
        //    m5 k1,k2,k3�ҤU��,�B�b50�W,[1]���� [2]���� SELL
      if (((k1_15_buffer[0]-k1_15_buffer[1]<=-3 &&  k2_15_buffer[0]-k2_15_buffer[1]<=-1 && k3_15_buffer[0]-k3_15_buffer[1]<=0 &&
            k1_15_buffer[1]>=50 &&   k2_15_buffer[1]>=50 && k3_15_buffer[1]>=50) ||
           (k1_30_buffer[0]-k1_30_buffer[1]<=-3 &&  k2_30_buffer[0]-k2_30_buffer[1]<=-1 && k3_30_buffer[0]-k3_30_buffer[1]<=0 &&
            k1_30_buffer[1]>=50 &&   k2_30_buffer[1]>=50 && k3_30_buffer[1]>=50))) 
          if  (k1_05_buffer[1]-d1_05_buffer[1]<=-3 &&   k1_05_buffer[1]>=50)                               
     
                               //m60 m240   k2,k3�|�b�U��,�B�}�f�ܤj �������
                  if   ((k2_60_buffer[1]<=55 && k3_60_buffer[1]<=55 &&
                         k2_60_buffer[1]-d2_60_buffer[2]>=20 && k3_60_buffer[1]-d3_60_buffer[2]>=20) ||
                        (k2_60_buffer[1]<=50 && k3_60_buffer[1]<=50 &&
                       ((k1_60_buffer[1]-d1_60_buffer[2])+(k2_60_buffer[1]-d2_60_buffer[2])+(k3_60_buffer[1]-d3_60_buffer[2]))>50) ||
                        (k2_240_buffer[1]<=55 && k3_240_buffer[1]<=55 &&
                         k2_240_buffer[1]-d2_240_buffer[2]>=20 && k3_240_buffer[1]-d3_240_buffer[2]>=20) || 
                        (k2_240_buffer[1]<=50 && k3_240_buffer[1]<=50 &&
                       ((k1_240_buffer[1]-d1_240_buffer[2])+(k2_240_buffer[1]-d2_240_buffer[2])+(k3_240_buffer[1]-d3_240_buffer[2]))>50) ||
                                          //ma05 �}�f�j���R��
                         ((ma05_15_buffer[1]-ma05_15_buffer[1])-(ma05_15_buffer[2]-ma05_15_buffer[2]))-
                         ((ma05_15_buffer[2]-ma05_15_buffer[2])-(ma05_15_buffer[3]-ma05_15_buffer[3]))>=0.00010 ||  
                         ((ma05_30_buffer[1]-ma05_30_buffer[1])-(ma05_30_buffer[2]-ma05_30_buffer[2]))-
                         ((ma05_30_buffer[2]-ma05_30_buffer[2])-(ma05_30_buffer[3]-ma05_30_buffer[3]))>=0.00010 ||  
                         ((ma05_60_buffer[1]-ma05_60_buffer[1])-(ma05_60_buffer[2]-ma05_60_buffer[2]))-
                         ((ma05_60_buffer[2]-ma05_60_buffer[2])-(ma05_60_buffer[3]-ma05_60_buffer[3]))>=0.00010 ||  
                         ((ma05_240_buffer[1]-ma05_240_buffer[1])-(ma05_240_buffer[2]-ma05_240_buffer[2]))-
                         ((ma05_240_buffer[2]-ma05_240_buffer[2])-(ma05_240_buffer[3]-ma05_240_buffer[3]))>=0.00010 ||
                                   //macd �t�ȥ[�j
                         macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=0.001200 ||
                         macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.002500 ||
                  
                        macdmainline_60_buffer[1]-macdmainline_60_buffer[2]>=0.000010 &&
                        macdmainline_60_buffer[2]-macdmainline_60_buffer[3]>=0.000010 &&
                        macdsignalline_60_buffer[1]-macdsignalline_60_buffer[2]>=0.000010 &&
                        macdsignalline_60_buffer[2]-macdsignalline_60_buffer[3]>=0.000010 ||
                
                        macdmainline_240_buffer[1]-macdmainline_240_buffer[2]>=0.000010 &&
                        macdmainline_240_buffer[2]-macdmainline_240_buffer[3]>=0.000010 &&
                        macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]>=0.000010 &&
                        macdsignalline_240_buffer[2]-macdsignalline_240_buffer[3]>=0.000010)
                          return;
                          else
                  longsell01=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+300*Point,Bid-9000*Point,"My order #LS1",4403,0,Blue);

  
  //***long Sell  2  ********************************************************************************************************************** 
                           //k1,2,3,d1,2,3�Ҧb�ܤW,����,macd�Y�p   
     if   ((k1_15_buffer[1]>=85 &&   k2_15_buffer[1]>=85 && k3_15_buffer[1]>=85 &&  
            d1_15_buffer[1]>=85 &&   d2_15_buffer[1]>=85 && d3_15_buffer[1]>=80 &&
            macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.000500 &&
          ((macdmainline_15_buffer[1]-macdsignalline_15_buffer[1])-(macdmainline_15_buffer[2]-macdsignalline_15_buffer[2]))-
          ((macdmainline_15_buffer[2]-macdsignalline_15_buffer[2])-(macdmainline_15_buffer[3]-macdsignalline_15_buffer[3]))<=-0.000050 &&  
            close_15_buffer[1]-open_15_buffer[1]>=0.00001) ||
            
                  //k1,2,3,d1,2,3�Ҧb�ܤU,����,macd�Y�p   
           (k1_30_buffer[1]>=85 &&   k2_30_buffer[1]>=85 && k3_30_buffer[1]>=85 &&  
            d1_30_buffer[1]>=85 &&   d2_30_buffer[1]>=85 && d3_30_buffer[1]>=80 &&
            macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.000500 &&
          ((macdmainline_30_buffer[1]-macdsignalline_30_buffer[1])-(macdmainline_30_buffer[2]-macdsignalline_30_buffer[2]))-
          ((macdmainline_30_buffer[2]-macdsignalline_30_buffer[2])-(macdmainline_30_buffer[3]-macdsignalline_30_buffer[3]))<=-0.000050 &&  
            close_30_buffer[1]-open_30_buffer[1]>=0.00001))
                               //m60 m240   k2,k3�|�b�U��,�B�}�f�ܤj �������
                  if   ((k2_60_buffer[1]<=55 && k3_60_buffer[1]<=55 &&
                         k2_60_buffer[1]-d2_60_buffer[2]>=20 && k3_60_buffer[1]-d3_60_buffer[2]>=20) ||
                        (k2_60_buffer[1]<=50 && k3_60_buffer[1]<=50 &&
                       ((k1_60_buffer[1]-d1_60_buffer[2])+(k2_60_buffer[1]-d2_60_buffer[2])+(k3_60_buffer[1]-d3_60_buffer[2]))>50) ||
                        (k2_240_buffer[1]<=55 && k3_240_buffer[1]<=55 &&
                         k2_240_buffer[1]-d2_240_buffer[2]>=20 && k3_240_buffer[1]-d3_240_buffer[2]>=20) || 
                        (k2_240_buffer[1]<=50 && k3_240_buffer[1]<=50 &&
                       ((k1_240_buffer[1]-d1_240_buffer[2])+(k2_240_buffer[1]-d2_240_buffer[2])+(k3_240_buffer[1]-d3_240_buffer[2]))>50) ||
                                          //ma05 �}�f�j���R��
                         ((ma05_15_buffer[1]-ma05_15_buffer[1])-(ma05_15_buffer[2]-ma05_15_buffer[2]))-
                         ((ma05_15_buffer[2]-ma05_15_buffer[2])-(ma05_15_buffer[3]-ma05_15_buffer[3]))>=0.00010 ||  
                         ((ma05_30_buffer[1]-ma05_30_buffer[1])-(ma05_30_buffer[2]-ma05_30_buffer[2]))-
                         ((ma05_30_buffer[2]-ma05_30_buffer[2])-(ma05_30_buffer[3]-ma05_30_buffer[3]))>=0.00010 ||  
                         ((ma05_60_buffer[1]-ma05_60_buffer[1])-(ma05_60_buffer[2]-ma05_60_buffer[2]))-
                         ((ma05_60_buffer[2]-ma05_60_buffer[2])-(ma05_60_buffer[3]-ma05_60_buffer[3]))>=0.00010 ||  
                         ((ma05_240_buffer[1]-ma05_240_buffer[1])-(ma05_240_buffer[2]-ma05_240_buffer[2]))-
                         ((ma05_240_buffer[2]-ma05_240_buffer[2])-(ma05_240_buffer[3]-ma05_240_buffer[3]))>=0.00010 ||
                                   //macd �t�ȥ[�j
                         macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=0.001200 ||
                         macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.002500 ||
                  
                        macdmainline_60_buffer[1]-macdmainline_60_buffer[2]>=0.000010 &&
                        macdmainline_60_buffer[2]-macdmainline_60_buffer[3]>=0.000010 &&
                        macdsignalline_60_buffer[1]-macdsignalline_60_buffer[2]>=0.000010 &&
                        macdsignalline_60_buffer[2]-macdsignalline_60_buffer[3]>=0.000010 ||
                
                        macdmainline_240_buffer[1]-macdmainline_240_buffer[2]>=0.000010 &&
                        macdmainline_240_buffer[2]-macdmainline_240_buffer[3]>=0.000010 &&
                        macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]>=0.000010 &&
                        macdsignalline_240_buffer[2]-macdsignalline_240_buffer[3]>=0.000010)
                         return;
                         else
            longsell02=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+300*Point,Bid-9000*Point,"My order #LS2",4402,0,Blue);
         
  //***long Sell  3  ********************************************************************************************************************** 

                                 //ma05 �}�f�j���R��
        if    ((((ma05_15_buffer[1]-ma05_15_buffer[1])-(ma05_15_buffer[2]-ma05_15_buffer[2]))-
                ((ma05_15_buffer[2]-ma05_15_buffer[2])-(ma05_15_buffer[3]-ma05_15_buffer[3]))<=-0.00010  &&
                 (close_15_buffer[1]-open_15_buffer[1]>=0.00010)) ||  
               (((ma05_30_buffer[1]-ma05_30_buffer[1])-(ma05_30_buffer[2]-ma05_30_buffer[2]))-
                ((ma05_30_buffer[2]-ma05_30_buffer[2])-(ma05_30_buffer[3]-ma05_30_buffer[3]))<=-0.00010 &&  
                 (close_30_buffer[1]-open_30_buffer[1]>=0.00010)) ||  
               (((ma05_60_buffer[1]-ma05_60_buffer[1])-(ma05_60_buffer[2]-ma05_60_buffer[2]))-
                ((ma05_60_buffer[2]-ma05_60_buffer[2])-(ma05_60_buffer[3]-ma05_60_buffer[3]))<=-0.00010 &&  
                 (close_60_buffer[1]-open_60_buffer[1]>=0.00010)) ||  
               (((ma05_240_buffer[1]-ma05_240_buffer[1])-(ma05_240_buffer[2]-ma05_240_buffer[2]))-
                ((ma05_240_buffer[2]-ma05_240_buffer[2])-(ma05_240_buffer[3]-ma05_240_buffer[3]))<=-0.00010 &&
                 (close_240_buffer[1]-open_240_buffer[1]>=0.00030))) 
                 longsell03=OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+300*Point,Bid-9000*Point,"My order #LS3",4404,0,Blue);

 
     }      
    
           

 

        
  if (OrdersTotal()>0)
   {
   for (cnt=0;cnt<OrdersTotal();cnt++)
     {
       OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES);
     
   if    (OrderType()==OP_BUY  &&  OrdersTotal()>=1)
   
         if (((k1_15_buffer[0]-k1_15_buffer[1]<=-3 &&  k2_15_buffer[0]-k2_15_buffer[1]<=-1 && k3_15_buffer[0]-k3_15_buffer[1]<=0 &&
            k1_15_buffer[1]>=50 &&   k2_15_buffer[1]>=50 && k3_15_buffer[1]>=50) ||
           (k1_30_buffer[0]-k1_30_buffer[1]<=-3 &&  k2_30_buffer[0]-k2_30_buffer[1]<=-1 && k3_30_buffer[0]-k3_30_buffer[1]<=0 &&
            k1_30_buffer[1]>=50 &&   k2_30_buffer[1]>=50 && k3_30_buffer[1]>=50))) 
          if  (k1_05_buffer[1]-d1_05_buffer[1]<=-3 &&   k1_05_buffer[1]>=50)                               
     
                         //m60 m240   k2,k3�|�b�W��,�B�}�f�ܤj  �����R��
            if   ((k2_60_buffer[1]>=45 && k3_60_buffer[1]>=45 &&
                   k2_60_buffer[1]-d2_60_buffer[2]<=-20 && k3_240_buffer[1]-d3_240_buffer[2]<=-20) ||
                  (k2_60_buffer[1]>=50 && k3_60_buffer[1]>=50 &&
                 ((k1_60_buffer[1]-d1_60_buffer[2])+(k2_60_buffer[1]-d2_60_buffer[2])+(k3_60_buffer[1]-d3_60_buffer[2]))<50) ||
                  (k2_240_buffer[1]>=45 && k3_240_buffer[1]>=45 &&
                   k2_240_buffer[1]-d2_240_buffer[2]<=-20 && k3_240_buffer[1]-d3_240_buffer[2]<=-20) || 
                  (k2_240_buffer[1]>=50 && k3_240_buffer[1]>=50 &&
                 ((k1_240_buffer[1]-d1_240_buffer[2])+(k2_240_buffer[1]-d2_240_buffer[2])+(k3_240_buffer[1]-d3_240_buffer[2]))<50) ||
                                    //ma05 �}�f�j���R��
                   ((ma05_15_buffer[1]-ma05_15_buffer[1])-(ma05_15_buffer[2]-ma05_15_buffer[2]))-
                   ((ma05_15_buffer[2]-ma05_15_buffer[2])-(ma05_15_buffer[3]-ma05_15_buffer[3]))<=-0.00010 ||  
                   ((ma05_30_buffer[1]-ma05_30_buffer[1])-(ma05_30_buffer[2]-ma05_30_buffer[2]))-
                   ((ma05_30_buffer[2]-ma05_30_buffer[2])-(ma05_30_buffer[3]-ma05_30_buffer[3]))<=-0.00010 ||  
                   ((ma05_60_buffer[1]-ma05_60_buffer[1])-(ma05_60_buffer[2]-ma05_60_buffer[2]))-
                   ((ma05_60_buffer[2]-ma05_60_buffer[2])-(ma05_60_buffer[3]-ma05_60_buffer[3]))<=-0.00010 ||  
                   ((ma05_240_buffer[1]-ma05_240_buffer[1])-(ma05_240_buffer[2]-ma05_240_buffer[2]))-
                   ((ma05_240_buffer[2]-ma05_240_buffer[2])-(ma05_240_buffer[3]-ma05_240_buffer[3]))<=-0.00010 ||
  //close ��ɨҥ~���p�����`�N�M�D����ۤ�                 //macd �t�ȥ[�j
                    macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=-0.001200 ||
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.002500 ||
                  
                    macdmainline_60_buffer[1]-macdmainline_60_buffer[2]<=-0.000010 &&
                    macdmainline_60_buffer[2]-macdmainline_60_buffer[3]<=-0.000010 &&
                    macdsignalline_60_buffer[1]-macdsignalline_60_buffer[2]<=-0.000010 &&
                    macdsignalline_60_buffer[2]-macdsignalline_60_buffer[3]<=-0.000010 ||
                   
                    macdmainline_240_buffer[1]-macdmainline_240_buffer[2]<=-0.000010 &&
                    macdmainline_240_buffer[2]-macdmainline_240_buffer[3]<=-0.000010 &&
                    macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]<=-0.000010 &&
                    macdsignalline_240_buffer[2]-macdsignalline_240_buffer[3]<=-0.000010)
               
                         return;
                         else
                         OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 
 
//*** close Buy  2  ***************************************************************************************** 
     if   ((k1_15_buffer[1]>=85 &&   k2_15_buffer[1]>=85 && k3_15_buffer[1]>=85 &&  
            d1_15_buffer[1]>=85 &&   d2_15_buffer[1]>=85 && d3_15_buffer[1]>=80 &&
            macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]<=0.000500 &&
          ((macdmainline_15_buffer[1]-macdsignalline_15_buffer[1])-(macdmainline_15_buffer[2]-macdsignalline_15_buffer[2]))-
          ((macdmainline_15_buffer[2]-macdsignalline_15_buffer[2])-(macdmainline_15_buffer[3]-macdsignalline_15_buffer[3]))<=-0.000050 &&  
            close_15_buffer[1]-open_15_buffer[1]>=0.00001) ||
            
                  //k1,2,3,d1,2,3�Ҧb�ܤU,����,macd�Y�p   
           (k1_30_buffer[1]>=85 &&   k2_30_buffer[1]>=85 && k3_30_buffer[1]>=85 &&  
            d1_30_buffer[1]>=85 &&   d2_30_buffer[1]>=85 && d3_30_buffer[1]>=80 &&
            macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]<=0.000500 &&
          ((macdmainline_30_buffer[1]-macdsignalline_30_buffer[1])-(macdmainline_30_buffer[2]-macdsignalline_30_buffer[2]))-
          ((macdmainline_30_buffer[2]-macdsignalline_30_buffer[2])-(macdmainline_30_buffer[3]-macdsignalline_30_buffer[3]))<=-0.000050 &&  
            close_30_buffer[1]-open_30_buffer[1]>=0.00001))
                         //m60 m240   k2,k3�|�b�W��,�B�}�f�ܤj  �����R��
            if   ((k2_60_buffer[1]>=45 && k3_60_buffer[1]>=45 &&
                   k2_60_buffer[1]-d2_60_buffer[2]<=-20 && k3_240_buffer[1]-d3_240_buffer[2]<=-20) ||
                  (k2_60_buffer[1]>=50 && k3_60_buffer[1]>=50 &&
                 ((k1_60_buffer[1]-d1_60_buffer[2])+(k2_60_buffer[1]-d2_60_buffer[2])+(k3_60_buffer[1]-d3_60_buffer[2]))<50) ||
                  (k2_240_buffer[1]>=45 && k3_240_buffer[1]>=45 &&
                   k2_240_buffer[1]-d2_240_buffer[2]<=-20 && k3_240_buffer[1]-d3_240_buffer[2]<=-20) || 
                  (k2_240_buffer[1]>=50 && k3_240_buffer[1]>=50 &&
                 ((k1_240_buffer[1]-d1_240_buffer[2])+(k2_240_buffer[1]-d2_240_buffer[2])+(k3_240_buffer[1]-d3_240_buffer[2]))<50) ||
                                    //ma05 �}�f�j���R��
                   ((ma05_15_buffer[1]-ma05_15_buffer[1])-(ma05_15_buffer[2]-ma05_15_buffer[2]))-
                   ((ma05_15_buffer[2]-ma05_15_buffer[2])-(ma05_15_buffer[3]-ma05_15_buffer[3]))<=-0.00010 ||  
                   ((ma05_30_buffer[1]-ma05_30_buffer[1])-(ma05_30_buffer[2]-ma05_30_buffer[2]))-
                   ((ma05_30_buffer[2]-ma05_30_buffer[2])-(ma05_30_buffer[3]-ma05_30_buffer[3]))<=-0.00010 ||  
                   ((ma05_60_buffer[1]-ma05_60_buffer[1])-(ma05_60_buffer[2]-ma05_60_buffer[2]))-
                   ((ma05_60_buffer[2]-ma05_60_buffer[2])-(ma05_60_buffer[3]-ma05_60_buffer[3]))<=-0.00010 ||  
                   ((ma05_240_buffer[1]-ma05_240_buffer[1])-(ma05_240_buffer[2]-ma05_240_buffer[2]))-
                   ((ma05_240_buffer[2]-ma05_240_buffer[2])-(ma05_240_buffer[3]-ma05_240_buffer[3]))<=-0.00010 ||
  //close ��ɨҥ~���p�����`�N�M�D����ۤ�                 //macd �t�ȥ[�j
                    macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]<=-0.001200 ||
                    macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.002500 ||
                  
                    macdmainline_60_buffer[1]-macdmainline_60_buffer[2]<=-0.000010 &&
                    macdmainline_60_buffer[2]-macdmainline_60_buffer[3]<=-0.000010 &&
                    macdsignalline_60_buffer[1]-macdsignalline_60_buffer[2]<=-0.000010 &&
                    macdsignalline_60_buffer[2]-macdsignalline_60_buffer[3]<=-0.000010 ||
                   
                    macdmainline_240_buffer[1]-macdmainline_240_buffer[2]<=-0.000010 &&
                    macdmainline_240_buffer[2]-macdmainline_240_buffer[3]<=-0.000010 &&
                    macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]<=-0.000010 &&
                    macdsignalline_240_buffer[2]-macdsignalline_240_buffer[3]<=-0.000010)
                         return;
                         else
                         OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 
 
 
   //***close buy  3  ********************************************************************************************************************** 

                                 //ma05 �}�f�j���R��
        if    ((((ma05_15_buffer[1]-ma05_15_buffer[1])-(ma05_15_buffer[2]-ma05_15_buffer[2]))-
                ((ma05_15_buffer[2]-ma05_15_buffer[2])-(ma05_15_buffer[3]-ma05_15_buffer[3]))<=-0.00010  &&
                 (close_15_buffer[1]-open_15_buffer[1]>=0.00010)) ||  
               (((ma05_30_buffer[1]-ma05_30_buffer[1])-(ma05_30_buffer[2]-ma05_30_buffer[2]))-
                ((ma05_30_buffer[2]-ma05_30_buffer[2])-(ma05_30_buffer[3]-ma05_30_buffer[3]))<=-0.00010 &&  
                 (close_30_buffer[1]-open_30_buffer[1]>=0.00010)) ||  
               (((ma05_60_buffer[1]-ma05_60_buffer[1])-(ma05_60_buffer[2]-ma05_60_buffer[2]))-
                ((ma05_60_buffer[2]-ma05_60_buffer[2])-(ma05_60_buffer[3]-ma05_60_buffer[3]))<=-0.00010 &&  
                 (close_60_buffer[1]-open_60_buffer[1]>=0.00010)) ||  
               (((ma05_240_buffer[1]-ma05_240_buffer[1])-(ma05_240_buffer[2]-ma05_240_buffer[2]))-
                ((ma05_240_buffer[2]-ma05_240_buffer[2])-(ma05_240_buffer[3]-ma05_240_buffer[3]))<=-0.00010 &&
                 (close_240_buffer[1]-open_240_buffer[1]>=0.00030))) 

                  OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 

 
 
 //*** close Sell  1  ********************************************************************************************************************** 
           
   if    (OrderType()==OP_SELL  &&  OrdersTotal()>=1)
 
     if  (((k1_15_buffer[0]-k1_15_buffer[1]>=3 &&  k2_15_buffer[0]-k2_15_buffer[1]>=1 && k3_15_buffer[0]-k3_15_buffer[1]>=0 &&
            k1_15_buffer[1]<=50 &&   k2_15_buffer[1]<=50 && k3_15_buffer[1]<=50) ||
         
           (k1_30_buffer[0]-k1_30_buffer[1]>=3 &&  k2_30_buffer[0]-k2_30_buffer[1]>=1 && k3_30_buffer[0]-k3_30_buffer[1]>=0 &&
            k1_30_buffer[1]<=50 &&   k2_30_buffer[1]<=50 && k3_30_buffer[1]<=50))) 
            if    (k1_05_buffer[1]-d1_05_buffer[1]>=3 &&   k1_05_buffer[1]<=50)                               
    
                         //m60 m240   k2,k3�|�b�U��,�B�}�f�ܤj �������
            if   ((k2_60_buffer[1]<=55 && k3_60_buffer[1]<=55 &&
                   k2_60_buffer[1]-d2_60_buffer[2]>=20 && k3_60_buffer[1]-d3_60_buffer[2]>=20) ||
                  (k2_60_buffer[1]<=50 && k3_60_buffer[1]<=50 &&
                 ((k1_60_buffer[1]-d1_60_buffer[2])+(k2_60_buffer[1]-d2_60_buffer[2])+(k3_60_buffer[1]-d3_60_buffer[2]))>50) ||
                  (k2_240_buffer[1]<=55 && k3_240_buffer[1]<=55 &&
                   k2_240_buffer[1]-d2_240_buffer[2]>=20 && k3_240_buffer[1]-d3_240_buffer[2]>=20) || 
                  (k2_240_buffer[1]<=50 && k3_240_buffer[1]<=50 &&
                 ((k1_240_buffer[1]-d1_240_buffer[2])+(k2_240_buffer[1]-d2_240_buffer[2])+(k3_240_buffer[1]-d3_240_buffer[2]))>50) ||
                                    //ma05 �}�f�j���R��
                   ((ma05_15_buffer[1]-ma05_15_buffer[1])-(ma05_15_buffer[2]-ma05_15_buffer[2]))-
                   ((ma05_15_buffer[2]-ma05_15_buffer[2])-(ma05_15_buffer[3]-ma05_15_buffer[3]))>=0.00010 ||  
                   ((ma05_30_buffer[1]-ma05_30_buffer[1])-(ma05_30_buffer[2]-ma05_30_buffer[2]))-
                   ((ma05_30_buffer[2]-ma05_30_buffer[2])-(ma05_30_buffer[3]-ma05_30_buffer[3]))>=0.00010 ||  
                   ((ma05_60_buffer[1]-ma05_60_buffer[1])-(ma05_60_buffer[2]-ma05_60_buffer[2]))-
                   ((ma05_60_buffer[2]-ma05_60_buffer[2])-(ma05_60_buffer[3]-ma05_60_buffer[3]))>=0.00010 ||  
                   ((ma05_240_buffer[1]-ma05_240_buffer[1])-(ma05_240_buffer[2]-ma05_240_buffer[2]))-
                   ((ma05_240_buffer[2]-ma05_240_buffer[2])-(ma05_240_buffer[3]-ma05_240_buffer[3]))>=0.00010 ||
  //close ��ɨҥ~���p�����`�N�M�D����ۤ�                 //macd �t�ȥ[�j
                   macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=0.001200 ||
                   macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.002500 ||
            
                  macdmainline_60_buffer[1]-macdmainline_60_buffer[2]>=0.000010 &&
                  macdmainline_60_buffer[2]-macdmainline_60_buffer[3]>=0.000010 &&
                  macdsignalline_60_buffer[1]-macdsignalline_60_buffer[2]>=0.000010 &&
                  macdsignalline_60_buffer[2]-macdsignalline_60_buffer[3]>=0.000010 ||
          
                  macdmainline_240_buffer[1]-macdmainline_240_buffer[2]>=0.000010 &&
                  macdmainline_240_buffer[2]-macdmainline_240_buffer[3]>=0.000010 &&
                  macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]>=0.000010 &&
                  macdsignalline_240_buffer[2]-macdsignalline_240_buffer[3]>=0.000010)
                   return;
                   else
                  OrderClose(OrderTicket(),lots,Ask,1,Gold);  

  
  //***close long Sell  2  ********************************************************************************************************************** 
           
    
                         //k1,2,3,d1,2,3�Ҧb�ܤU,����,macd�Y�p   
     if   ((k1_15_buffer[1]<=15 &&   k2_15_buffer[1]<=15 && k3_15_buffer[1]<=15 &&  
            d1_15_buffer[1]<=15 &&   d2_15_buffer[1]<=15 && d3_15_buffer[1]<=20 &&
            macdmainline_15_buffer[1]-macdsignalline_15_buffer[1]>=-0.000500 &&
          ((macdmainline_15_buffer[1]-macdsignalline_15_buffer[1])-(macdmainline_15_buffer[2]-macdsignalline_15_buffer[2]))-
          ((macdmainline_15_buffer[2]-macdsignalline_15_buffer[2])-(macdmainline_15_buffer[3]-macdsignalline_15_buffer[3]))>=0.000050 &&  
            close_15_buffer[1]-open_15_buffer[1]<=-0.00001) ||
            
                  //k1,2,3,d1,2,3�Ҧb�ܤU,����,macd�Y�p   
           (k1_30_buffer[1]<=15 &&   k2_30_buffer[1]<=15 && k3_30_buffer[1]<=15 &&  
            d1_30_buffer[1]<=15 &&   d2_30_buffer[1]<=15 && d3_30_buffer[1]<=20 &&
            macdmainline_30_buffer[1]-macdsignalline_30_buffer[1]>=-0.000500 &&
          ((macdmainline_30_buffer[1]-macdsignalline_30_buffer[1])-(macdmainline_30_buffer[2]-macdsignalline_30_buffer[2]))-
          ((macdmainline_30_buffer[2]-macdsignalline_30_buffer[2])-(macdmainline_30_buffer[3]-macdsignalline_30_buffer[3]))>=0.000050 &&  
            close_30_buffer[1]-open_30_buffer[1]<=-0.00001))
                         //m60 m240   k2,k3�|�b�U��,�B�}�f�ܤj �������
            if   ((k2_60_buffer[1]<=55 && k3_60_buffer[1]<=55 &&
                   k2_60_buffer[1]-d2_60_buffer[2]>=20 && k3_60_buffer[1]-d3_60_buffer[2]>=20) ||
                  (k2_60_buffer[1]<=50 && k3_60_buffer[1]<=50 &&
                 ((k1_60_buffer[1]-d1_60_buffer[2])+(k2_60_buffer[1]-d2_60_buffer[2])+(k3_60_buffer[1]-d3_60_buffer[2]))>50) ||
                  (k2_240_buffer[1]<=55 && k3_240_buffer[1]<=55 &&
                   k2_240_buffer[1]-d2_240_buffer[2]>=20 && k3_240_buffer[1]-d3_240_buffer[2]>=20) || 
                  (k2_240_buffer[1]<=50 && k3_240_buffer[1]<=50 &&
                 ((k1_240_buffer[1]-d1_240_buffer[2])+(k2_240_buffer[1]-d2_240_buffer[2])+(k3_240_buffer[1]-d3_240_buffer[2]))>50) ||
                                    //ma05 �}�f�j���R��
                   ((ma05_15_buffer[1]-ma05_15_buffer[1])-(ma05_15_buffer[2]-ma05_15_buffer[2]))-
                   ((ma05_15_buffer[2]-ma05_15_buffer[2])-(ma05_15_buffer[3]-ma05_15_buffer[3]))>=0.00010 ||  
                   ((ma05_30_buffer[1]-ma05_30_buffer[1])-(ma05_30_buffer[2]-ma05_30_buffer[2]))-
                   ((ma05_30_buffer[2]-ma05_30_buffer[2])-(ma05_30_buffer[3]-ma05_30_buffer[3]))>=0.00010 ||  
                   ((ma05_60_buffer[1]-ma05_60_buffer[1])-(ma05_60_buffer[2]-ma05_60_buffer[2]))-
                   ((ma05_60_buffer[2]-ma05_60_buffer[2])-(ma05_60_buffer[3]-ma05_60_buffer[3]))>=0.00010 ||  
                   ((ma05_240_buffer[1]-ma05_240_buffer[1])-(ma05_240_buffer[2]-ma05_240_buffer[2]))-
                   ((ma05_240_buffer[2]-ma05_240_buffer[2])-(ma05_240_buffer[3]-ma05_240_buffer[3]))>=0.00010 ||
  //close ��ɨҥ~���p�����`�N�M�D����ۤ�                 //macd �t�ȥ[�j
                   macdmainline_60_buffer[1]-macdsignalline_60_buffer[1]>=0.001200 ||
                   macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.002500 ||
            
                  macdmainline_60_buffer[1]-macdmainline_60_buffer[2]>=0.000010 &&
                  macdmainline_60_buffer[2]-macdmainline_60_buffer[3]>=0.000010 &&
                  macdsignalline_60_buffer[1]-macdsignalline_60_buffer[2]>=0.000010 &&
                  macdsignalline_60_buffer[2]-macdsignalline_60_buffer[3]>=0.000010 ||
          
                  macdmainline_240_buffer[1]-macdmainline_240_buffer[2]>=0.000010 &&
                  macdmainline_240_buffer[2]-macdmainline_240_buffer[3]>=0.000010 &&
                  macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]>=0.000010 &&
                  macdsignalline_240_buffer[2]-macdsignalline_240_buffer[3]>=0.000010)
                   return;
                   else
                  OrderClose(OrderTicket(),lots,Ask,1,Gold);  
          
          
          
 //*** close sell  3  ***************************************************************************************** 

                                 //ma05 �}�f�j���R��
        if    ((((ma05_15_buffer[1]-ma05_15_buffer[1])-(ma05_15_buffer[2]-ma05_15_buffer[2]))-
                ((ma05_15_buffer[2]-ma05_15_buffer[2])-(ma05_15_buffer[3]-ma05_15_buffer[3]))>=0.00010  &&
                 (close_15_buffer[1]-open_15_buffer[1]<=-0.00010)) ||  
               (((ma05_30_buffer[1]-ma05_30_buffer[1])-(ma05_30_buffer[2]-ma05_30_buffer[2]))-
                ((ma05_30_buffer[2]-ma05_30_buffer[2])-(ma05_30_buffer[3]-ma05_30_buffer[3]))>=0.00010 &&  
                 (close_30_buffer[1]-open_30_buffer[1]<=-0.00010)) ||  
               (((ma05_60_buffer[1]-ma05_60_buffer[1])-(ma05_60_buffer[2]-ma05_60_buffer[2]))-
                ((ma05_60_buffer[2]-ma05_60_buffer[2])-(ma05_60_buffer[3]-ma05_60_buffer[3]))>=0.00010 &&  
                 (close_60_buffer[1]-open_60_buffer[1]<=-0.00010)) ||  
               (((ma05_240_buffer[1]-ma05_240_buffer[1])-(ma05_240_buffer[2]-ma05_240_buffer[2]))-
                ((ma05_240_buffer[2]-ma05_240_buffer[2])-(ma05_240_buffer[3]-ma05_240_buffer[3]))>=0.00010 &&
                 (close_240_buffer[1]-open_240_buffer[1]<=-0.00030))) 
                  OrderClose(OrderTicket(),lots,Ask,1,Gold);  
 
  }  
  }
 


return(0);  
}
//+------------------------------------------------------------------+
