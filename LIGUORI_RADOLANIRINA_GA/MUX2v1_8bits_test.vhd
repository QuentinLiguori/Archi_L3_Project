Library IEEE ;
USE ieee.std_logic_1164.all;
-- Test Mux2v1 8bits
ENTITY MUX2v1_8bits_test IS
PORT ( 
	SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
	LEDR : OUT STD_LOGIC_VECTOR(7	DOWNTO 0)); -- red LEDs
END MUX2v1_8bits_test;
ARCHITECTURE Behavior OF MUX2v1_8bits_test IS
COMPONENT mux2v1_8bits IS
	PORT (
	x,y: IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
	s: IN STD_LOGIC;
	m : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)); -- red LEDs 7 to 0
END COMPONENT;

constant x_zero: STD_LOGIC_VECTOR(3 downto 0):="0000";--(others='0');

BEGIN
u1 : mux2v1_8bits PORT MAP(x=>x_zero&SW(7 downto 4),y=>x_zero&SW(3 downto 0), s=>SW(9), m=>LEDR(7 downto 0));

END Behavior ;
