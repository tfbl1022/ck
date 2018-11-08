#include "stm32f1xx_hal.h"
#include <string.h>
#include "total.h"

extern double Dl,Da;//GPS_Auto_sailing variation

double Yaw_Parse(UART_HandleTypeDef *huart1,UART_HandleTypeDef *huart2)
{
      int count2 = 0;
      int index1=0;
      int intyaw[4]={0,};
      double Yaw=0;
      uint8_t YAW[25];
      uint8_t YawP[5];
        
        
      HAL_UART_Receive(huart2, YAW, 25, 10);
      
      for(int i=0; i<25; i++)
      {
        if(YAW[i]==',')
        {
          count2++;
          if(count2==2)
            index1=i;
        }
      }
      
      for(int j=0; j<5; j++)
      {
        YawP[j] = YAW[index1+1+j];
      }
      
      count2 = 0;
      
      if(YawP[0]=='-')
      {
        if(YawP[4]=='.')
        {
          intyaw[0] = YawP[1]-48;
          intyaw[1] = YawP[2]-48;
          intyaw[2] = YawP[3]-48;
          
          Yaw = -(intyaw[0]*100 + intyaw[1]*10 + intyaw[2]);
        }
        if(YawP[3]=='.')
        {
          intyaw[0] = YawP[1]-48;
          intyaw[1] = YawP[2]-48;
          intyaw[2] = YawP[4]-48;
          
          Yaw = -(intyaw[0]*10 + intyaw[1] + intyaw[2]*0.1);
        }
      }
      
      else if(YawP[3]=='.')
      {
        intyaw[0] = YawP[0]-48;
        intyaw[1] = YawP[1]-48;
        intyaw[2] = YawP[2]-48;
        intyaw[3] = YawP[4]-48;
        
        Yaw = intyaw[0]*100 + intyaw[1]*10 + intyaw[2] + intyaw[3]*0.1;
      }
      
      if(YawP[2]=='.')
      {
        intyaw[0] = YawP[0]-48;
        intyaw[1] = YawP[1]-48;
        intyaw[2] = YawP[3]-48;
        intyaw[3] = YawP[4]-48;
        
        Yaw = intyaw[0]*10 + intyaw[1] + intyaw[2]*0.1 + intyaw[3]*0.01;
      }
      return Yaw;
}

void receive_gps(UART_HandleTypeDef *huart)
{       
  uint8_t tmp[19]={0,};
    while(1)
    {
      if((HAL_UART_Receive(huart,tmp,19, 500)==HAL_OK))
      {
        for(int i=0;i<19;i++)
        {
          if(i==2||i==12)
            tmp[i]=tmp[i];
          else
          tmp[i] = tmp[i]-48;
        }
          Da=tmp[0]*10 + tmp[1] + tmp[3]*0.1 + tmp[4]*0.01 + tmp[5]*0.001 + tmp[6]*0.0001 + tmp[7]*0.00001 + tmp[8]*0.000001;
          Dl=tmp[9]*100 + tmp[10]*10 + tmp[11] + tmp[13]*0.1 + tmp[14]*0.01 + tmp[15]*0.001 + tmp[16]*0.0001+ tmp[17]*0.00001 + tmp[18]*0.000001;
          printf("g%lf%lf",Da,Dl);
         for(int i=0;i<19;i++)
        {
          tmp[i] = 0;
        }
        break;
      }
    }
}



    
      
        
        
        
          
    
  