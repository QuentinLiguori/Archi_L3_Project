library ieee;
use ieee.std_logic_1164.all;

ENTITY test_FSM_detect is 
END ENTITY;

ARCHITECTURE archictecture OF test_FSM_detect IS

--declare component under test
COMPONENT FSM_detect IS 
PORT(
	w, setn, resetn, CLK : IN STD_LOGIC;
	z : OUT STD_LOGIC);
END COMPONENT;

--Declare signals 
Signal 
w_w, setn_w, resetn_w, CLK_w, z_w : STD_LOGIC :='0';
Begin 

--Component mapping
fsm : FSM_detect 
port map (
	w => w_w,
	setn => setn_w,
	resetn => resetn_w,
	CLK => CLK_w,
	z => z_w
);


CLK_w <= not(CLK_w) after 10 ns;
Process
begin
w_w <= '0';
setn_w <= '0';
resetn_w <=  '1';


wait for 20 ns;

resetn_w <=  '0';
wait for 20 ns;

w_w <= '1';
wait for 20 ns;

w_w <= '1';
wait for 20 ns;

w_w <= '1';
wait for 20 ns;


w_w <= '1';
wait for 20 ns;

w_w <= '0';
wait for 20 ns;

w_w <= '0';
wait;
end process;

end archictecture;