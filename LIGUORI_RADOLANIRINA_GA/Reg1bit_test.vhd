Library IEEE ;
USE ieee.std_logic_1164.all;
Entity Reg1bit_test IS
PORT(
	SW: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	LEDR: OUT STD_LOGIC_VECTOR(0 DOWNTO 0));
END Reg1bit_test;

ARCHITECTURE Behavior  OF Reg1bit_test IS
COMPONENT Reg1bit is
PORT(
	D, Rst, Clk: IN STD_LOGIC;
	Q: OUT STD_LOGIC);
END COMPONENT;

BEGIN

reg : Reg1bit PORT MAP(D=>SW(2), Rst=>SW(1), Clk=>SW(0), Q=>LEDR(0));

END Behavior ;
