library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

entity compteur is
   port ( reset : in Std_Logic;
         clk   : in Std_Logic;
         up : in Std_Logic;
	      output : out Std_Logic_vector(3 downto 0 ));
   end compteur;

architecture comportementale of compteur is
	signal count : Std_Logic_vector(3 downto 0 );
begin
   synchrone : process (reset,clk)
   begin
     if reset='0' then
	count<=(others=>'0');
     elsif clk'event and clk='1' then
         case up is
             when '1' => count <= count + 1;
             when '0' => count <= count - 1;
             when others => null;
         end case;
     end if ;
    end process ;
    output <= count;
end comportementale;
