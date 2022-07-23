module buffer_dist3(clk,data,data_completed,
buffer1,
buffer2,
buffer3,
buffer4,
read_data,
packet_read, Dbuffer_1, Dbuffer_2, Dbuffer_3, Dbuffer_4, Tbuffer_1, 
Tbuffer_2, Tbuffer_3, Tbuffer_4, Rbuffer_1, Rbuffer_2, Rbuffer_3, Rbuffer_4);

input clk,data_completed;
wire data_read;
input [2:0] read_data;
input[3:0] data;
output reg [17:0] buffer1;
output reg [17:0] buffer2;
output reg [17:0] buffer3;
output reg [17:0] buffer4;
output reg [4:0] packet_read;
output reg Dbuffer_1, Dbuffer_2, Dbuffer_3, Dbuffer_4, Tbuffer_1, Tbuffer_2, Tbuffer_3, Tbuffer_4, Rbuffer_1, Rbuffer_2, Rbuffer_3, Rbuffer_4;


assign data_read = read_data[2];

initial
begin
buffer1=18'b0;
buffer2=18'b0;
buffer3=18'b0;
buffer4=18'b0;
Dbuffer_1=1'b0;
Dbuffer_2=1'b0;
Dbuffer_3=1'b0;
Dbuffer_4=1'b0;
Rbuffer_1=1'b0;
Rbuffer_2=1'b0;
Rbuffer_3=1'b0;
Rbuffer_4=1'b0;
Tbuffer_1=1'b0;
Tbuffer_2=1'b0;
Tbuffer_3=1'b0;
Tbuffer_4=1'b0;
packet_read=5'b0;
end

always@ (posedge clk)

begin

