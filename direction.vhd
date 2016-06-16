LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- divisor do clock para o jogo
ENTITY direction IS
          -- tecla pressionada no teclado
    PORT (key : IN STD_LOGIC(5 DOWNTO 0);
          -- Lado para o qual a cobra deve virar
          way : OUT STD_LOGIC(1 DOWNTO 0));
END direction;
