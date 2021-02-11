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

    -- pragma translate_off
	SIGNAL A_copy : UNSIGNED (31 downto 0);
	SIGNAL B_copy : UNSIGNED (31 downto 0);
    -- pragma translate_on
 
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

                            --
                            -- Les pré-conditions
                            --                       
                            -- pragma translate_off
                            ASSERT UNSIGNED(idata_a) >= TO_UNSIGNED(    0, 32) SEVERITY FAILURE;
                            ASSERT UNSIGNED(idata_a) <= TO_UNSIGNED(65535, 32) SEVERITY FAILURE;
                            ASSERT UNSIGNED(idata_b) >= TO_UNSIGNED(    0, 32) SEVERITY FAILURE;
                            ASSERT UNSIGNED(idata_b) <= TO_UNSIGNED(65535, 32) SEVERITY FAILURE;
                            A_copy <= UNSIGNED(idata_a); -- NECESSAIRE POUR LES ASSEERTIONS A LA FIN
                            B_copy <= UNSIGNED(idata_b); -- NECESSAIRE POUR LES ASSEERTIONS A LA FIN
                            -- pragma translate_on

                            A      <= UNSIGNED(idata_a);
                            B      <= UNSIGNED(idata_b);
                            
                            
                            cstate <= RUNNING;
                        ELSE
                            cstate <= WAITING;
                        END IF;
                        
                        odata    <= (others=>'0');
                        odata_en <= '0';
                    
                    WHEN RUNNING =>

                        IF A = TO_UNSIGNED(0, 32) THEN
                            A      <= B;
                            cstate <= SENDING;

                        ELSIF B = TO_UNSIGNED(0, 32) THEN
                            cstate <= SENDING;

                        ELSIF A = B THEN
                            cstate <= SENDING;

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

                        --
                        -- Les post-conditions
                        --
                        -- pragma translate_off
                        ASSERT A >= TO_UNSIGNED(0,32) SEVERITY FAILURE;
                        ASSERT A <= A_copy            SEVERITY FAILURE;
                        ASSERT A <= B_copy            SEVERITY FAILURE;
                        ASSERT (A_copy mod A) = 0     SEVERITY FAILURE;
                        ASSERT (B_copy mod A) = 0     SEVERITY FAILURE;
                        -- pragma translate_on
                    
                        cstate   <= WAITING;
                        odata    <= STD_LOGIC_VECTOR( A );
                        odata_en <= '1';
                        
                END CASE;
            END IF;
        END IF;
    END PROCESS;

END Behavioral;
