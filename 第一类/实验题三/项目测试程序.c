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
	unsigned int data=7;      //input your data hare!
	unsigned int port_273=0x3002;  //�����������·��ѡͨ��ַ
	unsigned int port_194=0x3008;  //8λ�Ĵ�����ѡͨ��ַ
	
   	outp(port_273,0xff);	//ѡͨ74273����s0��s1�͡�11���źţ�����74194���в�������
   	outp(port_194,data);	//��74194��ԭʼ����
	outp(port_273,0x02); 	//ѡͨ74273����s0��s1�͡�10���źţ�����74194��������
	
	while(1)
	{
		outp(port_194,0);  //�ṩclk�źţ�ѭ������һλ
		delay(20);	//��ʱһ��ʱ��
	}	
}

