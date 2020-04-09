LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY ControlUnit IS
PORT (
	IRout: IN STD_LOGIC_VECTOR(8 DOWNTO 0);
	Run,Reset,Clk : IN STD_LOGIC;
	Rs, Rout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	IRs,Gout,DINout,AddSub,Gs,As,Done : OUT STD_LOGIC
);
END ControlUnit;
ARCHITECTURE Behavior OF ControlUnit IS
SIGNAl fetch,decode,execute :  STD_LOGIC;
SIGNAL present_state, next_state Integer;
BEGIN
		BEGIN PROCESS(Clk,Run)	
			IF(Reset = '1') THEN
				present_state<= '0';
			ELSIF(Clk'event AND Clk='1') THEN
				IF Run ='1' THEN
					present_state<=next_state;
				END IF;
			END IF;
		END PROCESS;
	PROCESS()
	
		
	END PROCESS;
END Behavior;