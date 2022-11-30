// uart_bridge_core.v

// Generated using ACDS version 22.1 915

`timescale 1 ps / 1 ps
module uart_bridge_core (
		input  wire       clk_clk,       //   clk.clk
		output wire [1:0] led_export,    //   led.export
		input  wire       reset_reset_n, // reset.reset_n
		output wire       uart_txd,      //  uart.txd
		input  wire       uart_rxd,      //      .rxd
		input  wire       uart_cts,      //      .cts
		output wire       uart_rts       //      .rts
	);

	wire         st_packets_to_bytes_0_out_bytes_stream_valid;           // st_packets_to_bytes_0:out_valid -> uart_to_bytes_0:in_valid
	wire   [7:0] st_packets_to_bytes_0_out_bytes_stream_data;            // st_packets_to_bytes_0:out_data -> uart_to_bytes_0:in_data
	wire         st_packets_to_bytes_0_out_bytes_stream_ready;           // uart_to_bytes_0:in_ready -> st_packets_to_bytes_0:out_ready
	wire         uart_to_bytes_0_source_valid;                           // uart_to_bytes_0:out_valid -> st_bytes_to_packets_0:in_valid
	wire   [7:0] uart_to_bytes_0_source_data;                            // uart_to_bytes_0:out_data -> st_bytes_to_packets_0:in_data
	wire         uart_to_bytes_0_source_ready;                           // st_bytes_to_packets_0:in_ready -> uart_to_bytes_0:out_ready
	wire  [31:0] packets_to_master_0_avalon_master_readdata;             // mm_interconnect_0:packets_to_master_0_avalon_master_readdata -> packets_to_master_0:readdata
	wire         packets_to_master_0_avalon_master_waitrequest;          // mm_interconnect_0:packets_to_master_0_avalon_master_waitrequest -> packets_to_master_0:waitrequest
	wire  [31:0] packets_to_master_0_avalon_master_address;              // packets_to_master_0:address -> mm_interconnect_0:packets_to_master_0_avalon_master_address
	wire         packets_to_master_0_avalon_master_read;                 // packets_to_master_0:read -> mm_interconnect_0:packets_to_master_0_avalon_master_read
	wire   [3:0] packets_to_master_0_avalon_master_byteenable;           // packets_to_master_0:byteenable -> mm_interconnect_0:packets_to_master_0_avalon_master_byteenable
	wire         packets_to_master_0_avalon_master_readdatavalid;        // mm_interconnect_0:packets_to_master_0_avalon_master_readdatavalid -> packets_to_master_0:readdatavalid
	wire         packets_to_master_0_avalon_master_write;                // packets_to_master_0:write -> mm_interconnect_0:packets_to_master_0_avalon_master_write
	wire  [31:0] packets_to_master_0_avalon_master_writedata;            // packets_to_master_0:writedata -> mm_interconnect_0:packets_to_master_0_avalon_master_writedata
	wire  [31:0] mm_interconnect_0_sysid_qsys_0_control_slave_readdata;  // sysid_qsys_0:readdata -> mm_interconnect_0:sysid_qsys_0_control_slave_readdata
	wire   [0:0] mm_interconnect_0_sysid_qsys_0_control_slave_address;   // mm_interconnect_0:sysid_qsys_0_control_slave_address -> sysid_qsys_0:address
	wire         mm_interconnect_0_pio_0_s1_chipselect;                  // mm_interconnect_0:pio_0_s1_chipselect -> pio_0:chipselect
	wire  [31:0] mm_interconnect_0_pio_0_s1_readdata;                    // pio_0:readdata -> mm_interconnect_0:pio_0_s1_readdata
	wire   [1:0] mm_interconnect_0_pio_0_s1_address;                     // mm_interconnect_0:pio_0_s1_address -> pio_0:address
	wire         mm_interconnect_0_pio_0_s1_write;                       // mm_interconnect_0:pio_0_s1_write -> pio_0:write_n
	wire  [31:0] mm_interconnect_0_pio_0_s1_writedata;                   // mm_interconnect_0:pio_0_s1_writedata -> pio_0:writedata
	wire         st_bytes_to_packets_0_out_packets_stream_valid;         // st_bytes_to_packets_0:out_valid -> avalon_st_adapter:in_0_valid
	wire   [7:0] st_bytes_to_packets_0_out_packets_stream_data;          // st_bytes_to_packets_0:out_data -> avalon_st_adapter:in_0_data
	wire         st_bytes_to_packets_0_out_packets_stream_ready;         // avalon_st_adapter:in_0_ready -> st_bytes_to_packets_0:out_ready
	wire   [7:0] st_bytes_to_packets_0_out_packets_stream_channel;       // st_bytes_to_packets_0:out_channel -> avalon_st_adapter:in_0_channel
	wire         st_bytes_to_packets_0_out_packets_stream_startofpacket; // st_bytes_to_packets_0:out_startofpacket -> avalon_st_adapter:in_0_startofpacket
	wire         st_bytes_to_packets_0_out_packets_stream_endofpacket;   // st_bytes_to_packets_0:out_endofpacket -> avalon_st_adapter:in_0_endofpacket
	wire         avalon_st_adapter_out_0_valid;                          // avalon_st_adapter:out_0_valid -> packets_to_master_0:in_valid
	wire   [7:0] avalon_st_adapter_out_0_data;                           // avalon_st_adapter:out_0_data -> packets_to_master_0:in_data
	wire         avalon_st_adapter_out_0_ready;                          // packets_to_master_0:in_ready -> avalon_st_adapter:out_0_ready
	wire         avalon_st_adapter_out_0_startofpacket;                  // avalon_st_adapter:out_0_startofpacket -> packets_to_master_0:in_startofpacket
	wire         avalon_st_adapter_out_0_endofpacket;                    // avalon_st_adapter:out_0_endofpacket -> packets_to_master_0:in_endofpacket
	wire         packets_to_master_0_out_stream_valid;                   // packets_to_master_0:out_valid -> avalon_st_adapter_001:in_0_valid
	wire   [7:0] packets_to_master_0_out_stream_data;                    // packets_to_master_0:out_data -> avalon_st_adapter_001:in_0_data
	wire         packets_to_master_0_out_stream_ready;                   // avalon_st_adapter_001:in_0_ready -> packets_to_master_0:out_ready
	wire         packets_to_master_0_out_stream_startofpacket;           // packets_to_master_0:out_startofpacket -> avalon_st_adapter_001:in_0_startofpacket
	wire         packets_to_master_0_out_stream_endofpacket;             // packets_to_master_0:out_endofpacket -> avalon_st_adapter_001:in_0_endofpacket
	wire         avalon_st_adapter_001_out_0_valid;                      // avalon_st_adapter_001:out_0_valid -> st_packets_to_bytes_0:in_valid
	wire   [7:0] avalon_st_adapter_001_out_0_data;                       // avalon_st_adapter_001:out_0_data -> st_packets_to_bytes_0:in_data
	wire         avalon_st_adapter_001_out_0_ready;                      // st_packets_to_bytes_0:in_ready -> avalon_st_adapter_001:out_0_ready
	wire   [7:0] avalon_st_adapter_001_out_0_channel;                    // avalon_st_adapter_001:out_0_channel -> st_packets_to_bytes_0:in_channel
	wire         avalon_st_adapter_001_out_0_startofpacket;              // avalon_st_adapter_001:out_0_startofpacket -> st_packets_to_bytes_0:in_startofpacket
	wire         avalon_st_adapter_001_out_0_endofpacket;                // avalon_st_adapter_001:out_0_endofpacket -> st_packets_to_bytes_0:in_endofpacket
	wire         rst_controller_reset_out_reset;                         // rst_controller:reset_out -> [avalon_st_adapter:in_rst_0_reset, avalon_st_adapter_001:in_rst_0_reset, mm_interconnect_0:packets_to_master_0_clk_reset_reset_bridge_in_reset_reset, packets_to_master_0:reset_n, pio_0:reset_n, st_bytes_to_packets_0:reset_n, st_packets_to_bytes_0:reset_n, sysid_qsys_0:reset_n, uart_to_bytes_0:reset]

	altera_avalon_packets_to_master #(
		.FAST_VER    (0),
		.FIFO_DEPTHS (2),
		.FIFO_WIDTHU (1)
	) packets_to_master_0 (
		.clk               (clk_clk),                                         //           clk.clk
		.reset_n           (~rst_controller_reset_out_reset),                 //     clk_reset.reset_n
		.out_ready         (packets_to_master_0_out_stream_ready),            //    out_stream.ready
		.out_valid         (packets_to_master_0_out_stream_valid),            //              .valid
		.out_data          (packets_to_master_0_out_stream_data),             //              .data
		.out_startofpacket (packets_to_master_0_out_stream_startofpacket),    //              .startofpacket
		.out_endofpacket   (packets_to_master_0_out_stream_endofpacket),      //              .endofpacket
		.in_ready          (avalon_st_adapter_out_0_ready),                   //     in_stream.ready
		.in_valid          (avalon_st_adapter_out_0_valid),                   //              .valid
		.in_data           (avalon_st_adapter_out_0_data),                    //              .data
		.in_startofpacket  (avalon_st_adapter_out_0_startofpacket),           //              .startofpacket
		.in_endofpacket    (avalon_st_adapter_out_0_endofpacket),             //              .endofpacket
		.address           (packets_to_master_0_avalon_master_address),       // avalon_master.address
		.readdata          (packets_to_master_0_avalon_master_readdata),      //              .readdata
		.read              (packets_to_master_0_avalon_master_read),          //              .read
		.write             (packets_to_master_0_avalon_master_write),         //              .write
		.writedata         (packets_to_master_0_avalon_master_writedata),     //              .writedata
		.waitrequest       (packets_to_master_0_avalon_master_waitrequest),   //              .waitrequest
		.readdatavalid     (packets_to_master_0_avalon_master_readdatavalid), //              .readdatavalid
		.byteenable        (packets_to_master_0_avalon_master_byteenable)     //              .byteenable
	);

	uart_bridge_core_pio_0 pio_0 (
		.clk        (clk_clk),                               //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),       //               reset.reset_n
		.address    (mm_interconnect_0_pio_0_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_pio_0_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_pio_0_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_pio_0_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_pio_0_s1_readdata),   //                    .readdata
		.out_port   (led_export)                             // external_connection.export
	);

	altera_avalon_st_bytes_to_packets #(
		.CHANNEL_WIDTH (8),
		.ENCODING      (0)
	) st_bytes_to_packets_0 (
		.clk               (clk_clk),                                                //                clk.clk
		.reset_n           (~rst_controller_reset_out_reset),                        //          clk_reset.reset_n
		.out_channel       (st_bytes_to_packets_0_out_packets_stream_channel),       // out_packets_stream.channel
		.out_ready         (st_bytes_to_packets_0_out_packets_stream_ready),         //                   .ready
		.out_valid         (st_bytes_to_packets_0_out_packets_stream_valid),         //                   .valid
		.out_data          (st_bytes_to_packets_0_out_packets_stream_data),          //                   .data
		.out_startofpacket (st_bytes_to_packets_0_out_packets_stream_startofpacket), //                   .startofpacket
		.out_endofpacket   (st_bytes_to_packets_0_out_packets_stream_endofpacket),   //                   .endofpacket
		.in_ready          (uart_to_bytes_0_source_ready),                           //    in_bytes_stream.ready
		.in_valid          (uart_to_bytes_0_source_valid),                           //                   .valid
		.in_data           (uart_to_bytes_0_source_data)                             //                   .data
	);

	altera_avalon_st_packets_to_bytes #(
		.CHANNEL_WIDTH (8),
		.ENCODING      (0)
	) st_packets_to_bytes_0 (
		.clk              (clk_clk),                                      //               clk.clk
		.reset_n          (~rst_controller_reset_out_reset),              //         clk_reset.reset_n
		.in_ready         (avalon_st_adapter_001_out_0_ready),            // in_packets_stream.ready
		.in_valid         (avalon_st_adapter_001_out_0_valid),            //                  .valid
		.in_data          (avalon_st_adapter_001_out_0_data),             //                  .data
		.in_channel       (avalon_st_adapter_001_out_0_channel),          //                  .channel
		.in_startofpacket (avalon_st_adapter_001_out_0_startofpacket),    //                  .startofpacket
		.in_endofpacket   (avalon_st_adapter_001_out_0_endofpacket),      //                  .endofpacket
		.out_ready        (st_packets_to_bytes_0_out_bytes_stream_ready), //  out_bytes_stream.ready
		.out_valid        (st_packets_to_bytes_0_out_bytes_stream_valid), //                  .valid
		.out_data         (st_packets_to_bytes_0_out_bytes_stream_data)   //                  .data
	);

	uart_bridge_core_sysid_qsys_0 sysid_qsys_0 (
		.clock    (clk_clk),                                               //           clk.clk
		.reset_n  (~rst_controller_reset_out_reset),                       //         reset.reset_n
		.readdata (mm_interconnect_0_sysid_qsys_0_control_slave_readdata), // control_slave.readdata
		.address  (mm_interconnect_0_sysid_qsys_0_control_slave_address)   //              .address
	);

	uart_to_bytes #(
		.CLOCK_FREQUENCY (50000000),
		.UART_BAUDRATE   (115200),
		.UART_STOPBIT    (1)
	) uart_to_bytes_0 (
		.clk       (clk_clk),                                      //  clock.clk
		.reset     (rst_controller_reset_out_reset),               //  reset.reset
		.txd       (uart_txd),                                     //   uart.txd
		.rxd       (uart_rxd),                                     //       .rxd
		.cts       (uart_cts),                                     //       .cts
		.rts       (uart_rts),                                     //       .rts
		.in_data   (st_packets_to_bytes_0_out_bytes_stream_data),  //   sink.data
		.in_ready  (st_packets_to_bytes_0_out_bytes_stream_ready), //       .ready
		.in_valid  (st_packets_to_bytes_0_out_bytes_stream_valid), //       .valid
		.out_data  (uart_to_bytes_0_source_data),                  // source.data
		.out_ready (uart_to_bytes_0_source_ready),                 //       .ready
		.out_valid (uart_to_bytes_0_source_valid)                  //       .valid
	);

	uart_bridge_core_mm_interconnect_0 mm_interconnect_0 (
		.clk_0_clk_clk                                             (clk_clk),                                               //                                           clk_0_clk.clk
		.packets_to_master_0_clk_reset_reset_bridge_in_reset_reset (rst_controller_reset_out_reset),                        // packets_to_master_0_clk_reset_reset_bridge_in_reset.reset
		.packets_to_master_0_avalon_master_address                 (packets_to_master_0_avalon_master_address),             //                   packets_to_master_0_avalon_master.address
		.packets_to_master_0_avalon_master_waitrequest             (packets_to_master_0_avalon_master_waitrequest),         //                                                    .waitrequest
		.packets_to_master_0_avalon_master_byteenable              (packets_to_master_0_avalon_master_byteenable),          //                                                    .byteenable
		.packets_to_master_0_avalon_master_read                    (packets_to_master_0_avalon_master_read),                //                                                    .read
		.packets_to_master_0_avalon_master_readdata                (packets_to_master_0_avalon_master_readdata),            //                                                    .readdata
		.packets_to_master_0_avalon_master_readdatavalid           (packets_to_master_0_avalon_master_readdatavalid),       //                                                    .readdatavalid
		.packets_to_master_0_avalon_master_write                   (packets_to_master_0_avalon_master_write),               //                                                    .write
		.packets_to_master_0_avalon_master_writedata               (packets_to_master_0_avalon_master_writedata),           //                                                    .writedata
		.pio_0_s1_address                                          (mm_interconnect_0_pio_0_s1_address),                    //                                            pio_0_s1.address
		.pio_0_s1_write                                            (mm_interconnect_0_pio_0_s1_write),                      //                                                    .write
		.pio_0_s1_readdata                                         (mm_interconnect_0_pio_0_s1_readdata),                   //                                                    .readdata
		.pio_0_s1_writedata                                        (mm_interconnect_0_pio_0_s1_writedata),                  //                                                    .writedata
		.pio_0_s1_chipselect                                       (mm_interconnect_0_pio_0_s1_chipselect),                 //                                                    .chipselect
		.sysid_qsys_0_control_slave_address                        (mm_interconnect_0_sysid_qsys_0_control_slave_address),  //                          sysid_qsys_0_control_slave.address
		.sysid_qsys_0_control_slave_readdata                       (mm_interconnect_0_sysid_qsys_0_control_slave_readdata)  //                                                    .readdata
	);

	uart_bridge_core_avalon_st_adapter #(
		.inBitsPerSymbol (8),
		.inUsePackets    (1),
		.inDataWidth     (8),
		.inChannelWidth  (8),
		.inErrorWidth    (0),
		.inUseEmptyPort  (0),
		.inUseValid      (1),
		.inUseReady      (1),
		.inReadyLatency  (0),
		.outDataWidth    (8),
		.outChannelWidth (0),
		.outErrorWidth   (0),
		.outUseEmptyPort (0),
		.outUseValid     (1),
		.outUseReady     (1),
		.outReadyLatency (0)
	) avalon_st_adapter (
		.in_clk_0_clk        (clk_clk),                                                // in_clk_0.clk
		.in_rst_0_reset      (rst_controller_reset_out_reset),                         // in_rst_0.reset
		.in_0_data           (st_bytes_to_packets_0_out_packets_stream_data),          //     in_0.data
		.in_0_valid          (st_bytes_to_packets_0_out_packets_stream_valid),         //         .valid
		.in_0_ready          (st_bytes_to_packets_0_out_packets_stream_ready),         //         .ready
		.in_0_startofpacket  (st_bytes_to_packets_0_out_packets_stream_startofpacket), //         .startofpacket
		.in_0_endofpacket    (st_bytes_to_packets_0_out_packets_stream_endofpacket),   //         .endofpacket
		.in_0_channel        (st_bytes_to_packets_0_out_packets_stream_channel),       //         .channel
		.out_0_data          (avalon_st_adapter_out_0_data),                           //    out_0.data
		.out_0_valid         (avalon_st_adapter_out_0_valid),                          //         .valid
		.out_0_ready         (avalon_st_adapter_out_0_ready),                          //         .ready
		.out_0_startofpacket (avalon_st_adapter_out_0_startofpacket),                  //         .startofpacket
		.out_0_endofpacket   (avalon_st_adapter_out_0_endofpacket)                     //         .endofpacket
	);

	uart_bridge_core_avalon_st_adapter_001 #(
		.inBitsPerSymbol (8),
		.inUsePackets    (1),
		.inDataWidth     (8),
		.inChannelWidth  (0),
		.inErrorWidth    (0),
		.inUseEmptyPort  (0),
		.inUseValid      (1),
		.inUseReady      (1),
		.inReadyLatency  (0),
		.outDataWidth    (8),
		.outChannelWidth (8),
		.outErrorWidth   (0),
		.outUseEmptyPort (0),
		.outUseValid     (1),
		.outUseReady     (1),
		.outReadyLatency (0)
	) avalon_st_adapter_001 (
		.in_clk_0_clk        (clk_clk),                                      // in_clk_0.clk
		.in_rst_0_reset      (rst_controller_reset_out_reset),               // in_rst_0.reset
		.in_0_data           (packets_to_master_0_out_stream_data),          //     in_0.data
		.in_0_valid          (packets_to_master_0_out_stream_valid),         //         .valid
		.in_0_ready          (packets_to_master_0_out_stream_ready),         //         .ready
		.in_0_startofpacket  (packets_to_master_0_out_stream_startofpacket), //         .startofpacket
		.in_0_endofpacket    (packets_to_master_0_out_stream_endofpacket),   //         .endofpacket
		.out_0_data          (avalon_st_adapter_001_out_0_data),             //    out_0.data
		.out_0_valid         (avalon_st_adapter_001_out_0_valid),            //         .valid
		.out_0_ready         (avalon_st_adapter_001_out_0_ready),            //         .ready
		.out_0_startofpacket (avalon_st_adapter_001_out_0_startofpacket),    //         .startofpacket
		.out_0_endofpacket   (avalon_st_adapter_001_out_0_endofpacket),      //         .endofpacket
		.out_0_channel       (avalon_st_adapter_001_out_0_channel)           //         .channel
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                 // reset_in0.reset
		.clk            (clk_clk),                        //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

endmodule
