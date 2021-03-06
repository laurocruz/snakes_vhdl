LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.math_real.all;

PACKAGE snake_pack IS

	--TYPE int_s IS INTEGER RANGE -20 TO 255;
	TYPE int_array IS array (0 to 127) OF INTEGER RANGE -20 TO 255;

	COMPONENT conv_7seg IS
		PORT (digit : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;
			  seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0) ) ;
	END COMPONENT;


	COMPONENT create_food IS
		-- Altura e comprimento do mapa
		GENERIC (N : INTEGER := 10;
				 M : INTEGER := 10;
				 width : INTEGER := 6);
		PORT (reset : IN STD_LOGIC;
			  eaten : IN STD_LOGIC;
			  gmap : IN STD_LOGIC_VECTOR(0 TO N*M-1);
			  new_food : OUT INTEGER RANGE 0 TO N*M-1);
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
				 
				 -- aumento do tamanho
				 eaten      : IN STD_LOGIC;
				 
				 snake_size : IN INTEGER RANGE 0 TO N*M;

				 -- direcao para onde a cobra esta se movendo
				 -- 11 : cima
				 -- 00 : baixo
				 -- 10 : esquerda
				 -- 01 : direita
				 dir        : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

				 -- posicoes da cobra no mapa
				 snake_body : OUT int_array);
	END COMPONENT;


	COMPONENT size_counter IS
	-- DImensões do mapa
		 GENERIC (N : INTEGER := 10;
					 M : INTEGER := 10;
					 INITIAL_SIZE : INTEGER := 2);
		 PORT (reset      : IN STD_LOGIC;
				 food_pos   : IN INTEGER RANGE -20 TO 255;
				 --food_pos   : IN INTEGER RANGE 0 TO N*M-1;
				 snake_head : IN INTEGER RANGE -20 TO 255;
				 snake_size : OUT  INTEGER RANGE 0 TO N*M;
				 eaten      : OUT  STD_LOGIC);
	END COMPONENT;


	COMPONENT colision IS
	-- Dimensoes do mapa
		GENERIC (N : INTEGER := 10;
				 M : INTEGER := 10);
		PORT (snake_body : IN int_array;
			  dir        : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			  reset      : IN STD_LOGIC;
			  gmap       : OUT STD_LOGIC_VECTOR(0 to N*M-1);
			  lost       : OUT STD_LOGIC);
	END COMPONENT ;

	COMPONENT snake_dir IS
		PORT (reset : IN STD_LOGIC;
			  snake_turn : IN STD_LOGIC_VECTOR(1 downto 0);
			  dir : BUFFER STD_LOGIC_VECTOR(0 to 1));
	END COMPONENT;

END snake_pack;
