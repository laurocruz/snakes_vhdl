LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Mapa do jogo
ENTITY game_map IS
    -- DImensões do mapa
    GENERIC (N : INTEGER := 10;
             M : INTEGER := 10);
          -- Vetor de bits do mapa
    PORT (gmap : BUFFER STD_LOGIC_VECTOR(N*M DOWNTO 0);
          -- Posicao da cabeca da cobra
          snake_head : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END game_map;
