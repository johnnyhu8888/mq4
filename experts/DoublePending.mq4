//+------------------------------------------------------------------+
//|                                                DoublePending.mq4 |
//|                                      Copyright © 2006, komposter |
//|                                      mailto:komposterius@mail.ru |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2006, komposter"
#property link      "mailto:komposterius@mail.ru"

extern int			_MagicNumber	= 1123;

extern double		Lot				= 0.1;
extern int			StopLoss			= 60;	// расстояние до СтопЛосса в пунктах (0 - отключить СЛ)
extern int			TakeProfit		= 100;// расстояние до ТейкПрофита в пунктах (0 - отключить)
extern int			TrailingStop	= 50;	// размер ТрейлингСтопа в пунктах (0 - отключить)

extern int			Luft				= 20;	// расстояние до уровня установки отложенного ордера

#include <OneTypeOrdersControl.mq4>

int start()
{
	int _GetLastError = 0;

	//---- Запоминаем параметры открытых позиций (если они есть)
	OneTypeOrdersInit( _MagicNumber );

	//---- Если у нас есть оба отложенных ордера - выходим, 
	//---- надо подождать, пока один из них сработает
	if ( _BuyStopTicket > 0 && _SellStopTicket > 0 ) return(0);

	//---- если есть открытая бай-позиция,
	if ( _BuyTicket > 0 )
	{
		//---- если селл-стоп ордер ещё не удалён, удаляем его:
		if ( _SellStopTicket > 0 )
		{
			if ( !OrderDelete( _SellStopTicket ) )
			{
				Alert( "OrderDelete Error #", GetLastError() );
				return(-1);
			}
		}
		//---- проверяем, не надо ли передвинуть Стоп Лосс:
		//---- если размер трейлингстопа не слишком маленький,
		if ( TrailingStop > MarketInfo( Symbol(), MODE_STOPLEVEL ) )
		{
			//---- если прибыль позиции больше TrailingStop пунктов,
			if ( NormalizeDouble( Bid - _BuyOpenPrice, Digits ) > 
				  NormalizeDouble( TrailingStop*Point, Digits ) )
			{
				//---- если новый уровень стоплосса выше, чем сейчас у позиции
				//---- (или если у позиции нет Стоп Лосса),
				if ( NormalizeDouble( Bid - TrailingStop*Point, Digits ) > _BuyStopLoss
					  || _BuyStopLoss <= 0.0 )
				{
					//---- модифицируем ордер
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
		//---- если есть открытая позиция, выходим - дальше делать нечего
		return(0);
	}

	//---- Следующий блок полностью аналогичен блоку обработки бай-позиции,
	//---- поэтому комментарии к нему не присведены...
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
	//| Если выполнение дошло до этого места, значит отложенных ордеров и открытых позиций нет
	//+------------------------------------------------------------------+
	//---- Устанавливаем бай-стоп и селл-стоп ордера:
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