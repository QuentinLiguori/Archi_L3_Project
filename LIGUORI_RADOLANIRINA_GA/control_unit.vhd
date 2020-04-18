Library IEEE ;
USE ieee.std_logic_1164.all;
Entity control_unit IS
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
END control_unit;

ARCHITECTURE Behavior  OF control_unit IS

COMPONENT demux IS
PORT(
	I: IN std_logic_vector(0 TO 2);
	O: OUT std_logic_vector(0 TO 7)
);
END COMPONENT;

Signal current_state: Integer;
Signal next_state, choice_next_state: Integer;
Signal RXin: std_logic_vector(0 TO 7);
Signal demux_in: std_logic_vector(0 TO 2);
Signal demux_out: std_logic_vector(0 TO 7);

BEGIN
		demux0: demux port map(I=>demux_in, O=>demux_out);
		
		--allows to choose next state from state 2 depending on the operation
	with instruction(0 TO 2) select
		choice_next_state <= 3 when "000",
					4 when "001",
					7 when "010",
					9 when "011",
					13 when "100",
					11 when "101",
					7 when "110",
					2 when OTHERS;
	
	--transition function
	Transition_function : PROCESS(current_state, instruction, run)
	BEGIN
		if run='1' then
			case current_state is
				when 0 =>
					next_state <= 1;
				when 1 =>
					next_state <= 2;
				when 2 =>
					next_state <= choice_next_state;
				when 3 =>
					next_state <= 1;
				when 4 =>
					next_state <= 1;
				when 5 =>
					next_state <= 6;
				when 6 =>
					next_state <= 1;
				when 7 =>
					next_state <= 8;
				when 8 =>
					next_state <= 6;
				when 9 =>
					next_state <= 10;
				when 10 =>
					next_state <= 6;
				when 11 =>
					next_state <= 12;
				when 12 =>
					next_state <= 6;
				when 13 =>
					next_state <= 14;
				when 14 =>
					next_state <= 6;
				when OTHERS => NULL;
			end case;
		end if;
	END Process;
	
	--state register function
	Register_function : PROCESS(reset, clock)
	BEGIN
		if reset = '1' then
			current_state <= 0;
		else
			if (clock'event and clock = '1') then
				current_state <= next_state;
			end if;
		end if;
	END Process;
	
	--generation function
	Generation_function : PROCESS(current_state, instruction,run,choice_next_state,demux_out)
	BEGIN
		--init : every output is 0
		Gout <= '0';
		DINout <= '0';
		Rout <= "00000000";
		IRin <= '0';
		Done <= '0';
		Rin <= "00000000";
		AddSub <= "000";
		Ain <= '0';
		Gin <= '0';
		
		if run='1' then
			case current_state is
				when 1 =>
					IRin <= '1';
					Done <= '1';
				when 2 =>
					IRin <= '0';
					Done <= '0';
				when 3 =>
					demux_in <= instruction(6 TO 8);
					Rout <= demux_out;
					demux_in <= instruction(3 TO 5);
					Rin <= demux_out;
					Done <= '1';
				when 4 =>
					DINout <= '1';
					demux_in <= instruction(3 TO 5);
					Rin <= demux_out;
					Done <= '1';
				when 5 =>
					demux_in <= instruction(3 TO 5);
					Rout <= demux_out;
					Gin <= '1';
					AddSub <= "100";
				when 6 =>	
					Gout <= '1';
					demux_in <= instruction(3 TO 5);
					Rin <= demux_out;
					Done <= '1';
				when 7 =>
					Ain <= '1';
					demux_in <= instruction(3 TO 5);
					Rout <= demux_out;
				when 8 =>
					demux_in <= instruction(6 TO 8);
					Rout <= demux_out;
					Gin <= '1';
					AddSub <= "010";
				when 9 =>
					Ain <= '1';
					demux_in <= instruction(3 TO 5);
					Rout <= demux_out;					
				when 10 =>
					demux_in <= instruction(6 TO 8);
					Rout <= demux_out;
					Gin <= '1';
					AddSub <= "011";
				when 11 =>
					Ain <= '1';
					demux_in <= instruction(3 TO 5);
					Rout <= demux_out;
				when 12 =>
					demux_in <= instruction(6 TO 8);
					Rout <= demux_out;
					Gin <= '1';
					AddSub <= "101";
				when 13 =>
					Ain <= '1';
					demux_in <= instruction(3 TO 5);
					Rout <= demux_out;
				when 14 =>
					demux_in <= instruction(6 TO 8);
					Rout <= demux_out;
					Gin <= '1';
					AddSub <= "110";
				when OTHERS => NULL;
			end case;
		end if;
	END Process;	
END Behavior;