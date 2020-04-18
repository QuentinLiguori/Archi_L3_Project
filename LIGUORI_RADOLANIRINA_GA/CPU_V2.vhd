LIBRARY ieee; USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY CPU_V2 IS
PORT (
	Clock, Run, Reset: IN std_logic;
	DIN: IN std_logic_vector(0 TO 15);
	Done: BUFFER std_logic;
	
	Overflow: OUT std_logic;
	State: OUT Integer;
	OPPrint: OUT std_logic_vector(0 TO 2);
	addPrint: OUT std_logic_vector(0 TO 15);
	R0, R1, R2, R3 : OUT std_logic_vector(0 TO 15)
);
END CPU_V2;

ARCHITECTURE Behavior OF CPU_V2 IS

Component control_unit IS
PORT(
	--Input
	instruction: IN STD_LOGIC_VECTOR(0 TO 8);
	run, reset, clock: IN STD_LOGIC;
	
	--Output to mux_proc
	Gout: OUT std_logic;
	DINout: OUT std_logic;
	Rout: OUT std_logic_vector(0 TO 7);
	
	--Output to register bench
	Rin: OUT std_logic_vector(0 TO 7);
	
	--Output to instruction register
	IRin: OUT std_logic;
	
	--Output of the processor
	Done: OUT std_logic;
	
	--Output to ALU
	AddSub: OUT std_logic_vector(0 TO 2);
	
	--Output to A register
	Ain: OUT std_logic;
	
	--Output to G register
	Gin: OUT std_logic
);
END Component;

Component Mux10v1 IS
PORT(
	--output on a 16-bit bus
	Bus_16bits:OUT std_logic_vector(0 TO 15);
	
	--input from the G register
	G: IN std_logic_vector(0 TO 15);
	
	--SEL on 10 bits : 8 registers, DIN, G
	Sel: IN std_logic_vector(0 TO 9);
	
	--input from the DIN 16-bit bus
	DIN: IN std_logic_vector(0 TO 15);
	
	--input from the bench of 8 registers
	R0: IN std_logic_vector(0 TO 15);
	R1: IN std_logic_vector(0 TO 15);
	R2: IN std_logic_vector(0 TO 15);
	R3: IN std_logic_vector(0 TO 15);
	R4: IN std_logic_vector(0 TO 15);
	R5: IN std_logic_vector(0 TO 15);
	R6: IN std_logic_vector(0 TO 15);
	R7: IN std_logic_vector(0 TO 15)
);
END Component;

Component ALU IS
	PORT(
		A,B : IN std_logic_vector(15 downto 0);
		Sel: IN std_logic_vector(2 downto 0);
		S: OUT std_logic_vector(15 downto 0);
		Overflow : OUT std_logic
	);
End Component;

Component RegNbits IS
	GENERIC(N: integer := 16);
PORT(
	--data entering the register
	D: IN std_logic_vector(N-1 DOWNTO 0);
	--clock and write signal sent by the control unit
	w, Clk: IN std_logic;
	--data exiting the register
	Q: OUT std_logic_vector(N-1 DOWNTO 0)
	);
End Component;
Component RegInstru IS
	GENERIC(N: integer := 9);
PORT(
	--data entering the register
	D: IN std_logic_vector(N-1 DOWNTO 0);
	--clock and write signal sent by the control unit
	w, Clk: IN std_logic;
	--data exiting the register
	Q: OUT std_logic_vector(N-1 DOWNTO 0)
	);

End Component;
Component Bench8Reg IS
	GENERIC(N: integer :=16);--VALEUR PAR DEFAUT 16
PORT(
	DRin: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	Rkin: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0); 
	Clk: IN STD_LOGIC);
END Component;


TYPE R_type IS ARRAY(0 to 7) OF std_logic_vector(0 to 15);
signal R : R_type;
Signal A, G, G_in, Add: std_logic_vector(0 TO 15);
Signal B_s: std_logic_vector(0 TO 15);
Signal IR: std_logic_vector(0 TO 8);
Signal Sel: std_logic_vector(0 TO 9);
Signal RSel: std_logic_vector(0 TO 2);
Signal Cout: std_logic;
Signal Sel_G :  std_logic;
Signal Sel_DIN :  std_logic;
Signal wR :  std_logic_vector(0 to 7);
Signal wG :  std_logic;
Signal Sel_reg :  std_logic_vector(0 to 7);
Signal Sel_op :  std_logic_vector(0 to 2);
Signal wA :  std_logic;
Signal RI_in: std_logic;
Signal Bus_16bits :  std_logic_vector(0 to 15);
Signal instruction:  std_logic_vector(0 TO 8);

BEGIN
	control_unit0: control_unit port map(	
					--input
					instruction => instruction,
					run => run,
					reset => reset,
					clock => clock,
					--output to mux
					Gout => Sel_G,
					DINout => Sel_DIN,
					Rout => Sel_reg,
					--output to register bench
					Rin => wR,
					--output to instruction register
					IRin => RI_in,
					--output of the processor
					Done => Done,
					--output to ALU
					AddSub => Sel_op,
					--output to A register
					Ain => wA,
					--output to G register
					Gin => wG
				);
				
	
	Sel(2 to 9) <= Sel_reg;
	Sel(0) <= Sel_G;
	Sel(1) <= Sel_DIN;
	mux0: Mux10v1 port map(
		--output on a 16-bit bus
		Bus_16bits => Bus_16bits,
		--input from the G register
		G => G,
		--SEL on 10 bits : 8 registers, DIN, G
		Sel => Sel,
		--input from the DIN 16-bit bus
		DIN => DIN,
		--input from the bench of 8 registers
		R0 => R(0),
		R1 => R(1),
		R2 => R(2),
		R3 => R(3),
		R4 => R(4),
		R5 => R(5),
		R6 => R(6),
		R7 => R(7)
	);
	
	benchreg0: Bench8Reg port map(
	DRin=>B_s,
	Rkin=>wR,
	R0out=>R(0),
	R1out=>R(1),
	R2out=>R(2), 
	R3out=>R(3),
	R4out=>R(4),
	R5out=>R(5),
	R6out=>R(6),
	R7out =>R(7),
	Clk=>clock);
	
	
	

	alu0: ALU port map(
			A => A,
			B => Bus_16bits,
			Sel => Sel_op,
			S => G_in,
			Overflow => Overflow
	);
	
	
	regA: RegNbits port map(D=>Bus_16bits, w=>wA, Clk=>Clock, Q=>A);
	regG: RegNbits port map(D=>G_in, w=>wG, Clk=>Clock, Q=>G);
	
	
	ir0: RegInstru port map(D=>DIN(0 TO 8), w=>RI_in, Clk=>Clock, Q=>instruction);
	R0 <= R(0);
	R1 <= R(1);
	R2 <= R(2);
	R3 <= R(3);
END Behavior;