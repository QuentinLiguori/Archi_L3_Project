Library IEEE ;
USE ieee.std_logic_1164.all;
Entity MultArray_4bits IS
PORT(
	A, B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	P: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END MultArray_4bits;
ARCHITECTURE Behavior  OF MultArray_4bits IS
	COMPONENT FA_Nbits
	GENERIC(N: integer :=4);--VALEUR PAR DEFAUT 4
		PORT(
			A, B: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0); 
			Cin: IN STD_LOGIC;
			S: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0); 
			Cout: OUT STD_LOGIC);
	END COMPONENT;
SIGNAL carry : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL carryResult : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL carryResult2 : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
	
	P(0) <= A(0) AND B(0);
	fan : FA_Nbits PORT MAP(A(0)=>(A(1) AND B(0)),A(1)=>(A(2) AND B(0)),A(2)=>(A(3) AND B(0)),A(3)=>'0', B(0)=>(A(0) AND B(1)), B(1)=>(A(1) AND B(1)), B(2)=>(A(2) AND B(1)), B(3)=>(A(3) AND B(1)),Cin=>'0', Cout => carry(0), S => carryResult);
	P(1) <= carryResult(0);
	
	fan2 : FA_Nbits PORT MAP(A(0)=>carryResult(1),A(1)=>carryResult(2), A(2)=>carryResult(3), A(3)=>carry(0),B(0)=>(A(0) AND B(2)), B(1)=>(A(1) AND B(2)), B(2)=>(A(2) AND B(2)), B(3)=>(A(3) AND B(2)), Cin=>'0', Cout=>carry(1), S => carryResult2);
	
	P(2) <= carryResult2(0);
	fan3 : FA_Nbits PORT MAP(A(0)=>carryResult2(1),A(1)=>carryResult2(2), A(2)=>carryResult2(3), A(3)=>carry(1),B(0)=>(A(0) AND B(3)), B(1)=>(A(1) AND B(3)), B(2)=>(A(2) AND B(3)), B(3)=>(A(3) AND B(3)), Cin=>'0', Cout=>P(7), S => P(6 DOWNTO 3));
END Behavior;