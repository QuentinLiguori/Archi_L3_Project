Library IEEE ;
USE ieee.std_logic_1164.all;
Entity AddSubNbits IS
GENERIC(N: integer :=4);--VALEUR PAR DEFAUT 4
PORT(
	A, B: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0); 
	Cin, Sel: IN STD_LOGIC;
	S: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0); 
	Cout: OUT STD_LOGIC);
END AddSubNbits;
ARCHITECTURE Structure OF AddSubNbits IS
COMPONENT FA_Nbits
PORT(
	A, B: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	Cin: IN STD_LOGIC;
	S: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0); 
	Cout: OUT STD_LOGIC);
END COMPONENT;
SIGNAL carry : STD_LOGIC;
SIGNAL B_AddSub : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
Begin
	
		With Sel SELECT -- Addition	
					B_AddSub <= (B) WHEN '0',
					(NOT B) WHEN OTHERS;
					
		With Sel SELECT -- Addition	
					carry <= Cin WHEN '0',
					'1' WHEN OTHERS;
					
			fan : FA_Nbits PORT MAP(A=>A, B=>B_AddSub, Cin=>carry, Cout=>Cout, S=>S);
		
END Structure; 

