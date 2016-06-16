LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- index = (line * N) + (column * M)

-- controlador do mapa do jogo
ENTITY make_map IS
    -- DImensões do mapa
    GENERIC (N : INTEGER := 10;
             M : INTEGER := 10);
          -- clock do jogo
    PORT (clock      : IN STD_LOGIC;
          -- posicao para a qual a cobra deve virar
          snake_turn : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
          -- direcao para a qual a cobra esta movendo
		  snake_dir  : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
          -- nova posicao da comida
          food_pos   : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
          -- tamanho atual da cobra (pontuacao)
          snake_size : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
          -- mapa do jogo
          gmap       : BUFFER STD_LOGIC_VECTOR(N*M DOWNTO 0)
          -- posicao da cabeca da cobra
          snake_head : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END make_map;

ARCHITECTURE Behavior OF make_mape IS
	TYPE table IS array(0 to N-1, 0 to M-1) OF STD_LOGIC;
	SIGNAL table : game_map;
	
	SIGNAL snake : INTEGER RANGE 0 to N*M;

BEGIN

	PROCESS (clock, snake_turn, food_pos, snake_size) 
	BEGIN
	
	IF (clock'EVENT and clock = '1') THEN
		
	
	END PROCESS;

END Behavior;