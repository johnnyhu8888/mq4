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

        
  if (OrdersTotal()>0)
   {
   for (cnt=0;cnt<OrdersTotal();cnt++)
     {
       OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES);
 
 //**************************   oders modify  ***************************************************************88
 //**************************   oders modify  ***************************************************************88
                            //���@��
//           if    (OrderType()==OP_BUY && (OrderMagicNumber( )==8801 || OrderMagicNumber( )==88011) &&
      //     if    (OrderType()==OP_BUY && //OrderMagicNumber( )!=8806 &&
      //            high_05_buffer[0]-OrderOpenPrice()>=0.01000 && high_05_buffer[0]-OrderOpenPrice()<=0.01010) 
                             //stoploss=OrderOpenPrice()+40*Point�i�H��4�I
     //             OrderModify(OrderTicket(),Ask,OrderOpenPrice()+600*Point,OrderTakeProfit(),0,Blue);
//           if    (OrderType()==OP_BUY && (OrderMagicNumber( )==8801 || OrderMagicNumber( )==88011) &&
     //      if    (OrderType()==OP_BUY && //OrderMagicNumber( )!=8806 &&
     //             high_05_buffer[0]-OrderOpenPrice()>=0.00700 && high_05_buffer[0]-OrderOpenPrice()<=0.00710) 
                             //stoploss=OrderOpenPrice()+40*Point�i�H��4�I
      //            OrderModify(OrderTicket(),Ask,OrderOpenPrice()+300*Point,OrderTakeProfit(),0,Blue);
 //          if    (OrderType()==OP_BUY && (OrderMagicNumber( )==8801 || OrderMagicNumber( )==88011) &&
      //     if    (OrderType()==OP_BUY && //OrderMagicNumber( )!=8806 &&
      //            high_05_buffer[0]-OrderOpenPrice()>=0.00300 && high_05_buffer[0]-OrderOpenPrice()<=0.00310) 
                             //stoploss=OrderOpenPrice()+40*Point�i�H��4�I
       //           OrderModify(OrderTicket(),Ask,OrderOpenPrice()+30*Point,OrderTakeProfit(),0,Blue);
                                                   //44011���ϦV��H�w������h       
//           if    (OrderType()==OP_BUY && (OrderMagicNumber( )==8807 || OrderMagicNumber( )==8806) &&
           if    (OrderType()==OP_BUY &&// OrderMagicNumber( )==8806 &&
                  high_05_buffer[0]-OrderOpenPrice()>=0.00500 && high_05_buffer[0]-OrderOpenPrice()<=0.00510) 
                             //stoploss=OrderOpenPrice()+40*Point�i�H��4�I
                  OrderModify(OrderTicket(),Ask,OrderOpenPrice()+80*Point,OrderTakeProfit(),0,Blue);
  
          if    (OrderType()==OP_BUY && (OrderMagicNumber( )!=8807 || OrderMagicNumber( )!=8809) &&  //       if    (OrderType()==OP_BUY && // OrderMagicNumber( )==8806 &&
                 high_05_buffer[0]-OrderOpenPrice()>=0.00290 && high_05_buffer[0]-OrderOpenPrice()<=0.00300) 
                             //stoploss=OrderOpenPrice()-40*Point��3�I
                 OrderModify(OrderTicket(),Ask,OrderOpenPrice()-150*Point,OrderTakeProfit(),0,Blue);

//          if    (OrderType()==OP_BUY && (OrderMagicNumber( )==8807 || OrderMagicNumber( )==8806) &&
  //        if    (OrderType()==OP_BUY && // OrderMagicNumber( )==8806 &&
   //              high_05_buffer[0]-OrderOpenPrice()>=0.00130 && high_05_buffer[0]-OrderOpenPrice()<=0.00140) 
                             //stoploss=OrderOpenPrice()-40*Point��3�I
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
                                                  //44011���ϦV��H�w������h
 //          if    (OrderType()==OP_SELL && (OrderMagicNumber( )==4407 || OrderMagicNumber( )==4406) &&
           if    (OrderType()==OP_SELL && //OrderMagicNumber( )==4406 &&
                  low_05_buffer[0]-OrderOpenPrice()<=-0.00500 && low_05_buffer[0]-OrderOpenPrice()>=-0.00510) 
                  OrderModify(OrderTicket(),Bid,OrderOpenPrice()-80*Point,OrderTakeProfit(),0,Blue);
                                                 //44011���ϦV��H�w������h 
            if    (OrderType()==OP_SELL && (OrderMagicNumber( )!=4407 || OrderMagicNumber( )!=4409) &&
     //     if    (OrderType()==OP_SELL && // OrderMagicNumber( )==4406 &&
                  low_05_buffer[0]-OrderOpenPrice()<=-0.00290 && low_05_buffer[0]-OrderOpenPrice()>=-0.00300) 
                 OrderModify(OrderTicket(),Bid,OrderOpenPrice()+150*Point,OrderTakeProfit(),0,Blue);
         
 //         if    (OrderType()==OP_SELL && // OrderMagicNumber( )==4406 &&
//                 low_05_buffer[0]-OrderOpenPrice()<=-0.00130 && low_05_buffer[0]-OrderOpenPrice()>=-0.00140) 
//                 OrderModify(OrderTicket(),Bid,OrderOpenPrice()+150*Point,OrderTakeProfit(),0,Blue);
      
//**************************   oders close  ***************************************************************88
//close��ɦp�G�R������m�N�|�@���h��close �}��Nclose 
//**************************   oders close  ***************************************************************88
 
//���q�w���@��                          �[�W���C�@���|�U3�i��
 //          if    (OrderType()==OP_BUY && OrderMagicNumber( )==8806 && //)  || OrderMagicNumber( )==4402) &&
//          if    (OrderType()==OP_BUY && (OrderMagicNumber( )==8808 || OrderMagicNumber( )==8807 || OrderMagicNumber( )==8806) &&
//                  TimeCurrent()- OrderOpenTime()>=2000 &&  TimeCurrent()- OrderOpenTime()<=7500 && 
//                  close_15_buffer[0]-open_15_buffer[0]<=-0.00030 && close_15_buffer[1]-open_15_buffer[1]<=-0.00030)
//                  OrderClose(OrderTicket(),lots,Bid,1,Gold); 
//              if  (TimeCurrent()- OrderOpenTime()>=700 && TimeCurrent()- OrderOpenTime()<=2000 &&
//                  (close_05_buffer[1]-OrderOpenPrice()<=0.00050 && close_05_buffer[2]-OrderOpenPrice()<=0.00050) || 
                          //[0]���P�_�קK����
//                  (close_05_buffer[0]-OrderOpenPrice()<=0.00050)) 
//                   OrderClose(OrderTicket(),lots,Bid,1,Gold);    
                                  //���P�_�ϦV�ҤU��
//           if    (OrderType()==OP_BUY && (OrderMagicNumber( )==8808 || OrderMagicNumber( )==8807))
       //     if    (OrderType()==OP_BUY && OrderMagicNumber( )==8801) // || OrderMagicNumber( )==88011))
                                //��쬰��,��1.5�p��
       //       if  (TimeCurrent()- OrderOpenTime()>=7000 &&// TimeCurrent()- OrderOpenTime()<=5000 &&
       //           (close_15_buffer[1]-OrderOpenPrice()<=0.00050 && close_15_buffer[2]-OrderOpenPrice()<=0.00050))
                          //[0]���P�_�קK����
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
                        // �[�W���C�@���|�U3�i��
 //           if    (OrderType()==OP_SELL &&  OrderMagicNumber( )==4406 && //) || OrderMagicNumber( )==4402) &&
//             if    (OrderType()==OP_SELL && (OrderMagicNumber( )==4408 || OrderMagicNumber( )==4407 || OrderMagicNumber( )==4406) &&
//                  TimeCurrent()- OrderOpenTime()>=2000 &&  TimeCurrent()- OrderOpenTime()<=7500 && 
//                   close_15_buffer[0]-open_15_buffer[0]>=0.00030 && close_15_buffer[1]-open_15_buffer[1]>=0.00030)
//                   OrderClose(OrderTicket(),lots,Ask,1,Gold);   


//              if  (TimeCurrent()- OrderOpenTime()>=700 && TimeCurrent()- OrderOpenTime()<=2000 &&
//                  (close_05_buffer[1]-OrderOpenPrice()>=-0.00050 && close_05_buffer[2]-OrderOpenPrice()>=-0.00050) ||
                          //[0]���P�_�קK����
//                  (close_05_buffer[0]-OrderOpenPrice()>=-0.00050))
//                   OrderClose(OrderTicket(),lots,Ask,1,Gold);    
                                 //���P�_�ϦV�ҤU��
//            if    (OrderType()==OP_SELL && (OrderMagicNumber( )==4408 || OrderMagicNumber( )==4407))
     //       if    (OrderType()==OP_SELL && OrderMagicNumber( )==4401)// || OrderMagicNumber( )==44011))
//                                //��쬰��,���b�p��
     //         if (TimeCurrent()- OrderOpenTime()>=7000 && //TimeCurrent()- OrderOpenTime()<=5000 &&
     //            (close_15_buffer[1]-OrderOpenPrice()>=-0.00050 && close_15_buffer[2]-OrderOpenPrice()>=-0.00050))
                           //[0]���P�_�קK����
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
//���K���u��Ĭ���close ,�}���1800������� 
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
          
 // m15 k1,k2,k3�ҤU��,�B�b50�W,[1]���� [2]���� SELL
      if  ((k1_15_buffer[1]-k1_15_buffer[2]<=-3 &&  k2_15_buffer[1]-k2_15_buffer[2]<=-1 && k3_15_buffer[1]-k3_15_buffer[2]<=0 &&
            k1_15_buffer[1]>=50 &&   k2_15_buffer[1]>=50 && k3_15_buffer[1]>=50)) 
          if  (k1_05_buffer[1]-d1_05_buffer[1]<=-3 &&   k1_05_buffer[1]>=50)                               
     
   
 //H1,H4 kd�Ȯt����>10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]>=10 && k3_60_buffer[1]-d3_60_buffer[2]>=10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]>=10 && k3_240_buffer[1]-d3_240_buffer[2]>=10) ||
 
 //H1,H4 k2,k3�b�C�I,��H4 k1,k,k3�b�C�I
                    (k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
                    (k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
 
 //H4 ma05 �W��,macd�b1150�~,���L��ma05�y���Z����kd1,kd2,kd3���}�f�B�V�W
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]>=7 && k2_240_buffer[1]-d2_240_buffer[1]>=7 && k3_240_buffer[1]-d3_240_buffer[2]>=7 &&
                     k2_240_buffer[1]<=35 && k3_240_buffer[1]<=35))) || 
 
 //H4 ma05 �W��,���L��ma05�y���Z��,k1,k2,k3�V�W
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]>=1 && k2_240_buffer[1]-k2_240_buffer[2]>=1 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                     k1_240_buffer[1]<=70) || 

 //H4 ma05 �W��,���L��ma05�y���Z��,kd1�V�W,k2��k3 �V�W
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=6 && (k2_240_buffer[1]-k2_240_buffer[2]>=1 || k3_240_buffer[1]-k3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=70) || 
                                     
 //H4 ma05 �U���ͽw ([1]-[2])-([2]-[3])>=0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])>=0.00030) ||

 //H1,H4 kd1,2,3�Ȯt����>1
                    (k1_60_buffer[1]-d1_60_buffer[1]>=1 && k2_60_buffer[1]-d2_60_buffer[1]>=1 && k3_60_buffer[1]-d3_60_buffer[2]>=1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=1 && (k2_240_buffer[1]-d2_240_buffer[1]>=1 || k3_240_buffer[1]-d3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=60) ||
       
 //H1 kd2,kd3�Ȯt>16 �Υ[�`>35
                    (k2_60_buffer[1]-d2_60_buffer[1]>=16 && k3_60_buffer[1]-d3_60_buffer[2]>=16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])>=35) ||
       
 //H4 ���ק�� k1�b35�U
                    (k1_240_buffer[1]-k1_240_buffer[2]>=4 &&  k1_240_buffer[2]-k1_240_buffer[3]<=-4 && k1_240_buffer[1]<=35) ||
          
 //H4 k1,k2,k3�b80�W,kd1,kd2,kd3���٦V�W�}�f 
                    (k1_240_buffer[1]-d1_240_buffer[1]>=3 &&  k2_240_buffer[1]-d2_240_buffer[1]>=3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]>=3 &&  k1_240_buffer[1]>=80 &&  k2_240_buffer[1]>=80 &&  k3_240_buffer[1]>=80) ||

 //m60 k1,k2,k3�b80�W,kd1,kd2,kd3���٦V�W�}�f 
                    (k1_60_buffer[1]-d1_60_buffer[1]>=3 &&  k2_60_buffer[1]-d2_60_buffer[1]>=3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]>=3 &&  k1_60_buffer[1]>=80 &&  k2_60_buffer[1]>=80 &&  k3_60_buffer[1]>=80) ||

 //H4 ma05[1],ma12[1]�t�Z�j��28�I ,�}�f���j([1]-[2])>=10�I([2]-[3])>=8�I
                    (ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])>=0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])>=0.00050)) ||      
               
 //H4 k1�e��������k2,k3���j�T���W ��macd�}�f�|�j               
                   (k1_240_buffer[1]-k1_240_buffer[2]<=3 && k1_240_buffer[1]-k1_240_buffer[2]>=-3 &&
                  ((k2_240_buffer[1]-k2_240_buffer[2]>=6 && k3_240_buffer[1]-k3_240_buffer[2]>=6) || 
                   (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001300))) ||
              
 //H1-K1,K2,K3��H4-K1  ���W��
                   (k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 &&
                    k3_60_buffer[1]-k3_60_buffer[2]>=0 && k1_240_buffer[1]-k1_240_buffer[2]>=0) ||

 //H4  k1�j�T�V�W [1]��[2]�����@����
                 (((k1_240_buffer[1]-k1_240_buffer[2])-(k1_240_buffer[2]-k1_240_buffer[3])>=3) && (close_240_buffer[1]-open_240_buffer[1]>=0.00030 || close_240_buffer[2]-open_240_buffer[2]>=0.00030)) ||
                   (k1_240_buffer[1]-k1_240_buffer[2]>=12 && (close_240_buffer[1]-open_240_buffer[1]>=0.00030 || close_240_buffer[2]-open_240_buffer[2]>=0.00030)))
                    return;
                    else
                    OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 

//*** close Buy  2  ***************************************************************************************** 
//    if  ( OrdersTotal()>0 && OrderMagicNumber()==4402) 
      if  ( OrdersTotal()>0 && OrderMagicNumber()!=4410) 

 //    m5 k1,k2,k3�ҤU��,�B�b50�W,[1]���� [2]���� SELL
      if  ((k1_30_buffer[1]-k1_30_buffer[2]<=-3 &&  k2_30_buffer[1]-k2_30_buffer[2]<=-1 && k3_30_buffer[1]-k3_30_buffer[2]<=0 &&
            k1_30_buffer[1]>=70 &&   k2_30_buffer[1]>=75 && k3_30_buffer[1]>=75)||
           (k1_60_buffer[1]-k1_60_buffer[2]<=-3 &&  k2_60_buffer[1]-k2_60_buffer[2]<=-1 && k3_60_buffer[1]-k3_60_buffer[2]<=0 &&
            k1_60_buffer[1]>=70 &&   k2_60_buffer[1]>=75 && k3_60_buffer[1]>=75)) 
          if  (k1_05_buffer[1]-d1_05_buffer[1]<=-3 &&   k1_05_buffer[1]>=50)                               
     
   
 //H1,H4 kd�Ȯt����>10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]>=10 && k3_60_buffer[1]-d3_60_buffer[2]>=10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]>=10 && k3_240_buffer[1]-d3_240_buffer[2]>=10) ||
 
 //H1,H4 k2,k3�b�C�I,��H4 k1,k,k3�b�C�I
                    (k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
                    (k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
 
 //H4 ma05 �W��,macd�b1150�~,���L��ma05�y���Z����kd1,kd2,kd3���}�f�B�V�W
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]>=7 && k2_240_buffer[1]-d2_240_buffer[1]>=7 && k3_240_buffer[1]-d3_240_buffer[2]>=7 &&
                     k2_240_buffer[1]<=35 && k3_240_buffer[1]<=35))) || 
 
 //H4 ma05 �W��,���L��ma05�y���Z��,k1,k2,k3�V�W
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]>=1 && k2_240_buffer[1]-k2_240_buffer[2]>=1 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                     k1_240_buffer[1]<=70) || 

 //H4 ma05 �W��,���L��ma05�y���Z��,kd1�V�W,k2��k3 �V�W
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=6 && (k2_240_buffer[1]-k2_240_buffer[2]>=1 || k3_240_buffer[1]-k3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=70) || 
                                     
 //H4 ma05 �U���ͽw ([1]-[2])-([2]-[3])>=0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])>=0.00030) ||

//H1,H4 kd1,2,3�Ȯt����>1
                    (k1_60_buffer[1]-d1_60_buffer[1]>=1 && k2_60_buffer[1]-d2_60_buffer[1]>=1 && k3_60_buffer[1]-d3_60_buffer[2]>=1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=1 && (k2_240_buffer[1]-d2_240_buffer[1]>=1 || k3_240_buffer[1]-d3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=60) ||
       
 //H1 kd2,kd3�Ȯt>16 �Υ[�`>35
                    (k2_60_buffer[1]-d2_60_buffer[1]>=16 && k3_60_buffer[1]-d3_60_buffer[2]>=16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])>=35) ||
       
 //H4 ���ק�� k1�b35�U
                    (k1_240_buffer[1]-k1_240_buffer[2]>=4 &&  k1_240_buffer[2]-k1_240_buffer[3]<=-4 && k1_240_buffer[1]<=35) ||
          
 //H4 k1,k2,k3�b80�W,kd1,kd2,kd3���٦V�W�}�f 
                    (k1_240_buffer[1]-d1_240_buffer[1]>=3 &&  k2_240_buffer[1]-d2_240_buffer[1]>=3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]>=3 &&  k1_240_buffer[1]>=80 &&  k2_240_buffer[1]>=80 &&  k3_240_buffer[1]>=80) ||
 
 //m60 k1,k2,k3�b80�W,kd1,kd2,kd3���٦V�W�}�f 
                    (k1_60_buffer[1]-d1_60_buffer[1]>=3 &&  k2_60_buffer[1]-d2_60_buffer[1]>=3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]>=3 &&  k1_60_buffer[1]>=80 &&  k2_60_buffer[1]>=80 &&  k3_60_buffer[1]>=80) ||

 //H4 ma05[1],ma12[1]�t�Z�j��28�I ,�}�f���j([1]-[2])>=10�I([2]-[3])>=8�I
                    (ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])>=0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])>=0.00050)) ||      
               
 //H4 k1�e��������k2,k3���j�T���W ��macd�}�f�|�j               
                   (k1_240_buffer[1]-k1_240_buffer[2]<=3 && k1_240_buffer[1]-k1_240_buffer[2]>=-3 &&
                  ((k2_240_buffer[1]-k2_240_buffer[2]>=6 && k3_240_buffer[1]-k3_240_buffer[2]>=6) || 
                   (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001300))) ||
              
 //H1-K1,K2,K3��H4-K1  ���W��
                   (k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 &&
                    k3_60_buffer[1]-k3_60_buffer[2]>=0 && k1_240_buffer[1]-k1_240_buffer[2]>=0) ||

 //H4  k1�j�T�V�W [1]��[2]�����@����
                 (((k1_240_buffer[1]-k1_240_buffer[2])-(k1_240_buffer[2]-k1_240_buffer[3])>=3) && (close_240_buffer[1]-open_240_buffer[1]>=0.00030 || close_240_buffer[2]-open_240_buffer[2]>=0.00030)) ||
                   (k1_240_buffer[1]-k1_240_buffer[2]>=12 && (close_240_buffer[1]-open_240_buffer[1]>=0.00030 || close_240_buffer[2]-open_240_buffer[2]>=0.00030)))
                    return;
                    else
                    OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 
//*** close Buy  3  ***************************************************************************************** 
 
//    if ( OrdersTotal()>0 && OrderMagicNumber() == 4403 ) 
      if  ( OrdersTotal()>0 && OrderMagicNumber()!=4410) 

      if  ((k1_15_buffer[1]-k1_15_buffer[2]<=-6 &&  k1_15_buffer[1]>=75 &&
 // m240���b70�W
            k1_15_buffer[1]-d1_15_buffer[1]<=-4 &&  k1_240_buffer[1]>=70 &&
            close_15_buffer[1]-close_15_buffer[2]<=-0.00010))

 //H1,H4 kd�Ȯt����>10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]>=10 && k3_60_buffer[1]-d3_60_buffer[2]>=10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]>=10 && k3_240_buffer[1]-d3_240_buffer[2]>=10) ||
 
 //H1,H4 k2,k3�b�C�I,��H4 k1,k,k3�b�C�I
                    (k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
                    (k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
 
 //H4 ma05 �W��,macd�b1150�~,���L��ma05�y���Z����kd1,kd2,kd3���}�f�B�V�W
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]>=7 && k2_240_buffer[1]-d2_240_buffer[1]>=7 && k3_240_buffer[1]-d3_240_buffer[2]>=7 &&
                     k2_240_buffer[1]<=35 && k3_240_buffer[1]<=35))) || 
 
 //H4 ma05 �W��,���L��ma05�y���Z��,k1,k2,k3�V�W
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]>=1 && k2_240_buffer[1]-k2_240_buffer[2]>=1 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                     k1_240_buffer[1]<=70) || 

 //H4 ma05 �W��,���L��ma05�y���Z��,kd1�V�W,k2��k3 �V�W
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=6 && (k2_240_buffer[1]-k2_240_buffer[2]>=1 || k3_240_buffer[1]-k3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=70) || 
                                     
 //H4 ma05 �U���ͽw ([1]-[2])-([2]-[3])>=0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])>=0.00030) ||

 //H1,H4 kd1,2,3�Ȯt����>1
                    (k1_60_buffer[1]-d1_60_buffer[1]>=1 && k2_60_buffer[1]-d2_60_buffer[1]>=1 && k3_60_buffer[1]-d3_60_buffer[2]>=1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=1 && (k2_240_buffer[1]-d2_240_buffer[1]>=1 || k3_240_buffer[1]-d3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=60) ||
       
 //H1 kd2,kd3�Ȯt>16 �Υ[�`>35
                    (k2_60_buffer[1]-d2_60_buffer[1]>=16 && k3_60_buffer[1]-d3_60_buffer[2]>=16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])>=35) ||
       
 //H4 ���ק�� k1�b35�U
                    (k1_240_buffer[1]-k1_240_buffer[2]>=4 &&  k1_240_buffer[2]-k1_240_buffer[3]<=-4 && k1_240_buffer[1]<=35) ||
          
 //H4 k1,k2,k3�b80�W,kd1,kd2,kd3���٦V�W�}�f 
                    (k1_240_buffer[1]-d1_240_buffer[1]>=3 &&  k2_240_buffer[1]-d2_240_buffer[1]>=3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]>=3 &&  k1_240_buffer[1]>=80 &&  k2_240_buffer[1]>=80 &&  k3_240_buffer[1]>=80) ||

 //m60 k1,k2,k3�b80�W,kd1,kd2,kd3���٦V�W�}�f 
                    (k1_60_buffer[1]-d1_60_buffer[1]>=3 &&  k2_60_buffer[1]-d2_60_buffer[1]>=3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]>=3 &&  k1_60_buffer[1]>=80 &&  k2_60_buffer[1]>=80 &&  k3_60_buffer[1]>=80) ||

 //H4 ma05[1],ma12[1]�t�Z�j��28�I ,�}�f���j([1]-[2])>=10�I([2]-[3])>=8�I
                    (ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])>=0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])>=0.00050)) ||      
               
 //H4 k1�e��������k2,k3���j�T���W ��macd�}�f�|�j               
                   (k1_240_buffer[1]-k1_240_buffer[2]<=3 && k1_240_buffer[1]-k1_240_buffer[2]>=-3 &&
                  ((k2_240_buffer[1]-k2_240_buffer[2]>=6 && k3_240_buffer[1]-k3_240_buffer[2]>=6) || 
                   (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001300))) ||
              
 //H1-K1,K2,K3��H4-K1  ���W��
                   (k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 &&
                    k3_60_buffer[1]-k3_60_buffer[2]>=0 && k1_240_buffer[1]-k1_240_buffer[2]>=0) ||

 //H4  k1�j�T�V�W [1]��[2]�����@����
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

 //H1,H4 kd�Ȯt����>10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]>=10 && k3_60_buffer[1]-d3_60_buffer[2]>=10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]>=10 && k3_240_buffer[1]-d3_240_buffer[2]>=10) ||
 
 //H1,H4 k2,k3�b�C�I,��H4 k1,k,k3�b�C�I
                    (k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
                    (k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
 
 //H4 ma05 �W��,macd�b1150�~,���L��ma05�y���Z����kd1,kd2,kd3���}�f�B�V�W
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]>=7 && k2_240_buffer[1]-d2_240_buffer[1]>=7 && k3_240_buffer[1]-d3_240_buffer[2]>=7 &&
                     k2_240_buffer[1]<=35 && k3_240_buffer[1]<=35))) || 
 
 //H4 ma05 �W��,���L��ma05�y���Z��,k1,k2,k3�V�W
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]>=1 && k2_240_buffer[1]-k2_240_buffer[2]>=1 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                     k1_240_buffer[1]<=70) || 

 //H4 ma05 �W��,���L��ma05�y���Z��,kd1�V�W,k2��k3 �V�W
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=6 && (k2_240_buffer[1]-k2_240_buffer[2]>=1 || k3_240_buffer[1]-k3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=70) || 
                                     
 //H4 ma05 �U���ͽw ([1]-[2])-([2]-[3])>=0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])>=0.00030) ||

 //H1,H4 kd1,2,3�Ȯt����>1
                    (k1_60_buffer[1]-d1_60_buffer[1]>=1 && k2_60_buffer[1]-d2_60_buffer[1]>=1 && k3_60_buffer[1]-d3_60_buffer[2]>=1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=1 && (k2_240_buffer[1]-d2_240_buffer[1]>=1 || k3_240_buffer[1]-d3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=60) ||
       
 //H1 kd2,kd3�Ȯt>16 �Υ[�`>35
                    (k2_60_buffer[1]-d2_60_buffer[1]>=16 && k3_60_buffer[1]-d3_60_buffer[2]>=16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])>=35) ||
       
 //H4 ���ק�� k1�b35�U
                    (k1_240_buffer[1]-k1_240_buffer[2]>=4 &&  k1_240_buffer[2]-k1_240_buffer[3]<=-4 && k1_240_buffer[1]<=35) ||
          
 //H4 k1,k2,k3�b80�W,kd1,kd2,kd3���٦V�W�}�f 
                    (k1_240_buffer[1]-d1_240_buffer[1]>=3 &&  k2_240_buffer[1]-d2_240_buffer[1]>=3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]>=3 &&  k1_240_buffer[1]>=80 &&  k2_240_buffer[1]>=80 &&  k3_240_buffer[1]>=80) ||

 //m60 k1,k2,k3�b80�W,kd1,kd2,kd3���٦V�W�}�f 
                    (k1_60_buffer[1]-d1_60_buffer[1]>=3 &&  k2_60_buffer[1]-d2_60_buffer[1]>=3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]>=3 &&  k1_60_buffer[1]>=80 &&  k2_60_buffer[1]>=80 &&  k3_60_buffer[1]>=80) ||

 //H4 ma05[1],ma12[1]�t�Z�j��28�I ,�}�f���j([1]-[2])>=10�I([2]-[3])>=8�I
                    (ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])>=0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])>=0.00050)) ||      
               
 //H4 k1�e��������k2,k3���j�T���W ��macd�}�f�|�j               
                   (k1_240_buffer[1]-k1_240_buffer[2]<=3 && k1_240_buffer[1]-k1_240_buffer[2]>=-3 &&
                  ((k2_240_buffer[1]-k2_240_buffer[2]>=6 && k3_240_buffer[1]-k3_240_buffer[2]>=6) || 
                   (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001300))) ||
              
 //H1-K1,K2,K3��H4-K1  ���W��
                   (k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 &&
                    k3_60_buffer[1]-k3_60_buffer[2]>=0 && k1_240_buffer[1]-k1_240_buffer[2]>=0) ||

 //H4  k1�j�T�V�W [1]��[2]�����@����
                 (((k1_240_buffer[1]-k1_240_buffer[2])-(k1_240_buffer[2]-k1_240_buffer[3])>=3) && (close_240_buffer[1]-open_240_buffer[1]>=0.00030 || close_240_buffer[2]-open_240_buffer[2]>=0.00030)) ||
                   (k1_240_buffer[1]-k1_240_buffer[2]>=12 && (close_240_buffer[1]-open_240_buffer[1]>=0.00030 || close_240_buffer[2]-open_240_buffer[2]>=0.00030)))
                    return;
                    else
                    OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 
 
