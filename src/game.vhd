LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.math_real.all;

LIBRARY snake_lib;
USE snake_lib.snake_pack.all;

ENTITY game IS
    -- Dimensões do mapa
    GENERIC (N : INTEGER := 10;
             M : INTEGER := 10;
				 INITIAL_SIZE : INTEGER := 2);

    PORT (clock : IN STD_LOGIC;
          reset : IN STD_LOGIC;
          KEY   : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

          snake_size : OUT INTEGER RANGE 0 TO N*M;
          gmap       : OUT STD_LOGIC_VECTOR(0 TO N*M-1);
          --snake_body : OUT int_array;
          food_pos   : OUT INTEGER RANGE 0 TO N*M-1);
END game;

ARCHITECTURE Behavior OF game IS
    SIGNAL eaten : STD_LOGIC;
    SIGNAL game_clock : STD_LOGIC;
    SIGNAL snake_size_s : INTEGER RANGE 0 TO M*N;
    SIGNAL snake_body_s : int_array;
    SIGNAL food_pos_s : INTEGER RANGE 0 TO M*N-1;
    SIGNAL gmap_s : STD_LOGIC_VECTOR(0 TO N*M-1);
    SIGNAL dir_s  : STD_LOGIC_VECTOR(0 to 1);
    SIGNAL lost_s : STD_LOGIC;

BEGIN

	food1: create_food
		GENERIC MAP (N,M)
		PORT MAP(eaten => eaten,
					gmap => gmap_s,
					snake_size => snake_size_s,
					new_food => food_pos_s);

	clock1: gclock
		PORT MAP(CLOCK_27 => clock,
					reset => reset or lost_s,
					clock_out => game_clock);

    gmap1: make_map
		GENERIC MAP(N,M,INITIAL_SIZE)
		PORT MAP(clock => game_clock,
					reset => reset or lost_s,
					eaten => eaten,
					snake_size => snake_size_s,
					dir => dir_s,
					snake_body => snake_body_s);

    dir_select1: snake_dir
        PORT MAP(reset => reset or lost_s,
                    snake_turn => KEY,
                    dir => dir_s);

	size1: size_counter
		GENERIC MAP(N,M,INITIAL_SIZE)
		PORT MAP(reset => reset or lost_s,
					food_pos => food_pos_s,
               snake_head => snake_body_s(0),
					snake_size => snake_size_s,
					eaten => eaten);

	colision1: colision
		GENERIC MAP(N,M)
		PORT MAP(snake_body => snake_body_s,
					dir => dir_s,
					reset => reset or lost_s,
					gmap => gmap_s,
					lost => lost_s);

	snake_size <= snake_size_s;
	gmap <= gmap_s;
	food_pos <= food_pos_s;

END Behavior;
