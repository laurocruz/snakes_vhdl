LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY create_food IS
    -- Altura e comprimento do mapa
    GENERIC (N : INTEGER := 10;
             M : INTEGER := 10);
    PORT (eaten : IN STD_LOGIC;
          game_map : IN STD_LOGIC_VECTOR(N*M DOWNTO 0)
	      new_food : OUT STD_LOGIC_VECTOR(8 DOWNTO 0));
          -- Guarda no máximo 255
END create_food;
