module VGA_P(
	input clk, output o_hsync,	output o_vsync, output vga_blank, output vga_sync,	output vga_clk, output [7:0] o_red,	output [7:0] o_blue,
	output [7:0] o_green, input [17:0] b1,	input [17:0] b2, input [17:0] b3, input [17:0] b4, input [4:0] out, input DPulse1,
	input DPulse2, input DPulse3, input DPulse4, input RPulse1, input RPulse2, input RPulse3, input RPulse4, input TPulse1,
	input TPulse2, input TPulse3, input TPulse4
);

	reg [9:0] counter_x = 0;  // horizontal counter
	reg [9:0] counter_y = 0;  // vertical counter
	reg [7:0] r_red = 0;
	reg [7:0] r_blue = 0;
	reg [7:0] r_green = 0;
	
	integer Rt_1 =0, Rt_2 =0, Rt_3 =0, Tt_1 =0, Tt_2 =0, Tt_3 =0, Dt_1 =0, Dt_2 =0, Dt_3 =0, R1_1 =0, R1_2 =0, R1_3 =0, R2_1 =0, 
	R2_2 =0, R2_3 =0,	R3_1 =0, R3_2 =0, R3_3 =0, R4_1 =0, R4_2 =0, R4_3 =0, T1_1 =0, T1_2 =0, T1_3 =0, T2_1 =0, T2_2 =0, T2_3 =0,
	T3_1 =0, T3_2 =0, T3_3 =0, T4_1 =0, T4_2 =0, T4_3 =0, D1_1 =0, D1_2 =0, D1_3 =0, D2_1 =0, D2_2 =0, D2_3 =0,	D3_1 =0, D3_2 =0,
	D3_3 =0, D4_1 =0, D4_2 =0, D4_3 =0;
	integer show =0;
	
	assign vga_blank = 1'b1;
	assign vga_sync = 1'b0;
	reg clk25MHz=0;

	always @(posedge clk)
	begin
	clk25MHz = ~clk25MHz;
	end

	
	assign vga_clk = clk25MHz;

	always @(posedge clk25MHz) 
		begin 
			if (counter_x < 799)
				counter_x <= counter_x + 1;   
			else
				counter_x <= 0;              
		end 
	
	always @ (posedge clk25MHz)
		begin 
			if (counter_x == 799) 
				begin
					if (counter_y < 525)  
						counter_y <= counter_y + 1;
					else
						counter_y <= 0;              
				end  
		end  
		
	
	assign o_hsync = (counter_x >= 0 && counter_x < 96) ? 1:0;  	
	assign o_vsync = (counter_y >= 0 && counter_y < 2) ? 1:0;  
	
	always @(posedge clk)
	begin
		
		if(RPulse1 == 1'b1 || RPulse2 == 1'b1 || RPulse3 == 1'b1 || RPulse4 == 1'b1)
		begin
		   if ( Rt_1 != 9 )
			begin
				Rt_1 <= Rt_1 + 1;
			end
			else
			begin
				if ( Rt_2 != 9 )
				begin
					Rt_2 <= Rt_2 + 1;
					Rt_1 <= 0;
				end
				else
				begin
					if ( Rt_3 != 9 )
					begin
						Rt_3 <= Rt_3 + 1;
						Rt_1 <= 0; Rt_2 <= 0;
					end
					else
					begin
						Rt_1 <= 0; Rt_2 <= 0; Rt_3 <= 0;
					end
				end
			end
			
		end
		
		
		if(TPulse1 == 1'b1 || TPulse2 == 1'b1 || TPulse3 == 1'b1 || TPulse4 == 1'b1)
		begin
		   if ( Tt_1 != 9 )
			begin
				Tt_1 <= Tt_1 + 1;
			end
			else
			begin
				if ( Tt_2 != 9 )
				begin
					Tt_2 <= Tt_2 + 1;
					Tt_1 <= 0;
				end
				else
				begin
					if ( Tt_3 != 9 )
					begin
						Tt_3 <= Tt_3 + 1;
						Tt_1 <= 0; Tt_2 <= 0;
					end
					else
					begin
						Tt_1 <= 0; Tt_2 <= 0; Tt_3 <= 0;
					end
				end
			end
			
		end

		
		
		if(DPulse1 == 1'b1 || DPulse2 == 1'b1 || DPulse3 == 1'b1 || DPulse4 == 1'b1)
		begin
		   if ( Dt_1 != 9 )
			begin
				Dt_1 <= Dt_1 + 1;
			end
			else
			begin
				if ( Dt_2 != 9 )
				begin
					Dt_2 <= Dt_2 + 1;
					Dt_1 <= 0;
				end
				else
				begin
					if ( Dt_3 != 9 )
					begin
						Dt_3 <= Dt_3 + 1;
						Dt_1 <= 0; Dt_2 <= 0;
					end
					else
					begin
						Dt_1 <= 0; Dt_2 <= 0; Dt_3 <= 0;
					end
				end
			end
			
		end
		
		if(RPulse1 == 1'b1)
		begin
		   if ( R1_1 != 9 )
			begin
				R1_1 <= R1_1 + 1;
			end
			else
			begin
				if ( R1_2 != 9 )
				begin
					R1_2 <= R1_2 + 1;
					R1_1 <= 0;
				end
				else
				begin
					if ( R1_3 != 9 )
					begin
						R1_3 <= R1_3 + 1;
						R1_1 <= 0; R1_2 <= 0;
					end
					else
					begin
						R1_1 <= 0; R1_2 <= 0; R1_3 <= 0;
					end
				end
			end
			
		end
	
		if(RPulse2 == 1'b1)
		begin
		   if ( R2_1 != 9 )
			begin
				R2_1 <= R2_1 + 1;
			end
			else
			begin
				if ( R2_2 != 9 )
				begin
					R2_2 <= R2_2 + 1;
					R2_1 <= 0;
				end
				else
				begin
					if ( R2_3 != 9 )
					begin
						R2_3 <= R2_3 + 1;
						R2_1 <= 0; R2_2 <= 0;
					end
					else
					begin
						R2_1 <= 0; R2_2 <= 0; R2_3 <= 0;
					end
				end
			end
			
		end
		if(RPulse3 == 1'b1)
		begin
		   if ( R3_1 != 9 )
			begin
				R3_1 <= R3_1 + 1;
			end
			else
			begin
				if ( R3_2 != 9 )
				begin
					R3_2 <= R3_2 + 1;
					R3_1 <= 0;
				end
				else
				begin
					if ( R3_3 != 9 )
					begin
						R3_3 <= R3_3 + 1;
						R3_1 <= 0; R3_2 <= 0;
					end
					else
					begin
						R3_1 <= 0; R3_2 <= 0; R3_3 <= 0;
					end
				end
			end
			
		end
		if(RPulse4 == 1'b1)
		begin
		   if ( R4_1 != 9 )
			begin
				R4_1 <= R4_1 + 1;
			end
			else
			begin
				if ( R4_2 != 9 )
				begin
					R4_2 <= R4_2 + 1;
					R4_1 <= 0;
				end
				else
				begin
					if ( R4_3 != 9 )
					begin
						R4_3 <= R4_3 + 1;
						R4_1 <= 0; R4_2 <= 0;
					end
					else
					begin
						R4_1 <= 0; R4_2 <= 0; R4_3 <= 0;
					end
				end
			end
			
		end
		if(TPulse1 == 1'b1)
		begin
		   if ( T1_1 != 9 )
			begin
				T1_1 <= T1_1 + 1;
			end
			else
			begin
				if ( T1_2 != 9 )
				begin
					T1_2 <= T1_2 + 1;
					T1_1 <= 0;
				end
				else
				begin
					if ( T1_3 != 9 )
					begin
						T1_3 <= T1_3 + 1;
						T1_1 <= 0; T1_2 <= 0;
					end
					else
					begin
						T1_1 <= 0; T1_2 <= 0; T1_3 <= 0;
					end
				end
			end
			
		end
		if(TPulse2 == 1'b1)
		begin
		   if ( T2_1 != 9 )
			begin
				T2_1 <= T2_1 + 1;
			end
			else
			begin
				if ( T2_2 != 9 )
				begin
					T2_2 <= T2_2 + 1;
					T2_1 <= 0;
				end
				else
				begin
					if ( T2_3 != 9 )
					begin
						T2_3 <= T2_3 + 1;
						T2_1 <= 0; T2_2 <= 0;
					end
					else
					begin
						T2_1 <= 0; T2_2 <= 0; T2_3 <= 0;
					end
				end
			end
			
		end
		if(TPulse3 == 1'b1)
		begin
		   if ( T3_1 != 9 )
			begin
				T3_1 <= T3_1 + 1;
			end
			else
			begin
				if ( T3_2 != 9 )
				begin
					T3_2 <= T3_2 + 1;
					T3_1 <= 0;
				end
				else
				begin
					if ( T3_3 != 9 )
					begin
						T3_3 <= T3_3 + 1;
						T3_1 <= 0; T3_2 <= 0;
					end
					else
					begin
						T3_1 <= 0; T3_2 <= 0; T3_3 <= 0;
					end
				end
			end
		end
		if(TPulse4 == 1'b1)
		begin
		   if ( T4_1 != 9 )
			begin
				T4_1 <= T4_1 + 1;
			end
			else
			begin
				if ( T4_2 != 9 )
				begin
					T4_2 <= T4_2 + 1;
					T4_1 <= 0;
				end
				else
				begin
					if ( T4_3 != 9 )
					begin
						T4_3 <= T4_3 + 1;
						T4_1 <= 0; T4_2 <= 0;
					end
					else
					begin
						T4_1 <= 0; T4_2 <= 0; T4_3 <= 0;
					end
				end
			end
		end
		if(DPulse1 == 1'b1)
		begin
		   if ( D1_1 != 9 )
			begin
				D1_1 <= D1_1 + 1;
			end
			else
			begin
				if ( D1_2 != 9 )
				begin
					D1_2 <= D1_2 + 1;
					D1_1 <= 0;
				end
				else
				begin
					if ( D1_3 != 9 )
					begin
						D1_3 <= D1_3 + 1;
						D1_1 <= 0; D1_2 <= 0;
					end
					else
					begin
						D1_1 <= 0; D1_2 <= 0; D1_3 <= 0;
					end
				end
			end
		end
		if(DPulse2 == 1'b1)
		begin
		   if ( D2_1 != 9 )
			begin
				D2_1 <= D2_1 + 1;
			end
			else
			begin
				if ( D2_2 != 9 )
				begin
					D2_2 <= D2_2 + 1;
					D2_1 <= 0;
				end
				else
				begin
					if ( D2_3 != 9 )
					begin
						D2_3 <= D2_3 + 1;
						D2_1 <= 0; D2_2 <= 0;
					end
					else
					begin
						D2_1 <= 0; D2_2 <= 0; D2_3 <= 0;
					end
				end
			end
		end
		if(DPulse3 == 1'b1)
		begin
		   if ( D3_1 != 9 )
			begin
				D3_1 <= D3_1 + 1;
			end
			else
			begin
				if ( D3_2 != 9 )
				begin
					D3_2 <= D3_2 + 1;
					D3_1 <= 0;
				end
				else
				begin
					if ( D3_3 != 9 )
					begin
						D3_3 <= D3_3 + 1;
						D3_1 <= 0; D3_2 <= 0;
					end
					else
					begin
						D3_1 <= 0; D3_2 <= 0; D3_3 <= 0;
					end
				end
			end
		end
		if(DPulse4 == 1'b1)
		begin
		   if ( D4_1 != 9 )
			begin
				D4_1 <= D4_1 + 1;
			end
			else
			begin
				if ( D4_2 != 9 )
				begin
					D4_2 <= D4_2 + 1;
					D4_1 <= 0;
				end
				else
				begin
					if ( D4_3 != 9 )
					begin
						D4_3 <= D4_3 + 1;
						D4_1 <= 0; D4_2 <= 0;
					end
					else
					begin
						D4_1 <= 0; D4_2 <= 0; D4_3 <= 0;
					end
				end
			end
		end
	end
	
	
		always @ (posedge clk)
		begin
			if(
			(((counter_x == 469 || counter_x == 470) && counter_y >= 143 && counter_y <=152) || 
			((counter_x == 471 || counter_x == 472) && (counter_y == 145 || counter_y ==146)) || 
			((counter_x == 473 || counter_x == 474) && (counter_y == 147 || counter_y ==148)) ||
			((counter_x == 475 || counter_x == 476) && counter_y >= 143 && counter_y <=152)) /*N*/
			||
			(((counter_x == 479 || counter_x == 480) && counter_y >= 143 && counter_y <=152) || 
			( counter_x >= 481 && counter_x <=484 && (counter_y == 151 || counter_y ==152)) ||
			((counter_x == 485 || counter_x == 486) && counter_y >= 143 && counter_y <=152)) /*U*/
			||
			(((counter_x == 489 || counter_x == 490) && counter_y >= 143 && counter_y <=152) || 
			((counter_x == 491 || counter_x == 492) && (counter_y == 145 || counter_y ==146)) ||
			((counter_x == 493 || counter_x == 494) && (counter_y == 147 || counter_y ==148)) ||
			((counter_x == 495 || counter_x == 496) && (counter_y == 145 || counter_y ==146)) ||
			((counter_x == 497 || counter_x == 498) && counter_y >= 143 && counter_y <=152)) /*M*/
			||
			(((counter_x == 501 || counter_x == 502) && counter_y >= 143 && counter_y <=152) ||
			( counter_x >= 503 && counter_x <=506 && (counter_y == 143 || counter_y ==144)) ||
			( counter_x >= 503 && counter_x <=506 && (counter_y == 147 || counter_y ==148)) ||
			( counter_x >= 503 && counter_x <=506 && (counter_y == 151 || counter_y ==152)) ||
			((counter_x == 507 || counter_x == 508) && (counter_y == 145 || counter_y ==146)) ||
			((counter_x == 507 || counter_x == 508) && (counter_y == 149 || counter_y ==150))) /*B*/
			||
			(((counter_x == 511 || counter_x == 512) && counter_y >= 143 && counter_y <=152) ||
			( counter_x >= 513 && counter_x <=518 && (counter_y == 143 || counter_y ==144)) ||
			( counter_x >= 513 && counter_x <=516 && (counter_y == 147 || counter_y ==148)) ||
			( counter_x >= 513 && counter_x <=518 && (counter_y == 151 || counter_y ==152))) /*E*/
			||
			(((counter_x == 521 || counter_x == 522) && counter_y >= 143 && counter_y <=152) ||
			( counter_x >= 523 && counter_x <=526 && (counter_y == 143 || counter_y ==144)) ||
			( counter_x >= 523 && counter_x <=526 && (counter_y == 147 || counter_y ==148)) ||
			((counter_x == 525 || counter_x == 526) && (counter_y == 149 || counter_y ==150)) ||
			((counter_x == 527 || counter_x == 528) && (counter_y == 145 || counter_y ==146)) ||
			((counter_x == 527 || counter_x == 528) && (counter_y == 151 || counter_y ==152))) /*R*/
			||
			(((counter_x == 535 || counter_x == 536) && counter_y >= 145 && counter_y <=150) ||
			( counter_x >= 537 && counter_x <=540 && (counter_y == 143 || counter_y ==144)) ||
			( counter_x >= 537 && counter_x <=540 && (counter_y == 151 || counter_y ==152)) ||
			((counter_x == 541 || counter_x == 542) && counter_y >= 145 && counter_y <=150)) /*O*/
			||
			(((counter_x == 545 || counter_x == 546) && counter_y >= 143 && counter_y <=152) ||
			( counter_x >= 547 && counter_x <=552 && (counter_y == 143 || counter_y ==144)) ||
			( counter_x >= 547 && counter_x <=550 && (counter_y == 147 || counter_y ==148))) /*F*/
			||
			(((counter_x == 559 || counter_x == 560) && counter_y >= 143 && counter_y <=152) ||
			( counter_x >= 561 && counter_x <=564 && (counter_y == 143 || counter_y ==144)) ||
			( counter_x >= 561 && counter_x <=564 && (counter_y == 147 || counter_y ==148)) ||
			((counter_x == 563 || counter_x == 564) && (counter_y == 149 || counter_y ==150)) ||
			((counter_x == 565 || counter_x == 566) && (counter_y == 145 || counter_y ==146)) ||
			((counter_x == 565 || counter_x == 566) && (counter_y == 151 || counter_y ==152))) /*R*/
			||
			(((counter_x == 569 || counter_x == 570) && counter_y >= 143 && counter_y <=152) ||
			( counter_x >= 571 && counter_x <=576 && (counter_y == 143 || counter_y ==144)) ||
			( counter_x >= 571 && counter_x <=574 && (counter_y == 147 || counter_y ==148)) ||
			( counter_x >= 571 && counter_x <=576 && (counter_y == 151 || counter_y ==152))) /*E*/
			||
			(((counter_x == 579 || counter_x == 580) && counter_y >= 145 && counter_y <=150) ||
			( counter_x >= 581 && counter_x <=584 && (counter_y == 143 || counter_y ==144)) ||
			( counter_x >= 581 && counter_x <=584 && (counter_y == 151 || counter_y ==152)) ||
			((counter_x == 585 || counter_x == 586) && (counter_y == 145 || counter_y ==146))||
			((counter_x == 585 || counter_x == 586) && (counter_y == 149 || counter_y ==150)))  /*C*/
			||
			(((counter_x == 589 || counter_x == 590) && counter_y >= 143 && counter_y <=152) ||
			( counter_x >= 591 && counter_x <=596 && (counter_y == 143 || counter_y ==144)) ||
			( counter_x >= 591 && counter_x <=594 && (counter_y == 147 || counter_y ==148)) ||
			( counter_x >= 591 && counter_x <=596 && (counter_y == 151 || counter_y ==152))) /*E*/
			||
			(( counter_x >= 599 && counter_x <=604 && (counter_y == 143 || counter_y ==144)) ||
			((counter_x == 601 || counter_x == 602) && counter_y >= 145 && counter_y <=150) ||
			( counter_x >= 599 && counter_x <=604 && (counter_y == 151 || counter_y ==152))) /*I*/
			||
			(((counter_x == 607 || counter_x == 608) && counter_y >= 143 && counter_y <=146) ||
			((counter_x == 609 || counter_x == 610) && counter_y >= 147 && counter_y <=150) ||
			((counter_x == 611 || counter_x == 612) && (counter_y == 151 || counter_y ==152)) ||
			((counter_x == 613 || counter_x == 614) && counter_y >= 147 && counter_y <=150) ||
			((counter_x == 615 || counter_x == 616) && counter_y >= 143 && counter_y <=146)) /*V*/
			||
			(((counter_x == 619 || counter_x == 620) && counter_y >= 143 && counter_y <=152) ||
			( counter_x >= 621 && counter_x <=626 && (counter_y == 143 || counter_y ==144)) ||
			( counter_x >= 621 && counter_x <=624 && (counter_y == 147 || counter_y ==148)) ||
			( counter_x >= 621 && counter_x <=626 && (counter_y == 151 || counter_y ==152))) /*E*/
			||
			(((counter_x == 629 || counter_x == 630) && counter_y >= 143 && counter_y <=152) ||
			( counter_x >= 631 && counter_x <=634 && (counter_y == 143 || counter_y ==144)) ||
			( counter_x >= 631 && counter_x <=634 && (counter_y == 151 || counter_y ==152)) ||
			((counter_x == 635 || counter_x == 636) && counter_y >= 145 && counter_y <=150)) /*D*/
			||
			(((counter_x == 643 || counter_x == 644) && counter_y >= 143 && counter_y <=152) ||
			( counter_x >= 645 && counter_x <=648 && (counter_y == 143 || counter_y ==144)) ||
			( counter_x >= 645 && counter_x <=648 && (counter_y == 147 || counter_y ==148)) ||
			((counter_x == 649 || counter_x == 650) && (counter_y == 145 || counter_y ==146))) /*P*/
			||
			(((counter_x == 653 || counter_x == 654) && counter_y >= 145 && counter_y <=152) ||
			( counter_x >= 655 && counter_x <=658 && (counter_y == 143 || counter_y ==144)) ||
			( counter_x >= 655 && counter_x <=658 && (counter_y == 147 || counter_y ==148)) ||
			((counter_x == 659 || counter_x == 660) && counter_y >= 145 && counter_y <=152)) /*A*/
			||
			(((counter_x == 663 || counter_x == 664) && counter_y >= 145 && counter_y <=150) ||
			( counter_x >= 665 && counter_x <=668 && (counter_y == 143 || counter_y ==144)) ||
			( counter_x >= 665 && counter_x <=668 && (counter_y == 151 || counter_y ==152)) ||
			((counter_x == 669 || counter_x == 670) && (counter_y == 145 || counter_y ==146))||
			((counter_x == 669 || counter_x == 670) && (counter_y == 149 || counter_y ==150)))  /*C*/
			||
			(((counter_x == 673 || counter_x == 674) && counter_y >= 143 && counter_y <=152) ||
			((counter_x == 675 || counter_x == 676) && (counter_y == 147 || counter_y ==148))||
			((counter_x == 677 || counter_x == 678) && (counter_y == 145 || counter_y ==146))||
			((counter_x == 677 || counter_x == 678) && (counter_y == 149 || counter_y ==150))||
			((counter_x == 679 || counter_x == 680) && (counter_y == 143 || counter_y ==144))||
			((counter_x == 679 || counter_x == 680) && (counter_y == 151 || counter_y ==152))) /*K*/
			||
			(((counter_x == 683 || counter_x == 684) && counter_y >= 143 && counter_y <=152) ||
			( counter_x >= 685 && counter_x <=690 && (counter_y == 143 || counter_y ==144)) ||
			( counter_x >= 685 && counter_x <=688 && (counter_y == 147 || counter_y ==148)) ||
			( counter_x >= 685 && counter_x <=690 && (counter_y == 151 || counter_y ==152))) /*E*/
			||
			(( counter_x >= 693 && counter_x <=702 && (counter_y == 143 || counter_y ==144)) ||
			((counter_x == 697 || counter_x == 698) && counter_y >= 145 && counter_y <=152)) /*T*/
			||
			(((counter_x == 705 || counter_x == 706) && (counter_y == 145 || counter_y ==146))||
			((counter_x == 711 || counter_x == 712) && (counter_y == 149 || counter_y ==150))||
			( counter_x >= 707 && counter_x <=712 && (counter_y == 143 || counter_y ==144)) ||
			( counter_x >= 707 && counter_x <=710 && (counter_y == 147 || counter_y ==148)) ||
			( counter_x >= 705 && counter_x <=710 && (counter_y == 151 || counter_y ==152))) /*S*/
			||
			(((counter_x == 469 || counter_x == 470) && counter_y >= 248 && counter_y <=257) || 
			((counter_x == 471 || counter_x == 472) && (counter_y == 250 || counter_y ==251)) || 
			((counter_x == 473 || counter_x == 474) && (counter_y == 252 || counter_y ==253)) ||
			((counter_x == 475 || counter_x == 476) && counter_y >= 248 && counter_y <=257)) /*N*/
			||
			(((counter_x == 479 || counter_x == 480) && counter_y >= 248 && counter_y <=257) || 
			( counter_x >= 481 && counter_x <=484 && (counter_y == 256 || counter_y ==257)) ||
			((counter_x == 485 || counter_x == 486) && counter_y >= 248 && counter_y <=257)) /*U*/
			||
			(((counter_x == 489 || counter_x == 490) && counter_y >= 248 && counter_y <=257) || 
			((counter_x == 491 || counter_x == 492) && (counter_y == 250 || counter_y ==251)) ||
			((counter_x == 493 || counter_x == 494) && (counter_y == 252 || counter_y ==253)) ||
			((counter_x == 495 || counter_x == 496) && (counter_y == 250 || counter_y ==251)) ||
			((counter_x == 497 || counter_x == 498) && counter_y >= 248 && counter_y <=257)) /*M*/
			||
			(((counter_x == 501 || counter_x == 502) && counter_y >= 248 && counter_y <=257) ||
			( counter_x >= 503 && counter_x <=506 && (counter_y == 248 || counter_y ==249)) ||
			( counter_x >= 503 && counter_x <=506 && (counter_y == 252 || counter_y ==253)) ||
			( counter_x >= 503 && counter_x <=506 && (counter_y == 256 || counter_y ==257)) ||
			((counter_x == 507 || counter_x == 508) && (counter_y == 250 || counter_y ==251)) ||
			((counter_x == 507 || counter_x == 508) && (counter_y == 254 || counter_y ==255))) /*B*/
			||
			(((counter_x == 511 || counter_x == 512) && counter_y >= 248 && counter_y <=257) ||
			( counter_x >= 513 && counter_x <=518 && (counter_y == 248 || counter_y ==249)) ||
			( counter_x >= 513 && counter_x <=516 && (counter_y == 252 || counter_y ==253)) ||
			( counter_x >= 513 && counter_x <=518 && (counter_y == 256 || counter_y ==257))) /*E*/
			||
			(((counter_x == 521 || counter_x == 522) && counter_y >= 248 && counter_y <=257) ||
			( counter_x >= 523 && counter_x <=526 && (counter_y == 248 || counter_y ==249)) ||
			( counter_x >= 523 && counter_x <=526 && (counter_y == 252 || counter_y ==253)) ||
			((counter_x == 525 || counter_x == 526) && (counter_y == 254 || counter_y ==255)) ||
			((counter_x == 527 || counter_x == 528) && (counter_y == 250 || counter_y ==251)) ||
			((counter_x == 527 || counter_x == 528) && (counter_y == 256 || counter_y ==257))) /*R*/
			||
			(((counter_x == 535 || counter_x == 536) && counter_y >= 250 && counter_y <=255) ||
			( counter_x >= 537 && counter_x <=540 && (counter_y == 248 || counter_y ==249)) ||
			( counter_x >= 537 && counter_x <=540 && (counter_y == 256 || counter_y ==257)) ||
			((counter_x == 541 || counter_x == 542) && counter_y >= 250 && counter_y <=255)) /*O*/
			||
			(((counter_x == 545 || counter_x == 546) && counter_y >= 248 && counter_y <=257) ||
			( counter_x >= 547 && counter_x <=552 && (counter_y == 248 || counter_y ==249)) ||
			( counter_x >= 547 && counter_x <=550 && (counter_y == 252 || counter_y ==253))) /*F*/
			||
			(( counter_x >= 559 && counter_x <=568 && (counter_y == 248 || counter_y ==249)) ||
			((counter_x == 563 || counter_x == 564) && counter_y >= 250 && counter_y <=257)) /*T*/
			||
			(((counter_x == 571 || counter_x == 572) && counter_y >= 248 && counter_y <=257) ||
			( counter_x >= 573 && counter_x <=576 && (counter_y == 248 || counter_y ==249)) ||
			( counter_x >= 573 && counter_x <=576 && (counter_y == 252 || counter_y ==253)) ||
			((counter_x == 575 || counter_x == 576) && (counter_y == 254 || counter_y ==255)) ||
			((counter_x == 577 || counter_x == 578) && (counter_y == 250 || counter_y ==251)) ||
			((counter_x == 577 || counter_x == 578) && (counter_y == 256 || counter_y ==257))) /*R*/
			||
			(((counter_x == 581 || counter_x == 582) && counter_y >= 250 && counter_y <=257) ||
			( counter_x >= 583 && counter_x <=586 && (counter_y == 248 || counter_y ==249)) ||
			( counter_x >= 583 && counter_x <=586 && (counter_y == 252 || counter_y ==253)) ||
			((counter_x == 587 || counter_x == 588) && counter_y >= 250 && counter_y <=257)) /*A*/
			||
			(((counter_x == 591 || counter_x == 592) && counter_y >= 248 && counter_y <=257) || 
			((counter_x == 593 || counter_x == 594) && (counter_y == 250 || counter_y ==251)) || 
			((counter_x == 595 || counter_x == 596) && (counter_y == 252 || counter_y ==253)) ||
			((counter_x == 597 || counter_x == 598) && counter_y >= 248 && counter_y <=257)) /*N*/
			||
			(((counter_x == 601 || counter_x == 602) && (counter_y == 250 || counter_y ==251))||
			((counter_x == 607 || counter_x == 608) && (counter_y == 254 || counter_y ==255))||
			( counter_x >= 603 && counter_x <=608 && (counter_y == 248 || counter_y ==249)) ||
			( counter_x >= 603 && counter_x <=606 && (counter_y == 252 || counter_y ==253)) ||
			( counter_x >= 601 && counter_x <=606 && (counter_y == 256 || counter_y ==257))) /*S*/
			||
			(((counter_x == 611 || counter_x == 612) && counter_y >= 248 && counter_y <=257) || 
			((counter_x == 613 || counter_x == 614) && (counter_y == 250 || counter_y ==251)) ||
			((counter_x == 615 || counter_x == 616) && (counter_y == 252 || counter_y ==253)) ||
			((counter_x == 617 || counter_x == 618) && (counter_y == 250 || counter_y ==251)) ||
			((counter_x == 619 || counter_x == 620) && counter_y >= 248 && counter_y <=257)) /*M*/
			||
			(( counter_x >= 623 && counter_x <=628 && (counter_y == 248 || counter_y ==249)) ||
			((counter_x == 625 || counter_x == 626) && counter_y >= 250 && counter_y <=255) ||
			( counter_x >= 623 && counter_x <=628 && (counter_y == 256 || counter_y ==257))) /*I*/
			||
			(( counter_x >= 631 && counter_x <=640 && (counter_y == 248 || counter_y ==249)) ||
			((counter_x == 635 || counter_x == 636) && counter_y >= 250 && counter_y <=257)) /*T*/
			||
			(( counter_x >= 643 && counter_x <=652 && (counter_y == 248 || counter_y ==249)) ||
			((counter_x == 647 || counter_x == 648) && counter_y >= 250 && counter_y <=257)) /*T*/
			||
			(((counter_x == 655 || counter_x == 656) && counter_y >= 248 && counter_y <=257) ||
			( counter_x >= 657 && counter_x <=662 && (counter_y == 248 || counter_y ==249)) ||
			( counter_x >= 657 && counter_x <=660 && (counter_y == 252 || counter_y ==253)) ||
			( counter_x >= 657 && counter_x <=662 && (counter_y == 256 || counter_y ==257))) /*E*/
			||
			(((counter_x == 665 || counter_x == 666) && counter_y >= 248 && counter_y <=257) ||
			( counter_x >= 667 && counter_x <=670 && (counter_y == 248 || counter_y ==249)) ||
			( counter_x >= 667 && counter_x <=670 && (counter_y == 256 || counter_y ==257)) ||
			((counter_x == 671 || counter_x == 672) && counter_y >= 250 && counter_y <=255)) /*D*/
			||
			(((counter_x == 679 || counter_x == 680) && counter_y >= 248 && counter_y <=257) ||
			( counter_x >= 681 && counter_x <=684 && (counter_y == 248 || counter_y ==249)) ||
			( counter_x >= 681 && counter_x <=684 && (counter_y == 252 || counter_y ==253)) ||
			((counter_x == 685 || counter_x == 686) && (counter_y == 250 || counter_y ==251))) /*P*/
			||
			(((counter_x == 689 || counter_x == 690) && counter_y >= 250 && counter_y <=257) ||
			( counter_x >= 691 && counter_x <=694 && (counter_y == 248 || counter_y ==249)) ||
			( counter_x >= 691 && counter_x <=694 && (counter_y == 252 || counter_y ==253)) ||
			((counter_x == 695 || counter_x == 696) && counter_y >= 250 && counter_y <=257)) /*A*/
			||
			(((counter_x == 699 || counter_x == 700) && counter_y >= 250 && counter_y <=255) ||
			( counter_x >= 701 && counter_x <=704 && (counter_y == 248 || counter_y ==249)) ||
			( counter_x >= 701 && counter_x <=704 && (counter_y == 256 || counter_y ==257)) ||
			((counter_x == 705 || counter_x == 706) && (counter_y == 250 || counter_y ==251))||
			((counter_x == 705 || counter_x == 706) && (counter_y == 254 || counter_y ==255)))  /*C*/
			||
			(((counter_x == 709 || counter_x == 710) && counter_y >= 248 && counter_y <=257) ||
			((counter_x == 711 || counter_x == 712) && (counter_y == 252 || counter_y ==253))||
			((counter_x == 713 || counter_x == 714) && (counter_y == 250 || counter_y ==251))||
			((counter_x == 713 || counter_x == 714) && (counter_y == 254 || counter_y ==255))||
			((counter_x == 715 || counter_x == 716) && (counter_y == 248 || counter_y ==249))||
			((counter_x == 715 || counter_x == 716) && (counter_y == 256 || counter_y ==257))) /*K*/
			||
			(((counter_x == 719 || counter_x == 720) && counter_y >= 248 && counter_y <=257) ||
			( counter_x >= 721 && counter_x <=726 && (counter_y == 248 || counter_y ==249)) ||
			( counter_x >= 721 && counter_x <=724 && (counter_y == 252 || counter_y ==253)) ||
			( counter_x >= 721 && counter_x <=726 && (counter_y == 256 || counter_y ==257))) /*E*/
			||
			(( counter_x >= 729 && counter_x <=738 && (counter_y == 248 || counter_y ==249)) ||
			((counter_x == 733 || counter_x == 734) && counter_y >= 250 && counter_y <=257)) /*T*/
			||
			(((counter_x == 741 || counter_x == 742) && (counter_y == 250 || counter_y ==251))||
			((counter_x == 747 || counter_x == 748) && (counter_y == 254 || counter_y ==255))||
			( counter_x >= 743 && counter_x <=748 && (counter_y == 248 || counter_y ==249)) ||
			( counter_x >= 743 && counter_x <=746 && (counter_y == 252 || counter_y ==253)) ||
			( counter_x >= 741 && counter_x <=746 && (counter_y == 256 || counter_y ==257))) /*S*/
			||
			(((counter_x == 469 || counter_x == 470) && counter_y >= 353 && counter_y <=362) || 
			((counter_x == 471 || counter_x == 472) && (counter_y == 355 || counter_y ==356)) || 
			((counter_x == 473 || counter_x == 474) && (counter_y == 357 || counter_y ==358)) ||
			((counter_x == 475 || counter_x == 476) && counter_y >= 353 && counter_y <=362)) /*N*/
			||
			(((counter_x == 479 || counter_x == 480) && counter_y >= 353 && counter_y <=362) || 
			( counter_x >= 481 && counter_x <=484 && (counter_y == 361 || counter_y ==362)) ||
			((counter_x == 485 || counter_x == 486) && counter_y >= 353 && counter_y <362)) /*U*/
			||
			(((counter_x == 489 || counter_x == 490) && counter_y >= 353 && counter_y <=362) || 
			((counter_x == 491 || counter_x == 492) && (counter_y == 355 || counter_y ==356)) ||
			((counter_x == 493 || counter_x == 494) && (counter_y == 357 || counter_y ==358)) ||
			((counter_x == 495 || counter_x == 496) && (counter_y == 355 || counter_y ==356)) ||
			((counter_x == 497 || counter_x == 498) && counter_y >= 353 && counter_y <=362)) /*M*/
			||
			(((counter_x == 501 || counter_x == 502) && counter_y >= 353 && counter_y <=362) ||
			( counter_x >= 503 && counter_x <=506 && (counter_y == 353 || counter_y ==354)) ||
			( counter_x >= 503 && counter_x <=506 && (counter_y == 357 || counter_y ==358)) ||
			( counter_x >= 503 && counter_x <=506 && (counter_y == 361 || counter_y ==362)) ||
			((counter_x == 507 || counter_x == 508) && (counter_y == 355 || counter_y ==356)) ||
			((counter_x == 507 || counter_x == 508) && (counter_y == 359 || counter_y ==360))) /*B*/
			||
			(((counter_x == 511 || counter_x == 512) && counter_y >= 353 && counter_y <=362) ||
			( counter_x >= 513 && counter_x <=518 && (counter_y == 353 || counter_y ==354)) ||
			( counter_x >= 513 && counter_x <=516 && (counter_y == 357 || counter_y ==358)) ||
			( counter_x >= 513 && counter_x <=518 && (counter_y == 361 || counter_y ==362))) /*E*/
			||
			(((counter_x == 521 || counter_x == 522) && counter_y >= 353 && counter_y <=362) ||
			( counter_x >= 523 && counter_x <=526 && (counter_y == 353 || counter_y ==354)) ||
			( counter_x >= 523 && counter_x <=526 && (counter_y == 357 || counter_y ==358)) ||
			((counter_x == 525 || counter_x == 526) && (counter_y == 359 || counter_y ==360)) ||
			((counter_x == 527 || counter_x == 528) && (counter_y == 355 || counter_y ==356)) ||
			((counter_x == 527 || counter_x == 528) && (counter_y == 361 || counter_y ==362))) /*R*/
			||
			(((counter_x == 535 || counter_x == 536) && counter_y >= 355 && counter_y <=360) ||
			( counter_x >= 537 && counter_x <=540 && (counter_y == 353 || counter_y ==354)) ||
			( counter_x >= 537 && counter_x <=540 && (counter_y == 361 || counter_y ==362)) ||
			((counter_x == 541 || counter_x == 542) && counter_y >= 355 && counter_y <=360)) /*O*/
			||
			(((counter_x == 545 || counter_x == 546) && counter_y >= 353 && counter_y <=362) ||
			( counter_x >= 547 && counter_x <=552 && (counter_y == 353 || counter_y ==354)) ||
			( counter_x >= 547 && counter_x <=550 && (counter_y == 357 || counter_y ==358))) /*F*/
			||
			(((counter_x == 559 || counter_x == 560) && counter_y >= 353 && counter_y <=362) ||
			( counter_x >= 561 && counter_x <=564 && (counter_y == 353 || counter_y ==354)) ||
			( counter_x >= 561 && counter_x <=564 && (counter_y == 361 || counter_y ==362)) ||
			((counter_x == 565 || counter_x == 566) && counter_y >= 355 && counter_y <=360)) /*D*/
			||
			(((counter_x == 569 || counter_x == 570) && counter_y >= 353 && counter_y <=362) ||
			( counter_x >= 571 && counter_x <=574 && (counter_y == 353 || counter_y ==354)) ||
			( counter_x >= 571 && counter_x <=574 && (counter_y == 357 || counter_y ==358)) ||
			((counter_x == 573 || counter_x == 574) && (counter_y == 359 || counter_y ==360)) ||
			((counter_x == 575 || counter_x == 576) && (counter_y == 355 || counter_y ==356)) ||
			((counter_x == 575 || counter_x == 576) && (counter_y == 361 || counter_y ==362))) /*R*/
			||
			(((counter_x == 579 || counter_x == 580) && counter_y >= 355 && counter_y <=360) ||
			( counter_x >= 581 && counter_x <=584 && (counter_y == 353 || counter_y ==354)) ||
			( counter_x >= 581 && counter_x <=584 && (counter_y == 361 || counter_y ==362)) ||
			((counter_x == 585 || counter_x == 586) && counter_y >= 355 && counter_y <=360)) /*O*/
			||
			(((counter_x == 589 || counter_x == 590) && counter_y >= 353 && counter_y <=362) ||
			( counter_x >= 591 && counter_x <=594 && (counter_y == 353 || counter_y ==354)) ||
			( counter_x >= 591 && counter_x <=594 && (counter_y == 357 || counter_y ==358)) ||
			((counter_x == 595 || counter_x == 596) && (counter_y == 355 || counter_y ==356))) /*P*/
			||
			(((counter_x == 599 || counter_x == 600) && counter_y >= 353 && counter_y <=362) ||
			( counter_x >= 601 && counter_x <=604 && (counter_y == 353 || counter_y ==354)) ||
			( counter_x >= 601 && counter_x <=604 && (counter_y == 357 || counter_y ==358)) ||
			((counter_x == 605 || counter_x == 606) && (counter_y == 355 || counter_y ==356))) /*P*/
			||
			(((counter_x == 609 || counter_x == 610) && counter_y >= 353 && counter_y <=362) ||
			( counter_x >= 611 && counter_x <=616 && (counter_y == 353 || counter_y ==354)) ||
			( counter_x >= 611 && counter_x <=614 && (counter_y == 357 || counter_y ==358)) ||
			( counter_x >= 611 && counter_x <=616 && (counter_y == 361 || counter_y ==362))) /*E*/
			||
			(((counter_x == 619 || counter_x == 620) && counter_y >= 353 && counter_y <=362) ||
			( counter_x >= 621 && counter_x <=624 && (counter_y == 353 || counter_y ==354)) ||
			( counter_x >= 621 && counter_x <=624 && (counter_y == 361 || counter_y ==362)) ||
			((counter_x == 625 || counter_x == 626) && counter_y >= 355 && counter_y <=360)) /*D*/
			||
			(((counter_x == 633 || counter_x == 634) && counter_y >= 353 && counter_y <=362) ||
			( counter_x >= 635 && counter_x <=638 && (counter_y == 353 || counter_y ==354)) ||
			( counter_x >= 635 && counter_x <=638 && (counter_y == 357 || counter_y ==358)) ||
			((counter_x == 639 || counter_x == 640) && (counter_y == 355 || counter_y ==356))) /*P*/
			||
			(((counter_x == 643 || counter_x == 644) && counter_y >= 355 && counter_y <=362) ||
			( counter_x >= 645 && counter_x <=648 && (counter_y == 353 || counter_y ==354)) ||
			( counter_x >= 645 && counter_x <=648 && (counter_y == 357 || counter_y ==358)) ||
			((counter_x == 649 || counter_x == 650) && counter_y >= 355 && counter_y <=362)) /*A*/
			||
			(((counter_x == 653 || counter_x == 654) && counter_y >= 355 && counter_y <=360) ||
			( counter_x >= 655 && counter_x <=658 && (counter_y == 353 || counter_y ==354)) ||
			( counter_x >= 655 && counter_x <=658 && (counter_y == 361 || counter_y ==362)) ||
			((counter_x == 659 || counter_x == 660) && (counter_y == 355 || counter_y ==356))||
			((counter_x == 659 || counter_x == 660) && (counter_y == 359 || counter_y ==360)))  /*C*/
			||
			(((counter_x == 663 || counter_x == 664) && counter_y >= 353 && counter_y <=362) ||
			((counter_x == 665 || counter_x == 666) && (counter_y == 357 || counter_y ==358))||
			((counter_x == 667 || counter_x == 668) && (counter_y == 355 || counter_y ==356))||
			((counter_x == 667 || counter_x == 668) && (counter_y == 359 || counter_y ==360))||
			((counter_x == 669 || counter_x == 670) && (counter_y == 353 || counter_y ==354))||
			((counter_x == 669 || counter_x == 670) && (counter_y == 361 || counter_y ==362))) /*K*/
			||
			(((counter_x == 673 || counter_x == 674) && counter_y >= 353 && counter_y <=362) ||
			( counter_x >= 675 && counter_x <=680 && (counter_y == 353 || counter_y ==354)) ||
			( counter_x >= 675 && counter_x <=678 && (counter_y == 357 || counter_y ==358)) ||
			( counter_x >= 675 && counter_x <=680 && (counter_y == 361 || counter_y ==362))) /*E*/
			||
			(( counter_x >= 683 && counter_x <=692 && (counter_y == 353 || counter_y ==354)) ||
			((counter_x == 687 || counter_x == 688) && counter_y >= 355 && counter_y <=362)) /*T*/
			||
			(((counter_x == 695 || counter_x == 696) && (counter_y == 355 || counter_y ==356))||
			((counter_x == 701 || counter_x == 702) && (counter_y == 359 || counter_y ==360))||
			( counter_x >= 697 && counter_x <=702 && (counter_y == 353 || counter_y ==354)) ||
			( counter_x >= 697 && counter_x <=700 && (counter_y == 357 || counter_y ==358)) ||
			( counter_x >= 695 && counter_x <=700 && (counter_y == 361 || counter_y ==362))) /*S*/
			||
			(((counter_x == 469) && counter_y >= 173 && counter_y <=177) ||
			( counter_x >= 470 && counter_x <=471 && (counter_y == 173)) ||
			( counter_x >= 470 && counter_x <=471 && (counter_y == 175)) ||
			( counter_x >= 470 && counter_x <=471 && (counter_y == 177)) ||
			((counter_x == 472) && (counter_y == 174)) ||
			((counter_x == 472) && (counter_y == 176 ))) /*b*/
			||
			(((counter_x == 474) && counter_y >= 173 && counter_y <=177) || 
			( counter_x >= 475 && counter_x <=476 && (counter_y == 177)) ||
			((counter_x == 477) && counter_y >= 173 && counter_y <=177)) /*u*/
			||
			(((counter_x == 479) && counter_y >= 173 && counter_y <=177) ||
			( counter_x >= 480 && counter_x <=482 && (counter_y == 173)) ||
			( counter_x >= 480 && counter_x <=481 && (counter_y == 175))) /*f*/
			||
			(((counter_x == 484) && counter_y >= 173 && counter_y <=177) ||
			( counter_x >= 485 && counter_x <=487 && (counter_y == 173)) ||
			( counter_x >= 485 && counter_x <=486 && (counter_y == 175))) /*f*/
			||
			(((counter_x == 489) && counter_y >= 173 && counter_y <=177) ||
			( counter_x >= 490 && counter_x <=492 && (counter_y == 173)) ||
			( counter_x >= 490 && counter_x <=491 && (counter_y == 175)) ||
			( counter_x >= 490 && counter_x <=492 && (counter_y == 177))) /*e*/
			||
			(((counter_x == 494) && counter_y >= 173 && counter_y <=177) ||
			( counter_x >= 495 && counter_x <=496 && (counter_y == 173)) ||
			( counter_x >= 495 && counter_x <=496 && (counter_y == 175)) ||
			((counter_x == 496) && (counter_y == 176)) ||
			((counter_x == 497) && (counter_y == 174)) ||
			((counter_x == 497) && (counter_y == 177))) /*r*/
			||
			(((counter_x == 501) && (counter_y == 174)) ||
			((counter_x == 502) && counter_y >= 173 && counter_y <=176) ||
			( counter_x >= 501 && counter_x <=503 && (counter_y == 177))) /*1*/
			||
			(((counter_x == 519) && counter_y >= 173 && counter_y <=177) ||
			( counter_x >= 520 && counter_x <=521 && (counter_y == 173)) ||
			( counter_x >= 520 && counter_x <=521 && (counter_y == 175)) ||
			( counter_x >= 520 && counter_x <=521 && (counter_y == 177)) ||
			((counter_x == 522) && (counter_y == 174)) ||
			((counter_x == 522) && (counter_y == 176 ))) /*b*/
			||
			(((counter_x ==524) && counter_y >= 173 && counter_y <=177) || 
			( counter_x >= 525 && counter_x <=526 && (counter_y == 177)) ||
			((counter_x == 527) && counter_y >= 173 && counter_y <=177)) /*u*/
			||
			(((counter_x == 529) && counter_y >= 173 && counter_y <=177) ||
			( counter_x >= 530 && counter_x <=532 && (counter_y == 173)) ||
			( counter_x >= 530 && counter_x <=531 && (counter_y == 175))) /*f*/
			||
			(((counter_x == 534) && counter_y >= 173 && counter_y <=177) ||
			( counter_x >= 535 && counter_x <=537 && (counter_y == 173)) ||
			( counter_x >= 535 && counter_x <=536 && (counter_y == 175))) /*f*/
			||
			(((counter_x == 539) && counter_y >= 173 && counter_y <=177) ||
			( counter_x >= 540 && counter_x <=542 && (counter_y == 173)) ||
			( counter_x >= 540 && counter_x <=541 && (counter_y == 175)) ||
			( counter_x >= 540 && counter_x <=542 && (counter_y == 177))) /*e*/
			||
			(((counter_x == 544) && counter_y >= 173 && counter_y <=177) ||
			( counter_x >= 545 && counter_x <=546 && (counter_y == 173)) ||
			( counter_x >= 545 && counter_x <=546 && (counter_y == 175)) ||
			((counter_x == 546) && (counter_y == 176)) ||
			((counter_x == 547) && (counter_y == 174)) ||
			((counter_x == 547) && (counter_y == 177))) /*r*/
			||
			(((counter_x == 551) && (counter_y == 174)) ||
			( counter_x >= 552 && counter_x <=553 && (counter_y == 173)) ||
			((counter_x == 554) && (counter_y == 174)) ||
			((counter_x == 553) && (counter_y == 175)) ||
			((counter_x == 552) && (counter_y == 176)) ||
			( counter_x >= 551 && counter_x <=554 && (counter_y == 177)) ) /*2*/
			||
			(((counter_x == 570) && counter_y >= 173 && counter_y <=177) ||
			( counter_x >= 571 && counter_x <=572 && (counter_y == 173)) ||
			( counter_x >= 571 && counter_x <=572 && (counter_y == 175)) ||
			( counter_x >= 571 && counter_x <=572 && (counter_y == 177)) ||
			((counter_x == 573) && (counter_y == 174)) ||
			((counter_x == 573) && (counter_y == 176 ))) /*b*/
			||
			(((counter_x ==575) && counter_y >= 173 && counter_y <=177) || 
			( counter_x >= 576 && counter_x <=577 && (counter_y == 177)) ||
			((counter_x == 578) && counter_y >= 173 && counter_y <=177)) /*u*/
			||
			(((counter_x == 580) && counter_y >= 173 && counter_y <=177) ||
			( counter_x >= 581 && counter_x <=583 && (counter_y == 173)) ||
			( counter_x >= 581 && counter_x <=582 && (counter_y == 175))) /*f*/
			||
			(((counter_x == 585) && counter_y >= 173 && counter_y <=177) ||
			( counter_x >= 586 && counter_x <=588 && (counter_y == 173)) ||
			( counter_x >= 586 && counter_x <=587 && (counter_y == 175))) /*f*/
			||
			(((counter_x == 590) && counter_y >= 173 && counter_y <=177) ||
			( counter_x >= 591 && counter_x <=593 && (counter_y == 173)) ||
			( counter_x >= 591 && counter_x <=593 && (counter_y == 175)) ||
			( counter_x >= 591 && counter_x <=593 && (counter_y == 177))) /*e*/
			||
			(((counter_x == 595) && counter_y >= 173 && counter_y <=177) ||
			( counter_x >= 596 && counter_x <=597 && (counter_y == 173)) ||
			( counter_x >= 596 && counter_x <=597 && (counter_y == 175)) ||
			((counter_x == 597) && (counter_y == 176)) ||
			((counter_x == 598) && (counter_y == 174)) ||
			((counter_x == 598) && (counter_y == 177))) /*r*/
			||			
			(((counter_x == 602) && (counter_y == 174)) ||
			( counter_x >= 603 && counter_x <=604 && (counter_y == 173)) ||
			((counter_x == 605) && (counter_y == 174)) ||
			((counter_x == 604) && (counter_y == 175)) ||
			((counter_x == 605) && (counter_y == 176)) ||
			((counter_x == 602) && (counter_y == 176)) ||
			( counter_x >= 603 && counter_x <=604 && (counter_y == 177)) ) /*3*/
			||
			(((counter_x == 621) && counter_y >= 173 && counter_y <=177) ||
			( counter_x >= 622 && counter_x <=623 && (counter_y == 173)) ||
			( counter_x >= 622 && counter_x <=623 && (counter_y == 175)) ||
			( counter_x >= 622 && counter_x <=623 && (counter_y == 177)) ||
			((counter_x == 624) && (counter_y == 174)) ||
			((counter_x == 624) && (counter_y == 176 ))) /*b*/
			||
			(((counter_x ==626) && counter_y >= 173 && counter_y <=177) || 
			( counter_x >= 627 && counter_x <=628 && (counter_y == 177)) ||
			((counter_x == 629) && counter_y >= 173 && counter_y <=177)) /*u*/
			||
			(((counter_x == 631) && counter_y >= 173 && counter_y <=177) ||
			( counter_x >= 632 && counter_x <=634 && (counter_y == 173)) ||
			( counter_x >= 632 && counter_x <=633 && (counter_y == 175))) /*f*/
			||
			(((counter_x == 636) && counter_y >= 173 && counter_y <=177) ||
			( counter_x >= 637 && counter_x <=639 && (counter_y == 173)) ||
			( counter_x >= 637 && counter_x <=638 && (counter_y == 175))) /*f*/
			||
			(((counter_x == 641) && counter_y >= 173 && counter_y <=177) ||
			( counter_x >= 642 && counter_x <=644 && (counter_y == 173)) ||
			( counter_x >= 642 && counter_x <=644 && (counter_y == 175)) ||
			( counter_x >= 642 && counter_x <=644 && (counter_y == 177))) /*e*/
			||
			(((counter_x == 646) && counter_y >= 173 && counter_y <=177) ||
			( counter_x >= 647 && counter_x <=648 && (counter_y == 173)) ||
			( counter_x >= 647 && counter_x <=648 && (counter_y == 175)) ||
			((counter_x == 648) && (counter_y == 176)) ||
			((counter_x == 649) && (counter_y == 174)) ||
			((counter_x == 649) && (counter_y == 177))) /*r*/
			||			
			(((counter_x == 653) && (counter_y == 175)) ||
			((counter_x == 654) && (counter_y == 174)) ||
			( counter_x >= 653 && counter_x <=654 && (counter_y == 176)) ||
			((counter_x == 655) && counter_y >= 173 && counter_y <=177) ||
			((counter_x == 656) && (counter_y == 176)) ) /*4*/
			||				
			(( counter_x >= 672 && counter_x <=676 && (counter_y == 173)) ||
			((counter_x == 674) && counter_y >= 174 && counter_y <=177)) /*t*/
			||	
			(((counter_x == 678) && counter_y >= 174 && counter_y <=176) ||
			( counter_x >= 679 && counter_x <=680 && (counter_y == 173)) ||
			( counter_x >= 679 && counter_x <=680 && (counter_y == 177)) ||
			((counter_x == 681) && counter_y >= 174 && counter_y <=176)) /*o*/
			||				
			(( counter_x >= 683 && counter_x <=687 && (counter_y == 173)) ||
			((counter_x == 685) && counter_y >= 174 && counter_y <=177)) /*t*/
			||			
			(((counter_x == 689) && counter_y >= 174 && counter_y <=177) ||
			( counter_x >= 690 && counter_x <=691 && (counter_y == 173)) ||
			( counter_x >= 690 && counter_x <=691 && (counter_y == 175)) ||
			((counter_x == 692) && counter_y >= 174 && counter_y <=177)) /*a*/
			||	
			(((counter_x == 694) && counter_y >= 173 && counter_y <=177) ||
			( counter_x >= 695 && counter_x <=697 && (counter_y == 177)) ) /*l*/
			||
			(((counter_x == 469) && counter_y >= 278 && counter_y <=282) ||
			( counter_x >= 470 && counter_x <=471 && (counter_y == 278)) ||
			( counter_x >= 470 && counter_x <=471 && (counter_y == 280)) ||
			( counter_x >= 470 && counter_x <=471 && (counter_y == 282)) ||
			((counter_x == 472) && (counter_y == 279)) ||
			((counter_x == 472) && (counter_y == 281 ))) /*b*/
			||
			(((counter_x == 474) && counter_y >= 278 && counter_y <=282) || 
			( counter_x >= 475 && counter_x <=476 && (counter_y == 282)) ||
			((counter_x == 477) && counter_y >= 278 && counter_y <=282)) /*u*/
			||
			(((counter_x == 479) && counter_y >= 278 && counter_y <=282) ||
			( counter_x >= 480 && counter_x <=482 && (counter_y == 278)) ||
			( counter_x >= 480 && counter_x <=481 && (counter_y == 280))) /*f*/
			||
			(((counter_x == 484) && counter_y >= 278 && counter_y <=282) ||
			( counter_x >= 485 && counter_x <=487 && (counter_y == 278)) ||
			( counter_x >= 485 && counter_x <=486 && (counter_y == 280))) /*f*/
			||
			(((counter_x == 489) && counter_y >= 278 && counter_y <=282) ||
			( counter_x >= 490 && counter_x <=492 && (counter_y == 278)) ||
			( counter_x >= 490 && counter_x <=491 && (counter_y == 280)) ||
			( counter_x >= 490 && counter_x <=492 && (counter_y == 282))) /*e*/
			||
			(((counter_x == 494) && counter_y >= 278 && counter_y <=282) ||
			( counter_x >= 495 && counter_x <=496 && (counter_y == 278)) ||
			( counter_x >= 495 && counter_x <=496 && (counter_y == 280)) ||
			((counter_x == 496) && (counter_y == 281)) ||
			((counter_x == 497) && (counter_y == 279)) ||
			((counter_x == 497) && (counter_y == 282))) /*r*/
			||
			(((counter_x == 501) && (counter_y == 279)) ||
			((counter_x == 502) && counter_y >= 278 && counter_y <=281) ||
			( counter_x >= 501 && counter_x <=503 && (counter_y == 282))) /*1*/
			||
			(((counter_x == 519) && counter_y >= 278 && counter_y <=282) ||
			( counter_x >= 520 && counter_x <=521 && (counter_y == 278)) ||
			( counter_x >= 520 && counter_x <=521 && (counter_y == 280)) ||
			( counter_x >= 520 && counter_x <=521 && (counter_y == 282)) ||
			((counter_x == 522) && (counter_y == 279)) ||
			((counter_x == 522) && (counter_y == 281 ))) /*b*/
			||
			(((counter_x ==524) && counter_y >= 278 && counter_y <=282) || 
			( counter_x >= 525 && counter_x <=526 && (counter_y == 282)) ||
			((counter_x == 527) && counter_y >= 278 && counter_y <=282)) /*u*/
			||
			(((counter_x == 529) && counter_y >= 278 && counter_y <=282) ||
			( counter_x >= 530 && counter_x <=532 && (counter_y == 278)) ||
			( counter_x >= 530 && counter_x <=531 && (counter_y == 280))) /*f*/
			||
			(((counter_x == 534) && counter_y >= 278 && counter_y <=282) ||
			( counter_x >= 535 && counter_x <=537 && (counter_y == 278)) ||
			( counter_x >= 535 && counter_x <=536 && (counter_y == 280))) /*f*/
			||
			(((counter_x == 539) && counter_y >= 278 && counter_y <=282) ||
			( counter_x >= 540 && counter_x <=542 && (counter_y == 278)) ||
			( counter_x >= 540 && counter_x <=541 && (counter_y == 280)) ||
			( counter_x >= 540 && counter_x <=542 && (counter_y == 282))) /*e*/
			||
			(((counter_x == 544) && counter_y >= 278 && counter_y <=282) ||
			( counter_x >= 545 && counter_x <=546 && (counter_y == 278)) ||
			( counter_x >= 545 && counter_x <=546 && (counter_y == 280)) ||
			((counter_x == 546) && (counter_y == 281)) ||
			((counter_x == 547) && (counter_y == 279)) ||
			((counter_x == 547) && (counter_y == 282))) /*r*/
			||
			(((counter_x == 551) && (counter_y == 279)) ||
			( counter_x >= 552 && counter_x <=553 && (counter_y == 278)) ||
			((counter_x == 554) && (counter_y == 279)) ||
			((counter_x == 553) && (counter_y == 280)) ||
			((counter_x == 552) && (counter_y == 281)) ||
			( counter_x >= 551 && counter_x <=554 && (counter_y == 282)) ) /*2*/
			||
			(((counter_x == 570) && counter_y >= 278 && counter_y <=282) ||
			( counter_x >= 571 && counter_x <=572 && (counter_y == 278)) ||
			( counter_x >= 571 && counter_x <=572 && (counter_y == 280)) ||
			( counter_x >= 571 && counter_x <=572 && (counter_y == 282)) ||
			((counter_x == 573) && (counter_y == 279)) ||
			((counter_x == 573) && (counter_y == 281 ))) /*b*/
			||
			(((counter_x ==575) && counter_y >= 278 && counter_y <=282) || 
			( counter_x >= 576 && counter_x <=577 && (counter_y == 282)) ||
			((counter_x == 578) && counter_y >= 278 && counter_y <=282)) /*u*/
			||
			(((counter_x == 580) && counter_y >= 278 && counter_y <=282) ||
			( counter_x >= 581 && counter_x <=583 && (counter_y == 278)) ||
			( counter_x >= 581 && counter_x <=582 && (counter_y == 280))) /*f*/
			||
			(((counter_x == 585) && counter_y >= 278 && counter_y <=282) ||
			( counter_x >= 586 && counter_x <=588 && (counter_y == 278)) ||
			( counter_x >= 586 && counter_x <=587 && (counter_y == 280))) /*f*/
			||
			(((counter_x == 590) && counter_y >= 278 && counter_y <=282) ||
			( counter_x >= 591 && counter_x <=593 && (counter_y == 278)) ||
			( counter_x >= 591 && counter_x <=593 && (counter_y == 280)) ||
			( counter_x >= 591 && counter_x <=593 && (counter_y == 282))) /*e*/
			||
			(((counter_x == 595) && counter_y >= 278 && counter_y <=282) ||
			( counter_x >= 596 && counter_x <=597 && (counter_y == 278)) ||
			( counter_x >= 596 && counter_x <=597 && (counter_y == 280)) ||
			((counter_x == 597) && (counter_y == 281)) ||
			((counter_x == 598) && (counter_y == 279)) ||
			((counter_x == 598) && (counter_y == 282))) /*r*/
			||			
			(((counter_x == 602) && (counter_y == 279)) ||
			( counter_x >= 603 && counter_x <=604 && (counter_y == 278)) ||
			((counter_x == 605) && (counter_y == 279)) ||
			((counter_x == 604) && (counter_y == 280)) ||
			((counter_x == 605) && (counter_y == 281)) ||
			((counter_x == 602) && (counter_y == 281)) ||
			( counter_x >= 603 && counter_x <=604 && (counter_y == 282)) ) /*3*/
			||
			(((counter_x == 621) && counter_y >= 278 && counter_y <=282) ||
			( counter_x >= 622 && counter_x <=623 && (counter_y == 278)) ||
			( counter_x >= 622 && counter_x <=623 && (counter_y == 280)) ||
			( counter_x >= 622 && counter_x <=623 && (counter_y == 282)) ||
			((counter_x == 624) && (counter_y == 279)) ||
			((counter_x == 624) && (counter_y == 281 ))) /*b*/
			||
			(((counter_x ==626) && counter_y >= 278 && counter_y <=282) || 
			( counter_x >= 627 && counter_x <=628 && (counter_y == 282)) ||
			((counter_x == 629) && counter_y >= 278 && counter_y <=282)) /*u*/
			||
			(((counter_x == 631) && counter_y >= 278 && counter_y <=282) ||
			( counter_x >= 632 && counter_x <=634 && (counter_y == 278)) ||
			( counter_x >= 632 && counter_x <=633 && (counter_y == 280))) /*f*/
			||
			(((counter_x == 636) && counter_y >= 278 && counter_y <=282) ||
			( counter_x >= 637 && counter_x <=639 && (counter_y == 278)) ||
			( counter_x >= 637 && counter_x <=638 && (counter_y == 280))) /*f*/
			||
			(((counter_x == 641) && counter_y >= 278 && counter_y <=282) ||
			( counter_x >= 642 && counter_x <=644 && (counter_y == 278)) ||
			( counter_x >= 642 && counter_x <=644 && (counter_y == 280)) ||
			( counter_x >= 642 && counter_x <=644 && (counter_y == 282))) /*e*/
			||
			(((counter_x == 646) && counter_y >= 278 && counter_y <=282) ||
			( counter_x >= 647 && counter_x <=648 && (counter_y == 278)) ||
			( counter_x >= 647 && counter_x <=648 && (counter_y == 280)) ||
			((counter_x == 648) && (counter_y == 281)) ||
			((counter_x == 649) && (counter_y == 279)) ||
			((counter_x == 649) && (counter_y == 282))) /*r*/
			||			
			(((counter_x == 653) && (counter_y == 280)) ||
			((counter_x == 654) && (counter_y == 279)) ||
			( counter_x >= 653 && counter_x <=654 && (counter_y == 281)) ||
			((counter_x == 655) && counter_y >= 278 && counter_y <=282) ||
			((counter_x == 656) && (counter_y == 281)) ) /*4*/
			||				
			(( counter_x >= 672 && counter_x <=676 && (counter_y == 278)) ||
			((counter_x == 674) && counter_y >= 279 && counter_y <=282)) /*t*/
			||	
			(((counter_x == 678) && counter_y >= 279 && counter_y <=281) ||
			( counter_x >= 679 && counter_x <=680 && (counter_y == 278)) ||
			( counter_x >= 679 && counter_x <=680 && (counter_y == 282)) ||
			((counter_x == 681) && counter_y >= 279 && counter_y <=281)) /*o*/
			||				
			(( counter_x >= 683 && counter_x <=687 && (counter_y == 278)) ||
			((counter_x == 685) && counter_y >= 279 && counter_y <=282)) /*t*/
			||			
			(((counter_x == 689) && counter_y >= 279 && counter_y <=282) ||
			( counter_x >= 690 && counter_x <=691 && (counter_y == 278)) ||
			( counter_x >= 690 && counter_x <=691 && (counter_y == 280)) ||
			((counter_x == 692) && counter_y >= 279 && counter_y <=282)) /*a*/
			||	
			(((counter_x == 694) && counter_y >= 278 && counter_y <=282) ||
			( counter_x >= 695 && counter_x <=697 && (counter_y == 282)) ) /*l*/
		   ||
			(((counter_x == 469) && counter_y >= 383 && counter_y <=387) ||
			( counter_x >= 470 && counter_x <=471 && (counter_y == 383)) ||
			( counter_x >= 470 && counter_x <=471 && (counter_y == 385)) ||
			( counter_x >= 470 && counter_x <=471 && (counter_y == 387)) ||
			((counter_x == 472) && (counter_y == 384)) ||
			((counter_x == 472) && (counter_y == 386 ))) /*b*/
			||
			(((counter_x == 474) && counter_y >= 383 && counter_y <=387) || 
			( counter_x >= 475 && counter_x <=476 && (counter_y == 387)) ||
			((counter_x == 477) && counter_y >= 383 && counter_y <=387)) /*u*/
			||
			(((counter_x == 479) && counter_y >= 383 && counter_y <=387) ||
			( counter_x >= 480 && counter_x <=482 && (counter_y == 383)) ||
			( counter_x >= 480 && counter_x <=481 && (counter_y == 385))) /*f*/
			||
			(((counter_x == 484) && counter_y >= 383 && counter_y <=387) ||
			( counter_x >= 485 && counter_x <=487 && (counter_y == 383)) ||
			( counter_x >= 485 && counter_x <=486 && (counter_y == 385))) /*f*/
			||
			(((counter_x == 489) && counter_y >= 383 && counter_y <=387) ||
			( counter_x >= 490 && counter_x <=492 && (counter_y == 383)) ||
			( counter_x >= 490 && counter_x <=491 && (counter_y == 385)) ||
			( counter_x >= 490 && counter_x <=492 && (counter_y == 387))) /*e*/
			||
			(((counter_x == 494) && counter_y >= 383 && counter_y <=387) ||
			( counter_x >= 495 && counter_x <=496 && (counter_y == 383)) ||
			( counter_x >= 495 && counter_x <=496 && (counter_y == 385)) ||
			((counter_x == 496) && (counter_y == 386)) ||
			((counter_x == 497) && (counter_y == 384)) ||
			((counter_x == 497) && (counter_y == 387))) /*r*/
			||
			(((counter_x == 501) && (counter_y == 384)) ||
			((counter_x == 502) && counter_y >= 383 && counter_y <=386) ||
			( counter_x >= 501 && counter_x <=503 && (counter_y == 387))) /*1*/
			||
			(((counter_x == 519) && counter_y >= 383 && counter_y <=387) ||
			( counter_x >= 520 && counter_x <=521 && (counter_y == 383)) ||
			( counter_x >= 520 && counter_x <=521 && (counter_y == 385)) ||
			( counter_x >= 520 && counter_x <=521 && (counter_y == 387)) ||
			((counter_x == 522) && (counter_y == 384)) ||
			((counter_x == 522) && (counter_y == 386 ))) /*b*/
			||
			(((counter_x ==524) && counter_y >= 383 && counter_y <=387) || 
			( counter_x >= 525 && counter_x <=526 && (counter_y == 387)) ||
			((counter_x == 527) && counter_y >= 383 && counter_y <=387)) /*u*/
			||
			(((counter_x == 529) && counter_y >= 383 && counter_y <=387) ||
			( counter_x >= 530 && counter_x <=532 && (counter_y == 383)) ||
			( counter_x >= 530 && counter_x <=531 && (counter_y == 385))) /*f*/
			||
			(((counter_x == 534) && counter_y >= 383 && counter_y <=387) ||
			( counter_x >= 535 && counter_x <=537 && (counter_y == 383)) ||
			( counter_x >= 535 && counter_x <=536 && (counter_y == 385))) /*f*/
			||
			(((counter_x == 539) && counter_y >= 383 && counter_y <=387) ||
			( counter_x >= 540 && counter_x <=542 && (counter_y == 383)) ||
			( counter_x >= 540 && counter_x <=541 && (counter_y == 385)) ||
			( counter_x >= 540 && counter_x <=542 && (counter_y == 387))) /*e*/
			||
			(((counter_x == 544) && counter_y >= 383 && counter_y <=387) ||
			( counter_x >= 545 && counter_x <=546 && (counter_y == 383)) ||
			( counter_x >= 545 && counter_x <=546 && (counter_y == 385)) ||
			((counter_x == 546) && (counter_y == 386)) ||
			((counter_x == 547) && (counter_y == 384)) ||
			((counter_x == 547) && (counter_y == 387))) /*r*/
			||
			(((counter_x == 551) && (counter_y == 384)) ||
			( counter_x >= 552 && counter_x <=553 && (counter_y == 383)) ||
			((counter_x == 554) && (counter_y == 384)) ||
			((counter_x == 553) && (counter_y == 385)) ||
			((counter_x == 552) && (counter_y == 386)) ||
			( counter_x >= 551 && counter_x <=554 && (counter_y == 387)) ) /*2*/
			||
			(((counter_x == 570) && counter_y >= 383 && counter_y <=387) ||
			( counter_x >= 571 && counter_x <=572 && (counter_y == 383)) ||
			( counter_x >= 571 && counter_x <=572 && (counter_y == 385)) ||
			( counter_x >= 571 && counter_x <=572 && (counter_y == 387)) ||
			((counter_x == 573) && (counter_y == 384)) ||
			((counter_x == 573) && (counter_y == 386 ))) /*b*/
			||
			(((counter_x ==575) && counter_y >= 383 && counter_y <=387) || 
			( counter_x >= 576 && counter_x <=577 && (counter_y == 387)) ||
			((counter_x == 578) && counter_y >= 383 && counter_y <=387)) /*u*/
			||
			(((counter_x == 580) && counter_y >= 383 && counter_y <=387) ||
			( counter_x >= 581 && counter_x <=583 && (counter_y == 383)) ||
			( counter_x >= 581 && counter_x <=582 && (counter_y == 385))) /*f*/
			||
			(((counter_x == 585) && counter_y >= 383 && counter_y <=387) ||
			( counter_x >= 586 && counter_x <=588 && (counter_y == 383)) ||
			( counter_x >= 586 && counter_x <=587 && (counter_y == 385))) /*f*/
			||
			(((counter_x == 590) && counter_y >= 383 && counter_y <=387) ||
			( counter_x >= 591 && counter_x <=593 && (counter_y == 383)) ||
			( counter_x >= 591 && counter_x <=593 && (counter_y == 385)) ||
			( counter_x >= 591 && counter_x <=593 && (counter_y == 387))) /*e*/
			||
			(((counter_x == 595) && counter_y >= 383 && counter_y <=387) ||
			( counter_x >= 596 && counter_x <=597 && (counter_y == 383)) ||
			( counter_x >= 596 && counter_x <=597 && (counter_y == 385)) ||
			((counter_x == 597) && (counter_y == 386)) ||
			((counter_x == 598) && (counter_y == 384)) ||
			((counter_x == 598) && (counter_y == 387))) /*r*/
			||			
			(((counter_x == 602) && (counter_y == 384)) ||
			( counter_x >= 603 && counter_x <=604 && (counter_y == 383)) ||
			((counter_x == 605) && (counter_y == 384)) ||
			((counter_x == 604) && (counter_y == 385)) ||
			((counter_x == 605) && (counter_y == 386)) ||
			((counter_x == 602) && (counter_y == 386)) ||
			( counter_x >= 603 && counter_x <=604 && (counter_y == 387)) ) /*3*/
			||
			(((counter_x == 621) && counter_y >= 383 && counter_y <=387) ||
			( counter_x >= 622 && counter_x <=623 && (counter_y == 383)) ||
			( counter_x >= 622 && counter_x <=623 && (counter_y == 385)) ||
			( counter_x >= 622 && counter_x <=623 && (counter_y == 387)) ||
			((counter_x == 624) && (counter_y == 384)) ||
			((counter_x == 624) && (counter_y == 386 ))) /*b*/
			||
			(((counter_x ==626) && counter_y >= 383 && counter_y <=387) || 
			( counter_x >= 627 && counter_x <=628 && (counter_y == 387)) ||
			((counter_x == 629) && counter_y >= 383 && counter_y <=387)) /*u*/
			||
			(((counter_x == 631) && counter_y >= 383 && counter_y <=387) ||
			( counter_x >= 632 && counter_x <=634 && (counter_y == 383)) ||
			( counter_x >= 632 && counter_x <=633 && (counter_y == 385))) /*f*/
			||
			(((counter_x == 636) && counter_y >= 383 && counter_y <=387) ||
			( counter_x >= 637 && counter_x <=639 && (counter_y == 383)) ||
			( counter_x >= 637 && counter_x <=638 && (counter_y == 385))) /*f*/
			||
			(((counter_x == 641) && counter_y >= 383 && counter_y <=387) ||
			( counter_x >= 642 && counter_x <=644 && (counter_y == 383)) ||
			( counter_x >= 642 && counter_x <=644 && (counter_y == 385)) ||
			( counter_x >= 642 && counter_x <=644 && (counter_y == 387))) /*e*/
			||
			(((counter_x == 646) && counter_y >= 383 && counter_y <=387) ||
			( counter_x >= 647 && counter_x <=648 && (counter_y == 383)) ||
			( counter_x >= 647 && counter_x <=648 && (counter_y == 385)) ||
			((counter_x == 648) && (counter_y == 386)) ||
			((counter_x == 649) && (counter_y == 384)) ||
			((counter_x == 649) && (counter_y == 387))) /*r*/
			||			
			(((counter_x == 653) && (counter_y == 385)) ||
			((counter_x == 654) && (counter_y == 384)) ||
			( counter_x >= 653 && counter_x <=654 && (counter_y == 386)) ||
			((counter_x == 655) && counter_y >= 383 && counter_y <=387) ||
			((counter_x == 656) && (counter_y == 386)) ) /*4*/
			||				
			(( counter_x >= 672 && counter_x <=676 && (counter_y == 383)) ||
			((counter_x == 674) && counter_y >= 384 && counter_y <=387)) /*t*/
			||	
			(((counter_x == 678) && counter_y >= 384 && counter_y <=386) ||
			( counter_x >= 679 && counter_x <=680 && (counter_y == 383)) ||
			( counter_x >= 679 && counter_x <=680 && (counter_y == 387)) ||
			((counter_x == 681) && counter_y >= 384 && counter_y <=386)) /*o*/
			||				
			(( counter_x >= 683 && counter_x <=687 && (counter_y == 383)) ||
			((counter_x == 685) && counter_y >= 384 && counter_y <=387)) /*t*/
			||			
			(((counter_x == 689) && counter_y >= 384 && counter_y <=387) ||
			( counter_x >= 690 && counter_x <=691 && (counter_y == 383)) ||
			( counter_x >= 690 && counter_x <=691 && (counter_y == 385)) ||
			((counter_x == 692) && counter_y >= 384 && counter_y <=387)) /*a*/
			||	
			(((counter_x == 694) && counter_y >= 383 && counter_y <=387) ||
			( counter_x >= 695 && counter_x <=697 && (counter_y == 387)) ) /*l*/
			||
			(((counter_x == 177 || counter_x == 178) && counter_y >= 116 && counter_y <=321) ||
			((counter_x == 211 || counter_x == 212) && counter_y >= 116 && counter_y <=321) ||
			( counter_x >= 179 && counter_x <=210 && (counter_y == 116 || counter_y == 117)) ||
			( counter_x >= 179 && counter_x <=210 && (counter_y == 150 || counter_y == 151)) ||
			( counter_x >= 179 && counter_x <=210 && (counter_y == 184 || counter_y == 185)) ||
			( counter_x >= 179 && counter_x <=210 && (counter_y == 218 || counter_y == 219)) ||
			( counter_x >= 179 && counter_x <=210 && (counter_y == 252 || counter_y == 253)) ||
			( counter_x >= 179 && counter_x <=210 && (counter_y == 286 || counter_y == 287)) ||
			( counter_x >= 179 && counter_x <=210 && (counter_y == 320 || counter_y == 321)) ) /*buffer 1*/
			||
			(((counter_x == 238 || counter_x == 239) && counter_y >= 116 && counter_y <=321) ||
			((counter_x == 272 || counter_x == 273) && counter_y >= 116 && counter_y <=321) ||
			( counter_x >= 240 && counter_x <=271 && (counter_y == 116 || counter_y == 117)) ||
			( counter_x >= 240 && counter_x <=271 && (counter_y == 150 || counter_y == 151)) ||
			( counter_x >= 240 && counter_x <=271 && (counter_y == 184 || counter_y == 185)) ||
			( counter_x >= 240 && counter_x <=271 && (counter_y == 218 || counter_y == 219)) ||
			( counter_x >= 240 && counter_x <=271 && (counter_y == 252 || counter_y == 253)) ||
			( counter_x >= 240 && counter_x <=271 && (counter_y == 286 || counter_y == 287)) ||
			( counter_x >= 240 && counter_x <=271 && (counter_y == 320 || counter_y == 321)) ) /*buffer 2*/
			||
			(((counter_x == 299 || counter_x == 300) && counter_y >= 116 && counter_y <=321) ||
			((counter_x == 333 || counter_x == 334) && counter_y >= 116 && counter_y <=321) ||
			( counter_x >= 301 && counter_x <=332 && (counter_y == 116 || counter_y == 117)) ||
			( counter_x >= 301 && counter_x <=332 && (counter_y == 150 || counter_y == 151)) ||
			( counter_x >= 301 && counter_x <=332 && (counter_y == 184 || counter_y == 185)) ||
			( counter_x >= 301 && counter_x <=332 && (counter_y == 218 || counter_y == 219)) ||
			( counter_x >= 301 && counter_x <=332 && (counter_y == 252 || counter_y == 253)) ||
			( counter_x >= 301 && counter_x <=332 && (counter_y == 286 || counter_y == 287)) ||
			( counter_x >= 301 && counter_x <=332 && (counter_y == 320 || counter_y == 321)) ) /*buffer 3*/
			||
			(((counter_x == 360 || counter_x == 361) && counter_y >= 116 && counter_y <=321) ||
			((counter_x == 394 || counter_x == 395) && counter_y >= 116 && counter_y <=321) ||
			( counter_x >= 362 && counter_x <=393 && (counter_y == 116 || counter_y == 117)) ||
			( counter_x >= 362 && counter_x <=393 && (counter_y == 150 || counter_y == 151)) ||
			( counter_x >= 362 && counter_x <=393 && (counter_y == 184 || counter_y == 185)) ||
			( counter_x >= 362 && counter_x <=393 && (counter_y == 218 || counter_y == 219)) ||
			( counter_x >= 362 && counter_x <=393 && (counter_y == 252 || counter_y == 253)) ||
			( counter_x >= 362 && counter_x <=393 && (counter_y == 286 || counter_y == 287)) ||
			( counter_x >= 362 && counter_x <=393 && (counter_y == 320 || counter_y == 321)) ) /*buffer 4*/
			||
			(((counter_x == 238 || counter_x == 239) && counter_y >= 414 && counter_y <=449) ||
			((counter_x == 333 || counter_x == 334) && counter_y >= 414 && counter_y <=449)  ||
			( counter_x >= 240 && counter_x <=332 && (counter_y == 414 || counter_y == 415)) ||
			( counter_x >= 240 && counter_x <=332 && (counter_y == 448 || counter_y == 449)) ) /*output box*/
			||
			(((counter_x == 177) && counter_y >= 108 && counter_y <=112) ||
			( counter_x >= 178 && counter_x <=179 && (counter_y == 108)) ||
			( counter_x >= 178 && counter_x <=179 && (counter_y == 110)) ||
			( counter_x >= 178 && counter_x <=179 && (counter_y == 112)) ||
			((counter_x == 180) && (counter_y == 109)) ||
			((counter_x == 180) && (counter_y == 111 ))) /*b*/
			||
			(((counter_x == 182) && counter_y >= 108 && counter_y <=112) || 
			( counter_x >= 183 && counter_x <=184 && (counter_y == 112)) ||
			((counter_x == 185) && counter_y >= 108 && counter_y <=112)) /*u*/
			||
			(((counter_x == 187) && counter_y >= 108 && counter_y <=112) ||
			( counter_x >= 188 && counter_x <=190 && (counter_y == 108)) ||
			( counter_x >= 188 && counter_x <=189 && (counter_y == 110))) /*f*/
			||
			(((counter_x == 192) && counter_y >= 108 && counter_y <=112) ||
			( counter_x >= 193 && counter_x <=195 && (counter_y == 108)) ||
			( counter_x >= 193 && counter_x <=194 && (counter_y == 110))) /*f*/
			||
			(((counter_x == 197) && counter_y >= 108 && counter_y <=112) ||
			( counter_x >= 198 && counter_x <=200 && (counter_y == 108)) ||
			( counter_x >= 198 && counter_x <=199 && (counter_y == 110)) ||
			( counter_x >= 198 && counter_x <=200 && (counter_y == 112))) /*e*/
			||
			(((counter_x == 202) && counter_y >= 108 && counter_y <=112) ||
			( counter_x >= 203 && counter_x <=204 && (counter_y == 108)) ||
			( counter_x >= 203 && counter_x <=204 && (counter_y == 110)) ||
			((counter_x == 204) && (counter_y == 111)) ||
			((counter_x == 205) && (counter_y == 109)) ||
			((counter_x == 205) && (counter_y == 112))) /*r*/
			||
			(((counter_x == 209) && (counter_y == 109)) ||
			((counter_x == 210) && counter_y >= 108 && counter_y <=111) ||
			( counter_x >= 209 && counter_x <=211 && (counter_y == 112))) /*1*/
			||
			(((counter_x == 238) && counter_y >= 108 && counter_y <=112) ||
			( counter_x >= 239 && counter_x <=240 && (counter_y == 108)) ||
			( counter_x >= 239 && counter_x <=240 && (counter_y == 110)) ||
			( counter_x >= 239 && counter_x <=240 && (counter_y == 112)) ||
			((counter_x == 241) && (counter_y == 109)) ||
			((counter_x == 241) && (counter_y == 111 ))) /*b*/
			||
			(((counter_x == 243) && counter_y >= 108 && counter_y <=112) || 
			( counter_x >= 244 && counter_x <=245 && (counter_y == 112)) ||
			((counter_x == 246) && counter_y >= 108 && counter_y <=112)) /*u*/
			||
			(((counter_x == 248) && counter_y >= 108 && counter_y <=112) ||
			( counter_x >= 249 && counter_x <=251 && (counter_y == 108)) ||
			( counter_x >= 249 && counter_x <=250 && (counter_y == 110))) /*f*/
			||
			(((counter_x == 253) && counter_y >= 108 && counter_y <=112) ||
			( counter_x >= 254 && counter_x <=256 && (counter_y == 108)) ||
			( counter_x >= 254 && counter_x <=255 && (counter_y == 110))) /*f*/
			||
			(((counter_x == 258) && counter_y >= 108 && counter_y <=112) ||
			( counter_x >= 259 && counter_x <=261 && (counter_y == 108)) ||
			( counter_x >= 259 && counter_x <=260 && (counter_y == 110)) ||
			( counter_x >= 259 && counter_x <=261 && (counter_y == 112))) /*e*/
			||
			(((counter_x == 263) && counter_y >= 108 && counter_y <=112) ||
			( counter_x >= 264 && counter_x <=265 && (counter_y == 108)) ||
			( counter_x >= 264 && counter_x <=265 && (counter_y == 110)) ||
			((counter_x == 265) && (counter_y == 111)) ||
			((counter_x == 266) && (counter_y == 109)) ||
			((counter_x == 266) && (counter_y == 112))) /*r*/
			||
			(((counter_x == 270) && (counter_y == 109)) ||
			( counter_x >= 271 && counter_x <=272 && (counter_y == 108)) ||
			((counter_x == 273) && (counter_y == 109)) ||
			((counter_x == 272) && (counter_y == 110)) ||
			((counter_x == 271) && (counter_y == 111)) ||
			( counter_x >= 270 && counter_x <=273 && (counter_y == 112)) ) /*2*/
			||
			(((counter_x == 299) && counter_y >= 108 && counter_y <=112) ||
			( counter_x >= 300 && counter_x <=301 && (counter_y == 108)) ||
			( counter_x >= 300 && counter_x <=301 && (counter_y == 110)) ||
			( counter_x >= 300 && counter_x <=301 && (counter_y == 112)) ||
			((counter_x == 302) && (counter_y == 109)) ||
			((counter_x == 302) && (counter_y == 111 ))) /*b*/
			||
			(((counter_x == 304) && counter_y >= 108 && counter_y <=112) || 
			( counter_x >= 305 && counter_x <=306 && (counter_y == 112)) ||
			((counter_x == 307) && counter_y >= 108 && counter_y <=112)) /*u*/
			||
			(((counter_x == 309) && counter_y >= 108 && counter_y <=112) ||
			( counter_x >= 310 && counter_x <=312 && (counter_y == 108)) ||
			( counter_x >= 310 && counter_x <=311 && (counter_y == 110))) /*f*/
			||
			(((counter_x == 314) && counter_y >= 108 && counter_y <=112) ||
			( counter_x >= 315 && counter_x <=317 && (counter_y == 108)) ||
			( counter_x >= 315 && counter_x <=316 && (counter_y == 110))) /*f*/
			||
			(((counter_x == 319) && counter_y >= 108 && counter_y <=112) ||
			( counter_x >= 320 && counter_x <=322 && (counter_y == 108)) ||
			( counter_x >= 320 && counter_x <=321 && (counter_y == 110)) ||
			( counter_x >= 320 && counter_x <=322 && (counter_y == 112))) /*e*/
			||
			(((counter_x == 324) && counter_y >= 108 && counter_y <=112) ||
			( counter_x >= 325 && counter_x <=326 && (counter_y == 108)) ||
			( counter_x >= 325 && counter_x <=326 && (counter_y == 110)) ||
			((counter_x == 326) && (counter_y == 111)) ||
			((counter_x == 327) && (counter_y == 109)) ||
			((counter_x == 327) && (counter_y == 112))) /*r*/
			||
			(((counter_x == 331) && (counter_y == 109)) ||
			( counter_x >= 332 && counter_x <=333 && (counter_y == 108)) ||
			((counter_x == 334) && (counter_y == 109)) ||
			((counter_x == 333) && (counter_y == 110)) ||
			((counter_x == 334) && (counter_y == 111)) ||
			((counter_x == 331) && (counter_y == 111)) ||
			( counter_x >= 332 && counter_x <=333 && (counter_y == 112)) ) /*3*/
			||
			(((counter_x == 360) && counter_y >= 108 && counter_y <=112) ||
			( counter_x >= 361 && counter_x <=362 && (counter_y == 108)) ||
			( counter_x >= 361 && counter_x <=362 && (counter_y == 110)) ||
			( counter_x >= 361 && counter_x <=362 && (counter_y == 112)) ||
			((counter_x == 363) && (counter_y == 109)) ||
			((counter_x == 363) && (counter_y == 111 ))) /*b*/
			||
			(((counter_x == 365) && counter_y >= 108 && counter_y <=112) || 
			( counter_x >= 366 && counter_x <=367 && (counter_y == 112)) ||
			((counter_x == 368) && counter_y >= 108 && counter_y <=112)) /*u*/
			||
			(((counter_x == 370) && counter_y >= 108 && counter_y <=112) ||
			( counter_x >= 371 && counter_x <=373 && (counter_y == 108)) ||
			( counter_x >= 371 && counter_x <=372 && (counter_y == 110))) /*f*/
			||
			(((counter_x == 375) && counter_y >= 108 && counter_y <=112) ||
			( counter_x >= 376 && counter_x <=378 && (counter_y == 108)) ||
			( counter_x >= 376 && counter_x <=377 && (counter_y == 110))) /*f*/
			||
			(((counter_x == 380) && counter_y >= 108 && counter_y <=112) ||
			( counter_x >= 381 && counter_x <=383 && (counter_y == 108)) ||
			( counter_x >= 381 && counter_x <=382 && (counter_y == 110)) ||
			( counter_x >= 381 && counter_x <=383 && (counter_y == 112))) /*e*/
			||
			(((counter_x == 385) && counter_y >= 108 && counter_y <=112) ||
			( counter_x >= 386 && counter_x <=387 && (counter_y == 108)) ||
			( counter_x >= 386 && counter_x <=387 && (counter_y == 110)) ||
			((counter_x == 387) && (counter_y == 111)) ||
			((counter_x == 388) && (counter_y == 109)) ||
			((counter_x == 388) && (counter_y == 112))) /*r*/
			||
			(((counter_x == 392) && (counter_y == 110)) ||
			((counter_x == 393) && (counter_y == 109)) ||
			( counter_x >= 392 && counter_x <=393 && (counter_y == 111)) ||
			((counter_x == 394) && counter_y >= 108 && counter_y <=112) ||
			((counter_x == 395) && (counter_y == 111)) ) /*4*/
		)
		   begin
			   if (show < 50000000)
				begin
			   r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'h0; show <= show+1;
				end
				else if (show >=50000000 && show < 100000000)
				begin
			   r_red <= 8'h0; r_blue <= 8'hFF; r_green <= 8'hFF; show <= show+1;
				end
				else if (show >=100000000 && show < 150000000)
				begin
			   r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0; show <= show+1;
				end
				else
				begin
				show <=0;
				end
		   end
	
	
/*buffer 1 starts*/

			else if ((counter_x >= 179 && counter_x <= 210 && counter_y >= 288 && counter_y <=319))
			begin
			   if (b1[2] == 1)
				begin
				   case(b1[1:0])
					   2'b00 : 
						begin
						if((((counter_x == 191 || counter_x == 192) && counter_y >= 301 && counter_y <=306) ||
			         ( counter_x >= 193 && counter_x <=196 && (counter_y == 299 || counter_y ==300)) ||
			         ( counter_x >= 193 && counter_x <=196 && (counter_y == 307 || counter_y ==308)) ||
			         ((counter_x == 197 || counter_x == 198) && counter_y >= 301 && counter_y <=306))) /*0*/		
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'h0;
						end
						end
			         2'b01 : 
						begin
						if((((counter_x == 192 || counter_x == 193) && (counter_y == 301 || counter_y == 302)) ||
						((counter_x == 194 || counter_x == 195) && (counter_y >= 299 && counter_y <=306)) ||
						( counter_x >= 192 && counter_x <=197 && (counter_y == 307 || counter_y == 308)))) /*1*/					
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'h0;
						end
						end
						2'b10 : 
						begin
						if((((counter_x == 191 || counter_x == 192) && (counter_y == 301 || counter_y == 302)) ||
						( counter_x >= 193 && counter_x <=196 && (counter_y == 299 || counter_y == 300)) ||
						((counter_x == 197 || counter_x == 198) && (counter_y == 301 || counter_y == 302)) ||
						((counter_x == 195 || counter_x == 196) && (counter_y == 303 || counter_y == 304)) ||
						((counter_x == 193 || counter_x == 194) && (counter_y == 305 || counter_y == 306)) ||
						( counter_x >= 191 && counter_x <=198 && (counter_y == 307 || counter_y == 308)))) /*2*/				
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'h0;
						end
						end
						2'b11 : 
						begin
						if((((counter_x == 191 || counter_x == 192) && (counter_y == 301 || counter_y == 302)) ||
						( counter_x >= 193 && counter_x <=196 && (counter_y == 299 || counter_y == 300)) ||
						((counter_x == 197 || counter_x == 198) && (counter_y == 301 || counter_y ==302)) ||
						((counter_x == 195 || counter_x == 196) && (counter_y == 303 || counter_y == 304)) ||
						((counter_x == 197 || counter_x == 198) && (counter_y == 305 || counter_y == 306)) ||
						((counter_x == 191 || counter_x == 192) && (counter_y == 305 || counter_y == 306)) ||
						( counter_x >= 193 && counter_x <=196 && (counter_y == 307 || counter_y == 308)) ))  /*3*/					
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'h0;
						end
						end
					endcase
				end
			   else
				begin
				r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
				end
			end /*b1.1, 6. kutu*/
			
			else if ((counter_x >= 179 && counter_x <= 210 && counter_y >= 254 && counter_y <=285))
			begin
			   if (b1[5] == 1)
				begin
				   case(b1[4:3])
					   2'b00 : 
						begin
						if((((counter_x == 191 || counter_x == 192) && counter_y >= 267 && counter_y <=272) ||
			         ( counter_x >= 193 && counter_x <=196 && (counter_y == 265 || counter_y ==266)) ||
			         ( counter_x >= 193 && counter_x <=196 && (counter_y == 273 || counter_y ==274)) ||
			         ((counter_x == 197 || counter_x == 198) && counter_y >= 267 && counter_y <=272))) /*0*/	
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'h0;
						end
						end
			         2'b01 : 
						begin
						if((((counter_x == 192 || counter_x == 193) && (counter_y == 267 || counter_y == 268)) ||
						((counter_x == 194 || counter_x == 195) && (counter_y >= 265 && counter_y <=272)) ||
						( counter_x >= 192 && counter_x <=197 && (counter_y == 273 || counter_y == 274)))) /*1*/	
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'h0;
						end
						end
						2'b10 : 
						begin
						if((((counter_x == 191 || counter_x == 192) && (counter_y == 267 || counter_y == 268)) ||
						( counter_x >= 193 && counter_x <=196 && (counter_y == 265 || counter_y == 266)) ||
						((counter_x == 197 || counter_x == 198) && (counter_y == 267 || counter_y == 268)) ||
						((counter_x == 195 || counter_x == 196) && (counter_y == 269 || counter_y == 270)) ||
						((counter_x == 193 || counter_x == 194) && (counter_y == 271 || counter_y == 272)) ||
						( counter_x >= 191 && counter_x <=198 && (counter_y == 273 || counter_y == 274)))) /*2*/			
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'h0;
						end
						end
						2'b11 : 
						begin
						if((((counter_x == 191 || counter_x == 192) && (counter_y == 267 || counter_y == 268)) ||
						( counter_x >= 193 && counter_x <=196 && (counter_y == 265 || counter_y == 266)) ||
						((counter_x == 197 || counter_x == 198) && (counter_y == 267 || counter_y ==268)) ||
						((counter_x == 195 || counter_x == 196) && (counter_y == 269 || counter_y == 270)) ||
						((counter_x == 197 || counter_x == 198) && (counter_y == 271 || counter_y == 272)) ||
						((counter_x == 191 || counter_x == 192) && (counter_y == 271 || counter_y == 272)) ||
						( counter_x >= 193 && counter_x <=196 && (counter_y == 273 || counter_y == 274)) ))  /*3*/				
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'h0;
						end
					 end
					endcase
		      end
			   else
				begin
				r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
				end
			end /*b1.2, 5. kutu*/	
			
			else if ((counter_x >= 179 && counter_x <= 210 && counter_y >= 220 && counter_y <=251))
			begin
			   if (b1[8] == 1)
				begin
				   case(b1[7:6])
					   2'b00 : 
						begin
						if((((counter_x == 191 || counter_x == 192) && counter_y >= 233 && counter_y <=238) ||
			         ( counter_x >= 193 && counter_x <=196 && (counter_y == 231 || counter_y ==232)) ||
			         ( counter_x >= 193 && counter_x <=196 && (counter_y == 239 || counter_y ==240)) ||
			         ((counter_x == 197 || counter_x == 198) && counter_y >= 233 && counter_y <=238))) /*0*/						
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'h0;
						end
						end
			         2'b01 : 
						begin
						if((((counter_x == 192 || counter_x == 193) && (counter_y == 233 || counter_y == 234)) ||
						((counter_x == 194 || counter_x == 195) && (counter_y >= 231 && counter_y <=238)) ||
						( counter_x >= 192 && counter_x <=197 && (counter_y == 239 || counter_y == 240)))) /*1*/						
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'h0;
						end
						end
						2'b10 : 
						begin
						if((((counter_x == 191 || counter_x == 192) && (counter_y == 233 || counter_y == 234)) ||
						( counter_x >= 193 && counter_x <=196 && (counter_y == 231 || counter_y == 232)) ||
						((counter_x == 197 || counter_x == 198) && (counter_y == 233 || counter_y == 234)) ||
						((counter_x == 195 || counter_x == 196) && (counter_y == 235 || counter_y == 236)) ||
						((counter_x == 193 || counter_x == 194) && (counter_y == 237 || counter_y == 238)) ||
						( counter_x >= 191 && counter_x <=198 && (counter_y == 239 || counter_y == 240)))) /*2*/		
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'h0;
						end
						end
						2'b11 : 
						begin
						if((((counter_x == 191 || counter_x == 192) && (counter_y == 233 || counter_y == 234)) ||
						( counter_x >= 193 && counter_x <=196 && (counter_y == 231 || counter_y == 232)) ||
						((counter_x == 197 || counter_x == 198) && (counter_y == 233 || counter_y ==234)) ||
						((counter_x == 195 || counter_x == 196) && (counter_y == 235 || counter_y == 236)) ||
						((counter_x == 197 || counter_x == 198) && (counter_y == 237 || counter_y == 238)) ||
						((counter_x == 191 || counter_x == 192) && (counter_y == 237 || counter_y == 238)) ||
						( counter_x >= 193 && counter_x <=196 && (counter_y == 239 || counter_y == 240)) ))  /*3*/		
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'h0;
						end
						end
					endcase
				end
				
				else
				begin
				   r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
				end
			end /*b1.3, 4. kutu*/
			
			else if ((counter_x >= 179 && counter_x <= 210 && counter_y >= 186 && counter_y <=217))
			begin
			   if (b1[11] == 1)
				begin
				   case(b1[10:9])
					   2'b00 : 
						begin
						if((((counter_x == 191 || counter_x == 192) && counter_y >= 199 && counter_y <=204) ||
			         ( counter_x >= 193 && counter_x <=196 && (counter_y == 197 || counter_y ==198)) ||
			         ( counter_x >= 193 && counter_x <=196 && (counter_y == 205 || counter_y ==206)) ||
			         ((counter_x == 197 || counter_x == 198) && counter_y >= 199 && counter_y <=204))) /*0*/				
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'h0;
						end
						end
			         2'b01 : 
						begin
						if((((counter_x == 192 || counter_x == 193) && (counter_y == 199 || counter_y == 200)) ||
						((counter_x == 194 || counter_x == 195) && (counter_y >= 197 && counter_y <=204)) ||
						( counter_x >= 192 && counter_x <=197 && (counter_y == 205 || counter_y == 206)))) /*1*/		
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'h0;
						end
						end
						2'b10 : 
						begin
						if((((counter_x == 191 || counter_x == 192) && (counter_y == 199 || counter_y == 200)) ||
						( counter_x >= 193 && counter_x <=196 && (counter_y == 197 || counter_y == 198)) ||
						((counter_x == 197 || counter_x == 198) && (counter_y == 199 || counter_y == 200)) ||
						((counter_x == 195 || counter_x == 196) && (counter_y == 201 || counter_y == 202)) ||
						((counter_x == 193 || counter_x == 194) && (counter_y == 203 || counter_y == 204)) ||
						( counter_x >= 191 && counter_x <=198 && (counter_y == 205 || counter_y == 206)))) /*2*/		
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'h0;
						end
						end
						2'b11 : 
						begin
						if((((counter_x == 191 || counter_x == 192) && (counter_y == 199 || counter_y == 200)) ||
						( counter_x >= 193 && counter_x <=196 && (counter_y == 197 || counter_y == 198)) ||
						((counter_x == 197 || counter_x == 198) && (counter_y == 199 || counter_y ==200)) ||
						((counter_x == 195 || counter_x == 196) && (counter_y == 201 || counter_y == 202)) ||
						((counter_x == 197 || counter_x == 198) && (counter_y == 203 || counter_y == 204)) ||
						((counter_x == 191 || counter_x == 192) && (counter_y == 203 || counter_y == 204)) ||
						( counter_x >= 193 && counter_x <=196 && (counter_y == 205 || counter_y == 206)) ))  /*3*/	
						
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'h0;
						end
						end
					endcase
				end 			
				else
				begin
				   r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
				end
			end  /*b1.4, 3. kutu*/
					
			else if ((counter_x >= 179 && counter_x <= 210 && counter_y >= 152 && counter_y <=183))
			begin
			   if (b1[14] == 1)
				begin
				   case(b1[13:12])
					   2'b00 : 
						begin
						if((((counter_x == 191 || counter_x == 192) && counter_y >= 165 && counter_y <=170) ||
			         ( counter_x >= 193 && counter_x <=196 && (counter_y == 163 || counter_y ==164)) ||
			         ( counter_x >= 193 && counter_x <=196 && (counter_y == 171 || counter_y ==172)) ||
			         ((counter_x == 197 || counter_x == 198) && counter_y >= 165 && counter_y <=170))) /*0*/						
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'h0;
						end
						end
			         2'b01 : 
						begin
						if((((counter_x == 192 || counter_x == 193) && (counter_y == 165 || counter_y == 166)) ||
						((counter_x == 194 || counter_x == 195) && (counter_y >= 163 && counter_y <=170)) ||
						( counter_x >= 192 && counter_x <=197 && (counter_y == 171 || counter_y == 172)))) /*1*/					
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'h0;
						end
						end
						2'b10 : 
						begin
						if((((counter_x == 191 || counter_x == 192) && (counter_y == 165 || counter_y == 166)) ||
						( counter_x >= 193 && counter_x <=196 && (counter_y == 163 || counter_y == 164)) ||
						((counter_x == 197 || counter_x == 198) && (counter_y == 165 || counter_y == 166)) ||
						((counter_x == 195 || counter_x == 196) && (counter_y == 167 || counter_y == 168)) ||
						((counter_x == 193 || counter_x == 194) && (counter_y == 169 || counter_y == 170)) ||
						( counter_x >= 191 && counter_x <=198 && (counter_y == 171 || counter_y == 172)))) /*2*/							
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'h0;
						end
						end
						2'b11 : 
						begin
						if((((counter_x == 191 || counter_x == 192) && (counter_y == 165 || counter_y == 166)) ||
						( counter_x >= 193 && counter_x <=196 && (counter_y == 163 || counter_y == 164)) ||
						((counter_x == 197 || counter_x == 198) && (counter_y == 165 || counter_y ==166)) ||
						((counter_x == 195 || counter_x == 196) && (counter_y == 167 || counter_y == 168)) ||
						((counter_x == 197 || counter_x == 198) && (counter_y == 169 || counter_y == 170)) ||
						((counter_x == 191 || counter_x == 192) && (counter_y == 169 || counter_y == 170)) ||
						( counter_x >= 193 && counter_x <=196 && (counter_y == 171 || counter_y == 172)) ))  /*3*/				
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'h0;
						end
						end
					endcase
				end 			
				else
				begin
				   r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
				end
			end  /*b1.5, 2. kutu*/
			
			else if ((counter_x >= 179 && counter_x <= 210 && counter_y >= 118 && counter_y <=149))
			begin
			   if (b1[17] == 1)
				begin
				   case(b1[16:15])
					   2'b00 : 
						begin
						if((((counter_x == 191 || counter_x == 192) && counter_y >= 131 && counter_y <=136) ||
			         ( counter_x >= 193 && counter_x <=196 && (counter_y == 129 || counter_y ==130)) ||
			         ( counter_x >= 193 && counter_x <=196 && (counter_y == 137 || counter_y ==138)) ||
			         ((counter_x == 197 || counter_x == 198) && counter_y >= 131 && counter_y <=136))) /*0*/		
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'h0;
						end
						end
			         2'b01 : 
						begin
						if((((counter_x == 192 || counter_x == 193) && (counter_y == 131 || counter_y == 132)) ||
						((counter_x == 194 || counter_x == 195) && (counter_y >= 129 && counter_y <=136)) ||
						( counter_x >= 192 && counter_x <=197 && (counter_y == 137 || counter_y == 138)))) /*1*/											
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'h0;
						end
						end
						2'b10 : 
						begin
						if((((counter_x == 191 || counter_x == 192) && (counter_y == 131 || counter_y == 132)) ||
						( counter_x >= 193 && counter_x <=196 && (counter_y == 129 || counter_y == 130)) ||
						((counter_x == 197 || counter_x == 198) && (counter_y == 131 || counter_y == 132)) ||
						((counter_x == 195 || counter_x == 196) && (counter_y == 133 || counter_y == 134)) ||
						((counter_x == 193 || counter_x == 194) && (counter_y == 135 || counter_y == 136)) ||
						( counter_x >= 191 && counter_x <=198 && (counter_y == 137 || counter_y == 138)))) /*2*/		
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'h0;
						end
						end
						2'b11 : 
						begin
						if((((counter_x == 191 || counter_x == 192) && (counter_y == 131 || counter_y == 132)) ||
						( counter_x >= 193 && counter_x <=196 && (counter_y == 129 || counter_y == 130)) ||
						((counter_x == 197 || counter_x == 198) && (counter_y == 131 || counter_y ==132)) ||
						((counter_x == 195 || counter_x == 196) && (counter_y == 133 || counter_y == 134)) ||
						((counter_x == 197 || counter_x == 198) && (counter_y == 135 || counter_y == 136)) ||
						((counter_x == 191 || counter_x == 192) && (counter_y == 135 || counter_y == 136)) ||
						( counter_x >= 193 && counter_x <=196 && (counter_y == 137 || counter_y == 138)) ))  /*3*/			
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'h0;
						end
						end
					endcase
				end 			
				else
				begin
				   r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
				end
			end  /*b1.6, 1. kutu*/			
	

	
/*buffer 2 starts*/


			else if ((counter_x >= 240 && counter_x <= 271 && counter_y >= 288 && counter_y <=319))
			begin
			   if (b2[2] == 1)
				begin
				   case(b2[1:0])
					   2'b00 : 
						begin
						if((((counter_x == 252 || counter_x == 253) && counter_y >= 301 && counter_y <=306) ||
			         ( counter_x >= 254 && counter_x <=257 && (counter_y == 299 || counter_y ==300)) ||
			         ( counter_x >= 254 && counter_x <=257 && (counter_y == 307 || counter_y ==308)) ||
			         ((counter_x == 258 || counter_x == 259) && counter_y >= 301 && counter_y <=306))) /*0*/		
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'hFF; r_green <= 8'h0;
						end
						end
			         2'b01 : 
						begin
						if((((counter_x == 253 || counter_x == 254) && (counter_y == 301 || counter_y == 302)) ||
						((counter_x == 255 || counter_x == 256) && (counter_y >= 299 && counter_y <=306)) ||
						( counter_x >= 253 && counter_x <=258 && (counter_y == 307 || counter_y == 308)))) /*1*/					
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'hFF; r_green <= 8'h0;
						end
						end
						2'b10 : 
						begin
						if((((counter_x == 252 || counter_x == 253) && (counter_y == 301 || counter_y == 302)) ||
						( counter_x >= 254 && counter_x <= 257 && (counter_y == 299 || counter_y == 300)) ||
						((counter_x == 258 || counter_x == 259) && (counter_y == 301 || counter_y == 302)) ||
						((counter_x == 256 || counter_x == 257) && (counter_y == 303 || counter_y == 304)) ||
						((counter_x == 254 || counter_x == 255) && (counter_y == 305 || counter_y == 306)) ||
						( counter_x >= 252 && counter_x <=259 && (counter_y == 307 || counter_y == 308)))) /*2*/				
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'hFF; r_green <= 8'h0;
						end
						end
						2'b11 : 
						begin
						if((((counter_x == 252 || counter_x == 253) && (counter_y == 301 || counter_y == 302)) ||
						( counter_x >= 254 && counter_x <=257 && (counter_y == 299 || counter_y == 300)) ||
						((counter_x == 258 || counter_x == 259) && (counter_y == 301 || counter_y ==302)) ||
						((counter_x == 256 || counter_x == 257) && (counter_y == 303 || counter_y == 304)) ||
						((counter_x == 258 || counter_x == 259) && (counter_y == 305 || counter_y == 306)) ||
						((counter_x == 252 || counter_x == 253) && (counter_y == 305 || counter_y == 306)) ||
						( counter_x >= 254 && counter_x <=257 && (counter_y == 307 || counter_y == 308)) ))  /*3*/					
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'hFF; r_green <= 8'h0;
						end
						end
					endcase
				end
			   else
				begin
				r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
				end
			end /*b2.1, 6. kutu*/
			
			else if ((counter_x >= 240 && counter_x <= 271 && counter_y >= 254 && counter_y <=285))
			begin
			   if (b2[5] == 1)
				begin
				   case(b2[4:3])
					   2'b00 : 
						begin
						if((((counter_x == 252 || counter_x == 253) && counter_y >= 267 && counter_y <=272) ||
			         ( counter_x >= 254 && counter_x <=257 && (counter_y == 265 || counter_y ==266)) ||
			         ( counter_x >= 254 && counter_x <=257 && (counter_y == 273 || counter_y ==274)) ||
			         ((counter_x == 258 || counter_x == 259) && counter_y >= 267 && counter_y <=272))) /*0*/	
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'hFF; r_green <= 8'h0;
						end
						end
			         2'b01 : 
						begin
						if((((counter_x == 253 || counter_x == 254) && (counter_y == 267 || counter_y == 268)) ||
						((counter_x == 255 || counter_x == 256) && (counter_y >= 265 && counter_y <=272)) ||
						( counter_x >= 253 && counter_x <=258 && (counter_y == 273 || counter_y == 274)))) /*1*/	
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'hFF; r_green <= 8'h0;
						end
						end
						2'b10 : 
						begin
						if((((counter_x == 252 || counter_x == 253) && (counter_y == 267 || counter_y == 268)) ||
						( counter_x >= 254 && counter_x <=257 && (counter_y == 265 || counter_y == 266)) ||
						((counter_x == 258 || counter_x == 259) && (counter_y == 267 || counter_y == 268)) ||
						((counter_x == 256 || counter_x == 257) && (counter_y == 269 || counter_y == 270)) ||
						((counter_x == 254 || counter_x == 255) && (counter_y == 271 || counter_y == 272)) ||
						( counter_x >= 252 && counter_x <=259 && (counter_y == 273 || counter_y == 274)))) /*2*/			
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'hFF; r_green <= 8'h0;
						end
						end
						2'b11 : 
						begin
						if((((counter_x == 252 || counter_x == 253) && (counter_y == 267 || counter_y == 268)) ||
						( counter_x >= 254 && counter_x <=257 && (counter_y == 265 || counter_y == 266)) ||
						((counter_x == 258 || counter_x == 259) && (counter_y == 267 || counter_y ==268)) ||
						((counter_x == 256 || counter_x == 257) && (counter_y == 269 || counter_y == 270)) ||
						((counter_x == 258 || counter_x == 259) && (counter_y == 271 || counter_y == 272)) ||
						((counter_x == 252 || counter_x == 253) && (counter_y == 271 || counter_y == 272)) ||
						( counter_x >= 254 && counter_x <=257 && (counter_y == 273 || counter_y == 274)) ))  /*3*/				
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'hFF; r_green <= 8'h0;
						end
					 end
					endcase
		      end
			   else
				begin
				r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
				end
			end /*b2.2, 5. kutu*/	
			
			else if ((counter_x >= 240 && counter_x <= 271 && counter_y >= 220 && counter_y <=251))
			begin
			   if (b2[8] == 1)
				begin
				   case(b2[7:6])
					   2'b00 : 
						begin
						if((((counter_x == 252 || counter_x == 253) && counter_y >= 233 && counter_y <=238) ||
			         ( counter_x >= 254 && counter_x <=257 && (counter_y == 231 || counter_y ==232)) ||
			         ( counter_x >= 254 && counter_x <=257 && (counter_y == 239 || counter_y ==240)) ||
			         ((counter_x == 258 || counter_x == 259) && counter_y >= 233 && counter_y <=238))) /*0*/						
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'hFF; r_green <= 8'h0;
						end
						end
			         2'b01 : 
						begin
						if((((counter_x == 253 || counter_x == 254) && (counter_y == 233 || counter_y == 234)) ||
						((counter_x == 255 || counter_x == 256) && (counter_y >= 231 && counter_y <=238)) ||
						( counter_x >= 253 && counter_x <=258 && (counter_y == 239 || counter_y == 240)))) /*1*/						
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'hFF; r_green <= 8'h0;
						end
						end
						2'b10 : 
						begin
						if((((counter_x == 252 || counter_x == 253) && (counter_y == 233 || counter_y == 234)) ||
						( counter_x >= 254 && counter_x <=257 && (counter_y == 231 || counter_y == 232)) ||
						((counter_x == 258 || counter_x == 259) && (counter_y == 233 || counter_y == 234)) ||
						((counter_x == 256 || counter_x == 257) && (counter_y == 235 || counter_y == 236)) ||
						((counter_x == 254 || counter_x == 255) && (counter_y == 237 || counter_y == 238)) ||
						( counter_x >= 252 && counter_x <=259 && (counter_y == 239 || counter_y == 240)))) /*2*/		
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'hFF; r_green <= 8'h0;
						end
						end
						2'b11 : 
						begin
						if((((counter_x == 252 || counter_x == 253) && (counter_y == 233 || counter_y == 234)) ||
						( counter_x >= 254 && counter_x <=257 && (counter_y == 231 || counter_y == 232)) ||
						((counter_x == 258 || counter_x == 259) && (counter_y == 233 || counter_y ==234)) ||
						((counter_x == 256 || counter_x == 257) && (counter_y == 235 || counter_y == 236)) ||
						((counter_x == 258 || counter_x == 259) && (counter_y == 237 || counter_y == 238)) ||
						((counter_x == 252 || counter_x == 253) && (counter_y == 237 || counter_y == 238)) ||
						( counter_x >= 254 && counter_x <=257 && (counter_y == 239 || counter_y == 240)) ))  /*3*/		
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'hFF; r_green <= 8'h0;
						end
						end
					endcase
				end
				
				else
				begin
				   r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
				end
			end /*b2.3, 4. kutu*/
			
			else if ((counter_x >= 240 && counter_x <= 271 && counter_y >= 186 && counter_y <=217))
			begin
			   if (b2[11] == 1)
				begin
				   case(b2[10:9])
					   2'b00 : 
						begin
						if((((counter_x == 252 || counter_x == 253) && counter_y >= 199 && counter_y <=204) ||
			         ( counter_x >= 254 && counter_x <=257 && (counter_y == 197 || counter_y ==198)) ||
			         ( counter_x >= 254 && counter_x <=257 && (counter_y == 205 || counter_y ==206)) ||
			         ((counter_x == 258 || counter_x == 259) && counter_y >= 199 && counter_y <=204))) /*0*/				
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'hFF; r_green <= 8'h0;
						end
						end
			         2'b01 : 
						begin
						if((((counter_x == 253 || counter_x == 254) && (counter_y == 199 || counter_y == 200)) ||
						((counter_x == 255 || counter_x == 256) && (counter_y >= 197 && counter_y <=204)) ||
						( counter_x >= 253 && counter_x <=258 && (counter_y == 205 || counter_y == 206)))) /*1*/		
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'hFF; r_green <= 8'h0;
						end
						end
						2'b10 : 
						begin
						if((((counter_x == 252 || counter_x == 253) && (counter_y == 199 || counter_y == 200)) ||
						( counter_x >= 254 && counter_x <=257 && (counter_y == 197 || counter_y == 198)) ||
						((counter_x == 258 || counter_x == 259) && (counter_y == 199 || counter_y == 200)) ||
						((counter_x == 256 || counter_x == 257) && (counter_y == 201 || counter_y == 202)) ||
						((counter_x == 254 || counter_x == 255) && (counter_y == 203 || counter_y == 204)) ||
						( counter_x >= 252 && counter_x <=259 && (counter_y == 205 || counter_y == 206)))) /*2*/		
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'hFF; r_green <= 8'h0;
						end
						end
						2'b11 : 
						begin
						if((((counter_x == 252 || counter_x == 253) && (counter_y == 199 || counter_y == 200)) ||
						( counter_x >= 254 && counter_x <=257 && (counter_y == 197 || counter_y == 198)) ||
						((counter_x == 258 || counter_x == 259) && (counter_y == 199 || counter_y ==200)) ||
						((counter_x == 256 || counter_x == 257) && (counter_y == 201 || counter_y == 202)) ||
						((counter_x == 258 || counter_x == 259) && (counter_y == 203 || counter_y == 204)) ||
						((counter_x == 252 || counter_x == 253) && (counter_y == 203 || counter_y == 204)) ||
						( counter_x >= 254 && counter_x <=257 && (counter_y == 205 || counter_y == 206)) ))  /*3*/	
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'hFF; r_green <= 8'h0;
						end
						end
					endcase
				end 			
				else
				begin
				   r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
				end
			end  /*b2.4, 3. kutu*/
					
			else if ((counter_x >= 240 && counter_x <= 271 && counter_y >= 152 && counter_y <=183))
			begin
			   if (b2[14] == 1)
				begin
				   case(b2[13:12])
					   2'b00 : 
						begin
						if((((counter_x == 252 || counter_x == 253) && counter_y >= 165 && counter_y <=170) ||
			         ( counter_x >= 254 && counter_x <=257&& (counter_y == 163 || counter_y ==164)) ||
			         ( counter_x >= 254 && counter_x <=257 && (counter_y == 171 || counter_y ==172)) ||
			         ((counter_x == 258 || counter_x == 259) && counter_y >= 165 && counter_y <=170))) /*0*/						
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'hFF; r_green <= 8'h0;
						end
						end
			         2'b01 : 
						begin
						if((((counter_x == 253 || counter_x == 254) && (counter_y == 165 || counter_y == 166)) ||
						((counter_x == 255 || counter_x == 256) && (counter_y >= 163 && counter_y <=170)) ||
						( counter_x >= 253 && counter_x <=258 && (counter_y == 171 || counter_y == 172)))) /*1*/					
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'hFF; r_green <= 8'h0;
						end
						end
						2'b10 : 
						begin
						if((((counter_x == 252 || counter_x == 253) && (counter_y == 165 || counter_y == 166)) ||
						( counter_x >= 254 && counter_x <=257 && (counter_y == 163 || counter_y == 164)) ||
						((counter_x == 258 || counter_x == 259) && (counter_y == 165 || counter_y == 166)) ||
						((counter_x == 256 || counter_x == 257) && (counter_y == 167 || counter_y == 168)) ||
						((counter_x == 254 || counter_x == 255) && (counter_y == 169 || counter_y == 170)) ||
						( counter_x >= 252 && counter_x <=259 && (counter_y == 171 || counter_y == 172)))) /*2*/						
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'hFF; r_green <= 8'h0;
						end
						end
						2'b11 : 
						begin
						if((((counter_x == 252 || counter_x == 253) && (counter_y == 165 || counter_y == 166)) ||
						( counter_x >= 254 && counter_x <=257 && (counter_y == 163 || counter_y == 164)) ||
						((counter_x == 258 || counter_x == 259) && (counter_y == 165 || counter_y ==166)) ||
						((counter_x == 256 || counter_x == 257) && (counter_y == 167 || counter_y == 168)) ||
						((counter_x == 258 || counter_x == 259) && (counter_y == 169 || counter_y == 170)) ||
						((counter_x == 252 || counter_x == 253) && (counter_y == 169 || counter_y == 170)) ||
						( counter_x >= 254 && counter_x <=257 && (counter_y == 171 || counter_y == 172)) ))  /*3*/				
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'hFF; r_green <= 8'h0;
						end
						end
					endcase
				end 			
				else
				begin
				   r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
				end
			end  /*b2.5, 2. kutu*/
			
			else if ((counter_x >= 240 && counter_x <= 271 && counter_y >= 118 && counter_y <=149))
			begin
			   if (b2[17] == 1)
				begin
				   case(b2[16:15])
					   2'b00 : 
						begin
						if((((counter_x == 252 || counter_x == 253) && counter_y >= 131 && counter_y <=136) ||
			         ( counter_x >= 254 && counter_x <=257 && (counter_y == 129 || counter_y ==130)) ||
			         ( counter_x >= 254 && counter_x <=257 && (counter_y == 137 || counter_y ==138)) ||
			         ((counter_x == 258 || counter_x == 259) && counter_y >= 131 && counter_y <=136))) /*0*/		
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'hFF; r_green <= 8'h0;
						end
						end
			         2'b01 : 
						begin
						if((((counter_x == 253 || counter_x == 254) && (counter_y == 131 || counter_y == 132)) ||
						((counter_x == 255 || counter_x == 256) && (counter_y >= 129 && counter_y <=136)) ||
						( counter_x >= 253 && counter_x <=258 && (counter_y == 137 || counter_y == 138)))) /*1*/											
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'hFF; r_green <= 8'h0;
						end
						end
						2'b10 : 
						begin
						if((((counter_x == 252 || counter_x == 253) && (counter_y == 131 || counter_y == 132)) ||
						( counter_x >= 254 && counter_x <=257 && (counter_y == 129 || counter_y == 130)) ||
						((counter_x == 258 || counter_x == 259) && (counter_y == 131 || counter_y == 132)) ||
						((counter_x == 256 || counter_x == 257) && (counter_y == 133 || counter_y == 134)) ||
						((counter_x == 254 || counter_x == 255) && (counter_y == 135 || counter_y == 136)) ||
						( counter_x >= 252 && counter_x <=259 && (counter_y == 137 || counter_y == 138)))) /*2*/		
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'hFF; r_green <= 8'h0;
						end
						end
						2'b11 : 
						begin
						if((((counter_x == 252 || counter_x == 253) && (counter_y == 131 || counter_y == 132)) ||
						( counter_x >= 254 && counter_x <=257 && (counter_y == 129 || counter_y == 130)) ||
						((counter_x == 258 || counter_x == 259) && (counter_y == 131 || counter_y ==132)) ||
						((counter_x == 256 || counter_x == 257) && (counter_y == 133 || counter_y == 134)) ||
						((counter_x == 258 || counter_x == 259) && (counter_y == 135 || counter_y == 136)) ||
						((counter_x == 252 || counter_x == 253) && (counter_y == 135 || counter_y == 136)) ||
						( counter_x >= 254 && counter_x <=257 && (counter_y == 137 || counter_y == 138)) ))  /*3*/			
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'hFF; r_green <= 8'h0;
						end
						end
					endcase
				end 			
				else
				begin
				   r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
				end
			end  /*b2.6, 1. kutu*/			
			
			
			
			
/*buffer 3 starts*/	
			else if ((counter_x >= 301 && counter_x <= 332 && counter_y >= 288 && counter_y <=319))
			begin
			   if (b3[2] == 1)
				begin
				   case(b3[1:0])
					   2'b00 : 
						begin
						if((((counter_x == 313 || counter_x == 314) && counter_y >= 301 && counter_y <=306) ||
			         ( counter_x >= 315 && counter_x <=318 && (counter_y == 299 || counter_y ==300)) ||
			         ( counter_x >= 315 && counter_x <=318 && (counter_y == 307 || counter_y ==308)) ||
			         ((counter_x == 319 || counter_x == 320) && counter_y >= 301 && counter_y <=306))) /*0*/		
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
			         2'b01 : 
						begin
						if((((counter_x == 314 || counter_x == 315) && (counter_y == 301 || counter_y == 302)) ||
						((counter_x == 316 || counter_x == 317) && (counter_y >= 299 && counter_y <=306)) ||
						( counter_x >= 314 && counter_x <=319 && (counter_y == 307 || counter_y == 308)))) /*1*/					
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
						2'b10 : 
						begin
						if((((counter_x == 313 || counter_x == 314) && (counter_y == 301 || counter_y == 302)) ||
						( counter_x >= 315 && counter_x <= 318 && (counter_y == 299 || counter_y == 300)) ||
						((counter_x == 319 || counter_x == 320) && (counter_y == 301 || counter_y == 302)) ||
						((counter_x == 317 || counter_x == 318) && (counter_y == 303 || counter_y == 304)) ||
						((counter_x == 315 || counter_x == 316) && (counter_y == 305 || counter_y == 306)) ||
						( counter_x >= 313 && counter_x <=320 && (counter_y == 307 || counter_y == 308)))) /*2*/				
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
						2'b11 : 
						begin
						if((((counter_x == 313 || counter_x == 314) && (counter_y == 301 || counter_y == 302)) ||
						( counter_x >= 315 && counter_x <=318 && (counter_y == 299 || counter_y == 300)) ||
						((counter_x == 319 || counter_x == 320) && (counter_y == 301 || counter_y ==302)) ||
						((counter_x == 317 || counter_x == 318) && (counter_y == 303 || counter_y == 304)) ||
						((counter_x == 319 || counter_x == 320) && (counter_y == 305 || counter_y == 306)) ||
						((counter_x == 313 || counter_x == 314) && (counter_y == 305 || counter_y == 306)) ||
						( counter_x >= 315 && counter_x <=318 && (counter_y == 307 || counter_y == 308)) ))  /*3*/					
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
					endcase
				end
			   else
				begin
				r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
				end
			end /*b3.1, 6. kutu*/
			
			else if ((counter_x >= 301 && counter_x <= 332 && counter_y >= 254 && counter_y <=285))
			begin
			   if (b3[5] == 1)
				begin
				   case(b3[4:3])
					   2'b00 : 
						begin
						if((((counter_x == 313 || counter_x == 314) && counter_y >= 267 && counter_y <=272) ||
			         ( counter_x >= 315 && counter_x <=318 && (counter_y == 265 || counter_y ==266)) ||
			         ( counter_x >= 315 && counter_x <=318 && (counter_y == 273 || counter_y ==274)) ||
			         ((counter_x == 319 || counter_x == 320) && counter_y >= 267 && counter_y <=272))) /*0*/	
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
			         2'b01 : 
						begin
						if((((counter_x == 314 || counter_x == 315) && (counter_y == 267 || counter_y == 268)) ||
						((counter_x == 316 || counter_x == 317) && (counter_y >= 265 && counter_y <=272)) ||
						( counter_x >= 314 && counter_x <=319 && (counter_y == 273 || counter_y == 274)))) /*1*/	
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
						2'b10 : 
						begin
						if((((counter_x == 313 || counter_x == 314) && (counter_y == 267 || counter_y == 268)) ||
						( counter_x >= 315 && counter_x <=318 && (counter_y == 265 || counter_y == 266)) ||
						((counter_x == 319 || counter_x == 320) && (counter_y == 267 || counter_y == 268)) ||
						((counter_x == 317 || counter_x == 318) && (counter_y == 269 || counter_y == 270)) ||
						((counter_x == 315 || counter_x == 316) && (counter_y == 271 || counter_y == 272)) ||
						( counter_x >= 313 && counter_x <=320 && (counter_y == 273 || counter_y == 274)))) /*2*/			
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
						2'b11 : 
						begin
						if((((counter_x == 313 || counter_x == 314) && (counter_y == 267 || counter_y == 268)) ||
						( counter_x >= 315 && counter_x <=318 && (counter_y == 265 || counter_y == 266)) ||
						((counter_x == 319 || counter_x == 320) && (counter_y == 267 || counter_y ==268)) ||
						((counter_x == 317 || counter_x == 318) && (counter_y == 269 || counter_y == 270)) ||
						((counter_x == 319 || counter_x == 320) && (counter_y == 271 || counter_y == 272)) ||
						((counter_x == 313 || counter_x == 314) && (counter_y == 271 || counter_y == 272)) ||
						( counter_x >= 315 && counter_x <=318 && (counter_y == 273 || counter_y == 274)) ))  /*3*/				
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'hFF;
						end
					 end
					endcase
		      end
			   else
				begin
				r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
				end
			end /*b3.2, 5. kutu*/	
			
			else if ((counter_x >= 301 && counter_x <= 332 && counter_y >= 220 && counter_y <=251))
			begin
			   if (b3[8] == 1)
				begin
				   case(b3[7:6])
					   2'b00 : 
						begin
						if((((counter_x == 313 || counter_x == 314) && counter_y >= 233 && counter_y <=238) ||
			         ( counter_x >= 315 && counter_x <=318 && (counter_y == 231 || counter_y ==232)) ||
			         ( counter_x >= 315 && counter_x <=318 && (counter_y == 239 || counter_y ==240)) ||
			         ((counter_x == 319 || counter_x == 320) && counter_y >= 233 && counter_y <=238))) /*0*/						
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
			         2'b01 : 
						begin
						if((((counter_x == 314 || counter_x == 315) && (counter_y == 233 || counter_y == 234)) ||
						((counter_x == 316 || counter_x == 317) && (counter_y >= 231 && counter_y <=238)) ||
						( counter_x >= 314 && counter_x <=319 && (counter_y == 239 || counter_y == 240)))) /*1*/						
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
						2'b10 : 
						begin
						if((((counter_x == 313 || counter_x == 314) && (counter_y == 233 || counter_y == 234)) ||
						( counter_x >= 315 && counter_x <=318 && (counter_y == 231 || counter_y == 232)) ||
						((counter_x == 319 || counter_x == 320) && (counter_y == 233 || counter_y == 234)) ||
						((counter_x == 317 || counter_x == 318) && (counter_y == 235 || counter_y == 236)) ||
						((counter_x == 315 || counter_x == 316) && (counter_y == 237 || counter_y == 238)) ||
						( counter_x >= 313 && counter_x <=320 && (counter_y == 239 || counter_y == 240)))) /*2*/		
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
						2'b11 : 
						begin
						if((((counter_x == 313 || counter_x == 314) && (counter_y == 233 || counter_y == 234)) ||
						( counter_x >= 315 && counter_x <=318 && (counter_y == 231 || counter_y == 232)) ||
						((counter_x == 319 || counter_x == 320) && (counter_y == 233 || counter_y ==234)) ||
						((counter_x == 317 || counter_x == 318) && (counter_y == 235 || counter_y == 236)) ||
						((counter_x == 319 || counter_x == 320) && (counter_y == 237 || counter_y == 238)) ||
						((counter_x == 313 || counter_x == 314) && (counter_y == 237 || counter_y == 238)) ||
						( counter_x >= 315 && counter_x <=318 && (counter_y == 239 || counter_y == 240)) ))  /*3*/		
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
					endcase
				end
				
				else
				begin
				   r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
				end
			end /*b3.3, 4. kutu*/
			
			else if ((counter_x >= 301 && counter_x <= 332 && counter_y >= 186 && counter_y <=217))
			begin
			   if (b3[11] == 1)
				begin
				   case(b3[10:9])
					   2'b00 : 
						begin
						if((((counter_x == 313 || counter_x == 314) && counter_y >= 199 && counter_y <=204) ||
			         ( counter_x >= 315 && counter_x <=318 && (counter_y == 197 || counter_y ==198)) ||
			         ( counter_x >= 315 && counter_x <=318 && (counter_y == 205 || counter_y ==206)) ||
			         ((counter_x == 319 || counter_x == 320) && counter_y >= 199 && counter_y <=204))) /*0*/				
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
			         2'b01 : 
						begin
						if((((counter_x == 314 || counter_x == 315) && (counter_y == 199 || counter_y == 200)) ||
						((counter_x == 316 || counter_x == 317) && (counter_y >= 197 && counter_y <=204)) ||
						( counter_x >= 314 && counter_x <=319 && (counter_y == 205 || counter_y == 206)))) /*1*/		
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
						2'b10 : 
						begin
						if((((counter_x == 313 || counter_x == 314) && (counter_y == 199 || counter_y == 200)) ||
						( counter_x >= 315 && counter_x <=318 && (counter_y == 197 || counter_y == 198)) ||
						((counter_x == 319 || counter_x == 320) && (counter_y == 199 || counter_y == 200)) ||
						((counter_x == 317 || counter_x == 318) && (counter_y == 201 || counter_y == 202)) ||
						((counter_x == 315 || counter_x == 316) && (counter_y == 203 || counter_y == 204)) ||
						( counter_x >= 313 && counter_x <=320 && (counter_y == 205 || counter_y == 206)))) /*2*/		
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
						2'b11 : 
						begin
						if((((counter_x == 313 || counter_x == 314) && (counter_y == 199 || counter_y == 200)) ||
						( counter_x >= 315 && counter_x <=318 && (counter_y == 197 || counter_y == 198)) ||
						((counter_x == 319 || counter_x == 320) && (counter_y == 199 || counter_y ==200)) ||
						((counter_x == 317 || counter_x == 318) && (counter_y == 201 || counter_y == 202)) ||
						((counter_x == 319 || counter_x == 320) && (counter_y == 203 || counter_y == 204)) ||
						((counter_x == 313 || counter_x == 314) && (counter_y == 203 || counter_y == 204)) ||
						( counter_x >= 315 && counter_x <=318 && (counter_y == 205 || counter_y == 206)) ))  /*3*/	
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
					endcase
				end 			
				else
				begin
				   r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
				end
			end  /*b3.4, 3. kutu*/
					
			else if ((counter_x >= 301 && counter_x <= 332 && counter_y >= 152 && counter_y <=183))
			begin
			   if (b3[14] == 1)
				begin
				   case(b3[13:12])
					   2'b00 : 
						begin
						if((((counter_x == 313 || counter_x == 314) && counter_y >= 165 && counter_y <=170) ||
			         ( counter_x >= 315 && counter_x <=318 && (counter_y == 163 || counter_y ==164)) ||
			         ( counter_x >= 315 && counter_x <=318 && (counter_y == 171 || counter_y ==172)) ||
			         ((counter_x == 319 || counter_x == 320) && counter_y >= 165 && counter_y <=170))) /*0*/						
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
			         2'b01 : 
						begin
						if((((counter_x == 314 || counter_x == 315) && (counter_y == 165 || counter_y == 166)) ||
						((counter_x == 316 || counter_x == 317) && (counter_y >= 163 && counter_y <=170)) ||
						( counter_x >= 314 && counter_x <=319 && (counter_y == 171 || counter_y == 172)))) /*1*/					
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
						2'b10 : 
						begin
						if((((counter_x == 313 || counter_x == 314) && (counter_y == 165 || counter_y == 166)) ||
						( counter_x >= 315 && counter_x <=318 && (counter_y == 163 || counter_y == 164)) ||
						((counter_x == 319 || counter_x == 320) && (counter_y == 165 || counter_y == 166)) ||
						((counter_x == 317 || counter_x == 318) && (counter_y == 167 || counter_y == 168)) ||
						((counter_x == 315 || counter_x == 316) && (counter_y == 169 || counter_y == 170)) ||
						( counter_x >= 313 && counter_x <=320 && (counter_y == 171 || counter_y == 172)))) /*2*/						
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
						2'b11 : 
						begin
						if((((counter_x == 313 || counter_x == 314) && (counter_y == 165 || counter_y == 166)) ||
						( counter_x >= 315 && counter_x <=318 && (counter_y == 163 || counter_y == 164)) ||
						((counter_x == 319 || counter_x == 320) && (counter_y == 165 || counter_y ==166)) ||
						((counter_x == 317 || counter_x == 318) && (counter_y == 167 || counter_y == 168)) ||
						((counter_x == 319 || counter_x == 320) && (counter_y == 169 || counter_y == 170)) ||
						((counter_x == 313 || counter_x == 314) && (counter_y == 169 || counter_y == 170)) ||
						( counter_x >= 315 && counter_x <=318 && (counter_y == 171 || counter_y == 172)) ))  /*3*/				
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
					endcase
				end 			
				else
				begin
				   r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
				end
			end  /*b3.5, 2. kutu*/
			
			else if ((counter_x >= 301 && counter_x <= 332 && counter_y >= 118 && counter_y <=149))
			begin
			   if (b3[17] == 1)
				begin
				   case(b3[16:15])
					   2'b00 : 
						begin
						if((((counter_x == 313 || counter_x == 314) && counter_y >= 131 && counter_y <=136) ||
			         ( counter_x >= 315 && counter_x <=318 && (counter_y == 129 || counter_y ==130)) ||
			         ( counter_x >= 315 && counter_x <=318 && (counter_y == 137 || counter_y ==138)) ||
			         ((counter_x == 319 || counter_x == 320) && counter_y >= 131 && counter_y <=136))) /*0*/		
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
			         2'b01 : 
						begin
						if((((counter_x == 314 || counter_x == 315) && (counter_y == 131 || counter_y == 132)) ||
						((counter_x == 316 || counter_x == 317) && (counter_y >= 129 && counter_y <=136)) ||
						( counter_x >= 314 && counter_x <=319 && (counter_y == 137 || counter_y == 138)))) /*1*/											
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
						2'b10 : 
						begin
						if((((counter_x == 313 || counter_x == 314) && (counter_y == 131 || counter_y == 132)) ||
						( counter_x >= 315 && counter_x <=318 && (counter_y == 129 || counter_y == 130)) ||
						((counter_x == 319 || counter_x == 320) && (counter_y == 131 || counter_y == 132)) ||
						((counter_x == 317 || counter_x == 318) && (counter_y == 133 || counter_y == 134)) ||
						((counter_x == 315 || counter_x == 316) && (counter_y == 135 || counter_y == 136)) ||
						( counter_x >= 313 && counter_x <=320 && (counter_y == 137 || counter_y == 138)))) /*2*/		
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
						2'b11 : 
						begin
						if((((counter_x == 313 || counter_x == 314) && (counter_y == 131 || counter_y == 132)) ||
						( counter_x >= 315 && counter_x <=318 && (counter_y == 129 || counter_y == 130)) ||
						((counter_x == 319 || counter_x == 320) && (counter_y == 131 || counter_y ==132)) ||
						((counter_x == 317 || counter_x == 318) && (counter_y == 133 || counter_y == 134)) ||
						((counter_x == 319 || counter_x == 320) && (counter_y == 135 || counter_y == 136)) ||
						((counter_x == 313 || counter_x == 314) && (counter_y == 135 || counter_y == 136)) ||
						( counter_x >= 315 && counter_x <=318 && (counter_y == 137 || counter_y == 138)) ))  /*3*/			
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
					endcase
				end 			
				else
				begin
				   r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
				end
			end  /*b3.6, 1. kutu*/	
			
/*buffer 4 starts*/

			else if ((counter_x >= 362 && counter_x <= 393 && counter_y >= 288 && counter_y <=319))
			begin
			   if (b4[2] == 1)
				begin
				   case(b4[1:0])
					   2'b00 : 
						begin
						if((((counter_x == 374 || counter_x == 375) && counter_y >= 301 && counter_y <=306) ||
			         ( counter_x >= 376 && counter_x <=379 && (counter_y == 299 || counter_y ==300)) ||
			         ( counter_x >= 376 && counter_x <=379 && (counter_y == 307 || counter_y ==308)) ||
			         ((counter_x == 380 || counter_x == 381) && counter_y >= 301 && counter_y <=306))) /*0*/		
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
			         2'b01 : 
						begin
						if((((counter_x == 375 || counter_x == 376) && (counter_y == 301 || counter_y == 302)) ||
						((counter_x == 377 || counter_x == 378) && (counter_y >= 299 && counter_y <=306)) ||
						( counter_x >= 375 && counter_x <=380 && (counter_y == 307 || counter_y == 308)))) /*1*/					
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
						2'b10 : 
						begin
						if((((counter_x == 374 || counter_x == 375) && (counter_y == 301 || counter_y == 302)) ||
						( counter_x >= 376 && counter_x <= 379 && (counter_y == 299 || counter_y == 300)) ||
						((counter_x == 380 || counter_x == 381) && (counter_y == 301 || counter_y == 302)) ||
						((counter_x == 378 || counter_x == 379) && (counter_y == 303 || counter_y == 304)) ||
						((counter_x == 376 || counter_x == 377) && (counter_y == 305 || counter_y == 306)) ||
						( counter_x >= 374 && counter_x <=381 && (counter_y == 307 || counter_y == 308)))) /*2*/				
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
						2'b11 : 
						begin
						if((((counter_x == 374 || counter_x == 375) && (counter_y == 301 || counter_y == 302)) ||
						( counter_x >= 376 && counter_x <=379 && (counter_y == 299 || counter_y == 300)) ||
						((counter_x == 380 || counter_x == 381) && (counter_y == 301 || counter_y ==302)) ||
						((counter_x == 378 || counter_x == 379) && (counter_y == 303 || counter_y == 304)) ||
						((counter_x == 380 || counter_x == 381) && (counter_y == 305 || counter_y == 306)) ||
						((counter_x == 374 || counter_x == 375) && (counter_y == 305 || counter_y == 306)) ||
						( counter_x >= 376 && counter_x <=379 && (counter_y == 307 || counter_y == 308)) ))  /*3*/					
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
					endcase
				end
			   else
				begin
				r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
				end
			end /*b4.1, 6. kutu*/
			
			else if ((counter_x >= 362 && counter_x <= 393 && counter_y >= 254 && counter_y <=285))
			begin
			   if (b4[5] == 1)
				begin
				   case(b4[4:3])
					   2'b00 : 
						begin
						if((((counter_x == 374 || counter_x == 375) && counter_y >= 267 && counter_y <=272) ||
			         ( counter_x >= 376 && counter_x <=379 && (counter_y == 265 || counter_y ==266)) ||
			         ( counter_x >= 376 && counter_x <=379 && (counter_y == 273 || counter_y ==274)) ||
			         ((counter_x == 380 || counter_x == 381) && counter_y >= 267 && counter_y <=272))) /*0*/	
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
			         2'b01 : 
						begin
						if((((counter_x == 375 || counter_x == 376) && (counter_y == 267 || counter_y == 268)) ||
						((counter_x == 377 || counter_x == 378) && (counter_y >= 265 && counter_y <=272)) ||
						( counter_x >= 375 && counter_x <=380 && (counter_y == 273 || counter_y == 274)))) /*1*/	
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
						2'b10 : 
						begin
						if((((counter_x == 374 || counter_x == 375) && (counter_y == 267 || counter_y == 268)) ||
						( counter_x >= 376 && counter_x <=379 && (counter_y == 265 || counter_y == 266)) ||
						((counter_x == 380 || counter_x == 381) && (counter_y == 267 || counter_y == 268)) ||
						((counter_x == 378 || counter_x == 379) && (counter_y == 269 || counter_y == 270)) ||
						((counter_x == 376 || counter_x == 377) && (counter_y == 271 || counter_y == 272)) ||
						( counter_x >= 374 && counter_x <=381 && (counter_y == 273 || counter_y == 274)))) /*2*/			
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
						2'b11 : 
						begin
						if((((counter_x == 374 || counter_x == 375) && (counter_y == 267 || counter_y == 268)) ||
						( counter_x >= 376 && counter_x <=379 && (counter_y == 265 || counter_y == 266)) ||
						((counter_x == 380 || counter_x == 381) && (counter_y == 267 || counter_y ==268)) ||
						((counter_x == 378 || counter_x == 379) && (counter_y == 269 || counter_y == 270)) ||
						((counter_x == 380 || counter_x == 381) && (counter_y == 271 || counter_y == 272)) ||
						((counter_x == 374 || counter_x == 375) && (counter_y == 271 || counter_y == 272)) ||
						( counter_x >= 376 && counter_x <=379 && (counter_y == 273 || counter_y == 274)) ))  /*3*/				
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'hFF;
						end
					 end
					endcase
		      end
			   else
				begin
				r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
				end
			end /*b4.2, 5. kutu*/	
			
			else if ((counter_x >= 362 && counter_x <= 393 && counter_y >= 220 && counter_y <=251))
			begin
			   if (b4[8] == 1)
				begin
				   case(b4[7:6])
					   2'b00 : 
						begin
						if((((counter_x == 374 || counter_x == 375) && counter_y >= 233 && counter_y <=238) ||
			         ( counter_x >= 376 && counter_x <=379 && (counter_y == 231 || counter_y ==232)) ||
			         ( counter_x >= 376 && counter_x <=379 && (counter_y == 239 || counter_y ==240)) ||
			         ((counter_x == 380 || counter_x == 381) && counter_y >= 233 && counter_y <=238))) /*0*/						
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
			         2'b01 : 
						begin
						if((((counter_x == 375 || counter_x == 376) && (counter_y == 233 || counter_y == 234)) ||
						((counter_x == 377 || counter_x == 378) && (counter_y >= 231 && counter_y <=238)) ||
						( counter_x >= 375 && counter_x <=380 && (counter_y == 239 || counter_y == 240)))) /*1*/						
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
						2'b10 : 
						begin
						if((((counter_x == 374 || counter_x == 375) && (counter_y == 233 || counter_y == 234)) ||
						( counter_x >= 376 && counter_x <=379 && (counter_y == 231 || counter_y == 232)) ||
						((counter_x == 380 || counter_x == 381) && (counter_y == 233 || counter_y == 234)) ||
						((counter_x == 378 || counter_x == 379) && (counter_y == 235 || counter_y == 236)) ||
						((counter_x == 376 || counter_x == 377) && (counter_y == 237 || counter_y == 238)) ||
						( counter_x >= 374 && counter_x <=381 && (counter_y == 239 || counter_y == 240)))) /*2*/		
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
						2'b11 : 
						begin
						if((((counter_x == 374 || counter_x == 375) && (counter_y == 233 || counter_y == 234)) ||
						( counter_x >= 376 && counter_x <=379 && (counter_y == 231 || counter_y == 232)) ||
						((counter_x == 380 || counter_x == 381) && (counter_y == 233 || counter_y ==234)) ||
						((counter_x == 378 || counter_x == 379) && (counter_y == 235 || counter_y == 236)) ||
						((counter_x == 380 || counter_x == 381) && (counter_y == 237 || counter_y == 238)) ||
						((counter_x == 374 || counter_x == 375) && (counter_y == 237 || counter_y == 238)) ||
						( counter_x >= 376 && counter_x <=379 && (counter_y == 239 || counter_y == 240)) ))  /*3*/		
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
					endcase
				end
				
				else
				begin
				   r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
				end
			end /*b4.3, 4. kutu*/
			
			else if ((counter_x >= 362 && counter_x <= 393 && counter_y >= 186 && counter_y <=217))
			begin
			   if (b4[11] == 1)
				begin
				   case(b4[10:9])
					   2'b00 : 
						begin
						if((((counter_x == 374 || counter_x == 375) && counter_y >= 199 && counter_y <=204) ||
			         ( counter_x >= 376 && counter_x <=379 && (counter_y == 197 || counter_y ==198)) ||
			         ( counter_x >= 376 && counter_x <=379 && (counter_y == 205 || counter_y ==206)) ||
			         ((counter_x == 380 || counter_x == 381) && counter_y >= 199 && counter_y <=204))) /*0*/				
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
			         2'b01 : 
						begin
						if((((counter_x == 375 || counter_x == 376) && (counter_y == 199 || counter_y == 200)) ||
						((counter_x == 377 || counter_x == 378) && (counter_y >= 197 && counter_y <=204)) ||
						( counter_x >= 375 && counter_x <=380 && (counter_y == 205 || counter_y == 206)))) /*1*/		
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
						2'b10 : 
						begin
						if((((counter_x == 374 || counter_x == 375) && (counter_y == 199 || counter_y == 200)) ||
						( counter_x >= 376 && counter_x <=379 && (counter_y == 197 || counter_y == 198)) ||
						((counter_x == 380 || counter_x == 381) && (counter_y == 199 || counter_y == 200)) ||
						((counter_x == 378 || counter_x == 379) && (counter_y == 201 || counter_y == 202)) ||
						((counter_x == 376 || counter_x == 377) && (counter_y == 203 || counter_y == 204)) ||
						( counter_x >= 374 && counter_x <=381 && (counter_y == 205 || counter_y == 206)))) /*2*/		
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
						2'b11 : 
						begin
						if((((counter_x == 374 || counter_x == 375) && (counter_y == 199 || counter_y == 200)) ||
						( counter_x >= 376 && counter_x <=379 && (counter_y == 197 || counter_y == 198)) ||
						((counter_x == 380 || counter_x == 381) && (counter_y == 199 || counter_y ==200)) ||
						((counter_x == 378 || counter_x == 379) && (counter_y == 201 || counter_y == 202)) ||
						((counter_x == 380 || counter_x == 381) && (counter_y == 203 || counter_y == 204)) ||
						((counter_x == 374 || counter_x == 375) && (counter_y == 203 || counter_y == 204)) ||
						( counter_x >= 376 && counter_x <=379 && (counter_y == 205 || counter_y == 206)) ))  /*3*/	
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
					endcase
				end 			
				else
				begin
				   r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
				end
			end  /*b4.4, 3. kutu*/
					
			else if ((counter_x >= 362 && counter_x <= 393 && counter_y >= 152 && counter_y <=183))
			begin
			   if (b4[14] == 1)
				begin
				   case(b4[13:12])
					   2'b00 : 
						begin
						if((((counter_x == 374 || counter_x == 375) && counter_y >= 165 && counter_y <=170) ||
			         ( counter_x >= 376 && counter_x <=379 && (counter_y == 163 || counter_y ==164)) ||
			         ( counter_x >= 376 && counter_x <=379 && (counter_y == 171 || counter_y ==172)) ||
			         ((counter_x == 380 || counter_x == 381) && counter_y >= 165 && counter_y <=170))) /*0*/						
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
			         2'b01 : 
						begin
						if((((counter_x == 375 || counter_x == 376) && (counter_y == 165 || counter_y == 166)) ||
						((counter_x == 377 || counter_x == 378) && (counter_y >= 163 && counter_y <=170)) ||
						( counter_x >= 375 && counter_x <=380 && (counter_y == 171 || counter_y == 172)))) /*1*/					
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
						2'b10 : 
						begin
						if((((counter_x == 374 || counter_x == 375) && (counter_y == 165 || counter_y == 166)) ||
						( counter_x >= 376 && counter_x <=379 && (counter_y == 163 || counter_y == 164)) ||
						((counter_x == 380 || counter_x == 381) && (counter_y == 165 || counter_y == 166)) ||
						((counter_x == 378 || counter_x == 379) && (counter_y == 167 || counter_y == 168)) ||
						((counter_x == 376 || counter_x == 377) && (counter_y == 169 || counter_y == 170)) ||
						( counter_x >= 374 && counter_x <=381 && (counter_y == 171 || counter_y == 172)))) /*2*/						
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
						2'b11 : 
						begin
						if((((counter_x == 374 || counter_x == 375) && (counter_y == 165 || counter_y == 166)) ||
						( counter_x >= 376 && counter_x <=379 && (counter_y == 163 || counter_y == 164)) ||
						((counter_x == 380 || counter_x == 381) && (counter_y == 165 || counter_y ==166)) ||
						((counter_x == 378 || counter_x == 379) && (counter_y == 167 || counter_y == 168)) ||
						((counter_x == 380 || counter_x == 381) && (counter_y == 169 || counter_y == 170)) ||
						((counter_x == 374 || counter_x == 375) && (counter_y == 169 || counter_y == 170)) ||
						( counter_x >= 376 && counter_x <=379 && (counter_y == 171 || counter_y == 172)) ))  /*3*/				
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
					endcase
				end 			
				else
				begin
				   r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
				end
			end  /*b4.5, 2. kutu*/
			
			else if ((counter_x >= 362 && counter_x <= 393 && counter_y >= 118 && counter_y <=149))
			begin
			   if (b4[17] == 1)
				begin
				   case(b4[16:15])
					   2'b00 : 
						begin
						if((((counter_x == 374 || counter_x == 375) && counter_y >= 131 && counter_y <=136) ||
			         ( counter_x >= 376 && counter_x <=379 && (counter_y == 129 || counter_y ==130)) ||
			         ( counter_x >= 376 && counter_x <=379 && (counter_y == 137 || counter_y ==138)) ||
			         ((counter_x == 380 || counter_x == 381) && counter_y >= 131 && counter_y <=136))) /*0*/		
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
			         2'b01 : 
						begin
						if((((counter_x == 375 || counter_x == 376) && (counter_y == 131 || counter_y == 132)) ||
						((counter_x == 377 || counter_x == 378) && (counter_y >= 129 && counter_y <=136)) ||
						( counter_x >= 375 && counter_x <=380 && (counter_y == 137 || counter_y == 138)))) /*1*/											
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
						2'b10 : 
						begin
						if((((counter_x == 374 || counter_x == 375) && (counter_y == 131 || counter_y == 132)) ||
						( counter_x >= 376 && counter_x <=379 && (counter_y == 129 || counter_y == 130)) ||
						((counter_x == 380 || counter_x == 381) && (counter_y == 131 || counter_y == 132)) ||
						((counter_x == 378 || counter_x == 379) && (counter_y == 133 || counter_y == 134)) ||
						((counter_x == 376 || counter_x == 377) && (counter_y == 135 || counter_y == 136)) ||
						( counter_x >= 374 && counter_x <=381 && (counter_y == 137 || counter_y == 138)))) /*2*/		
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
						2'b11 : 
						begin
						if((((counter_x == 374 || counter_x == 375) && (counter_y == 131 || counter_y == 132)) ||
						( counter_x >= 376 && counter_x <=379 && (counter_y == 129 || counter_y == 130)) ||
						((counter_x == 380 || counter_x == 381) && (counter_y == 131 || counter_y ==132)) ||
						((counter_x == 378 || counter_x == 379) && (counter_y == 133 || counter_y == 134)) ||
						((counter_x == 380 || counter_x == 381) && (counter_y == 135 || counter_y == 136)) ||
						((counter_x == 374 || counter_x == 375) && (counter_y == 135 || counter_y == 136)) ||
						( counter_x >= 376 && counter_x <=379 && (counter_y == 137 || counter_y == 138)) ))  /*3*/			
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'hFF;
						end
						end
					endcase
				end 		
			
		
				else
				begin
				   r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
				end
			end  /*b4.6, 1. kutu*/
			
/*OUTPUT BOX*/	

			 else if((counter_x >= 259 && counter_x <= 266 && counter_y >= 427 && counter_y <=436 && out[4] == 1))
			 begin
			    case(out[3])
				   1'b0 : 
				   begin
				      if((((counter_x == 259 || counter_x == 260) && counter_y >= 429 && counter_y <=434) ||
			         ( counter_x >= 261 && counter_x <=264 && (counter_y == 427 || counter_y ==428)) ||
			         ( counter_x >= 261 && counter_x <=264 && (counter_y == 435 || counter_y ==436)) ||
			         ((counter_x == 265 || counter_x == 266) && counter_y >= 429 && counter_y <=434))) /*0*/
					   begin
					   r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
					   end
					   else
					   begin
					   r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
					   end
				   end
				   1'b1 :
				   begin
						if((((counter_x == 260 || counter_x == 261) && (counter_y == 429 || counter_y == 430)) ||
						((counter_x == 262 || counter_x == 263) && (counter_y >= 427 && counter_y <=434)) ||
						( counter_x >= 260 && counter_x <=265 && (counter_y == 435 || counter_y == 436)))) /*1*/	
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
						end
					end
					endcase
					end
				
				else if((counter_x >= 275 && counter_x <= 282 && counter_y >= 427 && counter_y <=436 && out[4] == 1))
				begin
					case(out[2])
					1'b0 : 
					begin
						if((((counter_x == 275 || counter_x == 276) && counter_y >= 429 && counter_y <=434) ||
						( counter_x >= 277 && counter_x <=280 && (counter_y == 427 || counter_y ==428)) ||
						( counter_x >= 277 && counter_x <=280 && (counter_y == 435 || counter_y ==436)) ||
						((counter_x == 281 || counter_x == 282) && counter_y >= 429 && counter_y <=434))) /*0*/
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
						end
					end
					1'b1 :
					begin
						if((((counter_x == 276 || counter_x == 277) && (counter_y == 429 || counter_y == 430)) ||
						((counter_x == 278 || counter_x == 279) && (counter_y >= 427 && counter_y <=434)) ||
						( counter_x >= 276 && counter_x <=281 && (counter_y == 435 || counter_y == 436)))) /*1*/	
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
						end
					end
					endcase
					end
				
					else if((counter_x >= 291 && counter_x <= 298 && counter_y >= 427 && counter_y <=436 && out[4] == 1))
					begin
					case(out[1])
					1'b0 : 
					begin
						if((((counter_x == 291 || counter_x == 292) && counter_y >= 429 && counter_y <=434) ||
						( counter_x >= 293 && counter_x <=296 && (counter_y == 427 || counter_y ==428)) ||
						( counter_x >= 293 && counter_x <=296 && (counter_y == 435 || counter_y ==436)) ||
						((counter_x == 297 || counter_x == 298) && counter_y >= 429 && counter_y <=434))) /*0*/
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
						end
					end
					1'b1 :
					begin
						if((((counter_x == 292 || counter_x == 293) && (counter_y == 429 || counter_y == 430)) ||
						((counter_x == 294 || counter_x == 295) && (counter_y >= 427 && counter_y <=434)) ||
						( counter_x >= 292 && counter_x <=297 && (counter_y == 435 || counter_y == 436)))) /*1*/
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
						end
					end
					endcase
					end
				
					else if((counter_x >= 307 && counter_x <= 314 && counter_y >= 427 && counter_y <=436 && out[4] == 1))
					begin
					case(out[0])
					1'b0 : 
					begin
						if((((counter_x == 307 || counter_x == 308) && counter_y >= 429 && counter_y <=434) ||
						( counter_x >= 309 && counter_x <=312 && (counter_y == 427 || counter_y ==428)) ||
						( counter_x >= 309 && counter_x <=312 && (counter_y == 435 || counter_y ==436)) ||
						((counter_x == 313 || counter_x == 314) && counter_y >= 429 && counter_y <=434))) /*0*/
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
						end
					end
					1'b1 :
					begin
						if((((counter_x == 308 || counter_x == 309) && (counter_y == 429 || counter_y == 430)) ||
						((counter_x == 310 || counter_x == 311) && (counter_y >= 427 && counter_y <=434)) ||
						( counter_x >= 308 && counter_x <=313 && (counter_y == 435 || counter_y == 436)))) /*1*/
						begin
						r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
						end
						else
						begin
						r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
						end
					end
					endcase
					end
			
			

/*Counter starts*/

/*Total for R*/

			/*LSB starts*/
				
			else if (counter_x >= 692 && counter_x <= 699 && counter_y >= 188 && counter_y <=197)
			begin
				case(Rt_1) 
					'd1 :
						begin
							if((((counter_x == 693 || counter_x == 694) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 695 || counter_x == 696) && (counter_y >= 188 && counter_y <=195)) ||
							( counter_x >= 693 && counter_x <=698 && (counter_y == 196 || counter_y == 197)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 692 || counter_x == 693) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 698 || counter_x == 699) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 696 || counter_x == 697) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 694 || counter_x == 695) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 692 && counter_x <= 699 && (counter_y == 196|| counter_y == 197)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 692 || counter_x == 693) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 698 || counter_x == 699) && (counter_y == 190 || counter_y ==191)) ||
							((counter_x == 696 || counter_x == 697) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 698 || counter_x == 699) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 692 || counter_x == 693) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 196 || counter_y == 197)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 692 || counter_x == 693) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 694 || counter_x == 695) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 692 && counter_x <=699 && (counter_y == 194 || counter_y == 195 )) ||
							((counter_x == 696 || counter_x == 697) && counter_y >= 188 && counter_y <=193) ||
							((counter_x == 696 || counter_x == 697) && (counter_y == 196 || counter_y == 197)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 692 && counter_x <=699 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 692 && counter_x <=697 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 692 && counter_x <=697 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 692 || counter_x == 693) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 698 || counter_x == 699) && (counter_y == 194 || counter_y == 195))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 694 && counter_x <=697 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 692 || counter_x == 693) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 698 || counter_x == 699) && (counter_y == 194 || counter_y == 195))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 692 && counter_x <=697 && (counter_y == 188 || counter_y == 189 )) ||
							((counter_x == 698 || counter_x == 699) && counter_y >= 190 && counter_y <=193) ||
							((counter_x == 696 || counter_x == 697) && counter_y >= 194 && counter_y <=197)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 694 && counter_x <=697 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 692 || counter_x == 693) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 692 || counter_x == 693) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 698 || counter_x == 699) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 698 || counter_x == 699) && (counter_y == 194 || counter_y == 195))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 694 && counter_x <=697 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 192 || counter_y == 193 )) ||
							((counter_x == 698 || counter_x == 699) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 696 || counter_x == 697) && (counter_y == 196 || counter_y == 197)) ||
							((counter_x == 692 || counter_x == 693) && (counter_y == 190 || counter_y == 191))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 692 || counter_x == 693) && counter_y >= 190 && counter_y <=195) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 188 || counter_y ==189)) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 196 || counter_y ==197)) ||
							((counter_x == 698 || counter_x == 699) && counter_y >= 190 && counter_y <=195))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*Middle digit starts*/
			
			else if (counter_x >= 682 && counter_x <= 689 && counter_y >= 188 && counter_y <=197)
			begin
				case(Rt_2) 
					'd1 :
						begin
							if((((counter_x == 683 || counter_x == 684) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 685 || counter_x == 686) && (counter_y >= 188 && counter_y <=195)) ||
							( counter_x >= 683 && counter_x <=688 && (counter_y == 196 || counter_y == 197)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 682 || counter_x == 683) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 688 || counter_x == 689) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 686 || counter_x == 687) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 684 || counter_x == 685) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 682 && counter_x <= 689 && (counter_y == 196|| counter_y == 197)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 682 || counter_x == 683) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 688 || counter_x == 689) && (counter_y == 190 || counter_y ==191)) ||
							((counter_x == 686 || counter_x == 687) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 688 || counter_x == 689) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 682 || counter_x == 683) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 196 || counter_y == 197)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 682 || counter_x == 683) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 684 || counter_x == 685) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 682 && counter_x <=689 && (counter_y == 194 || counter_y == 195 )) ||
							((counter_x == 686 || counter_x == 687) && counter_y >= 188 && counter_y <=193) ||
							((counter_x == 686 || counter_x == 687) && (counter_y == 196 || counter_y == 197)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 682 && counter_x <=689 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 682 && counter_x <=687 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 682 && counter_x <=687 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 682 || counter_x == 683) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 688 || counter_x == 689) && (counter_y == 194 || counter_y == 195))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 684 && counter_x <=687 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 682 || counter_x == 683) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 688 || counter_x == 689) && (counter_y == 194 || counter_y == 195))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 682 && counter_x <=687 && (counter_y == 188 || counter_y == 189 )) ||
							((counter_x == 688 || counter_x == 689) && counter_y >= 190 && counter_y <=193) ||
							((counter_x == 686 || counter_x == 687) && counter_y >= 194 && counter_y <=197)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 684 && counter_x <=687 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 682 || counter_x == 683) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 682 || counter_x == 683) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 688 || counter_x == 689) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 688 || counter_x == 689) && (counter_y == 194 || counter_y == 195))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 684 && counter_x <=687 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 192 || counter_y == 193 )) ||
							((counter_x == 688 || counter_x == 689) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 686 || counter_x == 687) && (counter_y == 196 || counter_y == 197))||
							((counter_x == 682 || counter_x == 683) && (counter_y == 190 || counter_y == 191))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 682 || counter_x == 683) && counter_y >= 190 && counter_y <=195) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 188 || counter_y ==189)) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 196 || counter_y ==197)) ||
							((counter_x == 688 || counter_x == 689) && counter_y >= 190 && counter_y <=195))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*MSB starts*/
			
			else if (counter_x >= 672 && counter_x <= 679 && counter_y >= 188 && counter_y <=197)
			begin
				case(Rt_3) 
					'd1 :
						begin
							if((((counter_x == 673 || counter_x == 674) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 675 || counter_x == 676) && (counter_y >= 188 && counter_y <=195)) ||
							( counter_x >= 673 && counter_x <=678 && (counter_y == 196 || counter_y == 197)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 672 || counter_x == 673) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 678 || counter_x == 679) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 676 || counter_x == 677) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 674 || counter_x == 675) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 672 && counter_x <= 679 && (counter_y == 196|| counter_y == 197)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 672 || counter_x == 673) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 678 || counter_x == 679) && (counter_y == 190 || counter_y ==191)) ||
							((counter_x == 676 || counter_x == 677) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 678 || counter_x == 679) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 672 || counter_x == 673) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 196 || counter_y == 197)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 672 || counter_x == 673) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 674 || counter_x == 675) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 672 && counter_x <=679 && (counter_y == 194 || counter_y == 195 )) ||
							((counter_x == 676 || counter_x == 677) && counter_y >= 188 && counter_y <=193) ||
							((counter_x == 676 || counter_x == 677) && (counter_y == 196 || counter_y == 197)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 672 && counter_x <=679 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 672 && counter_x <=677 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 672 && counter_x <=677 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 672 || counter_x == 673) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 678 || counter_x == 679) && (counter_y == 194 || counter_y == 195))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 674 && counter_x <=677 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 672 || counter_x == 673) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 678 || counter_x == 679) && (counter_y == 194 || counter_y == 195))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 672 && counter_x <=677 && (counter_y == 188 || counter_y == 189 )) ||
							((counter_x == 678 || counter_x == 679) && counter_y >= 190 && counter_y <=193) ||
							((counter_x == 676 || counter_x == 677) && counter_y >= 194 && counter_y <=197)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 674 && counter_x <=677 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 672 || counter_x == 673) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 672 || counter_x == 673) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 678 || counter_x == 679) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 678 || counter_x == 679) && (counter_y == 194 || counter_y == 195))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 674 && counter_x <=677 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 192 || counter_y == 193 )) ||
							((counter_x == 678 || counter_x == 679) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 676 || counter_x == 677) && (counter_y == 196 || counter_y == 197))||
							((counter_x == 672 || counter_x == 673) && (counter_y == 190 || counter_y == 191))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 672 || counter_x == 673) && counter_y >= 190 && counter_y <=195) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 188 || counter_y ==189)) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 196 || counter_y ==197)) ||
							((counter_x == 678 || counter_x == 679) && counter_y >= 190 && counter_y <=195))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
	/*Total for T*/

			/*LSB starts*/
			
			else if (counter_x >= 692 && counter_x <= 699 && counter_y >= 293 && counter_y <=302)
			begin
				case(Tt_1) 
					'd1 :
						begin
							if((((counter_x == 693 || counter_x == 694) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 695 || counter_x == 696) && (counter_y >= 293 && counter_y <=300)) ||
							( counter_x >= 693 && counter_x <=698 && (counter_y == 301 || counter_y == 302)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 692 || counter_x == 693) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 698 || counter_x == 699) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 696 || counter_x == 697) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 694 || counter_x == 695) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 692 && counter_x <= 699 && (counter_y == 301|| counter_y == 302)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 692 || counter_x == 693) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 698 || counter_x == 699) && (counter_y == 295 || counter_y ==296)) ||
							((counter_x == 696 || counter_x == 697) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 698 || counter_x == 699) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 692 || counter_x == 693) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 301 || counter_y == 302)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 692 || counter_x == 693) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 694 || counter_x == 695) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 692 && counter_x <=699 && (counter_y == 299 || counter_y == 300 )) ||
							((counter_x == 696 || counter_x == 697) && counter_y >= 293 && counter_y <=298) ||
							((counter_x == 696 || counter_x == 697) && (counter_y == 301 || counter_y == 302)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 692 && counter_x <=699 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 692 && counter_x <=697 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 692 && counter_x <=697 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 692 || counter_x == 693) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 698 || counter_x == 699) && (counter_y == 299 || counter_y == 300))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 694 && counter_x <=697 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 692 || counter_x == 693) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 698 || counter_x == 699) && (counter_y == 299 || counter_y == 300))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 692 && counter_x <=697 && (counter_y == 293 || counter_y == 294 )) ||
							((counter_x == 698 || counter_x == 699) && counter_y >= 295 && counter_y <=298) ||
							((counter_x == 696 || counter_x == 697) && counter_y >= 299 && counter_y <=302)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 694 && counter_x <=697 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 692 || counter_x == 693) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 692 || counter_x == 693) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 698 || counter_x == 699) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 698 || counter_x == 699) && (counter_y == 299 || counter_y == 300))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 694 && counter_x <=697 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 297 || counter_y == 298 )) ||
							((counter_x == 698 || counter_x == 699) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 696 || counter_x == 697) && (counter_y == 301 || counter_y == 302)) ||
							((counter_x == 692 || counter_x == 693) && (counter_y == 295 || counter_y == 296))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 692 || counter_x == 693) && counter_y >= 295 && counter_y <=300) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 293 || counter_y ==294)) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 301 || counter_y ==302)) ||
							((counter_x == 698 || counter_x == 699) && counter_y >= 295 && counter_y <=300))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*Middle digit starts*/
			
			else if (counter_x >= 682 && counter_x <= 689 && counter_y >= 293 && counter_y <=302)
			begin
				case(Tt_2) 
					'd1 :
						begin
							if((((counter_x == 683 || counter_x == 684) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 685 || counter_x == 686) && (counter_y >= 293 && counter_y <=300)) ||
							( counter_x >= 683 && counter_x <=688 && (counter_y == 301 || counter_y == 302)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 682 || counter_x == 683) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 688 || counter_x == 689) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 686 || counter_x == 687) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 684 || counter_x == 685) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 682 && counter_x <= 689 && (counter_y == 301|| counter_y == 302)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 682 || counter_x == 683) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 688 || counter_x == 689) && (counter_y == 295 || counter_y ==296)) ||
							((counter_x == 686 || counter_x == 687) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 688 || counter_x == 689) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 682 || counter_x == 683) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 301 || counter_y == 302)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 682 || counter_x == 683) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 684 || counter_x == 685) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 682 && counter_x <=689 && (counter_y == 299 || counter_y == 300 )) ||
							((counter_x == 686 || counter_x == 687) && counter_y >= 293 && counter_y <=298) ||
							((counter_x == 686 || counter_x == 687) && (counter_y == 301 || counter_y == 302)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 682 && counter_x <=689 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 682 && counter_x <=687 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 682 && counter_x <=687 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 682 || counter_x == 683) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 688 || counter_x == 689) && (counter_y == 299 || counter_y == 300))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 684 && counter_x <=687 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 682 || counter_x == 683) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 688 || counter_x == 689) && (counter_y == 299 || counter_y == 300))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 682 && counter_x <=687 && (counter_y == 293 || counter_y == 294 )) ||
							((counter_x == 688 || counter_x == 689) && counter_y >= 295 && counter_y <=298) ||
							((counter_x == 686 || counter_x == 687) && counter_y >= 299 && counter_y <=302)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 684 && counter_x <=687 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 682 || counter_x == 683) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 682 || counter_x == 683) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 688 || counter_x == 689) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 688 || counter_x == 689) && (counter_y == 299 || counter_y == 300))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 684 && counter_x <=687 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 297 || counter_y == 298 )) ||
							((counter_x == 688 || counter_x == 689) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 686 || counter_x == 687) && (counter_y == 301 || counter_y == 302)) ||
							((counter_x == 682 || counter_x == 683) && (counter_y == 295 || counter_y == 296))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 682 || counter_x == 683) && counter_y >= 295 && counter_y <=300) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 293 || counter_y ==294)) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 301 || counter_y ==302)) ||
							((counter_x == 688 || counter_x == 689) && counter_y >= 295 && counter_y <=300))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*MSB starts*/
			
			else if (counter_x >= 672 && counter_x <= 679 && counter_y >= 293 && counter_y <=302)
			begin
				case(Tt_3) 
					'd1 :
						begin
							if((((counter_x == 673 || counter_x == 674) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 675 || counter_x == 676) && (counter_y >= 293 && counter_y <=300)) ||
							( counter_x >= 673 && counter_x <=678 && (counter_y == 301 || counter_y == 302)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 672 || counter_x == 673) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 678 || counter_x == 679) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 676 || counter_x == 677) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 674 || counter_x == 675) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 672 && counter_x <= 679 && (counter_y == 301|| counter_y == 302)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 672 || counter_x == 673) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 678 || counter_x == 679) && (counter_y == 295 || counter_y ==296)) ||
							((counter_x == 676 || counter_x == 677) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 678 || counter_x == 679) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 672 || counter_x == 673) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 301 || counter_y == 302)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 672 || counter_x == 673) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 674 || counter_x == 675) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 672 && counter_x <=679 && (counter_y == 299 || counter_y == 300 )) ||
							((counter_x == 676 || counter_x == 677) && counter_y >= 293 && counter_y <=298) ||
							((counter_x == 676 || counter_x == 677) && (counter_y == 301 || counter_y == 302)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 672 && counter_x <=679 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 672 && counter_x <=677 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 672 && counter_x <=677 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 672 || counter_x == 673) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 678 || counter_x == 679) && (counter_y == 299 || counter_y == 300))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 674 && counter_x <=677 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 672 || counter_x == 673) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 678 || counter_x == 679) && (counter_y == 299 || counter_y == 300))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 672 && counter_x <=677 && (counter_y == 293 || counter_y == 294 )) ||
							((counter_x == 678 || counter_x == 679) && counter_y >= 295 && counter_y <=298) ||
							((counter_x == 676 || counter_x == 677) && counter_y >= 299 && counter_y <=302)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 674 && counter_x <=677 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 672 || counter_x == 673) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 672 || counter_x == 673) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 678 || counter_x == 679) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 678 || counter_x == 679) && (counter_y == 299 || counter_y == 300))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 674 && counter_x <=677 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 297 || counter_y == 298 )) ||
							((counter_x == 678 || counter_x == 679) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 676 || counter_x == 677) && (counter_y == 301 || counter_y == 302)) ||
							((counter_x == 672 || counter_x == 673) && (counter_y == 295 || counter_y == 296))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 672 || counter_x == 673) && counter_y >= 295 && counter_y <=300) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 293 || counter_y ==294)) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 301 || counter_y ==302)) ||
							((counter_x == 678 || counter_x == 679) && counter_y >= 295 && counter_y <=300))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			

