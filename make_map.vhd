LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- divisor do clock para o jogo
ENTITY make_map IS
    -- DImensões do mapa
    GENERIC (N : INTEGER := 10;
             M : INTEGER := 10);
          -- clock do jogo
    PORT (clock      : IN STD_LOGIC;
          -- posicao para a qual a cobra deve virar
          snake_turn : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
          -- nova posicao da comida
          food_pos   : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
          -- tamanho atual da cobra (pontuacao)
          snake_size : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
          -- mapa do jogo
          gmap       : BUFFER STD_LOGIC_VECTOR(N*M DOWNTO 0)
          -- posicao da cabeca da cobra
          snake_head : OUT STD_LOGIC_VECTOR(8 DOWNTO 0));
END make_map;
