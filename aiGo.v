`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:50:00 01/04/2019 
// Design Name: 
// Module Name:    aiGo 
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
module aiGo(reset,clk,humanIn,enable,AIOut,finish,x,y);//,SCAI,SCHM,LOCAI,LOCHM,outState,valid,
//isEmpty,MAXAI,MAXHM);//,//ata,ath,bta,bth,cta,cth,dta,dth,tt,temp);
input wire clk,enable;
input wire reset;
input wire [224:0] humanIn; 
output wire [224:0] AIOut;
output wire finish;
output reg[3:0]x,y;
//output wire[31:0] SCAI,SCHM;
//output wire[8:0] tt;
//output wire [2:0] ata,ath,bta,bth,cta,cth,dta,dth;
//output wire [8:0]outState;
//output wire [8:0]temp;
//output wire [9:0] LOCAI,LOCHM;
//output wire [31:0] MAXAI,MAXHM;
//output wire isEmpty;
//output wire valid;

reg isFinished;
reg [224:0]AI;
reg [9:0] target;
reg empty;
reg [9:0] humanPos;
reg [9:0] aiPos;
reg state;
reg [31:0] maxAi,maxHm,maxHmForAi,maxAiForHm;
reg [31:0] sumAi,sumHm;
reg [8:0] aAi,aHm,bAi,bHm,cAi,cHm,dAi,dHm,aAit,aHmt,bAit,bHmt,cAit,cHmt,dAit,dHmt;
wire [2:0] aTypeAi,aTypeHm,bTypeAi,bTypeHm,cTypeAi,cTypeHm,dTypeAi,dTypeHm;
wire [31:0] aValueAi,aValueHm,bValueAi,bValueHm,cValueAi,cValueHm,dValueAi,dValueHm;
reg firstIn;
reg firstValid;
reg jgClk;

/*
assign temp=aAit;
assign ata=aTypeAi;
assign ath=aTypeHm;
assign bta=bTypeAi;
assign bth=bTypeHm;
assign cta=cTypeAi;
assign cth=cTypeHm;
assign dta=dTypeAi;
assign dth=dTypeHm;
assign tt=target;*/
/*
assign outState=target;
assign LOCAI=aiPos;
assign LOCHM=humanPos;
assign SCAI=sumAi;
assign SCHM=sumHm;
assign valid=firstValid;
assign isEmpty=empty;
assign MAXAI=maxAi;
assign MAXHM=maxHm;
*/

assign AIOut[224:0]=AI[224:0];
assign finish=isFinished;
//module judgeChessForm(input wire	[8:0]A,input wire [8:0]B,output wire [2:0]typeOut);
judgeChessForm aAiJudge(jgClk,aAi,aHmt,aTypeAi);
judgeChessForm aHmJudge(jgClk,aHm,aAit,aTypeHm);
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
judgeChessForm bAiJudge(jgClk,bAi,bHmt,bTypeAi);
judgeChessForm bHmJudge(jgClk,bHm,bAit,bTypeHm);
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
judgeChessForm cAiJudge(jgClk,cAi,cHmt,cTypeAi);
judgeChessForm cHmJudge(jgClk,cHm,cAit,cTypeHm);
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
judgeChessForm dAiJudge(jgClk,dAi,dHmt,dTypeAi);
judgeChessForm dHmJudge(jgClk,dHm,dAit,dTypeHm);
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
evaluate aAiEva(aTypeAi,aValueAi);
evaluate aHmEva(aTypeHm,aValueHm);
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
evaluate bAiEva(bTypeAi,bValueAi);
evaluate bHmEva(bTypeHm,bValueHm);
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
evaluate cAiEva(cTypeAi,cValueAi);
evaluate cHmEva(cTypeHm,cValueHm);
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
evaluate dAiEva(dTypeAi,dValueAi);
evaluate dHmEva(dTypeHm,dValueHm);



integer row,col;
integer i,j,k;

always @(posedge clk or negedge reset)
begin

	if(!reset)
		begin//0
			firstIn<=1;
			AI<=0;
			AI[112]<=1;
			isFinished<=0;
		end//0
	else if(enable)
		begin//1
			if(firstIn==1)
				begin//2
					x<=7;
					y<=7;
					isFinished<=1;
					firstIn<=0;
				end//2
			else
				begin//3
					if(isFinished)
						begin
							target<=0;
							isFinished<=0;
							state<=0;
							firstValid<=1;
							jgClk<=0;
						end
					else
						begin//4
							if(state==0)
								begin//ZZ
									if(target==225)
										begin
											if(maxAi>maxHm)
												begin
													AI[aiPos]<=1;
													x<=aiPos/15;
													y<=aiPos%15;
												end
											else
												begin
													AI[humanPos]<=1;
													x<=humanPos/15;
													y<=humanPos%15;
												end
											 isFinished<=1;
											 target<=0;
										end
									else 
										begin//yy
											empty<=0;
											if(humanIn[target]==0&&AI[target]==0)
												begin//xx
													empty<=1;
													row=target/15;
													col=target%15;
														//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
														for(i=-4;i<=4;i=i+1)
														if(col+i<0||col+i>14)
															begin
																aHmt[i+4]<=1;
																aAit[i+4]<=1;
																aHm[i+4]<=0;
																aAi[i+4]<=0;
															end
														else 
															begin
																if(i==0)
																	begin
																		aHm[i+4]<=1;
																		aAi[i+4]<=1;
																		aHmt[i+4]<=0;
																		aAit[i+4]<=0;
																	end
																else
																	begin
																		aHm[i+4]<=humanIn[target+i];
																		aHmt[i+4]<=humanIn[target+i];
																		aAi[i+4]<=AI[target+i];
																		aAit[i+4]<=AI[target+i];
																	end
															end
														//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
														for(i=-4;i<=4;i=i+1)
														if(row+i<0||row+i>14)
															begin
																bHmt[i+4]<=1;
																bAit[i+4]<=1;
																bHm[i+4]<=0;
																bAi[i+4]<=0;
															end
														else 
															begin
																if(i==0)
																	begin
																		bHm[i+4]<=1;
																		bAi[i+4]<=1;
																		bHmt[i+4]<=0;
																		bAit[i+4]<=0;
																	end
																else
																	begin
																		bHm[i+4]<=humanIn[target+i*15];
																		bHmt[i+4]<=humanIn[target+i*15];
																		bAi[i+4]<=AI[target+i*15];
																		bAit[i+4]<=AI[target+i*15];
																	end
															end
														//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
														for(i=-4;i<=4;i=i+1)
														if(row+i<0||row+i>14||col+i<0||col+i>14)
															begin
																cHmt[i+4]<=1;
																cAit[i+4]<=1;
																cHm[i+4]<=0;
																cAi[i+4]<=0;
															end
														else 
															begin
																if(i==0)
																	begin
																		cHm[i+4]<=1;
																		cAi[i+4]<=1;
																		cHmt[i+4]<=0;
																		cAit[i+4]<=0;
																	end
																else
																	begin
																		cHm[i+4]<=humanIn[target+i*15+i];
																		cHmt[i+4]<=humanIn[target+i*15+i];
																		cAi[i+4]<=AI[target+i*15+i];
																		cAit[i+4]<=AI[target+i*15+i];
																	end
															end
														//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
														for(i=-4;i<=4;i=i+1)
														if(row+i<0||row+i>14||col-i<0||col-i>14)
															begin
																dHmt[i+4]<=1;
																dAit[i+4]<=1;
																dHm[i+4]<=0;
																dAi[i+4]<=0;
															end
														else 
															begin
																if(i==0)
																	begin
																		dHm[i+4]<=1;
																		dAi[i+4]<=1;
																		dHmt[i+4]<=0;
																		dAit[i+4]<=0;
																	end
																else
																	begin
																		dHm[i+4]<=humanIn[target+i*15-i];
																		dHmt[i+4]<=humanIn[target+i*15-i];
																		dAi[i+4]<=AI[target+i*15-i];
																		dAit[i+4]<=AI[target+i*15-i];
																	end
															end
														//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
														jgClk<=1;
												end//xx
												state<=~state;
												target<=target+1;
										end//yy	
									end//ZZ
								else 
									begin//AA
										if(empty==1)
												begin
													sumAi=aValueAi+bValueAi+cValueAi+dValueAi;
													sumHm=aValueHm+bValueHm+cValueHm+dValueHm;
													if(firstValid)
														begin
															maxAi<=sumAi;
															maxAiForHm<=sumAi;
															maxHm<=sumHm;
															maxHmForAi<=sumHm;
															aiPos<=target-1;
															humanPos<=target-1;
															firstValid<=0;
														end
													else 
														begin
															if(sumAi>maxAi||(sumAi==maxAi&&sumHm>maxHmForAi))
																begin
																	maxAi<=sumAi;
																	maxHmForAi<=sumHm;
																	aiPos<=target-1;
																end
															if(sumHm>maxHm||(sumHm==maxHm&&sumAi>maxAiForHm))
																begin
																	maxHm<=sumHm;
																	maxAiForHm<=sumAi;
																	humanPos<=target-1;
																end
														end
												end
												jgClk<=0;
												state<=~state;
									end//AA
						end//4
				end//3
		
		
		end//1
end
endmodule 
