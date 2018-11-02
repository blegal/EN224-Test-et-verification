entity C2 is
 port( A : in signed(7 downto 0);
	B 	: in signed(7 downto 0);
	Cd : in Std_Logic;	-- Signal de commande du tri-state
	Clk : in Std_Logic;	-- Signal d'horloge
	S	: out signed(15 downto 0)) ;
end C2;

architecture comportementale of C2 is
signal T0 : signed(7 downto 0);
	signal T1 : signed(7 downto 0);
	signal T3 : signed(15 downto 0);
	signal T4 : signed(15 downto 0);
	signal T5 : signed(15 downto 0);
begin
	sequentiel : process (clk)
	begin
		if clk'event and clk='1' then
			T0 <= A;
			T1 <= B;
			T3 <= T0 * T1;	-- Multiplication signée
			T4 <= T5;
		end if;
	end process sequentiel;
	
	T5 <= T3 + T4;	-- Addition signée
	
	combinatoire : process(Cd,T5)
	begin
			if Cd = '0' then
				S <= T5;
			else
				S <= (others=>'Z');
			end if;
	end process combinatoire;
end comportementale;
