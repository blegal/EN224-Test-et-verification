library IEEE;
library work;
use work.all;

ENTITY bench_composent IS
END bench_composent;

ARCHITECTURE bench OF bench_composent IS

component composent
   port ( a : in bit;
         b : in bit;
         c : in bit;
	      x, y : out bit);
   end component;

 signal as, bs, cs, xs, ys : bit :='0';

begin

 c1 : composent port map (as, bs, cs, xs, ys);

process
	begin
			as <='0';
		   bs <='0';
		   cs <='0';
			WAIT FOR 10 ns;
			
			as <='0';
		   bs <='1';
		   cs <='0';
			WAIT FOR 10 ns;
			
			as <='1';
		   bs <='1';
		   cs <='0';
			WAIT FOR 10 ns;
			
			as <='1';
		   bs <='1';
		   cs <='1';
			WAIT FOR 10 ns;
			
	wait;
end process;

end bench;

configuration composent_cfg of bench_composent is

	for bench
		for c1 :composent
			use entity work.composent(comportementale);
		end for;
	end for;

end composent_cfg;
