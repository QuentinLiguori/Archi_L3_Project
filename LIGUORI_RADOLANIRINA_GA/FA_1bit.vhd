Library IEEE ;
USE ieee.std_logic_1164.all;
Entity FA_1bit IS
PORT(
	A, B, Cin: IN STD_LOGIC;
	Cout, S: OUT STD_LOGIC);
END FA_1bit;
ARCHITECTURE Behavior  OF FA_1bit IS
Begin

Cout <= ((Cin AND (A OR B)) OR (A AND B));
S <= (Cin XOR (A XOR B));

END Behavior;  