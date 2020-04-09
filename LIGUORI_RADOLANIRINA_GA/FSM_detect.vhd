Library IEEE ;
USE ieee.std_logic_1164.all;
Entity FSM_detect IS
PORT(
	w, resetn, setn, CLK: IN STD_LOGIC;
	state : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
	z: OUT STD_LOGIC);
END FSM_detect;
ARCHITECTURE Behavior  OF FSM_detect IS
COMPONENT FlipFlop_D
PORT(
	D: IN STD_LOGIC_VECTOR(8 downto 0);
	setn, resetn, CLK: IN STD_LOGIC;
	Q: OUT STD_LOGIC_VECTOR(8 downto 0)
	);
END COMPONENT;

SIGNAL etat_futur, etat_present : STD_LOGIC_VECTOR(8 downto 0);

BEGIN

	reg : FlipFlop_D PORT MAP(D => etat_futur, Q => etat_present, CLK => CLK, resetn=> resetn, setn => setn);

	etat_futur(0) <= '0';
	etat_futur(1) <= ((NOT (w)) AND (etat_present(0) OR etat_present(5) OR etat_present(6) OR etat_present(7) OR etat_present(8)));
	etat_futur(2) <= ((NOT (w)) AND etat_present(1));
	etat_futur(3) <= ((NOT (w)) AND etat_present(2));
	etat_futur(4) <= ((NOT (w)) AND (etat_present(3) OR etat_present(4)));
	etat_futur(5) <= ((w) AND (etat_present(0) OR etat_present(1) OR etat_present(2) OR etat_present(3) OR etat_present(4)));
	etat_futur(6) <= ((w) AND etat_present(5));
	etat_futur(7) <= ((w) AND etat_present(6));
	etat_futur(8) <= ((w) AND (etat_present(7) OR etat_present(8)));
	
	z <= (etat_present(4) OR etat_present(8));
	state <= etat_present;
END Behavior ;