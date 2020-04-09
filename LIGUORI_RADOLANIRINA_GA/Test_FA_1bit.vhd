Library IEEE ;
USE ieee.std_logic_1164.all;
Entity Test_FA_1bit IS
PORT(
	SW: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	LEDR: OUT STD_LOGIC_VECTOR(9 DOWNTO 8));
END Test_FA_1bit;

ARCHITECTURE Behavior  OF Test_FA_1bit IS
COMPONENT FA_1bit is
PORT (
	A, B, Cin: IN STD_LOGIC;
	Cout, S: OUT STD_LOGIC); 
END COMPONENT;

BEGIN

fa : FA_1bit PORT MAP(A=>SW(2), B=>SW(1), Cin=>SW(0), Cout=>LEDR(9), S=>LEDR(8));

END Behavior ;
