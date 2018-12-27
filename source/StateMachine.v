`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/23 14:51:31
// Design Name: 
// Module Name: StateMachine
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module StateMachine(
    input clk,//100MHz����ʱ���ź�
    input rst,//�����źţ�������
    input on,//�������ܿ���
    input h,//����Сʱ�İ�ť
    input min,//�������ӵİ�ť
    output reg sound_on,//�������ܿ�����ʾ��
    output reg[5:0] hour,//������ʱ��Сʱ���
    output reg[5:0] minute,//������ʱ�ӷ������
    output reg[5:0] second,//������ʱ�������
    output [7:0] seg_out,
    output [7:0] seg_en,//��ʾ�����
    output speak//���������
    );
    
    wire [5:0] reg_hour;
    wire [5:0] reg_minute;
    wire [5:0] reg_second;//�м����
    
    clock c(clk,rst,h,min,reg_hour,reg_minute,reg_second);//ʱ��ģ��
    display d(rst,clk,reg_hour,reg_minute,reg_second,seg_out,seg_en);//��ʾģ��
    sound sd(on,clk,reg_hour,reg_minute,reg_second,speak);//����ģ��
    
    always @(posedge clk)
    sound_on=on;
    //������������
    
    always @(posedge clk)
    begin
        hour=reg_hour;
        minute=reg_minute;
        second=reg_second;
    end
    //����ʱ��
endmodule
