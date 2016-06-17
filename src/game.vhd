LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.math_real.all;

LIBRARY snake_lib;
USE snake_lib.snake_pack.all;

ENTITY game IS
    -- Dimensões do mapa
    GENERIC (N : INTEGER := 10;
             M : INTEGER := 10);

    PORT (clock : IN STD_LOGIC;
          reset : IN STD_LOGIC;
          KEY   : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

          snake_size : OUT INTEGER RANGE 0 TO N*M;
          snake_body : OUT array (0 to N*M-1) OF INTEGER RANGE 0 TO N*M-1);
          food_pos   : OUT INTEGER RANGE 0 TO N*M-1;
END game;

ARCHITECTURE Behavior OF game IS
    SIGNAL eaten : STD_LOGIC;
    SIGNAL game_clock : STD_LOGIC;
    SIGNAL snake_head : INTEGER RANGE 0 TO M*N-1;
    SIGNAL snake_size_s : INTEGER RANGE 0 TO M*N;
    SIGNAL snake_body_s : array (0 to N*M-1) OF INTEGER RANGE 0 TO N*M-1;
    SIGNAL food_pos_s : INTEGER RANGE 0 TO M*N-1;


BEGIN

    food1: create_food PORT MAP(eaten => eaten,
                                snake_body => snake_body_s,
                                snake_size => snake_size_s,
                                new_food => food_pos_s);

    clock1: gclock PORT MAP(CLOCK_27 => clock,
                            reset => reset,
                            clock_out => game_clock);

    gmap1: make_map PORT MAP(clock => game_clock,
                             reset => reset,
                             snake_turn => KEY,
                             snake_size => snake_size_s,
                             snake_head => snake_head,
                             snake_body => snake_body_s);

    size1: size_counter PORT MAP(reset => reset,
                                 snake_head => snake_head,
                                 food_pos => food_pos_s,
                                 snake_size => snake_size_s,
                                 eaten => eaten);

    snake_size <= snake_size_s;
    snake_body <= snake_body_s;
    food_pos <= food_pos_s;

END Behavior;
