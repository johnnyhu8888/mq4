//+------------------------------------------------------------------+
//|                                                     Terminal.mq4 |
//|                                      Copyright © 2006, komposter |
//|                                      mailto:komposterius@mail.ru |
//+------------------------------------------------------------------+
// Terminal.mq4
//================================================== ¹w©w¸q=
int Terminal()
   {
//================================================== ¹w©w¸q=
   ArrayCopy(Mas_Ord_Old, Mas_Ord_Tek); 
// «O¦s¥ý«e¾ú¥v
   ArrayInitialize(Mas_Ord_Tek,0);  
// ·í«e©w³æ¼Æ²ÕÂk¹s
//==================================================©w³æ¤ÀªR=
   for (int i=0; i<OrdersTotal(); i++)  
//²×ºÝªº¥þ³¡©w³æ
      {
      if(OrderSelect(i, SELECT_BY_POS)==true) 
// ¦pªG¦s¦b"§Y®É¡¨¥æ©ö
         {
//--------------------------------------- «ü©w³f¹ô¹ï«ü¼Æ--
         string Symb=OrderSymbol();
// ¬d©ú·í«e©w³æ³f¹ô¹ï
         for (int ind=1; ind<=25; ind++)
// ¦b³f¹ô¹ï¼Æ²Õ¤¤·j¯Á
            {
            if (Symb==Instrument[ind])
// §ä¨ì«ü¼Æ¡A·j¯Á§¹¦¨
               break;            // °h¥X´`Àô
            }
//------------------------¼Ò¦¡¤Æ©w³æªº·s¼Æ²Õ ----
         Mas_Ord_Tek[0][0][0]++; 
// ­pºâ©w³æÁ`¼Æ
         Mas_Ord_Tek[ind][0][0]++; 
// ­pºâ¤@ºØ³f¹ô¹ïªº©w³æÁ`¼Æ
         int k=Mas_Ord_Tek[ind][0][0];   // ¼Ò¦¡¤ÆÅÜ¶q
         
         Mas_Ord_Tek[ind][k][1] = NormalizeDouble(OrderOpenPrice(),
                                                  Digits); 
// ¶}³æ¶×²v         
         Mas_Ord_Tek[ind][k][2] = NormalizeDouble(OrderStopLoss(),
                                                  Digits); 
// SL¶×²v        
         Mas_Ord_Tek[ind][k][3] = NormalizeDouble(OrderTakeProfit(),
                                                  Digits); 
// TP¶×²v         
         Mas_Ord_Tek[ind][k][4] = OrderTicket(); // ©w³æ¸¹½X
         Mas_Ord_Tek[ind][k][5] = OrderLots();   // ¼Ð·Ç¤â¼Æ­pºâ
         Mas_Ord_Tek[ind][k][6] = OrderType();   //©w³æÃþ«¬
         Mas_Ord_Tek[ind][k][7] = OrderMagicNumber(); // Magic
                                                      // number 
         
//-----------------------------------------------------------------
         }
      }
//=================================================================
   return();
   }
//=================================================================
//+------------------------------------------------------------------+


