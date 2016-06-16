LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- divisor do clock para o jogo
ENTITY check_food IS
          -- Posicao da comida no mapa
    PORT (food_pos   : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
          -- Posicao da cabeca da cobra no mapa
          snake_head : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
          -- Bit informando se a comida foi ou não comida
          eaten      : OUT STD_LOGIC);
END check_food;
