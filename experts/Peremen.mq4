//+------------------------------------------------------------------+
//|                                                     Peremen.mq4  |
//|                                       Copyright � 2006, komposter |
//|                                      mailto:komposterius@mail.ru |
//+------------------------------------------------------------------+
//  Peremen.mq4
//===========================================================================
int
...
//===========================================================================
double
...
Mas_Ord_Tek[26][31][8], Mas_Ord_Old[26][31][8], 
//�w�檺���e�ƲթM�s�Ʋ�
// �Ĥ@�ӫ��� =  �f���︹�X
// �Ĥ@�ӫ��� =  �w�渹�X...
// ... �f�������
// [][][0] �����w
// [][][1] �}��ײv     (�ײv�������)
// [][][2] ��l�w��     (�ײv�������)
// [][][3] Ĺ�Q�w��     (�ײv�������)
// [][][4] �w�渹�X      
// [][][5] �w�檺�зǤ��   (�ײv�������)
// [][][6] �w������ 1=B,2=S,3=BL,4=SL,5=BS,6=SS
// [][][7] �w�檺MagicNumber
//=================================================================
string 
      Instrument[26];                   // �f����W�ټƲ�
...
//==================================================================
//
//
//==================================================================
int Predopred()
   {
//================================================= �w�w�q =
   Instrument[1] = "EURUSD";
   Instrument[2] = "GBPUSD";
   ...
   Instrument[25]= "AUDCAD";
//==================================================================
   return();
   }
//==================================================================