if (data_completed==1)
begin
   
	Tbuffer_1 <= 1'b0;
   Tbuffer_2 <= 1'b0;
   Tbuffer_3 <= 1'b0;
   Tbuffer_4 <= 1'b0;
	
	if(data[3:2]==2'b00)
	begin
	   Rbuffer_1 <= 1'b1;
		if(buffer1[2]==0)
		begin
		buffer1[1]<=data[1];
		buffer1[0]<=data[0];
		buffer1[2]<=1;
		end else if (buffer1[5]==0)
		begin
		buffer1[4]<=data[1];
		buffer1[3]<=data[0];
		buffer1[5]<=1;	
		end else if (buffer1[8]==0)
		begin
		buffer1[7]<=data[1];
		buffer1[6]<=data[0];
		buffer1[8]<=1;
		end else if (buffer1[11]==0)
		begin
		buffer1[10]<=data[1];
		buffer1[9]<=data[0];
		buffer1[11]<=1;			
		end else if (buffer1[14]==0)		
		begin
		buffer1[13]<=data[1];
		buffer1[12]<=data[0];
		buffer1[14]<=1;			
		end else if (buffer1[17]==0)	
		begin
		buffer1[16]<=data[1];
		buffer1[15]<=data[0];
		buffer1[17]<=1;			
		end else
		begin
		buffer1[1]<=buffer1[4];
		buffer1[0]<=buffer1[3];
		buffer1[2]<=1;	
		
		buffer1[4]<=buffer1[7];
		buffer1[3]<=buffer1[6];
		buffer1[5]<=1;
		
		buffer1[7]<=buffer1[10];
		buffer1[6]<=buffer1[9];
		buffer1[8]<=1;	
		
		buffer1[10]<=buffer1[13];
		buffer1[9]<=buffer1[12];
		buffer1[11]<=1;
		
		buffer1[13]<=buffer1[16];
		buffer1[12]<=buffer1[15];
		buffer1[14]<=1;
		
		buffer1[16]<=data[1];
		buffer1[15]<=data[0];
		buffer1[17]<=1;	
		
		Dbuffer_1 <= 1'b1;
		end
		
		
	end else if(data[3:2]==2'b01)
	begin
	   Rbuffer_2 <= 1'b1;
		if(buffer2[2]==0)
		begin
		buffer2[1]<=data[1];
		buffer2[0]<=data[0];
		buffer2[2]<=1;
		end else if (buffer2[5]==0)
		begin
		buffer2[4]<=data[1];
		buffer2[3]<=data[0];
		buffer2[5]<=1;	
		end else if (buffer2[8]==0)
		begin
		buffer2[7]<=data[1];
		buffer2[6]<=data[0];
		buffer2[8]<=1;
		end else if (buffer2[11]==0)
		begin
		buffer2[10]<=data[1];
		buffer2[9]<=data[0];
		buffer2[11]<=1;			
		end else if (buffer2[14]==0)		
		begin
		buffer2[13]<=data[1];
		buffer2[12]<=data[0];
		buffer2[14]<=1;			
		end else if (buffer2[17]==0)	
		begin
		buffer2[16]<=data[1];
		buffer2[15]<=data[0];
		buffer2[17]<=1;			
		end else
		begin
		buffer2[1]<=buffer2[4];
		buffer2[0]<=buffer2[3];
		buffer2[2]<=1;	
		
		buffer2[4]<=buffer2[7];
		buffer2[3]<=buffer2[6];
		buffer2[5]<=1;
		
		buffer2[7]<=buffer2[10];
		buffer2[6]<=buffer2[9];
		buffer2[8]<=1;	
		
		buffer2[10]<=buffer2[13];
		buffer2[9]<=buffer2[12];
		buffer2[11]<=1;
		
		buffer2[13]<=buffer2[16];
		buffer2[12]<=buffer2[15];
		buffer2[14]<=1;
		
		buffer2[16]<=data[1];
		buffer2[15]<=data[0];
		buffer2[17]<=1;
	   
	   Dbuffer_2 <= 1'b1;	
		end
		
	end else if(data[3:2]==2'b10)
	begin
	   Rbuffer_3 <= 1'b1;
		if(buffer3[2]==0)
		begin
		buffer3[1]<=data[1];
		buffer3[0]<=data[0];
		buffer3[2]<=1;
		end else if (buffer3[5]==0)
		begin
		buffer3[4]<=data[1];
		buffer3[3]<=data[0];
		buffer3[5]<=1;	
		end else if (buffer3[8]==0)
		begin
		buffer3[7]<=data[1];
		buffer3[6]<=data[0];
		buffer3[8]<=1;
		end else if (buffer3[11]==0)
		begin
		buffer3[10]<=data[1];
		buffer3[9]<=data[0];
		buffer3[11]<=1;			
		end else if (buffer3[14]==0)		
		begin
		buffer3[13]<=data[1];
		buffer3[12]<=data[0];
		buffer3[14]<=1;			
		end else if (buffer3[17]==0)	
		begin
		buffer3[16]<=data[1];
		buffer3[15]<=data[0];
		buffer3[17]<=1;			
		end else
		begin
		buffer3[1]<=buffer3[4];
		buffer3[0]<=buffer3[3];
		buffer3[2]<=1;	
		
		buffer3[4]<=buffer3[7];
		buffer3[3]<=buffer3[6];
		buffer3[5]<=1;
		
		buffer3[7]<=buffer3[10];
		buffer3[6]<=buffer3[9];
		buffer3[8]<=1;	
		
		buffer3[10]<=buffer3[13];
		buffer3[9]<=buffer3[12];
		buffer3[11]<=1;
		
		buffer3[13]<=buffer3[16];
		buffer3[12]<=buffer3[15];
		buffer3[14]<=1;
		
		buffer3[16]<=data[1];
		buffer3[15]<=data[0];
		buffer3[17]<=1;	
		
		Dbuffer_3 <= 1'b1;
		end
		
		
	end else
	begin
	   Rbuffer_4 <= 1'b1;
		if(buffer4[2]==0)
		begin
		buffer4[1]<=data[1];
		buffer4[0]<=data[0];
		buffer4[2]<=1;
		end else if (buffer4[5]==0)
		begin
		buffer4[4]<=data[1];
		buffer4[3]<=data[0];
		buffer4[5]<=1;	
		end else if (buffer4[8]==0)
		begin
		buffer4[7]<=data[1];
		buffer4[6]<=data[0];
		buffer4[8]<=1;
		end else if (buffer4[11]==0)
		begin
		buffer4[10]<=data[1];
		buffer4[9]<=data[0];
		buffer4[11]<=1;			
		end else if (buffer4[14]==0)		
		begin
		buffer4[13]<=data[1];
		buffer4[12]<=data[0];
		buffer4[14]<=1;			
		end else if (buffer4[17]==0)	
		begin
		buffer4[16]<=data[1];
		buffer4[15]<=data[0];
		buffer4[17]<=1;			
		end else
		begin
		buffer4[1]<=buffer4[4];
		buffer4[0]<=buffer4[3];
		buffer4[2]<=1;	
		
		buffer4[4]<=buffer4[7];
		buffer4[3]<=buffer4[6];
		buffer4[5]<=1;
		
		buffer4[7]<=buffer4[10];
		buffer4[6]<=buffer4[9];
		buffer4[8]<=1;	
		
		buffer4[10]<=buffer4[13];
		buffer4[9]<=buffer4[12];
		buffer4[11]<=1;
		
		buffer4[13]<=buffer4[16];
		buffer4[12]<=buffer4[15];
		buffer4[14]<=1;
		
		buffer4[16]<=data[1];
		buffer4[15]<=data[0];
		buffer4[17]<=1;	
		
		Dbuffer_4 <= 1'b1;
		end
		
		
	end

end 

else if(data_read==1)
begin

   Dbuffer_1 <= 1'b0;
	Dbuffer_2 <= 1'b0;
	Dbuffer_3 <= 1'b0;
	Dbuffer_4 <= 1'b0;
	Rbuffer_1 <= 1'b0;
	Rbuffer_2 <= 1'b0;
	Rbuffer_3 <= 1'b0;
	Rbuffer_4 <= 1'b0;
	
	if (read_data[1:0]==2'b00)
	begin
	
	   Tbuffer_1 <= 1'b1;

		buffer1[1]<=buffer1[4];
		buffer1[0]<=buffer1[3];
		buffer1[2]<=buffer1[5];	
		
		buffer1[4]<=buffer1[7];
		buffer1[3]<=buffer1[6];
		buffer1[5]<=buffer1[8];
		
		buffer1[7]<=buffer1[10];
		buffer1[6]<=buffer1[9];
		buffer1[8]<=buffer1[11];	
		
		buffer1[10]<=buffer1[13];
		buffer1[9]<=buffer1[12];
		buffer1[11]<=buffer1[14];
		
		buffer1[13]<=buffer1[16];
		buffer1[12]<=buffer1[15];
		buffer1[14]<=buffer1[17];
		
		buffer1[16]<=1'b0;
		buffer1[15]<=1'b0;
		buffer1[17]<=0;	
		 
		packet_read[4] = 1'b1;
		packet_read[3:2] = 2'b00;
		packet_read[1:0] = buffer1[1:0];
		
	end else if (read_data[1:0]==2'b01)
	begin
	
	   Tbuffer_2 <= 1'b1;
		
		buffer2[1]<=buffer2[4];
		buffer2[0]<=buffer2[3];
		buffer2[2]<=buffer2[5];	
		
		buffer2[4]<=buffer2[7];
		buffer2[3]<=buffer2[6];
		buffer2[5]<=buffer2[8];
		
		buffer2[7]<=buffer2[10];
		buffer2[6]<=buffer2[9];
		buffer2[8]<=buffer2[11];	
		
		buffer2[10]<=buffer2[13];
		buffer2[9]<=buffer2[12];
		buffer2[11]<=buffer2[14];
		
		buffer2[13]<=buffer2[16];
		buffer2[12]<=buffer2[15];
		buffer2[14]<=buffer2[17];
		
		buffer2[16]<=1'b0;
		buffer2[15]<=1'b0;
		buffer2[17]<=0;	
		
		packet_read[4] = 1'b1;
		packet_read[3:2] = 2'b01;
		packet_read[1:0] = buffer2[1:0];
		
	end else if (read_data[1:0]==2'b10)
	begin
	
	   Tbuffer_3 <= 1'b1;
		
		buffer3[1]<=buffer3[4];
		buffer3[0]<=buffer3[3];
		buffer3[2]<=buffer3[5];	
		
		buffer3[4]<=buffer3[7];
		buffer3[3]<=buffer3[6];
		buffer3[5]<=buffer3[8];
		
		buffer3[7]<=buffer3[10];
		buffer3[6]<=buffer3[9];
		buffer3[8]<=buffer3[11];	
		
		buffer3[10]<=buffer3[13];
		buffer3[9]<=buffer3[12];
		buffer3[11]<=buffer3[14];
		
		buffer3[13]<=buffer3[16];
		buffer3[12]<=buffer3[15];
		buffer3[14]<=buffer3[17];
		
		buffer3[16]<=1'b0;
		buffer3[15]<=1'b0;
		buffer3[17]<=0;	
		
		packet_read[4] = 1'b1;
		packet_read[3:2] = 2'b10;
		packet_read[1:0] = buffer3[1:0];
		
	end else 
	begin
	
	   Tbuffer_4 <= 1'b1;
		
		buffer4[1]<=buffer4[4];
		buffer4[0]<=buffer4[3];
		buffer4[2]<=buffer4[5];	
		
		buffer4[4]<=buffer4[7];
		buffer4[3]<=buffer4[6];
		buffer4[5]<=buffer4[8];
		
		buffer4[7]<=buffer4[10];
		buffer4[6]<=buffer4[9];
		buffer4[8]<=buffer4[11];	
		
		buffer4[10]<=buffer4[13];
		buffer4[9]<=buffer4[12];
		buffer4[11]<=buffer4[14];
		
		buffer4[13]<=buffer4[16];
		buffer4[12]<=buffer4[15];
		buffer4[14]<=buffer4[17];
		
		buffer4[16]<=1'b0;
		buffer4[15]<=1'b0;
		buffer4[17]<=0;	
		
		packet_read[4] = 1'b1;
		packet_read[3:2] = 2'b11;
		packet_read[1:0] = buffer4[1:0];
		
	end
end	

else
begin
	Dbuffer_1=1'b0;
   Dbuffer_2=1'b0;
	Dbuffer_3=1'b0;
	Dbuffer_4=1'b0;
	Rbuffer_1=1'b0;
	Rbuffer_2=1'b0;
	Rbuffer_3=1'b0;
	Rbuffer_4=1'b0;
	Tbuffer_1=1'b0;
	Tbuffer_2=1'b0;
	Tbuffer_3=1'b0;
	Tbuffer_4=1'b0;
end
end

endmodule

