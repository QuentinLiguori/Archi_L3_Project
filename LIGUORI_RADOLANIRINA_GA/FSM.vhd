LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY FSM IS
PORT (
	w, CLK, reset: IN STD_LOGIC;
	Q : OUT STD_LOGIC;
	present_state : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END FSM;
ARCHITECTURE Behavior OF FSM IS
	--declare signals
	TYPE State_type IS (A, B, C, D, E, F, G, H, I);
	-- Attribute to declare a specific encoding for the states
	attribute syn_encoding : string;
	attribute syn_encoding of State_type : type is "0000 0001 0010 0011 0100 0101 0110 0111 1000";
	SIGNAL y_Q, Y_D : State_type; --y_Q is present state, y_D is next state
	BEGIN
		PROCESS (w, y_Q) -- state table
		BEGIN
			case y_Q IS
				WHEN A => IF(w = '0') THEN Y_D<=B;
				ELSE Y_D <= F;
				END IF;
				WHEN B => IF(w = '0') THEN Y_D<=C;
				ELSE Y_D <= F;
				END IF;
				WHEN C => IF(w = '0') THEN Y_D<=D;
				ELSE Y_D <= F;
				END IF;
				WHEN D => IF(w = '0') THEN Y_D<=E;
				ELSE Y_D <= F;
				END IF;
				WHEN E => IF(w = '0') THEN Y_D<=y_Q;
				ELSE Y_D <= F;
				END IF;
				WHEN F => IF(w = '1') THEN Y_D<=G;
				ELSE Y_D <= B;
				END IF;
				WHEN G => IF(w = '1') THEN Y_D<=H;
				ELSE Y_D <= B;
				END IF;
				WHEN H => IF(w = '1') THEN Y_D<=I;
				ELSE Y_D <= B;
				END IF;
				WHEN I => IF(w = '1') THEN Y_D<=y_Q;
				ELSE Y_D <= B;
				END IF;
			END CASE;
		END PROCESS; -- state table
		PROCESS (CLK, reset) -- state flip-flops
		BEGIN
	
			IF(reset = '1') THEN
				y_Q<=A;
			ELSIF(Clk'event AND Clk='1') THEN
					y_Q<=Y_D;
			END IF;
		END PROCESS;
		PROCESS(y_Q)
		BEGIN
			CASE y_Q IS
				WHEN E=>Q<='1';
				WHEN I=>Q<='1';
				WHEN OTHERS=>Q<='0';
			END CASE;
		END PROCESS;
		
		WITH y_Q SELECT
			present_state<="0000" WHEN A,
			"0001" WHEN B,
			"0010" WHEN C,
			"0011" WHEN D,
			"0100" WHEN E,
			"0101" WHEN F,
			"0110" WHEN G,
			"0111" WHEN H,
			"1000" WHEN I;
END Behavior;