//*** close Buy  5  ***************************************************************************************** 

//�Φb���ҥH�ư��������      
 
//    if ( OrdersTotal()>0 && OrderMagicNumber() == 4405) 
      if  ( OrdersTotal()>0 && OrderMagicNumber()!=4410) 

 //[1]��[2]�����W�v�L20�I
      if((((close_60_buffer[1]-open_60_buffer[1]>=0.00010 && high_60_buffer[1]-close_60_buffer[1]>=0.00200) || 
           (close_60_buffer[2]-open_60_buffer[2]>=0.00010 && high_60_buffer[2]-close_60_buffer[2]>=0.00200))  ||
 //��[1]��[2]���t�W�v�L20�I
          ((close_60_buffer[1]-open_60_buffer[1]<=-0.00010 && high_60_buffer[1]-open_60_buffer[1]>=0.00200) || 
           (close_60_buffer[2]-open_60_buffer[2]<=-0.00010 && high_60_buffer[2]-open_60_buffer[2]>=0.00200))) && 
 //[2]��[3]��[4]�����@���t
           (close_60_buffer[2]-open_60_buffer[2]<=-0.00030 || close_60_buffer[3]-open_60_buffer[3]<=-0.00030 ||  close_60_buffer[4]-open_60_buffer[4]<=-0.00030) &&         
 //ma12,ma05���Z���L20�I,K1,K2,K3,�b50�W�B�U��            
            ma05_60_buffer[1]-ma12_60_buffer[1]<=0.00200 &&
            k1_60_buffer[1]>=50 &&   k2_60_buffer[1]>=50 && k3_60_buffer[1]>=50 &&
            k1_60_buffer[1]-k1_60_buffer[2]<=-1 &&  k2_60_buffer[1]-k2_60_buffer[2]<=-1  &&  k3_60_buffer[1]-k3_60_buffer[2]<=-1)
            OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 
 
//*** close Buy  6  ***************************************************************************************** 

//    if ( OrdersTotal()>0 && OrderMagicNumber() == 4406) 
      if  ( OrdersTotal()>0 && OrderMagicNumber()!=4410) 

 //ma45,ma90�e�U�� ([1]-[2])-([2]-[3])<=-0.00010
      if  (((ma45_15_buffer[1]-ma45_15_buffer[2]) - (ma45_15_buffer[2]-ma45_15_buffer[3])<=-0.00010) &&
           ((ma90_15_buffer[1]-ma90_15_buffer[2]) - (ma90_15_buffer[2]-ma90_15_buffer[3])<=-0.00010) &&
 
 //K1,k2,k3 �b���I kd1��e�U            
            k1_15_buffer[1]>=70  &&  k2_15_buffer[1]>=75 && k3_15_buffer[1]>=75 &&
           (k1_15_buffer[1]-d1_15_buffer[1]<=-2 || k1_15_buffer[1]-k1_15_buffer[2]<=-4))
            OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 
 
//*** close Buy  7  ***************************************************************************************** 

 //   if ( OrdersTotal()>0 && OrderMagicNumber() == 4407) 
      if  ( OrdersTotal()>0 && OrderMagicNumber()!=4410) 

 //ma90��ma190��m240�e�U�� ([1]-[2])-([2]-[3])<=-0.00010
      if((((ma90_240_buffer[1]-ma90_240_buffer[2]) - (ma90_240_buffer[2]-ma90_240_buffer[3])<=-0.00010) ||
          ((ma180_240_buffer[1]-ma180_240_buffer[2]) - (ma180_240_buffer[2]-ma180_240_buffer[3])<=-0.00010) ||
          ((ma360_240_buffer[1]-ma360_240_buffer[2]) - (ma360_240_buffer[2]-ma360_240_buffer[3])<=-0.00010)) &&
 
 //K1,k2,k3 �b���I kd1��e�U            
            k1_240_buffer[1]>=70  &&  k2_240_buffer[1]>=75 && k3_240_buffer[1]>=75 &&

 //m60��ma05�Pma12�t�Z�b15�I��
            ma05_60_buffer[1]-ma12_60_buffer[1]<=0.00150 &&

 //m240��ma05�Pma12�t�Z�b35�I��
            ma05_240_buffer[1]-ma12_240_buffer[1]<=0.00350 &&

 //m240��ma05�Pma12�t�Z�b40�I��
            ma05_240_buffer[1]-ma12_240_buffer[1]<=0.00400 && 
           (k1_240_buffer[1]-d1_240_buffer[1]<=-2 || k1_240_buffer[1]-k1_240_buffer[2]<=-4))
            OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 

//*** close Buy  8  ***************************************************************************************** 

 //   if ( OrdersTotal()>0 && OrderMagicNumber() == 4408) 
       if  ( OrdersTotal()>0 && OrderMagicNumber()!=4410) 
         
 // m15 k1,k2,k3�ҤU��,�B�b50,70�W
      if   (k1_15_buffer[1]-k1_15_buffer[2]<=-3 &&  k2_15_buffer[1]-k2_15_buffer[2]<=-1 && k3_15_buffer[1]-k3_15_buffer[2]<=-1 &&
            k1_15_buffer[1]>=50 &&   k2_15_buffer[1]>=70 && k3_15_buffer[1]>=70 &&
             
 //m30,m60,m240�����b70�W�B�}�l�U��
            k1_30_buffer[0]-k1_30_buffer[1]<=1 && k1_30_buffer[1]>=70 &&
            k1_60_buffer[0]-k1_60_buffer[1]<=1 && k1_60_buffer[1]>=70 &&
 
 //m60��ma05�Pma12�t�Z�b15�I��
            ma05_60_buffer[1]-ma12_60_buffer[1]<=0.00150 &&
            k1_240_buffer[0]-k1_240_buffer[1]<=2 && k1_240_buffer[1]>=70 &&
 
 //m240��ma05�Pma12�t�Z�b35�I��
            ma05_240_buffer[1]-ma12_240_buffer[1]<=0.00350)
 
 //H4 k1,k2,k3�b80�W,kd1,kd2,kd3���٦V�W�}�f 
            if     ((k1_240_buffer[1]-d1_240_buffer[1]>=3 &&  k2_240_buffer[1]-d2_240_buffer[1]>=3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]>=3 &&  k1_240_buffer[1]>=80 &&  k2_240_buffer[1]>=80 &&  k3_240_buffer[1]>=80) ||
 
 //m60 k1,k2,k3�b80�W,kd1,kd2,kd3���٦V�W�}�f 
                    (k1_60_buffer[1]-d1_60_buffer[1]>=3 &&  k2_60_buffer[1]-d2_60_buffer[1]>=3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]>=3 &&  k1_60_buffer[1]>=80 &&  k2_60_buffer[1]>=80 &&  k3_60_buffer[1]>=80) ||

  //H1-K1,K2,K3��H4-K1  ���W��
                   (k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 &&
                    k3_60_buffer[1]-k3_60_buffer[2]>=0 && k1_240_buffer[1]-k1_240_buffer[2]>=0))

                     return;
                     else
                     OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 

//*** close Buy  9  ***************************************************************************************** 

 //   if ( OrdersTotal()>0 && OrderMagicNumber() == 4409) 
      if  ( OrdersTotal()>0 && OrderMagicNumber()!=4410) 
          
 // m240 k1,k2��k3�U��,�B�b70�W
      if   (k1_240_buffer[1]>=70 &&   k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70 &&
          ((k1_240_buffer[1]-k1_240_buffer[2]<=-3 &&  (k2_240_buffer[1]-k2_240_buffer[2]<=-1 || k3_240_buffer[1]-k3_240_buffer[2]<=-1)) ||
           (k1_240_buffer[1]-d1_240_buffer[1]<=-6 && k2_240_buffer[1]-d2_240_buffer[1]<=8 &&  k3_240_buffer[1]-d3_240_buffer[1]<=8))  &&
             
 //m60��ma05�Pma12�t�Z�b15�I��
            ma05_60_buffer[1]-ma12_60_buffer[1]<=0.00150 &&

 //m240��ma05�Pma12�t�Z�b35�I��
            ma05_240_buffer[1]-ma12_240_buffer[1]<=0.00350 &&

 //[1][2]���t[3]��[4]����
            close_240_buffer[1]-open_240_buffer[1]<=-0.00040 && close_240_buffer[2]-open_240_buffer[2]<=0 &&
           (close_240_buffer[3]-open_240_buffer[3]>=0.00040 || close_240_buffer[4]-open_240_buffer[4]>=0.00040) &&
           
 //ma180��ma360�פU
           (ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00010 || ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00010) &&                      
 
 //[1][2][3]��[2][3][4]�}�Φ��L�bma180�W�U�U12�I��
           ((close_240_buffer[2]-ma180_240_buffer[2]<=0.00120 || close_240_buffer[2]-ma180_240_buffer[2]>=-0.00120) &&
            (close_240_buffer[3]-ma180_240_buffer[3]<=0.00120 || close_240_buffer[3]-ma180_240_buffer[3]>=-0.00120) &&
           ((close_240_buffer[4]-ma180_240_buffer[4]<=0.00120 || close_240_buffer[4]-ma180_240_buffer[4]>=-0.00120) ||
            (close_240_buffer[1]-ma180_240_buffer[1]<=0.00120 || close_240_buffer[1]-ma180_240_buffer[1]>=-0.00120))) ||
          
 //��[1][2][3]��[2][3][4]�}�Φ��L�bma360�W�U�U12�I��
           ((close_240_buffer[2]-ma360_240_buffer[2]<=0.00120 || close_240_buffer[2]-ma360_240_buffer[2]>=-0.00120) &&
            (close_240_buffer[3]-ma360_240_buffer[3]<=0.00120 || close_240_buffer[3]-ma360_240_buffer[3]>=-0.00120) &&
           ((close_240_buffer[4]-ma360_240_buffer[4]<=0.00120 || close_240_buffer[4]-ma360_240_buffer[4]>=-0.00120) ||
            (close_240_buffer[1]-ma360_240_buffer[1]<=0.00120 || close_240_buffer[1]-ma360_240_buffer[1]>=-0.00120))))
            OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 

//*** close Buy  10  ***************************************************************************************** 

//�Φb���ҥH�ư��������      

    if ( OrdersTotal()>0 && OrderMagicNumber() == 4410) 
          
 // m15 k1,k2,k3�ҤU��,�B�b50,70�W
      if   (k1_15_buffer[1]-k1_15_buffer[2]<=-3 &&  k2_15_buffer[1]-k2_15_buffer[2]<=-1 && k3_15_buffer[1]-k3_15_buffer[2]<=-1 &&
            k1_15_buffer[1]>=50 &&   k2_15_buffer[1]>=70 && k3_15_buffer[1]>=70 &&
             
 // m30 k1,k2��k3�ҤU��,�B�b60,70�W
           (k1_30_buffer[1]-k1_30_buffer[2]<=-1 &&  (k2_30_buffer[1]-k2_30_buffer[2]<=-1 || k3_30_buffer[1]-k3_30_buffer[2]<=-1) && 
            k1_30_buffer[1]>=60 && k2_30_buffer[1]>=70 && k3_30_buffer[1]>=70) &&
 
 // m60 k1,k2��k3�ҤU��,�B�b60,70�W��[0]���j�T�פU��
         (((k1_60_buffer[1]-k1_60_buffer[2]<=-1 &&  (k2_60_buffer[1]-k2_60_buffer[2]<=-1 || k3_60_buffer[1]-k3_60_buffer[2]<=-1)) ||
           (k1_60_buffer[0]-k1_60_buffer[1]<=-5 && k1_60_buffer[0]-d1_60_buffer[0]<=-2))  &&
            k1_60_buffer[1]>=60 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70)) 

 //H1,H4 kd�Ȯt����>10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]>=10 && k3_60_buffer[1]-d3_60_buffer[2]>=10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]>=10 && k3_240_buffer[1]-d3_240_buffer[2]>=10) ||
 
 //H1,H4 k2,k3�b�C�I,��H4 k1,k,k3�b�C�I
                    (k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
                    (k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
                                     
 //H1 kd2,kd3�Ȯt>16 �Υ[�`>35
                    (k2_60_buffer[1]-d2_60_buffer[1]>=16 && k3_60_buffer[1]-d3_60_buffer[2]>=16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])>=35) ||

 //H1-K1,K2,K3��H4-K1  ���W��
                   (k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 &&
                    k3_60_buffer[1]-k3_60_buffer[2]>=0 && k1_240_buffer[1]-k1_240_buffer[2]>=0))

 
                    return;
                    else
                    OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 

//*** close Buy  11  ***************************************************************************************** 
//����M�W�ۦP��K1[0],KD[0]�y���P  

//    if ( OrdersTotal()>0 && OrderMagicNumber() == 4411) 
      if  ( OrdersTotal()>0 && OrderMagicNumber()!=4410) 
          
 // H4   [1][3]��[1][4]��[1][5]��[1][6]���t
      if (((close_240_buffer[1]-open_240_buffer[1]<=-0.00050 &&  close_240_buffer[3]-open_240_buffer[3]<=-0.00050) ||
           (close_240_buffer[1]-open_240_buffer[1]<=-0.00050 &&  close_240_buffer[4]-open_240_buffer[4]<=-0.00050) ||
           (close_240_buffer[1]-open_240_buffer[1]<=-0.00050 &&  close_240_buffer[5]-open_240_buffer[5]<=-0.00050) ||
           (close_240_buffer[1]-open_240_buffer[1]<=-0.00050 &&  close_240_buffer[6]-open_240_buffer[6]<=-0.00050)) &&
             
 // H4 k1,k2��k3�ҤU��,�BK1�b60�W,[1]�U�v�u���p��12�I
          ((k1_240_buffer[1]-k1_240_buffer[2]<0 &&  (k2_240_buffer[1]-k2_240_buffer[2]<0 || k3_240_buffer[1]-k3_240_buffer[2]<0) && 
            k1_240_buffer[1]>=60 && low_240_buffer[1]-close_240_buffer[1]>=-0.00120) ||
            
 // H4 k1�b���I�V�U          
           (k1_240_buffer[1]>=80 && k1_240_buffer[1]-k1_240_buffer[2]<=-3 )) &&
            
 //ma45��ma90��ma180��׫פU��
           (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00030 || ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00030 ||
            ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00030))      
            OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 

 
 
 
 
//*** close Buy  15  ***************************************************************************************** 
 
                 //(m15-63)  H4     [2][3]����<9�I     [1]����  �d�W�v�u>30�I   
       if    (close_240_buffer[1]-open_240_buffer[1]<=-0.00100 && high_240_buffer[1]-open_240_buffer[1]>=0.00300 &&
              close_240_buffer[2]-open_240_buffer[2]>=0.00090  && close_240_buffer[3]-open_240_buffer[3]>=0.00090  &&   
               // ma45 ma90 || ma90 ma180  �פU�B�j
            ((ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00080 &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00020) ||
             (ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00060 &&  ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00020)) &&
                // [1]���L�bma05���U  ���W�L15�I
              close_240_buffer[1]-ma05_240_buffer[1]<=-0.00010  && close_240_buffer[1]-ma05_240_buffer[1]>=-0.00150) 
              // (m15-66) kd2,kd3[1]-[2]>=7    k2,k2<=30 
              if    (k1_240_buffer[1]-d1_240_buffer[1]>=7 && k2_240_buffer[1]-d2_240_buffer[1]>=7 && k3_240_buffer[1]-d3_240_buffer[1]>=7 &&
                     k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) 
                      return;
                      else
                      OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 

//*** close Buy  16  ***************************************************************************************** 
              
                   //(m15-65)   h4 �� ma650�פU             ma360�פU�u�u
         if   (ma650_240_buffer[1]-ma650_240_buffer[2]<0 &&
                  //h4 [1]�����bma360���W�����W�L25�I
             ((close_240_buffer[1]-open_240_buffer[1]>=0.00010 && close_240_buffer[1]-ma360_240_buffer[1]>=0.00010 &&
               close_240_buffer[1]-ma360_240_buffer[1]<=0.00250) ||
                 //h4 [1]���t�B�bma360���U�����W�L25�I ��[2]�W�v�u�j��25�I
              (close_240_buffer[1]-open_240_buffer[1]<=-0.00010 && close_240_buffer[1]-ma360_240_buffer[1]>=0.00010 &&
               close_240_buffer[1]-ma360_240_buffer[1]<=0.00250 && high_240_buffer[2]-close_240_buffer[2]>=0.00250)) &&
                 //k2,k3[1]-[2]<=0    k2,k2>=70  k1[1]-[2]<0 || [1]�W�v�u�j��25�I
               k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
               k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70 &&
              (k1_240_buffer[1]-k1_240_buffer[2]<=0 ||  high_240_buffer[1]-close_240_buffer[1]>=0.00250) &&  
                  // macd�t��<=0.00150  >=-0.00100 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.001500 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.001000 && 
              // [2]||[3]||[4]||[5]���bma360�U��25�I��  
             ((close_240_buffer[2]-ma360_240_buffer[2]<=-0.00010  && close_240_buffer[2]-ma360_240_buffer[2]>=-0.00250) ||
              (close_240_buffer[3]-ma360_240_buffer[3]<=-0.00010  && close_240_buffer[3]-ma360_240_buffer[3]>=-0.00250) ||
              (close_240_buffer[4]-ma360_240_buffer[4]<=-0.00010  && close_240_buffer[4]-ma360_240_buffer[4]>=-0.00250) ||
              (close_240_buffer[5]-ma360_240_buffer[5]<=-0.00010  && close_240_buffer[5]-ma360_240_buffer[5]>=-0.00250)))
               OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 

//*** close Buy  17  ***************************************************************************************** 
              
                   //(m15-65)   h4 �� ma650�פU          ma180�פU�u�u
         if   (ma650_240_buffer[1]-ma650_240_buffer[2]<-0.00010 &&
                  //h4 [1]�����B�bma180���W�����W�L25�I
             ((close_240_buffer[1]-open_240_buffer[1]>=0.00010 && close_240_buffer[1]-ma180_240_buffer[1]>=0.00010 &&
               close_240_buffer[1]-ma180_240_buffer[1]<=0.00250) ||
                 //h4 [1]���t�B�bma180���U�����W�L25�I ��[2]�W�v�u�j��25�I
              (close_240_buffer[1]-open_240_buffer[1]<=-0.00010 && close_240_buffer[1]-ma180_240_buffer[1]>=0.00010 &&
               close_240_buffer[1]-ma180_240_buffer[1]<=0.00250 && high_240_buffer[2]-close_240_buffer[2]>=0.00250)) &&
                 //k2,k3[1]-[2]<=0 ||kd2,kd3<=1   k2,k2>=70  k1[1]-[2]<=0 || [1]�W�v�u�j��25�I
             ((k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0) ||
              (k2_240_buffer[1]-d2_240_buffer[2]<=-1 && k3_240_buffer[1]-d3_240_buffer[2]<=-1)) &&
               k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70 &&
              (k1_240_buffer[1]-k1_240_buffer[2]<=0 ||  high_240_buffer[1]-close_240_buffer[1]>=0.00250) &&  
                  // macd�t��<=0.00150  >=-0.00100 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.001500 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.001000 && 
              // [2]||[3]||[4]||[5]���bma180�U��25�I��  
             ((close_240_buffer[2]-ma180_240_buffer[2]<=-0.00010  && close_240_buffer[2]-ma180_240_buffer[2]>=-0.00250) ||
              (close_240_buffer[3]-ma180_240_buffer[3]<=-0.00010  && close_240_buffer[3]-ma180_240_buffer[3]>=-0.00250) ||
              (close_240_buffer[4]-ma180_240_buffer[4]<=-0.00010  && close_240_buffer[4]-ma180_240_buffer[4]>=-0.00250) ||
              (close_240_buffer[5]-ma180_240_buffer[5]<=-0.00010  && close_240_buffer[5]-ma180_240_buffer[5]>=-0.00250)))
               OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 

//*** close Buy  18  ***************************************************************************************** 
                   
               //(m15-65)  ma45�פU  ma90�����αפW   ma180,ma360,ma650�פW  ���bma45���W�w�[�Ӥɤ��W��[1]�d�W�v�u>25�I�B����                      
      if      (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00020 &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=0 &&       
                 // macd�t��<=0.00150  >=-0.00100 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.001500 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.001000 && 
                   //   k1,k2,k3<=0  k2,k2>=70            
               k1_240_buffer[1]-k1_240_buffer[2]<=0 && k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
               k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70 &&
                 //h4 [1]���t�W�v�u�j��25�I
               close_240_buffer[1]-open_240_buffer[1]<=-0.00010 &&  high_240_buffer[1]-close_240_buffer[1]>=0.00250 &&
                  // [1],[2],[3],[4],[5],[6],[7] ���bma45�W��25�I�� ���U5�I�� 
               close_240_buffer[1]-ma45_240_buffer[1]<=0.00250  && close_240_buffer[1]-ma180_240_buffer[1]>=-0.00050 &&
               close_240_buffer[2]-ma45_240_buffer[2]<=0.00250  && close_240_buffer[2]-ma180_240_buffer[2]>=-0.00050 &&
               close_240_buffer[3]-ma45_240_buffer[3]<=0.00250  && close_240_buffer[3]-ma180_240_buffer[3]>=-0.00050 &&
               close_240_buffer[4]-ma45_240_buffer[4]<=0.00250  && close_240_buffer[4]-ma180_240_buffer[4]>=-0.00050 &&
               close_240_buffer[5]-ma45_240_buffer[5]<=0.00250  && close_240_buffer[5]-ma180_240_buffer[5]>=-0.00050 &&
               close_240_buffer[6]-ma45_240_buffer[6]<=0.00250  && close_240_buffer[6]-ma180_240_buffer[6]>=-0.00050)
               OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 
             
//*** close Buy  19  ***************************************************************************************** 
 
                //(m15-65) h4  ����@�q�ɶ������W�h  ma �ҤW�ɦ��e�{�������
       if     (ma05_240_buffer[1]-ma05_240_buffer[10]>=0  &&  ma05_240_buffer[1]-ma05_240_buffer[10]<=0.00100 &&
               ma45_240_buffer[1]-ma45_240_buffer[10]>=0  &&  ma45_240_buffer[1]-ma45_240_buffer[10]<=0.00450 &&
               ma90_240_buffer[1]-ma90_240_buffer[10]>=0  &&  ma90_240_buffer[1]-ma90_240_buffer[10]<=0.00250 &&   
               ma180_240_buffer[1]-ma180_240_buffer[10]>=0  &&  ma180_240_buffer[1]-ma180_240_buffer[10]<=0.00250 &&
               ma360_240_buffer[1]-ma360_240_buffer[10]>=0  &&  ma360_240_buffer[1]-ma360_240_buffer[10]<=0.00250 &&
               ma650_240_buffer[1]-ma650_240_buffer[10]>=0  &&  ma650_240_buffer[1]-ma650_240_buffer[10]<=0.00250 &&
                // [1]~[6] macd�t��<=0.0050  >=-0.0050 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.000500 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.000500 && 
               macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]<=0.000500 &&  macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]>=-0.000500 && 
               macdmainline_240_buffer[3]-macdsignalline_240_buffer[3]<=0.000500 &&  macdmainline_240_buffer[3]-macdsignalline_240_buffer[3]>=-0.000500 && 
               macdmainline_240_buffer[4]-macdsignalline_240_buffer[4]<=0.000500 &&  macdmainline_240_buffer[4]-macdsignalline_240_buffer[4]>=-0.000500 && 
               macdmainline_240_buffer[5]-macdsignalline_240_buffer[5]<=0.000500 &&  macdmainline_240_buffer[5]-macdsignalline_240_buffer[5]>=-0.000500 && 
               macdmainline_240_buffer[6]-macdsignalline_240_buffer[6]<=0.000500 &&  macdmainline_240_buffer[6]-macdsignalline_240_buffer[6]>=-0.000500)// && 
                   //(m15-66)  k2,k3>=0  kd1>=18  ma45 �פW
               if ((k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                    ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00010  &&
                       //(m15-67)  k2,k3 ���פU����W��  exit
                    ((k2_240_buffer[4]-k2_240_buffer[5]<=-3 && k3_240_buffer[4]-k3_240_buffer[5]<=-3) ||
                    (k2_240_buffer[5]-k2_240_buffer[6]<=-3 && k3_240_buffer[5]-k3_240_buffer[6]<=-3)) &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=18) ||
                      //(m15-67) h4 [1]macd �Ȥ���0.00120 �P-0.00120��  �����                                
                   (macdmainline_240_buffer[1]<=0.001200 && macdmainline_240_buffer[1]>=-0.001200 &&
                    macdsignalline_240_buffer[1]<=0.001200 &&  macdsignalline_240_buffer[1]>=-0.001200))
                    return;
                    else
                    OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 
  
//*** close Buy  20  ***************************************************************************************** 
       
         //(m15-66)  ma650,�פU [1]<=-0.0050   ma90���U  ma45�bma650���W50�I,�B�פU���j    ma90�bma45���W50�I 
        if     (ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.00020  && close_240_buffer[1]-open_240_buffer[1]<=-0.00500 &&
                ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00070  && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00020 &&
                ma45_240_buffer[1]-ma650_240_buffer[1]>=0.00500  && ma90_240_buffer[1]-ma45_240_buffer[1]>=0.00500  && 
                    //   kd1,kd2,kd3<=-4  k2,k3>=65            
                k1_240_buffer[1]-d1_240_buffer[1]<=-4 && k2_240_buffer[1]-d2_240_buffer[1]<=-4 && k3_240_buffer[1]-d3_240_buffer[1]<=-4 &&
                k2_240_buffer[1]>=65 && k3_240_buffer[1]>=65)
                OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 

//*** close Buy  21  ***************************************************************************************** 
  
                //(m15-66)   h4 �� ma180,ma360,ma650 �פU ��ma180���� ma360 �פU   
        if   ((ma180_240_buffer[1]-ma180_240_buffer[2]<=0.00010 && ma360_240_buffer[1]-ma360_240_buffer[2]<=0.00010 &&
               ma650_240_buffer[1]-ma650_240_buffer[2]<=0.00010 &&
                  //  macd<=0.00110  >=0.00110   main && signal <=-0.00015   
               macdmainline_240_buffer[1]-macdmainline_240_buffer[2]<=-0.000150 && 
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]<=-0.000150 &&
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.001100 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.001100 &&
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
              (ma180_240_buffer[1]-ma180_240_buffer[2]<=0.00010 && ma360_240_buffer[1]-ma360_240_buffer[2]<=0.00010 &&
               ma650_240_buffer[1]-ma650_240_buffer[2]<=0.00010 &&
                  //  macd>=-0.00110  <=0.00110   main && signal <=-0.00015   
               macdmainline_240_buffer[1]-macdmainline_240_buffer[2]<=-0.000150 && 
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]<=-0.000150 &&
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.001100 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.001100 &&
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
              (ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00010 && ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.00010 &&
              (ma05_240_buffer[1]-ma05_240_buffer[2]<=0.00010 || ma08_240_buffer[1]-ma08_240_buffer[2]<=0.00010 ||
               ma12_240_buffer[1]-ma12_240_buffer[2]<=0.00010) &&
                  //ma45,ma90�w�����  [1]-[6]<=0.0003
               ma45_240_buffer[1]-ma45_240_buffer[6]<=0.00030 && ma90_240_buffer[1]-ma90_240_buffer[6]<=0.00030 &&
                // [1]�W�v�j��30�I          [2][3]����  
              (close_240_buffer[1]-open_240_buffer[1]<=-0.00010  && high_240_buffer[1]-close_240_buffer[1]>=0.00300)  ||
               close_240_buffer[1]-open_240_buffer[1]>=0.00010  && high_240_buffer[1]-open_240_buffer[1]>=0.00300)  &&
              (close_240_buffer[2]-open_240_buffer[2]>=0.00010 || close_240_buffer[3]-open_240_buffer[3]>=0.00010)  && 
                   //   [5]||[6]||[7]||[8]���}�L���b[1]���W   �U�^��W���d�W�v�u         
              (close_240_buffer[5]-close_240_buffer[1]>=0 || close_240_buffer[6]-close_240_buffer[1]>=0 ||
               close_240_buffer[7]-close_240_buffer[1]>=0 || close_240_buffer[8]-close_240_buffer[1]>=0 ||
               close_240_buffer[9]-close_240_buffer[1]>=0 || close_240_buffer[10]-close_240_buffer[1]>=0) &&                 //kd2,kd3>=7     
               k2_240_buffer[1]-d2_240_buffer[1]<=-3 &&  k3_240_buffer[1]-d3_240_buffer[1]<=-3)
               OrderClose(OrderTicket(),lots,Bid,1,LimeGreen); 

