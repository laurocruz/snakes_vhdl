LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- controlador do mapa do jogo
ENTITY make_map IS
    -- DImensões do mapa
    GENERIC (N : INTEGER := 10;
             M : INTEGER := 10;
             INITIAL_SIZE : INTEGER := 5);
          -- clock do jogo
    PORT (clock      : IN STD_LOGIC;
          -- posicao para a qual a cobra deve virar
          -- snake_turn(0) = 1 : horario
          -- snake_turn(1) = 1 : anti horario
          snake_turn : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

          -- tamanho atual da cobra (pontuacao)
          snake_size : IN INTEGER RANGE 0 TO N*M;

          -- posicao da cabeca da cobra
          snake_head : OUT INTEGER RANGE 0 TO N*M-1);

          snake_body : OUT array (0 to N*M-1) OF INTEGER RANGE 0 TO N*M-1;
END make_map;

ARCHITECTURE Behavior OF make_map IS
    -- Vetor de estruturas de dois inteiros que representam a posição de cada parte da cobra (l,c)
    --TYPE snake_body IS array (0 to N*M-1) OF INTEGER RANGE 0 TO N*M-1;
    --SIGNAL snake : snake_body;

    SIGNAL snake : array (0 to N*M-1) OF INTEGER RANGE 0 TO N*M-1;

    -- direcao para onde a cobra esta se movendo
    -- 11 : cima
    -- 00 : baixo
    -- 10 : esquerda
    -- 01 : direita
    SIGNAL dir : STD_LOGIC_VECTOR(1 DOWNTO 0) := "11";

    SIGNAL oldsize : INTEGER RANGE 0 TO N*M := INITIAL_SIZE;

BEGIN
    snake_head <= snake(0);

    snake_body <= snake;

	PROCESS (clock, snake_turn, snake_size)
        VARIABLE DIF : INTEGER RANGE 0 TO M;
	BEGIN

        IF (clock'EVENT and clock = '1') THEN
            FOR i IN 0 TO snake_size-2 LOOP
                snake(i+1) <= snake(i);
            END LOOP;

            IF (dir = "00") THEN
                snake(0) <= snake(0) + M;
            ELSIF (dir = "01") THEN
                snake(0) <= snake(0) + 1;
            ELSIF (dir = "10") THEN
                snake(0) <= snake(0) - 1;
            ELSE
                snake(0) <= snake(0) - M;
            END IF;
        END IF;

        -- horario
        IF (snake_turn(0)'EVENT and snake_turn(0) = '1') THEN
            IF (dir = "00") THEN
                dir <= "10";
            ELSIF (dir = "01") THEN
                dir <= "00";
            ELSIF (dir = "10") THEN
                dir <= "11";
            ELSE
                dir <= "01";
            END IF;
        END IF;

        -- anti-horario
        IF (snake_turn(1)'EVENT and snake_turn(1) = '1') THEN
            IF (dir = "00") THEN
                dir <= "01";
            ELSIF (dir = "01") THEN
                dir <= "11";
            ELSIF (dir = "10") THEN
                dir <= "00";
            ELSE
                dir <= "10";
            END IF;
        END IF;

        IF (snake_size > oldsize) THEN
            DIF := snake(oldsize-1) - snake(oldsize-2);
            snake(snake_size-1) <= snake(oldsize-1) + DIF;
            oldsize <= snake_size;
        END IF;

	END PROCESS;

END Behavior;
