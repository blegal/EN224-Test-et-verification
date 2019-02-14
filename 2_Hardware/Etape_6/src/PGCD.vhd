library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity PGCD is
    Port ( 
           CLK      : in  STD_LOGIC;
           RESET    : in  STD_LOGIC;

           idata_a  : in  STD_LOGIC_VECTOR (31 downto 0);
           idata_b  : in  STD_LOGIC_VECTOR (31 downto 0);
           idata_en : in  STD_LOGIC;

           odata    : out STD_LOGIC_VECTOR (31 downto 0);
           odata_en : out STD_LOGIC
	);
end PGCD;

ARCHITECTURE Behavioral of PGCD IS

	SIGNAL A : UNSIGNED (31 downto 0);
	SIGNAL B : UNSIGNED (31 downto 0);
    
    TYPE STATE_TYPE IS (WAITING, RUNNING, SENDING);
    SIGNAL cstate : STATE_TYPE;

    function MULT(X : UNSIGNED; Y: INTEGER) return UNSIGNED is
        VARIABLE TMP : UNSIGNED(X'RANGE);
    begin
        CASE Y IS
            WHEN 1 => TMP := X(X'LENGTH-2 DOWNTO 0) & "0";
            WHEN 2 => TMP := X(X'LENGTH-3 DOWNTO 0) & "00";
            WHEN 3 => TMP := X(X'LENGTH-4 DOWNTO 0) & "000";
            WHEN 4 => TMP := X(X'LENGTH-5 DOWNTO 0) & "0000";
            WHEN 5 => TMP := X(X'LENGTH-6 DOWNTO 0) & "00000";
            WHEN OTHERS => TMP := X;
        END CASE;
        REPORT "VALEUR INP : " & INTEGER'IMAGE( TO_INTEGER(  X) );
        REPORT "VALEUR OUP : " & INTEGER'IMAGE( TO_INTEGER(TMP) );
        RETURN TMP;
    end MULT;
    
BEGIN

    PROCESS(CLK)
    BEGIN
        IF CLK'EVENT AND CLK = '1' THEN
            IF RESET = '1' THEN
                cstate   <= WAITING;
                odata    <= (others=>'0');
                odata_en <= '0';
            ELSE
                CASE cstate IS
                
                    WHEN WAITING =>

                       IF idata_en = '1' THEN
                            A <= UNSIGNED(idata_a);
                            B <= UNSIGNED(idata_b);
                            cstate <= RUNNING;
                        ELSE
                            cstate <= WAITING;
                        END IF;
                        
                        odata    <= (others=>'0');
                        odata_en <= '0';
                    
                    WHEN RUNNING =>

                        IF A = B THEN
                            cstate <= SENDING;

-- synthesis translate_on
                        ELSIF A > MULT(B,1) THEN
                            A      <= A - MULT(B,1);
                            cstate <= RUNNING;
                            
                        ELSIF MULT(A,1) < B THEN
                            B      <= B - MULT(A,1);
                            cstate <= RUNNING;
-- synthesis translate_on

                        ELSIF A > B THEN
                            A      <= A - B;
                            cstate <= RUNNING;

                        ELSE
                            B      <= B - A;
                            cstate <= RUNNING;
                        END IF;

                        odata    <= (others=>'0');
                        odata_en <= '0';

                    WHEN SENDING =>
                    
                        cstate   <= WAITING;
                        odata    <= STD_LOGIC_VECTOR( A );
                        odata_en <= '1';
                        
                END CASE;
            END IF;
        END IF;
    END PROCESS;

END Behavioral;