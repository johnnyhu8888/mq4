//+------------------------------------------------------------------+
//|                                         OneTypeOrdersControl.mq4 |
//|                                      Copyright © 2006, komposter |
//|                                      mailto:komposterius@mail.ru |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2006, komposter"
#property link      "mailto:komposterius@mail.ru"

// глобальные переменные, в которых будут хранитсья характеристики ордеров:
int _BuyTicket = 0, _SellTicket = 0, _BuyStopTicket = 0;
int _SellStopTicket = 0, _BuyLimitTicket = 0, _SellLimitTicket = 0;

double _BuyLots = 0.0, _SellLots = 0.0, _BuyStopLots = 0.0; 
double _SellStopLots = 0.0, _BuyLimitLots = 0.0, _SellLimitLots = 0.0;

double _BuyOpenPrice = 0.0, _SellOpenPrice = 0.0, _BuyStopOpenPrice = 0.0;
double _SellStopOpenPrice = 0.0, _BuyLimitOpenPrice = 0.0, _SellLimitOpenPrice = 0.0;

double _BuyStopLoss = 0.0, _SellStopLoss = 0.0, _BuyStopStopLoss = 0.0;
double _SellStopStopLoss = 0.0, _BuyLimitStopLoss = 0.0, _SellLimitStopLoss = 0.0;

double _BuyTakeProfit = 0.0, _SellTakeProfit = 0.0, _BuyStopTakeProfit = 0.0;
double _SellStopTakeProfit = 0.0, _BuyLimitTakeProfit = 0.0, _SellLimitTakeProfit = 0.0;

datetime _BuyOpenTime = -1, _SellOpenTime = -1, _BuyStopOpenTime = -1;
datetime _SellStopOpenTime = -1, _BuyLimitOpenTime = -1, _SellLimitOpenTime = -1;

double _BuyProfit = 0.0, _SellProfit = 0.0, _BuySwap = 0.0, _SellSwap = 0.0;
double _BuyCommission = 0.0, _SellCommission = 0.0;

string _BuyComment = "", _SellComment = "", _BuyStopComment = ""; 
string _SellStopComment = "", _BuyLimitComment = "", _SellLimitComment = "";

datetime _BuyStopExpiration = -1, _SellStopExpiration = -1;
datetime _BuyLimitExpiration = -1, _SellLimitExpiration = -1;

