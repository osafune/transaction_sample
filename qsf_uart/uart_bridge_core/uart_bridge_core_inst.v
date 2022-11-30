	uart_bridge_core u0 (
		.clk_clk       (<connected-to-clk_clk>),       //   clk.clk
		.reset_reset_n (<connected-to-reset_reset_n>), // reset.reset_n
		.uart_txd      (<connected-to-uart_txd>),      //  uart.txd
		.uart_rxd      (<connected-to-uart_rxd>),      //      .rxd
		.uart_cts      (<connected-to-uart_cts>),      //      .cts
		.uart_rts      (<connected-to-uart_rts>),      //      .rts
		.led_export    (<connected-to-led_export>)     //   led.export
	);

