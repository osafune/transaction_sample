
module uart_bridge_core (
	clk_clk,
	reset_reset_n,
	uart_txd,
	uart_rxd,
	uart_cts,
	uart_rts,
	led_export);	

	input		clk_clk;
	input		reset_reset_n;
	output		uart_txd;
	input		uart_rxd;
	input		uart_cts;
	output		uart_rts;
	output	[1:0]	led_export;
endmodule
