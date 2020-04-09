Library IEEE ;
USE ieee.std_logic_1164.all;
Entity Top_Counter IS
PORT(
	SW0: IN STD_LOGIC;
	KEY: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	HEX0: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END Top_Counter;
ARCHITECTURE Behavior  OF Top_Counter IS
COMPONENT Decod7Seg is
PORT (
	c: IN STD_LOGIC_VECTOR(3 downto 0);
	s: OUT STD_LOGIC_VECTOR(6 downto 0)); 
END COMPONENT;
COMPONENT Compteur is
PORT (
	updown, aclr, clock: IN STD_LOGIC;
	q: OUT STD_LOGIC_VECTOR(3 downto 0)); 
END COMPONENT;

SIGNAL r: STD_LOGIC_VECTOR(3 downto 0);

BEGIN

comp : Compteur PORT MAP (updown=>SW0, clock=>KEY(0), aclr=>KEY(1), q=>r);

dec : Decod7Seg PORT MAP (c=>r, s=>HEX0);

END Behavior ;
