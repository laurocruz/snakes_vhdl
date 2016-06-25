LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.NUMERIC_STD.all;

LIBRARY snake_lib;
USE snake_lib.snake_pack.all;

ENTITY create_food IS
    -- Altura e comprimento do mapa
    GENERIC (N : INTEGER := 10;
             M : INTEGER := 10;
             width : INTEGER := 6);
    PORT (reset : IN STD_LOGIC;
			 eaten : IN STD_LOGIC;
          gmap  : IN STD_LOGIC_VECTOR(0 TO N*M-1);
	      new_food : OUT INTEGER RANGE 0 TO N*M-1);
          -- Guarda no máximo 255
END create_food;
------------------------------------------------------------------------------------------------------------

ARCHITECTURE Behavior of create_food is

BEGIN

	process(eaten,reset)
		variable rand_temp : std_logic_vector(width-1 downto 0):=(width-1 => '1',others => '0');
		variable temp : std_logic := '0';
		variable num  : integer range 0 to 2**width := 0;
		--variable conflict : std_logic;
	begin
	
		if (reset = '1') then
			temp := rand_temp(width-1) xor rand_temp(width-2);
			rand_temp(width-1 downto 1) := rand_temp(width-2 downto 0);
			rand_temp(0) := temp;
			num := to_integer(unsigned(rand_temp));
		elsif(rising_edge(eaten)) then
			temp := rand_temp(width-1) xor rand_temp(width-2);
			rand_temp(width-1 downto 1) := rand_temp(width-2 downto 0);
			rand_temp(0) := temp;
			num := to_integer(unsigned(rand_temp));
			--WHILE (gmap(num) = '1') LOOP
			--	temp := rand_temp(width-1) xor rand_temp(width-2);
			--	rand_temp(width-1 downto 1) := rand_temp(width-2 downto 0);
			--	rand_temp(0) := temp;
			--	num := to_integer(unsigned(rand_temp));
			--END LOOP;
		END IF;
		
		new_food <= num;
	END PROCESS;

END Behavior;

-------------------------------------------------------------------------------------------------------------
