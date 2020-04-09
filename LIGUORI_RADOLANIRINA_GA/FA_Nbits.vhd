Library IEEE ;
USE ieee.std_logic_1164.all;
Entity FA_Nbits IS
GENERIC(N: integer :=4);--VALEUR PAR DEFAUT 4
PORT(
	A, B: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0); 
	Cin: IN STD_LOGIC;
	S: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0); 
	Cout: OUT STD_LOGIC);
END FA_Nbits;
ARCHITECTURE Structure OF FA_Nbits IS
COMPONENT FA_1bit
PORT(
	A, B, Cin: IN STD_LOGIC;
	Cout, S: OUT STD_LOGIC);
END COMPONENT;
SIGNAL carry : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
Begin
gene : FOR i IN 0 TO N-1 GENERATE

	ls_bit: IF i=0 GENERATE
			ls_cell: FA_1bit PORT MAP(A(0), B(0), Cin, carry(0), S(0));
	END GENERATE ls_bit;
	middle_bit: IF i>=1 AND i<N-1 GENERATE
			middle_cell: FA_1bit PORT MAP(A(i), B(i), carry(i-1), carry(i), S(i));
	END GENERATE middle_bit;
	ms_bit: IF i=N-1 GENERATE
			ms_cell: FA_1bit PORT MAP(A(i), B(i), carry(i-1), Cout, S(i));
	END GENERATE ms_bit;
	
END GENERATE gene;
END Structure;  