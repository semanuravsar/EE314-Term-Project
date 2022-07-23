module collect_input(clk,start,si_1,si_0,data_output,data_completed);
input clk,start,si_1,si_0;
reg [2:0] counter;
output reg [3:0] data_output;
output reg data_completed;

integer start_counter, si_1_counter, si_0_counter;


initial
begin
counter=3'b000;
data_output=4'b0000;
data_completed=1'b0;
start_counter='d0;
si_1_counter='d0;
si_0_counter='d0;
end

always @(posedge clk) begin
	if (start == 0 && start_counter < 'd3) begin
			start_counter <= start_counter + 'd1;
	end else if (start == 1) begin
			start_counter <= 0;
	end
		
	if (si_1 == 0 && si_1_counter < 'd3 ) begin
		si_1_counter <= si_1_counter + 'd1;
	end else if (si_1 == 1) begin
		si_1_counter <= 'd0;
	end	
	
	if (si_0 == 0 && si_0_counter < 'd3 ) begin
		si_0_counter <= si_0_counter + 'd1;
	end else if (si_0 == 1) begin
		si_0_counter <= 'd0;
	end	
end

always@(posedge clk)
begin

	if(start_counter=='d2)
	counter<=3'b001;
	
	if(si_1_counter=='d2)
	begin
		if(counter==3'b001 || counter==3'b010||counter==3'b011||counter==3'b100)
		begin
		data_output={data_output[2:0],1'b1};
		counter<=counter+3'b001;
		end
	end

	if(si_0_counter=='d2)
	begin
		if(counter==3'b001 || counter==3'b010||counter==3'b011||counter==3'b100)
		begin
		data_output={data_output[2:0],1'b0};
		counter<=counter+3'b001;
		end
	end	
	
	if(counter==3'b100 && (si_1_counter=='d2 || si_0_counter=='d2))
	begin
	data_completed<=1'b1;
	counter<=counter+3'b001;
	end
	else
	data_completed=1'b0;
	
end
endmodule 