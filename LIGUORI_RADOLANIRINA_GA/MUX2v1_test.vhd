Library IEEE ;
USE ieee.std_logic_1164.all;

ENTITY MUX2v1_test IS
PORT ( 
	SW : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	LEDR : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)); -- red LEDs
END MUX2v1_test;
ARCHITECTURE Behavior OF MUX2v1_test IS
COMPONENT mux2v1 IS
	PORT ( 
		x,y,s : in STD_LOGIC; 
		m : out STD_LOGIC); -- red LEDs
END COMPONENT;
BEGIN
u1 : mux2v1 PORT MAP(x=>SW(0),y=>SW(1),s=>SW(2), m=>LEDR(0));

END Behavior ;
