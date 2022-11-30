	component udp_bridge_core is
		port (
			clk_clk       : in  std_logic                     := 'X';             -- clk
			reset_reset_n : in  std_logic                     := 'X';             -- reset_n
			ethio_enable  : in  std_logic                     := 'X';             -- enable
			ethio_status  : out std_logic_vector(2 downto 0);                     -- status
			macaddr_value : in  std_logic_vector(47 downto 0) := (others => 'X'); -- value
			ipaddr_value  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- value
			rmii_clk      : in  std_logic                     := 'X';             -- clk
			rmii_rxd      : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- rxd
			rmii_crs_dv   : in  std_logic                     := 'X';             -- crs_dv
			rmii_txd      : out std_logic_vector(1 downto 0);                     -- txd
			rmii_tx_en    : out std_logic;                                        -- tx_en
			led_export    : out std_logic_vector(1 downto 0)                      -- export
		);
	end component udp_bridge_core;

	u0 : component udp_bridge_core
		port map (
			clk_clk       => CONNECTED_TO_clk_clk,       --     clk.clk
			reset_reset_n => CONNECTED_TO_reset_reset_n, --   reset.reset_n
			ethio_enable  => CONNECTED_TO_ethio_enable,  --   ethio.enable
			ethio_status  => CONNECTED_TO_ethio_status,  --        .status
			macaddr_value => CONNECTED_TO_macaddr_value, -- macaddr.value
			ipaddr_value  => CONNECTED_TO_ipaddr_value,  --  ipaddr.value
			rmii_clk      => CONNECTED_TO_rmii_clk,      --    rmii.clk
			rmii_rxd      => CONNECTED_TO_rmii_rxd,      --        .rxd
			rmii_crs_dv   => CONNECTED_TO_rmii_crs_dv,   --        .crs_dv
			rmii_txd      => CONNECTED_TO_rmii_txd,      --        .txd
			rmii_tx_en    => CONNECTED_TO_rmii_tx_en,    --        .tx_en
			led_export    => CONNECTED_TO_led_export     --     led.export
		);

