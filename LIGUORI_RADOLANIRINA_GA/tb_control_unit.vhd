library ieee;
use ieee.std_logic_1164.all;

entity tb_control_unit is 
end entity;

architecture arch of tb_control_unit is

--declare component under test
COMPONENT control_unit IS 
PORT (
	
	--Input
	instruction: IN STD_LOGIC_VECTOR(0 TO 8);
	run, reset, clock: IN STD_LOGIC;
	
	--Output to mux_proc
	Gout: OUT std_logic;
	DINout: OUT std_logic;
	Rout: OUT std_logic_vector(0 TO 7);
	
	--Output to register bench
	Rin: OUT std_logic_vector(0 TO 7);
	
	--Output to instruction register
	IRin: OUT std_logic;
	
	--Output of the processor
	Done: OUT std_logic;
	
	--Output to ALU
	AddSub: OUT std_logic_vector(0 TO 2);
	
	--Output to A register
	Ain: OUT std_logic;
	
	--Output to G register
	Gin: OUT std_logic
);
END COMPONENT;

--Declare signals 
	Signal S_Clock, S_Run, S_Reset: std_logic :='0';
	Signal S_Rin, S_Rout: std_logic_vector(0 TO 7);
	Signal S_IRin, S_DINout, S_Gout,S_Done, S_Ain, S_Gin: std_logic:='0';
	Signal S_AddSub : STD_LOGIC_VECTOR(0 TO 2);
	Signal S_instruction :STD_LOGIC_VECTOR(0 TO 8);

	
BEGIN

--Component mapping
 control0 : control_unit
 port map (
	instruction => S_instruction,
	clock => S_Clock, run => S_Run, reset => S_Reset,
	Gout => S_Gout, DINout => S_DINout, 
	Rout => S_Rout,
	Rin => S_Rin,
	IRin => S_IRin,
	Done => S_Done,
	AddSub => S_AddSub,
	Ain => S_Ain,
	Gin => S_Gin
 );
 
S_Clock <= not(S_Clock) after 10 ns;
Process
begin
S_instruction <= "001000001"; --MVI
S_Run <= '0';
S_Reset <= '0';
wait for 40 ns;
		
S_Run <= '1';		
wait for 20 ns;
		
S_Run <= '0';	
wait for 20 ns;


Din_s <= "111111111";
		Run_s <= '1';		
		wait for 20 ns;
		
		Run_s <= '0';
		wait for 20 ns;
		
		Din_s <= "010111101"; -- ADD
		Run_s <= '1';		
		wait for 20 ns;
		
		Run_s <= '0';
		wait for 80 ns;

		Din_s <= "011110010"; -- SUB
		Run_s <= '1';		
		wait for 20 ns;
		
		Run_s <= '0';		
		wait for 80 ns;
		
		Din_s <= "100100110"; -- AND
		Run_s <= '1';		
		wait for 20 ns;
		
		Run_s <= '0';		
		wait for 80 ns;
		
		Din_s <= "101011001"; -- OR
		Run_s <= '1';		
		wait for 20 ns;
		
		Run_s <= '0';		
		wait for 80 ns;
		
		Din_s <= "110001100"; -- NOT
		Run_s <= '1';		
		wait for 20 ns;
		
		Run_s <= '0';		
		wait for 60 ns;

end process;
END arch;