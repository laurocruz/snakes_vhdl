LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY snake_lib;
USE snake_lib.snake_pack.all;

-- controlador do mapa do jogo
ENTITY demo_make_map IS
    -- DImensões do mapa
    GENERIC (N : INTEGER := 8;
             M : INTEGER := 8;
             INITIAL_SIZE : INTEGER := 2);
          -- clock do jogo
    PORT (clock      : IN STD_LOGIC;

          -- reseta o jogo
          reset      : IN STD_LOGIC;

          -- posicao para a qual a cobra deve virar
          -- snake_turn(0) = 1 : horario
          -- snake_turn(1) = 1 : anti horario
          snake_turn : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

          -- tamanho atual da cobra (pontuacao)
          snake_size : IN INTEGER RANGE 0 TO N*M;

          -- posicao da cabeca da cobra
          snake_head : OUT INTEGER RANGE 0 TO N*M-1;
          
          dir        : OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
          
          --gmap : OUT STD_LOGIC_VECTOR(0 TO N*M-1));
END demo_make_map;

ARCHITECTURE Behavior OF demo_make_map IS
	SIGNAL snake_body : int_array;

BEGIN

	make_map1: make_map PORT MAP (clock, reset, snake_turn, snake_size, snake_head, snake_body, dir);

END Behavior;
