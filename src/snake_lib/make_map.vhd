LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY snake_lib;
USE snake_lib.snake_pack.all;

-- controlador do mapa do jogo
ENTITY make_map IS
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
END make_map;

ARCHITECTURE Behavior OF make_map IS
    -- Vetor de estruturas de dois inteiros que representam a posição de cada parte da cobra (l,c)
    --TYPE snake_body IS array (0 to N*M-1) OF INTEGER RANGE 0 TO N*M-1;
    --SIGNAL snake : snake_body;

    SIGNAL snake : int_array;

    SIGNAL dir_s : STD_LOGIC_VECTOR(1 DOWNTO 0);

    SIGNAL oldsize : INTEGER RANGE 0 TO N*M := INITIAL_SIZE;

BEGIN

    snake_body <= snake;

    dir_s <= dir;

	PROCESS (clock, reset, eaten)
        VARIABLE j : INTEGER RANGE 0 TO N*M;
		  VARIABLE DIF : INTEGER RANGE 0 TO M;
        --VARIABLE index : INTEGER RANGE 0 TO N*M;
        --VARIABLE map_s : STD_LOGIC_VECTOR(0 TO N*M-1);
	BEGIN

        IF (reset = '1') THEN
            oldsize <= INITIAL_SIZE;

            FOR i in 0 to INITIAL_SIZE-1 LOOP
                snake(i) <= (N/2) + (i+M/2)*M;
            END LOOP;

            FOR i in INITIAL_SIZE to N*M-1 LOOP
				snake(i) <= -1;
			END LOOP;
			
		ELSIF (eaten = '1') THEN
			DIF := snake(snake_size-1) - snake(snake_size-2);
			snake(snake_size) <= snake(snake_size-1) + DIF;

		ELSIF (clock'EVENT and clock = '1') THEN

			j := 0;
			WHILE (j+1 < M*N and not(snake(j+1) = -1)) LOOP
				snake(j+1) <= snake(j);
				j := j + 1;
			END LOOP;

            --FOR i IN 0 TO snake_size-2 LOOP
            --    snake(i+1) <= snake(i);
            --END LOOP;

            IF (dir_s = "00") THEN
                snake(0) <= snake(0) + M;
            ELSIF (dir_s = "01") THEN
                snake(0) <= snake(0) + 1;
            ELSIF (dir_s = "10") THEN
                snake(0) <= snake(0) - 1;
            ELSE
                snake(0) <= snake(0) - M;
            END IF;

			--map_s := (OTHERS => '0');

			--j := 0;
			--WHILE (j < M*N and not(snake(j) = -1)) LOOP
			--	index := snake(j);
			--	map_s(index) := '1';
			--	j := j + 1;
			--END LOOP;
		END IF;
		--gmap <= map_s;
	END PROCESS;

END Behavior;