//*** close Buy  22  ***************************************************************************************** 
  
                //����^�^��ma180��A�ϼu��ma45�ᤣ���F
                //(m15-67)   h4 �� ma45�פU ma90���� ma180 �פW  �W��U�ƦC  ma45,ma90,ma180   
        if    (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00020 && ma90_240_buffer[1]-ma90_240_buffer[2]<=0.00010 &&
               ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00010 && ma45_240_buffer[1]-ma90_240_buffer[1]>=0.00100 &&
               ma90_240_buffer[1]-ma180_240_buffer[1]>=0.00100 &&
                     //   kd1,(kd2||kd3)<=-3  k1,k2,k3>=75             
               k1_240_buffer[1]-d1_240_buffer[1]<=-3 && (k2_240_buffer[1]-d2_240_buffer[1]<=-3 || k3_240_buffer[1]-d3_240_buffer[1]<=-3) &&
               k2_240_buffer[1]>=75 && k3_240_buffer[1]>=75 &&
               //ma05 [1]-[2]<=0 
               ma05_240_buffer[1]-ma05_240_buffer[2]<=0 &&
                   // [1]�W�v�j��22�I          [2]||[3]����  
             ((close_240_buffer[1]-open_240_buffer[1]<=-0.00010  && high_240_buffer[1]-close_240_buffer[1]>=0.00220)  ||
              (close_240_buffer[1]-open_240_buffer[1]>=0.00010  && high_240_buffer[1]-open_240_buffer[1]>=0.00220))  &&
              (close_240_buffer[2]-open_240_buffer[2]>=0.00010 || close_240_buffer[3]-open_240_buffer[3]>=0.00010)   && 
            
                // ([2]||[3]||[4]||[5]) && ([6]||[7]||[8]||[9])  close[1]-ma45>=-0.0005 <=0.0005  ���bma45����
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
 
              //�^�Ầ��ma180�W�U�d�W�v�u
                //(m15-67)   h4 �� ma90,ma180,ma360,ma650 ���פU     �U��W�ƦC  ma90,ma180,ma360,ma650   
        if    (ma90_240_buffer[1]-ma90_240_buffer[2]<0 && ma180_240_buffer[1]-ma180_240_buffer[2]<=0 &&
               ma360_240_buffer[1]-ma360_240_buffer[2]<0 && ma650_240_buffer[1]-ma650_240_buffer[2]<-0.00010 &&
               ma90_240_buffer[1]-ma180_240_buffer[1]<=0.00100 && ma90_240_buffer[1]-ma180_240_buffer[1]>=-0.00100 && 
                  //ma45 �}�f�L�U
              (ma90_240_buffer[1]-ma45_240_buffer[1])-(ma90_240_buffer[2]-ma45_240_buffer[2])<0 && 
                   //macd   signal  [1]>[2] [1]<[3] 
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]>=0.000010 &&
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[3]<=-0.000010 &&

                  // [1]�W�v�j��22�I          [2]||[3]����  
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

//m5 k1,k2,k3�ҤW��,�B�b50�U
     if   ((k1_15_buffer[1]-k1_15_buffer[2]>=3 &&  k2_15_buffer[1]-k2_15_buffer[2]>=1 && k3_15_buffer[1]-k3_15_buffer[2]>=0 &&
            k1_15_buffer[1]<=50 &&   k2_15_buffer[1]<=50 && k3_15_buffer[1]<=50))
            if    (k1_05_buffer[1]-d1_05_buffer[1]>=3 &&   k1_05_buffer[1]<=50)                               
    
 //m60,m240 kd�Ȯt����<-10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]<=-10 && k3_60_buffer[1]-d3_60_buffer[2]<=-10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]<=-10 && k3_240_buffer[1]-d3_240_buffer[2]<=-10) ||

 //H1,H4 k2,k3�b���I,��H4 k1,k,k3�b���I
                    (k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
                    (k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
 
 //H4 ma05 �U��,macd�b1550�~,���L��ma05�y���Z����kd1,kd2,kd3���}�f�B�V�U
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-7 && k2_240_buffer[1]-d2_240_buffer[1]<=-7 && k3_240_buffer[1]-d3_240_buffer[2]<=-7 &&
                     k2_240_buffer[1]>=65 && k3_240_buffer[1]>=65))) || 

 //H4 ma05 �U��,���L��ma05�y���Z��,k1,k2,k3�V�U
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]<=-1 && k2_240_buffer[1]-k2_240_buffer[2]<=-1 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                     k1_240_buffer[1]>=30) || 
 
 //H4 ma05 �U��,���L��ma05�y���Z��,kd1�V�U,k2��k3 �V�U
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-6 && (k2_240_buffer[1]-k2_240_buffer[2]<=-1 || k3_240_buffer[1]-k3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=30) || 
                                     
 //H4 ma05 �W���ͽw ([1]-[2])-([2]-[3])<=-0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])<=-0.00030) ||

 //m60,m240 kd1,2,3�Ȯt����<-1
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-1 && k2_60_buffer[1]-d2_60_buffer[1]<=-1 && k3_60_buffer[1]-d3_60_buffer[2]<=-1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-1 && (k2_240_buffer[1]-d2_240_buffer[1]<=-1 || k3_240_buffer[1]-d3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=40) ||
                      
 //m60 kd2,kd3�Ȯt>16 �Υ[�`>35 
                    (k2_60_buffer[1]-d2_60_buffer[1]<=-16 && k3_60_buffer[1]-d3_60_buffer[2]<=-16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])<=-35) ||
 
 //���ק�� k1�b65�W
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-4 &&  k1_240_buffer[2]-k1_240_buffer[3]>=4 && k1_240_buffer[1]>=65) ||

 //H4 k1,k2,k3�b20�U,kd1,kd2,kd3���٦V�U�}�f 
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-3 &&  k2_240_buffer[1]-d2_240_buffer[1]<=-3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]<=-3 &&  k1_240_buffer[1]<=20 &&  k2_240_buffer[1]<=20 &&  k3_240_buffer[1]<=20) ||

 //m60 k1,k2,k3�b20�U,kd1,kd2,kd3���٦V�U�}�f 
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-3 &&  k2_60_buffer[1]-d2_60_buffer[1]<=-3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]<=-3 &&  k1_60_buffer[1]<=20 &&  k2_60_buffer[1]<=20 &&  k3_60_buffer[1]<=20) ||

 //m240 ma05[1],ma12[1]�t�Z�j��28�I ,�}�f���j([1]-[2])<=-10�I([2]-[3])<=-8�I
                    (ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])<=-0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])<=-0.00050)) ||      

 //m240 k1�e��������k2,k3���j�T���W ��macd�}�f�|�j               
                    (k1_240_buffer[1]-k1_240_buffer[2]>=-3 && k1_240_buffer[1]-k1_240_buffer[2]<=3 &&
                   ((k2_240_buffer[1]-k2_240_buffer[2]<=-6 && k3_240_buffer[1]-k3_240_buffer[2]<=-6) || 
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001300))) ||
 
 //H1-K1,K2,K3��H4-K1  ���U��
                    (k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 &&
                     k3_60_buffer[1]-k3_60_buffer[2]<=0 && k1_240_buffer[1]-k1_240_buffer[2]<=0) ||

 //m240  k1�j�T�V�W [1]��[2]�����@����
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
    
 //m60,m240 kd�Ȯt����<-10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]<=-10 && k3_60_buffer[1]-d3_60_buffer[2]<=-10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]<=-10 && k3_240_buffer[1]-d3_240_buffer[2]<=-10) ||

 //H1,H4 k2,k3�b���I,��H4 k1,k,k3�b���I
                    (k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
                    (k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
 
 //H4 ma05 �U��,macd�b1550�~,���L��ma05�y���Z����kd1,kd2,kd3���}�f�B�V�U
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-7 && k2_240_buffer[1]-d2_240_buffer[1]<=-7 && k3_240_buffer[1]-d3_240_buffer[2]<=-7 &&
                     k2_240_buffer[1]>=65 && k3_240_buffer[1]>=65))) || 

 //H4 ma05 �U��,���L��ma05�y���Z��,k1,k2,k3�V�U
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]<=-1 && k2_240_buffer[1]-k2_240_buffer[2]<=-1 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                     k1_240_buffer[1]>=30) || 
 
 //H4 ma05 �U��,���L��ma05�y���Z��,kd1�V�U,k2��k3 �V�U
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-6 && (k2_240_buffer[1]-k2_240_buffer[2]<=-1 || k3_240_buffer[1]-k3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=30) || 
                                     
 //H4 ma05 �W���ͽw ([1]-[2])-([2]-[3])<=-0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])<=-0.00030) ||

 //H4 k1,k2,k3�b20�U,kd1,kd2,kd3���٦V�U�}�f 
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-3 &&  k2_240_buffer[1]-d2_240_buffer[1]<=-3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]<=-3 &&  k1_240_buffer[1]<=20 &&  k2_240_buffer[1]<=20 &&  k3_240_buffer[1]<=20) ||

 //m60 k1,k2,k3�b20�U,kd1,kd2,kd3���٦V�U�}�f 
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-3 &&  k2_60_buffer[1]-d2_60_buffer[1]<=-3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]<=-3 &&  k1_60_buffer[1]<=20 &&  k2_60_buffer[1]<=20 &&  k3_60_buffer[1]<=20) ||

 //m60,m240 kd1,2,3�Ȯt����<-1
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-1 && k2_60_buffer[1]-d2_60_buffer[1]<=-1 && k3_60_buffer[1]-d3_60_buffer[2]<=-1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-1 && (k2_240_buffer[1]-d2_240_buffer[1]<=-1 || k3_240_buffer[1]-d3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=40) ||
                      
 //m60 kd2,kd3�Ȯt>16 �Υ[�`>35 
                    (k2_60_buffer[1]-d2_60_buffer[1]<=-16 && k3_60_buffer[1]-d3_60_buffer[2]<=-16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])<=-35) ||
 
 //���ק�� k1�b65�W
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-4 &&  k1_240_buffer[2]-k1_240_buffer[3]>=4 && k1_240_buffer[1]>=65) ||

 //m240 ma05[1],ma12[1]�t�Z�j��28�I ,�}�f���j([1]-[2])<=-10�I([2]-[3])<=-8�I
                    (ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])<=-0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])<=-0.00050)) ||      

 //m240 k1�e��������k2,k3���j�T���W ��macd�}�f�|�j               
                    (k1_240_buffer[1]-k1_240_buffer[2]>=-3 && k1_240_buffer[1]-k1_240_buffer[2]<=3 &&
                   ((k2_240_buffer[1]-k2_240_buffer[2]<=-6 && k3_240_buffer[1]-k3_240_buffer[2]<=-6) || 
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001300))) ||
 
 //H1-K1,K2,K3��H4-K1  ���U��
                    (k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 &&
                     k3_60_buffer[1]-k3_60_buffer[2]<=0 && k1_240_buffer[1]-k1_240_buffer[2]<=0) ||

 //m240  k1�j�T�V�W [1]��[2]�����@����
                  (((k1_240_buffer[1]-k1_240_buffer[2])-(k1_240_buffer[2]-k1_240_buffer[3])<=-3) && (close_240_buffer[1]-open_240_buffer[1]<=-0.00030 || close_240_buffer[2]-open_240_buffer[2]<=-0.00030)) ||
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-12 && (close_240_buffer[1]-open_240_buffer[1]<=-0.00030 || close_240_buffer[2]-open_240_buffer[2]<=-0.00030)))
                     return;
                     else                                      
                     OrderClose(OrderTicket(),lots,Ask,1,Gold);    
  //***close Sell  3  ********************************************************************************************************************** 

//   if ( OrdersTotal()>0 && OrderMagicNumber() == 8803) 
    if ( OrdersTotal()>0 && OrderMagicNumber() != 8810) 
    
     if   ((k1_15_buffer[1]-k1_15_buffer[2]>=6 &&  k1_15_buffer[1]<=25 &&

 // m240���b30�U
            k1_15_buffer[1]-d1_15_buffer[1]>=4 && k1_240_buffer[1]<=30 &&
            close_15_buffer[1]-close_15_buffer[2]>=0.00010 && close_15_buffer[1]-close_15_buffer[3]>=0.00010))
    
 //m60,m240 kd�Ȯt����<-10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]<=-10 && k3_60_buffer[1]-d3_60_buffer[2]<=-10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]<=-10 && k3_240_buffer[1]-d3_240_buffer[2]<=-10) ||

 //H1,H4 k2,k3�b���I,��H4 k1,k,k3�b���I
                    (k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
                    (k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
 
 //H4 ma05 �U��,macd�b1550�~,���L��ma05�y���Z����kd1,kd2,kd3���}�f�B�V�U
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-7 && k2_240_buffer[1]-d2_240_buffer[1]<=-7 && k3_240_buffer[1]-d3_240_buffer[2]<=-7 &&
                     k2_240_buffer[1]>=65 && k3_240_buffer[1]>=65))) || 

 //H4 ma05 �U��,���L��ma05�y���Z��,k1,k2,k3�V�U
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]<=-1 && k2_240_buffer[1]-k2_240_buffer[2]<=-1 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                     k1_240_buffer[1]>=30) || 
 
 //H4 ma05 �U��,���L��ma05�y���Z��,kd1�V�U,k2��k3 �V�U
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-6 && (k2_240_buffer[1]-k2_240_buffer[2]<=-1 || k3_240_buffer[1]-k3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=30) || 
                                     
 //H4 ma05 �W���ͽw ([1]-[2])-([2]-[3])<=-0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])<=-0.00030) ||

 //H4 k1,k2,k3�b20�U,kd1,kd2,kd3���٦V�U�}�f 
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-3 &&  k2_240_buffer[1]-d2_240_buffer[1]<=-3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]<=-3 &&  k1_240_buffer[1]<=20 &&  k2_240_buffer[1]<=20 &&  k3_240_buffer[1]<=20) ||

 //m60,m240 kd1,2,3�Ȯt����<-1
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-1 && k2_60_buffer[1]-d2_60_buffer[1]<=-1 && k3_60_buffer[1]-d3_60_buffer[2]<=-1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-1 && (k2_240_buffer[1]-d2_240_buffer[1]<=-1 || k3_240_buffer[1]-d3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=40) ||
                      
 //m60 kd2,kd3�Ȯt>16 �Υ[�`>35 
                    (k2_60_buffer[1]-d2_60_buffer[1]<=-16 && k3_60_buffer[1]-d3_60_buffer[2]<=-16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])<=-35) ||
 
 //���ק�� k1�b65�W
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-4 &&  k1_240_buffer[2]-k1_240_buffer[3]>=4 && k1_240_buffer[1]>=65) ||

 //m240 ma05[1],ma12[1]�t�Z�j��28�I ,�}�f���j([1]-[2])<=-10�I([2]-[3])<=-8�I
                    (ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])<=-0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])<=-0.00050)) ||      

 //m240 k1�e��������k2,k3���j�T���W ��macd�}�f�|�j               
                    (k1_240_buffer[1]-k1_240_buffer[2]>=-3 && k1_240_buffer[1]-k1_240_buffer[2]<=3 &&
                   ((k2_240_buffer[1]-k2_240_buffer[2]<=-6 && k3_240_buffer[1]-k3_240_buffer[2]<=-6) || 
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001300))) ||
 
 //H1-K1,K2,K3��H4-K1  ���U��
                    (k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 &&
                     k3_60_buffer[1]-k3_60_buffer[2]<=0 && k1_240_buffer[1]-k1_240_buffer[2]<=0) ||

 //m240  k1�j�T�V�W [1]��[2]�����@����
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
    
 //m60,m240 kd�Ȯt����<-10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]<=-10 && k3_60_buffer[1]-d3_60_buffer[2]<=-10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]<=-10 && k3_240_buffer[1]-d3_240_buffer[2]<=-10) ||

 //H1,H4 k2,k3�b���I,��H4 k1,k,k3�b���I
                    (k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
                    (k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
 
 //H4 ma05 �U��,macd�b1550�~,���L��ma05�y���Z����kd1,kd2,kd3���}�f�B�V�U
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-7 && k2_240_buffer[1]-d2_240_buffer[1]<=-7 && k3_240_buffer[1]-d3_240_buffer[2]<=-7 &&
                     k2_240_buffer[1]>=65 && k3_240_buffer[1]>=65))) || 

 //H4 ma05 �U��,���L��ma05�y���Z��,k1,k2,k3�V�U
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]<=-1 && k2_240_buffer[1]-k2_240_buffer[2]<=-1 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                     k1_240_buffer[1]>=30) || 
 
 //H4 ma05 �U��,���L��ma05�y���Z��,kd1�V�U,k2��k3 �V�U
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-6 && (k2_240_buffer[1]-k2_240_buffer[2]<=-1 || k3_240_buffer[1]-k3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=30) || 
                                     
 //H4 ma05 �W���ͽw ([1]-[2])-([2]-[3])<=-0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])<=-0.00030) ||

 //H4 k1,k2,k3�b20�U,kd1,kd2,kd3���٦V�U�}�f 
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-3 &&  k2_240_buffer[1]-d2_240_buffer[1]<=-3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]<=-3 &&  k1_240_buffer[1]<=20 &&  k2_240_buffer[1]<=20 &&  k3_240_buffer[1]<=20) ||

 //m60 k1,k2,k3�b20�U,kd1,kd2,kd3���٦V�U�}�f 
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-3 &&  k2_60_buffer[1]-d2_60_buffer[1]<=-3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]<=-3 &&  k1_60_buffer[1]<=20 &&  k2_60_buffer[1]<=20 &&  k3_60_buffer[1]<=20) ||

 //m60,m240 kd1,2,3�Ȯt����<-1
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-1 && k2_60_buffer[1]-d2_60_buffer[1]<=-1 && k3_60_buffer[1]-d3_60_buffer[2]<=-1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-1 && (k2_240_buffer[1]-d2_240_buffer[1]<=-1 || k3_240_buffer[1]-d3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=40) ||
                      
 //m60 kd2,kd3�Ȯt>16 �Υ[�`>35 
                    (k2_60_buffer[1]-d2_60_buffer[1]<=-16 && k3_60_buffer[1]-d3_60_buffer[2]<=-16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])<=-35) ||
 
 //���ק�� k1�b65�W
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-4 &&  k1_240_buffer[2]-k1_240_buffer[3]>=4 && k1_240_buffer[1]>=65) ||

 //m240 ma05[1],ma12[1]�t�Z�j��28�I ,�}�f���j([1]-[2])<=-10�I([2]-[3])<=-8�I
                    (ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])<=-0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])<=-0.00050)) ||      

 //m240 k1�e��������k2,k3���j�T���W ��macd�}�f�|�j               
                    (k1_240_buffer[1]-k1_240_buffer[2]>=-3 && k1_240_buffer[1]-k1_240_buffer[2]<=3 &&
                   ((k2_240_buffer[1]-k2_240_buffer[2]<=-6 && k3_240_buffer[1]-k3_240_buffer[2]<=-6) || 
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001300))) ||
 
 //H1-K1,K2,K3��H4-K1  ���U��
                    (k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 &&
                     k3_60_buffer[1]-k3_60_buffer[2]<=0 && k1_240_buffer[1]-k1_240_buffer[2]<=0) ||

 //m240  k1�j�T�V�W [1]��[2]�����@����
                  (((k1_240_buffer[1]-k1_240_buffer[2])-(k1_240_buffer[2]-k1_240_buffer[3])<=-3) && (close_240_buffer[1]-open_240_buffer[1]<=-0.00030 || close_240_buffer[2]-open_240_buffer[2]<=-0.00030)) ||
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-12 && (close_240_buffer[1]-open_240_buffer[1]<=-0.00030 || close_240_buffer[2]-open_240_buffer[2]<=-0.00030)))
                     return;
                     else                             
                     OrderClose(OrderTicket(),lots,Ask,1,Gold);    

//*** CLOSE  sell  5  ***************************************************************************************** 
    
//�Φb���ҥH�ư��������      
 
//   if ( OrdersTotal()>0 && OrderMagicNumber() == 8805) 
    if ( OrdersTotal()>0 && OrderMagicNumber() != 8810) 
 
 //[1]��[2]�����U�v�L20�I
      if((((close_60_buffer[1]-open_60_buffer[1]>=0.00010 && low_60_buffer[1]-open_60_buffer[1]<=-0.00200) || 
           (close_60_buffer[2]-open_60_buffer[2]>=0.00010 && low_60_buffer[2]-open_60_buffer[2]<=-0.00200))  ||
 //��[1]��[2]���t�U�v�L20�I
          ((close_60_buffer[1]-open_60_buffer[1]<=-0.00010 && low_60_buffer[1]-close_60_buffer[1]<=-0.00200) || 
           (close_60_buffer[2]-open_60_buffer[2]<=-0.00010 && low_60_buffer[2]-close_60_buffer[2]<=-0.00200))) && 
 //[2]��[3]��[4]�����@����
           (close_60_buffer[2]-open_60_buffer[2]>=0.00030 || close_60_buffer[3]-open_60_buffer[3]>=0.00030 ||  close_60_buffer[4]-open_60_buffer[4]>=0.00030) &&         
 //ma12,ma05���Z���L20�I,K1,K2,K3,�b50�U�B�W��            
            ma05_60_buffer[1]-ma12_60_buffer[1]>=-0.00200 &&
            k1_60_buffer[1]<=50 &&   k2_60_buffer[1]<=50 && k3_60_buffer[1]<=50 &&
            k1_60_buffer[1]-k1_60_buffer[2]>=1 &&  k2_60_buffer[1]-k2_60_buffer[2]>=1  &&  k3_60_buffer[1]-k3_60_buffer[2]>=1)
            OrderClose(OrderTicket(),lots,Ask,1,Gold);    
 
//*** CLOSE  sell  6  ***************************************************************************************** 

//    if ( OrdersTotal()>0 && OrderMagicNumber() == 8806) 

 //ma45,ma90�e�W�� ([1]-[2])-([2]-[3])>=0.00010
      if  (((ma45_15_buffer[1]-ma45_15_buffer[2]) - (ma45_15_buffer[2]-ma45_15_buffer[3])>=0.00010) &&
           ((ma90_15_buffer[1]-ma90_15_buffer[2]) - (ma90_15_buffer[2]-ma90_15_buffer[3])>=0.00010) &&
 //K1,k2,k3 �b�C�I kd1��e�W            
            k1_15_buffer[1]<=30  &&  k2_15_buffer[1]<=25 && k3_15_buffer[1]<=25 &&
           (k1_15_buffer[1]-d1_15_buffer[1]>=2  || k1_15_buffer[1]-k1_15_buffer[2]>=4))
            OrderClose(OrderTicket(),lots,Ask,1,Gold);    
 
 
//*** CLOSE  sell  7  ***************************************************************************************** 

 //   if ( OrdersTotal()>0 && OrderMagicNumber() == 8807) 
    if ( OrdersTotal()>0 && OrderMagicNumber() != 8810) 

 //ma90��ma190��m240�e�W�� ([1]-[2])-([2]-[3])>=0.00010
      if((((ma90_240_buffer[1]-ma90_240_buffer[2]) - (ma90_240_buffer[2]-ma90_240_buffer[3])>=0.00010) ||
          ((ma180_240_buffer[1]-ma180_240_buffer[2]) - (ma180_240_buffer[2]-ma180_240_buffer[3])>=0.00010) ||
          ((ma360_240_buffer[1]-ma360_240_buffer[2]) - (ma360_240_buffer[2]-ma360_240_buffer[3])>=0.00010)) &&
 
 //m60��ma05�Pma12�t�Z�b15�I��
            ma05_60_buffer[1]-ma12_60_buffer[1]>=-0.00150 &&

 //m240��ma05�Pma12�t�Z�b35�I��
            ma05_240_buffer[1]-ma12_240_buffer[1]>=-0.00350 &&
 
 //K1,k2,k3 �b�C�I kd1��e�W           
            k1_240_buffer[1]<=30  &&  k2_240_buffer[1]<=25 && k3_240_buffer[1]<=25 &&
 //m240��ma05�Pma12�t�Z�b40�I��
            ma05_240_buffer[1]-ma12_240_buffer[1]>=-0.00400 && 
          (k1_240_buffer[1]-d1_240_buffer[1]>=2 || k1_240_buffer[1]-k1_240_buffer[2]>=4))
            OrderClose(OrderTicket(),lots,Ask,1,Gold);    
 
//*** CLOSE  sell  8  ***************************************************************************************** 

 //   if ( OrdersTotal()>0 && OrderMagicNumber() == 8808) 
     if ( OrdersTotal()>0 && OrderMagicNumber() != 8810) 
         
 // m15 k1,k2,k3�ҤW�� ,�B�b50,30�U
      if   (k1_15_buffer[1]-k1_15_buffer[2]>=3 &&  k2_15_buffer[1]-k2_15_buffer[2]>=1 && k3_15_buffer[1]-k3_15_buffer[2]>=1 &&
            k1_15_buffer[1]<=50 &&   k2_15_buffer[1]<=30 && k3_15_buffer[1]<=30 &&
             
 //m30,m60,m240�����b30�U�B�}�l�W��
            k1_30_buffer[0]-k1_30_buffer[1]>=-1 && k1_30_buffer[1]<=30 &&
            k1_60_buffer[0]-k1_60_buffer[1]>=-1 && k1_60_buffer[1]<=30 &&
 //m60��ma05�Pma12�t�Z�b15�I��
            ma05_60_buffer[1]-ma12_60_buffer[1]>=-0.00150 &&
            k1_240_buffer[0]-k1_240_buffer[1]>=-2 && k1_240_buffer[1]<=30 &&
 //m240��ma05�Pma12�t�Z�b35�I��
            ma05_240_buffer[1]-ma12_240_buffer[1]>=-0.00350)
 
 //H4 k1,k2,k3�b20�U,kd1,kd2,kd3���٦V�U�}�f 
            if     ((k1_240_buffer[1]-d1_240_buffer[1]<=-3 &&  k2_240_buffer[1]-d2_240_buffer[1]<=-3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]<=-3 &&  k1_240_buffer[1]<=20 &&  k2_240_buffer[1]<=20 &&  k3_240_buffer[1]<=20) ||

 //m60 k1,k2,k3�b20�U,kd1,kd2,kd3���٦V�U�}�f 
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-3 &&  k2_60_buffer[1]-d2_60_buffer[1]<=-3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]<=-3 &&  k1_60_buffer[1]<=20 &&  k2_60_buffer[1]<=20 &&  k3_60_buffer[1]<=20) ||
                     
 //H1-K1,K2,K3��H4-K1  ���U��
                    (k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 &&
                     k3_60_buffer[1]-k3_60_buffer[2]<=0 && k1_240_buffer[1]-k1_240_buffer[2]<=0))
                     return;
                     else
                     OrderClose(OrderTicket(),lots,Ask,1,Gold);    

