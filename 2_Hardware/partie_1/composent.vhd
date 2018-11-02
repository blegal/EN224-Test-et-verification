library IEEE;

entity composent is
   port ( a : in bit;
         b : in bit;
         c : in bit;
	      x, y : out bit);
   end composent;

architecture comportementale of composent is
begin
   process(a,b,c)
    variable s : bit;
       begin
         if (a='1' and b='0') then x <= '0';
            else x <= '1';
         end if;
         s := a xor b;
         y <= s and c;
   end process;
end comportementale;