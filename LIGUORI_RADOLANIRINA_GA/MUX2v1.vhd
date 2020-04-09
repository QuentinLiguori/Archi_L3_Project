Library IEEE;
USE ieee.std_logic_1164.all;

ENTITY MUX2v1 IS
PORT ( 
x,y,s : IN STD_LOGIC;
m : OUT STD_LOGIC); -- red LEDs
END MUX2v1;
ARCHITECTURE Behavior OF MUX2v1 IS
BEGIN
m <= (NOT (s) AND x) OR (s AND y);

END Behavior ;