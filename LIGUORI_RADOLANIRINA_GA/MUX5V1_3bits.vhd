Library IEEE ;
USE ieee.std_logic_1164.all;
Entity MUX5v1_3bits IS
PORT (
	u, v, w, x,y: IN STD_LOGIC_VECTOR(2 downto 0);
	s: IN STD_LOGIC_VECTOR(2 downto 0);
	m : OUT STD_LOGIC_VECTOR(2 downto 0)); 
END MUX5v1_3bits;
ARCHITECTURE Behavior OF MUX5v1_3bits IS
COMPONENT MUX5v1_1bit IS
PORT(
u, v, w, x,y: IN STD_LOGIC;
	s: IN STD_LOGIC_VECTOR(2 downto 0);
	m : OUT STD_LOGIC); 
END COMPONENT;

BEGIN
mux0 : MUX5v1_1bit PORT MAP(u=>u(0), v=>v(0), w=>w(0), x=>x(0), y=>y(0), s(0)=>s(0), s(1)=>s(1), s(2)=>s(2), m=>m(0));

mux1 : MUX5v1_1bit PORT MAP(u=>u(1), v=>v(1), w=>w(1), x=>x(1), y=>y(1), s(0)=>s(0), s(1)=>s(1), s(2)=>s(2), m=>m(1));

mux2 : MUX5v1_1bit PORT MAP(u=>u(2), v=>v(2), w=>w(2), x=>x(2), y=>y(2), s(0)=>s(0), s(1)=>s(1), s(2)=>s(2), m=>m(2));

END Behavior ;
	