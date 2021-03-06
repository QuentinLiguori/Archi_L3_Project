LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Test_FSM IS
PORT(
	KEY : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	SW : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	LEDR  : OUT STD_LOGIC_VECTOR(4 DOWNTO 0));
END Test_FSM;
ARCHITECTURE Behavior OF Test_FSM IS
COMPONENT FSM
	PORT (
	w, CLK, reset: IN STD_LOGIC;
	Q : OUT STD_LOGIC;
	present_state : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END COMPONENT;
BEGIN
	fsm3 : FSM PORT MAP(w=>SW(0), CLK=>KEY(0), reset=> SW(1), Q=>LEDR(4), present_state=>LEDR(3 DOWNTO 0));

END Behavior;