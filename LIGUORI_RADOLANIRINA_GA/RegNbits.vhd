LIBRARY ieee;
USE ieee.std_logic_1164.all;

--16-bit register used for the register bench and to store ALU values
ENTITY RegNbits IS
GENERIC(N: integer := 16);
PORT(
	--data entering the register
	D: IN std_logic_vector(N-1 DOWNTO 0);
	--clock and write signal sent by the control unit
	w, Clk: IN std_logic;
	--data exiting the register
	Q: OUT std_logic_vector(N-1 DOWNTO 0));
END RegNbits;

Architecture Behavior of RegNbits IS
BEGIN
	PROCESS(Clk,w)
	BEGIN
		--on clock rising edge and with write signal, output takes input value
		if (Clk'event and Clk = '1') and w = '1' then
			Q <= D;
		end if;
	END PROCESS;
End Behavior;
