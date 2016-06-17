LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- gera o sinal de quando a comida e comida pela cobra
ENTITY check_food IS
          -- Posicao da comida no mapa
    PORT (food_pos   : IN INTEGER;
          -- Posicao da cabeca da cobra no mapa
          snake_head : IN INTEGER;
          -- Bit informando se a comida foi ou não comida
          eaten      : OUT STD_LOGIC);
END check_food;

ARCHITECTURE Behavior OF direction IS
BEGIN
	eaten <= '1' WHEN food_pos = snake_head ELSE '0';
END Behavior;
