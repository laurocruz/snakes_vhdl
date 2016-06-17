LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std;

-- tamanho da cobra
ENTITY size_counter IS
-- DImensões do mapa
    GENERIC (N : INTEGER := 10;
             M : INTEGER := 10);
    PORT (eaten      : IN STD_LOGIC;
          snake_size : BUFFER  INTEGER RANGE 0 TO N*M);
END size_counter;

ARCHITECTURE Behavior OF size_counter IS

BEGIN
	PROCESS(eaten)
		IF (eaten'EVENT and eaten = 1) THEN
			snake_size <= snake_size + 1;
		END IF;
	END PROCESS;

END Behavior;
