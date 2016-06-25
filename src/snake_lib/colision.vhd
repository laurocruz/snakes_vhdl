LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std;

LIBRARY snake_lib;
USE snake_lib.snake_pack.all;

ENTITY colision IS
-- DImensões do mapa
    GENERIC (N : INTEGER := 10;
             M : INTEGER := 10);
    PORT (snake_body : IN int_array;
          dir        : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		  reset      : IN STD_LOGIC;
          gmap       : OUT STD_LOGIC_VECTOR(0 to N*M-1);
          lost       : OUT STD_LOGIC);
END colision;

ARCHITECTURE Behavior OF colision IS
BEGIN

	PROCESS(snake_body(0)) 
		variable i : integer range 0 to 255;
		variable index : integer range 0 to M*N;
		variable outl : STD_LOGIC;
	BEGIN
		i := 1;
		outl := '0';
		WHILE (i < N*M and not(snake_body(i) = -1) and outl = '0') LOOP
			IF (snake_body(0) = snake_body(i)) THEN
				outl := '1';
			END IF;
			i := i + 1;
		END LOOP;
		
		IF (outl = '0') THEN
			IF (dir = "00") THEN
				IF (snake_body(0) > M*N-1) THEN
					outl := '1';
				END IF;
			ELSIF (dir = "01") THEN
				IF (snake_body(0) mod M = 0 and snake_body(1) mod M = (M-1)) THEN
					outl := '1';
				END IF;
			ELSIF (dir = "10") THEN
				IF (snake_body(0) mod M = (M-1) and snake_body(1) mod M = 0) THEN
					outl := '1';
				END IF;
			ELSE
				IF (snake_body(0) < 0) THEN
					outl := '1';
				END IF;		
			END IF;
		END IF;
		
		IF (outl = '0') THEN
			i := 0;
			WHILE (i < M*N and not(snake_body(i) = -1)) LOOP
				index := snake_body(i);
				gmap(index) <= '1';
				i := i + 1;
			END LOOP;
		END IF;
	
		lost <= outl;
	END PROCESS;

END Behavior;
