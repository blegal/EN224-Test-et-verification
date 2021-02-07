library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity PGCD_uart is
    Port ( 
           CLK100MHZ : in  STD_LOGIC;
           nRESET    : in  STD_LOGIC;
           LED 		 : out STD_LOGIC_VECTOR (15 downto 0);
           RsRx      : in  STD_LOGIC;
           RsTx      : out STD_LOGIC
	);
end PGCD_uart;

architecture Behavioral of PGCD_uart is

	SIGNAL   data_from_uart    : STD_LOGIC_VECTOR (7 downto 0);
	SIGNAL   data_from_uart_en : STD_LOGIC;

	SIGNAL   data_to_uart      : STD_LOGIC_VECTOR (31 downto 0);
	SIGNAL   data_to_uart_en   : STD_LOGIC;

	SIGNAL   pack_from_uart    : STD_LOGIC_VECTOR (63 downto 0);
    SIGNAL   pack_from_uart_en : STD_LOGIC_VECTOR ( 7 downto 0);
    
	SIGNAL   pack_to_uart      : STD_LOGIC_VECTOR (31 downto 0);
    SIGNAL   pack_to_uart_en   : STD_LOGIC_VECTOR ( 3 downto 0);
    
    SIGNAL   let_s_go          : STD_LOGIC;

    SIGNAL   RESET             : STD_LOGIC;
    
BEGIN

    PROCESS(CLK100MHZ)
    BEGIN
        IF CLK100MHZ'event AND CLK100MHZ = '1' THEN
            RESET <= NOT nRESET;
        END IF;
    END PROCESS;
        
    rcv : ENTITY work.UART_recv
    PORT MAP(
        RESET  => RESET,
          clk  => CLK100MHZ,
           rx  => RsRx,
          dat  => data_from_uart,
       dat_en  => data_from_uart_en
    );

    -------------------------------------------------------------------------------------
           
    PROCESS(CLK100MHZ)
    BEGIN
        IF CLK100MHZ'event AND CLK100MHZ = '1' THEN
            IF RESET = '1' THEN
                pack_from_uart    <= (others=>'0');
                pack_from_uart_en <= (others=>'0');
                let_s_go          <= '0';
            ELSIF pack_from_uart_en = x"FF" THEN
                pack_from_uart    <= pack_from_uart;
                pack_from_uart_en <= (others=>'0');
                let_s_go          <= '1';
            ELSIF data_from_uart_en = '1' THEN
                pack_from_uart    <= data_from_uart & pack_from_uart(63 downto 8);
                pack_from_uart_en <= pack_from_uart_en(6 downto 0) & '1';
                let_s_go          <= '0';
            ELSE
                pack_from_uart    <= pack_from_uart;
                pack_from_uart_en <= pack_from_uart_en;
                let_s_go          <= '0';
            END IF;
        END IF;
    END PROCESS;

    -------------------------------------------------------------------------------------

    PGCD_ENGINE : ENTITY work.PGCD
    PORT MAP(
        clk       => CLK100MHZ,
        reset     => reset,
        idata_a   => pack_from_uart(63 downto 32),
        idata_b   => pack_from_uart(31 downto  0),
        idata_en  => let_s_go,
        odata     => data_to_uart,
        odata_en  => data_to_uart_en
    );

    -------------------------------------------------------------------------------------

    PROCESS(CLK100MHZ)
    BEGIN
        IF CLK100MHZ'event AND CLK100MHZ = '1' THEN
            IF RESET = '1' THEN
                pack_to_uart    <= (others=>'0');
                pack_to_uart_en <= (others=>'0');
            ELSIF data_to_uart_en = '1' THEN
                pack_to_uart    <= data_to_uart;
                pack_to_uart_en <= x"F";
            ELSE
                pack_to_uart    <= x"00" & pack_to_uart(31 downto 8);
                pack_to_uart_en <= '0' & pack_to_uart_en(3 downto 1);
            END IF;
        END IF;
    END PROCESS;

    -------------------------------------------------------------------------------------

    LED <= (OTHERS => '0') WHEN RESET = '0' ELSE (OTHERS => '1');

    -------------------------------------------------------------------------------------

	snd : ENTITY work.UART_fifoed_send
	PORT MAP(
   clk_100MHz   => CLK100MHZ,
		RESET   => RESET,
     fifo_empty => OPEN,
     fifo_afull => OPEN,
     fifo_full  => OPEN,
         tx     => RsTx,
        dat     => pack_to_uart(7 downto 0),
     dat_en     => pack_to_uart_en(0)
     );

end Behavioral;