//*** CLOSE  sell  9  ***************************************************************************************** 

 //   if ( OrdersTotal()>0 && OrderMagicNumber() == 8809) 
     if ( OrdersTotal()>0 && OrderMagicNumber() != 8810) 
         
 // m240 k1,k2��k3�W�� ,�B�b30�U
      if   (k1_240_buffer[1]<=30 &&   k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30 &&
          ((k1_240_buffer[1]-k1_240_buffer[2]>=3 &&  (k2_240_buffer[1]-k2_240_buffer[2]>=1 || k3_240_buffer[1]-k3_240_buffer[2]>=1)) ||
           (k1_240_buffer[1]-d1_240_buffer[1]>=6 && k2_240_buffer[1]-d2_240_buffer[1]>=-8 &&  k3_240_buffer[1]-d3_240_buffer[1]>=-8))  &&
             
 //m60��ma05�Pma12�t�Z�b15�I��
            ma05_60_buffer[1]-ma12_60_buffer[1]>=-0.00150 &&

 //m240��ma05�Pma12�t�Z�b35�I��
            ma05_240_buffer[1]-ma12_240_buffer[1]>=-0.00350 &&
 
 //[1][2]����[3]��[4]���t
            close_240_buffer[1]-open_240_buffer[1]>=0.00040 && close_240_buffer[2]-open_240_buffer[2]>=0 &&
           (close_240_buffer[3]-open_240_buffer[3]<=-0.00040 || close_240_buffer[4]-open_240_buffer[4]<=-0.00040) &&
           
 //ma180��ma360�פW
           (ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00010 || ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00010) &&                      
 
 //[1][2][3]��[2][3][4]�}�Φ��L�bma180�W�U�U12�I��
           ((close_240_buffer[2]-ma180_240_buffer[2]>=-0.00120 || close_240_buffer[2]-ma180_240_buffer[2]<=0.00120) &&
            (close_240_buffer[3]-ma180_240_buffer[3]>=-0.00120 || close_240_buffer[3]-ma180_240_buffer[3]<=0.00120) &&
           ((close_240_buffer[4]-ma180_240_buffer[4]>=-0.00120 || close_240_buffer[4]-ma180_240_buffer[4]<=0.00120) ||
            (close_240_buffer[1]-ma180_240_buffer[1]>=-0.00120 || close_240_buffer[1]-ma180_240_buffer[1]<=0.00120))) ||
          
 //��[1][2][3]��[2][3][4]�}�Φ��L�bma360�W�U�U12�I��
           ((close_240_buffer[2]-ma360_240_buffer[2]>=-0.00120 || close_240_buffer[2]-ma360_240_buffer[2]<=0.00120) &&
            (close_240_buffer[3]-ma360_240_buffer[3]>=-0.00120 || close_240_buffer[3]-ma360_240_buffer[3]<=0.00120) &&
           ((close_240_buffer[4]-ma360_240_buffer[4]>=-0.00120 || close_240_buffer[4]-ma360_240_buffer[4]<=0.00120) ||
            (close_240_buffer[1]-ma360_240_buffer[1]>=-0.00120 || close_240_buffer[1]-ma360_240_buffer[1]<=0.00120))))
            OrderClose(OrderTicket(),lots,Ask,1,Gold);    
 
//*** CLOSE  sell  10  ***************************************************************************************** 

  //�Φb���ҥH�ư��������      

    if ( OrdersTotal()>0 && OrderMagicNumber() == 8810) 
          
 // m15 k1,k2,k3�ҤW�� ,�B�b50,30�U
      if   (k1_15_buffer[1]-k1_15_buffer[2]>=3 &&  k2_15_buffer[1]-k2_15_buffer[2]>=1 && k3_15_buffer[1]-k3_15_buffer[2]>=1 &&
            k1_15_buffer[1]<=50 &&   k2_15_buffer[1]<=30 && k3_15_buffer[1]<=30 &&
             
 // m30 k1,k2��k3�ҤW�� ,�B�b40,30�U
           (k1_30_buffer[1]-k1_30_buffer[2]>=1 &&  (k2_30_buffer[1]-k2_30_buffer[2]>=1 || k3_30_buffer[1]-k3_30_buffer[2]>=1) && 
            k1_30_buffer[1]<=40 && k2_30_buffer[1]<=30 && k3_30_buffer[1]<=30) &&
 
 // m60 k1,k2��k3�ҤW�� ,�B�b40,30�U��[0]���j�T�פW�� 
         (((k1_60_buffer[1]-k1_60_buffer[2]>=1 &&  (k2_60_buffer[1]-k2_60_buffer[2]>=1 || k3_60_buffer[1]-k3_60_buffer[2]>=1)) || 
           (k1_60_buffer[0]-k1_60_buffer[1]>=5 && k1_60_buffer[0]-d1_60_buffer[0]>=2))  &&
            k1_60_buffer[1]<=40 && k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30)) 
 
 //m60,m240 kd�Ȯt����<-10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]<=-10 && k3_60_buffer[1]-d3_60_buffer[2]<=-10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]<=-10 && k3_240_buffer[1]-d3_240_buffer[2]<=-10) ||

 //H1,H4 k2,k3�b���I,��H4 k1,k,k3�b���I
                    (k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
                    (k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
 
 //m60 kd2,kd3�Ȯt>16 �Υ[�`>35 
                    (k2_60_buffer[1]-d2_60_buffer[1]<=-16 && k3_60_buffer[1]-d3_60_buffer[2]<=-16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])<=-35) ||
 
 //H1-K1,K2,K3��H4-K1  ���U��
                    (k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 &&
                     k3_60_buffer[1]-k3_60_buffer[2]<=0 && k1_240_buffer[1]-k1_240_buffer[2]<=0))
                     return;
                     else                             
                     OrderClose(OrderTicket(),lots,Ask,1,Gold);    
 
//*** CLOSE  sell  11  ***************************************************************************************** 
//����M�W�ۦP��K1[0],KD[0]�y���P  

 //   if ( OrdersTotal()>0 && OrderMagicNumber() == 8811) 
     if ( OrdersTotal()>0 && OrderMagicNumber() != 8810) 
 
 // H4   [1][3]��[1][4]��[1][5]��[1][6]����
      if (((close_240_buffer[1]-open_240_buffer[1]>=0.00050 &&  close_240_buffer[3]-open_240_buffer[3]>=0.00050) ||
           (close_240_buffer[1]-open_240_buffer[1]>=0.00050 &&  close_240_buffer[4]-open_240_buffer[4]>=0.00050) ||
           (close_240_buffer[1]-open_240_buffer[1]>=0.00050 &&  close_240_buffer[5]-open_240_buffer[5]>=0.00050) ||
           (close_240_buffer[1]-open_240_buffer[1]>=0.00050 &&  close_240_buffer[6]-open_240_buffer[6]>=0.00050)) &&
             
 // H4 k1,k2��k3�ҤW��,�BK1�b40�U,[1]�W�v�u���p��12�I
          ((k1_240_buffer[1]-k1_240_buffer[2]>0 &&  (k2_240_buffer[1]-k2_240_buffer[2]>0 || k3_240_buffer[1]-k3_240_buffer[2]>0) && 
            k1_240_buffer[1]<=40 && high_240_buffer[1]-close_240_buffer[1]<=0.00120) || 
    
 // H4 k1�b�C�I�V�W          
           (k1_240_buffer[1]<=20 && k1_240_buffer[1]-k1_240_buffer[2]>=3 )) &&
            
 //ma45��ma90��ma180��׫פW��
           (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00030 || ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00030 ||
            ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00030))      
            OrderClose(OrderTicket(),lots,Ask,1,Gold);    





//*** CLOSE  sell  15 ***************************************************************************************** 
//    if ( OrdersTotal()>0 && OrderMagicNumber() == 8815 
    if ( OrdersTotal()>0 && OrderMagicNumber() != 8810) 
  
  
                  //(m15-63)  H4     [2][3]����<20�I     [1]����>=10�I  �d�U�v�u>30�I   
      if     (close_240_buffer[1]-open_240_buffer[1]>=0.00100  && low_240_buffer[1]-open_240_buffer[1]<=-0.00300 &&
              close_240_buffer[2]-open_240_buffer[2]<=-0.00090  && close_240_buffer[3]-open_240_buffer[3]<=-0.00090  &&   
               // ma45 ma90 || ma90  ma180  �פW�B�j
             ((ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00080 &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00020) ||
              (ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00060 &&  ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00020)) &&
                // [1]���L�bma05���W  ���W�L15�I
              close_240_buffer[1]-ma05_240_buffer[1]>=0.00010  && close_240_buffer[1]-ma05_240_buffer[1]<=0.00150) 
               // (m15-66) kd2,kd3[1]-[2]<=-7    k2,k2>=70 
              if    ((k1_240_buffer[1]-d1_240_buffer[1]<=-7 && k2_240_buffer[1]-d2_240_buffer[1]<=-7 && k3_240_buffer[1]-d3_240_buffer[1]<=-7 &&
                      k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70))
                      return;
                      else
                     OrderClose(OrderTicket(),lots,Ask,1,Gold);    
    
//*** CLOSE  sell  16 ***************************************************************************************** 
//    if ( OrdersTotal()>0 && OrderMagicNumber() == 8816
    if ( OrdersTotal()>0 && OrderMagicNumber() != 8810) 
              
                   //(m15-65)   h4 �� ma650�פW             ma360�פW�u�u
         if   (ma650_240_buffer[1]-ma650_240_buffer[2]>0 &&
                  //h4 [1]���t�B�bma360���U�����W�L25�I
             ((close_240_buffer[1]-open_240_buffer[1]<=-0.00010 && close_240_buffer[1]-ma360_240_buffer[1]<=-0.00010 &&
               close_240_buffer[1]-ma360_240_buffer[1]>=-0.00250) ||
                 //h4 [1]�����B�bma360���W�����W�L25�I ��[2]�U�v�u�j��25�I
              (close_240_buffer[1]-open_240_buffer[1]>=0.00010 && close_240_buffer[1]-ma360_240_buffer[1]<=-0.00010 &&
               close_240_buffer[1]-ma360_240_buffer[1]>=-0.00250 && low_240_buffer[2]-close_240_buffer[2]<=-0.00250)) &&
                 //k2,k3[1]-[2]>=0    k2,k2<=30  k1[1]-[2]>0 || [1]�U�v�u�j��25�I
               k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
               k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30 &&
              (k1_240_buffer[1]-k1_240_buffer[2]>=0 ||  low_240_buffer[1]-close_240_buffer[1]<=-0.00250) &&  
                  // macd�t��>=-0.00150  <=0.00100 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.001500 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.001000 && 
              // [2]||[3]||[4]||[5]���bma360�W��25�I��  
             ((close_240_buffer[2]-ma360_240_buffer[2]>=0.00010  && close_240_buffer[2]-ma360_240_buffer[2]<=0.00250) ||
              (close_240_buffer[3]-ma360_240_buffer[3]>=0.00010  && close_240_buffer[3]-ma360_240_buffer[3]<=0.00250) ||
              (close_240_buffer[4]-ma360_240_buffer[4]>=0.00010  && close_240_buffer[4]-ma360_240_buffer[4]<=0.00250) ||
              (close_240_buffer[5]-ma360_240_buffer[5]>=0.00010  && close_240_buffer[5]-ma360_240_buffer[5]<=0.00250)))
               OrderClose(OrderTicket(),lots,Ask,1,Gold);    
 
//*** CLOSE  sell  17 ***************************************************************************************** 
//    if ( OrdersTotal()>0 && OrderMagicNumber() == 8817
    if ( OrdersTotal()>0 && OrderMagicNumber() != 8810) 
              
                   //(m15-65)   h4 �� ma650�פW          ma180�פW�u�u
         if   (ma650_240_buffer[1]-ma650_240_buffer[2]>0.00010 &&
                  //h4 [1]���t�B�bma180���U�����W�L25�I
             ((close_240_buffer[1]-open_240_buffer[1]<=-0.00010 && close_240_buffer[1]-ma180_240_buffer[1]<=-0.00010 &&
               close_240_buffer[1]-ma180_240_buffer[1]>=-0.00250) ||
                 //h4 [1]�����B�bma180���W�����W�L25�I ��[2]�U�v�u�j��25�I
              (close_240_buffer[1]-open_240_buffer[1]>=0.00010 && close_240_buffer[1]-ma180_240_buffer[1]<=-0.00010 &&
               close_240_buffer[1]-ma180_240_buffer[1]>=-0.00250 && low_240_buffer[2]-close_240_buffer[2]<=-0.00250)) &&
                 //k2,k3[1]-[2]>=0 ||kd2,kd3>=1   k2,k2<=30  k1[1]-[2]>0 || [1]�U�v�u�j��25�I
             ((k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0) ||
              (k2_240_buffer[1]-d2_240_buffer[2]>=1 && k3_240_buffer[1]-d3_240_buffer[2]>=1)) &&
               k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30 &&
              (k1_240_buffer[1]-k1_240_buffer[2]>=0 ||  low_240_buffer[1]-close_240_buffer[1]<=-0.00250) &&  
                  // macd�t��>=-0.00150  <=0.00100 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.001500 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.001000 && 
              // [2]||[3]||[4]||[5]���bma180�W��25�I��  
             ((close_240_buffer[2]-ma180_240_buffer[2]>=0.00010  && close_240_buffer[2]-ma180_240_buffer[2]<=0.00250) ||
              (close_240_buffer[3]-ma180_240_buffer[3]>=0.00010  && close_240_buffer[3]-ma180_240_buffer[3]<=0.00250) ||
              (close_240_buffer[4]-ma180_240_buffer[4]>=0.00010  && close_240_buffer[4]-ma180_240_buffer[4]<=0.00250) ||
              (close_240_buffer[5]-ma180_240_buffer[5]>=0.00010  && close_240_buffer[5]-ma180_240_buffer[5]<=0.00250)))
               OrderClose(OrderTicket(),lots,Ask,1,Gold);    

//*** CLOSE  sell  18 ***************************************************************************************** 
//    if ( OrdersTotal()>0 && OrderMagicNumber() == 8818
    if ( OrdersTotal()>0 && OrderMagicNumber() != 8810) 
                   
               //(m15-65)  ma45�פW  ma90�����αפW   ma180,ma360,ma650�פU  ���bma45���U�w�[�^���W��[1]�d�U�v�u>25�I�B����                      
      if      (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00020 &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0 &&       
                 // macd�t��>=-0.00150  <=0.00100 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.001500 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.001000 && 
                   //   k1,k2,k3>=0  k2,k2<=30            
               k1_240_buffer[1]-k1_240_buffer[2]>=0 && k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
               k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30 &&
                 //h4 [1]�����U�v�u�j��25�I
               close_240_buffer[1]-open_240_buffer[1]>=0.00010 &&  low_240_buffer[1]-close_240_buffer[1]<=-0.00250 &&
                  // [1],[2],[3],[4],[5],[6],[7] ���bma45�U��25�I�� ���W5�I�� 
               close_240_buffer[1]-ma45_240_buffer[1]>=-0.00250  && close_240_buffer[1]-ma180_240_buffer[1]<=0.00050 &&
               close_240_buffer[2]-ma45_240_buffer[2]>=-0.00250  && close_240_buffer[2]-ma180_240_buffer[2]<=0.00050 &&
               close_240_buffer[3]-ma45_240_buffer[3]>=-0.00250  && close_240_buffer[3]-ma180_240_buffer[3]<=0.00050 &&
               close_240_buffer[4]-ma45_240_buffer[4]>=-0.00250  && close_240_buffer[4]-ma180_240_buffer[4]<=0.00050 &&
               close_240_buffer[5]-ma45_240_buffer[5]>=-0.00250  && close_240_buffer[5]-ma180_240_buffer[5]<=0.00050 &&
               close_240_buffer[6]-ma45_240_buffer[6]>=-0.00250  && close_240_buffer[6]-ma180_240_buffer[6]<=0.00050)
               OrderClose(OrderTicket(),lots,Ask,1,Gold);    
 
//*** CLOSE  sell  19***************************************************************************************** 
 //    if ( OrdersTotal()>0 && OrderMagicNumber() == 8819
    if ( OrdersTotal()>0 && OrderMagicNumber() != 8810) 

                //(m15-65) h4  ����@�q�ɶ��^���W�h  ma �ҤU�����e�{�������
       if     (ma05_240_buffer[1]-ma05_240_buffer[10]<=0  &&  ma05_240_buffer[1]-ma05_240_buffer[10]>=-0.00100 &&
               ma45_240_buffer[1]-ma45_240_buffer[10]<=0  &&  ma45_240_buffer[1]-ma45_240_buffer[10]>=-0.00450 &&
               ma90_240_buffer[1]-ma90_240_buffer[10]<=0  &&  ma90_240_buffer[1]-ma90_240_buffer[10]>=-0.00250 &&   
               ma180_240_buffer[1]-ma180_240_buffer[10]<=0  &&  ma180_240_buffer[1]-ma180_240_buffer[10]>=-0.00250 &&
               ma360_240_buffer[1]-ma360_240_buffer[10]<=0  &&  ma360_240_buffer[1]-ma360_240_buffer[10]>=-0.00250 &&
               ma650_240_buffer[1]-ma650_240_buffer[10]<=0  &&  ma650_240_buffer[1]-ma650_240_buffer[10]>=-0.00250 &&
                // [1]~[6] macd�t��>=-0.0050  <=0.0050 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.000500 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.000500 && 
               macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]>=-0.000500 &&  macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]<=0.000500 && 
               macdmainline_240_buffer[3]-macdsignalline_240_buffer[3]>=-0.000500 &&  macdmainline_240_buffer[3]-macdsignalline_240_buffer[3]<=0.000500 && 
               macdmainline_240_buffer[4]-macdsignalline_240_buffer[4]>=-0.000500 &&  macdmainline_240_buffer[4]-macdsignalline_240_buffer[4]<=0.000500 && 
               macdmainline_240_buffer[5]-macdsignalline_240_buffer[5]>=-0.000500 &&  macdmainline_240_buffer[5]-macdsignalline_240_buffer[5]<=0.000500 && 
               macdmainline_240_buffer[6]-macdsignalline_240_buffer[6]>=-0.000500 &&  macdmainline_240_buffer[6]-macdsignalline_240_buffer[6]<=0.000500)// && 
                     //(m15-66)  k2,k3<=0  kd1<=-18  ma45�פU
               if ((k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00010  && 
                       //(m15-67)  k2,k3 ���פW����U�^  exit
                   ((k2_240_buffer[4]-k2_240_buffer[5]>=3 && k3_240_buffer[4]-k3_240_buffer[5]>=3) ||
                    (k2_240_buffer[5]-k2_240_buffer[6]>=3 && k3_240_buffer[5]-k3_240_buffer[6]>=3)) &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-18) ||
                      //(m15-67) h4 [1]macd �Ȥ���0.00120 �P-0.00120��  �����                                
                   (macdmainline_240_buffer[1]>=-0.001200 && macdmainline_240_buffer[1]<=0.001200 &&
                    macdsignalline_240_buffer[1]>=-0.001200 &&  macdsignalline_240_buffer[1]<=0.001200))
                    OrderClose(OrderTicket(),lots,Ask,1,Gold);    
 
//*** CLOSE  sell  20***************************************************************************************** 
//    if ( OrdersTotal()>0 && OrderMagicNumber() == 8820
    if ( OrdersTotal()>0 && OrderMagicNumber() != 8810) 
       
         //(m15-66)  ma650�פW [1]>=0.0050   ma90 ���W ma45�bma650���U50�I,�B�פW���j    ma90�bma45���U50�I 
        if     (ma650_240_buffer[1]-ma650_240_buffer[2]>=0.00020  && close_240_buffer[1]-open_240_buffer[1]>=0.00500 &&
                ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00070  && ma90_240_buffer[1]-ma90_240_buffer[1]>=0.00020  &&
                ma45_240_buffer[1]-ma650_240_buffer[2]<=-0.00500  && ma90_240_buffer[1]-ma45_240_buffer[1]<=-0.00500 && 
                    //   kd1,kd2,kd3>=4  k2,k3<=35            
                k1_240_buffer[1]-d1_240_buffer[1]>=4 && k2_240_buffer[1]-d2_240_buffer[1]>=4 && k3_240_buffer[1]-d3_240_buffer[1]>=4 &&
                k2_240_buffer[1]<=35 && k3_240_buffer[1]<=35)
                OrderClose(OrderTicket(),lots,Ask,1,Gold);    

//*** CLOSE  sell  21 ***************************************************************************************** 
 //    if ( OrdersTotal()>0 && OrderMagicNumber() == 8821
    if ( OrdersTotal()>0 && OrderMagicNumber() != 8810) 
             
                  //(m15-66)   h4 �� ma180,ma360,ma650 �פW ��ma180���� ma360 �פW   
        if   ((ma180_240_buffer[1]-ma180_240_buffer[2]>=-0.00010 && ma360_240_buffer[1]-ma360_240_buffer[2]>=-0.00010 &&
               ma650_240_buffer[1]-ma650_240_buffer[2]>=-0.00010 &&
                  //  macd>=0.00110  <=-0.00110   main && signal >=0.00015   
               macdmainline_240_buffer[1]-macdmainline_240_buffer[2]>=0.000150 && 
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]>=0.000150 &&
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.001100 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.001100 &&
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
              (ma180_240_buffer[1]-ma180_240_buffer[2]>=-0.00010 && ma360_240_buffer[1]-ma360_240_buffer[2]>=-0.00010 &&
               ma650_240_buffer[1]-ma650_240_buffer[2]>=-0.00010 &&
                  //  macd>=0.00110  <=-0.00110   main && signal >=0.00015   
               macdmainline_240_buffer[1]-macdmainline_240_buffer[2]>=0.000150 && 
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]>=0.000150 &&
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.001100 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.001100 &&
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
              (ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00010 && ma650_240_buffer[1]-ma650_240_buffer[2]>=0.00010 &&
              (ma05_240_buffer[1]-ma05_240_buffer[2]>=-0.00010 || ma08_240_buffer[1]-ma08_240_buffer[2]>=-0.00010 ||
               ma12_240_buffer[1]-ma12_240_buffer[2]>=-0.00010) &&
                  //ma45,ma90�w�����  [1]-[6]>=-0.0003
               ma45_240_buffer[1]-ma45_240_buffer[6]>=-0.00030 && ma90_240_buffer[1]-ma90_240_buffer[6]>=-0.00030 &&
                // [1]�U�v�j��30�I          [2],[3]���t  
              (close_240_buffer[1]-open_240_buffer[1]>=0.00010  && low_240_buffer[1]-open_240_buffer[1]<=-0.00300)  ||
               close_240_buffer[1]-open_240_buffer[1]<=-0.00010  && low_240_buffer[1]-close_240_buffer[1]<=-0.00300)  &&
              (close_240_buffer[2]-open_240_buffer[2]<=-0.00010 || close_240_buffer[3]-open_240_buffer[3]<=-0.00010)  && 
                   //   [5]||[6]||[7]||[8]���}�L���b[1]���U   �U�W����U�^�d�U�v�u         
              (open_240_buffer[5]-open_240_buffer[1]<=0 || open_240_buffer[6]-open_240_buffer[1]<=0 ||
               open_240_buffer[7]-open_240_buffer[1]<=0 || open_240_buffer[8]-open_240_buffer[1]<=0 ||
               open_240_buffer[9]-open_240_buffer[1]<=0 || open_240_buffer[10]-open_240_buffer[1]<=0) &&                 //kd2,kd3>=7     
               k2_240_buffer[1]-d2_240_buffer[1]>=3 &&  k3_240_buffer[1]-d3_240_buffer[1]>=3)
               OrderClose(OrderTicket(),lots,Ask,1,Gold);    

//*** CLOSE  sell  22 **************************************************************************************** 
//    if ( OrdersTotal()>0 && OrderMagicNumber() == 8822
    if ( OrdersTotal()>0 && OrderMagicNumber() != 8810) 

                //�^�Ầ��ma180��A�U�^��ma45�ᤣ�^�F
                //(m15-67)   h4 �� ma45�פW ma90���� ma180 �פU  �W��U�ƦC  ma180,ma90,ma45   
        if    (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00020 && ma90_240_buffer[1]-ma90_240_buffer[2]>=-0.00010 &&
               ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00010 && ma45_240_buffer[1]-ma90_240_buffer[1]<=-0.00100 &&
               ma90_240_buffer[1]-ma180_240_buffer[1]<=-0.00100 &&
                     //   kd1,(kd2||kd3)>=3  k1,k2,k3<=25             
               k1_240_buffer[1]-d1_240_buffer[1]>=3 && (k2_240_buffer[1]-d2_240_buffer[1]>=3 || k3_240_buffer[1]-d3_240_buffer[1]>=3) &&
               k2_240_buffer[1]<=25 && k3_240_buffer[1]<=25 &&
               //ma05 [1]-[2]>=0 
               ma05_240_buffer[1]-ma05_240_buffer[2]>=0 &&
                   // [1]�U�v�j��22�I          [2]||[3]���t  
             ((close_240_buffer[1]-open_240_buffer[1]>=0.00010  && low_240_buffer[1]-open_240_buffer[1]<=-0.00220)  ||
              (close_240_buffer[1]-open_240_buffer[1]<=-0.00010  && low_240_buffer[1]-close_240_buffer[1]<=-0.00220))  &&
              (close_240_buffer[2]-open_240_buffer[2]<=-0.00010 || close_240_buffer[3]-open_240_buffer[3]<=-0.00010)   && 
            
                // ([2]||[3]||[4]||[5]) && ([6]||[7]||[8]||[9])  close[1]-ma45<=0.0005 >=-0.0005  ���bma45����
             ((close_240_buffer[2]-ma45_240_buffer[2]<=0.00050 && close_240_buffer[2]-ma45_240_buffer[2]>=-0.00050) || 
              (close_240_buffer[3]-ma45_240_buffer[3]<=0.00050 && close_240_buffer[3]-ma45_240_buffer[3]>=-0.00050) || 
              (close_240_buffer[4]-ma45_240_buffer[4]<=0.00050 && close_240_buffer[4]-ma45_240_buffer[4]>=-0.00050) || 
              (close_240_buffer[5]-ma45_240_buffer[5]<=0.00050 && close_240_buffer[5]-ma45_240_buffer[5]>=-0.00050)) && 
             ((close_240_buffer[6]-ma45_240_buffer[6]<=0.00050 && close_240_buffer[6]-ma45_240_buffer[6]>=-0.00050) || 
              (close_240_buffer[7]-ma45_240_buffer[7]<=0.00050 && close_240_buffer[7]-ma45_240_buffer[7]>=-0.00050) || 
              (close_240_buffer[8]-ma45_240_buffer[8]<=0.00050 && close_240_buffer[8]-ma45_240_buffer[8]>=-0.00050) || 
              (close_240_buffer[9]-ma45_240_buffer[9]<=0.00050 && close_240_buffer[9]-ma45_240_buffer[9]>=-0.00050))) 
               OrderClose(OrderTicket(),lots,Ask,1,Gold);    
       
