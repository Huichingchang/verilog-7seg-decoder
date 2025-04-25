`timescale 1ns/1ps
module seven_seg_decoder_tb;
	reg [3:0] bin;
	wire [6:0] seg;
	integer f;
	
	seven_seg_decoder uut(
		.bin(bin),
		.seg(seg)
	);
	
	initial begin
		$dumpfile("seven_seg_decoder.vcd");
		$dumpvars(0,seven_seg_decoder_tb);
		
		f=$fopen("C:/VerilogProjects/verilog-7seg-decoder/monitor_log.txt","w");
		if(!f) begin
			$display("無法開啟檔案");
			$finish;
		end
		$display("檔案開啟成功");
		
		for (bin = 0; bin < 10; bin = bin+1) begin
			#10;
			$fwrite(f,"bin=%b(%0d), seg=%b @ %0t ns\n", bin, bin, seg, $time);
		end
		
		$fclose(f);
		$display("模擬完成");
		#100;
		$finish;
	end
endmodule