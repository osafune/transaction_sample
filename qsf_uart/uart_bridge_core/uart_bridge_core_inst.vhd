	component uart_bridge_core is
		port (
			clk_clk       : in  std_logic                    := 'X'; -- clk
			reset_reset_n : in  std_logic                    := 'X'; -- reset_n
			uart_txd      : out std_logic;                           -- txd
			uart_rxd      : in  std_logic                    := 'X'; -- rxd
			uart_cts      : in  std_logic                    := 'X'; -- cts
			uart_rts      : out std_logic;                           -- rts
			led_export    : out std_logic_vector(1 downto 0)         -- export
		);
	end component uart_bridge_core;

	u0 : component uart_bridge_core
		port map (
			clk_clk       => CONNECTED_TO_clk_clk,       --   clk.clk
			reset_reset_n => CONNECTED_TO_reset_reset_n, -- reset.reset_n
			uart_txd      => CONNECTED_TO_uart_txd,      --  uart.txd
			uart_rxd      => CONNECTED_TO_uart_rxd,      --      .rxd
			uart_cts      => CONNECTED_TO_uart_cts,      --      .cts
			uart_rts      => CONNECTED_TO_uart_rts,      --      .rts
			led_export    => CONNECTED_TO_led_export     --   led.export
		);

