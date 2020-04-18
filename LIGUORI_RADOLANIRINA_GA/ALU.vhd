LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ALU IS
PORT(
	A,B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	Sel: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	S: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	Overflow : OUT STD_LOGIC
);
END ALU;

ARCHITECTURE Behavior OF ALU IS
Component AddSubNbits IS
	GENERIC(N: integer := 16);
	PORT(
	A, B: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0); 
	Cin, Sel: IN STD_LOGIC;
	S: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0); 
	Cout: OUT STD_LOGIC);
END Component;

Signal Saddsub : STD_LOGIC_VECTOR(15 downto 0);
Signal Caddsub : STD_LOGIC;

BEGIN
	addsub: AddSubNbits port map(A=>A, B=>B, Cin=>'0', Sel=>Sel(0), S=>Saddsub, Cout=>Caddsub);
	
	conditions : process(Sel, Saddsub, Caddsub, A, B)
	begin
		Overflow <= '0';
		IF (Sel = "000") THEN
			S <= B;
		ELSIF (Sel = "001") THEN
			S <= B;
		ELSIF (SEl = "010")  THEN
			S <= Saddsub;
			Overflow <= Caddsub;
		ELSIF (Sel ="011") THEN
			S <= Saddsub;
			Overflow <= Caddsub;
		ELSIF (Sel = "100") THEN
			S<=  A AND B;
		ELSIF  (Sel ="101") THEN
			S <= (A OR B);
		ELSIF (Sel =  "110") THEN
			S <= Not(A);
		END IF;
	end process conditions;
END Behavior;