//*** CLOSE  sell  23***************************************************************************************** 
//    if ( OrdersTotal()>0 && OrderMagicNumber() == 8823
    if ( OrdersTotal()>0 && OrderMagicNumber() != 8810) 

                //����^��ma180�W�U�d�U�v�u
                //(m15-67)   h4 �� ma90,ma180,ma360,ma650 ���פW     �W��U�ƦC  ma90,ma180,ma360,ma650   
        if    (ma90_240_buffer[1]-ma90_240_buffer[2]>0 && ma180_240_buffer[1]-ma180_240_buffer[2]>=0 &&
               ma360_240_buffer[1]-ma360_240_buffer[2]>0 && ma650_240_buffer[1]-ma650_240_buffer[2]>0.00010 &&
               ma90_240_buffer[1]-ma180_240_buffer[1]>=-0.00100 && ma90_240_buffer[1]-ma180_240_buffer[1]<=0.00100 && 
                  //ma45 �}�f�L�W
              (ma90_240_buffer[1]-ma45_240_buffer[1])-(ma90_240_buffer[2]-ma45_240_buffer[2])>0 && 
                   //macd   signal  [1]<[2] [1]>[3] 
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]<=-0.000010 &&
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[3]>=0.000010 &&

                     // [1]�U�v�j��35�I          [2]||[3]���t  
             ((close_240_buffer[1]-open_240_buffer[1]>=0.00010  && low_240_buffer[1]-open_240_buffer[1]<=-0.00350)  ||
              (close_240_buffer[1]-open_240_buffer[1]<=-0.00010  && low_240_buffer[1]-close_240_buffer[1]<=-0.00350))  &&
              (close_240_buffer[2]-open_240_buffer[2]<=-0.00010 || close_240_buffer[3]-open_240_buffer[3]<=-0.00010)) 
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
//m5 k1,k2,k3�ҤW��,�B�b50�U
     if   ((k1_15_buffer[1]-k1_15_buffer[2]>=3 &&  k2_15_buffer[1]-k2_15_buffer[2]>=1 && k3_15_buffer[1]-k3_15_buffer[2]>=0 &&
            k1_15_buffer[1]<=50 &&   k2_15_buffer[1]<=50 && k3_15_buffer[1]<=50))
            if    (k1_05_buffer[1]-d1_05_buffer[1]>=3 &&   k1_05_buffer[1]<=50)                               
    
 //m60,m240 kd�Ȯt����<-10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]<=-10 && k3_60_buffer[1]-d3_60_buffer[2]<=-10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]<=-10 && k3_240_buffer[1]-d3_240_buffer[2]<=-10) ||

 //H1,H4 k2,k3�b���I,��H4 k1,k,k3�b���I
                    (k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
                    (k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
 
 //H4 ma05 �U��,macd�b1550�~,���L��ma05�y���Z����kd1,kd2,kd3���}�f�B�V�U
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-7 && k2_240_buffer[1]-d2_240_buffer[1]<=-7 && k3_240_buffer[1]-d3_240_buffer[2]<=-7 &&
                     k2_240_buffer[1]>=65 && k3_240_buffer[1]>=65))) || 

 //H4 ma05 �U��,���L��ma05�y���Z��,k1,k2,k3�V�U
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]<=-1 && k2_240_buffer[1]-k2_240_buffer[2]<=-1 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                     k1_240_buffer[1]>=30) || 
 
 //H4 ma05 �U��,���L��ma05�y���Z��,kd1�V�U,k2��k3 �V�U
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-6 && (k2_240_buffer[1]-k2_240_buffer[2]<=-1 || k3_240_buffer[1]-k3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=30) || 
                                     
 //H4 ma05 �W���ͽw ([1]-[2])-([2]-[3])<=-0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])<=-0.00030) ||

 //m60,m240 kd1,2,3�Ȯt����<-1
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-1 && k2_60_buffer[1]-d2_60_buffer[1]<=-1 && k3_60_buffer[1]-d3_60_buffer[2]<=-1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-1 && (k2_240_buffer[1]-d2_240_buffer[1]<=-1 || k3_240_buffer[1]-d3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=40) ||
                      
 //m60 kd2,kd3�Ȯt>16 �Υ[�`>35 
                    (k2_60_buffer[1]-d2_60_buffer[1]<=-16 && k3_60_buffer[1]-d3_60_buffer[2]<=-16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])<=-35) ||
 
 //���ק�� k1�b65�W
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-4 &&  k1_240_buffer[2]-k1_240_buffer[3]>=4 && k1_240_buffer[1]>=65) ||

 //H4 k1,k2,k3�b20�U,kd1,kd2,kd3���٦V�U�}�f 
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-3 &&  k2_240_buffer[1]-d2_240_buffer[1]<=-3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]<=-3 &&  k1_240_buffer[1]<=20 &&  k2_240_buffer[1]<=20 &&  k3_240_buffer[1]<=20) ||

 //m60 k1,k2,k3�b20�U,kd1,kd2,kd3���٦V�U�}�f 
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-3 &&  k2_60_buffer[1]-d2_60_buffer[1]<=-3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]<=-3 &&  k1_60_buffer[1]<=20 &&  k2_60_buffer[1]<=20 &&  k3_60_buffer[1]<=20) ||

 //m240 ma05[1],ma12[1]�t�Z�j��28�I ,�}�f���j([1]-[2])<=-10�I([2]-[3])<=-8�I
                    (ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])<=-0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])<=-0.00050)) ||      

 //m240 k1�e��������k2,k3���j�T���W ��macd�}�f�|�j               
                    (k1_240_buffer[1]-k1_240_buffer[2]>=-3 && k1_240_buffer[1]-k1_240_buffer[2]<=3 &&
                   ((k2_240_buffer[1]-k2_240_buffer[2]<=-6 && k3_240_buffer[1]-k3_240_buffer[2]<=-6) || 
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001300))) ||
 
 //H1-K1,K2,K3��H4-K1  ���U��
                    (k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 &&
                     k3_60_buffer[1]-k3_60_buffer[2]<=0 && k1_240_buffer[1]-k1_240_buffer[2]<=0) ||

 //m240  k1�j�T�V�W [1]��[2]�����@����
                  (((k1_240_buffer[1]-k1_240_buffer[2])-(k1_240_buffer[2]-k1_240_buffer[3])<=-3) && (close_240_buffer[1]-open_240_buffer[1]<=-0.00030 || close_240_buffer[2]-open_240_buffer[2]<=-0.00030)) ||
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-12 && (close_240_buffer[1]-open_240_buffer[1]<=-0.00030 || close_240_buffer[2]-open_240_buffer[2]<=-0.00030)))
                     return;
                     else                         
                     OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-300*Point,Ask+6900*Point,"My order #B1",8801,0,Yellow );

 //********** Buy  2  *********************************************************************************************************************************** 
    
    if ( OrdersTotal()>0 && OrderMagicNumber() == 8802) 
      return;
      else
//    m5 k1,k2,k3�ҤW��,�B�b50�U,[1]����  BUY
     if   ((k1_30_buffer[1]-k1_30_buffer[2]>=3 &&  k2_30_buffer[1]-k2_30_buffer[2]>=1 && k3_30_buffer[1]-k3_30_buffer[2]>=0 &&
            k1_30_buffer[1]<=30 &&   k2_30_buffer[1]<=25 && k3_30_buffer[1]<=25) ||
           (k1_60_buffer[1]-k1_60_buffer[2]>=3 &&  k2_60_buffer[1]-k2_60_buffer[2]>=1 && k3_60_buffer[1]-k3_60_buffer[2]>=0 &&
            k1_60_buffer[1]<=30 &&   k2_60_buffer[1]<=25 && k3_60_buffer[1]<=25))
            if    (k1_05_buffer[1]-d1_05_buffer[1]>=3 &&   k1_05_buffer[1]<=50)                               
    
 //m60,m240 kd�Ȯt����<-10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]<=-10 && k3_60_buffer[1]-d3_60_buffer[2]<=-10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]<=-10 && k3_240_buffer[1]-d3_240_buffer[2]<=-10) ||

 //H1,H4 k2,k3�b���I,��H4 k1,k,k3�b���I
                    (k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
                    (k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
 
 //H4 ma05 �U��,macd�b1550�~,���L��ma05�y���Z����kd1,kd2,kd3���}�f�B�V�U
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-7 && k2_240_buffer[1]-d2_240_buffer[1]<=-7 && k3_240_buffer[1]-d3_240_buffer[2]<=-7 &&
                     k2_240_buffer[1]>=65 && k3_240_buffer[1]>=65))) || 

 //H4 ma05 �U��,���L��ma05�y���Z��,k1,k2,k3�V�U
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]<=-1 && k2_240_buffer[1]-k2_240_buffer[2]<=-1 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                     k1_240_buffer[1]>=30) || 
 
 //H4 ma05 �U��,���L��ma05�y���Z��,kd1�V�U,k2��k3 �V�U
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-6 && (k2_240_buffer[1]-k2_240_buffer[2]<=-1 || k3_240_buffer[1]-k3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=30) || 
                                     
 //H4 ma05 �W���ͽw ([1]-[2])-([2]-[3])<=-0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])<=-0.00030) ||

 //m60,m240 kd1,2,3�Ȯt����<-1
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-1 && k2_60_buffer[1]-d2_60_buffer[1]<=-1 && k3_60_buffer[1]-d3_60_buffer[2]<=-1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-1 && (k2_240_buffer[1]-d2_240_buffer[1]<=-1 || k3_240_buffer[1]-d3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=40) ||
                      
 //m60 kd2,kd3�Ȯt>16 �Υ[�`>35 
                    (k2_60_buffer[1]-d2_60_buffer[1]<=-16 && k3_60_buffer[1]-d3_60_buffer[2]<=-16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])<=-35) ||
 
 //���ק�� k1�b65�W
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-4 &&  k1_240_buffer[2]-k1_240_buffer[3]>=4 && k1_240_buffer[1]>=65) ||

 //H4 k1,k2,k3�b20�U,kd1,kd2,kd3���٦V�U�}�f 
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-3 &&  k2_240_buffer[1]-d2_240_buffer[1]<=-3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]<=-3 &&  k1_240_buffer[1]<=20 &&  k2_240_buffer[1]<=20 &&  k3_240_buffer[1]<=20) ||

 //m60 k1,k2,k3�b20�U,kd1,kd2,kd3���٦V�U�}�f 
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-3 &&  k2_60_buffer[1]-d2_60_buffer[1]<=-3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]<=-3 &&  k1_60_buffer[1]<=20 &&  k2_60_buffer[1]<=20 &&  k3_60_buffer[1]<=20) ||

 //m240 ma05[1],ma12[1]�t�Z�j��28�I ,�}�f���j([1]-[2])<=-10�I([2]-[3])<=-8�I
                    (ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])<=-0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])<=-0.00050)) ||      

 //m240 k1�e��������k2,k3���j�T���W ��macd�}�f�|�j               
                    (k1_240_buffer[1]-k1_240_buffer[2]>=-3 && k1_240_buffer[1]-k1_240_buffer[2]<=3 &&
                   ((k2_240_buffer[1]-k2_240_buffer[2]<=-6 && k3_240_buffer[1]-k3_240_buffer[2]<=-6) || 
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001300))) ||
 
 //H1-K1,K2,K3��H4-K1  ���U��
                    (k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 &&
                     k3_60_buffer[1]-k3_60_buffer[2]<=0 && k1_240_buffer[1]-k1_240_buffer[2]<=0) ||

 //m240  k1�j�T�V�W [1]��[2]�����@����
                  (((k1_240_buffer[1]-k1_240_buffer[2])-(k1_240_buffer[2]-k1_240_buffer[3])<=-3) && (close_240_buffer[1]-open_240_buffer[1]<=-0.00030 || close_240_buffer[2]-open_240_buffer[2]<=-0.00030)) ||
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-12 && (close_240_buffer[1]-open_240_buffer[1]<=-0.00030 || close_240_buffer[2]-open_240_buffer[2]<=-0.00030)))
                     return;
                     else               
                     OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-300*Point,Ask+6900*Point,"My order #B2",8802,0,Aqua);

 //********** Buy  3  *********************************************************************************************************************************** 
    
//�Φb���ҥH�ư��������      
 
   if ( OrdersTotal()>0 && OrderMagicNumber() == 8803) 
      return;
      else

     if   ((k1_15_buffer[1]-k1_15_buffer[2]>=6 &&  k1_15_buffer[1]<=25 &&

 // m240���b30�U
            k1_15_buffer[1]-d1_15_buffer[1]>=4 && k1_240_buffer[1]<=30 &&
            close_15_buffer[1]-close_15_buffer[2]>=0.00010 && close_15_buffer[1]-close_15_buffer[3]>=0.00010))
           
 //m60,m240 kd�Ȯt����<-10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]<=-10 && k3_60_buffer[1]-d3_60_buffer[2]<=-10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]<=-10 && k3_240_buffer[1]-d3_240_buffer[2]<=-10) ||

 //H1,H4 k2,k3�b���I,��H4 k1,k,k3�b���I
                    (k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
                    (k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
 
 //H4 ma05 �U��,macd�b1550�~,���L��ma05�y���Z����kd1,kd2,kd3���}�f�B�V�U
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-7 && k2_240_buffer[1]-d2_240_buffer[1]<=-7 && k3_240_buffer[1]-d3_240_buffer[2]<=-7 &&
                     k2_240_buffer[1]>=65 && k3_240_buffer[1]>=65))) || 

 //H4 ma05 �U��,���L��ma05�y���Z��,k1,k2,k3�V�U
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]<=-1 && k2_240_buffer[1]-k2_240_buffer[2]<=-1 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                     k1_240_buffer[1]>=30) || 
 
 //H4 ma05 �U��,���L��ma05�y���Z��,kd1�V�U,k2��k3 �V�U
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-6 && (k2_240_buffer[1]-k2_240_buffer[2]<=-1 || k3_240_buffer[1]-k3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=30) || 
                                     
 //H4 ma05 �W���ͽw ([1]-[2])-([2]-[3])<=-0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])<=-0.00030) ||

 //m60,m240 kd1,2,3�Ȯt����<-1
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-1 && k2_60_buffer[1]-d2_60_buffer[1]<=-1 && k3_60_buffer[1]-d3_60_buffer[2]<=-1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-1 && (k2_240_buffer[1]-d2_240_buffer[1]<=-1 || k3_240_buffer[1]-d3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=40) ||
                      
 //m60 kd2,kd3�Ȯt>16 �Υ[�`>35 
                    (k2_60_buffer[1]-d2_60_buffer[1]<=-16 && k3_60_buffer[1]-d3_60_buffer[2]<=-16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])<=-35) ||
 
 //���ק�� k1�b65�W
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-4 &&  k1_240_buffer[2]-k1_240_buffer[3]>=4 && k1_240_buffer[1]>=65) ||

 //H4 k1,k2,k3�b20�U,kd1,kd2,kd3���٦V�U�}�f 
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-3 &&  k2_240_buffer[1]-d2_240_buffer[1]<=-3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]<=-3 &&  k1_240_buffer[1]<=20 &&  k2_240_buffer[1]<=20 &&  k3_240_buffer[1]<=20) ||

 //m60 k1,k2,k3�b20�U,kd1,kd2,kd3���٦V�U�}�f 
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-3 &&  k2_60_buffer[1]-d2_60_buffer[1]<=-3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]<=-3 &&  k1_60_buffer[1]<=20 &&  k2_60_buffer[1]<=20 &&  k3_60_buffer[1]<=20) ||

 //m240 ma05[1],ma12[1]�t�Z�j��28�I ,�}�f���j([1]-[2])<=-10�I([2]-[3])<=-8�I
                    (ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])<=-0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])<=-0.00050)) ||      

 //m240 k1�e��������k2,k3���j�T���W ��macd�}�f�|�j               
                    (k1_240_buffer[1]-k1_240_buffer[2]>=-3 && k1_240_buffer[1]-k1_240_buffer[2]<=3 &&
                   ((k2_240_buffer[1]-k2_240_buffer[2]<=-6 && k3_240_buffer[1]-k3_240_buffer[2]<=-6) || 
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001300))) ||
 
 //H1-K1,K2,K3��H4-K1  ���U��
                    (k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 &&
                     k3_60_buffer[1]-k3_60_buffer[2]<=0 && k1_240_buffer[1]-k1_240_buffer[2]<=0) ||

 //m240  k1�j�T�V�W [1]��[2]�����@����
                  (((k1_240_buffer[1]-k1_240_buffer[2])-(k1_240_buffer[2]-k1_240_buffer[3])<=-3) && (close_240_buffer[1]-open_240_buffer[1]<=-0.00030 || close_240_buffer[2]-open_240_buffer[2]<=-0.00030)) ||
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-12 && (close_240_buffer[1]-open_240_buffer[1]<=-0.00030 || close_240_buffer[2]-open_240_buffer[2]<=-0.00030)))
                     return;
                     else                            
                     OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-300*Point,Ask+6900*Point,"My order #B3",8803,0,Yellow );
 
 //********** Buy  4  *********************************************************************************************************************************** 
    
//�Φb���ҥH�ư��������      
 
   if ( OrdersTotal()>0 && OrderMagicNumber() == 8804) 
      return;
      else
   
     if   ((k1_30_buffer[1]-k1_30_buffer[2]>=6 &&  k1_30_buffer[1]<=25 &&
            k1_30_buffer[1]-d1_30_buffer[1]>=4 &&
            close_30_buffer[1]-close_30_buffer[2]>=0.00010 && close_30_buffer[1]-close_30_buffer[3]>=0.00010) ||
           (k1_60_buffer[1]-k1_60_buffer[2]>=6 &&  k1_60_buffer[1]<=25 &&
            k1_60_buffer[1]-d1_60_buffer[1]>=4 &&
            close_60_buffer[1]-close_60_buffer[2]>=0.00010 && close_60_buffer[1]-close_60_buffer[3]>=0.00010))
           
 //m60,m240 kd�Ȯt����<-10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]<=-10 && k3_60_buffer[1]-d3_60_buffer[2]<=-10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]<=-10 && k3_240_buffer[1]-d3_240_buffer[2]<=-10) ||

 //H1,H4 k2,k3�b���I,��H4 k1,k,k3�b���I
                    (k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
                    (k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
 
 //H4 ma05 �U��,macd�b1550�~,���L��ma05�y���Z����kd1,kd2,kd3���}�f�B�V�U
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-7 && k2_240_buffer[1]-d2_240_buffer[1]<=-7 && k3_240_buffer[1]-d3_240_buffer[2]<=-7 &&
                     k2_240_buffer[1]>=65 && k3_240_buffer[1]>=65))) || 

 //H4 ma05 �U��,���L��ma05�y���Z��,k1,k2,k3�V�U
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]<=-1 && k2_240_buffer[1]-k2_240_buffer[2]<=-1 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                     k1_240_buffer[1]>=30) || 
 
 //H4 ma05 �U��,���L��ma05�y���Z��,kd1�V�U,k2��k3 �V�U
                    (ma05_240_buffer[1]-ma05_240_buffer[2]<=-0.00060 && close_240_buffer[1]-ma05_240_buffer[1]<=-0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-6 && (k2_240_buffer[1]-k2_240_buffer[2]<=-1 || k3_240_buffer[1]-k3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=30) || 
                                     
 //H4 ma05 �W���ͽw ([1]-[2])-([2]-[3])<=-0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])<=-0.00030) ||


 //m60,m240 kd1,2,3�Ȯt����<-1
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-1 && k2_60_buffer[1]-d2_60_buffer[1]<=-1 && k3_60_buffer[1]-d3_60_buffer[2]<=-1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-1 && (k2_240_buffer[1]-d2_240_buffer[1]<=-1 || k3_240_buffer[1]-d3_240_buffer[2]<=-1) &&
                     k1_240_buffer[1]>=40) ||
                      
 //m60 kd2,kd3�Ȯt>16 �Υ[�`>35 
                    (k2_60_buffer[1]-d2_60_buffer[1]<=-16 && k3_60_buffer[1]-d3_60_buffer[2]<=-16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])<=-35) ||
 
 //���ק�� k1�b65�W
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-4 &&  k1_240_buffer[2]-k1_240_buffer[3]>=4 && k1_240_buffer[1]>=65) ||

 //H4 k1,k2,k3�b20�U,kd1,kd2,kd3���٦V�U�}�f 
                    (k1_240_buffer[1]-d1_240_buffer[1]<=-3 &&  k2_240_buffer[1]-d2_240_buffer[1]<=-3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]<=-3 &&  k1_240_buffer[1]<=20 &&  k2_240_buffer[1]<=20 &&  k3_240_buffer[1]<=20) ||

 //m60 k1,k2,k3�b20�U,kd1,kd2,kd3���٦V�U�}�f 
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-3 &&  k2_60_buffer[1]-d2_60_buffer[1]<=-3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]<=-3 &&  k1_60_buffer[1]<=20 &&  k2_60_buffer[1]<=20 &&  k3_60_buffer[1]<=20) ||

 //m240 ma05[1],ma12[1]�t�Z�j��28�I ,�}�f���j([1]-[2])<=-10�I([2]-[3])<=-8�I
                    (ma05_240_buffer[1]-ma12_240_buffer[1]<=-0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])<=-0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])<=-0.00050)) ||      

 //m240 k1�e��������k2,k3���j�T���W ��macd�}�f�|�j               
                    (k1_240_buffer[1]-k1_240_buffer[2]>=-3 && k1_240_buffer[1]-k1_240_buffer[2]<=3 &&
                   ((k2_240_buffer[1]-k2_240_buffer[2]<=-6 && k3_240_buffer[1]-k3_240_buffer[2]<=-6) || 
                    (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=-0.001300))) ||
 
 //H1-K1,K2,K3��H4-K1  ���U��
                    (k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 &&
                     k3_60_buffer[1]-k3_60_buffer[2]<=0 && k1_240_buffer[1]-k1_240_buffer[2]<=0) ||

 //m240  k1�j�T�V�W [1]��[2]�����@����
                  (((k1_240_buffer[1]-k1_240_buffer[2])-(k1_240_buffer[2]-k1_240_buffer[3])<=-3) && (close_240_buffer[1]-open_240_buffer[1]<=-0.00030 || close_240_buffer[2]-open_240_buffer[2]<=-0.00030)) ||
                    (k1_240_buffer[1]-k1_240_buffer[2]<=-12 && (close_240_buffer[1]-open_240_buffer[1]<=-0.00030 || close_240_buffer[2]-open_240_buffer[2]<=-0.00030)))
                     return;
                     else                   
                     OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-300*Point,Ask+6900*Point,"My order #B4",8804,0,Aqua);

 //********** Buy  5  *********************************************************************************************************************************** 
    
   if ( OrdersTotal()>0 && OrderMagicNumber() == 8805) 
      return;
      else
   
 //[1]��[2]�����U�v�L20�I
      if((((close_60_buffer[1]-open_60_buffer[1]>=0.00010 && low_60_buffer[1]-open_60_buffer[1]<=-0.00200) || 
           (close_60_buffer[2]-open_60_buffer[2]>=0.00010 && low_60_buffer[2]-open_60_buffer[2]<=-0.00200))  ||
 //��[1]��[2]���t�U�v�L20�I
          ((close_60_buffer[1]-open_60_buffer[1]<=-0.00010 && low_60_buffer[1]-close_60_buffer[1]<=-0.00200) || 
           (close_60_buffer[2]-open_60_buffer[2]<=-0.00010 && low_60_buffer[2]-close_60_buffer[2]<=-0.00200))) && 
 //[2]��[3]��[4]�����@����
           (close_60_buffer[2]-open_60_buffer[2]>=0.00030 || close_60_buffer[3]-open_60_buffer[3]>=0.00030 ||  close_60_buffer[4]-open_60_buffer[4]>=0.00030) &&         
 //ma12,ma05���Z���L20�I,K1,K2,K3,�b50�U�B�W��            
            ma05_60_buffer[1]-ma12_60_buffer[1]>=-0.00200 &&
            k1_60_buffer[1]<=50 &&   k2_60_buffer[1]<=50 && k3_60_buffer[1]<=50 &&
            k1_60_buffer[1]-k1_60_buffer[2]>=1 &&  k2_60_buffer[1]-k2_60_buffer[2]>=1  &&  k3_60_buffer[1]-k3_60_buffer[2]>=1)
            OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-30*Point,Ask+6900*Point,"My order #B5",8805,0,Aqua);

 //********** Buy  6  *********************************************************************************************************************************** 

    if ( OrdersTotal()>0 && OrderMagicNumber() == 8806) 
      return;
      else

 //ma45,ma90�e�W�� ([1]-[2])-([2]-[3])>=0.00010
      if  (((ma45_15_buffer[1]-ma45_15_buffer[2]) - (ma45_15_buffer[2]-ma45_15_buffer[3])>=0.00010) &&
           ((ma90_15_buffer[1]-ma90_15_buffer[2]) - (ma90_15_buffer[2]-ma90_15_buffer[3])>=0.00010) &&
 //K1,k2,k3 �b�C�I kd1��e�W            
            k1_15_buffer[1]<=30  &&  k2_15_buffer[1]<=25 && k3_15_buffer[1]<=25 &&
           (k1_15_buffer[1]-d1_15_buffer[1]>=2  || k1_15_buffer[1]-k1_15_buffer[2]>=4))
            OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-300*Point,Ask+6900*Point,"My order #B6",8806,0,Yellow);

 //********** Buy  7  *********************************************************************************************************************************** 

    if ( OrdersTotal()>0 && OrderMagicNumber() == 8807) 
      return;
      else

 //ma90��ma190��m240�e�W�� ([1]-[2])-([2]-[3])>=0.00010
      if((((ma90_240_buffer[1]-ma90_240_buffer[2]) - (ma90_240_buffer[2]-ma90_240_buffer[3])>=0.00010) ||
          ((ma180_240_buffer[1]-ma180_240_buffer[2]) - (ma180_240_buffer[2]-ma180_240_buffer[3])>=0.00010) ||
          ((ma360_240_buffer[1]-ma360_240_buffer[2]) - (ma360_240_buffer[2]-ma360_240_buffer[3])>=0.00010)) &&
 
 //K1,k2,k3 �b�C�I kd1��e�W           
           k1_240_buffer[1]<=30  &&  k2_240_buffer[1]<=25 && k3_240_buffer[1]<=25 &&
 
 //m60��ma05�Pma12�t�Z�b15�I��
            ma05_60_buffer[1]-ma12_60_buffer[1]>=-0.00150 &&

 //m240��ma05�Pma12�t�Z�b35�I��
            ma05_240_buffer[1]-ma12_240_buffer[1]>=-0.00350 &&

//m240��ma05�Pma12�t�Z�b40�I��
            ma05_240_buffer[1]-ma12_240_buffer[1]>=-0.00400 && 
          (k1_240_buffer[1]-d1_240_buffer[1]>=2 || k1_240_buffer[1]-k1_240_buffer[2]>=4))
            OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-600*Point,Ask+6900*Point,"My order #B7",8807,0,Aqua);
 
 //********** Buy  8  *********************************************************************************************************************************** 

    if ( OrdersTotal()>0 && OrderMagicNumber() == 8808) 
      return;
      else
          
 // m15 k1,k2,k3�ҤW�� ,�B�b50,30�U
      if   (k1_15_buffer[1]-k1_15_buffer[2]>=3 &&  k2_15_buffer[1]-k2_15_buffer[2]>=1 && k3_15_buffer[1]-k3_15_buffer[2]>=1 &&
            k1_15_buffer[1]<=50 &&   k2_15_buffer[1]<=30 && k3_15_buffer[1]<=30 &&
             
 //m30,m60,m240�����b30�U�B�}�l�W��
            k1_30_buffer[0]-k1_30_buffer[1]>=-1 && k1_30_buffer[1]<=30 &&
            k1_60_buffer[0]-k1_60_buffer[1]>=-1 && k1_60_buffer[1]<=30 &&
 //m60��ma05�Pma12�t�Z�b15�I��
            ma05_60_buffer[1]-ma12_60_buffer[1]>=-0.00150 &&
            k1_240_buffer[0]-k1_240_buffer[1]>=-2 && k1_240_buffer[1]<=30 &&
 //m240��ma05�Pma12�t�Z�b35�I��
            ma05_240_buffer[1]-ma12_240_buffer[1]>=-0.00350)

 //H4 k1,k2,k3�b20�U,kd1,kd2,kd3���٦V�U�}�f 
             if    ((k1_240_buffer[1]-d1_240_buffer[1]<=-3 &&  k2_240_buffer[1]-d2_240_buffer[1]<=-3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]<=-3 &&  k1_240_buffer[1]<=20 &&  k2_240_buffer[1]<=20 &&  k3_240_buffer[1]<=20) ||

 //m60 k1,k2,k3�b20�U,kd1,kd2,kd3���٦V�U�}�f 
                    (k1_60_buffer[1]-d1_60_buffer[1]<=-3 &&  k2_60_buffer[1]-d2_60_buffer[1]<=-3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]<=-3 &&  k1_60_buffer[1]<=20 &&  k2_60_buffer[1]<=20 &&  k3_60_buffer[1]<=20) ||
 
 //H1-K1,K2,K3��H4-K1  ���U��
                    (k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 &&
                     k3_60_buffer[1]-k3_60_buffer[2]<=0 && k1_240_buffer[1]-k1_240_buffer[2]<=0))
                     return;
                     else
                     OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-300*Point,Ask+6900*Point,"My order #B8",8808,0,Yellow);
 
 //********** Buy  9  *********************************************************************************************************************************** 

    if ( OrdersTotal()>0 && OrderMagicNumber() == 8809) 
      return;
      else
          
 // m240 k1,k2��k3�W�� ,�B�b30�U
      if   (k1_240_buffer[1]<=30 &&   k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30 &&
          ((k1_240_buffer[1]-k1_240_buffer[2]>=3 &&  (k2_240_buffer[1]-k2_240_buffer[2]>=1 || k3_240_buffer[1]-k3_240_buffer[2]>=1)) ||
           (k1_240_buffer[1]-d1_240_buffer[1]>=6 && k2_240_buffer[1]-d2_240_buffer[1]>=-8 &&  k3_240_buffer[1]-d3_240_buffer[1]>=-8))  &&
             
 //m60��ma05�Pma12�t�Z�b15�I��
            ma05_60_buffer[1]-ma12_60_buffer[1]>=-0.00150 &&

 //m240��ma05�Pma12�t�Z�b35�I��
            ma05_240_buffer[1]-ma12_240_buffer[1]>=-0.00350 &&
 //[1][2]����[3]��[4]���t
            close_240_buffer[1]-open_240_buffer[1]>=0.00040 && close_240_buffer[2]-open_240_buffer[2]>=0 &&
           (close_240_buffer[3]-open_240_buffer[3]<=-0.00040 || close_240_buffer[4]-open_240_buffer[4]<=-0.00040) &&
           
 //ma180��ma360�פW
           (ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00010 || ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00010) &&                      
 
 //[1][2][3]��[2][3][4]�}�Φ��L�bma180�W�U�U12�I��
           ((close_240_buffer[2]-ma180_240_buffer[2]>=-0.00120 || close_240_buffer[2]-ma180_240_buffer[2]<=0.00120) &&
            (close_240_buffer[3]-ma180_240_buffer[3]>=-0.00120 || close_240_buffer[3]-ma180_240_buffer[3]<=0.00120) &&
           ((close_240_buffer[4]-ma180_240_buffer[4]>=-0.00120 || close_240_buffer[4]-ma180_240_buffer[4]<=0.00120) ||
            (close_240_buffer[1]-ma180_240_buffer[1]>=-0.00120 || close_240_buffer[1]-ma180_240_buffer[1]<=0.00120))) ||
          
 //��[1][2][3]��[2][3][4]�}�Φ��L�bma360�W�U�U12�I��
           ((close_240_buffer[2]-ma360_240_buffer[2]>=-0.00120 || close_240_buffer[2]-ma360_240_buffer[2]<=0.00120) &&
            (close_240_buffer[3]-ma360_240_buffer[3]>=-0.00120 || close_240_buffer[3]-ma360_240_buffer[3]<=0.00120) &&
           ((close_240_buffer[4]-ma360_240_buffer[4]>=-0.00120 || close_240_buffer[4]-ma360_240_buffer[4]<=0.00120) ||
            (close_240_buffer[1]-ma360_240_buffer[1]>=-0.00120 || close_240_buffer[1]-ma360_240_buffer[1]<=0.00120))))
            OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-600*Point,Ask+6900*Point,"My order #B9",8809,0,Aqua);

 //********** Buy  10  *********************************************************************************************************************************** 
   //�Φb���ҥH�ư��������      

    if ( OrdersTotal()>0 && OrderMagicNumber() == 8810) 
      return;
      else
 // m15 k1,k2,k3�ҤW�� ,�B�b50,30�U
      if   (k1_15_buffer[1]-k1_15_buffer[2]>=3 &&  k2_15_buffer[1]-k2_15_buffer[2]>=1 && k3_15_buffer[1]-k3_15_buffer[2]>=1 &&
            k1_15_buffer[1]<=50 &&   k2_15_buffer[1]<=30 && k3_15_buffer[1]<=30 &&
             
 // m30 k1,k2��k3�ҤW�� ,�B�b40,30�U
           (k1_30_buffer[1]-k1_30_buffer[2]>=1 &&  (k2_30_buffer[1]-k2_30_buffer[2]>=1 || k3_30_buffer[1]-k3_30_buffer[2]>=1) && 
            k1_30_buffer[1]<=40 && k2_30_buffer[1]<=30 && k3_30_buffer[1]<=30) &&
 
 // m60 k1,k2��k3�ҤW�� ,�B�b40,30�U��[0]���j�T�פW�� 
         (((k1_60_buffer[1]-k1_60_buffer[2]>=1 &&  (k2_60_buffer[1]-k2_60_buffer[2]>=1 || k3_60_buffer[1]-k3_60_buffer[2]>=1)) || 
           (k1_60_buffer[0]-k1_60_buffer[1]>=5 && k1_60_buffer[0]-d1_60_buffer[0]>=2))  &&
            k1_60_buffer[1]<=40 && k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30)) 
 
 //m60,m240 kd�Ȯt����<-10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]<=-10 && k3_60_buffer[1]-d3_60_buffer[2]<=-10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]<=-10 && k3_240_buffer[1]-d3_240_buffer[2]<=-10) ||

 //H1,H4 k2,k3�b���I,��H4 k1,k,k3�b���I
                    (k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
                    (k1_240_buffer[1]>=70 && k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70) ||
 
 //m60 kd2,kd3�Ȯt>16 �Υ[�`>35 
                    (k2_60_buffer[1]-d2_60_buffer[1]<=-16 && k3_60_buffer[1]-d3_60_buffer[2]<=-16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])<=-35) ||
                   
 //H1-K1,K2,K3��H4-K1  ���U��
                    (k1_60_buffer[1]-k1_60_buffer[2]<=0 && k2_60_buffer[1]-k2_60_buffer[2]<=0 &&
                     k3_60_buffer[1]-k3_60_buffer[2]<=0 && k1_240_buffer[1]-k1_240_buffer[2]<=0))
                     return;
                     else      
                     OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-300*Point,Ask+2000*Point,"My order #B10",8810,0,Aqua);
 //********** Buy  11  *********************************************************************************************************************************** 
