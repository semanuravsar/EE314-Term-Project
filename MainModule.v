module MainModule(clk,start,si_1,si_0,b1,b2,b3,b4,st,clk_on,data_compp,read_dataaa, Db1, Db2, Db3, 
Db4, Tb1, Tb2, Tb3, Tb4, Rb1, Rb2, Rb3, Rb4, readPacket, o_hsync, o_vsync, o_vga_blank, o_vga_sync, o_vga_clk,
o_red, o_blue, o_green);

input clk,start,si_1,si_0;
wire [17:0] buff1,buff2,buff3,buff4;
wire [2:0] state, read_dataa;
wire data_comp, clk_enn, hsync, vsync, vga_blank, vga_sync, vga_clk;
wire [3:0] dataa;
wire [4:0] packet_read;
wire [7:0] red, blue, green;
wire Dbuffer_1, Dbuffer_2, Dbuffer_3, Dbuffer_4, Rbuffer_1, Rbuffer_2, Rbuffer_3, Rbuffer_4, Tbuffer_1, Tbuffer_2, Tbuffer_3, Tbuffer_4;
output reg [17:0] b1,b2,b3,b4;
output reg [2:0] st, read_dataaa;
output reg clk_on, data_compp, o_hsync, o_vsync, o_vga_blank, o_vga_sync, o_vga_clk;
output reg Db1, Db2, Db3, Db4, Tb1, Tb2, Tb3, Tb4, Rb1, Rb2, Rb3, Rb4;
output reg [4:0] readPacket;
output reg [7:0] o_red, o_blue, o_green;

collect_input u1(.clk (clk),.start (start), .si_1 (si_1), .si_0 (si_0), .data_output (dataa), .data_completed (data_comp));

buffer_dist3 u2(.clk (clk), .data (dataa), .data_completed (data_comp), .buffer1 (buff1), .buffer2 (buff2), .buffer3 (buff3), .buffer4 (buff4)
, .read_data (read_dataa), .packet_read(packet_read) , .Dbuffer_1(Dbuffer_1) , .Dbuffer_2(Dbuffer_2) , .Dbuffer_3(Dbuffer_3) , .Dbuffer_4(Dbuffer_4) 
, .Rbuffer_1(Rbuffer_1) , .Rbuffer_2(Rbuffer_2), .Rbuffer_3(Rbuffer_3), .Rbuffer_4(Rbuffer_4), .Tbuffer_1(Tbuffer_1), .Tbuffer_2(Tbuffer_2)
, .Tbuffer_3(Tbuffer_3), .Tbuffer_4(Tbuffer_4));

read_data_m u3(.buffer1 (buff1), .buffer2 (buff2), .buffer3 (buff3), .buffer4 (buff4), .clk (clk), .read_data (read_dataa), .current_state (state), .clk_en (clk_enn));

VGA_P u4( .clk(clk), .o_hsync(hsync), .o_vsync(vsync), .vga_blank(vga_blank), .vga_sync(vga_sync), .vga_clk(vga_clk), 
.o_red(red), .o_blue(blue), .o_green(green), .b1(buff1), .b2(buff2), .b3(buff3), .b4(buff4), .out(packet_read),
.TPulse1(Tbuffer_1), .TPulse2(Tbuffer_2), .TPulse3(Tbuffer_3), .TPulse4(Tbuffer_4), .RPulse1(Rbuffer_1), .RPulse2(Rbuffer_2),
 .RPulse3(Rbuffer_3), .RPulse4(Rbuffer_4), .DPulse1(Dbuffer_1), .DPulse2(Dbuffer_2), .DPulse3(Dbuffer_3), .DPulse4(Dbuffer_4) );

always @(posedge clk)
begin
   b1 <= buff1;
	b2 <= buff2;
	b3 <= buff3;
	b4 <= buff4;
	st <= state;
	clk_on <= clk_enn;
	data_compp <= data_comp;
	read_dataaa <= read_dataa;
	Db1 <= Dbuffer_1;
	Db2 <= Dbuffer_2;
	Db3 <= Dbuffer_3;
	Db4 <= Dbuffer_4;
	Tb1 <= Tbuffer_1;
	Tb2 <= Tbuffer_2;
	Tb3 <= Tbuffer_3;
	Tb4 <= Tbuffer_4;
	Rb1 <= Rbuffer_1;
	Rb2 <= Rbuffer_2;
	Rb3 <= Rbuffer_3;
	Rb4 <= Rbuffer_4;
	readPacket <= packet_read;
	o_blue <= blue;
	o_red <= red;
	o_green <= green;
	o_hsync <= hsync;
	o_vsync <= vsync;
	o_vga_blank <= vga_blank;
	o_vga_sync <= vga_sync;
	o_vga_clk <= vga_clk;
end

endmodule
