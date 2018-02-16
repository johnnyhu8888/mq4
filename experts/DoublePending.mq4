//+------------------------------------------------------------------+
//|                                                DoublePending.mq4 |
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

#include <OneTypeOrdersControl.mq4>

int start()
{
	int _GetLastError = 0;

	//---- ���������� ��������� �������� ������� (���� ��� ����)
	OneTypeOrdersInit( _MagicNumber );

	//---- ���� � ��� ���� ��� ���������� ������ - �������, 
	//---- ���� ���������, ���� ���� �� ��� ���������
	if ( _BuyStopTicket > 0 && _SellStopTicket > 0 ) return(0);

	//---- ���� ���� �������� ���-�������,
	if ( _BuyTicket > 0 )
	{
		//---- ���� ����-���� ����� ��� �� �����, ������� ���:
		if ( _SellStopTicket > 0 )
		{
			if ( !OrderDelete( _SellStopTicket ) )
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
			if ( NormalizeDouble( Bid - _BuyOpenPrice, Digits ) > 
				  NormalizeDouble( TrailingStop*Point, Digits ) )
			{
				//---- ���� ����� ������� ��������� ����, ��� ������ � �������
				//---- (��� ���� � ������� ��� ���� �����),
				if ( NormalizeDouble( Bid - TrailingStop*Point, Digits ) > _BuyStopLoss
					  || _BuyStopLoss <= 0.0 )
				{
					//---- ������������ �����
					if ( !OrderModify( _BuyTicket, _BuyOpenPrice, 
						  NormalizeDouble( Bid - TrailingStop*Point, Digits ), 
						  _BuyTakeProfit, 0 ) )
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
	if ( _SellTicket > 0 )
	{
		if ( _BuyStopTicket > 0 )
		{
			if ( !OrderDelete( _BuyStopTicket ) )
			{
				Alert( "OrderDelete Error #", GetLastError() );
				return(-1);
			}
		}
		if ( TrailingStop > MarketInfo( Symbol(), MODE_STOPLEVEL ) )
		{
			if ( NormalizeDouble( _SellOpenPrice - Ask, Digits ) > 
				  NormalizeDouble( TrailingStop*Point, Digits ) )
			{
				if ( NormalizeDouble( Ask + TrailingStop*Point, Digits ) < _SellStopLoss
					  || _SellStopLoss <= 0.0 )
				{
					if ( !OrderModify( _SellTicket, _SellOpenPrice, 
						  NormalizeDouble( Ask + TrailingStop*Point, Digits ), 
						  _SellTakeProfit, 0 ) )
					{
						Alert( "OrderModify Error #", GetLastError() );
						return(-1);
					}
				}					
			}
		}
		return(0);
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