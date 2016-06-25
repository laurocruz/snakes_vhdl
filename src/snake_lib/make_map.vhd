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

          -- posicao para a qual a cobra deve virar
          -- snake_turn(0) = 1 : horario
          -- snake_turn(1) = 1 : anti horario
          snake_turn : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

          -- tamanho atual da cobra (pontuacao)
          snake_size : IN INTEGER RANGE 0 TO N*M;

          -- posicao da cabeca da cobra
          snake_head : OUT INTEGER RANGE 0 TO N*M-1;

          snake_body : OUT int_array;
          
          dir        : OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
          
          --gmap : OUT STD_LOGIC_VECTOR(0 TO N*M-1));
END make_map;

ARCHITECTURE Behavior OF make_map IS
    -- Vetor de estruturas de dois inteiros que representam a posição de cada parte da cobra (l,c)
    --TYPE snake_body IS array (0 to N*M-1) OF INTEGER RANGE 0 TO N*M-1;
    --SIGNAL snake : snake_body;

    SIGNAL snake : int_array;

    -- direcao para onde a cobra esta se movendo
    -- 11 : cima
    -- 00 : baixo
    -- 10 : esquerda
    -- 01 : direita
    SIGNAL dir_s : STD_LOGIC_VECTOR(1 DOWNTO 0) := "11";

    SIGNAL oldsize : INTEGER RANGE 0 TO N*M := INITIAL_SIZE;

BEGIN
    snake_head <= snake(0);

    snake_body <= snake;
    
    dir <= dir_s;

	PROCESS (clock, snake_turn, snake_size, reset)
        VARIABLE DIF : INTEGER RANGE 0 TO M;
        VARIABLE j : INTEGER RANGE 0 TO N*M;
        VARIABLE index : INTEGER RANGE 0 TO N*M;
        --VARIABLE map_s : STD_LOGIC_VECTOR(0 TO N*M-1);
	BEGIN
            
        IF (reset = '1') THEN
            dir_s <= "11";
            oldsize <= INITIAL_SIZE;

            FOR i in 0 to INITIAL_SIZE-1 LOOP
                snake(i) <= (N/2) + (i+M/2)*M;
            END LOOP;
            
            FOR i in INITIAL_SIZE to N*M-1 LOOP
				snake(i) <= -1;
			END LOOP;

        -- horario
        ELSIF (snake_turn(0) = '1') THEN
            IF (dir_s = "00") THEN
                dir_s <= "10";
            ELSIF (dir_s = "01") THEN
                dir_s <= "00";
            ELSIF (dir_s = "10") THEN
                dir_s <= "11";
            ELSE
                dir_s <= "01";
            END IF;

        -- anti-horario
        ELSIF (snake_turn(1) = '1') THEN
            IF (dir_s = "00") THEN
                dir_s <= "01";
            ELSIF (dir_s = "01") THEN
                dir_s <= "11";
            ELSIF (dir_s = "10") THEN
                dir_s <= "00";
            ELSE
                dir_s <= "10";
            END IF;

        ELSIF (snake_size > oldsize) THEN
            DIF := snake(oldsize-1) - snake(oldsize-2);
            snake(snake_size-1) <= snake(oldsize-1) + DIF;
            oldsize <= snake_size;
            
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
