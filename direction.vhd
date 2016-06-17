LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- define dire��o para qual a cobra deve virar
ENTITY direction IS
          -- tecla pressionada no teclado
    PORT (key : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
          -- Lado para o qual a cobra deve virar
          way : OUT STD_LOGIC);
END direction;

ARCHITECTURE Behavior OF direction IS
BEGIN
	PROCESS(key(0), key(1))
	BEGIN
        IF (key(0)'EVENT and key(0) = '1') THEN
            way <= '0';
        END IF;

        IF (key(1)'EVENT and key(1) = '1') THEN
            way <= '1';
        END IF;
	END PROCESS;
END Behavior;
