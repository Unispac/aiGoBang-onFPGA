`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:15:17 12/31/2018 
// Design Name: 
// Module Name:    upper_left_to_lower_right 
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
module upper_left_to_lower_right(
	input wire [3:0] row,//上一步下棋的行数
	input wire [3:0] col,//上一步下棋的列数
	input wire [224:0] ch,//上一步下棋的棋手对应的棋面
	output reg win_check
    );
	always @(*) begin
		if(row >= col) 
			case(row-col)
			4'd0:
				if((ch[0]&&ch[16]&&ch[32]&ch[48]&&ch[64])||
					(ch[16]&&ch[32]&&ch[48]&&ch[64]&&ch[80])||
					(ch[96]&&ch[32]&&ch[48]&&ch[64]&&ch[80])||
					(ch[96]&&ch[112]&&ch[48]&&ch[64]&&ch[80])||
					(ch[96]&&ch[112]&&ch[128]&&ch[64]&&ch[80])||
					(ch[96]&&ch[112]&&ch[128]&&ch[144]&&ch[80])||
					(ch[96]&&ch[112]&&ch[128]&&ch[144]&&ch[160])||
					(ch[176]&&ch[112]&&ch[128]&&ch[144]&&ch[160])||
					(ch[176]&&ch[192]&&ch[128]&&ch[144]&&ch[160])||
					(ch[176]&&ch[192]&&ch[208]&&ch[144]&&ch[160])||
					(ch[176]&&ch[192]&&ch[208]&&ch[224]&&ch[160]))
					win_check =1'b1;
				else win_check = 1'b0;
			4'd1:
				if((ch[15]&&ch[31]&&ch[47]&&ch[63]&&ch[79])||
					(ch[31]&&ch[47]&&ch[63]&&ch[79]&&ch[95])||
					(ch[47]&&ch[63]&&ch[79]&&ch[95]&&ch[111])||
					(ch[63]&&ch[79]&&ch[95]&&ch[111]&&ch[127])||
					(ch[79]&&ch[95]&&ch[111]&&ch[127]&&ch[143])||
					(ch[95]&&ch[111]&&ch[127]&&ch[143]&&ch[159])||
					(ch[111]&&ch[127]&&ch[143]&&ch[159]&&ch[175])||
					(ch[127]&&ch[143]&&ch[159]&&ch[175]&&ch[191])||
					(ch[143]&&ch[159]&&ch[175]&&ch[191]&&ch[207])||
					(ch[159]&&ch[175]&&ch[191]&&ch[207]&&ch[223]))
					win_check =1'b1;
				else win_check = 1'b0;
			4'd2:
				if((ch[30]&&ch[46]&&ch[62]&&ch[78]&&ch[94])||
					(ch[46]&&ch[62]&&ch[78]&&ch[94]&&ch[110])||
					(ch[62]&&ch[78]&&ch[94]&&ch[110]&&ch[126])||
					(ch[78]&&ch[94]&&ch[110]&&ch[126]&&ch[142])||
					(ch[94]&&ch[110]&&ch[126]&&ch[142]&&ch[158])||
					(ch[110]&&ch[126]&&ch[142]&&ch[158]&&ch[174])||
					(ch[126]&&ch[142]&&ch[158]&&ch[174]&&ch[190])||
					(ch[142]&&ch[158]&&ch[174]&&ch[190]&&ch[206])||
					(ch[158]&&ch[174]&&ch[190]&&ch[206]&&ch[222]))
					win_check =1'b1;
				else win_check = 1'b0;
			4'd3:
				if((ch[45]&&ch[61]&&ch[77]&&ch[93]&&ch[109])||
					(ch[61]&&ch[77]&&ch[93]&&ch[109]&&ch[125])||
					(ch[77]&&ch[93]&&ch[109]&&ch[125]&&ch[141])||
					(ch[93]&&ch[109]&&ch[125]&&ch[141]&&ch[157])||
					(ch[109]&&ch[125]&&ch[141]&&ch[157]&&ch[173])||
					(ch[125]&&ch[141]&&ch[157]&&ch[173]&&ch[189])||
					(ch[141]&&ch[157]&&ch[173]&&ch[189]&&ch[205])||
					(ch[157]&&ch[173]&&ch[189]&&ch[205]&&ch[221]))
					win_check =1'b1;
				else win_check = 1'b0;
			4'd4:
				if((ch[60]&&ch[76]&&ch[92]&&ch[108]&&ch[124])||
					(ch[76]&&ch[92]&&ch[108]&&ch[124]&&ch[140])||
					(ch[92]&&ch[108]&&ch[124]&&ch[140]&&ch[156])||
					(ch[108]&&ch[124]&&ch[140]&&ch[156]&&ch[172])||
					(ch[124]&&ch[140]&&ch[156]&&ch[172]&&ch[188])||
					(ch[140]&&ch[156]&&ch[172]&&ch[188]&&ch[204])||
					(ch[156]&&ch[172]&&ch[188]&&ch[204]&&ch[220]))
					win_check =1'b1;
				else win_check = 1'b0;
			4'd5:
				if((ch[75]&&ch[91]&&ch[107]&&ch[123]&&ch[139])||
					(ch[91]&&ch[107]&&ch[123]&&ch[139]&&ch[155])||
					(ch[107]&&ch[123]&&ch[139]&&ch[155]&&ch[171])||
					(ch[123]&&ch[139]&&ch[155]&&ch[171]&&ch[187])||
					(ch[139]&&ch[155]&&ch[171]&&ch[187]&&ch[203])||
					(ch[155]&&ch[171]&&ch[187]&&ch[203]&&ch[219]))
					win_check =1'b1;
				else win_check = 1'b0;
			4'd6:
				if((ch[90]&&ch[106]&&ch[122]&&ch[138]&&ch[154])||
					(ch[106]&&ch[122]&&ch[138]&&ch[154]&&ch[170])||
					(ch[122]&&ch[138]&&ch[154]&&ch[170]&&ch[186])||
					(ch[138]&&ch[154]&&ch[170]&&ch[186]&&ch[202])||
					(ch[154]&&ch[170]&&ch[186]&&ch[202]&&ch[218]))
					win_check =1'b1;
				else win_check = 1'b0;
			4'd7:
				if((ch[105]&&ch[121]&&ch[137]&&ch[153]&&ch[169])||
					(ch[121]&&ch[137]&&ch[153]&&ch[169]&&ch[185])||
					(ch[137]&&ch[153]&&ch[169]&&ch[185]&&ch[201])||
					(ch[153]&&ch[169]&&ch[185]&&ch[201]&&ch[217]))
					win_check =1'b1;
				else win_check = 1'b0;
			4'd8:
				if((ch[120]&&ch[136]&&ch[152]&&ch[168]&&ch[184])||
					(ch[136]&&ch[152]&&ch[168]&&ch[184]&&ch[200])||
					(ch[152]&&ch[168]&&ch[184]&&ch[200]&&ch[216]))
					win_check =1'b1;
				else win_check = 1'b0;
			4'd9:
				if((ch[135]&&ch[151]&&ch[167]&&ch[183]&&ch[199])||
					(ch[151]&&ch[167]&&ch[183]&&ch[199]&&ch[215]))
					win_check =1'b1;
				else win_check = 1'b0;
			4'd10:
				if((ch[150]&&ch[166]&&ch[182]&&ch[198]&&ch[214]))
					win_check =1'b1;
				else win_check = 1'b0;
			default: win_check =1'b0;
			endcase
		else 
			case(col-row)
			4'd1:
				if((ch[1]&&ch[17]&&ch[33]&&ch[49]&&ch[65])||
					(ch[17]&&ch[33]&&ch[49]&&ch[65]&&ch[81])||
					(ch[33]&&ch[49]&&ch[65]&&ch[81]&&ch[97])||
					(ch[49]&&ch[65]&&ch[81]&&ch[97]&&ch[113])||
					(ch[65]&&ch[81]&&ch[97]&&ch[113]&&ch[129])||
					(ch[81]&&ch[97]&&ch[113]&&ch[129]&&ch[145])||
					(ch[97]&&ch[113]&&ch[129]&&ch[145]&&ch[161])||
					(ch[113]&&ch[129]&&ch[145]&&ch[161]&&ch[177])||
					(ch[129]&&ch[145]&&ch[161]&&ch[177]&&ch[193])||
					(ch[145]&&ch[161]&&ch[177]&&ch[193]&&ch[209]))
					win_check =1'b1;
				else win_check = 1'b0;
			4'd2:
				if((ch[2]&&ch[18]&&ch[34]&&ch[50]&&ch[66])||
					(ch[18]&&ch[34]&&ch[50]&&ch[66]&&ch[82])||
					(ch[34]&&ch[50]&&ch[66]&&ch[82]&&ch[98])||
					(ch[50]&&ch[66]&&ch[82]&&ch[98]&&ch[114])||
					(ch[66]&&ch[82]&&ch[98]&&ch[114]&&ch[130])||
					(ch[82]&&ch[98]&&ch[114]&&ch[130]&&ch[146])||
					(ch[98]&&ch[114]&&ch[130]&&ch[146]&&ch[162])||
					(ch[114]&&ch[130]&&ch[146]&&ch[162]&&ch[178])||
					(ch[130]&&ch[146]&&ch[162]&&ch[178]&&ch[194]))
					win_check =1'b1;
				else win_check = 1'b0;
			4'd3:
				if((ch[3]&&ch[19]&&ch[35]&&ch[51]&&ch[67])||
					(ch[19]&&ch[35]&&ch[51]&&ch[67]&&ch[83])||
					(ch[35]&&ch[51]&&ch[67]&&ch[83]&&ch[99])||
					(ch[51]&&ch[67]&&ch[83]&&ch[99]&&ch[115])||
					(ch[67]&&ch[83]&&ch[99]&&ch[115]&&ch[131])||
					(ch[83]&&ch[99]&&ch[115]&&ch[131]&&ch[147])||
					(ch[99]&&ch[115]&&ch[131]&&ch[147]&&ch[163])||
					(ch[115]&&ch[131]&&ch[147]&&ch[163]&&ch[179]))
					win_check =1'b1;
				else win_check = 1'b0;
			4'd4:
				if((ch[4]&&ch[20]&&ch[36]&&ch[52]&&ch[68])||
					(ch[20]&&ch[36]&&ch[52]&&ch[68]&&ch[84])||
					(ch[36]&&ch[52]&&ch[68]&&ch[84]&&ch[100])||
					(ch[52]&&ch[68]&&ch[84]&&ch[100]&&ch[116])||
					(ch[68]&&ch[84]&&ch[100]&&ch[116]&&ch[132])||
					(ch[84]&&ch[100]&&ch[116]&&ch[132]&&ch[148])||
					(ch[100]&&ch[116]&&ch[132]&&ch[148]&&ch[164]))
					win_check =1'b1;
				else win_check = 1'b0;
			4'd5:
				if((ch[5]&&ch[21]&&ch[37]&&ch[53]&&ch[69])||
					(ch[21]&&ch[37]&&ch[53]&&ch[69]&&ch[85])||
					(ch[37]&&ch[53]&&ch[69]&&ch[85]&&ch[101])||
					(ch[53]&&ch[69]&&ch[85]&&ch[101]&&ch[117])||
					(ch[69]&&ch[85]&&ch[101]&&ch[117]&&ch[133])||
					(ch[85]&&ch[101]&&ch[117]&&ch[133]&&ch[149]))
					win_check = 1'b1;
				else win_check = 1'b0;
			4'd6:
				if((ch[6]&&ch[22]&&ch[38]&&ch[54]&&ch[70])||
					(ch[22]&&ch[38]&&ch[54]&&ch[70]&&ch[86])||
					(ch[38]&&ch[54]&&ch[70]&&ch[86]&&ch[102])||
					(ch[54]&&ch[70]&&ch[86]&&ch[102]&&ch[118])||
					(ch[70]&&ch[86]&&ch[102]&&ch[118]&&ch[134]))
					win_check =1'b1;
				else win_check = 1'b0;
			4'd7:
				if((ch[7]&&ch[23]&&ch[39]&&ch[55]&&ch[71])||
					(ch[23]&&ch[39]&&ch[55]&&ch[71]&&ch[87])||
					(ch[39]&&ch[55]&&ch[71]&&ch[87]&&ch[103])||
					(ch[55]&&ch[71]&&ch[87]&&ch[103]&&ch[119]))
					win_check = 1'b1;
				else win_check = 1'b0;
			4'd8:
				if((ch[8]&&ch[24]&&ch[40]&&ch[56]&&ch[72])||
					(ch[24]&&ch[40]&&ch[56]&&ch[72]&&ch[88])||
					(ch[40]&&ch[56]&&ch[72]&&ch[88]&&ch[104]))
					win_check = 1'b1;
				else win_check = 1'b0;
			4'd9:
				if((ch[9]&&ch[25]&&ch[41]&&ch[57]&&ch[73])||
					(ch[25]&&ch[41]&&ch[57]&&ch[73]&&ch[89]))
					win_check =1'b1;
				else win_check = 1'b0;
			4'd10:
				if((ch[10]&&ch[26]&&ch[42]&&ch[58]&&ch[74]))
					win_check =1'b1;
				else win_check = 1'b0;
			default: win_check = 1'b0;
			endcase
	end
endmodule