//����M�W�ۦP��K1[0],KD[0]�y���P  

    if ( OrdersTotal()>0 && OrderMagicNumber() == 8811) 
      return;
      else
 // H4   [1][3]��[1][4]��[1][5]��[1][6]����
      if (((close_240_buffer[1]-open_240_buffer[1]>=0.00050 &&  close_240_buffer[3]-open_240_buffer[3]>=0.00050) ||
           (close_240_buffer[1]-open_240_buffer[1]>=0.00050 &&  close_240_buffer[4]-open_240_buffer[4]>=0.00050) ||
           (close_240_buffer[1]-open_240_buffer[1]>=0.00050 &&  close_240_buffer[5]-open_240_buffer[5]>=0.00050) ||
           (close_240_buffer[1]-open_240_buffer[1]>=0.00050 &&  close_240_buffer[6]-open_240_buffer[6]>=0.00050)) &&
             
 // H4 k1,k2��k3�ҤW��,�BK1�b40�U,[1]�W�v�u���p��12�I
          ((k1_240_buffer[1]-k1_240_buffer[2]>0 &&  (k2_240_buffer[1]-k2_240_buffer[2]>0 || k3_240_buffer[1]-k3_240_buffer[2]>0) && 
            k1_240_buffer[1]<=40 && high_240_buffer[1]-close_240_buffer[1]<=0.00120) || 
    
 // H4 k1�b�C�I�V�W          
           (k1_240_buffer[1]<=20 && k1_240_buffer[1]-k1_240_buffer[2]>=3 )) &&
            
 //ma45��ma90��ma180��׫פW��
           (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00030 || ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00030 ||
            ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00030))      
            OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-300*Point,Ask+6900*Point,"My order #B11",8811,0,Yellow);







    //+++++++++++++++++++++++++++++++++++++++++++   BUY   15   ++++++++++++++++++++++++++++++++++++++++++++++++++          
  
     if ( OrdersTotal()>0 && OrderMagicNumber() == 8815) 
      return;
      else
 
                  //(m15-63)  H4     [2][3]����<20�I     [1]����>=10�I  �d�U�v�u>30�I   
      if     (close_240_buffer[1]-open_240_buffer[1]>=0.00100  && low_240_buffer[1]-open_240_buffer[1]<=-0.00300 &&
              close_240_buffer[2]-open_240_buffer[2]<=-0.00090  && close_240_buffer[3]-open_240_buffer[3]<=-0.00090  &&   
               // ma45 ma90 || ma90  ma180  �פW�B�j
             ((ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00080 &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00020) ||
              (ma90_240_buffer[1]-ma90_240_buffer[2]>=0.00060 &&  ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00020)) &&
                // [1]���L�bma05���W  ���W�L15�I
              close_240_buffer[1]-ma05_240_buffer[1]>=0.00010  && close_240_buffer[1]-ma05_240_buffer[1]<=0.00150) 
               // (m15-66) kd2,kd3[1]-[2]<=-7    k2,k2>=70 
              if    ((k1_240_buffer[1]-d1_240_buffer[1]<=-7 && k2_240_buffer[1]-d2_240_buffer[1]<=-7 && k3_240_buffer[1]-d3_240_buffer[1]<=-7 &&
                      k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70))
                      return;
                      else
                      longbuy15=OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B15",8815,0,FireBrick );
    
  //+++++++++++++++++++++++++++++++++++++++++++   BUY   16   ++++++++++++++++++++++++++++++++++++++++++++++++++          
      if ( OrdersTotal()>0 && OrderMagicNumber() == 8816) 
      return;
      else
            
                   //(m15-65)   h4 �� ma650�פW             ma360�פW�u�u
         if   (ma650_240_buffer[1]-ma650_240_buffer[2]>0 &&
                  //h4 [1]���t�B�bma360���U�����W�L25�I
             ((close_240_buffer[1]-open_240_buffer[1]<=-0.00010 && close_240_buffer[1]-ma360_240_buffer[1]<=-0.00010 &&
               close_240_buffer[1]-ma360_240_buffer[1]>=-0.00250) ||
                 //h4 [1]�����B�bma360���W�����W�L25�I ��[2]�U�v�u�j��25�I
              (close_240_buffer[1]-open_240_buffer[1]>=0.00010 && close_240_buffer[1]-ma360_240_buffer[1]<=-0.00010 &&
               close_240_buffer[1]-ma360_240_buffer[1]>=-0.00250 && low_240_buffer[2]-close_240_buffer[2]<=-0.00250)) &&
                 //k2,k3[1]-[2]>=0    k2,k2<=30  k1[1]-[2]>0 || [1]�U�v�u�j��25�I
               k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
               k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30 &&
              (k1_240_buffer[1]-k1_240_buffer[2]>=0 ||  low_240_buffer[1]-close_240_buffer[1]<=-0.00250) &&  
                  // macd�t��>=-0.00150  <=0.00100 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.001500 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.001000 && 
              // [2]||[3]||[4]||[5]���bma360�W��25�I��  
             ((close_240_buffer[2]-ma360_240_buffer[2]>=0.00010  && close_240_buffer[2]-ma360_240_buffer[2]<=0.00250) ||
              (close_240_buffer[3]-ma360_240_buffer[3]>=0.00010  && close_240_buffer[3]-ma360_240_buffer[3]<=0.00250) ||
              (close_240_buffer[4]-ma360_240_buffer[4]>=0.00010  && close_240_buffer[4]-ma360_240_buffer[4]<=0.00250) ||
              (close_240_buffer[5]-ma360_240_buffer[5]>=0.00010  && close_240_buffer[5]-ma360_240_buffer[5]<=0.00250)))
               OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B16",8816,0,OrangeRed );
 
  //+++++++++++++++++++++++++++++++++++++++++++   BUY   17   ++++++++++++++++++++++++++++++++++++++++++++++++++          
 if ( OrdersTotal()>0 && OrderMagicNumber() == 8817) 
      return;
      else
            
                   //(m15-65)   h4 �� ma650�פW          ma180�פW�u�u
         if   (ma650_240_buffer[1]-ma650_240_buffer[2]>0.00010 &&
                  //h4 [1]���t�B�bma180���U�����W�L25�I
             ((close_240_buffer[1]-open_240_buffer[1]<=-0.00010 && close_240_buffer[1]-ma180_240_buffer[1]<=-0.00010 &&
               close_240_buffer[1]-ma180_240_buffer[1]>=-0.00250) ||
                 //h4 [1]�����B�bma180���W�����W�L25�I ��[2]�U�v�u�j��25�I
              (close_240_buffer[1]-open_240_buffer[1]>=0.00010 && close_240_buffer[1]-ma180_240_buffer[1]<=-0.00010 &&
               close_240_buffer[1]-ma180_240_buffer[1]>=-0.00250 && low_240_buffer[2]-close_240_buffer[2]<=-0.00250)) &&
                 //k2,k3[1]-[2]>=0 ||kd2,kd3>=1   k2,k2<=30  k1[1]-[2]>0 || [1]�U�v�u�j��25�I
             ((k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0) ||
              (k2_240_buffer[1]-d2_240_buffer[2]>=1 && k3_240_buffer[1]-d3_240_buffer[2]>=1)) &&
               k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30 &&
              (k1_240_buffer[1]-k1_240_buffer[2]>=0 ||  low_240_buffer[1]-close_240_buffer[1]<=-0.00250) &&  
                  // macd�t��>=-0.00150  <=0.00100 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.001500 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.001000 && 
              // [2]||[3]||[4]||[5]���bma180�W��25�I��  
             ((close_240_buffer[2]-ma180_240_buffer[2]>=0.00010  && close_240_buffer[2]-ma180_240_buffer[2]<=0.00250) ||
              (close_240_buffer[3]-ma180_240_buffer[3]>=0.00010  && close_240_buffer[3]-ma180_240_buffer[3]<=0.00250) ||
              (close_240_buffer[4]-ma180_240_buffer[4]>=0.00010  && close_240_buffer[4]-ma180_240_buffer[4]<=0.00250) ||
              (close_240_buffer[5]-ma180_240_buffer[5]>=0.00010  && close_240_buffer[5]-ma180_240_buffer[5]<=0.00250)))
               OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B17",8817,0,OrangeRed );

    //+++++++++++++++++++++++++++++++++++++++++++   BUY   18   ++++++++++++++++++++++++++++++++++++++++++++++++++          
 if ( OrdersTotal()>0 && OrderMagicNumber() == 8818) 
      return;
      else
                   
               //(m15-65)  ma45�פW  ma90�����αפW   ma180,ma360,ma650�פU  ���bma45���U�w�[�^���W��[1]�d�U�v�u>25�I�B����                      
      if      (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00020 &&  ma90_240_buffer[1]-ma90_240_buffer[2]>=0 &&       
                 // macd�t��>=-0.00150  <=0.00100 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.001500 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.001000 && 
                   //   k1,k2,k3>=0  k2,k2<=30            
               k1_240_buffer[1]-k1_240_buffer[2]>=0 && k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
               k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30 &&
                 //h4 [1]�����U�v�u�j��25�I
               close_240_buffer[1]-open_240_buffer[1]>=0.00010 &&  low_240_buffer[1]-close_240_buffer[1]<=-0.00250 &&
                  // [1],[2],[3],[4],[5],[6],[7] ���bma45�U��25�I�� ���W5�I�� 
               close_240_buffer[1]-ma45_240_buffer[1]>=-0.00250  && close_240_buffer[1]-ma180_240_buffer[1]<=0.00050 &&
               close_240_buffer[2]-ma45_240_buffer[2]>=-0.00250  && close_240_buffer[2]-ma180_240_buffer[2]<=0.00050 &&
               close_240_buffer[3]-ma45_240_buffer[3]>=-0.00250  && close_240_buffer[3]-ma180_240_buffer[3]<=0.00050 &&
               close_240_buffer[4]-ma45_240_buffer[4]>=-0.00250  && close_240_buffer[4]-ma180_240_buffer[4]<=0.00050 &&
               close_240_buffer[5]-ma45_240_buffer[5]>=-0.00250  && close_240_buffer[5]-ma180_240_buffer[5]<=0.00050 &&
               close_240_buffer[6]-ma45_240_buffer[6]>=-0.00250  && close_240_buffer[6]-ma180_240_buffer[6]<=0.00050)
               OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B18",8818,0,OrangeRed );
 
    //+++++++++++++++++++++++++++++++++++++++++++   BUY   19   ++++++++++++++++++++++++++++++++++++++++++++++++++          
 if ( OrdersTotal()>0 && OrderMagicNumber() == 8819) 
      return;
      else

                //(m15-65) h4  ����@�q�ɶ��^���W�h  ma �ҤU�����e�{�������
       if     (ma05_240_buffer[1]-ma05_240_buffer[10]<=0  &&  ma05_240_buffer[1]-ma05_240_buffer[10]>=-0.00100 &&
               ma45_240_buffer[1]-ma45_240_buffer[10]<=0  &&  ma45_240_buffer[1]-ma45_240_buffer[10]>=-0.00450 &&
               ma90_240_buffer[1]-ma90_240_buffer[10]<=0  &&  ma90_240_buffer[1]-ma90_240_buffer[10]>=-0.00250 &&   
               ma180_240_buffer[1]-ma180_240_buffer[10]<=0  &&  ma180_240_buffer[1]-ma180_240_buffer[10]>=-0.00250 &&
               ma360_240_buffer[1]-ma360_240_buffer[10]<=0  &&  ma360_240_buffer[1]-ma360_240_buffer[10]>=-0.00250 &&
               ma650_240_buffer[1]-ma650_240_buffer[10]<=0  &&  ma650_240_buffer[1]-ma650_240_buffer[10]>=-0.00250 &&
                // [1]~[6] macd�t��>=-0.0050  <=0.0050 
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.000500 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.000500 && 
               macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]>=-0.000500 &&  macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]<=0.000500 && 
               macdmainline_240_buffer[3]-macdsignalline_240_buffer[3]>=-0.000500 &&  macdmainline_240_buffer[3]-macdsignalline_240_buffer[3]<=0.000500 && 
               macdmainline_240_buffer[4]-macdsignalline_240_buffer[4]>=-0.000500 &&  macdmainline_240_buffer[4]-macdsignalline_240_buffer[4]<=0.000500 && 
               macdmainline_240_buffer[5]-macdsignalline_240_buffer[5]>=-0.000500 &&  macdmainline_240_buffer[5]-macdsignalline_240_buffer[5]<=0.000500 && 
               macdmainline_240_buffer[6]-macdsignalline_240_buffer[6]>=-0.000500 &&  macdmainline_240_buffer[6]-macdsignalline_240_buffer[6]<=0.000500)// && 
                     //(m15-66)  k2,k3<=0  kd1<=-18  ma45�פU
               if ((k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
                    ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00010  && 
                       //(m15-67)  k2,k3 ���פW����U�^  exit
                   ((k2_240_buffer[4]-k2_240_buffer[5]>=3 && k3_240_buffer[4]-k3_240_buffer[5]>=3) ||
                    (k2_240_buffer[5]-k2_240_buffer[6]>=3 && k3_240_buffer[5]-k3_240_buffer[6]>=3)) &&
                     k1_240_buffer[1]-d1_240_buffer[1]<=-18) ||
                      //(m15-67) h4 [1]macd �Ȥ���0.00120 �P-0.00120��  �����                                
                   (macdmainline_240_buffer[1]>=-0.001200 && macdmainline_240_buffer[1]<=0.001200 &&
                    macdsignalline_240_buffer[1]>=-0.001200 &&  macdsignalline_240_buffer[1]<=0.001200))
                    OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B19",8819,0,OrangeRed );
 
   //+++++++++++++++++++++++++++++++++++++++++++   BUY   20   ++++++++++++++++++++++++++++++++++++++++++++++++++          
 if ( OrdersTotal()>0 && OrderMagicNumber() == 8820) 
      return;
      else
      
         //(m15-66)  ma650�פW [1]>=0.0050   ma90 ���W ma45�bma650���U50�I,�B�פW���j    ma90�bma45���U50�I 
        if     (ma650_240_buffer[1]-ma650_240_buffer[2]>=0.00020  && close_240_buffer[1]-open_240_buffer[1]>=0.00500 &&
                ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00070  && ma90_240_buffer[1]-ma90_240_buffer[1]>=0.00020  &&
                ma45_240_buffer[1]-ma650_240_buffer[2]<=-0.00500  && ma90_240_buffer[1]-ma45_240_buffer[1]<=-0.00500 && 
                    //   kd1,kd2,kd3>=4  k2,k3<=35            
                k1_240_buffer[1]-d1_240_buffer[1]>=4 && k2_240_buffer[1]-d2_240_buffer[1]>=4 && k3_240_buffer[1]-d3_240_buffer[1]>=4 &&
                k2_240_buffer[1]<=35 && k3_240_buffer[1]<=35)
                OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B20",8820,0,OrangeRed );

  //+++++++++++++++++++++++++++++++++++++++++++   BUY   21   ++++++++++++++++++++++++++++++++++++++++++++++++++          
 if ( OrdersTotal()>0 && OrderMagicNumber() == 8821) 
      return;
      else
             
                  //(m15-66)   h4 �� ma180,ma360,ma650 �פW ��ma180���� ma360 �פW   
        if   ((ma180_240_buffer[1]-ma180_240_buffer[2]>=-0.00010 && ma360_240_buffer[1]-ma360_240_buffer[2]>=-0.00010 &&
               ma650_240_buffer[1]-ma650_240_buffer[2]>=-0.00010 &&
                  //  macd>=0.00110  <=-0.00110   main && signal >=0.00015   
               macdmainline_240_buffer[1]-macdmainline_240_buffer[2]>=0.000150 && 
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]>=0.000150 &&
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.001100 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.001100 &&
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
              (ma180_240_buffer[1]-ma180_240_buffer[2]>=-0.00010 && ma360_240_buffer[1]-ma360_240_buffer[2]>=-0.00010 &&
               ma650_240_buffer[1]-ma650_240_buffer[2]>=-0.00010 &&
                  //  macd>=0.00110  <=-0.00110   main && signal >=0.00015   
               macdmainline_240_buffer[1]-macdmainline_240_buffer[2]>=0.000150 && 
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]>=0.000150 &&
               macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.001100 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.001100 &&
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
              (ma360_240_buffer[1]-ma360_240_buffer[2]>=0.00010 && ma650_240_buffer[1]-ma650_240_buffer[2]>=0.00010 &&
              (ma05_240_buffer[1]-ma05_240_buffer[2]>=-0.00010 || ma08_240_buffer[1]-ma08_240_buffer[2]>=-0.00010 ||
               ma12_240_buffer[1]-ma12_240_buffer[2]>=-0.00010) &&
                  //ma45,ma90�w�����  [1]-[6]>=-0.0003
               ma45_240_buffer[1]-ma45_240_buffer[6]>=-0.00030 && ma90_240_buffer[1]-ma90_240_buffer[6]>=-0.00030 &&
                // [1]�U�v�j��30�I          [2],[3]���t  
              (close_240_buffer[1]-open_240_buffer[1]>=0.00010  && low_240_buffer[1]-open_240_buffer[1]<=-0.00300)  ||
               close_240_buffer[1]-open_240_buffer[1]<=-0.00010  && low_240_buffer[1]-close_240_buffer[1]<=-0.00300)  &&
              (close_240_buffer[2]-open_240_buffer[2]<=-0.00010 || close_240_buffer[3]-open_240_buffer[3]<=-0.00010)  && 
                   //   [5]||[6]||[7]||[8]���}�L���b[1]���U   �U�W����U�^�d�U�v�u         
              (open_240_buffer[5]-open_240_buffer[1]<=0 || open_240_buffer[6]-open_240_buffer[1]<=0 ||
               open_240_buffer[7]-open_240_buffer[1]<=0 || open_240_buffer[8]-open_240_buffer[1]<=0 ||
               open_240_buffer[9]-open_240_buffer[1]<=0 || open_240_buffer[10]-open_240_buffer[1]<=0) &&                 //kd2,kd3>=7     
               k2_240_buffer[1]-d2_240_buffer[1]>=3 &&  k3_240_buffer[1]-d3_240_buffer[1]>=3)
               OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B21",8821,0,OrangeRed );

  //+++++++++++++++++++++++++++++++++++++++++++   BUY   22   ++++++++++++++++++++++++++++++++++++++++++++++++++          
 if ( OrdersTotal()>0 && OrderMagicNumber() == 8822) 
      return;
      else

                //�^�Ầ��ma180��A�U�^��ma45�ᤣ�^�F
                //(m15-67)   h4 �� ma45�פW ma90���� ma180 �פU  �W��U�ƦC  ma180,ma90,ma45   
        if    (ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00020 && ma90_240_buffer[1]-ma90_240_buffer[2]>=-0.00010 &&
               ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00010 && ma45_240_buffer[1]-ma90_240_buffer[1]<=-0.00100 &&
               ma90_240_buffer[1]-ma180_240_buffer[1]<=-0.00100 &&
                     //   kd1,(kd2||kd3)>=3  k1,k2,k3<=25             
               k1_240_buffer[1]-d1_240_buffer[1]>=3 && (k2_240_buffer[1]-d2_240_buffer[1]>=3 || k3_240_buffer[1]-d3_240_buffer[1]>=3) &&
               k2_240_buffer[1]<=25 && k3_240_buffer[1]<=25 &&
               //ma05 [1]-[2]>=0 
               ma05_240_buffer[1]-ma05_240_buffer[2]>=0 &&
                   // [1]�U�v�j��22�I          [2]||[3]���t  
             ((close_240_buffer[1]-open_240_buffer[1]>=0.00010  && low_240_buffer[1]-open_240_buffer[1]<=-0.00220)  ||
              (close_240_buffer[1]-open_240_buffer[1]<=-0.00010  && low_240_buffer[1]-close_240_buffer[1]<=-0.00220))  &&
              (close_240_buffer[2]-open_240_buffer[2]<=-0.00010 || close_240_buffer[3]-open_240_buffer[3]<=-0.00010)   && 
            
                // ([2]||[3]||[4]||[5]) && ([6]||[7]||[8]||[9])  close[1]-ma45<=0.0005 >=-0.0005  ���bma45����
             ((close_240_buffer[2]-ma45_240_buffer[2]<=0.00050 && close_240_buffer[2]-ma45_240_buffer[2]>=-0.00050) || 
              (close_240_buffer[3]-ma45_240_buffer[3]<=0.00050 && close_240_buffer[3]-ma45_240_buffer[3]>=-0.00050) || 
              (close_240_buffer[4]-ma45_240_buffer[4]<=0.00050 && close_240_buffer[4]-ma45_240_buffer[4]>=-0.00050) || 
              (close_240_buffer[5]-ma45_240_buffer[5]<=0.00050 && close_240_buffer[5]-ma45_240_buffer[5]>=-0.00050)) && 
             ((close_240_buffer[6]-ma45_240_buffer[6]<=0.00050 && close_240_buffer[6]-ma45_240_buffer[6]>=-0.00050) || 
              (close_240_buffer[7]-ma45_240_buffer[7]<=0.00050 && close_240_buffer[7]-ma45_240_buffer[7]>=-0.00050) || 
              (close_240_buffer[8]-ma45_240_buffer[8]<=0.00050 && close_240_buffer[8]-ma45_240_buffer[8]>=-0.00050) || 
              (close_240_buffer[9]-ma45_240_buffer[9]<=0.00050 && close_240_buffer[9]-ma45_240_buffer[9]>=-0.00050))) 
               OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B22",8822,0,OrangeRed );
       
  //+++++++++++++++++++++++++++++++++++++++++++   BUY   23   ++++++++++++++++++++++++++++++++++++++++++++++++++          
 if ( OrdersTotal()>0 && OrderMagicNumber() == 8823) 
      return;
      else

                //����^��ma180�W�U�d�U�v�u
                //(m15-67)   h4 �� ma90,ma180,ma360,ma650 ���פW     �W��U�ƦC  ma90,ma180,ma360,ma650   
        if    (ma90_240_buffer[1]-ma90_240_buffer[2]>0 && ma180_240_buffer[1]-ma180_240_buffer[2]>=0 &&
               ma360_240_buffer[1]-ma360_240_buffer[2]>0 && ma650_240_buffer[1]-ma650_240_buffer[2]>0.00010 &&
               ma90_240_buffer[1]-ma180_240_buffer[1]>=-0.00100 && ma90_240_buffer[1]-ma180_240_buffer[1]<=0.00100 && 
                  //ma45 �}�f�L�W
              (ma90_240_buffer[1]-ma45_240_buffer[1])-(ma90_240_buffer[2]-ma45_240_buffer[2])>0 && 
                   //macd   signal  [1]<[2] [1]>[3] 
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]<=-0.000010 &&
               macdsignalline_240_buffer[1]-macdsignalline_240_buffer[3]>=0.000010 &&

                     // [1]�U�v�j��35�I          [2]||[3]���t  
             ((close_240_buffer[1]-open_240_buffer[1]>=0.00010  && low_240_buffer[1]-open_240_buffer[1]<=-0.00350)  ||
              (close_240_buffer[1]-open_240_buffer[1]<=-0.00010  && low_240_buffer[1]-close_240_buffer[1]<=-0.00350))  &&
              (close_240_buffer[2]-open_240_buffer[2]<=-0.00010 || close_240_buffer[3]-open_240_buffer[3]<=-0.00010)) 
               OrderSend(Symbol(),OP_BUY,lots,Ask,1,Ask-78*Point,Ask+2000*Point,"My order #B23",8823,0,Red );





//***************************************************************************************************************************************
//SELL
//***************************************************************************************************************************************
 //********** Sell  1  *********************************************************************************************************************************** 
    
    if  ( OrdersTotal()>0 && OrderMagicNumber()==4401) 
       return;
       else
 // m15 k1,k2,k3�ҤU��,�B�b50�W,[1]���� [2]���� SELL
      if  ((k1_15_buffer[1]-k1_15_buffer[2]<=-3 &&  k2_15_buffer[1]-k2_15_buffer[2]<=-1 && k3_15_buffer[1]-k3_15_buffer[2]<=0 &&
            k1_15_buffer[1]>=50 &&   k2_15_buffer[1]>=50 && k3_15_buffer[1]>=50)) 
          if  (k1_05_buffer[1]-d1_05_buffer[1]<=-3 &&   k1_05_buffer[1]>=50)                               
          
 //H1,H4 kd�Ȯt����>10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]>=10 && k3_60_buffer[1]-d3_60_buffer[2]>=10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]>=10 && k3_240_buffer[1]-d3_240_buffer[2]>=10) ||
 
 //H1,H4 k2,k3�b�C�I,��H4 k1,k,k3�b�C�I
                    (k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
                    (k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
 
 //H4 ma05 �W��,macd�b1150�~,���L��ma05�y���Z����kd1,kd2,kd3���}�f�B�V�W
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]>=7 && k2_240_buffer[1]-d2_240_buffer[1]>=7 && k3_240_buffer[1]-d3_240_buffer[2]>=7 &&
                     k2_240_buffer[1]<=35 && k3_240_buffer[1]<=35))) || 
 
 //H4 ma05 �W��,���L��ma05�y���Z��,k1,k2,k3�V�W
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]>=1 && k2_240_buffer[1]-k2_240_buffer[2]>=1 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                     k1_240_buffer[1]<=70) || 

 //H4 ma05 �W��,���L��ma05�y���Z��,kd1�V�W,k2��k3 �V�W
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=6 && (k2_240_buffer[1]-k2_240_buffer[2]>=1 || k3_240_buffer[1]-k3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=70) || 
                                     
 //H4 ma05 �U���ͽw ([1]-[2])-([2]-[3])>=0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])>=0.00030) ||

