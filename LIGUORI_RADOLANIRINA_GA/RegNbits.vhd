Library IEEE ;
USE ieee.std_logic_1164.all;
Entity RegNbits IS
GENERIC(N: integer :=4);--VALEUR PAR DEFAUT 4
PORT(
	D: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0); 
	Clk, Rst: IN STD_LOGIC;
	Q: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));
END RegNbits;
ARCHITECTURE Structure OF RegNbits IS
COMPONENT Reg1bit
PORT(
	D, Clk, Rst: IN STD_LOGIC;
	Q: OUT STD_LOGIC);
END COMPONENT;
Begin
gene : FOR i IN 0 TO N-1 GENERATE

	ls_bit: IF i=0 GENERATE
			ls_cell: Reg1bit PORT MAP(D(0), Clk, Rst, Q(0));
	END GENERATE ls_bit;
	middle_bit: IF i>=1 AND i<=N-1 GENERATE
			middle_cell: Reg1bit PORT MAP(D(i), Clk, Rst, Q(i));
	END GENERATE middle_bit;
	
END GENERATE gene;
END Structure;  