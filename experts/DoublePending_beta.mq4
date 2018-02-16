//+------------------------------------------------------------------+
//|                                           DoublePending_beta.mq4 |
//|                                      Copyright � 2006, komposter |
//|                                      mailto:komposterius@mail.ru |
//+------------------------------------------------------------------+
#property copyright "Copyright � 2006, komposter"
#property link      "mailto:komposterius@mail.ru"

extern int			_MagicNumber	= 1123;

extern double		Lot				= 0.1;
extern int			StopLoss			= 60;	// ���������� �� ��������� � ������� (0 - ��������� ��)
extern int			TakeProfit		= 100;// ���������� �� ����������� � ������� (0 - ���������)
extern int			TrailingStop	= 50;	// ������ ������������� � ������� (0 - ���������)

extern int			Luft				= 20;	// ���������� �� ������ ��������� ����������� ������


int start()
{
	//---- ����������, � ������� ����� ���������� ������ ������� ������� ����
	int BuyStopOrder = 0, SellStopOrder = 0, BuyOrder = 0, SellOrder = 0;
	int _GetLastError = 0, _OrdersTotal = OrdersTotal();
	//---- ���������� ��� �������� ������� � ����������, ������� ������ ���� ��� �������:
	for ( int z = _OrdersTotal - 1; z >= 0; z -- )
	{
		//---- ���� ��� ������ ������� �������� ������, ��������� � ���������
		if ( !OrderSelect( z, SELECT_BY_POS ) )
		{
			_GetLastError = GetLastError();
			Print( "OrderSelect( ", z, ", SELECT_BY_POS ) - Error #", _GetLastError );
			continue;
		}

		//---- ���� ������� ������� �� �� �������� �����������, ���������� �
		if ( OrderSymbol() != Symbol() ) continue;

		//---- ���� MagicNumber �� ����� _MagicNumber, ���������� ��� �������
		if ( OrderMagicNumber() != _MagicNumber ) continue;

		//---- � ����������� �� ���� �������, ������ �������� ����������:
		switch ( OrderType() )
		{
			case OP_BUY:		BuyOrder			= OrderTicket(); break;
			case OP_SELL:		SellOrder		= OrderTicket(); break;
			case OP_BUYSTOP:	BuyStopOrder	= OrderTicket(); break;
			case OP_SELLSTOP:	SellStopOrder	= OrderTicket(); break;
		}
	}

	//---- ���� � ��� ���� ��� ���������� ������ - �������, 
	//---- ���� ���������, ���� ���� �� ��� ���������
	if ( BuyStopOrder > 0 && SellStopOrder > 0 ) return(0);

	//---- ���������� ��� �������� ������� �� ������ ��� - ������ �� ����� � ���� ��������:
	_OrdersTotal = OrdersTotal();
	for ( z = _OrdersTotal - 1; z >= 0; z -- )
	{
		//---- ���� ��� ������ ������� �������� ������, ��������� � ���������
		if ( !OrderSelect( z, SELECT_BY_POS ) )
		{
			_GetLastError = GetLastError();
			Print( "OrderSelect( ", z, ", SELECT_BY_POS ) - Error #", _GetLastError );
			continue;
		}

		//---- ���� ������� ������� �� �� �������� �����������, ���������� �
		if ( OrderSymbol() != Symbol() ) continue;

		//---- ���� MagicNumber �� ����� _MagicNumber, ���������� ��� �������
		if ( OrderMagicNumber() != _MagicNumber ) continue;

		//---- � ����������� �� ���� �������, ������ �������� ����������:
		switch ( OrderType() )
		{
			//---- ���� ���� �������� ���-�������,
			case OP_BUY:
			{
				//---- ���� ����-���� ����� ��� �� �����, ������� ���:
				if ( SellStopOrder > 0 )
				{
					if ( !OrderDelete( SellStopOrder ) )
					{
						Alert( "OrderDelete Error #", GetLastError() );
						return(-1);
					}
				}
				//---- ���������, �� ���� �� ����������� ���� ����:
				//---- ���� ������ ������������� �� ������� ���������,
				if ( TrailingStop > MarketInfo( Symbol(), MODE_STOPLEVEL ) )
				{
					//---- ���� ������� ������� ������ TrailingStop �������,
					if ( NormalizeDouble( Bid - OrderOpenPrice(), Digits ) > 
						  NormalizeDouble( TrailingStop*Point, Digits ) )
					{
						//---- ���� ����� ������� ��������� ����, ��� ������ � �������
						//---- (��� ���� � ������� ��� ���� �����),
						if ( NormalizeDouble( Bid - TrailingStop*Point, Digits ) > OrderStopLoss()
							  || OrderStopLoss() <= 0.0 )
						{
							//---- ������������ �����
							if ( !OrderModify( OrderTicket(), OrderOpenPrice(), 
								  NormalizeDouble( Bid - TrailingStop*Point, Digits ), 
								  OrderTakeProfit(), OrderExpiration() ) )
							{
								Alert( "OrderModify Error #", GetLastError() );
								return(-1);
							}
						}					
					}
				}
				//---- ���� ���� �������� �������, ������� - ������ ������ ������
				return(0);
			}
			//---- ��������� ���� ��������� ���������� ����� ��������� ���-�������,
			//---- ������� ����������� � ���� �� ����������...
			case OP_SELL:
			{
				if ( BuyStopOrder > 0 )
				{
					if ( !OrderDelete( BuyStopOrder ) )
					{
						Alert( "OrderDelete Error #", GetLastError() );
						return(-1);
					}
				}
				if ( TrailingStop > MarketInfo( Symbol(), MODE_STOPLEVEL ) )
				{
					if ( NormalizeDouble( OrderOpenPrice() - Ask, Digits ) > 
						  NormalizeDouble( TrailingStop*Point, Digits ) )
					{
						if ( NormalizeDouble( Ask + TrailingStop*Point, Digits ) < OrderStopLoss()
							  || OrderStopLoss() <= 0.0 )
						{
							if ( !OrderModify( OrderTicket(), OrderOpenPrice(), 
								  NormalizeDouble( Ask + TrailingStop*Point, Digits ), 
								  OrderTakeProfit(), OrderExpiration() ) )
							{
								Alert( "OrderModify Error #", GetLastError() );
								return(-1);
							}
						}					
					}
				}
				return(0);
			}
		}
	}


	//+------------------------------------------------------------------+
	//| ���� ���������� ����� �� ����� �����, ������ ���������� ������� � �������� ������� ���
	//+------------------------------------------------------------------+
	//---- ������������� ���-���� � ����-���� ������:
	double _OpenPriceLevel, _StopLossLevel, _TakeProfitLevel;
	_OpenPriceLevel = NormalizeDouble( Ask + Luft*Point, Digits );

	if ( StopLoss > 0 )
	{ _StopLossLevel = NormalizeDouble( _OpenPriceLevel - StopLoss*Point, Digits ); }
	else
	{ _StopLossLevel = 0.0; }

	if ( TakeProfit > 0 )
	{ _TakeProfitLevel = NormalizeDouble( _OpenPriceLevel + TakeProfit*Point, Digits ); }
	else
	{ _TakeProfitLevel = 0.0; }

	if ( OrderSend ( Symbol(), OP_BUYSTOP, Lot, _OpenPriceLevel, 5, _StopLossLevel, 
						  _TakeProfitLevel, "", _MagicNumber ) < 0 )
	{
		Alert( "OrderSend Error #", GetLastError() );
		return(-1);
	}


	_OpenPriceLevel = NormalizeDouble( Bid - Luft*Point, Digits );

	if ( StopLoss > 0 )
	{ _StopLossLevel = NormalizeDouble( _OpenPriceLevel + StopLoss*Point, Digits ); }
	else
	{ _StopLossLevel = 0.0; }

	if ( TakeProfit > 0 )
	{ _TakeProfitLevel = NormalizeDouble( _OpenPriceLevel - TakeProfit*Point, Digits ); }
	else
	{ _TakeProfitLevel = 0.0; }

	if ( OrderSend ( Symbol(), OP_SELLSTOP, Lot, _OpenPriceLevel, 5, _StopLossLevel, 
				   _TakeProfitLevel, "", _MagicNumber ) < 0 )
	{
		Alert( "OrderSend Error #", GetLastError() );
		return(-1);
	}
return(0);
}