//H1,H4 kd1,2,3�Ȯt����>1
                    (k1_60_buffer[1]-d1_60_buffer[1]>=1 && k2_60_buffer[1]-d2_60_buffer[1]>=1 && k3_60_buffer[1]-d3_60_buffer[2]>=1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=1 && (k2_240_buffer[1]-d2_240_buffer[1]>=1 || k3_240_buffer[1]-d3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=60) ||
       
 //H1 kd2,kd3�Ȯt>16 �Υ[�`>35
                    (k2_60_buffer[1]-d2_60_buffer[1]>=16 && k3_60_buffer[1]-d3_60_buffer[2]>=16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])>=35) ||
       
 //H4 ���ק�� k1�b35�U
                    (k1_240_buffer[1]-k1_240_buffer[2]>=4 &&  k1_240_buffer[2]-k1_240_buffer[3]<=-4 && k1_240_buffer[1]<=35) ||

 //H4 k1,k2,k3�b80�W,kd1,kd2,kd3���٦V�W�}�f 
                    (k1_240_buffer[1]-d1_240_buffer[1]>=3 &&  k2_240_buffer[1]-d2_240_buffer[1]>=3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]>=3 &&  k1_240_buffer[1]>=80 &&  k2_240_buffer[1]>=80 &&  k3_240_buffer[1]>=80) ||
 
 //m60 k1,k2,k3�b80�W,kd1,kd2,kd3���٦V�W�}�f 
                    (k1_60_buffer[1]-d1_60_buffer[1]>=3 &&  k2_60_buffer[1]-d2_60_buffer[1]>=3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]>=3 &&  k1_60_buffer[1]>=80 &&  k2_60_buffer[1]>=80 &&  k3_60_buffer[1]>=80) ||
          
 //H4 ma05[1],ma12[1]�t�Z�j��28�I ,�}�f���j([1]-[2])>=10�I([2]-[3])>=8�I
                    (ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])>=0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])>=0.00050)) ||      
               
 //H4 k1�e��������k2,k3���j�T���W ��macd�}�f�|�j               
                   (k1_240_buffer[1]-k1_240_buffer[2]<=3 && k1_240_buffer[1]-k1_240_buffer[2]>=-3 &&
                  ((k2_240_buffer[1]-k2_240_buffer[2]>=6 && k3_240_buffer[1]-k3_240_buffer[2]>=6) || 
                   (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001300))) ||
              
 //H1-K1,K2,K3��H4-K1  ���W��
                   (k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 &&
                    k3_60_buffer[1]-k3_60_buffer[2]>=0 && k1_240_buffer[1]-k1_240_buffer[2]>=0) ||

 //H4  k1�j�T�V�W [1]��[2]�����@����
                 (((k1_240_buffer[1]-k1_240_buffer[2])-(k1_240_buffer[2]-k1_240_buffer[3])>=3) && (close_240_buffer[1]-open_240_buffer[1]>=0.00030 || close_240_buffer[2]-open_240_buffer[2]>=0.00030)) ||
                   (k1_240_buffer[1]-k1_240_buffer[2]>=12 && (close_240_buffer[1]-open_240_buffer[1]>=0.00030 || close_240_buffer[2]-open_240_buffer[2]>=0.00030)))
                    return;
                    else
                    OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+300*Point,Bid-6900*Point,"My order #S1",4401,0,Blue);

 //********** Sell  2  *********************************************************************************************************************************** 
    if  ( OrdersTotal()>0 && OrderMagicNumber()==4402) 
       return;
       else
          
 //    m5 k1,k2,k3�ҤU��,�B�b50�W,[1]���� [2]���� SELL
      if  ((k1_30_buffer[1]-k1_30_buffer[2]<=-3 &&  k2_30_buffer[1]-k2_30_buffer[2]<=-1 && k3_30_buffer[1]-k3_30_buffer[2]<=0 &&
            k1_30_buffer[1]>=70 &&   k2_30_buffer[1]>=75 && k3_30_buffer[1]>=75)||
           (k1_60_buffer[1]-k1_60_buffer[2]<=-3 &&  k2_60_buffer[1]-k2_60_buffer[2]<=-1 && k3_60_buffer[1]-k3_60_buffer[2]<=0 &&
            k1_60_buffer[1]>=70 &&   k2_60_buffer[1]>=75 && k3_60_buffer[1]>=75)) 
          if  (k1_05_buffer[1]-d1_05_buffer[1]<=-3 &&   k1_05_buffer[1]>=50)                               
     
   
 //H1,H4 kd�Ȯt����>10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]>=10 && k3_60_buffer[1]-d3_60_buffer[2]>=10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]>=10 && k3_240_buffer[1]-d3_240_buffer[2]>=10) ||
 
 //H1,H4 k2,k3�b�C�I,��H4 k1,k,k3�b�C�I
                    (k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
                    (k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
 
 //H4 ma05 �W��,macd�b1150�~,���L��ma05�y���Z����kd1,kd2,kd3���}�f�B�V�W
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]>=7 && k2_240_buffer[1]-d2_240_buffer[1]>=7 && k3_240_buffer[1]-d3_240_buffer[2]>=7 &&
                     k2_240_buffer[1]<=35 && k3_240_buffer[1]<=35))) || 
 
 //H4 ma05 �W��,���L��ma05�y���Z��,k1,k2,k3�V�W
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]>=1 && k2_240_buffer[1]-k2_240_buffer[2]>=1 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                     k1_240_buffer[1]<=70) || 

 //H4 ma05 �W��,���L��ma05�y���Z��,kd1�V�W,k2��k3 �V�W
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=6 && (k2_240_buffer[1]-k2_240_buffer[2]>=1 || k3_240_buffer[1]-k3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=70) || 
                                     
 //H4 ma05 �U���ͽw ([1]-[2])-([2]-[3])>=0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])>=0.00030) ||

 //H1,H4 kd1,2,3�Ȯt����>1
                    (k1_60_buffer[1]-d1_60_buffer[1]>=1 && k2_60_buffer[1]-d2_60_buffer[1]>=1 && k3_60_buffer[1]-d3_60_buffer[2]>=1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=1 && (k2_240_buffer[1]-d2_240_buffer[1]>=1 || k3_240_buffer[1]-d3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=60) ||
       
 //H1 kd2,kd3�Ȯt>16 �Υ[�`>35
                    (k2_60_buffer[1]-d2_60_buffer[1]>=16 && k3_60_buffer[1]-d3_60_buffer[2]>=16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])>=35) ||
       
 //H4 ���ק�� k1�b35�U
                    (k1_240_buffer[1]-k1_240_buffer[2]>=4 &&  k1_240_buffer[2]-k1_240_buffer[3]<=-4 && k1_240_buffer[1]<=35) ||
          
 //H4 k1,k2,k3�b80�W,kd1,kd2,kd3���٦V�W�}�f 
                    (k1_240_buffer[1]-d1_240_buffer[1]>=3 &&  k2_240_buffer[1]-d2_240_buffer[1]>=3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]>=3 &&  k1_240_buffer[1]>=80 &&  k2_240_buffer[1]>=80 &&  k3_240_buffer[1]>=80) ||
 
 //m60 k1,k2,k3�b80�W,kd1,kd2,kd3���٦V�W�}�f 
                    (k1_60_buffer[1]-d1_60_buffer[1]>=3 &&  k2_60_buffer[1]-d2_60_buffer[1]>=3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]>=3 &&  k1_60_buffer[1]>=80 &&  k2_60_buffer[1]>=80 &&  k3_60_buffer[1]>=80) ||

 //H4 ma05[1],ma12[1]�t�Z�j��28�I ,�}�f���j([1]-[2])>=10�I([2]-[3])>=8�I
                    (ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])>=0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])>=0.00050)) ||      
               
 //H4 k1�e��������k2,k3���j�T���W ��macd�}�f�|�j               
                   (k1_240_buffer[1]-k1_240_buffer[2]<=3 && k1_240_buffer[1]-k1_240_buffer[2]>=-3 &&
                  ((k2_240_buffer[1]-k2_240_buffer[2]>=6 && k3_240_buffer[1]-k3_240_buffer[2]>=6) || 
                   (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001300))) ||
              
 //H1-K1,K2,K3��H4-K1  ���W��
                   (k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 &&
                    k3_60_buffer[1]-k3_60_buffer[2]>=0 && k1_240_buffer[1]-k1_240_buffer[2]>=0) ||

 //H4  k1�j�T�V�W [1]��[2]�����@����
                 (((k1_240_buffer[1]-k1_240_buffer[2])-(k1_240_buffer[2]-k1_240_buffer[3])>=3) && (close_240_buffer[1]-open_240_buffer[1]>=0.00030 || close_240_buffer[2]-open_240_buffer[2]>=0.00030)) ||
                   (k1_240_buffer[1]-k1_240_buffer[2]>=12 && (close_240_buffer[1]-open_240_buffer[1]>=0.00030 || close_240_buffer[2]-open_240_buffer[2]>=0.00030)))
                    return;
                    else
                    OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+300*Point,Bid-6900*Point,"My order #S2",4402,0,Green);

 //********** Sell  3  *********************************************************************************************************************************** 

//�Φb���ҥH�ư��������      
 
    if ( OrdersTotal()>0 && OrderMagicNumber() == 4403 ) 
      return;
      else

      if  ((k1_15_buffer[1]-k1_15_buffer[2]<=-6 &&  k1_15_buffer[1]>=75 &&
 // m240���b70�W
            k1_15_buffer[1]-d1_15_buffer[1]<=-4 &&  k1_240_buffer[1]>=70 &&
            close_15_buffer[1]-close_15_buffer[2]<=-0.00010))

 //H1,H4 kd�Ȯt����>10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]>=10 && k3_60_buffer[1]-d3_60_buffer[2]>=10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]>=10 && k3_240_buffer[1]-d3_240_buffer[2]>=10) ||
 
 //H1,H4 k2,k3�b�C�I,��H4 k1,k,k3�b�C�I
                    (k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
                    (k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
 
 //H4 ma05 �W��,macd�b1150�~,���L��ma05�y���Z����kd1,kd2,kd3���}�f�B�V�W
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]>=7 && k2_240_buffer[1]-d2_240_buffer[1]>=7 && k3_240_buffer[1]-d3_240_buffer[2]>=7 &&
                     k2_240_buffer[1]<=35 && k3_240_buffer[1]<=35))) || 
 
 //H4 ma05 �W��,���L��ma05�y���Z��,k1,k2,k3�V�W
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]>=1 && k2_240_buffer[1]-k2_240_buffer[2]>=1 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                     k1_240_buffer[1]<=70) || 

 //H4 ma05 �W��,���L��ma05�y���Z��,kd1�V�W,k2��k3 �V�W
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=6 && (k2_240_buffer[1]-k2_240_buffer[2]>=1 || k3_240_buffer[1]-k3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=70) || 
                                     
 //H4 ma05 �U���ͽw ([1]-[2])-([2]-[3])>=0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])>=0.00030) ||

 //H1,H4 kd1,2,3�Ȯt����>1
                    (k1_60_buffer[1]-d1_60_buffer[1]>=1 && k2_60_buffer[1]-d2_60_buffer[1]>=1 && k3_60_buffer[1]-d3_60_buffer[2]>=1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=1 && (k2_240_buffer[1]-d2_240_buffer[1]>=1 || k3_240_buffer[1]-d3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=60) ||
       
 //H1 kd2,kd3�Ȯt>16 �Υ[�`>35
                    (k2_60_buffer[1]-d2_60_buffer[1]>=16 && k3_60_buffer[1]-d3_60_buffer[2]>=16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])>=35) ||
       
 //H4 ���ק�� k1�b35�U
                    (k1_240_buffer[1]-k1_240_buffer[2]>=4 &&  k1_240_buffer[2]-k1_240_buffer[3]<=-4 && k1_240_buffer[1]<=35) ||
          
 //H4 k1,k2,k3�b80�W,kd1,kd2,kd3���٦V�W�}�f 
                    (k1_240_buffer[1]-d1_240_buffer[1]>=3 &&  k2_240_buffer[1]-d2_240_buffer[1]>=3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]>=3 &&  k1_240_buffer[1]>=80 &&  k2_240_buffer[1]>=80 &&  k3_240_buffer[1]>=80) ||
 
 //m60 k1,k2,k3�b80�W,kd1,kd2,kd3���٦V�W�}�f 
                    (k1_60_buffer[1]-d1_60_buffer[1]>=3 &&  k2_60_buffer[1]-d2_60_buffer[1]>=3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]>=3 &&  k1_60_buffer[1]>=80 &&  k2_60_buffer[1]>=80 &&  k3_60_buffer[1]>=80) ||

 //H4 ma05[1],ma12[1]�t�Z�j��28�I ,�}�f���j([1]-[2])>=10�I([2]-[3])>=8�I
                    (ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])>=0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])>=0.00050)) ||      
               
 //H4 k1�e��������k2,k3���j�T���W ��macd�}�f�|�j               
                   (k1_240_buffer[1]-k1_240_buffer[2]<=3 && k1_240_buffer[1]-k1_240_buffer[2]>=-3 &&
                  ((k2_240_buffer[1]-k2_240_buffer[2]>=6 && k3_240_buffer[1]-k3_240_buffer[2]>=6) || 
                   (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001300))) ||
              
 //H1-K1,K2,K3��H4-K1  ���W��
                   (k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 &&
                    k3_60_buffer[1]-k3_60_buffer[2]>=0 && k1_240_buffer[1]-k1_240_buffer[2]>=0) ||

 //H4  k1�j�T�V�W [1]��[2]�����@����
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

 //H1,H4 kd�Ȯt����>10
              if   ((k2_60_buffer[1]-d2_60_buffer[1]>=10 && k3_60_buffer[1]-d3_60_buffer[2]>=10 &&
                     k2_240_buffer[1]-d2_240_buffer[1]>=10 && k3_240_buffer[1]-d3_240_buffer[2]>=10) ||
 
 //H1,H4 k2,k3�b�C�I,��H4 k1,k,k3�b�C�I
                    (k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
                    (k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
 
 //H4 ma05 �W��,macd�b1150�~,���L��ma05�y���Z����kd1,kd2,kd3���}�f�B�V�W
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                   ((macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001550) ||
                    (k1_240_buffer[1]-d1_240_buffer[1]>=7 && k2_240_buffer[1]-d2_240_buffer[1]>=7 && k3_240_buffer[1]-d3_240_buffer[2]>=7 &&
                     k2_240_buffer[1]<=35 && k3_240_buffer[1]<=35))) || 
 
 //H4 ma05 �W��,���L��ma05�y���Z��,k1,k2,k3�V�W
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-k1_240_buffer[2]>=1 && k2_240_buffer[1]-k2_240_buffer[2]>=1 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                     k1_240_buffer[1]<=70) || 

 //H4 ma05 �W��,���L��ma05�y���Z��,kd1�V�W,k2��k3 �V�W
                    (ma05_240_buffer[1]-ma05_240_buffer[2]>=0.00060 && close_240_buffer[1]-ma05_240_buffer[1]>=0.00060 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=6 && (k2_240_buffer[1]-k2_240_buffer[2]>=1 || k3_240_buffer[1]-k3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=70) || 
                                     
 //H4 ma05 �U���ͽw ([1]-[2])-([2]-[3])>=0.00030
                   ((ma05_240_buffer[1]-ma05_240_buffer[2])-(ma05_240_buffer[2]-ma05_240_buffer[3])>=0.00030) ||

 //H1,H4 kd1,2,3�Ȯt����>1
                    (k1_60_buffer[1]-d1_60_buffer[1]>=1 && k2_60_buffer[1]-d2_60_buffer[1]>=1 && k3_60_buffer[1]-d3_60_buffer[2]>=1 &&
                     k1_240_buffer[1]-d1_240_buffer[1]>=1 && (k2_240_buffer[1]-d2_240_buffer[1]>=1 || k3_240_buffer[1]-d3_240_buffer[2]>=1) &&
                     k1_240_buffer[1]<=60) ||
       
 //H1 kd2,kd3�Ȯt>16 �Υ[�`>35
                    (k2_60_buffer[1]-d2_60_buffer[1]>=16 && k3_60_buffer[1]-d3_60_buffer[2]>=16) ||
                   ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])>=35) ||
       
 //H4 ���ק�� k1�b35�U
                    (k1_240_buffer[1]-k1_240_buffer[2]>=4 &&  k1_240_buffer[2]-k1_240_buffer[3]<=-4 && k1_240_buffer[1]<=35) ||
          
 //H4 k1,k2,k3�b80�W,kd1,kd2,kd3���٦V�W�}�f 
                    (k1_240_buffer[1]-d1_240_buffer[1]>=3 &&  k2_240_buffer[1]-d2_240_buffer[1]>=3 && 
                     k3_240_buffer[1]-d3_240_buffer[1]>=3 &&  k1_240_buffer[1]>=80 &&  k2_240_buffer[1]>=80 &&  k3_240_buffer[1]>=80) ||

 //m60 k1,k2,k3�b80�W,kd1,kd2,kd3���٦V�W�}�f 
                    (k1_60_buffer[1]-d1_60_buffer[1]>=3 &&  k2_60_buffer[1]-d2_60_buffer[1]>=3 && 
                     k3_60_buffer[1]-d3_60_buffer[1]>=3 &&  k1_60_buffer[1]>=80 &&  k2_60_buffer[1]>=80 &&  k3_60_buffer[1]>=80) ||

 //H4 ma05[1],ma12[1]�t�Z�j��28�I ,�}�f���j([1]-[2])>=10�I([2]-[3])>=8�I
                    (ma05_240_buffer[1]-ma12_240_buffer[1]>=0.00280 &&
                   ((ma05_240_buffer[1]-ma12_240_buffer[1])-(ma05_240_buffer[2]-ma12_240_buffer[2])>=0.00100) &&      
                   ((ma05_240_buffer[2]-ma12_240_buffer[2])-(ma05_240_buffer[3]-ma12_240_buffer[3])>=0.00050)) ||      
               
 //H4 k1�e��������k2,k3���j�T���W ��macd�}�f�|�j               
                   (k1_240_buffer[1]-k1_240_buffer[2]<=3 && k1_240_buffer[1]-k1_240_buffer[2]>=-3 &&
                  ((k2_240_buffer[1]-k2_240_buffer[2]>=6 && k3_240_buffer[1]-k3_240_buffer[2]>=6) || 
                   (macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=0.001300))) ||
              
 //H1-K1,K2,K3��H4-K1  ���W��
                   (k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 &&
                    k3_60_buffer[1]-k3_60_buffer[2]>=0 && k1_240_buffer[1]-k1_240_buffer[2]>=0) ||
 
 //H4  k1�j�T�V�W [1]��[2]�����@����
                 (((k1_240_buffer[1]-k1_240_buffer[2])-(k1_240_buffer[2]-k1_240_buffer[3])>=3) && (close_240_buffer[1]-open_240_buffer[1]>=0.00030 || close_240_buffer[2]-open_240_buffer[2]>=0.00030)) ||
                   (k1_240_buffer[1]-k1_240_buffer[2]>=12 && (close_240_buffer[1]-open_240_buffer[1]>=0.00030 || close_240_buffer[2]-open_240_buffer[2]>=0.00030)))
                    return;
                    else
                    OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+300*Point,Bid-6900*Point,"My order #S4",4404,0,Green);
               
 //********** Sell  5  *********************************************************************************************************************************** 

    if ( OrdersTotal()>0 && OrderMagicNumber() == 4405) 
      return;
      else

 //[1]��[2]�����W�v�L20�I
      if((((close_60_buffer[1]-open_60_buffer[1]>=0.00010 && high_60_buffer[1]-close_60_buffer[1]>=0.00200) || 
           (close_60_buffer[2]-open_60_buffer[2]>=0.00010 && high_60_buffer[2]-close_60_buffer[2]>=0.00200))  ||
 
 //��[1]��[2]���t�W�v�L20�I
          ((close_60_buffer[1]-open_60_buffer[1]<=-0.00010 && high_60_buffer[1]-open_60_buffer[1]>=0.00200) || 
           (close_60_buffer[2]-open_60_buffer[2]<=-0.00010 && high_60_buffer[2]-open_60_buffer[2]>=0.00200))) && 
 
 //[2]��[3]��[4]�����@���t
           (close_60_buffer[2]-open_60_buffer[2]<=-0.00030 || close_60_buffer[3]-open_60_buffer[3]<=-0.00030 ||  close_60_buffer[4]-open_60_buffer[4]<=-0.00030) &&         
 
 //ma12,ma05���Z���L20�I,K1,K2,K3,�b50�W�B�U��            
            ma05_60_buffer[1]-ma12_60_buffer[1]<=0.00200 &&
            k1_60_buffer[1]>=50 &&   k2_60_buffer[1]>=50 && k3_60_buffer[1]>=50 &&
            k1_60_buffer[1]-k1_60_buffer[2]<=-1 &&  k2_60_buffer[1]-k2_60_buffer[2]<=-1  &&  k3_60_buffer[1]-k3_60_buffer[2]<=-1)
            OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+300*Point,Bid-6900*Point,"My order #S5",4405,0,Green);
               
 //********** Sell  6  *********************************************************************************************************************************** 

  //  if ( OrdersTotal()>0 && OrderMagicNumber() == 4406) 
 //     return;
 //     else
 //H4 [1],[2],[3],���L�t�b20 �I��[1]���t
 
 //ma45��ma90��ma180��׫פU��
//     if   ((ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00030 || ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00030 ||
 //           ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00030) &&
          
 //[1][2][3]���L���b[4]�W�U30�I��                 
 
 
 
   //         OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+300*Point,Bid-6900*Point,"My order #S6",4406,0,Blue);
 
 //********** Sell  7  *********************************************************************************************************************************** 

    if ( OrdersTotal()>0 && OrderMagicNumber() == 4407) 
      return;
      else
 //ma90��ma190��m240�e�U�� ([1]-[2])-([2]-[3])<=-0.00010
      if((((ma90_240_buffer[1]-ma90_240_buffer[2]) - (ma90_240_buffer[2]-ma90_240_buffer[3])<=-0.00010) ||
          ((ma180_240_buffer[1]-ma180_240_buffer[2]) - (ma180_240_buffer[2]-ma180_240_buffer[3])<=-0.00010) ||
          ((ma360_240_buffer[1]-ma360_240_buffer[2]) - (ma360_240_buffer[2]-ma360_240_buffer[3])<=-0.00010)) &&
 
 //K1,k2,k3 �b���I kd1��e�U            
            k1_240_buffer[1]>=70  &&  k2_240_buffer[1]>=75 && k3_240_buffer[1]>=75 &&

 //m60��ma05�Pma12�t�Z�b15�I��
            ma05_60_buffer[1]-ma12_60_buffer[1]<=0.00150 &&

 //m240��ma05�Pma12�t�Z�b35�I��
            ma05_240_buffer[1]-ma12_240_buffer[1]<=0.00350 &&

 //m240��ma05�Pma12�t�Z�b40�I��
            ma05_240_buffer[1]-ma12_240_buffer[1]<=0.00400 && 
           (k1_240_buffer[1]-d1_240_buffer[1]<=-2 || k1_240_buffer[1]-k1_240_buffer[2]<=-4))
            OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+600*Point,Bid-6900*Point,"My order #S7",4407,0,Green);

 //********** Sell  8  *********************************************************************************************************************************** 

    if ( OrdersTotal()>0 && OrderMagicNumber() == 4408) 
      return;
      else
          
 // m15 k1,k2,k3�ҤU��,�B�b50,70�W
      if   (k1_15_buffer[1]-k1_15_buffer[2]<=-3 &&  k2_15_buffer[1]-k2_15_buffer[2]<=-1 && k3_15_buffer[1]-k3_15_buffer[2]<=-1 &&
            k1_15_buffer[1]>=50 &&   k2_15_buffer[1]>=70 && k3_15_buffer[1]>=70 &&
             
 //m30,m60,m240�����b70�W�B�}�l�U��
            k1_30_buffer[0]-k1_30_buffer[1]<=1 && k1_30_buffer[1]>=70 &&
            k1_60_buffer[0]-k1_60_buffer[1]<=1 && k1_60_buffer[1]>=70 &&
 
 //m60��ma05�Pma12�t�Z�b15�I��
            ma05_60_buffer[1]-ma12_60_buffer[1]<=0.00150 &&
            k1_240_buffer[0]-k1_240_buffer[1]<=2 && k1_240_buffer[1]>=70 &&
 
 //m240��ma05�Pma12�t�Z�b35�I��
            ma05_240_buffer[1]-ma12_240_buffer[1]<=0.00350)

 //H4 k1,k2,k3�b80�W,kd1,kd2,kd3���٦V�W�}�f 
            if   ((k1_240_buffer[1]-d1_240_buffer[1]>=3 &&  k2_240_buffer[1]-d2_240_buffer[1]>=3 && 
                   k3_240_buffer[1]-d3_240_buffer[1]>=3 &&  k1_240_buffer[1]>=80 &&  k2_240_buffer[1]>=80 &&  k3_240_buffer[1]>=80) ||
 
 //m60 k1,k2,k3�b80�W,kd1,kd2,kd3���٦V�W�}�f 
                  (k1_60_buffer[1]-d1_60_buffer[1]>=3 &&  k2_60_buffer[1]-d2_60_buffer[1]>=3 && 
                   k3_60_buffer[1]-d3_60_buffer[1]>=3 &&  k1_60_buffer[1]>=80 &&  k2_60_buffer[1]>=80 &&  k3_60_buffer[1]>=80) ||
 
 //H1-K1,K2,K3��H4-K1  ���W��
                  (k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 &&
                   k3_60_buffer[1]-k3_60_buffer[2]>=0 && k1_240_buffer[1]-k1_240_buffer[2]>=0))
                   return;
                   else
                   OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+300*Point,Bid-6900*Point,"My order #S8",4408,0,Blue);
 
 //********** Sell  9  *********************************************************************************************************************************** 

    if ( OrdersTotal()>0 && OrderMagicNumber() == 4409) 
      return;
      else
          
 // m240 k1,k2��k3�U��,�B�b70�W
      if   (k1_240_buffer[1]>=70 &&   k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70 &&
          ((k1_240_buffer[1]-k1_240_buffer[2]<=-3 &&  (k2_240_buffer[1]-k2_240_buffer[2]<=-1 || k3_240_buffer[1]-k3_240_buffer[2]<=-1)) ||
           (k1_240_buffer[1]-d1_240_buffer[1]<=-6 && k2_240_buffer[1]-d2_240_buffer[1]<=8 &&  k3_240_buffer[1]-d3_240_buffer[1]<=8))  &&
             
 //m60��ma05�Pma12�t�Z�b15�I��
            ma05_60_buffer[1]-ma12_60_buffer[1]<=0.00150 &&

 //m240��ma05�Pma12�t�Z�b35�I��
            ma05_240_buffer[1]-ma12_240_buffer[1]<=0.00350 &&

 //[1][2]���t[3]��[4]����
            close_240_buffer[1]-open_240_buffer[1]<=-0.00040 && close_240_buffer[2]-open_240_buffer[2]<=0 &&
           (close_240_buffer[3]-open_240_buffer[3]>=0.00040 || close_240_buffer[4]-open_240_buffer[4]>=0.00040) &&
           
 //ma180��ma360�פU
           (ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00010 || ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00010) &&                      
 
 //[1][2][3]��[2][3][4]�}�Φ��L�bma180�W�U�U12�I��
           ((close_240_buffer[2]-ma180_240_buffer[2]<=0.00120 || close_240_buffer[2]-ma180_240_buffer[2]>=-0.00120) &&
            (close_240_buffer[3]-ma180_240_buffer[3]<=0.00120 || close_240_buffer[3]-ma180_240_buffer[3]>=-0.00120) &&
           ((close_240_buffer[4]-ma180_240_buffer[4]<=0.00120 || close_240_buffer[4]-ma180_240_buffer[4]>=-0.00120) ||
            (close_240_buffer[1]-ma180_240_buffer[1]<=0.00120 || close_240_buffer[1]-ma180_240_buffer[1]>=-0.00120))) ||
          
 //��[1][2][3]��[2][3][4]�}�Φ��L�bma360�W�U�U12�I��
           ((close_240_buffer[2]-ma360_240_buffer[2]<=0.00120 || close_240_buffer[2]-ma360_240_buffer[2]>=-0.00120) &&
            (close_240_buffer[3]-ma360_240_buffer[3]<=0.00120 || close_240_buffer[3]-ma360_240_buffer[3]>=-0.00120) &&
           ((close_240_buffer[4]-ma360_240_buffer[4]<=0.00120 || close_240_buffer[4]-ma360_240_buffer[4]>=-0.00120) ||
            (close_240_buffer[1]-ma360_240_buffer[1]<=0.00120 || close_240_buffer[1]-ma360_240_buffer[1]>=-0.00120))))
            OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+600*Point,Bid-6900*Point,"My order #S9",4409,0,Green);

 //********** Sell  10  *********************************************************************************************************************************** 
