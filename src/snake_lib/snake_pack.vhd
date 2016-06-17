LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.math_real.all;

COMPONENT conv_7seg IS
	PORT (digit : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;
		  seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0) ) ;
END COMPONENT;


COMPONENT create_food IS
    -- Altura e comprimento do mapa
    GENERIC (N : INTEGER := 10;
             M : INTEGER := 10);
    PORT (eaten : IN STD_LOGIC;
          snake_body : IN array (0 to N*M-1) OF INTEGER RANGE 0 TO N*M-1;
          snake_size : IN INTEGER RANGE 0 to N*M;
	      new_food : OUT INTEGER RANGE 0 TO N*M-1);
          -- Guarda no máximo 255
END COMPONENT;


COMPONENT gclock IS
    -- Frequencia de 1Hz
    -- clock do hardware
	PORT (CLOCK_27   : IN STD_LOGIC ;
		  reset      : IN STD_LOGIC ;
		  clock_out  : OUT STD_LOGIC) ;
END COMPONENT;


COMPONENT make_map IS
    -- DImensões do mapa
    GENERIC (N : INTEGER := 10;
             M : INTEGER := 10;
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
          snake_head : OUT INTEGER RANGE 0 TO N*M-1);

          snake_body : OUT array (0 to N*M-1) OF INTEGER RANGE 0 TO N*M-1;
END COMPONENT;


COMPONENT size_counter IS
-- DImensões do mapa
    GENERIC (N : INTEGER := 10;
             M : INTEGER := 10;
             INITIAL_SIZE : INTEGER := 2);
    PORT (reset      : IN STD_LOGIC;
          snake_head : IN INTEGER RANGE 0 TO N*M-1;
          food_pos   : IN INTEGER RANGE 0 TO N*M-1;
          snake_size : OUT  INTEGER RANGE 0 TO N*M;
          eaten      : OUT  STD_LOGIC);
END COMPONENT;

