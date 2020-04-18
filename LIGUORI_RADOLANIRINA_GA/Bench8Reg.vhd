Library IEEE ;
USE ieee.std_logic_1164.all;
Entity Bench8Reg IS
GENERIC(N: integer :=16);--VALEUR PAR DEFAUT 4
PORT(
	DRin: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	Rkin: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0); 
	Clk: IN STD_LOGIC);
END Bench8Reg;

ARCHITECTURE Structure OF Bench8Reg IS
COMPONENT RegNbits is
PORT(
	D: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0); 
	Clk, w: IN STD_LOGIC;
	Q: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));
END COMPONENT;

BEGIN

reg0 : RegNbits PORT MAP(D=>DRin, Clk=>Clk, w=>Rkin(0), Q=>R0out);
reg1 : RegNbits PORT MAP(D=>DRin, Clk=>Clk, w=>Rkin(1), Q=>R1out);
reg2 : RegNbits PORT MAP(D=>DRin, Clk=>Clk, w=>Rkin(2), Q=>R2out);
reg3 : RegNbits PORT MAP(D=>DRin, Clk=>Clk, w=>Rkin(3), Q=>R3out);
reg4 : RegNbits PORT MAP(D=>DRin, Clk=>Clk, w=>Rkin(4), Q=>R4out);
reg5 : RegNbits PORT MAP(D=>DRin, Clk=>Clk, w=>Rkin(5), Q=>R5out);
reg6 : RegNbits PORT MAP(D=>DRin, Clk=>Clk, w=>Rkin(6), Q=>R6out);
reg7 : RegNbits PORT MAP(D=>DRin, Clk=>Clk, w=>Rkin(7), Q=>R7out);

END Structure;  
