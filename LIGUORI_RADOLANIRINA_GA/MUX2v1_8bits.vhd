Library IEEE ;
USE ieee.std_logic_1164.all;
-- 2v1 8bits MUX 
ENTITY MUX2v1_8bits IS
PORT ( 
	x,y: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	s: IN STD_LOGIC;
	m : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)); 
END MUX2v1_8bits;
ARCHITECTURE Behavior OF MUX2v1_8bits IS
COMPONENT mux2v1 IS
	PORT ( 
	x,y,s : IN STD_LOGIC; 
	m : out STD_LOGIC); 
END COMPONENT;
BEGIN
mux0 : mux2v1 PORT MAP(x=>x(0),y=>y(0),s=>s, m=>m(0));
mux1 : mux2v1 PORT MAP(x=>x(1),y=>y(1),s=>s, m=>m(1));
mux2 : mux2v1 PORT MAP(x=>x(2),y=>y(2),s=>s, m=>m(2));
mux3 : mux2v1 PORT MAP(x=>x(3),y=>y(3),s=>s, m=>m(3));
mux4 : mux2v1 PORT MAP(x=>x(4),y=>y(4),s=>s, m=>m(4));
mux5 : mux2v1 PORT MAP(x=>x(5),y=>y(5),s=>s, m=>m(5));
mux6 : mux2v1 PORT MAP(x=>x(6),y=>y(6),s=>s, m=>m(6));
mux7 : mux2v1 PORT MAP(x=>x(7),y=>y(7),s=>s, m=>m(7));

END Behavior ;