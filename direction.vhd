LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- define direção para qual a cobra deve virar
ENTITY direction IS
          -- tecla pressionada no teclado
    PORT (key : IN STD_LOGIC(5 DOWNTO 0);
          -- Lado para o qual a cobra deve virar
          way : OUT STD_LOGIC(1 DOWNTO 0));
END direction;

ARCHITECTURE Behavior OF direction IS
BEGIN
	PROCESS(key)
	BEGIN
		CASE key IS
			WHEN "xxxxxx" => way <= "00";
			WHEN "xxxxxx" => way <= "01";
			WHEN "xxxxxx" => way <= "10";
			WHEN "xxxxxx" => way <= "11";
		END CASE;
	END PROCESS;
END Behavior;
