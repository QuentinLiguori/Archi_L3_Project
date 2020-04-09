Library IEEE ;
USE ieee.std_logic_1164.all;
-- Simple module that connects the SW switches to the LEDR lights using a MUX5V1 1 bit
ENTITY MUX5v1_1bit IS
PORT ( 
	u, v, w, x,y: IN STD_LOGIC;
	s: IN STD_LOGIC_VECTOR(2 downto 0);
	m : OUT STD_LOGIC); 
END MUX5v1_1bit;
ARCHITECTURE Behavior OF MUX5v1_1bit IS
COMPONENT MUX2v1 is
	PORT ( 
	x,y,s : in STD_LOGIC; 
	m : out STD_LOGIC); 
END COMPONENT;

SIGNAL r0,r1,r2: STD_LOGIC;

BEGIN
mux0 : MUX2v1 PORT MAP(x=>u,y=>v,s=>s(0), m=>r0);

mux1 : MUX2v1 PORT MAP(x=>w,y=>x,s=>s(0), m=>r1);

mux2 : MUX2v1 PORT MAP(x=>r0,y=>r1,s=>s(1), m=>r2);

mux3 : MUX2v1 PORT MAP(x=>r2,y=>y,s=>s(2), m=>m);

END Behavior ;