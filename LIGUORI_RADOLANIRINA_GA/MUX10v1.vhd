LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- redirects data from registers/DIN/G to the ALU
ENTITY Mux10v1 IS
PORT(
	--output on a 16-bit bus
	Bus_16bits:OUT std_logic_vector(0 TO 15);
	
	--input from the G register
	G: IN std_logic_vector(0 TO 15);
	
	--SEL on 10 bits : 8 registers, DIN, G
	Sel: IN std_logic_vector(0 TO 9);
	
	--input from the DIN 16-bit bus
	DIN: IN std_logic_vector(0 TO 15);
	
	--input from the bench of 8 registers
	R0: IN std_logic_vector(0 TO 15);
	R1: IN std_logic_vector(0 TO 15);
	R2: IN std_logic_vector(0 TO 15);
	R3: IN std_logic_vector(0 TO 15);
	R4: IN std_logic_vector(0 TO 15);
	R5: IN std_logic_vector(0 TO 15);
	R6: IN std_logic_vector(0 TO 15);
	R7: IN std_logic_vector(0 TO 15)
);
END Mux10v1;
	
ARCHITECTURE Behavior OF Mux10v1 IS
BEGIN
	--Selection to redirect an entry on the 16-bit output
	with Sel select
		Bus_16bits <= 	R0 when "0000000001",
						R1 when "0000000010",
						R2 when "0000000100",
						R3 when "0000001000",
						R4 when "0000010000",
						R5 when "0000100000",
						R6 when "0001000000",
						R7 when "0010000000",
						DIN when "0100000000",
						G when "1000000000",
				"1010101010101010" when OTHERS;
END Behavior;
