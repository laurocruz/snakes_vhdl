LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- divisor do clock para o jogo
ENTITY size_counter IS
    PORT (eaten      : IN STD_LOGIC;
          snake_size : OUT STD_LOGIC(8 DOWNTO 0));
END size_counter;
