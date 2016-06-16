LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- divisor do clock para o jogo
ENTITY gclock IS
    -- Periodo em segundos do clock
    GENERIC (T : INTEGER := 1);
    -- clock do hardware
    PORT (hclock : IN STD_LOGIC;
          clock : OUT STD_LOGIC);
END gclock;