//�Φb���ҥH�ư�������� ���u��     

    if ( OrdersTotal()>0 && OrderMagicNumber() == 4410) 
      return;
      else
          
 // m15 k1,k2,k3�ҤU��,�B�b50,70�W
      if   (k1_15_buffer[1]-k1_15_buffer[2]<=-3 &&  k2_15_buffer[1]-k2_15_buffer[2]<=-1 && k3_15_buffer[1]-k3_15_buffer[2]<=-1 &&
            k1_15_buffer[1]>=50 &&   k2_15_buffer[1]>=70 && k3_15_buffer[1]>=70 &&
             
 // m30 k1,k2��k3�ҤU��,�B�b60,70�W
           (k1_30_buffer[1]-k1_30_buffer[2]<=-1 &&  (k2_30_buffer[1]-k2_30_buffer[2]<=-1 || k3_30_buffer[1]-k3_30_buffer[2]<=-1) && 
            k1_30_buffer[1]>=60 && k2_30_buffer[1]>=70 && k3_30_buffer[1]>=70) &&
 
 // m60 k1,k2��k3�ҤU��,�B�b60,70�W��[0]���j�T�פU��
         (((k1_60_buffer[1]-k1_60_buffer[2]<=-1 &&  (k2_60_buffer[1]-k2_60_buffer[2]<=-1 || k3_60_buffer[1]-k3_60_buffer[2]<=-1)) ||
           (k1_60_buffer[0]-k1_60_buffer[1]<=-5 && k1_60_buffer[0]-d1_60_buffer[0]<=-2))  &&
            k1_60_buffer[1]>=60 && k2_60_buffer[1]>=70 && k3_60_buffer[1]>=70)) 

 //H1,H4 kd�Ȯt����>10
             if   ((k2_60_buffer[1]-d2_60_buffer[1]>=10 && k3_60_buffer[1]-d3_60_buffer[2]>=10 &&
                    k2_240_buffer[1]-d2_240_buffer[1]>=10 && k3_240_buffer[1]-d3_240_buffer[2]>=10) ||
 
 //H1,H4 k2,k3�b�C�I,��H4 k1,k,k3�b�C�I
                   (k2_60_buffer[1]<=30 && k3_60_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||
                   (k1_240_buffer[1]<=30 && k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) ||

 //H1 kd2,kd3�Ȯt>16 �Υ[�`>35
                   (k2_60_buffer[1]-d2_60_buffer[1]>=16 && k3_60_buffer[1]-d3_60_buffer[2]>=16) ||
                  ((k2_60_buffer[1]-d2_60_buffer[1])+(k3_60_buffer[1]-d3_60_buffer[2])>=35) ||
 
 //H1-K1,K2,K3��H4-K1  ���W��
                   (k1_60_buffer[1]-k1_60_buffer[2]>=0 && k2_60_buffer[1]-k2_60_buffer[2]>=0 &&
                    k3_60_buffer[1]-k3_60_buffer[2]>=0 && k1_240_buffer[1]-k1_240_buffer[2]>=0))                     
                    return;
                    else
                    OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+300*Point,Bid-2000*Point,"My order #S10",4410,0,Blue);

 //********** Sell  11  *********************************************************************************************************************************** 
//����M�W�ۦP��K1[0],KD[0]�y���P  

    if ( OrdersTotal()>0 && OrderMagicNumber() == 4411) 
      return;
      else
          
 // H4   [1][3]��[1][4]��[1][5]��[1][6]���t
      if (((close_240_buffer[1]-open_240_buffer[1]<=-0.00050 &&  close_240_buffer[3]-open_240_buffer[3]<=-0.00050) ||
           (close_240_buffer[1]-open_240_buffer[1]<=-0.00050 &&  close_240_buffer[4]-open_240_buffer[4]<=-0.00050) ||
           (close_240_buffer[1]-open_240_buffer[1]<=-0.00050 &&  close_240_buffer[5]-open_240_buffer[5]<=-0.00050) ||
           (close_240_buffer[1]-open_240_buffer[1]<=-0.00050 &&  close_240_buffer[6]-open_240_buffer[6]<=-0.00050)) &&
             
 // H4 k1,k2��k3�ҤU��,�BK1�b60�W,[1]�U�v�u���p��12�I
          ((k1_240_buffer[1]-k1_240_buffer[2]<0 &&  (k2_240_buffer[1]-k2_240_buffer[2]<0 || k3_240_buffer[1]-k3_240_buffer[2]<0) && 
            k1_240_buffer[1]>=60 && low_240_buffer[1]-close_240_buffer[1]>=-0.00120) ||
            
 // H4 k1�b���I�V�U          
           (k1_240_buffer[1]>=80 && k1_240_buffer[1]-k1_240_buffer[2]<=-3 )) &&
            
 //ma45��ma90��ma180��׫פU��
           (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00030 || ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00030 ||
            ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00030))      
            OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+300*Point,Bid-6900*Point,"My order #S11",4411,0,Green);



  //+++++++++++++++++++++++++++++++++++++++++++   SELL   15   ++++++++++++++++++++++++++++++++++++++++++++++++++          
    if ( OrdersTotal()>0 && OrderMagicNumber() == 4415) 
      return;
      else

              //(m15-63)  H4     [2][3]����<9�I     [1]����  �d�W�v�u>30�I   
    if    (close_240_buffer[1]-open_240_buffer[1]<=-0.00100 && high_240_buffer[1]-open_240_buffer[1]>=0.00300 &&
           close_240_buffer[2]-open_240_buffer[2]>=0.00090  && close_240_buffer[3]-open_240_buffer[3]>=0.00090  &&   
            // ma45 ma90 || ma90 ma180  �פU�B�j
         ((ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00080 &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00020) ||
          (ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00060 &&  ma180_240_buffer[1]-ma180_240_buffer[2]<=-0.00020)) &&
             // [1]���L�bma05���U  ���W�L15�I
           close_240_buffer[1]-ma05_240_buffer[1]<=-0.00010  && close_240_buffer[1]-ma05_240_buffer[1]>=-0.00150) 
           // (m15-66) kd2,kd3[1]-[2]>=7    k2,k2<=30 
           if    (k1_240_buffer[1]-d1_240_buffer[1]>=7 && k2_240_buffer[1]-d2_240_buffer[1]>=7 && k3_240_buffer[1]-d3_240_buffer[1]>=7 &&
                  k2_240_buffer[1]<=30 && k3_240_buffer[1]<=30) 
                   return;
                   else
                   OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S15",4415,0,SpringGreen );

//+++++++++++++++++++++++++++++++++++++++++++   SELL   16   ++++++++++++++++++++++++++++++++++++++++++++++++++          
           
     if ( OrdersTotal()>0 && OrderMagicNumber() == 4416) 
      return;
      else
               //(m15-65)   h4 �� ma650�פU             ma360�פU�u�u
      if   (ma650_240_buffer[1]-ma650_240_buffer[2]<0 &&
               //h4 [1]�����bma360���W�����W�L25�I
          ((close_240_buffer[1]-open_240_buffer[1]>=0.00010 && close_240_buffer[1]-ma360_240_buffer[1]>=0.00010 &&
            close_240_buffer[1]-ma360_240_buffer[1]<=0.00250) ||
              //h4 [1]���t�B�bma360���U�����W�L25�I ��[2]�W�v�u�j��25�I
           (close_240_buffer[1]-open_240_buffer[1]<=-0.00010 && close_240_buffer[1]-ma360_240_buffer[1]>=0.00010 &&
            close_240_buffer[1]-ma360_240_buffer[1]<=0.00250 && high_240_buffer[2]-close_240_buffer[2]>=0.00250)) &&
              //k2,k3[1]-[2]<=0    k2,k2>=70  k1[1]-[2]<0 || [1]�W�v�u�j��25�I
            k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
            k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70 &&
           (k1_240_buffer[1]-k1_240_buffer[2]<=0 ||  high_240_buffer[1]-close_240_buffer[1]>=0.00250) &&  
               // macd�t��<=0.00150  >=-0.00100 
            macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.001500 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.001000 && 
           // [2]||[3]||[4]||[5]���bma360�U��25�I��  
          ((close_240_buffer[2]-ma360_240_buffer[2]<=-0.00010  && close_240_buffer[2]-ma360_240_buffer[2]>=-0.00250) ||
           (close_240_buffer[3]-ma360_240_buffer[3]<=-0.00010  && close_240_buffer[3]-ma360_240_buffer[3]>=-0.00250) ||
           (close_240_buffer[4]-ma360_240_buffer[4]<=-0.00010  && close_240_buffer[4]-ma360_240_buffer[4]>=-0.00250) ||
           (close_240_buffer[5]-ma360_240_buffer[5]<=-0.00010  && close_240_buffer[5]-ma360_240_buffer[5]>=-0.00250)))
            OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S16",4416,0,LightGreen );

//+++++++++++++++++++++++++++++++++++++++++++   SELL   17   ++++++++++++++++++++++++++++++++++++++++++++++++++          
    if ( OrdersTotal()>0 && OrderMagicNumber() == 4417) 
      return;
      else
           
                //(m15-65)   h4 �� ma650�פU          ma180�פU�u�u
      if   (ma650_240_buffer[1]-ma650_240_buffer[2]<-0.00010 &&
               //h4 [1]�����B�bma180���W�����W�L25�I
          ((close_240_buffer[1]-open_240_buffer[1]>=0.00010 && close_240_buffer[1]-ma180_240_buffer[1]>=0.00010 &&
            close_240_buffer[1]-ma180_240_buffer[1]<=0.00250) ||
              //h4 [1]���t�B�bma180���U�����W�L25�I ��[2]�W�v�u�j��25�I
           (close_240_buffer[1]-open_240_buffer[1]<=-0.00010 && close_240_buffer[1]-ma180_240_buffer[1]>=0.00010 &&
            close_240_buffer[1]-ma180_240_buffer[1]<=0.00250 && high_240_buffer[2]-close_240_buffer[2]>=0.00250)) &&
              //k2,k3[1]-[2]<=0 ||kd2,kd3<=1   k2,k2>=70  k1[1]-[2]<=0 || [1]�W�v�u�j��25�I
          ((k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0) ||
           (k2_240_buffer[1]-d2_240_buffer[2]<=-1 && k3_240_buffer[1]-d3_240_buffer[2]<=-1)) &&
            k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70 &&
           (k1_240_buffer[1]-k1_240_buffer[2]<=0 ||  high_240_buffer[1]-close_240_buffer[1]>=0.00250) &&  
               // macd�t��<=0.00150  >=-0.00100 
            macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.001500 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.001000 && 
           // [2]||[3]||[4]||[5]���bma180�U��25�I��  
          ((close_240_buffer[2]-ma180_240_buffer[2]<=-0.00010  && close_240_buffer[2]-ma180_240_buffer[2]>=-0.00250) ||
           (close_240_buffer[3]-ma180_240_buffer[3]<=-0.00010  && close_240_buffer[3]-ma180_240_buffer[3]>=-0.00250) ||
           (close_240_buffer[4]-ma180_240_buffer[4]<=-0.00010  && close_240_buffer[4]-ma180_240_buffer[4]>=-0.00250) ||
           (close_240_buffer[5]-ma180_240_buffer[5]<=-0.00010  && close_240_buffer[5]-ma180_240_buffer[5]>=-0.00250)))
            OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S17",4417,0,LightGreen );

//+++++++++++++++++++++++++++++++++++++++++++   SELL   18   ++++++++++++++++++++++++++++++++++++++++++++++++++          
    if ( OrdersTotal()>0 && OrderMagicNumber() == 4418) 
      return;
      else
                
            //(m15-65)  ma45�פU  ma90�����αפW   ma180,ma360,ma650�פW  ���bma45���W�w�[�Ӥɤ��W��[1]�d�W�v�u>25�I�B����                      
   if      (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00020 &&  ma90_240_buffer[1]-ma90_240_buffer[2]<=0 &&       
              // macd�t��<=0.00150  >=-0.00100 
            macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.001500 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.001000 && 
                //   k1,k2,k3<=0  k2,k2>=70            
            k1_240_buffer[1]-k1_240_buffer[2]<=0 && k2_240_buffer[1]-k2_240_buffer[2]<=0 && k3_240_buffer[1]-k3_240_buffer[2]<=0 &&
            k2_240_buffer[1]>=70 && k3_240_buffer[1]>=70 &&
              //h4 [1]���t�W�v�u�j��25�I
            close_240_buffer[1]-open_240_buffer[1]<=-0.00010 &&  high_240_buffer[1]-close_240_buffer[1]>=0.00250 &&
               // [1],[2],[3],[4],[5],[6],[7] ���bma45�W��25�I�� ���U5�I�� 
            close_240_buffer[1]-ma45_240_buffer[1]<=0.00250  && close_240_buffer[1]-ma180_240_buffer[1]>=-0.00050 &&
            close_240_buffer[2]-ma45_240_buffer[2]<=0.00250  && close_240_buffer[2]-ma180_240_buffer[2]>=-0.00050 &&
            close_240_buffer[3]-ma45_240_buffer[3]<=0.00250  && close_240_buffer[3]-ma180_240_buffer[3]>=-0.00050 &&
            close_240_buffer[4]-ma45_240_buffer[4]<=0.00250  && close_240_buffer[4]-ma180_240_buffer[4]>=-0.00050 &&
            close_240_buffer[5]-ma45_240_buffer[5]<=0.00250  && close_240_buffer[5]-ma180_240_buffer[5]>=-0.00050 &&
            close_240_buffer[6]-ma45_240_buffer[6]<=0.00250  && close_240_buffer[6]-ma180_240_buffer[6]>=-0.00050)
            OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S18",4418,0,MediumSeaGreen );
          
//+++++++++++++++++++++++++++++++++++++++++++   SELL   19   ++++++++++++++++++++++++++++++++++++++++++++++++++          
    if ( OrdersTotal()>0 && OrderMagicNumber() == 4419) 
      return;
      else

             //(m15-65) h4  ����@�q�ɶ������W�h  ma �ҤW�ɦ��e�{�������
    if     (ma05_240_buffer[1]-ma05_240_buffer[10]>=0  &&  ma05_240_buffer[1]-ma05_240_buffer[10]<=0.00100 &&
            ma45_240_buffer[1]-ma45_240_buffer[10]>=0  &&  ma45_240_buffer[1]-ma45_240_buffer[10]<=0.00450 &&
            ma90_240_buffer[1]-ma90_240_buffer[10]>=0  &&  ma90_240_buffer[1]-ma90_240_buffer[10]<=0.00250 &&   
            ma180_240_buffer[1]-ma180_240_buffer[10]>=0  &&  ma180_240_buffer[1]-ma180_240_buffer[10]<=0.00250 &&
            ma360_240_buffer[1]-ma360_240_buffer[10]>=0  &&  ma360_240_buffer[1]-ma360_240_buffer[10]<=0.00250 &&
            ma650_240_buffer[1]-ma650_240_buffer[10]>=0  &&  ma650_240_buffer[1]-ma650_240_buffer[10]<=0.00250 &&
             // [1]~[6] macd�t��<=0.0050  >=-0.0050 
            macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.000500 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.000500 && 
            macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]<=0.000500 &&  macdmainline_240_buffer[2]-macdsignalline_240_buffer[2]>=-0.000500 && 
            macdmainline_240_buffer[3]-macdsignalline_240_buffer[3]<=0.000500 &&  macdmainline_240_buffer[3]-macdsignalline_240_buffer[3]>=-0.000500 && 
            macdmainline_240_buffer[4]-macdsignalline_240_buffer[4]<=0.000500 &&  macdmainline_240_buffer[4]-macdsignalline_240_buffer[4]>=-0.000500 && 
            macdmainline_240_buffer[5]-macdsignalline_240_buffer[5]<=0.000500 &&  macdmainline_240_buffer[5]-macdsignalline_240_buffer[5]>=-0.000500 && 
            macdmainline_240_buffer[6]-macdsignalline_240_buffer[6]<=0.000500 &&  macdmainline_240_buffer[6]-macdsignalline_240_buffer[6]>=-0.000500)// && 
                //(m15-66)  k2,k3>=0  kd1>=18  ma45 �פW
            if ((k2_240_buffer[1]-k2_240_buffer[2]>=0 && k3_240_buffer[1]-k3_240_buffer[2]>=0 &&
                 ma45_240_buffer[1]-ma45_240_buffer[2]>=0.00010  &&
                    //(m15-67)  k2,k3 ���פU����W��  exit
                 ((k2_240_buffer[4]-k2_240_buffer[5]<=-3 && k3_240_buffer[4]-k3_240_buffer[5]<=-3) ||
                 (k2_240_buffer[5]-k2_240_buffer[6]<=-3 && k3_240_buffer[5]-k3_240_buffer[6]<=-3)) &&
                  k1_240_buffer[1]-d1_240_buffer[1]>=18) ||
                   //(m15-67) h4 [1]macd �Ȥ���0.00120 �P-0.00120��  �����                                
                (macdmainline_240_buffer[1]<=0.001200 && macdmainline_240_buffer[1]>=-0.001200 &&
                 macdsignalline_240_buffer[1]<=0.001200 &&  macdsignalline_240_buffer[1]>=-0.001200))
                 return;
                 else
                 OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S19",4419,0,MediumSeaGreen );

//+++++++++++++++++++++++++++++++++++++++++++   SELL   20   ++++++++++++++++++++++++++++++++++++++++++++++++++          
     if ( OrdersTotal()>0 && OrderMagicNumber() == 4420) 
      return;
      else
   
      //(m15-66)  ma650,�פU [1]<=-0.0050   ma90���U  ma45�bma650���W50�I,�B�פU���j    ma90�bma45���W50�I 
     if     (ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.00020  && close_240_buffer[1]-open_240_buffer[1]<=-0.00500 &&
             ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00070  && ma90_240_buffer[1]-ma90_240_buffer[2]<=-0.00020 &&
             ma45_240_buffer[1]-ma650_240_buffer[1]>=0.00500  && ma90_240_buffer[1]-ma45_240_buffer[1]>=0.00500  && 
                 //   kd1,kd2,kd3<=-4  k2,k3>=65            
             k1_240_buffer[1]-d1_240_buffer[1]<=-4 && k2_240_buffer[1]-d2_240_buffer[1]<=-4 && k3_240_buffer[1]-d3_240_buffer[1]<=-4 &&
             k2_240_buffer[1]>=65 && k3_240_buffer[1]>=65)
             OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S20",4420,0,MediumSeaGreen );

//+++++++++++++++++++++++++++++++++++++++++++   SELL   21   ++++++++++++++++++++++++++++++++++++++++++++++++++          
    if ( OrdersTotal()>0 && OrderMagicNumber() == 4421) 
      return;
      else

             //(m15-66)   h4 �� ma180,ma360,ma650 �פU ��ma180���� ma360 �פU   
     if   ((ma180_240_buffer[1]-ma180_240_buffer[2]<=0.00010 && ma360_240_buffer[1]-ma360_240_buffer[2]<=0.00010 &&
            ma650_240_buffer[1]-ma650_240_buffer[2]<=0.00010 &&
               //  macd<=0.00110  >=0.00110   main && signal <=-0.00015   
            macdmainline_240_buffer[1]-macdmainline_240_buffer[2]<=-0.000150 && 
            macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]<=-0.000150 &&
            macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.001100 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.001100 &&
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
           (ma180_240_buffer[1]-ma180_240_buffer[2]<=0.00010 && ma360_240_buffer[1]-ma360_240_buffer[2]<=0.00010 &&
            ma650_240_buffer[1]-ma650_240_buffer[2]<=0.00010 &&
               //  macd>=-0.00110  <=0.00110   main && signal <=-0.00015   
            macdmainline_240_buffer[1]-macdmainline_240_buffer[2]<=-0.000150 && 
            macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]<=-0.000150 &&
            macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]>=-0.001100 &&  macdmainline_240_buffer[1]-macdsignalline_240_buffer[1]<=0.001100 &&
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
           (ma360_240_buffer[1]-ma360_240_buffer[2]<=-0.00010 && ma650_240_buffer[1]-ma650_240_buffer[2]<=-0.00010 &&
           (ma05_240_buffer[1]-ma05_240_buffer[2]<=0.00010 || ma08_240_buffer[1]-ma08_240_buffer[2]<=0.00010 ||
            ma12_240_buffer[1]-ma12_240_buffer[2]<=0.00010) &&
               //ma45,ma90�w�����  [1]-[6]<=0.0003
            ma45_240_buffer[1]-ma45_240_buffer[6]<=0.00030 && ma90_240_buffer[1]-ma90_240_buffer[6]<=0.00030 &&
             // [1]�W�v�j��30�I          [2][3]����  
           (close_240_buffer[1]-open_240_buffer[1]<=-0.00010  && high_240_buffer[1]-close_240_buffer[1]>=0.00300)  ||
            close_240_buffer[1]-open_240_buffer[1]>=0.00010  && high_240_buffer[1]-open_240_buffer[1]>=0.00300)  &&
           (close_240_buffer[2]-open_240_buffer[2]>=0.00010 || close_240_buffer[3]-open_240_buffer[3]>=0.00010)  && 
                //   [5]||[6]||[7]||[8]���}�L���b[1]���W   �U�^��W���d�W�v�u         
           (close_240_buffer[5]-close_240_buffer[1]>=0 || close_240_buffer[6]-close_240_buffer[1]>=0 ||
            close_240_buffer[7]-close_240_buffer[1]>=0 || close_240_buffer[8]-close_240_buffer[1]>=0 ||
            close_240_buffer[9]-close_240_buffer[1]>=0 || close_240_buffer[10]-close_240_buffer[1]>=0) &&                 //kd2,kd3>=7     
            k2_240_buffer[1]-d2_240_buffer[1]<=-3 &&  k3_240_buffer[1]-d3_240_buffer[1]<=-3)
            OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S21",4421,0,MediumSeaGreen );

//+++++++++++++++++++++++++++++++++++++++++++   SELL   22   ++++++++++++++++++++++++++++++++++++++++++++++++++          

 if ( OrdersTotal()>0 && OrderMagicNumber() == 4422) 
      return;
      else
          //����^�^��ma180��A�ϼu��ma45�ᤣ���F
             //(m15-67)   h4 �� ma45�פU ma90���� ma180 �פW  �W��U�ƦC  ma45,ma90,ma180   
     if    (ma45_240_buffer[1]-ma45_240_buffer[2]<=-0.00020 && ma90_240_buffer[1]-ma90_240_buffer[2]<=0.00010 &&
            ma180_240_buffer[1]-ma180_240_buffer[2]>=0.00010 && ma45_240_buffer[1]-ma90_240_buffer[1]>=0.00100 &&
            ma90_240_buffer[1]-ma180_240_buffer[1]>=0.00100 &&
                  //   kd1,(kd2||kd3)<=-3  k1,k2,k3>=75             
            k1_240_buffer[1]-d1_240_buffer[1]<=-3 && (k2_240_buffer[1]-d2_240_buffer[1]<=-3 || k3_240_buffer[1]-d3_240_buffer[1]<=-3) &&
            k2_240_buffer[1]>=75 && k3_240_buffer[1]>=75 &&
            //ma05 [1]-[2]<=0 
            ma05_240_buffer[1]-ma05_240_buffer[2]<=0 &&
                // [1]�W�v�j��22�I          [2]||[3]����  
          ((close_240_buffer[1]-open_240_buffer[1]<=-0.00010  && high_240_buffer[1]-close_240_buffer[1]>=0.00220)  ||
           (close_240_buffer[1]-open_240_buffer[1]>=0.00010  && high_240_buffer[1]-open_240_buffer[1]>=0.00220))  &&
           (close_240_buffer[2]-open_240_buffer[2]>=0.00010 || close_240_buffer[3]-open_240_buffer[3]>=0.00010)   && 
         
             // ([2]||[3]||[4]||[5]) && ([6]||[7]||[8]||[9])  close[1]-ma45>=-0.0005 <=0.0005  ���bma45����
          ((close_240_buffer[2]-ma45_240_buffer[2]>=-0.00050 && close_240_buffer[2]-ma45_240_buffer[2]<=0.00050) || 
           (close_240_buffer[3]-ma45_240_buffer[3]>=-0.00050 && close_240_buffer[3]-ma45_240_buffer[3]<=0.00050) || 
           (close_240_buffer[4]-ma45_240_buffer[4]>=-0.00050 && close_240_buffer[4]-ma45_240_buffer[4]<=0.00050) || 
           (close_240_buffer[5]-ma45_240_buffer[5]>=-0.00050 && close_240_buffer[5]-ma45_240_buffer[5]<=0.00050)) && 
          ((close_240_buffer[6]-ma45_240_buffer[6]>=-0.00050 && close_240_buffer[6]-ma45_240_buffer[6]<=0.00050) || 
           (close_240_buffer[7]-ma45_240_buffer[7]>=-0.00050 && close_240_buffer[7]-ma45_240_buffer[7]<=0.00050) || 
           (close_240_buffer[8]-ma45_240_buffer[8]>=-0.00050 && close_240_buffer[8]-ma45_240_buffer[8]<=0.00050) || 
           (close_240_buffer[9]-ma45_240_buffer[9]>=-0.00050 && close_240_buffer[9]-ma45_240_buffer[9]<=0.00050))) 
            OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S22",4422,0,MediumSeaGreen );
    
//+++++++++++++++++++++++++++++++++++++++++++   SELL   23   ++++++++++++++++++++++++++++++++++++++++++++++++++          
    if ( OrdersTotal()>0 && OrderMagicNumber() == 4423) 
      return;
      else

           //�^�Ầ��ma180�W�U�d�W�v�u
             //(m15-67)   h4 �� ma90,ma180,ma360,ma650 ���פU     �U��W�ƦC  ma90,ma180,ma360,ma650   
     if    (ma90_240_buffer[1]-ma90_240_buffer[2]<0 && ma180_240_buffer[1]-ma180_240_buffer[2]<=0 &&
            ma360_240_buffer[1]-ma360_240_buffer[2]<0 && ma650_240_buffer[1]-ma650_240_buffer[2]<-0.00010 &&
            ma90_240_buffer[1]-ma180_240_buffer[1]<=0.00100 && ma90_240_buffer[1]-ma180_240_buffer[1]>=-0.00100 && 
               //ma45 �}�f�L�U
           (ma90_240_buffer[1]-ma45_240_buffer[1])-(ma90_240_buffer[2]-ma45_240_buffer[2])<0 && 
                //macd   signal  [1]>[2] [1]<[3] 
            macdsignalline_240_buffer[1]-macdsignalline_240_buffer[2]>=0.000010 &&
            macdsignalline_240_buffer[1]-macdsignalline_240_buffer[3]<=-0.000010 &&

               // [1]�W�v�j��22�I          [2]||[3]����  
          ((close_240_buffer[1]-open_240_buffer[1]<=-0.00010  && high_240_buffer[1]-close_240_buffer[1]>=0.00220)  ||
           (close_240_buffer[1]-open_240_buffer[1]>=0.00010  && high_240_buffer[1]-open_240_buffer[1]>=0.00220))  &&
           (close_240_buffer[2]-open_240_buffer[2]>=0.00010 || close_240_buffer[3]-open_240_buffer[3]>=0.00010)) 
            OrderSend(Symbol(),OP_SELL,lots,Bid,1,Bid+78*Point,Bid-2000*Point,"My order #S23",4423,0,MediumSeaGreen );




return(0);  
}
//+------------------------------------------------------------------+

