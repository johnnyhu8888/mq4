//+------------------------------------------------------------------+
//|                                                     Terminal.mq4 |
//|                                      Copyright � 2006, komposter |
//|                                      mailto:komposterius@mail.ru |
//+------------------------------------------------------------------+
// Terminal.mq4
//================================================== �w�w�q=
int Terminal()
   {
//================================================== �w�w�q=
   ArrayCopy(Mas_Ord_Old, Mas_Ord_Tek); 
// �O�s���e���v
   ArrayInitialize(Mas_Ord_Tek,0);  
// ��e�w��Ʋ��k�s
//==================================================�w����R=
   for (int i=0; i<OrdersTotal(); i++)  
//�׺ݪ������w��
      {
      if(OrderSelect(i, SELECT_BY_POS)==true) 
// �p�G�s�b"�Y�ɡ����
         {
//--------------------------------------- ���w�f�������--
         string Symb=OrderSymbol();
// �d����e�w��f����
         for (int ind=1; ind<=25; ind++)
// �b�f����Ʋդ��j��
            {
            if (Symb==Instrument[ind])
// �����ơA�j������
               break;            // �h�X�`��
            }
//------------------------�Ҧ��Ʃw�檺�s�Ʋ� ----
         Mas_Ord_Tek[0][0][0]++; 
// �p��w���`��
         Mas_Ord_Tek[ind][0][0]++; 
// �p��@�سf���諸�w���`��
         int k=Mas_Ord_Tek[ind][0][0];   // �Ҧ����ܶq
         
         Mas_Ord_Tek[ind][k][1] = NormalizeDouble(OrderOpenPrice(),
                                                  Digits); 
// �}��ײv         
         Mas_Ord_Tek[ind][k][2] = NormalizeDouble(OrderStopLoss(),
                                                  Digits); 
// SL�ײv        
         Mas_Ord_Tek[ind][k][3] = NormalizeDouble(OrderTakeProfit(),
                                                  Digits); 
// TP�ײv         
         Mas_Ord_Tek[ind][k][4] = OrderTicket(); // �w�渹�X
         Mas_Ord_Tek[ind][k][5] = OrderLots();   // �зǤ�ƭp��
         Mas_Ord_Tek[ind][k][6] = OrderType();   //�w������
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