/*Total for D*/

			/*LSB starts*/
				
			else if (counter_x >= 692 && counter_x <= 699 && counter_y >= 398 && counter_y <=407)
			begin
				case(Dt_1) 
					'd1 :
						begin
							if((((counter_x == 693 || counter_x == 694) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 695 || counter_x == 696) && (counter_y >= 398 && counter_y <=405)) ||
							( counter_x >= 693 && counter_x <=698 && (counter_y == 406 || counter_y == 407)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 692 || counter_x == 693) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 698 || counter_x == 699) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 696 || counter_x == 697) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 694 || counter_x == 695) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 692 && counter_x <= 699 && (counter_y == 406|| counter_y == 407)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 692 || counter_x == 693) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 698 || counter_x == 699) && (counter_y == 400 || counter_y ==401)) ||
							((counter_x == 696 || counter_x == 697) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 698 || counter_x == 699) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 692 || counter_x == 693) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 406 || counter_y == 407)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 692 || counter_x == 693) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 694 || counter_x == 695) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 692 && counter_x <=699 && (counter_y == 404 || counter_y == 405 )) ||
							((counter_x == 696 || counter_x == 697) && counter_y >= 398 && counter_y <=403) ||
							((counter_x == 696 || counter_x == 697) && (counter_y == 406 || counter_y == 407)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 692 && counter_x <=699 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 692 && counter_x <=697 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 692 && counter_x <=697 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 692 || counter_x == 693) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 698 || counter_x == 699) && (counter_y == 404 || counter_y == 405))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 694 && counter_x <=697 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 692 || counter_x == 693) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 698 || counter_x == 699) && (counter_y == 404 || counter_y == 405))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 692 && counter_x <=697 && (counter_y == 398 || counter_y == 399 )) ||
							((counter_x == 698 || counter_x == 699) && counter_y >= 400 && counter_y <=403) ||
							((counter_x == 696 || counter_x == 697) && counter_y >= 404 && counter_y <=407)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 694 && counter_x <=697 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 692 || counter_x == 693) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 692 || counter_x == 693) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 698 || counter_x == 699) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 698 || counter_x == 699) && (counter_y == 404 || counter_y == 405))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 694 && counter_x <=697 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 402 || counter_y == 403 )) ||
							((counter_x == 698 || counter_x == 699) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 696 || counter_x == 697) && (counter_y == 406 || counter_y == 407)) ||
							((counter_x == 692 || counter_x == 693) && (counter_y == 400 || counter_y == 401))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 692 || counter_x == 693) && counter_y >= 400 && counter_y <=405) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 398 || counter_y ==399)) ||
							( counter_x >= 694 && counter_x <=697 && (counter_y == 406 || counter_y ==407)) ||
							((counter_x == 698 || counter_x == 699) && counter_y >= 400 && counter_y <=405))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*Middle digit starts*/
			
			else if (counter_x >= 682 && counter_x <= 689 && counter_y >= 398 && counter_y <=407)
			begin
				case(Dt_2) 
					'd1 :
						begin
							if((((counter_x == 683 || counter_x == 684) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 685 || counter_x == 686) && (counter_y >= 398 && counter_y <=405)) ||
							( counter_x >= 683 && counter_x <=688 && (counter_y == 406 || counter_y == 407)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 682 || counter_x == 683) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 688 || counter_x == 689) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 686 || counter_x == 687) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 684 || counter_x == 685) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 682 && counter_x <= 689 && (counter_y == 406|| counter_y == 407)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 682 || counter_x == 683) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 688 || counter_x == 689) && (counter_y == 400 || counter_y ==401)) ||
							((counter_x == 686 || counter_x == 687) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 688 || counter_x == 689) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 682 || counter_x == 683) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 406 || counter_y == 407)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 682 || counter_x == 683) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 684 || counter_x == 685) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 682 && counter_x <=689 && (counter_y == 404 || counter_y == 405 )) ||
							((counter_x == 686 || counter_x == 687) && counter_y >= 398 && counter_y <=403) ||
							((counter_x == 686 || counter_x == 687) && (counter_y == 406 || counter_y == 407)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 682 && counter_x <=689 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 682 && counter_x <=687 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 682 && counter_x <=687 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 682 || counter_x == 683) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 688 || counter_x == 689) && (counter_y == 404 || counter_y == 405))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 684 && counter_x <=687 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 682 || counter_x == 683) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 688 || counter_x == 689) && (counter_y == 404 || counter_y == 405))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 682 && counter_x <=687 && (counter_y == 398 || counter_y == 399 )) ||
							((counter_x == 688 || counter_x == 689) && counter_y >= 400 && counter_y <=403) ||
							((counter_x == 686 || counter_x == 687) && counter_y >= 404 && counter_y <=407)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 684 && counter_x <=687 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 682 || counter_x == 683) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 682 || counter_x == 683) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 688 || counter_x == 689) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 688 || counter_x == 689) && (counter_y == 404 || counter_y == 405))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 684 && counter_x <=687 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 402 || counter_y == 403 )) ||
							((counter_x == 688 || counter_x == 689) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 686 || counter_x == 687) && (counter_y == 406 || counter_y == 407))||
							((counter_x == 682 || counter_x == 683) && (counter_y == 400 || counter_y == 401))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 682 || counter_x == 683) && counter_y >= 400 && counter_y <=405) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 398 || counter_y ==399)) ||
							( counter_x >= 684 && counter_x <=687 && (counter_y == 406 || counter_y ==407)) ||
							((counter_x == 688 || counter_x == 689) && counter_y >= 400 && counter_y <=405))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*MSB starts*/
			
			else if (counter_x >= 672 && counter_x <= 679 && counter_y >= 398 && counter_y <=407)
			begin
				case(Dt_3) 
					'd1 :
						begin
							if((((counter_x == 673 || counter_x == 674) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 675 || counter_x == 676) && (counter_y >= 398 && counter_y <=405)) ||
							( counter_x >= 673 && counter_x <=678 && (counter_y == 406 || counter_y == 407)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 672 || counter_x == 673) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 678 || counter_x == 679) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 676 || counter_x == 677) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 674 || counter_x == 675) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 672 && counter_x <= 679 && (counter_y == 406|| counter_y == 407)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 672 || counter_x == 673) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 678 || counter_x == 679) && (counter_y == 400 || counter_y ==401)) ||
							((counter_x == 676 || counter_x == 677) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 678 || counter_x == 679) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 672 || counter_x == 673) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 406 || counter_y == 407)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 672 || counter_x == 673) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 674 || counter_x == 675) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 672 && counter_x <=679 && (counter_y == 404 || counter_y == 405 )) ||
							((counter_x == 676 || counter_x == 677) && counter_y >= 398 && counter_y <=403) ||
							((counter_x == 676 || counter_x == 677) && (counter_y == 406 || counter_y == 407)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 672 && counter_x <=679 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 672 && counter_x <=677 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 672 && counter_x <=677 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 672 || counter_x == 673) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 678 || counter_x == 679) && (counter_y == 404 || counter_y == 405))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 674 && counter_x <=677 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 672 || counter_x == 673) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 678 || counter_x == 679) && (counter_y == 404 || counter_y == 405))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 672 && counter_x <=677 && (counter_y == 398 || counter_y == 399 )) ||
							((counter_x == 678 || counter_x == 679) && counter_y >= 400 && counter_y <=403) ||
							((counter_x == 676 || counter_x == 677) && counter_y >= 404 && counter_y <=407)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 674 && counter_x <=677 && (counter_y == 398 || counter_y == 409 )) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 672 || counter_x == 673) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 672 || counter_x == 673) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 678 || counter_x == 679) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 678 || counter_x == 679) && (counter_y == 404 || counter_y == 405))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 674 && counter_x <=677 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 402 || counter_y == 403 )) ||
							((counter_x == 678 || counter_x == 679) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 676 || counter_x == 677) && (counter_y == 406 || counter_y == 407))||
							((counter_x == 672 || counter_x == 673) && (counter_y == 400 || counter_y == 401))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 672 || counter_x == 673) && counter_y >= 400 && counter_y <=405) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 398 || counter_y ==399)) ||
							( counter_x >= 674 && counter_x <=677 && (counter_y == 406 || counter_y ==407)) ||
							((counter_x == 678 || counter_x == 679) && counter_y >= 400 && counter_y <=405))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
