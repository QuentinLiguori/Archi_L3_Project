Library IEEE ;
USE ieee.std_logic_1164.all;
Entity FlipFlop_D IS
PORT(
	D: IN STD_LOGIC_VECTOR(8 downto 0);
	setn, resetn, CLK: IN STD_LOGIC;
	Q: OUT STD_LOGIC_VECTOR(8 downto 0)
	);
END FlipFlop_D;
ARCHITECTURE Behavior  OF FlipFlop_D IS
Begin
PROCESS(Clk, resetn)
BEGIN
	
	IF(resetn = '1') THEN
		Q<="000000001";
	ELSIF(Clk'event AND Clk='1') THEN
		IF(setn = '1') THEN
			Q<="100000000";
		ELSE
			Q<=D;
		END IF;
	END IF;
END PROCESS;


END Behavior;  