// ===================================================================
// TITLE : UDP to Avalon-MM Bridge top
//
//     DESIGN : s.osafune@j7system.jp (J-7SYSTEM WORKS LIMITED)
//     DATE   : 2022/11/30 -> 2022/12/01
//
// ===================================================================
//
// The MIT License (MIT)
// Copyright (c) 2022 J-7SYSTEM WORKS LIMITED.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
// of the Software, and to permit persons to whom the Software is furnished to do
// so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

`default_nettype none

module air_udp_top(
    input wire          CLOCK_50,
    input wire          RESET_N,

    input wire          RMII_CLK,
    input wire  [1:0]   RMII_RXD,
    input wire          RMII_CRSDV,
    output wire [1:0]   RMII_TXD,
    output wire         RMII_TXEN,

    output wire [1:0]   USER_LED
);

	parameter MAC_ADDRESS	= 48'hfeffff000001;                // FE-FF-FF-00-00-01
	parameter IP_ADDRESS	= {8'd192, 8'd168, 8'd1, 8'd203};  // 192.168.1.203

    udp_bridge_core u0 (
        .clk_clk       (CLOCK_50),
        .reset_reset_n (RESET_N),
        .ethio_enable  (1'b1),
        .ethio_status  (),
        .macaddr_value (MAC_ADDRESS),
        .ipaddr_value  (IP_ADDRESS),
        .rmii_clk      (RMII_CLK),
        .rmii_rxd      (RMII_RXD),
        .rmii_crs_dv   (RMII_CRSDV),
        .rmii_txd      (RMII_TXD),
        .rmii_tx_en    (RMII_TXEN),
        .led_export    (USER_LED)
    );

endmodule
