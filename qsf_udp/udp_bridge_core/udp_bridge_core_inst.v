	udp_bridge_core u0 (
		.clk_clk       (<connected-to-clk_clk>),       //     clk.clk
		.reset_reset_n (<connected-to-reset_reset_n>), //   reset.reset_n
		.ethio_enable  (<connected-to-ethio_enable>),  //   ethio.enable
		.ethio_status  (<connected-to-ethio_status>),  //        .status
		.macaddr_value (<connected-to-macaddr_value>), // macaddr.value
		.ipaddr_value  (<connected-to-ipaddr_value>),  //  ipaddr.value
		.rmii_clk      (<connected-to-rmii_clk>),      //    rmii.clk
		.rmii_rxd      (<connected-to-rmii_rxd>),      //        .rxd
		.rmii_crs_dv   (<connected-to-rmii_crs_dv>),   //        .crs_dv
		.rmii_txd      (<connected-to-rmii_txd>),      //        .txd
		.rmii_tx_en    (<connected-to-rmii_tx_en>),    //        .tx_en
		.led_export    (<connected-to-led_export>)     //     led.export
	);