/*Buffer 4 starts*/
/*Received*/
			/*LSB starts*/
				
			else if (counter_x >= 641 && counter_x <= 648 && counter_y >= 188 && counter_y <=197)
			begin
				case(R4_1) 
					'd1 :
						begin
							if((((counter_x == 642 || counter_x == 643) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 644 || counter_x == 645) && (counter_y >= 188 && counter_y <=195)) ||
							( counter_x >= 642 && counter_x <=647 && (counter_y == 196 || counter_y == 197)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 641 || counter_x == 642) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 647 || counter_x == 648) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 645 || counter_x == 646) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 643 || counter_x == 644) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 641 && counter_x <= 648 && (counter_y == 196|| counter_y == 197)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 641 || counter_x == 642) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 647 || counter_x == 648) && (counter_y == 190 || counter_y ==191)) ||
							((counter_x == 645 || counter_x == 646) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 647 || counter_x == 648) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 641 || counter_x == 642) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 196 || counter_y == 197)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 641 || counter_x == 642) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 643 || counter_x == 644) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 641 && counter_x <=648 && (counter_y == 194 || counter_y == 195 )) ||
							((counter_x == 645 || counter_x == 646) && counter_y >= 188 && counter_y <=193) ||
							((counter_x == 645 || counter_x == 646) && (counter_y == 196 || counter_y == 197)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 641 && counter_x <=648 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 641 && counter_x <=646 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 641 && counter_x <=646 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 641 || counter_x == 642) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 647 || counter_x == 648) && (counter_y == 194 || counter_y == 195))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 643 && counter_x <=646 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 641 || counter_x == 642) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 647 || counter_x == 648) && (counter_y == 194 || counter_y == 195))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 641 && counter_x <=646 && (counter_y == 188 || counter_y == 189 )) ||
							((counter_x == 647 || counter_x == 648) && counter_y >= 190 && counter_y <=193) ||
							((counter_x == 645 || counter_x == 646) && counter_y >= 194 && counter_y <=197)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 643 && counter_x <=646 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 641 || counter_x == 642) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 641 || counter_x == 642) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 647 || counter_x == 648) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 647 || counter_x == 648) && (counter_y == 194 || counter_y == 195))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 643 && counter_x <=646 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 192 || counter_y == 193 )) ||
							((counter_x == 647 || counter_x == 648) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 645 || counter_x == 646) && (counter_y == 196 || counter_y == 197)) ||
							((counter_x == 641 || counter_x == 642) && (counter_y == 190 || counter_y == 191))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 641 || counter_x == 642) && counter_y >= 190 && counter_y <=195) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 188 || counter_y ==189)) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 196 || counter_y ==197)) ||
							((counter_x == 647 || counter_x == 648) && counter_y >= 190 && counter_y <=195))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*Middle digit starts*/
			
			else if (counter_x >= 631 && counter_x <= 638 && counter_y >= 188 && counter_y <=197)
			begin
				case(R4_2) 
					'd1 :
						begin
							if((((counter_x == 632 || counter_x == 633) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 634 || counter_x == 635) && (counter_y >= 188 && counter_y <=195)) ||
							( counter_x >= 632 && counter_x <=637 && (counter_y == 196 || counter_y == 197)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 631 || counter_x == 632) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 637 || counter_x == 638) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 635 || counter_x == 636) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 633 || counter_x == 634) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 631 && counter_x <= 638 && (counter_y == 196|| counter_y == 197)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 631 || counter_x == 632) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 637 || counter_x == 638) && (counter_y == 190 || counter_y ==191)) ||
							((counter_x == 635 || counter_x == 636) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 637 || counter_x == 638) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 631 || counter_x == 632) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 196 || counter_y == 197)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 631 || counter_x == 632) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 633 || counter_x == 634) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 631 && counter_x <=638 && (counter_y == 194 || counter_y == 195 )) ||
							((counter_x == 635 || counter_x == 636) && counter_y >= 188 && counter_y <=193) ||
							((counter_x == 635 || counter_x == 636) && (counter_y == 196 || counter_y == 197)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 631 && counter_x <=638 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 631 && counter_x <=636 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 631 && counter_x <=636 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 631 || counter_x == 632) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 637 || counter_x == 638) && (counter_y == 194 || counter_y == 195))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 633 && counter_x <=636 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 631 || counter_x == 632) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 637 || counter_x == 638) && (counter_y == 194 || counter_y == 195))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 631 && counter_x <=636 && (counter_y == 188 || counter_y == 189 )) ||
							((counter_x == 637 || counter_x == 638) && counter_y >= 190 && counter_y <=193) ||
							((counter_x == 635 || counter_x == 636) && counter_y >= 194 && counter_y <=197)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 633 && counter_x <=636 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 631 || counter_x == 632) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 631 || counter_x == 632) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 637 || counter_x == 638) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 637 || counter_x == 638) && (counter_y == 194 || counter_y == 195))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 633 && counter_x <=636 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 192 || counter_y == 193 )) ||
							((counter_x == 637 || counter_x == 638) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 635 || counter_x == 636) && (counter_y == 196 || counter_y == 197)) ||
							((counter_x == 631 || counter_x == 632) && (counter_y == 190 || counter_y == 191))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 631 || counter_x == 632) && counter_y >= 190 && counter_y <=195) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 188 || counter_y ==189)) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 196 || counter_y ==197)) ||
							((counter_x == 637 || counter_x == 638) && counter_y >= 190 && counter_y <=195))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*MSB starts*/
			
			else if (counter_x >= 621 && counter_x <= 628 && counter_y >= 188 && counter_y <=197)
			begin
				case(R4_3) 
					'd1 :
						begin
							if((((counter_x == 622 || counter_x == 623) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 624 || counter_x == 625) && (counter_y >= 188 && counter_y <=195)) ||
							( counter_x >= 622 && counter_x <=627 && (counter_y == 196 || counter_y == 197)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 621 || counter_x == 622) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 627 || counter_x == 628) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 625 || counter_x == 626) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 623 || counter_x == 624) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 621 && counter_x <= 628 && (counter_y == 196|| counter_y == 197)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 621 || counter_x == 622) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 627 || counter_x == 628) && (counter_y == 190 || counter_y ==191)) ||
							((counter_x == 625 || counter_x == 626) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 627 || counter_x == 628) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 621 || counter_x == 622) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 196 || counter_y == 197)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 621 || counter_x == 622) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 623 || counter_x == 624) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 621 && counter_x <=628 && (counter_y == 194 || counter_y == 195 )) ||
							((counter_x == 625 || counter_x == 626) && counter_y >= 188 && counter_y <=193) ||
							((counter_x == 625 || counter_x == 626) && (counter_y == 196 || counter_y == 197)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 621 && counter_x <=628 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 621 && counter_x <=626 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 621 && counter_x <=626 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 621 || counter_x == 622) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 627 || counter_x == 628) && (counter_y == 194 || counter_y == 195))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 623 && counter_x <=626 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 621 || counter_x == 622) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 627 || counter_x == 628) && (counter_y == 194 || counter_y == 195))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 621 && counter_x <=626 && (counter_y == 188 || counter_y == 189 )) ||
							((counter_x == 627 || counter_x == 628) && counter_y >= 190 && counter_y <=193) ||
							((counter_x == 625 || counter_x == 626) && counter_y >= 194 && counter_y <=197)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 623 && counter_x <=626 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 621 || counter_x == 622) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 621 || counter_x == 622) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 627 || counter_x == 628) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 627 || counter_x == 628) && (counter_y == 194 || counter_y == 195))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 623 && counter_x <=626 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 192 || counter_y == 193 )) ||
							((counter_x == 627 || counter_x == 628) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 625 || counter_x == 626) && (counter_y == 196 || counter_y == 197)) ||
							((counter_x == 621 || counter_x == 622) && (counter_y == 190 || counter_y == 191))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 621 || counter_x == 622) && counter_y >= 190 && counter_y <=195) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 188 || counter_y ==189)) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 196 || counter_y ==197)) ||
							((counter_x == 627 || counter_x == 628) && counter_y >= 190 && counter_y <=195))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
	/*Trasmitted*/

			/*LSB starts*/
			
			else if (counter_x >= 641 && counter_x <= 648 && counter_y >= 293 && counter_y <=302)
			begin
				case(T4_1) 
					'd1 :
						begin
							if((((counter_x == 642 || counter_x == 643) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 644 || counter_x == 645) && (counter_y >= 293 && counter_y <=300)) ||
							( counter_x >= 642 && counter_x <=647 && (counter_y == 301 || counter_y == 302)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 641 || counter_x == 642) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 647 || counter_x == 648) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 645 || counter_x == 646) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 643 || counter_x == 644) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 641 && counter_x <= 648 && (counter_y == 301|| counter_y == 302)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 641 || counter_x == 642) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 647 || counter_x == 648) && (counter_y == 295 || counter_y ==296)) ||
							((counter_x == 645 || counter_x == 646) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 647 || counter_x == 648) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 641 || counter_x == 642) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 301 || counter_y == 302)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 641 || counter_x == 642) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 643 || counter_x == 644) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 641 && counter_x <=648 && (counter_y == 299 || counter_y == 300 )) ||
							((counter_x == 645 || counter_x == 646) && counter_y >= 293 && counter_y <=298) ||
							((counter_x == 645 || counter_x == 646) && (counter_y == 301 || counter_y == 302)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 641 && counter_x <=648 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 641 && counter_x <=646 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 641 && counter_x <=646 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 641 || counter_x == 642) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 647 || counter_x == 648) && (counter_y == 299 || counter_y == 300))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 643 && counter_x <=646 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 641 || counter_x == 642) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 647 || counter_x == 648) && (counter_y == 299 || counter_y == 300))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 641 && counter_x <=646 && (counter_y == 293 || counter_y == 294 )) ||
							((counter_x == 647 || counter_x == 648) && counter_y >= 295 && counter_y <=298) ||
							((counter_x == 645 || counter_x == 646) && counter_y >= 299 && counter_y <=302)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 643 && counter_x <=646 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 641 || counter_x == 642) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 641 || counter_x == 642) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 647 || counter_x == 648) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 647 || counter_x == 648) && (counter_y == 299 || counter_y == 300))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 643 && counter_x <=646 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 297 || counter_y == 298 )) ||
							((counter_x == 647 || counter_x == 648) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 645 || counter_x == 646) && (counter_y == 301 || counter_y == 302)) ||
							((counter_x == 641 || counter_x == 642) && (counter_y == 295 || counter_y == 296))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 641 || counter_x == 642) && counter_y >= 295 && counter_y <=300) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 293 || counter_y ==294)) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 301 || counter_y ==302)) ||
							((counter_x == 647 || counter_x == 648) && counter_y >= 295 && counter_y <=300))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*Middle digit starts*/
			
			else if (counter_x >= 631 && counter_x <= 638 && counter_y >= 293 && counter_y <=302)
			begin
				case(T4_2) 
					'd1 :
						begin
							if((((counter_x == 632 || counter_x == 633) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 634 || counter_x == 635) && (counter_y >= 293 && counter_y <=300)) ||
							( counter_x >= 632 && counter_x <=637 && (counter_y == 301 || counter_y == 302)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 631 || counter_x == 632) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 637 || counter_x == 638) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 635 || counter_x == 636) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 633 || counter_x == 634) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 631 && counter_x <= 638 && (counter_y == 301|| counter_y == 302)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 631 || counter_x == 632) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 637 || counter_x == 638) && (counter_y == 295 || counter_y ==296)) ||
							((counter_x == 635 || counter_x == 636) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 637 || counter_x == 638) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 631 || counter_x == 632) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 301 || counter_y == 302)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 631 || counter_x == 632) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 633 || counter_x == 634) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 631 && counter_x <=638 && (counter_y == 299 || counter_y == 300 )) ||
							((counter_x == 635 || counter_x == 636) && counter_y >= 293 && counter_y <=298) ||
							((counter_x == 635 || counter_x == 636) && (counter_y == 301 || counter_y == 302)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 631 && counter_x <=638 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 631 && counter_x <=636 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 631 && counter_x <=636 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 631 || counter_x == 632) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 637 || counter_x == 638) && (counter_y == 299 || counter_y == 300))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 633 && counter_x <=636 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 631 || counter_x == 632) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 637 || counter_x == 638) && (counter_y == 299 || counter_y == 300))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 631 && counter_x <=636 && (counter_y == 293 || counter_y == 294 )) ||
							((counter_x == 637 || counter_x == 638) && counter_y >= 295 && counter_y <=298) ||
							((counter_x == 635 || counter_x == 636) && counter_y >= 299 && counter_y <=302)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 633 && counter_x <=636 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 631 || counter_x == 632) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 631 || counter_x == 632) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 637 || counter_x == 638) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 637 || counter_x == 638) && (counter_y == 299 || counter_y == 300))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 633 && counter_x <=636 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 297 || counter_y == 298 )) ||
							((counter_x == 637 || counter_x == 638) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 635 || counter_x == 636) && (counter_y == 301 || counter_y == 302)) ||
							((counter_x == 631 || counter_x == 632) && (counter_y == 295 || counter_y == 296))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 631 || counter_x == 632) && counter_y >= 295 && counter_y <=300) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 293 || counter_y ==294)) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 301 || counter_y ==302)) ||
							((counter_x == 637 || counter_x == 638) && counter_y >= 295 && counter_y <=300))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*MSB starts*/
			
			else if (counter_x >= 621 && counter_x <= 628 && counter_y >= 293 && counter_y <=302)
			begin
				case(T4_3) 
					'd1 :
						begin
							if((((counter_x == 622 || counter_x == 623) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 624 || counter_x == 625) && (counter_y >= 293 && counter_y <=300)) ||
							( counter_x >= 622 && counter_x <=627 && (counter_y == 301 || counter_y == 302)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 621 || counter_x == 622) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 627 || counter_x == 628) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 625 || counter_x == 626) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 623 || counter_x == 624) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 621 && counter_x <= 628 && (counter_y == 301|| counter_y == 302)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 621 || counter_x == 622) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 627 || counter_x == 628) && (counter_y == 295 || counter_y ==296)) ||
							((counter_x == 625 || counter_x == 626) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 627 || counter_x == 628) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 621 || counter_x == 622) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 301 || counter_y == 302)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 621 || counter_x == 622) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 623 || counter_x == 624) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 621 && counter_x <=628 && (counter_y == 299 || counter_y == 300 )) ||
							((counter_x == 625 || counter_x == 626) && counter_y >= 293 && counter_y <=298) ||
							((counter_x == 625 || counter_x == 626) && (counter_y == 301 || counter_y == 302)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 621 && counter_x <=628 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 621 && counter_x <=626 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 621 && counter_x <=626 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 621 || counter_x == 622) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 627 || counter_x == 628) && (counter_y == 299 || counter_y == 300))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 623 && counter_x <=626 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 621 || counter_x == 622) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 627 || counter_x == 628) && (counter_y == 299 || counter_y == 300))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 621 && counter_x <=626 && (counter_y == 293 || counter_y == 294 )) ||
							((counter_x == 627 || counter_x == 628) && counter_y >= 295 && counter_y <=298) ||
							((counter_x == 625 || counter_x == 626) && counter_y >= 299 && counter_y <=302)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 623 && counter_x <=626 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 621 || counter_x == 622) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 621 || counter_x == 622) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 627 || counter_x == 628) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 627 || counter_x == 628) && (counter_y == 299 || counter_y == 300))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 623 && counter_x <=626 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 297 || counter_y == 298 )) ||
							((counter_x == 627 || counter_x == 628) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 625 || counter_x == 626) && (counter_y == 301 || counter_y == 302)) ||
							((counter_x == 621 || counter_x == 622) && (counter_y == 295 || counter_y == 296))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 621 || counter_x == 622) && counter_y >= 295 && counter_y <=300) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 293 || counter_y ==294)) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 301 || counter_y ==302)) ||
							((counter_x == 627 || counter_x == 628) && counter_y >= 295 && counter_y <=300))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
