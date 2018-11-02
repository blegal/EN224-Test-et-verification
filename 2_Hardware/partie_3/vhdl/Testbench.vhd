library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
use std.textio.all;
use work.txt_util.all;

library work;

entity Multiplieur_tb is
end;

architecture bench of Multiplieur_tb is

  component Multiplieur 
  	PORT (
  		floatA : IN  Std_Logic_Vector(31 DOWNTO 0);
  		floatB : IN  Std_Logic_Vector(31 DOWNTO 0);
  		floatC : OUT Std_Logic_Vector(31 DOWNTO 0)
     );
  end component;

  signal floatA: Std_Logic_Vector(31 DOWNTO 0);
  signal floatB: Std_Logic_Vector(31 DOWNTO 0);
  signal floatC: Std_Logic_Vector(31 DOWNTO 0) ;

begin

 	uut: Multiplieur port map 
	(
		floatA => floatA,
     floatB => floatB,
     floatC => floatC
	);

  stimulus: process
      file Na : TEXT open READ_MODE  is "nA.ini";
      file Nb : TEXT open READ_MODE  is "nB.ini";
      file Nc : TEXT open WRITE_MODE is "nC.ini";
      variable LineNa       : string(1 to 32);
      variable LineNb       : string(1 to 32);
      variable LineNc       : string(1 to 32);
  begin

	while not endfile(Na) loop
			str_read(Na, LineNa);
			str_read(Nb, LineNb);
			floatA <= to_std_logic_vector(LineNa(1 to 32));
			floatB <= to_std_logic_vector(LineNb(1 to 32));
	     wait for 10 ns;
			LineNc := str(floatC);
			print(Nc, LineNc);
	end loop;

	wait for 100000 ns;


    -- Put test bench stimulus code here
  end process;
end;

configuration cfg_Multiplieur_tb of Multiplieur_tb is
  for bench
    for uut: Multiplieur
    end for;
  end for;
end cfg_Multiplieur_tb;