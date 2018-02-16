//+------------------------------------------------------------------+
//|                                        conditional condition.mq4 |
//|                                                            ....h |
//|                                                 hayseedville.com |
//+------------------------------------------------------------------+
#property copyright "....h"
#property link      "hayseedville.com"


extern double TrailingStop                 =        100;
extern double TrailingStopStart            =        100;


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
  TrailAllOrders(TrailingStopStart,TrailingStop);
   
   
//----
   return(0);
  }
//+------------------------------------------------------------------+

//---------


int Count(string sym)
{
 int count=0;
 int trade;
 int trades=OrdersTotal();
 for(trade=0;trade<trades;trade++)
 {
  OrderSelect(trade,SELECT_BY_POS,MODE_TRADES);
  
  if( OrderSymbol()!= sym)
   continue;
   
   count++;
 }
 return(count);
}

//---------


int CountAll()
{
 int count=0;
 int trade;
 int trades=OrdersTotal();
 for(trade=0;trade<trades;trade++)
 {
  OrderSelect(trade,SELECT_BY_POS,MODE_TRADES);
  
  if( OrderType() > OP_SELL)
   continue;
   
   count++;
 }
 return(count);
}

//---------


   void TrailAllOrders(int start,int stop) 
   {
   int profit;
   double stoptrade;
   double stopcal;

   if(stop==0) return;
 
   int trade;
   int trades=0;

   
   for(trade=OrdersTotal()-1;trade>=0;trade--)
   {
   if(!OrderSelect(trade,SELECT_BY_POS,MODE_TRADES))
   continue;

   string symbol     = OrderSymbol(); 
  
   double bid        = MarketInfo(symbol,MODE_BID);
   double ask        = MarketInfo(symbol,MODE_ASK);
   int    digits     = MarketInfo(symbol,MODE_DIGITS);
   double point      = MarketInfo(symbol,MODE_POINT);
   
  

   if(OrderType()==OP_BUY)
   {
   profit=NormalizeDouble((bid-OrderOpenPrice())/point,0);
   if(profit<start)
    continue;
   stoptrade=OrderStopLoss();
   stopcal=bid-(stop*point);
   if(stoptrade==0||(stoptrade!=0 && stopcal>stoptrade))
    OrderModify(OrderTicket(),OrderOpenPrice(),stopcal,OrderTakeProfit(),0,Lime); //Print("trailing " + symbol + "  modification");
   }
  
   if(OrderType()==OP_SELL)
   {
   profit=NormalizeDouble((OrderOpenPrice()-ask)/point,0);
   if(profit<start)
    continue;
   stoptrade=OrderStopLoss();
   stopcal=ask+(stop*point);
   if(stoptrade==0||(stoptrade!=0 && stopcal<stoptrade))
    OrderModify(OrderTicket(),OrderOpenPrice(),stopcal,OrderTakeProfit(),0,Red); //Print("trailing " + symbol + "  modification");
   }
  
   }
   }


