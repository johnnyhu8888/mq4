//+------------------------------------------------------------------+
//|                                              OneOrderControl.mq4 |
//|                                      Copyright © 2006, komposter |
//|                                      mailto:komposterius@mail.ru |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2006, komposter"
#property link      "mailto:komposterius@mail.ru"

int _Ticket = 0, _Type = 0; double _Lots = 0.0, _OpenPrice = 0.0, _StopLoss = 0.0;
double _TakeProfit = 0.0; datetime _OpenTime = -1; double _Profit = 0.0, _Swap = 0.0;
double _Commission = 0.0; string _Comment = ""; datetime _Expiration = -1;

void OneOrderInit(int magic)
  {
	   int _GetLastError, _OrdersTotal = OrdersTotal();

	   _Ticket = 0; 
	   _Type = 0; 
	   _Lots = 0.0; 
	   _OpenPrice = 0.0;
	    _StopLoss = 0.0;
	   _TakeProfit = 0.0; 
	   _OpenTime = -1; 
	   _Profit = 0.0; 
	   _Swap = 0.0;
	   _Commission = 0.0; 
	   _Comment = ""; 
	   _Expiration = -1;

	   for(int z = _OrdersTotal - 1; z >= 0; z --)
	     {
		      if(!OrderSelect(z, SELECT_BY_POS))
		        {
			          _GetLastError = GetLastError();
			          Print("OrderSelect( ", z, ", SELECT_BY_POS ) - Error #", _GetLastError);
			          continue;
		        }
		      if(OrderMagicNumber() == magic && OrderSymbol() == Symbol())
		        {
			          _Ticket		= OrderTicket();
			          _Type			= OrderType();
			          _Lots			= NormalizeDouble( OrderLots(), 1 );
			          _OpenPrice	= NormalizeDouble( OrderOpenPrice(), Digits );
			          _StopLoss	= NormalizeDouble( OrderStopLoss(), Digits );
			          _TakeProfit	= NormalizeDouble( OrderTakeProfit(), Digits );
			          _OpenTime	= OrderOpenTime();
			          _Profit		= NormalizeDouble( OrderProfit(), 2 );
			          _Swap			= NormalizeDouble( OrderSwap(), 2 );
			          _Commission	= NormalizeDouble( OrderCommission(), 2 );
			          _Comment		= OrderComment();
			          _Expiration	= OrderExpiration();
			          return(0);
		        }
	     }
  }
//+------------------------------------------------------------------+


