Library IEEE ;
USE ieee.std_logic_1164.all;
Entity Decod7Seg_test IS
PORT(
	SW: IN STD_LOGIC_VECTOR(3 downto 0);
	HEX0: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END Decod7Seg_test;
ARCHITECTURE Behavior  OF Decod7Seg_test IS
COMPONENT Decod7Seg is
PORT (
	c: IN STD_LOGIC_VECTOR(3 downto 0);
	s: OUT STD_LOGIC_VECTOR(6 downto 0)); 
END COMPONENT;

BEGIN

dec0 : Decod7Seg PORT MAP(c=>SW, s=>HEX0);

END Behavior ;