/*Dropped*/

			/*LSB starts*/
				
			else if (counter_x >= 641 && counter_x <= 648 && counter_y >= 398 && counter_y <=407)
			begin
				case(D4_1) 
					'd1 :
						begin
							if((((counter_x == 642 || counter_x == 643) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 644 || counter_x == 645) && (counter_y >= 398 && counter_y <=405)) ||
							( counter_x >= 642 && counter_x <=647 && (counter_y == 406 || counter_y == 407)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 641 || counter_x == 642) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 647 || counter_x == 648) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 645 || counter_x == 646) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 643 || counter_x == 644) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 641 && counter_x <= 648 && (counter_y == 406|| counter_y == 407)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 641 || counter_x == 642) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 647 || counter_x == 648) && (counter_y == 400 || counter_y ==401)) ||
							((counter_x == 645 || counter_x == 646) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 647 || counter_x == 648) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 641 || counter_x == 642) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 406 || counter_y == 407)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 641 || counter_x == 642) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 643 || counter_x == 644) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 641 && counter_x <=648 && (counter_y == 404 || counter_y == 405 )) ||
							((counter_x == 645 || counter_x == 646) && counter_y >= 398 && counter_y <=403) ||
							((counter_x == 645 || counter_x == 646) && (counter_y == 406 || counter_y == 407)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 641 && counter_x <=648 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 641 && counter_x <=646 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 641 && counter_x <=646 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 641 || counter_x == 642) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 647 || counter_x == 648) && (counter_y == 404 || counter_y == 405))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 643 && counter_x <=646 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 641 || counter_x == 642) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 647 || counter_x == 648) && (counter_y == 404 || counter_y == 405))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 641 && counter_x <=646 && (counter_y == 398 || counter_y == 399 )) ||
							((counter_x == 647 || counter_x == 648) && counter_y >= 400 && counter_y <=403) ||
							((counter_x == 645 || counter_x == 646) && counter_y >= 404 && counter_y <=407)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 643 && counter_x <=646 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 641 || counter_x == 642) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 641 || counter_x == 642) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 647 || counter_x == 648) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 647 || counter_x == 648) && (counter_y == 404 || counter_y == 405))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 643 && counter_x <=646 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 402 || counter_y == 403 )) ||
							((counter_x == 647 || counter_x == 648) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 645 || counter_x == 646) && (counter_y == 406 || counter_y == 407)) ||
							((counter_x == 641 || counter_x == 642) && (counter_y == 400 || counter_y == 401))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 641 || counter_x == 642) && counter_y >= 400 && counter_y <=405) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 398 || counter_y ==399)) ||
							( counter_x >= 643 && counter_x <=646 && (counter_y == 406 || counter_y ==407)) ||
							((counter_x == 647 || counter_x == 648) && counter_y >= 400 && counter_y <=405))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*Middle digit starts*/
			
			else if (counter_x >= 631 && counter_x <= 638 && counter_y >= 398 && counter_y <=407)
			begin
				case(D4_2) 
					'd1 :
						begin
							if((((counter_x == 632 || counter_x == 633) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 634 || counter_x == 635) && (counter_y >= 398 && counter_y <=405)) ||
							( counter_x >= 632 && counter_x <=637 && (counter_y == 406 || counter_y == 407)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 631 || counter_x == 632) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 637 || counter_x == 638) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 635 || counter_x == 636) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 633 || counter_x == 634) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 631 && counter_x <= 638 && (counter_y == 406|| counter_y == 407)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 631 || counter_x == 632) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 637 || counter_x == 638) && (counter_y == 400 || counter_y ==401)) ||
							((counter_x == 635 || counter_x == 636) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 637 || counter_x == 638) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 631 || counter_x == 632) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 406 || counter_y == 407)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 631 || counter_x == 632) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 633 || counter_x == 634) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 631 && counter_x <=638 && (counter_y == 404 || counter_y == 405 )) ||
							((counter_x == 635 || counter_x == 636) && counter_y >= 398 && counter_y <=403) ||
							((counter_x == 635 || counter_x == 636) && (counter_y == 406 || counter_y == 407)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 631 && counter_x <=638 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 631 && counter_x <=636 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 631 && counter_x <=636 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 631 || counter_x == 632) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 637 || counter_x == 638) && (counter_y == 404 || counter_y == 405))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 633 && counter_x <=636 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 631 || counter_x == 632) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 637 || counter_x == 638) && (counter_y == 404 || counter_y == 405))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 631 && counter_x <=636 && (counter_y == 398 || counter_y == 399 )) ||
							((counter_x == 637 || counter_x == 638) && counter_y >= 400 && counter_y <=403) ||
							((counter_x == 635 || counter_x == 636) && counter_y >= 404 && counter_y <=407)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 633 && counter_x <=636 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 631 || counter_x == 632) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 631 || counter_x == 632) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 637 || counter_x == 638) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 637 || counter_x == 638) && (counter_y == 404 || counter_y == 405))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 633 && counter_x <=636 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 402 || counter_y == 403 )) ||
							((counter_x == 637 || counter_x == 638) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 635 || counter_x == 636) && (counter_y == 406 || counter_y == 407)) ||
							((counter_x == 631 || counter_x == 632) && (counter_y == 400 || counter_y == 401))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 631 || counter_x == 632) && counter_y >= 400 && counter_y <=405) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 398 || counter_y ==399)) ||
							( counter_x >= 633 && counter_x <=636 && (counter_y == 406 || counter_y ==407)) ||
							((counter_x == 637 || counter_x == 638) && counter_y >= 400 && counter_y <=405))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*MSB starts*/
			
			else if (counter_x >= 621 && counter_x <= 628 && counter_y >= 398 && counter_y <=407)
			begin
				case(D4_3) 
					'd1 :
						begin
							if((((counter_x == 622 || counter_x == 623) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 624 || counter_x == 625) && (counter_y >= 398 && counter_y <=405)) ||
							( counter_x >= 622 && counter_x <=627 && (counter_y == 406 || counter_y == 407)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 621 || counter_x == 622) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 627 || counter_x == 628) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 625 || counter_x == 626) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 623 || counter_x == 624) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 621 && counter_x <= 628 && (counter_y == 406|| counter_y == 407)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 621 || counter_x == 622) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 627 || counter_x == 628) && (counter_y == 400 || counter_y ==401)) ||
							((counter_x == 625 || counter_x == 626) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 627 || counter_x == 628) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 621 || counter_x == 622) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 406 || counter_y == 407)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 621 || counter_x == 622) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 623 || counter_x == 624) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 621 && counter_x <=628 && (counter_y == 404 || counter_y == 405 )) ||
							((counter_x == 625 || counter_x == 626) && counter_y >= 398 && counter_y <=403) ||
							((counter_x == 625 || counter_x == 626) && (counter_y == 406 || counter_y == 407)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 621 && counter_x <=628 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 621 && counter_x <=626 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 621 && counter_x <=626 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 621 || counter_x == 622) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 627 || counter_x == 628) && (counter_y == 404 || counter_y == 405))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 623 && counter_x <=626 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 621 || counter_x == 622) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 627 || counter_x == 628) && (counter_y == 404 || counter_y == 405))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 621 && counter_x <=626 && (counter_y == 398 || counter_y == 399 )) ||
							((counter_x == 627 || counter_x == 628) && counter_y >= 400 && counter_y <=403) ||
							((counter_x == 625 || counter_x == 626) && counter_y >= 404 && counter_y <=407)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 623 && counter_x <=626 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 621 || counter_x == 622) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 621 || counter_x == 622) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 627 || counter_x == 628) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 627 || counter_x == 628) && (counter_y == 404 || counter_y == 405))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 623 && counter_x <=626 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 402 || counter_y == 403 )) ||
							((counter_x == 627 || counter_x == 628) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 625 || counter_x == 626) && (counter_y == 406 || counter_y == 407)) ||
							((counter_x == 621 || counter_x == 622) && (counter_y == 400 || counter_y == 401))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 621 || counter_x == 622) && counter_y >= 400 && counter_y <=405) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 398 || counter_y ==399)) ||
							( counter_x >= 623 && counter_x <=626 && (counter_y == 406 || counter_y ==407)) ||
							((counter_x == 627 || counter_x == 628) && counter_y >= 400 && counter_y <=405))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*Buffer 3 starts*/

