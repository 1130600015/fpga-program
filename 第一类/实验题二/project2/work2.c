#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <bios.h>
#include <ctype.h>
#include <process.h>


// ��ʱ����
void delay(int time)
{
	int  i;
	long j;
	for(i=0;i<=time;i++)
	{
		for(j=0;j<=0x400000;j++)
		{   }
	}
	return;
}


void main()
{	
	int port_r,value;
	port_r=0x3002;		//0010
	while(1)	
	{
		//�ȶ�������������˿ڵ���ֵ
		value=inp(port_r);
		delay(40);	//��ʱһ��ʱ�䣬ѭ��������		
		printf("Get data is %d \n", value);	//��ʾ��������
	}
}
