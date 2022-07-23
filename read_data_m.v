module read_data_m(buffer1, buffer2, buffer3, buffer4, clk,read_data,current_state,clk_en);

input [17:0] buffer1, buffer2, buffer3, buffer4;
input clk;
output reg [2:0] read_data;
integer counter;

output reg clk_en;
output reg [2:0] current_state;

parameter st_0 = 3'b0;
parameter st_1 = 3'b001;
parameter st_2 = 3'b010;
parameter st_3 = 3'b011;
parameter st_4 = 3'b100;

initial
begin
current_state = st_0;
counter = 0;
clk_en = 1'b0;
read_data = 3'b0;
end

always @(posedge clk)
begin

counter <= counter + 1;

if(current_state==0)
begin
   counter <= 0;
	clk_en <= 1'b0;
end
else if( counter == 149999999)
begin
   counter <= 0;
	clk_en <= 1'b1;
end else
begin
   clk_en <= 1'b0;
end


if(buffer1[2] == 1'b0 && buffer2[2] == 1'b0 && buffer3[2] == 1'b0 && buffer4[2] == 1'b0)
begin
	current_state <= st_0;
	
end
else if(buffer1[2] != 1'b0 && buffer2[17] != 1'b1 && buffer3[17] != 1'b1 && buffer4[17] != 1'b1)
begin
	current_state <= st_1;
end
else if((buffer2[17] == 1'b1 && buffer3[17] != 1'b1 && buffer4[17] != 1'b1) || (buffer1[2] == 1'b0 && buffer2[2] != 1'b0 && buffer3[17] != 1'b1 && buffer4[17] != 1'b1))
begin
	current_state <= st_2;
end
else if((buffer3[17] == 1'b1 && buffer4[17] != 1'b1) || (buffer1[2] == 1'b0 && buffer2[2] == 1'b0 && buffer3[2] != 1'b0 && buffer4[17] != 1'b1))
begin
	current_state <= st_3;
end
else if((buffer4[17] == 1'b1) || (buffer1[2] == 1'b0 && buffer2[2] == 1'b0 && buffer3[2] == 1'b0 && buffer4[2] != 1'b0))
begin
	current_state <= st_4;
end

if(clk_en == 1'b0)
begin
   read_data[2] <= 1'b0;
end


if(current_state == st_0 && clk_en == 1'b1)
begin
   read_data[2] <= 1'b0;
end
else if(current_state == st_1 && clk_en == 1'b1)
begin
   read_data <= 3'b100;
end
else if(current_state == st_2 && clk_en == 1'b1)
begin
   read_data <= 3'b101;
end
else if(current_state == st_3 && clk_en == 1'b1)
begin
   read_data <= 3'b110;
end
else if(current_state == st_4 && clk_en == 1'b1)
begin
   read_data <= 3'b111;
end


end

endmodule