/* Buffer 3 for R*/

			/*LSB starts*/
				
			else if (counter_x >= 590 && counter_x <= 597 && counter_y >= 188 && counter_y <=197)
			begin
				case(R3_1) 
					'd1 :
						begin
							if((((counter_x == 591 || counter_x == 592) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 593 || counter_x == 594) && (counter_y >= 188 && counter_y <=195)) ||
							( counter_x >= 591 && counter_x <=596 && (counter_y == 196 || counter_y == 197)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 590 || counter_x == 591) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 596 || counter_x == 597) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 594 || counter_x == 595) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 592 || counter_x == 593) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 590 && counter_x <= 597 && (counter_y == 196|| counter_y == 197)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 590 || counter_x == 591) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 596 || counter_x == 597) && (counter_y == 190 || counter_y ==191)) ||
							((counter_x == 594 || counter_x == 595) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 596 || counter_x == 597) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 590 || counter_x == 591) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 196 || counter_y == 197)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 590 || counter_x == 591) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 592 || counter_x == 593) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 590 && counter_x <=597 && (counter_y == 194 || counter_y == 195 )) ||
							((counter_x == 594 || counter_x == 595) && counter_y >= 188 && counter_y <=193) ||
							((counter_x == 594 || counter_x == 595) && (counter_y == 196 || counter_y == 197)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 590 && counter_x <=597 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 590 && counter_x <=595 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 590 && counter_x <=595 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 590 || counter_x == 591) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 596 || counter_x == 597) && (counter_y == 194 || counter_y == 195))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 592 && counter_x <=595 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 590 || counter_x == 591) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 596 || counter_x == 597) && (counter_y == 194 || counter_y == 195))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 590 && counter_x <=595 && (counter_y == 188 || counter_y == 189 )) ||
							((counter_x == 596 || counter_x == 597) && counter_y >= 190 && counter_y <=193) ||
							((counter_x == 594 || counter_x == 595) && counter_y >= 194 && counter_y <=197)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 592 && counter_x <=595 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 590 || counter_x == 591) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 590 || counter_x == 591) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 596 || counter_x == 597) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 596 || counter_x == 597) && (counter_y == 194 || counter_y == 195))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 592 && counter_x <=595 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 192 || counter_y == 193 )) ||
							((counter_x == 596 || counter_x == 597) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 594 || counter_x == 595) && (counter_y == 196 || counter_y == 197)) ||
							((counter_x == 590 || counter_x == 591) && (counter_y == 190 || counter_y == 191))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 590 || counter_x == 591) && counter_y >= 190 && counter_y <=195) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 188 || counter_y ==189)) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 196 || counter_y ==197)) ||
							((counter_x == 596 || counter_x == 597) && counter_y >= 190 && counter_y <=195))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*Middle digit starts*/
			
			else if (counter_x >= 580 && counter_x <= 587 && counter_y >= 188 && counter_y <=197)
			begin
				case(R3_2) 
					'd1 :
						begin
							if((((counter_x == 581 || counter_x == 582) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 583 || counter_x == 584) && (counter_y >= 188 && counter_y <=195)) ||
							( counter_x >= 581 && counter_x <=586 && (counter_y == 196 || counter_y == 197)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 580 || counter_x == 581) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 586 || counter_x == 587) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 584 || counter_x == 585) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 582 || counter_x == 583) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 580 && counter_x <= 587 && (counter_y == 196|| counter_y == 197)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 580 || counter_x == 581) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 586 || counter_x == 587) && (counter_y == 190 || counter_y ==191)) ||
							((counter_x == 584 || counter_x == 585) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 586 || counter_x == 587) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 580 || counter_x == 581) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 196 || counter_y == 197)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 580 || counter_x == 581) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 582 || counter_x == 583) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 580 && counter_x <=587 && (counter_y == 194 || counter_y == 195 )) ||
							((counter_x == 584 || counter_x == 585) && counter_y >= 188 && counter_y <=193) ||
							((counter_x == 584 || counter_x == 585) && (counter_y == 196 || counter_y == 197)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 580 && counter_x <=587 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 580 && counter_x <=585 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 580 && counter_x <=585 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 580 || counter_x == 581) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 586 || counter_x == 587) && (counter_y == 194 || counter_y == 195))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 582 && counter_x <=585 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 580 || counter_x == 581) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 586 || counter_x == 587) && (counter_y == 194 || counter_y == 195))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 580 && counter_x <=585 && (counter_y == 188 || counter_y == 189 )) ||
							((counter_x == 586 || counter_x == 587) && counter_y >= 190 && counter_y <=193) ||
							((counter_x == 584 || counter_x == 585) && counter_y >= 194 && counter_y <=197)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 582 && counter_x <=585 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 580 || counter_x == 581) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 580 || counter_x == 581) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 586 || counter_x == 587) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 586 || counter_x == 587) && (counter_y == 194 || counter_y == 195))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 582 && counter_x <=585 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 192 || counter_y == 193 )) ||
							((counter_x == 586 || counter_x == 587) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 584 || counter_x == 585) && (counter_y == 196 || counter_y == 197))||
							((counter_x == 580 || counter_x == 581) && (counter_y == 190 || counter_y == 191))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 580 || counter_x == 581) && counter_y >= 190 && counter_y <=195) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 188 || counter_y ==189)) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 196 || counter_y ==197)) ||
							((counter_x == 586 || counter_x == 587) && counter_y >= 190 && counter_y <=195))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*MSB starts*/
			
			else if (counter_x >= 570 && counter_x <= 577 && counter_y >= 188 && counter_y <=197)
			begin
				case(R3_3) 
					'd1 :
						begin
							if((((counter_x == 571 || counter_x == 572) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 573 || counter_x == 574) && (counter_y >= 188 && counter_y <=195)) ||
							( counter_x >= 571 && counter_x <=576 && (counter_y == 196 || counter_y == 197)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 570 || counter_x == 571) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 576 || counter_x == 577) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 574 || counter_x == 575) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 572 || counter_x == 573) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 570 && counter_x <= 577 && (counter_y == 196|| counter_y == 197)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 570 || counter_x == 571) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 576 || counter_x == 577) && (counter_y == 190 || counter_y ==191)) ||
							((counter_x == 574 || counter_x == 575) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 576 || counter_x == 577) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 570 || counter_x == 571) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 196 || counter_y == 197)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 570 || counter_x == 571) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 572 || counter_x == 573) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 570 && counter_x <=577 && (counter_y == 194 || counter_y == 195 )) ||
							((counter_x == 574 || counter_x == 575) && counter_y >= 188 && counter_y <=193) ||
							((counter_x == 574 || counter_x == 575) && (counter_y == 196 || counter_y == 197)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 570 && counter_x <=577 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 570 && counter_x <=575 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 570 && counter_x <=575 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 570 || counter_x == 571) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 576 || counter_x == 577) && (counter_y == 194 || counter_y == 195))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 572 && counter_x <=575 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 570 || counter_x == 571) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 576 || counter_x == 577) && (counter_y == 194 || counter_y == 195))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 570 && counter_x <=575 && (counter_y == 188 || counter_y == 189 )) ||
							((counter_x == 576 || counter_x == 577) && counter_y >= 190 && counter_y <=193) ||
							((counter_x == 574 || counter_x == 575) && counter_y >= 194 && counter_y <=197)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 572 && counter_x <=575 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 570 || counter_x == 571) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 570 || counter_x == 571) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 576 || counter_x == 577) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 576 || counter_x == 577) && (counter_y == 194 || counter_y == 195))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 572 && counter_x <=575 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 192 || counter_y == 193 )) ||
							((counter_x == 576 || counter_x == 577) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 574 || counter_x == 575) && (counter_y == 196 || counter_y == 197))||
							((counter_x == 570 || counter_x == 571) && (counter_y == 190 || counter_y == 191))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 570 || counter_x == 571) && counter_y >= 190 && counter_y <=195) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 188 || counter_y ==189)) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 196 || counter_y ==197)) ||
							((counter_x == 576 || counter_x == 577) && counter_y >= 190 && counter_y <=195))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
	/*Buffer 3 for T*/

			/*LSB starts*/
			
			else if (counter_x >= 590 && counter_x <= 597 && counter_y >= 293 && counter_y <=302)
			begin
				case(T3_1) 
					'd1 :
						begin
							if((((counter_x == 591 || counter_x == 592) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 593 || counter_x == 594) && (counter_y >= 293 && counter_y <=300)) ||
							( counter_x >= 591 && counter_x <=596 && (counter_y == 301 || counter_y == 302)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 590 || counter_x == 591) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 596 || counter_x == 597) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 594 || counter_x == 595) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 592 || counter_x == 593) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 590 && counter_x <= 597 && (counter_y == 301|| counter_y == 302)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 590 || counter_x == 591) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 596 || counter_x == 597) && (counter_y == 295 || counter_y ==296)) ||
							((counter_x == 594 || counter_x == 595) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 596 || counter_x == 597) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 590 || counter_x == 591) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 301 || counter_y == 302)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 590 || counter_x == 591) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 592 || counter_x == 593) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 590 && counter_x <=597 && (counter_y == 299 || counter_y == 300 )) ||
							((counter_x == 594 || counter_x == 595) && counter_y >= 293 && counter_y <=298) ||
							((counter_x == 594 || counter_x == 595) && (counter_y == 301 || counter_y == 302)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 590 && counter_x <=597 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 590 && counter_x <=595 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 590 && counter_x <=595 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 590 || counter_x == 591) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 596 || counter_x == 597) && (counter_y == 299 || counter_y == 300))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 592 && counter_x <=595 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 590 || counter_x == 591) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 596 || counter_x == 597) && (counter_y == 299 || counter_y == 300))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 590 && counter_x <=595 && (counter_y == 293 || counter_y == 294 )) ||
							((counter_x == 596 || counter_x == 597) && counter_y >= 295 && counter_y <=298) ||
							((counter_x == 594 || counter_x == 595) && counter_y >= 299 && counter_y <=302)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 592 && counter_x <=595 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 590 || counter_x == 591) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 590 || counter_x == 591) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 596 || counter_x == 597) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 596 || counter_x == 597) && (counter_y == 299 || counter_y == 300))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 592 && counter_x <=595 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 297 || counter_y == 298 )) ||
							((counter_x == 596 || counter_x == 597) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 594 || counter_x == 595) && (counter_y == 301 || counter_y == 302)) ||
							((counter_x == 590 || counter_x == 591) && (counter_y == 295 || counter_y == 296))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 590 || counter_x == 591) && counter_y >= 295 && counter_y <=300) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 293 || counter_y ==294)) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 301 || counter_y ==302)) ||
							((counter_x == 596 || counter_x == 597) && counter_y >= 295 && counter_y <=300))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*Middle digit starts*/
			
			else if (counter_x >= 580 && counter_x <= 587 && counter_y >= 293 && counter_y <=302)
			begin
				case(T3_2) 
					'd1 :
						begin
							if((((counter_x == 581 || counter_x == 582) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 583 || counter_x == 584) && (counter_y >= 293 && counter_y <=300)) ||
							( counter_x >= 581 && counter_x <=586 && (counter_y == 301 || counter_y == 302)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 580 || counter_x == 581) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 586 || counter_x == 587) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 584 || counter_x == 585) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 582 || counter_x == 583) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 580 && counter_x <= 587 && (counter_y == 301|| counter_y == 302)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 580 || counter_x == 581) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 586 || counter_x == 587) && (counter_y == 295 || counter_y ==296)) ||
							((counter_x == 584 || counter_x == 585) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 586 || counter_x == 587) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 580 || counter_x == 581) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 301 || counter_y == 302)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 580 || counter_x == 581) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 582 || counter_x == 583) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 580 && counter_x <=587 && (counter_y == 299 || counter_y == 300 )) ||
							((counter_x == 584 || counter_x == 585) && counter_y >= 293 && counter_y <=298) ||
							((counter_x == 584 || counter_x == 585) && (counter_y == 301 || counter_y == 302)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 580 && counter_x <=587 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 580 && counter_x <=585 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 580 && counter_x <=585 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 580 || counter_x == 581) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 586 || counter_x == 587) && (counter_y == 299 || counter_y == 300))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 582 && counter_x <=585 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 580 || counter_x == 581) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 586 || counter_x == 587) && (counter_y == 299 || counter_y == 300))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 580 && counter_x <=585 && (counter_y == 293 || counter_y == 294 )) ||
							((counter_x == 586 || counter_x == 587) && counter_y >= 295 && counter_y <=298) ||
							((counter_x == 584 || counter_x == 585) && counter_y >= 299 && counter_y <=302)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 582 && counter_x <=585 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 580 || counter_x == 581) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 580 || counter_x == 581) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 586 || counter_x == 587) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 586 || counter_x == 587) && (counter_y == 299 || counter_y == 300))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 582 && counter_x <=585 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 297 || counter_y == 298 )) ||
							((counter_x == 586 || counter_x == 587) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 584 || counter_x == 585) && (counter_y == 301 || counter_y == 302)) ||
							((counter_x == 580 || counter_x == 581) && (counter_y == 295 || counter_y == 296))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 580 || counter_x == 581) && counter_y >= 295 && counter_y <=300) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 293 || counter_y ==294)) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 301 || counter_y ==302)) ||
							((counter_x == 586 || counter_x == 587) && counter_y >= 295 && counter_y <=300))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*MSB starts*/
			
			else if (counter_x >= 570 && counter_x <= 577 && counter_y >= 293 && counter_y <=302)
			begin
				case(T3_3) 
					'd1 :
						begin
							if((((counter_x == 571 || counter_x == 572) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 573 || counter_x == 574) && (counter_y >= 293 && counter_y <=300)) ||
							( counter_x >= 571 && counter_x <=576 && (counter_y == 301 || counter_y == 302)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 570 || counter_x == 571) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 576 || counter_x == 577) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 574 || counter_x == 575) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 572 || counter_x == 573) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 570 && counter_x <= 577 && (counter_y == 301|| counter_y == 302)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 570 || counter_x == 571) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 576 || counter_x == 577) && (counter_y == 295 || counter_y ==296)) ||
							((counter_x == 574 || counter_x == 575) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 576 || counter_x == 577) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 570 || counter_x == 571) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 301 || counter_y == 302)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 570 || counter_x == 571) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 572 || counter_x == 573) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 570 && counter_x <=577 && (counter_y == 299 || counter_y == 300 )) ||
							((counter_x == 574 || counter_x == 575) && counter_y >= 293 && counter_y <=298) ||
							((counter_x == 574 || counter_x == 575) && (counter_y == 301 || counter_y == 302)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 570 && counter_x <=577 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 570 && counter_x <=575 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 570 && counter_x <=575 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 570 || counter_x == 571) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 576 || counter_x == 577) && (counter_y == 299 || counter_y == 300))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 572 && counter_x <=575 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 570 || counter_x == 571) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 576 || counter_x == 577) && (counter_y == 299 || counter_y == 300))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 570 && counter_x <=575 && (counter_y == 293 || counter_y == 294 )) ||
							((counter_x == 576 || counter_x == 577) && counter_y >= 295 && counter_y <=298) ||
							((counter_x == 574 || counter_x == 575) && counter_y >= 299 && counter_y <=302)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 572 && counter_x <=575 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 570 || counter_x == 571) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 570 || counter_x == 571) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 576 || counter_x == 577) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 576 || counter_x == 577) && (counter_y == 299 || counter_y == 300))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 587 && counter_x <=575 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 297 || counter_y == 298 )) ||
							((counter_x == 576 || counter_x == 577) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 574 || counter_x == 575) && (counter_y == 301 || counter_y == 302)) ||
							((counter_x == 570 || counter_x == 571) && (counter_y == 295 || counter_y == 296))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 570 || counter_x == 571) && counter_y >= 295 && counter_y <=300) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 293 || counter_y ==294)) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 301 || counter_y ==302)) ||
							((counter_x == 576 || counter_x == 577) && counter_y >= 295 && counter_y <=300))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end			

