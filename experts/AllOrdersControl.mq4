//+------------------------------------------------------------------+
//|                                             AllOrdersControl.mq4 |
//|                                      Copyright © 2006, komposter |
//|                                      mailto:komposterius@mail.ru |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2006, komposter"
#property link      "mailto:komposterius@mail.ru"

int _ExpertOrdersTotal = 0;

int _OrderTicket[], _OrderType[];
double _OrderLots[], _OrderOpenPrice[], _OrderStopLoss[], _OrderTakeProfit[];
double _OrderProfit[], _OrderSwap[], _OrderCommission[];
datetime _OrderOpenTime[], _OrderExpiration[];
string _OrderComment[];

void AllOrdersInit( int magic )
{
	int _GetLastError = 0, _OrdersTotal = OrdersTotal();
	_ExpertOrdersTotal = 0;

	int temp_value = MathMax( _OrdersTotal, 1 );
	ArrayResize( _OrderTicket,			temp_value );
	ArrayResize( _OrderType,			temp_value );
	ArrayResize( _OrderLots,			temp_value );
	ArrayResize( _OrderOpenPrice,		temp_value );
	ArrayResize( _OrderStopLoss,		temp_value );
	ArrayResize( _OrderTakeProfit,	temp_value );
	ArrayResize( _OrderOpenTime,		temp_value );
	ArrayResize( _OrderProfit,			temp_value );
	ArrayResize( _OrderSwap,			temp_value );
	ArrayResize( _OrderCommission,	temp_value );
	ArrayResize( _OrderComment,		temp_value );
	ArrayResize( _OrderExpiration,	temp_value );


	ArrayInitialize( _OrderTicket,		0 );
	ArrayInitialize( _OrderType,			0 );
	ArrayInitialize( _OrderLots,			0 );
	ArrayInitialize( _OrderOpenPrice,	0 );
	ArrayInitialize( _OrderStopLoss,		0 );
	ArrayInitialize( _OrderTakeProfit,	0 );
	ArrayInitialize( _OrderOpenTime,		0 );
	ArrayInitialize( _OrderProfit,		0 );
	ArrayInitialize( _OrderSwap,			0 );
	ArrayInitialize( _OrderCommission,	0 );
	ArrayInitialize( _OrderExpiration,	0 );

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

			_OrderTicket		[_ExpertOrdersTotal] = OrderTicket();
			_OrderType			[_ExpertOrdersTotal] = OrderType();
			_OrderLots			[_ExpertOrdersTotal] = NormalizeDouble( OrderLots(), 1 );
			_OrderOpenPrice	[_ExpertOrdersTotal] = NormalizeDouble( OrderOpenPrice(), Digits );
			_OrderStopLoss		[_ExpertOrdersTotal] = NormalizeDouble( OrderStopLoss(), Digits );
			_OrderTakeProfit	[_ExpertOrdersTotal] = NormalizeDouble( OrderTakeProfit(), Digits );
			_OrderOpenTime		[_ExpertOrdersTotal] = OrderOpenTime();
			_OrderProfit		[_ExpertOrdersTotal] = NormalizeDouble( OrderProfit(), 2 );
			_OrderSwap			[_ExpertOrdersTotal] = NormalizeDouble( OrderSwap(), 2 );
			_OrderCommission	[_ExpertOrdersTotal] = NormalizeDouble( OrderCommission(), 2 );
			_OrderComment		[_ExpertOrdersTotal] = OrderComment();
			_OrderExpiration	[_ExpertOrdersTotal] = OrderExpiration();
			_ExpertOrdersTotal ++;
		}
	}


	temp_value = MathMax( _ExpertOrdersTotal, 1 );
	ArrayResize( _OrderTicket,			temp_value );
	ArrayResize( _OrderType,			temp_value );
	ArrayResize( _OrderLots,			temp_value );
	ArrayResize( _OrderOpenPrice,		temp_value );
	ArrayResize( _OrderStopLoss,		temp_value );
	ArrayResize( _OrderTakeProfit,	temp_value );
	ArrayResize( _OrderOpenTime,		temp_value );
	ArrayResize( _OrderProfit,			temp_value );
	ArrayResize( _OrderSwap,			temp_value );
	ArrayResize( _OrderCommission,	temp_value );
	ArrayResize( _OrderComment,		temp_value );
	ArrayResize( _OrderExpiration,	temp_value );
}