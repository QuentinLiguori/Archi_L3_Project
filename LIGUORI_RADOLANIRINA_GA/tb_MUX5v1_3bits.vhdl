library ieee;
use ieee.std_logic_1164.all;

entity tb_MUX5v1_3bits is 
end entity;

architecture arch of tb_MUX5v1_3bits is

--declare component under test
component MUX5v1_3bits is 
port(
	S : in std_logic_vector(2 downto 0);
	U,V,W,X,Y : in std_logic_vector(2 downto 0);
	M : out std_logic_vector(2 downto 0)
);
end component;

--Declare signals 
Signal S_s : std_logic_vector(2 downto 0);
Signal U_s,V_s,W_s,X_s,Y_s : std_logic_vector(2 downto 0);
Signal M_s : std_logic_vector(2 downto 0);

Begin 

--Component mapping
UUT_i : MUX5v1_3bits 
port map (
	S  => S_s,
	U => U_s,V => V_s,W=>W_s,X=>X_s,Y=>Y_s,
	M => M_s
);


Process
begin
U_s<="001";
V_s<="010";
W_s<="011";
X_s<="101";
Y_s<="111";
S_s<="000";
wait for 20 ns;

S_s<="001";
wait for 20 ns;

S_s<="010";
wait for 20 ns;

S_s<="011";
wait for 20 ns;

S_s<="100";
wait for 20 ns;

S_s<="101";
wait for 20 ns;

S_s<="110";
wait for 20 ns;

S_s<="111";
wait;
end process;

end arch;