/*Buffer 3 for D*/

			/*LSB starts*/
				
			else if (counter_x >= 590 && counter_x <= 597 && counter_y >= 398 && counter_y <=407)
			begin
				case(D3_1) 
					'd1 :
						begin
							if((((counter_x == 591 || counter_x == 592) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 593 || counter_x == 594) && (counter_y >= 398 && counter_y <=405)) ||
							( counter_x >= 591 && counter_x <=596 && (counter_y == 406 || counter_y == 407)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 590 || counter_x == 591) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 596 || counter_x == 597) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 594 || counter_x == 595) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 592 || counter_x == 593) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 590 && counter_x <= 597 && (counter_y == 406|| counter_y == 407)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 590 || counter_x == 591) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 596 || counter_x == 597) && (counter_y == 400 || counter_y ==401)) ||
							((counter_x == 594 || counter_x == 595) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 596 || counter_x == 597) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 590 || counter_x == 591) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 406 || counter_y == 407)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 590 || counter_x == 591) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 592 || counter_x == 593) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 590 && counter_x <=597 && (counter_y == 404 || counter_y == 405 )) ||
							((counter_x == 594 || counter_x == 595) && counter_y >= 398 && counter_y <=403) ||
							((counter_x == 594 || counter_x == 595) && (counter_y == 406 || counter_y == 407)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 590 && counter_x <=597 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 590 && counter_x <=595 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 590 && counter_x <=595 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 590 || counter_x == 591) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 596 || counter_x == 597) && (counter_y == 404 || counter_y == 405))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 592 && counter_x <=595 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 590 || counter_x == 591) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 596 || counter_x == 597) && (counter_y == 404 || counter_y == 405))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 590 && counter_x <=595 && (counter_y == 398 || counter_y == 399 )) ||
							((counter_x == 596 || counter_x == 597) && counter_y >= 400 && counter_y <=403) ||
							((counter_x == 594 || counter_x == 595) && counter_y >= 404 && counter_y <=407)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 592 && counter_x <=595 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 590 || counter_x == 591) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 590 || counter_x == 591) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 596 || counter_x == 597) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 596 || counter_x == 597) && (counter_y == 404 || counter_y == 405))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 592 && counter_x <=595 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 402 || counter_y == 403 )) ||
							((counter_x == 596 || counter_x == 597) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 594 || counter_x == 595) && (counter_y == 406 || counter_y == 407)) ||
							((counter_x == 590 || counter_x == 591) && (counter_y == 400 || counter_y == 401))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 590 || counter_x == 591) && counter_y >= 400 && counter_y <=405) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 398 || counter_y ==399)) ||
							( counter_x >= 592 && counter_x <=595 && (counter_y == 406 || counter_y ==407)) ||
							((counter_x == 596 || counter_x == 597) && counter_y >= 400 && counter_y <=405))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*Middle digit starts*/
			
			else if (counter_x >= 580 && counter_x <= 587 && counter_y >= 398 && counter_y <=407)
			begin
				case(D3_2) 
					'd1 :
						begin
							if((((counter_x == 581 || counter_x == 582) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 583 || counter_x == 584) && (counter_y >= 398 && counter_y <=405)) ||
							( counter_x >= 581 && counter_x <=586 && (counter_y == 406 || counter_y == 407)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 580 || counter_x == 581) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 586 || counter_x == 587) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 584 || counter_x == 585) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 582 || counter_x == 583) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 580 && counter_x <= 587 && (counter_y == 406|| counter_y == 407)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 580 || counter_x == 581) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 586 || counter_x == 587) && (counter_y == 400 || counter_y ==401)) ||
							((counter_x == 584 || counter_x == 585) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 586 || counter_x == 587) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 580 || counter_x == 581) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 406 || counter_y == 407)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 580 || counter_x == 581) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 582 || counter_x == 583) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 580 && counter_x <=587 && (counter_y == 404 || counter_y == 405 )) ||
							((counter_x == 584 || counter_x == 585) && counter_y >= 398 && counter_y <=403) ||
							((counter_x == 584 || counter_x == 585) && (counter_y == 406 || counter_y == 407)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 580 && counter_x <=587 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 580 && counter_x <=585 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 580 && counter_x <=585 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 580 || counter_x == 581) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 586 || counter_x == 587) && (counter_y == 404 || counter_y == 405))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 582 && counter_x <=585 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 580 || counter_x == 581) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 586 || counter_x == 587) && (counter_y == 404 || counter_y == 405))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 580 && counter_x <=585 && (counter_y == 398 || counter_y == 399 )) ||
							((counter_x == 586 || counter_x == 587) && counter_y >= 400 && counter_y <=403) ||
							((counter_x == 584 || counter_x == 585) && counter_y >= 404 && counter_y <=407)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 582 && counter_x <=585 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 580 || counter_x == 581) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 580 || counter_x == 581) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 586 || counter_x == 587) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 586 || counter_x == 587) && (counter_y == 404 || counter_y == 405))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 582 && counter_x <=585 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 402 || counter_y == 403 )) ||
							((counter_x == 586 || counter_x == 587) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 584 || counter_x == 585) && (counter_y == 406 || counter_y == 407)) ||
							((counter_x == 580 || counter_x == 581) && (counter_y == 400 || counter_y == 401))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 580 || counter_x == 581) && counter_y >= 400 && counter_y <=405) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 398 || counter_y ==399)) ||
							( counter_x >= 582 && counter_x <=585 && (counter_y == 406 || counter_y ==407)) ||
							((counter_x == 586 || counter_x == 587) && counter_y >= 400 && counter_y <=405))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*MSB starts*/
			
			else if (counter_x >= 570 && counter_x <= 577 && counter_y >= 398 && counter_y <=407)
			begin
				case(D3_3) 
					'd1 :
						begin
							if((((counter_x == 571 || counter_x == 572) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 573 || counter_x == 574) && (counter_y >= 398 && counter_y <=405)) ||
							( counter_x >= 571 && counter_x <=576 && (counter_y == 406 || counter_y == 407)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 570 || counter_x == 571) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 576 || counter_x == 577) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 574 || counter_x == 575) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 572 || counter_x == 573) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 570 && counter_x <= 577 && (counter_y == 406|| counter_y == 407)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 570 || counter_x == 571) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 576 || counter_x == 577) && (counter_y == 400 || counter_y ==401)) ||
							((counter_x == 574 || counter_x == 575) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 576 || counter_x == 577) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 570 || counter_x == 571) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 406 || counter_y == 407)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 570 || counter_x == 571) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 572 || counter_x == 573) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 570 && counter_x <=577 && (counter_y == 404 || counter_y == 405 )) ||
							((counter_x == 574 || counter_x == 575) && counter_y >= 398 && counter_y <=403) ||
							((counter_x == 574 || counter_x == 575) && (counter_y == 406 || counter_y == 407)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 570 && counter_x <=577 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 570 && counter_x <=575 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 570 && counter_x <=575 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 570 || counter_x == 571) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 576 || counter_x == 577) && (counter_y == 404 || counter_y == 405))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 572 && counter_x <=575 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 570 || counter_x == 571) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 576 || counter_x == 577) && (counter_y == 404 || counter_y == 405))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 570 && counter_x <=575 && (counter_y == 398 || counter_y == 399 )) ||
							((counter_x == 576 || counter_x == 577) && counter_y >= 400 && counter_y <=403) ||
							((counter_x == 574 || counter_x == 575) && counter_y >= 404 && counter_y <=407)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 572 && counter_x <=575 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 570 || counter_x == 571) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 570 || counter_x == 571) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 576 || counter_x == 577) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 576 || counter_x == 577) && (counter_y == 404 || counter_y == 405))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 572 && counter_x <=575 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 402 || counter_y == 403 )) ||
							((counter_x == 576 || counter_x == 577) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 574 || counter_x == 575) && (counter_y == 406 || counter_y == 407)) ||
							((counter_x == 570 || counter_x == 571) && (counter_y == 400 || counter_y == 401))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 570 || counter_x == 571) && counter_y >= 400 && counter_y <=405) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 398 || counter_y ==399)) ||
							( counter_x >= 572 && counter_x <=575 && (counter_y == 406 || counter_y ==407)) ||
							((counter_x == 576 || counter_x == 577) && counter_y >= 400 && counter_y <=405))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end

