library ieee;
use ieee.std_logic_1164.all;

entity tb_CPU_V2 is 
end entity;

architecture arch of tb_CPU_V2 is

--declare component under test
COMPONENT CPU_V2 IS 
PORT (
	Clock, Run, Reset: IN std_logic;
	DIN: IN std_logic_vector(0 TO 15);
	Done: BUFFER std_logic;
	
	Overflow: OUT std_logic;
	State: OUT Integer;
	OPPrint: OUT std_logic_vector(0 TO 2);
	addPrint: OUT std_logic_vector(0 TO 15);
	R0, R1, R2, R3 : OUT std_logic_vector(0 TO 15)
);
END COMPONENT;

--Declare signals 
	Signal S_Clock, S_Run, S_Reset: std_logic :='0';
	Signal S_DIN: std_logic_vector(0 TO 15);
	Signal S_Done: std_logic:='0';
	
	Signal S_Overflow: std_logic;
	Signal S_State: Integer;
	Signal S_OPPrint: std_logic_vector(0 TO 2);
	Signal S_addPrint: std_logic_vector(0 TO 15);
	Signal S_R0, S_R1, S_R2, S_R3 : std_logic_vector(0 TO 15);

BEGIN

--Component mapping
PROC_1 : CPU_V2 
port map (
	Clock => S_Clock, Run=>S_Run, Reset=>S_Reset,
	DIN=>S_DIN,
	Done=>S_Done,
	Overflow=>S_Overflow,
	OPPrint=>S_OPPrint,
	addPrint=>S_addPrint,
	R0=>S_R0, R1=>S_R1, R2=>S_R2, R3=>S_R3
);
S_Clock<= not(S_Clock) after 10 ns;
Process
begin
--mvi R0
S_DIN<="0010000000000000";
S_Run<='1';

wait for 20 ns; 
S_DIN<="0000000000000110";

--mvi R1
wait for 20 ns;
S_DIN<="0010010000000000";

wait for 20 ns; 
S_DIN<="0000000000000110";

--not R1
wait for 20 ns; 
S_DIN<="1100010000000000";

--sub R1 R0
wait for 20 ns; 
S_DIN<="0110010000000000";

--mv R2 R0
wait for 20 ns; 
S_DIN<="0000100000000000";

--R0 And R2
wait for 20 ns; 
S_DIN<="1000000100000000";
--mv R2 R0
wait for 20 ns; 
S_Run<='0';
S_DIN<="0000100000000000";
--Reset
wait for 20 ns; 
S_Reset<='1';
end process;
 
END arch;