`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:56:43 01/04/2019 
// Design Name: 
// Module Name:    judgeChessForm 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module judgeChessForm(input wire clk,input wire	[8:0]A,input wire [8:0]B,output wire [2:0]typeOut);

integer cnt,addLeft,addRight,zeroLeft,zeroRight,zeroComplementLeft,zeroComplementRight,mark;
integer i;


reg [2:0] type;

initial begin
	type<=0;
end 

reg [2:0] realType;
assign typeOut=realType;

always @ (*)
begin
	realType<=type;
	/*cnt<=1;
	addLeft<=0;
	addRight<=0;
	zeroLeft<=0;
	zeroRight<=0;
	zeroComplementLeft<=0;
	zeroComplementRight<=0;
	mark<=0;
	*/
	cnt=1;
	addLeft=0;
	addRight=0;
	zeroLeft=0;
	zeroRight=0;
	zeroComplementLeft=0;
	zeroComplementRight=0;
	mark=0;
	
	for(i=3;i>=0;i=i-1)
	begin
		if(mark==0)
			begin
				if(A[i]==0)
					begin
						if(B[i]==0)
							begin
								mark=1;
								zeroLeft=1;
							end
						else mark=3;
					end
				else cnt=cnt+1;
			end
		else if(mark==1)
			begin
				if(A[i]==0&&B[i]==0)zeroLeft=zeroLeft+1;
				else if(A[i]==1)
					begin
						addLeft=1;
						mark=2;
					end
				else mark=3;
			end
		else if(mark==2)
			begin
				if(A[i]==1)addLeft=addLeft+1;				
				else 
					begin
						if(B[i]==0)
							begin
								zeroComplementLeft=1;
								mark=4;
							end
						else mark=3;
					end
			end
		else if(mark==4)
			begin
				if(A[i]==0&&B[i]==0)zeroComplementLeft=zeroComplementLeft+1;
				else mark=3;
			end
	end
	
	mark=0;
	for(i=5;i<=8;i=i+1)
	begin
		if(mark==0)
			begin
				if(A[i]==0)
					begin
						if(B[i]==0)
							begin
								mark=1;
								zeroRight=1;
							end
						else mark=3;
					end
				else cnt=cnt+1;
			end
		else if(mark==1)
			begin
				if(A[i]==0&&B[i]==0)zeroRight=zeroRight+1;
				else if(A[i]==1)
					begin
						addRight=1;
						mark=2;
					end
				else mark=3;
			end
		else if(mark==2)
			begin
				if(A[i]==1)addRight=addRight+1;				
				else 
					begin
						if(B[i]==0)
							begin
								zeroComplementRight=1;
								mark=4;
							end
						else mark=3;
					end
			end
		else if(mark==4)
			begin
				if(A[i]==0&&B[i]==0)zeroComplementRight=zeroComplementRight+1;
				else mark=3;
			end
	end
	
	
	if(cnt==5)type<=7;
	else if(cnt==4)
		begin
			if(zeroLeft>=1&&zeroRight>=1)type<=6;
			else if(zeroLeft+zeroRight>=1)type<=5;
			else type<=0;
		end	
	else if(cnt==3)
		begin
			if((zeroLeft==1&&addLeft>=1)||(zeroRight==1&&addRight>=1))type<=5;
			else if(zeroLeft+zeroRight<=1)type<=0;
			else if(zeroLeft==0||zeroRight==0)type<=3;
			else if(zeroLeft+zeroRight==2)type<=3;
			else if(zeroLeft+zeroRight>=3)type<=4;
		end
	else if(cnt==2)
		begin
			if((zeroLeft==1&&addLeft>=2)||(zeroRight==1&&addRight>=2))type<=5;
			else if(zeroLeft==1&&addLeft==1)
				begin
					if(zeroRight+zeroComplementLeft==0)type<=0;
					else if(zeroRight==0||zeroComplementLeft==0)type<=3;
					else if(zeroRight+zeroComplementLeft>=2)type<=4;
				end
			else if(zeroRight==1&&addRight==1)
				begin
					if(zeroLeft+zeroComplementRight==0)type<=0;
					else if(zeroLeft==0||zeroComplementRight==0)type<=3;
					else if(zeroLeft+zeroComplementRight>=2)type<=4;
				end
			else if((zeroLeft==2&&addLeft>=1)||(zeroRight==2&&addRight>=1))type<=3;
			else if(zeroLeft==0||zeroRight==0)type<=1;
			else if(zeroLeft+zeroRight>=4)type<=2;
			else if(zeroLeft+zeroRight<3)type<=0;
			else if(zeroLeft+zeroRight==3)type<=1;
		end
	else if(cnt==1)
		begin
			if((zeroLeft==1&&addLeft>=3)||(zeroRight==1&&addRight>=3))type<=5;
			else if(zeroLeft==1&&addLeft>=2)
				begin
					if(zeroRight+zeroComplementLeft==0)type<=0;
					else if(zeroRight==0||zeroComplementLeft==0)type<=3;
					else type<=4;
				end
			else if(zeroRight==1&&addRight>=2)
				begin
					if(zeroLeft+zeroComplementRight==0)type<=0;
					else if(zeroLeft==0||zeroComplementRight==0)type<=3;
					else type<=4;
				end
			else if((zeroLeft==2&&addLeft>=2)||(zeroRight==2&&addRight>=2))type<=3;
			else if(zeroLeft==1&&zeroRight==1&&addLeft>=1&&addRight>=1)type<=3;
			else if((A[4:0]==21&&B[4:0]==0)||(A[8:4]==21&&B[8:4]==0))type<=3;
			else if(zeroLeft==1&&addLeft==1)
				begin
					if(zeroComplementLeft+zeroRight<2)type<=0;
					else if(zeroComplementLeft==0||zeroRight==0)type<=1;
					else if(zeroComplementLeft+zeroRight==2)type<=1;
					else type<=2;
				end
			else if(zeroRight==1&&addRight==1)
				begin
					if(zeroComplementRight+zeroLeft<2)type<=0;
					else if(zeroComplementRight==0||zeroLeft==0)type<=1;
					else if(zeroComplementRight+zeroLeft==2)type<=1;
					else type<=2;
				end
			else if(zeroLeft==2&&addLeft==1)
				begin
					if(zeroComplementLeft+zeroRight==0)type<=0;
					else if(zeroComplementLeft==0||zeroRight==0)type<=1;
					else type<=2;
				end
			else if(zeroRight==2&&addRight==1)
				begin
					if(zeroComplementRight+zeroLeft==0)type<=0;
					else if(zeroComplementRight==0||zeroLeft==0)type<=1;
					else type<=2;
				end
			else if((zeroLeft==3&&addLeft==1)||(zeroRight==3&&addRight==1))type<=1;
			else type<=0;
		end
end



endmodule
