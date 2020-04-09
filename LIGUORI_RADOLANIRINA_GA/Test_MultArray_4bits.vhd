Library IEEE ;
USE ieee.std_logic_1164.all;
Entity Test_MultArray_4bits IS
PORT(
	SW: IN STD_LOGIC_VECTOR(7 downto 0);
	HEX0: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX1: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX2: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX3: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END Test_MultArray_4bits;
ARCHITECTURE Behavior  OF Test_MultArray_4bits IS
	COMPONENT MultArray_4bits
	PORT(
		A, B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		P: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
	END COMPONENT;
	COMPONENT Decod7Seg
		PORT (
	c: IN STD_LOGIC_VECTOR(3 downto 0);
	s: OUT STD_LOGIC_VECTOR(6 downto 0)); 
	END COMPONENT;
	SIGNAL result : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN

	decA : Decod7Seg PORT MAP(c=>SW(7 DOWNTO 4), s=>HEX0);
	decB : Decod7Seg PORT MAP(c=>SW(3 DOWNTO 0), s=>HEX1);
	
	mult : MultArray_4bits PORT MAP(A=>SW(7 DOWNTO 4), B=>SW(3 DOWNTO 0),P=>result);

	decS1 : Decod7Seg PORT MAP(c=>result(3 DOWNTO 0), s=>HEX2);
	decS2 : Decod7Seg PORT MAP(c=>result(7 DOWNTO 4), s=>HEX3);
END Behavior;