void OneTypeOrdersInit( int magic )
{
// обнуление переменных:
	_BuyTicket = 0; _SellTicket = 0; _BuyStopTicket = 0;
	_SellStopTicket = 0; _BuyLimitTicket = 0; _SellLimitTicket = 0;

	_BuyLots = 0.0; _SellLots = 0.0; _BuyStopLots = 0.0; 
	_SellStopLots = 0.0; _BuyLimitLots = 0.0; _SellLimitLots = 0.0;

	_BuyOpenPrice = 0.0; _SellOpenPrice = 0.0; _BuyStopOpenPrice = 0.0;
	_SellStopOpenPrice = 0.0; _BuyLimitOpenPrice = 0.0; _SellLimitOpenPrice = 0.0;

	_BuyStopLoss = 0.0; _SellStopLoss = 0.0; _BuyStopStopLoss = 0.0;
	_SellStopStopLoss = 0.0; _BuyLimitStopLoss = 0.0; _SellLimitStopLoss = 0.0;

	_BuyTakeProfit = 0.0; _SellTakeProfit = 0.0; _BuyStopTakeProfit = 0.0;
	_SellStopTakeProfit = 0.0; _BuyLimitTakeProfit = 0.0; _SellLimitTakeProfit = 0.0;

	_BuyOpenTime = -1; _SellOpenTime = -1; _BuyStopOpenTime = -1;
	_SellStopOpenTime = -1; _BuyLimitOpenTime = -1; _SellLimitOpenTime = -1;

	_BuyProfit = 0.0; _SellProfit = 0.0; _BuySwap = 0.0; _SellSwap = 0.0;
	_BuyCommission = 0.0; _SellCommission = 0.0;

	_BuyComment = ""; _SellComment = ""; _BuyStopComment = ""; 
	_SellStopComment = ""; _BuyLimitComment = ""; _SellLimitComment = "";

	_BuyStopExpiration = -1; _SellStopExpiration = -1;
	_BuyLimitExpiration = -1; _SellLimitExpiration = -1;

	int _GetLastError = 0, _OrdersTotal = OrdersTotal();
	for ( int z = _OrdersTotal - 1; z >= 0; z -- )
	{
		if ( !OrderSelect( z, SELECT_BY_POS ) )
		{
			_GetLastError = GetLastError();
			Print( "OrderSelect( ", z, ", SELECT_BY_POS ) - Error #", _GetLastError );
			continue;
		}
		if ( OrderMagicNumber() == magic && OrderSymbol() == Symbol() )
		{
			switch ( OrderType() )
			{
				case OP_BUY:
					_BuyTicket			= OrderTicket();
					_BuyLots				= NormalizeDouble( OrderLots(), 1 );
					_BuyOpenPrice		= NormalizeDouble( OrderOpenPrice(), Digits );
					_BuyStopLoss		= NormalizeDouble( OrderStopLoss(), Digits );
					_BuyTakeProfit		= NormalizeDouble( OrderTakeProfit(), Digits );
					_BuyOpenTime		= OrderOpenTime();
					_BuyProfit			= NormalizeDouble( OrderProfit(), 2 );
					_BuySwap				= NormalizeDouble( OrderSwap(), 2 );
					_BuyCommission		= NormalizeDouble( OrderCommission(), 2 );
					_BuyComment			= OrderComment();
					break;
				case OP_SELL:
					_SellTicket			= OrderTicket();
					_SellLots			= NormalizeDouble( OrderLots(), 1 );
					_SellOpenPrice		= NormalizeDouble( OrderOpenPrice(), Digits );
					_SellStopLoss		= NormalizeDouble( OrderStopLoss(), Digits );
					_SellTakeProfit	= NormalizeDouble( OrderTakeProfit(), Digits );
					_SellOpenTime		= OrderOpenTime();
					_SellProfit			= NormalizeDouble( OrderProfit(), 2 );
					_SellSwap			= NormalizeDouble( OrderSwap(), 2 );
					_SellCommission	= NormalizeDouble( OrderCommission(), 2 );
					_SellComment		= OrderComment();
					break;
				case OP_BUYSTOP:
					_BuyStopTicket			= OrderTicket();
					_BuyStopLots			= NormalizeDouble( OrderLots(), 1 );
					_BuyStopOpenPrice		= NormalizeDouble( OrderOpenPrice(), Digits );
					_BuyStopStopLoss		= NormalizeDouble( OrderStopLoss(), Digits );
					_BuyStopTakeProfit	= NormalizeDouble( OrderTakeProfit(), Digits );
					_BuyStopOpenTime		= OrderOpenTime();
					_BuyStopComment		= OrderComment();
					_BuyStopExpiration	= OrderExpiration();
					break;
				case OP_SELLSTOP:
					_SellStopTicket		= OrderTicket();
					_SellStopLots			= NormalizeDouble( OrderLots(), 1 );
					_SellStopOpenPrice	= NormalizeDouble( OrderOpenPrice(), Digits );
					_SellStopStopLoss		= NormalizeDouble( OrderStopLoss(), Digits );
					_SellStopTakeProfit	= NormalizeDouble( OrderTakeProfit(), Digits );
					_SellStopOpenTime		= OrderOpenTime();
					_SellStopComment		= OrderComment();
					_SellStopExpiration	= OrderExpiration();
					break;
				case OP_BUYLIMIT:
					_BuyLimitTicket		= OrderTicket();
					_BuyLimitLots			= NormalizeDouble( OrderLots(), 1 );
					_BuyLimitOpenPrice	= NormalizeDouble( OrderOpenPrice(), Digits );
					_BuyLimitStopLoss		= NormalizeDouble( OrderStopLoss(), Digits );
					_BuyLimitTakeProfit	= NormalizeDouble( OrderTakeProfit(), Digits );
					_BuyLimitOpenTime		= OrderOpenTime();
					_BuyLimitComment		= OrderComment();
					_BuyLimitExpiration	= OrderExpiration();
					break;
				case OP_SELLLIMIT:
					_SellLimitTicket		= OrderTicket();
					_SellLimitLots			= NormalizeDouble( OrderLots(), 1 );
					_SellLimitOpenPrice	= NormalizeDouble( OrderOpenPrice(), Digits );
					_SellLimitStopLoss	= NormalizeDouble( OrderStopLoss(), Digits );
					_SellLimitTakeProfit	= NormalizeDouble( OrderTakeProfit(), Digits );
					_SellLimitOpenTime	= OrderOpenTime();
					_SellLimitComment		= OrderComment();
					_SellLimitExpiration	= OrderExpiration();
					break;
			}
		}
	}
}

