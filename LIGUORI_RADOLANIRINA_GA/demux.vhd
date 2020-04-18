LIBRARY ieee; USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

-- Done
ENTITY demux IS
PORT(
	I: IN std_logic_vector(2 DOWNTO 0);
	O: OUT std_logic_vector(7 DOWNTO 0)
);
END demux;

Architecture Behavior OF demux IS

BEGIN
	with I select
		O <= 	"00000001" when "000",
				"00000010" when "001",
				"00000100" when "010",
				"00001000" when "011",
				"00010000" when "100",
				"00100000" when "101",
				"01000010" when "110",
				"10000000" when "111",
				"00000000" when OTHERS;
END Behavior;