Library IEEE ;
USE ieee.std_logic_1164.all;
Entity Reg1bit IS
PORT(
	D, Rst, Clk: IN STD_LOGIC;
	Q: OUT STD_LOGIC);
END Reg1bit;
ARCHITECTURE Behavior  OF Reg1bit IS
Begin
PROCESS(Clk)
BEGIN
	
	IF(Rst = '1') THEN
		Q<='0';
	ELSE
		IF(Clk'event AND Clk='1') THEN
			Q<=D;
		END IF;
	END IF;
END PROCESS;


END Behavior;  