/*Buffer 2 starts*/

/* Buffer 2 for R*/

			/*LSB starts*/
				
			else if (counter_x >= 539 && counter_x <= 546 && counter_y >= 188 && counter_y <=197)
			begin
				case(R2_1) 
					'd1 :
						begin
							if((((counter_x == 540 || counter_x == 541) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 542 || counter_x == 543) && (counter_y >= 188 && counter_y <=195)) ||
							( counter_x >= 540 && counter_x <=545 && (counter_y == 196 || counter_y == 197)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 539 || counter_x == 540) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 545 || counter_x == 546) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 543 || counter_x == 544) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 541 || counter_x == 542) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 539 && counter_x <= 546 && (counter_y == 196|| counter_y == 197)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 539 || counter_x == 540) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 545 || counter_x == 546) && (counter_y == 190 || counter_y ==191)) ||
							((counter_x == 543 || counter_x == 544) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 545 || counter_x == 546) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 539 || counter_x == 540) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 196 || counter_y == 197)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 539 || counter_x == 540) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 541 || counter_x == 542) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 539 && counter_x <=546 && (counter_y == 194 || counter_y == 195 )) ||
							((counter_x == 543 || counter_x == 544) && counter_y >= 188 && counter_y <=193) ||
							((counter_x == 543 || counter_x == 544) && (counter_y == 196 || counter_y == 197)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 539 && counter_x <=546 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 539 && counter_x <=544 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 539 && counter_x <=544 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 539 || counter_x == 540) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 545 || counter_x == 546) && (counter_y == 194 || counter_y == 195))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 541 && counter_x <=544 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 539 || counter_x == 540) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 545 || counter_x == 546) && (counter_y == 194 || counter_y == 195))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 539 && counter_x <=544 && (counter_y == 188 || counter_y == 189 )) ||
							((counter_x == 545 || counter_x == 546) && counter_y >= 190 && counter_y <=193) ||
							((counter_x == 543 || counter_x == 544) && counter_y >= 194 && counter_y <=197)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 541 && counter_x <=544 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 539 || counter_x == 540) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 539 || counter_x == 540) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 545 || counter_x == 546) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 545 || counter_x == 546) && (counter_y == 194 || counter_y == 195))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 541 && counter_x <=544 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 192 || counter_y == 193 )) ||
							((counter_x == 545 || counter_x == 546) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 543 || counter_x == 544) && (counter_y == 196 || counter_y == 197)) ||
							((counter_x == 539 || counter_x == 540) && (counter_y == 190 || counter_y == 191))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 539 || counter_x == 540) && counter_y >= 190 && counter_y <=195) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 188 || counter_y ==189)) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 196 || counter_y ==197)) ||
							((counter_x == 545 || counter_x == 546) && counter_y >= 190 && counter_y <=195))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*Middle digit starts*/
			
			else if (counter_x >= 529 && counter_x <= 536 && counter_y >= 188 && counter_y <=197)
			begin
				case(R2_2) 
					'd1 :
						begin
							if((((counter_x == 530 || counter_x == 531) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 532 || counter_x == 533) && (counter_y >= 188 && counter_y <=195)) ||
							( counter_x >= 530 && counter_x <=535 && (counter_y == 196 || counter_y == 197)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 529 || counter_x == 530) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 535 || counter_x == 536) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 533 || counter_x == 534) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 531 || counter_x == 532) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 529 && counter_x <= 536 && (counter_y == 196|| counter_y == 197)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 529 || counter_x == 530) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 535 || counter_x == 536) && (counter_y == 190 || counter_y ==191)) ||
							((counter_x == 533 || counter_x == 534) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 535 || counter_x == 536) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 529 || counter_x == 530) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 196 || counter_y == 197)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 529 || counter_x == 530) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 531 || counter_x == 532) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 529 && counter_x <=536 && (counter_y == 194 || counter_y == 195 )) ||
							((counter_x == 533 || counter_x == 534) && counter_y >= 188 && counter_y <=193) ||
							((counter_x == 533 || counter_x == 534) && (counter_y == 196 || counter_y == 197)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 529 && counter_x <=536 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 529 && counter_x <=534 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 529 && counter_x <=534 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 529 || counter_x == 530) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 535 || counter_x == 536) && (counter_y == 194 || counter_y == 195))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 531 && counter_x <=534 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 529 || counter_x == 530) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 535 || counter_x == 536) && (counter_y == 194 || counter_y == 195))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 529 && counter_x <=534 && (counter_y == 188 || counter_y == 189 )) ||
							((counter_x == 535 || counter_x == 536) && counter_y >= 190 && counter_y <=193) ||
							((counter_x == 533 || counter_x == 534) && counter_y >= 194 && counter_y <=197)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 531 && counter_x <=534 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 529 || counter_x == 530) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 529 || counter_x == 530) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 535 || counter_x == 536) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 535 || counter_x == 536) && (counter_y == 194 || counter_y == 195))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 531 && counter_x <=534 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 192 || counter_y == 193 )) ||
							((counter_x == 535 || counter_x == 536) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 533 || counter_x == 534) && (counter_y == 196 || counter_y == 197)) ||
							((counter_x == 529 || counter_x == 530) && (counter_y == 190 || counter_y == 191))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 529 || counter_x == 530) && counter_y >= 190 && counter_y <=195) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 188 || counter_y ==189)) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 196 || counter_y ==197)) ||
							((counter_x == 535 || counter_x == 536) && counter_y >= 190 && counter_y <=195))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*MSB starts*/
			
			else if (counter_x >= 519 && counter_x <= 526 && counter_y >= 188 && counter_y <=197)
			begin
				case(R2_3) 
					'd1 :
						begin
							if((((counter_x == 520 || counter_x == 521) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 522 || counter_x == 523) && (counter_y >= 188 && counter_y <=195)) ||
							( counter_x >= 520 && counter_x <=525 && (counter_y == 196 || counter_y == 197)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 519 || counter_x == 520) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 525 || counter_x == 526) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 523 || counter_x == 524) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 521 || counter_x == 522) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 519 && counter_x <= 526 && (counter_y == 196|| counter_y == 197)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 519 || counter_x == 520) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 525 || counter_x == 526) && (counter_y == 190 || counter_y ==191)) ||
							((counter_x == 523 || counter_x == 524) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 525 || counter_x == 526) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 519 || counter_x == 520) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 196 || counter_y == 197)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 519 || counter_x == 520) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 521 || counter_x == 522) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 519 && counter_x <=526 && (counter_y == 194 || counter_y == 195 )) ||
							((counter_x == 523 || counter_x == 524) && counter_y >= 188 && counter_y <=193) ||
							((counter_x == 523 || counter_x == 524) && (counter_y == 196 || counter_y == 197)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 519 && counter_x <=526 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 519 && counter_x <=524 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 519 && counter_x <=524 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 519 || counter_x == 520) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 525 || counter_x == 526) && (counter_y == 194 || counter_y == 195))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 521 && counter_x <=524 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 519 || counter_x == 520) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 525 || counter_x == 526) && (counter_y == 194 || counter_y == 195))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 519 && counter_x <=524 && (counter_y == 188 || counter_y == 189 )) ||
							((counter_x == 525 || counter_x == 526) && counter_y >= 190 && counter_y <=193) ||
							((counter_x == 523 || counter_x == 524) && counter_y >= 194 && counter_y <=197)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 521 && counter_x <=524 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 519 || counter_x == 520) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 519 || counter_x == 520) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 525 || counter_x == 526) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 525 || counter_x == 526) && (counter_y == 194 || counter_y == 195))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 521 && counter_x <=524 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 192 || counter_y == 193 )) ||
							((counter_x == 525 || counter_x == 526) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 523 || counter_x == 524) && (counter_y == 196 || counter_y == 197)) ||
							((counter_x == 519 || counter_x == 520) && (counter_y == 190 || counter_y == 191))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 519 || counter_x == 520) && counter_y >= 190 && counter_y <=195) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 188 || counter_y ==189)) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 196 || counter_y ==197)) ||
							((counter_x == 525 || counter_x == 526) && counter_y >= 190 && counter_y <=195))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
	/*Buffer 2 for T*/

			/*LSB starts*/
			
			else if (counter_x >= 539 && counter_x <= 546 && counter_y >= 293 && counter_y <=302)
			begin
				case(T2_1) 
					'd1 :
						begin
							if((((counter_x == 540 || counter_x == 541) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 542 || counter_x == 543) && (counter_y >= 293 && counter_y <=300)) ||
							( counter_x >= 540 && counter_x <=545 && (counter_y == 301 || counter_y == 302)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 539 || counter_x == 540) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 545 || counter_x == 546) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 543 || counter_x == 544) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 541 || counter_x == 542) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 539 && counter_x <= 546 && (counter_y == 301|| counter_y == 302)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 539 || counter_x == 540) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 545 || counter_x == 546) && (counter_y == 295 || counter_y ==296)) ||
							((counter_x == 543 || counter_x == 544) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 545 || counter_x == 546) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 539 || counter_x == 540) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 301 || counter_y == 302)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 539 || counter_x == 540) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 541 || counter_x == 542) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 539 && counter_x <=546 && (counter_y == 299 || counter_y == 300 )) ||
							((counter_x == 543 || counter_x == 544) && counter_y >= 293 && counter_y <=298) ||
							((counter_x == 543 || counter_x == 544) && (counter_y == 301 || counter_y == 302)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 539 && counter_x <=546 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 539 && counter_x <=544 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 539 && counter_x <=544 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 539 || counter_x == 540) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 545 || counter_x == 546) && (counter_y == 299 || counter_y == 300))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 541 && counter_x <=544 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 539 || counter_x == 540) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 545 || counter_x == 546) && (counter_y == 299 || counter_y == 300))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 539 && counter_x <=544 && (counter_y == 293 || counter_y == 294 )) ||
							((counter_x == 545 || counter_x == 546) && counter_y >= 295 && counter_y <=298) ||
							((counter_x == 543 || counter_x == 544) && counter_y >= 299 && counter_y <=302)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 541 && counter_x <=544 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 539 || counter_x == 540) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 539 || counter_x == 540) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 545 || counter_x == 546) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 545 || counter_x == 546) && (counter_y == 299 || counter_y == 300))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 541 && counter_x <=544 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 297 || counter_y == 298 )) ||
							((counter_x == 545 || counter_x == 546) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 543 || counter_x == 544) && (counter_y == 301 || counter_y == 302)) ||
							((counter_x == 539 || counter_x == 540) && (counter_y == 295 || counter_y == 296))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 539 || counter_x == 540) && counter_y >= 295 && counter_y <=300) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 293 || counter_y ==294)) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 301 || counter_y ==302)) ||
							((counter_x == 545 || counter_x == 546) && counter_y >= 295 && counter_y <=300))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*Middle digit starts*/
			
			else if (counter_x >= 529 && counter_x <= 536 && counter_y >= 293 && counter_y <=302)
			begin
				case(T2_2) 
					'd1 :
						begin
							if((((counter_x == 530 || counter_x == 531) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 532 || counter_x == 533) && (counter_y >= 293 && counter_y <=300)) ||
							( counter_x >= 530 && counter_x <=535 && (counter_y == 301 || counter_y == 302)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 529 || counter_x == 530) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 535 || counter_x == 536) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 533 || counter_x == 534) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 531 || counter_x == 532) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 529 && counter_x <= 536 && (counter_y == 301|| counter_y == 302)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 529 || counter_x == 530) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 535 || counter_x == 536) && (counter_y == 295 || counter_y ==296)) ||
							((counter_x == 533 || counter_x == 534) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 535 || counter_x == 536) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 529 || counter_x == 530) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 301 || counter_y == 302)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 529 || counter_x == 530) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 531 || counter_x == 532) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 529 && counter_x <=536 && (counter_y == 299 || counter_y == 300 )) ||
							((counter_x == 533 || counter_x == 534) && counter_y >= 293 && counter_y <=298) ||
							((counter_x == 533 || counter_x == 534) && (counter_y == 301 || counter_y == 302)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 529 && counter_x <=536 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 529 && counter_x <=534 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 529 && counter_x <=534 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 529 || counter_x == 530) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 535 || counter_x == 536) && (counter_y == 299 || counter_y == 300))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 531 && counter_x <=534 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 529 || counter_x == 530) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 535 || counter_x == 536) && (counter_y == 299 || counter_y == 300))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 529 && counter_x <=534 && (counter_y == 293 || counter_y == 294 )) ||
							((counter_x == 535 || counter_x == 536) && counter_y >= 295 && counter_y <=298) ||
							((counter_x == 533 || counter_x == 534) && counter_y >= 299 && counter_y <=302)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 531 && counter_x <=534 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 529 || counter_x == 530) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 529 || counter_x == 530) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 535 || counter_x == 536) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 535 || counter_x == 536) && (counter_y == 299 || counter_y == 300))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 531 && counter_x <=534 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 297 || counter_y == 298 )) ||
							((counter_x == 535 || counter_x == 536) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 533 || counter_x == 534) && (counter_y == 301 || counter_y == 302)) ||
							((counter_x == 529 || counter_x == 530) && (counter_y == 295 || counter_y == 296))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 529 || counter_x == 530) && counter_y >= 295 && counter_y <=300) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 293 || counter_y ==294)) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 301 || counter_y ==302)) ||
							((counter_x == 535 || counter_x == 536) && counter_y >= 295 && counter_y <=300))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*MSB starts*/
			
			else if (counter_x >= 519 && counter_x <= 526 && counter_y >= 293 && counter_y <=302)
			begin
				case(T2_3) 
					'd1 :
						begin
							if((((counter_x == 520 || counter_x == 521) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 522 || counter_x == 523) && (counter_y >= 293 && counter_y <=300)) ||
							( counter_x >= 520 && counter_x <=525 && (counter_y == 301 || counter_y == 302)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 519 || counter_x == 520) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 525 || counter_x == 526) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 523 || counter_x == 524) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 521 || counter_x == 522) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 519 && counter_x <= 526 && (counter_y == 301|| counter_y == 302)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 519 || counter_x == 520) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 525 || counter_x == 526) && (counter_y == 295 || counter_y ==296)) ||
							((counter_x == 523 || counter_x == 524) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 525 || counter_x == 526) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 519 || counter_x == 520) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 301 || counter_y == 302)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 519 || counter_x == 520) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 521 || counter_x == 522) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 519 && counter_x <=526 && (counter_y == 299 || counter_y == 300 )) ||
							((counter_x == 523 || counter_x == 524) && counter_y >= 293 && counter_y <=298) ||
							((counter_x == 523 || counter_x == 524) && (counter_y == 301 || counter_y == 302)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 519 && counter_x <=526 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 519 && counter_x <=524 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 519 && counter_x <=524 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 519 || counter_x == 520) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 525 || counter_x == 526) && (counter_y == 299 || counter_y == 300))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 521 && counter_x <=524 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 519 || counter_x == 520) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 525 || counter_x == 526) && (counter_y == 299 || counter_y == 300))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 519 && counter_x <=524 && (counter_y == 293 || counter_y == 294 )) ||
							((counter_x == 525 || counter_x == 526) && counter_y >= 295 && counter_y <=298) ||
							((counter_x == 523 || counter_x == 524) && counter_y >= 299 && counter_y <=302)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 521 && counter_x <=524 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 519 || counter_x == 520) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 519 || counter_x == 520) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 525 || counter_x == 526) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 525 || counter_x == 526) && (counter_y == 299 || counter_y == 300))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 521 && counter_x <=524 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 297 || counter_y == 298 )) ||
							((counter_x == 525 || counter_x == 526) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 523 || counter_x == 524) && (counter_y == 301 || counter_y == 302)) ||
							((counter_x == 519 || counter_x == 520) && (counter_y == 295 || counter_y == 296))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 519 || counter_x == 520) && counter_y >= 295 && counter_y <=300) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 293 || counter_y ==294)) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 301 || counter_y ==302)) ||
							((counter_x == 525 || counter_x == 526) && counter_y >= 295 && counter_y <=300))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end

