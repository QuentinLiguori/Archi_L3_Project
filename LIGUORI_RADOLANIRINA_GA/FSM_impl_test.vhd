Library IEEE ;
USE ieee.std_logic_1164.all;
Entity FSM_impl_test IS
PORT(
	KEY: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	SW : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	LEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
END FSM_impl_test;
ARCHITECTURE Behavior  OF FSM_impl_test IS
COMPONENT FSM_detect
PORT(
	w, resetn, setn, CLK: IN STD_LOGIC;
	state : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
	z: OUT STD_LOGIC);
END COMPONENT;
BEGIN

	fsm : FSM_detect PORT MAP(w=>SW(0),resetn=>SW(3),setn=>SW(1),CLK=>KEY(0),state=>LEDR(8 DOWNTO 0),z=>LEDR(9));

END Behavior ;