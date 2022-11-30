
module udp_bridge_core (
	clk_clk,
	reset_reset_n,
	ethio_enable,
	ethio_status,
	macaddr_value,
	ipaddr_value,
	rmii_clk,
	rmii_rxd,
	rmii_crs_dv,
	rmii_txd,
	rmii_tx_en,
	led_export);	

	input		clk_clk;
	input		reset_reset_n;
	input		ethio_enable;
	output	[2:0]	ethio_status;
	input	[47:0]	macaddr_value;
	input	[31:0]	ipaddr_value;
	input		rmii_clk;
	input	[1:0]	rmii_rxd;
	input		rmii_crs_dv;
	output	[1:0]	rmii_txd;
	output		rmii_tx_en;
	output	[1:0]	led_export;
endmodule
