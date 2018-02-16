//+------------------------------------------------------------------+
//|                                           DoublePending_beta.mq4 |
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


int start()
{
	//---- Переменные, в которые будем запоминать тикеты ордеров каждого типа
	int BuyStopOrder = 0, SellStopOrder = 0, BuyOrder = 0, SellOrder = 0;
	int _GetLastError = 0, _OrdersTotal = OrdersTotal();
	//---- перебираем все открытые позиции и запоминаем, позиции какого типа уже открыты:
	for ( int z = _OrdersTotal - 1; z >= 0; z -- )
	{
		//---- если при выборе позиции возникла ошибка, переходим к следующей
		if ( !OrderSelect( z, SELECT_BY_POS ) )
		{
			_GetLastError = GetLastError();
			Print( "OrderSelect( ", z, ", SELECT_BY_POS ) - Error #", _GetLastError );
			continue;
		}

		//---- если позиция открыта не по текущему инструменту, пропускаем её
		if ( OrderSymbol() != Symbol() ) continue;

		//---- если MagicNumber не равен _MagicNumber, пропускаем эту позицию
		if ( OrderMagicNumber() != _MagicNumber ) continue;

		//---- в зависимости от типа позиции, меняем значение переменной:
		switch ( OrderType() )
		{
			case OP_BUY:		BuyOrder			= OrderTicket(); break;
			case OP_SELL:		SellOrder		= OrderTicket(); break;
			case OP_BUYSTOP:	BuyStopOrder	= OrderTicket(); break;
			case OP_SELLSTOP:	SellStopOrder	= OrderTicket(); break;
		}
	}

	//---- Если у нас есть оба отложенных ордера - выходим, 
	//---- надо подождать, пока один из них сработает
	if ( BuyStopOrder > 0 && SellStopOrder > 0 ) return(0);

	//---- перебираем все открытые позиции во второй раз - теперь мы будем с ними работать:
	_OrdersTotal = OrdersTotal();
	for ( z = _OrdersTotal - 1; z >= 0; z -- )
	{
		//---- если при выборе позиции возникла ошибка, переходим к следующей
		if ( !OrderSelect( z, SELECT_BY_POS ) )
		{
			_GetLastError = GetLastError();
			Print( "OrderSelect( ", z, ", SELECT_BY_POS ) - Error #", _GetLastError );
			continue;
		}

		//---- если позиция открыта не по текущему инструменту, пропускаем её
		if ( OrderSymbol() != Symbol() ) continue;

		//---- если MagicNumber не равен _MagicNumber, пропускаем эту позицию
		if ( OrderMagicNumber() != _MagicNumber ) continue;

		//---- в зависимости от типа позиции, меняем значение переменной:
		switch ( OrderType() )
		{
			//---- если есть открытая бай-позиция,
			case OP_BUY:
			{
				//---- если селл-стоп ордер ещё не удалён, удаляем его:
				if ( SellStopOrder > 0 )
				{
					if ( !OrderDelete( SellStopOrder ) )
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
					if ( NormalizeDouble( Bid - OrderOpenPrice(), Digits ) > 
						  NormalizeDouble( TrailingStop*Point, Digits ) )
					{
						//---- если новый уровень стоплосса выше, чем сейчас у позиции
						//---- (или если у позиции нет Стоп Лосса),
						if ( NormalizeDouble( Bid - TrailingStop*Point, Digits ) > OrderStopLoss()
							  || OrderStopLoss() <= 0.0 )
						{
							//---- модифицируем ордер
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
				//---- если есть открытая позиция, выходим - дальше делать нечего
				return(0);
			}
			//---- Следующий блок полностью аналогичен блоку обработки бай-позиции,
			//---- поэтому комментарии к нему не присведены...
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