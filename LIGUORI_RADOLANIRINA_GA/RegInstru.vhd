LIBRARY ieee;
USE ieee.std_logic_1164.all;

--16-bit register used for the register bench and to store ALU values
ENTITY RegInstru IS
GENERIC(N: integer := 9);
PORT(
	--data entering the register
	D: IN std_logic_vector(N-1 DOWNTO 0);
	--clock and write signal sent by the control unit
	w, Clk: IN std_logic;
	--data exiting the register
	Q: OUT std_logic_vector(N-1 DOWNTO 0));
END RegInstru;

Architecture Behavior of RegInstru IS
BEGIN
	PROCESS(Clk,w)
	BEGIN
		--on clock rising edge and with write signal, output takes input value
		if (Clk'event and Clk = '1') and w = '1' then
			Q <= D;
		end if;
	END PROCESS;
End Behavior;
