//+------------------------------------------------------------------+
//|                                                        Stoch.mq4 |
//|                      Copyright © 2005, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2005, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"
//----
extern double TakeProfit = 20;
extern double Lots = 20;
extern double TrailingStop = 30;
extern double StopLoss = 40;
extern double MM = 0;
extern double Risk = 30;
extern double LotLimit = 50;
extern double Per = 3;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int start()
  {
      // open buy 

      ticket=OrderSend(Symbol(),OP_BUY,Lots,Ask,3,Bid-StopLoss*Point,0,"BUY",123,0,Green);

      // open buystop

      ticket=OrderSend(Symbol(),OP_BUYSTOP,Lots,Ask+BuyStopLevel*Point,3,Bid+BuyStopLevel*Point-StopLoss*Point,0,"BUYSTOP",456,0,Green);

      // open buylimit

      ticket=OrderSend(Symbol(),OP_BUYLIMIT,Lots,Ask-BuyLimitLevel*Point,3,Bid-BuyLimitLevel*Point-StopLoss*Point,0,"BUYLIMIT",789,0,Green);

-----------------------------------+