/*Buffer 2 for D*/

			/*LSB starts*/
				
			else if (counter_x >= 539 && counter_x <= 546 && counter_y >= 398 && counter_y <=407)
			begin
				case(D2_1) 
					'd1 :
						begin
							if((((counter_x == 540 || counter_x == 541) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 542 || counter_x == 543) && (counter_y >= 398 && counter_y <=405)) ||
							( counter_x >= 540 && counter_x <=545 && (counter_y == 406 || counter_y == 407)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 539 || counter_x == 540) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 545 || counter_x == 546) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 543 || counter_x == 544) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 541 || counter_x == 542) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 539 && counter_x <= 546 && (counter_y == 406|| counter_y == 407)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 539 || counter_x == 540) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 545 || counter_x == 546) && (counter_y == 400 || counter_y ==401)) ||
							((counter_x == 543 || counter_x == 544) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 545 || counter_x == 546) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 539 || counter_x == 540) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 406 || counter_y == 407)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 539 || counter_x == 540) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 541 || counter_x == 542) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 539 && counter_x <=545 && (counter_y == 404 || counter_y == 405 )) ||
							((counter_x == 543 || counter_x == 544) && counter_y >= 398 && counter_y <=403) ||
							((counter_x == 543 || counter_x == 544) && (counter_y == 406 || counter_y == 407)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 539 && counter_x <=546 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 539 && counter_x <=544 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 539 && counter_x <=544 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 539 || counter_x == 540) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 545 || counter_x == 546) && (counter_y == 404 || counter_y == 405))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 541 && counter_x <=544 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 539 || counter_x == 540) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 545 || counter_x == 546) && (counter_y == 404 || counter_y == 405))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 539 && counter_x <=544 && (counter_y == 398 || counter_y == 399 )) ||
							((counter_x == 547 || counter_x == 546) && counter_y >= 400 && counter_y <=403) ||
							((counter_x == 543 || counter_x == 544) && counter_y >= 404 && counter_y <=407)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 541 && counter_x <=544 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 539 || counter_x == 540) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 539 || counter_x == 540) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 545 || counter_x == 546) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 545 || counter_x == 546) && (counter_y == 404 || counter_y == 405))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 541 && counter_x <=544 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 402 || counter_y == 403 )) ||
							((counter_x == 545 || counter_x == 546) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 543 || counter_x == 544) && (counter_y == 406 || counter_y == 407)) ||
							((counter_x == 539 || counter_x == 540) && (counter_y == 400 || counter_y == 401))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 539 || counter_x == 540) && counter_y >= 400 && counter_y <=405) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 398 || counter_y ==399)) ||
							( counter_x >= 541 && counter_x <=544 && (counter_y == 406 || counter_y ==407)) ||
							((counter_x == 545 || counter_x == 546) && counter_y >= 400 && counter_y <=405))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*Middle digit starts*/
			
			else if (counter_x >= 529 && counter_x <= 536 && counter_y >= 398 && counter_y <=407)
			begin
				case(D2_2) 
					'd1 :
						begin
							if((((counter_x == 530 || counter_x == 531) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 532 || counter_x == 533) && (counter_y >= 398 && counter_y <=405)) ||
							( counter_x >= 530 && counter_x <=535 && (counter_y == 406 || counter_y == 407)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 529 || counter_x == 530) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 535 || counter_x == 536) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 533 || counter_x == 534) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 531 || counter_x == 532) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 529 && counter_x <= 536 && (counter_y == 406|| counter_y == 407)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 529 || counter_x == 530) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 535 || counter_x == 536) && (counter_y == 400 || counter_y ==401)) ||
							((counter_x == 533 || counter_x == 534) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 535 || counter_x == 536) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 529 || counter_x == 530) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 406 || counter_y == 407)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 529 || counter_x == 530) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 531 || counter_x == 532) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 529 && counter_x <=535 && (counter_y == 404 || counter_y == 405 )) ||
							((counter_x == 533 || counter_x == 534) && counter_y >= 398 && counter_y <=403) ||
							((counter_x == 533 || counter_x == 534) && (counter_y == 406 || counter_y == 407)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 529 && counter_x <=536 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 529 && counter_x <=534 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 529 && counter_x <=534 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 529 || counter_x == 530) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 535 || counter_x == 536) && (counter_y == 404 || counter_y == 405))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 531 && counter_x <=534 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 529 || counter_x == 530) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 535 || counter_x == 536) && (counter_y == 404 || counter_y == 405))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 529 && counter_x <=534 && (counter_y == 398 || counter_y == 399 )) ||
							((counter_x == 537 || counter_x == 536) && counter_y >= 400 && counter_y <=403) ||
							((counter_x == 533 || counter_x == 534) && counter_y >= 404 && counter_y <=407)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 531 && counter_x <=534 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 529 || counter_x == 530) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 529 || counter_x == 530) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 535 || counter_x == 536) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 535 || counter_x == 536) && (counter_y == 404 || counter_y == 405))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 531 && counter_x <=534 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 402 || counter_y == 403 )) ||
							((counter_x == 535 || counter_x == 536) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 533 || counter_x == 534) && (counter_y == 406 || counter_y == 407)) ||
							((counter_x == 529 || counter_x == 530) && (counter_y == 400 || counter_y == 401))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 529 || counter_x == 530) && counter_y >= 400 && counter_y <=405) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 398 || counter_y ==399)) ||
							( counter_x >= 531 && counter_x <=534 && (counter_y == 406 || counter_y ==407)) ||
							((counter_x == 535 || counter_x == 536) && counter_y >= 400 && counter_y <=405))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*MSB starts*/
			
			else if (counter_x >= 519 && counter_x <= 526 && counter_y >= 398 && counter_y <=407)
			begin
				case(D2_3) 
					'd1 :
						begin
							if((((counter_x == 520 || counter_x == 521) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 522 || counter_x == 523) && (counter_y >= 398 && counter_y <=405)) ||
							( counter_x >= 520 && counter_x <=525 && (counter_y == 406 || counter_y == 407)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 519 || counter_x == 520) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 525 || counter_x == 526) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 523 || counter_x == 524) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 521 || counter_x == 522) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 519 && counter_x <= 526 && (counter_y == 406|| counter_y == 407)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 519 || counter_x == 520) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 525 || counter_x == 526) && (counter_y == 400 || counter_y ==401)) ||
							((counter_x == 523 || counter_x == 524) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 525 || counter_x == 526) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 519 || counter_x == 520) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 406 || counter_y == 407)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 519 || counter_x == 520) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 521 || counter_x == 522) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 519 && counter_x <=525 && (counter_y == 404 || counter_y == 405 )) ||
							((counter_x == 523 || counter_x == 524) && counter_y >= 398 && counter_y <=403) ||
							((counter_x == 523 || counter_x == 524) && (counter_y == 406 || counter_y == 407)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 519 && counter_x <=526 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 519 && counter_x <=524 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 519 && counter_x <=524 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 519 || counter_x == 520) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 525 || counter_x == 526) && (counter_y == 404 || counter_y == 405))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 521 && counter_x <=524 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 519 || counter_x == 520) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 525 || counter_x == 526) && (counter_y == 404 || counter_y == 405))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 519 && counter_x <=524 && (counter_y == 398 || counter_y == 399 )) ||
							((counter_x == 527 || counter_x == 526) && counter_y >= 400 && counter_y <=403) ||
							((counter_x == 523 || counter_x == 524) && counter_y >= 404 && counter_y <=407)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 521 && counter_x <=524 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 519 || counter_x == 520) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 519 || counter_x == 520) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 525 || counter_x == 526) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 525 || counter_x == 526) && (counter_y == 404 || counter_y == 405))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 521 && counter_x <=524 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 402 || counter_y == 403 )) ||
							((counter_x == 525 || counter_x == 526) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 523 || counter_x == 524) && (counter_y == 406 || counter_y == 407)) ||
							((counter_x == 519 || counter_x == 520) && (counter_y == 400 || counter_y == 401))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 519 || counter_x == 520) && counter_y >= 400 && counter_y <=405) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 398 || counter_y ==399)) ||
							( counter_x >= 521 && counter_x <=524 && (counter_y == 406 || counter_y ==407)) ||
							((counter_x == 525 || counter_x == 526) && counter_y >= 400 && counter_y <=405))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*Buffer 1 starts*/

/* Buffer 1 for R*/

			/*LSB starts*/
				
			else if (counter_x >= 489 && counter_x <= 496 && counter_y >= 188 && counter_y <=197)
			begin
				case(R1_1) 
					'd1 :
						begin
							if((((counter_x == 490 || counter_x == 491) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 492 || counter_x == 493) && (counter_y >= 188 && counter_y <=195)) ||
							( counter_x >= 490 && counter_x <=495 && (counter_y == 196 || counter_y == 197)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 489 || counter_x == 490) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 495 || counter_x == 496) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 493 || counter_x == 494) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 491 || counter_x == 492) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 489 && counter_x <= 496 && (counter_y == 196|| counter_y == 197)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 489 || counter_x == 490) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 495 || counter_x == 496) && (counter_y == 190 || counter_y ==191)) ||
							((counter_x == 493 || counter_x == 494) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 495 || counter_x == 496) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 489 || counter_x == 490) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 196 || counter_y == 197)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 489 || counter_x == 490) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 491 || counter_x == 492) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 489 && counter_x <=496 && (counter_y == 194 || counter_y == 195 )) ||
							((counter_x == 493 || counter_x == 494) && counter_y >= 188 && counter_y <=193) ||
							((counter_x == 493 || counter_x == 494) && (counter_y == 196 || counter_y == 197)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 489 && counter_x <=496 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 489 && counter_x <=494 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 489 && counter_x <=494 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 489 || counter_x == 490) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 495 || counter_x == 496) && (counter_y == 194 || counter_y == 195))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 491 && counter_x <=494 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 489 || counter_x == 490) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 495 || counter_x == 496) && (counter_y == 194 || counter_y == 195))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 489 && counter_x <=494 && (counter_y == 188 || counter_y == 189 )) ||
							((counter_x == 495 || counter_x == 496) && counter_y >= 190 && counter_y <=193) ||
							((counter_x == 493 || counter_x == 494) && counter_y >= 194 && counter_y <=197)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 491 && counter_x <=494 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 489 || counter_x == 490) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 489 || counter_x == 490) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 495 || counter_x == 496) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 495 || counter_x == 496) && (counter_y == 194 || counter_y == 195))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 491 && counter_x <=494 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 192 || counter_y == 193 )) ||
							((counter_x == 495 || counter_x == 496) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 493 || counter_x == 494) && (counter_y == 196 || counter_y == 197)) ||
							((counter_x == 489 || counter_x == 490) && (counter_y == 190 || counter_y == 191))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 489 || counter_x == 490) && counter_y >= 190 && counter_y <=195) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 188 || counter_y ==189)) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 196 || counter_y ==197)) ||
							((counter_x == 495 || counter_x == 496) && counter_y >= 190 && counter_y <=195))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*Middle digit starts*/
			
			else if (counter_x >= 479 && counter_x <= 486 && counter_y >= 188 && counter_y <=197)
			begin
				case(R1_2) 
					'd1 :
						begin
							if((((counter_x == 480 || counter_x == 481) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 482 || counter_x == 483) && (counter_y >= 188 && counter_y <=195)) ||
							( counter_x >= 480 && counter_x <=485 && (counter_y == 196 || counter_y == 197)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 479 || counter_x == 480) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 485 || counter_x == 486) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 483 || counter_x == 484) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 481 || counter_x == 482) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 479 && counter_x <= 486 && (counter_y == 196|| counter_y == 197)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 479 || counter_x == 480) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 485 || counter_x == 486) && (counter_y == 190 || counter_y ==191)) ||
							((counter_x == 483 || counter_x == 484) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 485 || counter_x == 486) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 479 || counter_x == 480) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 196 || counter_y == 197)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 479 || counter_x == 480) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 481 || counter_x == 482) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 479 && counter_x <=486 && (counter_y == 194 || counter_y == 195 )) ||
							((counter_x == 483 || counter_x == 484) && counter_y >= 188 && counter_y <=193) ||
							((counter_x == 483 || counter_x == 484) && (counter_y == 196 || counter_y == 197)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 479 && counter_x <=486 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 479 && counter_x <=484 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 479 && counter_x <=484 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 479 || counter_x == 480) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 485 || counter_x == 486) && (counter_y == 194 || counter_y == 195))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 481 && counter_x <=484 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 479 || counter_x == 480) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 485 || counter_x == 486) && (counter_y == 194 || counter_y == 195))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 479 && counter_x <=484 && (counter_y == 188 || counter_y == 189 )) ||
							((counter_x == 485 || counter_x == 486) && counter_y >= 190 && counter_y <=193) ||
							((counter_x == 483 || counter_x == 484) && counter_y >= 194 && counter_y <=197)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 481 && counter_x <=484 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 479 || counter_x == 480) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 479 || counter_x == 480) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 485 || counter_x == 486) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 485 || counter_x == 486) && (counter_y == 194 || counter_y == 195))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 481 && counter_x <=484 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 192 || counter_y == 193 )) ||
							((counter_x == 485 || counter_x == 486) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 483 || counter_x == 484) && (counter_y == 196 || counter_y == 197)) ||
							((counter_x == 479 || counter_x == 480) && (counter_y == 190 || counter_y == 191))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 479 || counter_x == 480) && counter_y >= 190 && counter_y <=195) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 188 || counter_y ==189)) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 196 || counter_y ==197)) ||
							((counter_x == 485 || counter_x == 486) && counter_y >= 190 && counter_y <=195))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*MSB starts*/
			
						else if (counter_x >= 469 && counter_x <= 476 && counter_y >= 188 && counter_y <=197)
			begin
				case(R1_3) 
					'd1 :
						begin
							if((((counter_x == 470 || counter_x == 471) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 472 || counter_x == 473) && (counter_y >= 188 && counter_y <=195)) ||
							( counter_x >= 470 && counter_x <=475 && (counter_y == 196 || counter_y == 197)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 469 || counter_x == 470) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 475 || counter_x == 476) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 473 || counter_x == 474) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 471 || counter_x == 472) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 469 && counter_x <= 476 && (counter_y == 196|| counter_y == 197)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 469 || counter_x == 470) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 188 || counter_y == 189)) ||
							((counter_x == 475 || counter_x == 476) && (counter_y == 190 || counter_y ==191)) ||
							((counter_x == 473 || counter_x == 474) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 475 || counter_x == 476) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 469 || counter_x == 470) && (counter_y == 194 || counter_y == 195)) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 196 || counter_y == 197)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 469 || counter_x == 470) && (counter_y == 192 || counter_y == 193)) ||
							((counter_x == 471 || counter_x == 472) && (counter_y == 190 || counter_y == 191)) ||
							( counter_x >= 469 && counter_x <=476 && (counter_y == 194 || counter_y == 195 )) ||
							((counter_x == 473 || counter_x == 474) && counter_y >= 188 && counter_y <=193) ||
							((counter_x == 473 || counter_x == 474) && (counter_y == 196 || counter_y == 197)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 469 && counter_x <=476 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 469 && counter_x <=474 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 469 && counter_x <=474 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 469 || counter_x == 470) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 475 || counter_x == 476) && (counter_y == 194 || counter_y == 195))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 471 && counter_x <=474 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 469 || counter_x == 470) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 475 || counter_x == 476) && (counter_y == 194 || counter_y == 195))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 469 && counter_x <=474 && (counter_y == 188 || counter_y == 189 )) ||
							((counter_x == 475 || counter_x == 476) && counter_y >= 190 && counter_y <=193) ||
							((counter_x == 473 || counter_x == 474) && counter_y >= 194 && counter_y <=197)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 471 && counter_x <=474 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 192 || counter_y == 193 )) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 196 || counter_y == 197 )) ||
							((counter_x == 469 || counter_x == 470) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 469 || counter_x == 470) && (counter_y == 194 || counter_y == 195)) ||
							((counter_x == 475 || counter_x == 476) && (counter_y == 190 || counter_y == 191)) ||
							((counter_x == 475 || counter_x == 476) && (counter_y == 194 || counter_y == 195))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 471 && counter_x <=474 && (counter_y == 188 || counter_y == 189 )) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 192 || counter_y == 193 )) ||
							((counter_x == 475 || counter_x == 476) && counter_y >= 190 && counter_y <=195) ||
							((counter_x == 473 || counter_x == 474) && (counter_y == 196 || counter_y == 197)) ||
							((counter_x == 469 || counter_x == 470) && (counter_y == 190 || counter_y == 191))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 469 || counter_x == 470) && counter_y >= 190 && counter_y <=195) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 188 || counter_y ==189)) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 196 || counter_y ==197)) ||
							((counter_x == 475 || counter_x == 476) && counter_y >= 190 && counter_y <=195))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
	/*Buffer 1 for T*/

			/*LSB starts*/
			
			else if (counter_x >= 489 && counter_x <= 496 && counter_y >= 293 && counter_y <=302)
			begin
				case(T1_1) 
					'd1 :
						begin
							if((((counter_x == 490 || counter_x == 491) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 492 || counter_x == 493) && (counter_y >= 293 && counter_y <=300)) ||
							( counter_x >= 490 && counter_x <=495 && (counter_y == 301 || counter_y == 302)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 489 || counter_x == 490) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 495 || counter_x == 496) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 493 || counter_x == 494) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 491 || counter_x == 492) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 489 && counter_x <= 496 && (counter_y == 301|| counter_y == 302)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 489 || counter_x == 490) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 495 || counter_x == 496) && (counter_y == 295 || counter_y ==296)) ||
							((counter_x == 493 || counter_x == 494) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 495 || counter_x == 496) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 489 || counter_x == 490) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 301 || counter_y == 302)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 489 || counter_x == 490) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 491 || counter_x == 492) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 489 && counter_x <=496 && (counter_y == 299 || counter_y == 300 )) ||
							((counter_x == 493 || counter_x == 494) && counter_y >= 293 && counter_y <=298) ||
							((counter_x == 493 || counter_x == 494) && (counter_y == 301 || counter_y == 302)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 489 && counter_x <=496 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 489 && counter_x <=494 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 489 && counter_x <=494 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 489 || counter_x == 490) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 495 || counter_x == 496) && (counter_y == 299 || counter_y == 300))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 491 && counter_x <=494 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 489 || counter_x == 490) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 495 || counter_x == 496) && (counter_y == 299 || counter_y == 300))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 489 && counter_x <=494 && (counter_y == 293 || counter_y == 294 )) ||
							((counter_x == 495 || counter_x == 496) && counter_y >= 295 && counter_y <=298) ||
							((counter_x == 493 || counter_x == 494) && counter_y >= 299 && counter_y <=302)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 491 && counter_x <=494 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 489 || counter_x == 490) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 489 || counter_x == 490) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 495 || counter_x == 496) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 495 || counter_x == 496) && (counter_y == 299 || counter_y == 300))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 491 && counter_x <=494 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 297 || counter_y == 298 )) ||
							((counter_x == 495 || counter_x == 496) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 493 || counter_x == 494) && (counter_y == 301 || counter_y == 302)) ||
							((counter_x == 489 || counter_x == 490) && (counter_y == 295 || counter_y == 296))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 489 || counter_x == 490) && counter_y >= 295 && counter_y <=300) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 293 || counter_y ==294)) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 301 || counter_y ==302)) ||
							((counter_x == 495 || counter_x == 496) && counter_y >= 295 && counter_y <=300))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*Middle digit starts*/
			
			else if (counter_x >= 479 && counter_x <= 486 && counter_y >= 293 && counter_y <=302)
			begin
				case(T1_2) 
					'd1 :
						begin
							if((((counter_x == 480 || counter_x == 481) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 482 || counter_x == 483) && (counter_y >= 293 && counter_y <=300)) ||
							( counter_x >= 480 && counter_x <=485 && (counter_y == 301 || counter_y == 302)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 479 || counter_x == 480) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 485 || counter_x == 486) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 483 || counter_x == 484) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 481 || counter_x == 482) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 479 && counter_x <= 486 && (counter_y == 301|| counter_y == 302)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 479 || counter_x == 480) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 485 || counter_x == 486) && (counter_y == 295 || counter_y ==296)) ||
							((counter_x == 483 || counter_x == 484) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 485 || counter_x == 486) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 479 || counter_x == 480) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 301 || counter_y == 302)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 479 || counter_x == 480) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 481 || counter_x == 482) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 479 && counter_x <=486 && (counter_y == 299 || counter_y == 300 )) ||
							((counter_x == 483 || counter_x == 484) && counter_y >= 293 && counter_y <=298) ||
							((counter_x == 483 || counter_x == 484) && (counter_y == 301 || counter_y == 302)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 479 && counter_x <=486 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 479 && counter_x <=484 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 479 && counter_x <=484 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 479 || counter_x == 480) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 485 || counter_x == 486) && (counter_y == 299 || counter_y == 300))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 481 && counter_x <=484 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 479 || counter_x == 480) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 485 || counter_x == 486) && (counter_y == 299 || counter_y == 300))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 479 && counter_x <=484 && (counter_y == 293 || counter_y == 294 )) ||
							((counter_x == 485 || counter_x == 486) && counter_y >= 295 && counter_y <=298) ||
							((counter_x == 483 || counter_x == 484) && counter_y >= 299 && counter_y <=302)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 481 && counter_x <=484 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 479 || counter_x == 480) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 479 || counter_x == 480) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 485 || counter_x == 486) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 485 || counter_x == 486) && (counter_y == 299 || counter_y == 300))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 481 && counter_x <=484 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 297 || counter_y == 298 )) ||
							((counter_x == 485 || counter_x == 486) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 483 || counter_x == 484) && (counter_y == 301 || counter_y == 302)) ||
							((counter_x == 479 || counter_x == 480) && (counter_y == 295 || counter_y == 296))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 479 || counter_x == 480) && counter_y >= 295 && counter_y <=300) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 293 || counter_y ==294)) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 301 || counter_y ==302)) ||
							((counter_x == 485 || counter_x == 486) && counter_y >= 295 && counter_y <=300))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*MSB starts*/
			
			else if (counter_x >= 469 && counter_x <= 476 && counter_y >= 293 && counter_y <=302)
			begin
				case(T1_3) 
					'd1 :
						begin
							if((((counter_x == 470 || counter_x == 471) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 472 || counter_x == 473) && (counter_y >= 293 && counter_y <=300)) ||
							( counter_x >= 470 && counter_x <=475 && (counter_y == 301 || counter_y == 302)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 469 || counter_x == 470) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 475 || counter_x == 476) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 473 || counter_x == 474) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 471 || counter_x == 472) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 469 && counter_x <= 476 && (counter_y == 301|| counter_y == 302)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 469 || counter_x == 470) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 293 || counter_y == 294)) ||
							((counter_x == 475 || counter_x == 476) && (counter_y == 295 || counter_y ==296)) ||
							((counter_x == 473 || counter_x == 474) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 475 || counter_x == 476) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 469 || counter_x == 470) && (counter_y == 299 || counter_y == 300)) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 301 || counter_y == 302)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 469 || counter_x == 470) && (counter_y == 297 || counter_y == 298)) ||
							((counter_x == 471 || counter_x == 472) && (counter_y == 295 || counter_y == 296)) ||
							( counter_x >= 469 && counter_x <=476 && (counter_y == 299 || counter_y == 300 )) ||
							((counter_x == 473 || counter_x == 474) && counter_y >= 293 && counter_y <=298) ||
							((counter_x == 473 || counter_x == 474) && (counter_y == 301 || counter_y == 302)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 469 && counter_x <=476 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 469 && counter_x <=474 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 469 && counter_x <=474 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 469 || counter_x == 470) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 475 || counter_x == 476) && (counter_y == 299 || counter_y == 300))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 471 && counter_x <=474 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 469 || counter_x == 470) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 475 || counter_x == 476) && (counter_y == 299 || counter_y == 300))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 469 && counter_x <=474 && (counter_y == 293 || counter_y == 294 )) ||
							((counter_x == 475 || counter_x == 476) && counter_y >= 295 && counter_y <=298) ||
							((counter_x == 473 || counter_x == 474) && counter_y >= 299 && counter_y <=302)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 471 && counter_x <=474 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 297 || counter_y == 298 )) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 301 || counter_y == 302 )) ||
							((counter_x == 469 || counter_x == 470) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 469 || counter_x == 470) && (counter_y == 299 || counter_y == 300)) ||
							((counter_x == 475 || counter_x == 476) && (counter_y == 295 || counter_y == 296)) ||
							((counter_x == 475 || counter_x == 476) && (counter_y == 299 || counter_y == 300))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 471 && counter_x <=474 && (counter_y == 293 || counter_y == 294 )) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 297 || counter_y == 298 )) ||
							((counter_x == 475 || counter_x == 476) && counter_y >= 295 && counter_y <=300) ||
							((counter_x == 473 || counter_x == 474) && (counter_y == 301 || counter_y == 302)) ||
							((counter_x == 469 || counter_x == 470) && (counter_y == 295 || counter_y == 296))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 469 || counter_x == 470) && counter_y >= 295 && counter_y <=300) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 293 || counter_y ==294)) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 301 || counter_y ==302)) ||
							((counter_x == 475 || counter_x == 476) && counter_y >= 295 && counter_y <=300))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
/*Buffer 1 for D*/

			/*LSB starts*/
				
			else if (counter_x >= 489 && counter_x <= 496 && counter_y >= 398 && counter_y <=407)
			begin
				case(D1_1) 
					'd1 :
						begin
							if((((counter_x == 490 || counter_x == 491) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 492 || counter_x == 493) && (counter_y >= 398 && counter_y <=405)) ||
							( counter_x >= 490 && counter_x <=495 && (counter_y == 406 || counter_y == 407)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 489 || counter_x == 490) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 495 || counter_x == 496) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 493 || counter_x == 494) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 491 || counter_x == 492) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 489 && counter_x <= 496 && (counter_y == 406|| counter_y == 407)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 489 || counter_x == 490) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 495 || counter_x == 496) && (counter_y == 400 || counter_y ==401)) ||
							((counter_x == 493 || counter_x == 494) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 495 || counter_x == 496) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 489 || counter_x == 490) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 406 || counter_y == 407)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 489 || counter_x == 490) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 491 || counter_x == 492) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 489 && counter_x <=496 && (counter_y == 404 || counter_y == 405 )) ||
							((counter_x == 493 || counter_x == 494) && counter_y >= 398 && counter_y <=403) ||
							((counter_x == 493 || counter_x == 494) && (counter_y == 406 || counter_y == 407)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 489 && counter_x <=496 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 489 && counter_x <=494 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 489 && counter_x <=494 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 489 || counter_x == 490) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 495 || counter_x == 496) && (counter_y == 404 || counter_y == 405))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 491 && counter_x <=494 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 489 || counter_x == 490) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 495 || counter_x == 496) && (counter_y == 404 || counter_y == 405))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 489 && counter_x <=494 && (counter_y == 398 || counter_y == 399 )) ||
							((counter_x == 495 || counter_x == 496) && counter_y >= 400 && counter_y <=403) ||
							((counter_x == 493 || counter_x == 494) && counter_y >= 404 && counter_y <=407)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 491 && counter_x <=494 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 489 || counter_x == 490) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 489 || counter_x == 490) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 495 || counter_x == 496) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 495 || counter_x == 496) && (counter_y == 404 || counter_y == 405))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 491 && counter_x <=494 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 402 || counter_y == 403 )) ||
							((counter_x == 495 || counter_x == 496) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 493 || counter_x == 494) && (counter_y == 406 || counter_y == 407)) ||
							((counter_x == 489 || counter_x == 490) && (counter_y == 400 || counter_y == 401))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 489 || counter_x == 490) && counter_y >= 400 && counter_y <=405) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 398 || counter_y ==399)) ||
							( counter_x >= 491 && counter_x <=494 && (counter_y == 406 || counter_y ==407)) ||
							((counter_x == 495 || counter_x == 496) && counter_y >= 400 && counter_y <=405))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*Middle digit starts*/
			
			else if (counter_x >= 479 && counter_x <= 486 && counter_y >= 398 && counter_y <=407)
			begin
				case(D1_2) 
					'd1 :
						begin
							if((((counter_x == 480 || counter_x == 481) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 482 || counter_x == 483) && (counter_y >= 398 && counter_y <=405)) ||
							( counter_x >= 480 && counter_x <=485 && (counter_y == 406 || counter_y == 407)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 479 || counter_x == 480) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 485 || counter_x == 486) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 483 || counter_x == 484) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 481 || counter_x == 482) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 479 && counter_x <= 486 && (counter_y == 406|| counter_y == 407)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 479 || counter_x == 480) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 485 || counter_x == 486) && (counter_y == 400 || counter_y ==401)) ||
							((counter_x == 483 || counter_x == 484) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 485 || counter_x == 486) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 479 || counter_x == 480) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 406 || counter_y == 407)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 479 || counter_x == 480) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 482 || counter_x == 482) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 479 && counter_x <=486 && (counter_y == 404 || counter_y == 405 )) ||
							((counter_x == 483 || counter_x == 484) && counter_y >= 398 && counter_y <=403) ||
							((counter_x == 483 || counter_x == 484) && (counter_y == 406 || counter_y == 407)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 479 && counter_x <=486 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 479 && counter_x <=484 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 479 && counter_x <=484 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 479 || counter_x == 480) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 485 || counter_x == 486) && (counter_y == 404 || counter_y == 405))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 481 && counter_x <=484 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 479 || counter_x == 480) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 485 || counter_x == 486) && (counter_y == 404 || counter_y == 405))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 479 && counter_x <=484 && (counter_y == 398 || counter_y == 399 )) ||
							((counter_x == 485 || counter_x == 486) && counter_y >= 400 && counter_y <=403) ||
							((counter_x == 483 || counter_x == 484) && counter_y >= 404 && counter_y <=407)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 481 && counter_x <=484 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 479 || counter_x == 480) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 479 || counter_x == 480) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 485 || counter_x == 486) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 485 || counter_x == 486) && (counter_y == 404 || counter_y == 405))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 481 && counter_x <=484 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 402 || counter_y == 403 )) ||
							((counter_x == 485 || counter_x == 486) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 483 || counter_x == 484) && (counter_y == 406 || counter_y == 407)) ||
							((counter_x == 479 || counter_x == 480) && (counter_y == 400 || counter_y == 401))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 479 || counter_x == 480) && counter_y >= 400 && counter_y <=405) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 398 || counter_y ==399)) ||
							( counter_x >= 481 && counter_x <=484 && (counter_y == 406 || counter_y ==407)) ||
							((counter_x == 485 || counter_x == 486) && counter_y >= 400 && counter_y <=405))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			/*MSB starts*/
			
			else if (counter_x >= 469 && counter_x <= 476 && counter_y >= 398 && counter_y <=407)
			begin
				case(D1_3) 
					'd1 :
						begin
							if((((counter_x == 470 || counter_x == 471) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 472 || counter_x == 473) && (counter_y >= 398 && counter_y <=405)) ||
							( counter_x >= 470 && counter_x <=475 && (counter_y == 406 || counter_y == 407)))) /*1*/					
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd2 :
						begin
							if((((counter_x == 469 || counter_x == 470) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 475 || counter_x == 476) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 473 || counter_x == 474) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 471 || counter_x == 472) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 469 && counter_x <= 476 && (counter_y == 406|| counter_y == 407)))) /*2*/							
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd3 :
						begin
							if((((counter_x == 469 || counter_x == 470) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 398 || counter_y == 399)) ||
							((counter_x == 475 || counter_x == 476) && (counter_y == 400 || counter_y ==401)) ||
							((counter_x == 473 || counter_x == 474) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 475 || counter_x == 476) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 469 || counter_x == 470) && (counter_y == 404 || counter_y == 405)) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 406 || counter_y == 407)) )) /*3*/														
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd4 : 
						begin
							if((((counter_x == 469 || counter_x == 470) && (counter_y == 402 || counter_y == 403)) ||
							((counter_x == 472 || counter_x == 472) && (counter_y == 400 || counter_y == 401)) ||
							( counter_x >= 469 && counter_x <=476 && (counter_y == 404 || counter_y == 405 )) ||
							((counter_x == 473 || counter_x == 474) && counter_y >= 398 && counter_y <=403) ||
							((counter_x == 473 || counter_x == 474) && (counter_y == 406 || counter_y == 407)))) /*4*/				
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd5 :
						begin
							if(( counter_x >= 469 && counter_x <=476 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 469 && counter_x <=474 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 469 && counter_x <=474 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 469 || counter_x == 470) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 475 || counter_x == 476) && (counter_y == 404 || counter_y == 405))) /*5*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd6 :
						begin
							if(( counter_x >= 471 && counter_x <=474 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 469 || counter_x == 470) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 475 || counter_x == 476) && (counter_y == 404 || counter_y == 405))) /*6*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd7 : 
						begin
							if(( counter_x >= 469 && counter_x <=474 && (counter_y == 398 || counter_y == 399 )) ||
							((counter_x == 475 || counter_x == 476) && counter_y >= 400 && counter_y <=403) ||
							((counter_x == 473 || counter_x == 474) && counter_y >= 404 && counter_y <=407)) /*7*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd8 :
						begin
							if(( counter_x >= 471 && counter_x <=474 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 402 || counter_y == 403 )) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 406 || counter_y == 407 )) ||
							((counter_x == 469 || counter_x == 470) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 469 || counter_x == 470) && (counter_y == 404 || counter_y == 405)) ||
							((counter_x == 475 || counter_x == 476) && (counter_y == 400 || counter_y == 401)) ||
							((counter_x == 475 || counter_x == 476) && (counter_y == 404 || counter_y == 405))) /*8*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					'd9 :
						begin
							if(( counter_x >= 471 && counter_x <=474 && (counter_y == 398 || counter_y == 399 )) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 402 || counter_y == 403 )) ||
							((counter_x == 475 || counter_x == 476) && counter_y >= 400 && counter_y <=405) ||
							((counter_x == 473 || counter_x == 474) && (counter_y == 406 || counter_y == 407)) ||
							((counter_x == 469 || counter_x == 470) && (counter_y == 400 || counter_y == 401))) /*9*/
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
					default :
						begin
							if((((counter_x == 469 || counter_x == 470) && counter_y >= 400 && counter_y <=405) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 398 || counter_y ==399)) ||
							( counter_x >= 471 && counter_x <=474 && (counter_y == 406 || counter_y ==407)) ||
							((counter_x == 475 || counter_x == 476) && counter_y >= 400 && counter_y <=405))) /*0*/						
							begin
								r_red <= 8'h0; r_blue <= 8'h0; r_green <= 8'h0;
							end
							else
							begin
								r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
							end
						end
				endcase
			end
			
			
			else
			begin
			   show <= show+1; r_red <= 8'hFF; r_blue <= 8'hFF; r_green <= 8'hFF;
			end
		end 
		
	assign o_red = (counter_x > 144 && counter_x <= 783 && counter_y > 35 && counter_y <= 514) ? r_red : 8'h0;
	assign o_blue = (counter_x > 144 && counter_x <= 783 && counter_y > 35 && counter_y <= 514) ? r_blue : 8'h0;
	assign o_green = (counter_x > 144 && counter_x <= 783 && counter_y > 35 && counter_y <= 514) ? r_green : 8'h0;
	
endmodule 