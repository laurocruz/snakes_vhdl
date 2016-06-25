-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "06/24/2016 15:25:11"

-- 
-- Device: Altera EP2C20F484C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
LIBRARY STD;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE STD.STANDARD.ALL;

ENTITY 	demo_size_counter IS
    PORT (
	reset : IN std_logic;
	snake_head : IN STD.STANDARD.integer range 0 TO 63;
	food_pos : IN STD.STANDARD.integer range 0 TO 63;
	snake_size : OUT STD.STANDARD.integer range 0 TO 64;
	eaten : OUT std_logic
	);
END demo_size_counter;

-- Design Ports Information
-- snake_size[0]	=>  Location: PIN_G6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- snake_size[1]	=>  Location: PIN_C2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- snake_size[2]	=>  Location: PIN_C1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- snake_size[3]	=>  Location: PIN_D3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- snake_size[4]	=>  Location: PIN_D1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- snake_size[5]	=>  Location: PIN_F4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- snake_size[6]	=>  Location: PIN_D2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- eaten	=>  Location: PIN_H9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- reset	=>  Location: PIN_M1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- snake_head[0]	=>  Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- snake_head[1]	=>  Location: PIN_C9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- food_pos[1]	=>  Location: PIN_D7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- food_pos[0]	=>  Location: PIN_F8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- snake_head[2]	=>  Location: PIN_E4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- snake_head[3]	=>  Location: PIN_E3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- food_pos[3]	=>  Location: PIN_D6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- food_pos[2]	=>  Location: PIN_D5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- snake_head[4]	=>  Location: PIN_E7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- snake_head[5]	=>  Location: PIN_G8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- food_pos[5]	=>  Location: PIN_C7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- food_pos[4]	=>  Location: PIN_H8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF demo_size_counter IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_snake_head : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_food_pos : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_snake_size : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_eaten : std_logic;
SIGNAL \reset~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \size_counter1|Equal0~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \size_counter1|Equal0~2_combout\ : std_logic;
SIGNAL \size_counter1|Equal0~1_combout\ : std_logic;
SIGNAL \size_counter1|Equal0~0_combout\ : std_logic;
SIGNAL \size_counter1|Equal0~combout\ : std_logic;
SIGNAL \size_counter1|Equal0~clkctrl_outclk\ : std_logic;
SIGNAL \size_counter1|size[0]~18_combout\ : std_logic;
SIGNAL \reset~combout\ : std_logic;
SIGNAL \reset~clkctrl_outclk\ : std_logic;
SIGNAL \size_counter1|size[1]~6_combout\ : std_logic;
SIGNAL \size_counter1|size[1]~7\ : std_logic;
SIGNAL \size_counter1|size[2]~8_combout\ : std_logic;
SIGNAL \size_counter1|size[2]~9\ : std_logic;
SIGNAL \size_counter1|size[3]~10_combout\ : std_logic;
SIGNAL \size_counter1|size[3]~11\ : std_logic;
SIGNAL \size_counter1|size[4]~12_combout\ : std_logic;
SIGNAL \size_counter1|size[4]~13\ : std_logic;
SIGNAL \size_counter1|size[5]~14_combout\ : std_logic;
SIGNAL \size_counter1|size[5]~15\ : std_logic;
SIGNAL \size_counter1|size[6]~16_combout\ : std_logic;
SIGNAL \snake_head~combout\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \food_pos~combout\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \size_counter1|size\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \size_counter1|ALT_INV_size\ : std_logic_vector(1 DOWNTO 1);

BEGIN

ww_reset <= reset;
ww_snake_head <= IEEE.STD_LOGIC_ARITH.CONV_STD_LOGIC_VECTOR(snake_head, 6);
ww_food_pos <= IEEE.STD_LOGIC_ARITH.CONV_STD_LOGIC_VECTOR(food_pos, 6);
snake_size <= IEEE.STD_LOGIC_ARITH.CONV_INTEGER(UNSIGNED(ww_snake_size));
eaten <= ww_eaten;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\reset~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \reset~combout\);

\size_counter1|Equal0~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \size_counter1|Equal0~combout\);
\size_counter1|ALT_INV_size\(1) <= NOT \size_counter1|size\(1);

-- Location: PIN_D7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\food_pos[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_food_pos(1),
	combout => \food_pos~combout\(1));

-- Location: PIN_D6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\food_pos[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_food_pos(3),
	combout => \food_pos~combout\(3));

-- Location: PIN_H8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\food_pos[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_food_pos(4),
	combout => \food_pos~combout\(4));

-- Location: PIN_G8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\snake_head[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_snake_head(5),
	combout => \snake_head~combout\(5));

-- Location: PIN_E7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\snake_head[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_snake_head(4),
	combout => \snake_head~combout\(4));

-- Location: PIN_C7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\food_pos[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_food_pos(5),
	combout => \food_pos~combout\(5));

-- Location: LCCOMB_X8_Y26_N16
\size_counter1|Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \size_counter1|Equal0~2_combout\ = (\food_pos~combout\(4) & (\snake_head~combout\(4) & (\snake_head~combout\(5) $ (!\food_pos~combout\(5))))) # (!\food_pos~combout\(4) & (!\snake_head~combout\(4) & (\snake_head~combout\(5) $ (!\food_pos~combout\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \food_pos~combout\(4),
	datab => \snake_head~combout\(5),
	datac => \snake_head~combout\(4),
	datad => \food_pos~combout\(5),
	combout => \size_counter1|Equal0~2_combout\);

-- Location: PIN_E3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\snake_head[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_snake_head(3),
	combout => \snake_head~combout\(3));

-- Location: PIN_D5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\food_pos[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_food_pos(2),
	combout => \food_pos~combout\(2));

-- Location: PIN_E4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\snake_head[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_snake_head(2),
	combout => \snake_head~combout\(2));

-- Location: LCCOMB_X1_Y24_N4
\size_counter1|Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \size_counter1|Equal0~1_combout\ = (\food_pos~combout\(3) & (\snake_head~combout\(3) & (\food_pos~combout\(2) $ (!\snake_head~combout\(2))))) # (!\food_pos~combout\(3) & (!\snake_head~combout\(3) & (\food_pos~combout\(2) $ (!\snake_head~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \food_pos~combout\(3),
	datab => \snake_head~combout\(3),
	datac => \food_pos~combout\(2),
	datad => \snake_head~combout\(2),
	combout => \size_counter1|Equal0~1_combout\);

-- Location: PIN_C9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\snake_head[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_snake_head(1),
	combout => \snake_head~combout\(1));

-- Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\snake_head[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_snake_head(0),
	combout => \snake_head~combout\(0));

-- Location: PIN_F8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\food_pos[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_food_pos(0),
	combout => \food_pos~combout\(0));

-- Location: LCCOMB_X9_Y26_N18
\size_counter1|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \size_counter1|Equal0~0_combout\ = (\food_pos~combout\(1) & (\snake_head~combout\(1) & (\snake_head~combout\(0) $ (!\food_pos~combout\(0))))) # (!\food_pos~combout\(1) & (!\snake_head~combout\(1) & (\snake_head~combout\(0) $ (!\food_pos~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \food_pos~combout\(1),
	datab => \snake_head~combout\(1),
	datac => \snake_head~combout\(0),
	datad => \food_pos~combout\(0),
	combout => \size_counter1|Equal0~0_combout\);

-- Location: LCCOMB_X9_Y26_N24
\size_counter1|Equal0\ : cycloneii_lcell_comb
-- Equation(s):
-- \size_counter1|Equal0~combout\ = LCELL((\size_counter1|Equal0~2_combout\ & (\size_counter1|Equal0~1_combout\ & \size_counter1|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \size_counter1|Equal0~2_combout\,
	datac => \size_counter1|Equal0~1_combout\,
	datad => \size_counter1|Equal0~0_combout\,
	combout => \size_counter1|Equal0~combout\);

-- Location: CLKCTRL_G9
\size_counter1|Equal0~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \size_counter1|Equal0~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \size_counter1|Equal0~clkctrl_outclk\);

-- Location: LCCOMB_X1_Y23_N28
\size_counter1|size[0]~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \size_counter1|size[0]~18_combout\ = !\size_counter1|size\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \size_counter1|size\(0),
	combout => \size_counter1|size[0]~18_combout\);

-- Location: PIN_M1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reset~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_reset,
	combout => \reset~combout\);

-- Location: CLKCTRL_G3
\reset~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset~clkctrl_outclk\);

-- Location: LCFF_X1_Y23_N29
\size_counter1|size[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \size_counter1|Equal0~clkctrl_outclk\,
	datain => \size_counter1|size[0]~18_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \size_counter1|size\(0));

-- Location: LCCOMB_X1_Y23_N10
\size_counter1|size[1]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \size_counter1|size[1]~6_combout\ = (\size_counter1|size\(1) & (!\size_counter1|size\(0) & VCC)) # (!\size_counter1|size\(1) & (\size_counter1|size\(0)))
-- \size_counter1|size[1]~7\ = CARRY((!\size_counter1|size\(1) & \size_counter1|size\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \size_counter1|size\(1),
	datab => \size_counter1|size\(0),
	datad => VCC,
	combout => \size_counter1|size[1]~6_combout\,
	cout => \size_counter1|size[1]~7\);

-- Location: LCFF_X1_Y23_N11
\size_counter1|size[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \size_counter1|Equal0~clkctrl_outclk\,
	datain => \size_counter1|size[1]~6_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \size_counter1|size\(1));

-- Location: LCCOMB_X1_Y23_N12
\size_counter1|size[2]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \size_counter1|size[2]~8_combout\ = (\size_counter1|size\(2) & (!\size_counter1|size[1]~7\)) # (!\size_counter1|size\(2) & ((\size_counter1|size[1]~7\) # (GND)))
-- \size_counter1|size[2]~9\ = CARRY((!\size_counter1|size[1]~7\) # (!\size_counter1|size\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \size_counter1|size\(2),
	datad => VCC,
	cin => \size_counter1|size[1]~7\,
	combout => \size_counter1|size[2]~8_combout\,
	cout => \size_counter1|size[2]~9\);

-- Location: LCFF_X1_Y23_N13
\size_counter1|size[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \size_counter1|Equal0~clkctrl_outclk\,
	datain => \size_counter1|size[2]~8_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \size_counter1|size\(2));

-- Location: LCCOMB_X1_Y23_N14
\size_counter1|size[3]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \size_counter1|size[3]~10_combout\ = (\size_counter1|size\(3) & (\size_counter1|size[2]~9\ $ (GND))) # (!\size_counter1|size\(3) & (!\size_counter1|size[2]~9\ & VCC))
-- \size_counter1|size[3]~11\ = CARRY((\size_counter1|size\(3) & !\size_counter1|size[2]~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \size_counter1|size\(3),
	datad => VCC,
	cin => \size_counter1|size[2]~9\,
	combout => \size_counter1|size[3]~10_combout\,
	cout => \size_counter1|size[3]~11\);

-- Location: LCFF_X1_Y23_N15
\size_counter1|size[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \size_counter1|Equal0~clkctrl_outclk\,
	datain => \size_counter1|size[3]~10_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \size_counter1|size\(3));

-- Location: LCCOMB_X1_Y23_N16
\size_counter1|size[4]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \size_counter1|size[4]~12_combout\ = (\size_counter1|size\(4) & (!\size_counter1|size[3]~11\)) # (!\size_counter1|size\(4) & ((\size_counter1|size[3]~11\) # (GND)))
-- \size_counter1|size[4]~13\ = CARRY((!\size_counter1|size[3]~11\) # (!\size_counter1|size\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \size_counter1|size\(4),
	datad => VCC,
	cin => \size_counter1|size[3]~11\,
	combout => \size_counter1|size[4]~12_combout\,
	cout => \size_counter1|size[4]~13\);

-- Location: LCFF_X1_Y23_N17
\size_counter1|size[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \size_counter1|Equal0~clkctrl_outclk\,
	datain => \size_counter1|size[4]~12_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \size_counter1|size\(4));

-- Location: LCCOMB_X1_Y23_N18
\size_counter1|size[5]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \size_counter1|size[5]~14_combout\ = (\size_counter1|size\(5) & (\size_counter1|size[4]~13\ $ (GND))) # (!\size_counter1|size\(5) & (!\size_counter1|size[4]~13\ & VCC))
-- \size_counter1|size[5]~15\ = CARRY((\size_counter1|size\(5) & !\size_counter1|size[4]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \size_counter1|size\(5),
	datad => VCC,
	cin => \size_counter1|size[4]~13\,
	combout => \size_counter1|size[5]~14_combout\,
	cout => \size_counter1|size[5]~15\);

-- Location: LCFF_X1_Y23_N19
\size_counter1|size[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \size_counter1|Equal0~clkctrl_outclk\,
	datain => \size_counter1|size[5]~14_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \size_counter1|size\(5));

-- Location: LCCOMB_X1_Y23_N20
\size_counter1|size[6]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \size_counter1|size[6]~16_combout\ = \size_counter1|size\(6) $ (\size_counter1|size[5]~15\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \size_counter1|size\(6),
	cin => \size_counter1|size[5]~15\,
	combout => \size_counter1|size[6]~16_combout\);

-- Location: LCFF_X1_Y23_N21
\size_counter1|size[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \size_counter1|Equal0~clkctrl_outclk\,
	datain => \size_counter1|size[6]~16_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \size_counter1|size\(6));

-- Location: PIN_G6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\snake_size[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \size_counter1|size\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_snake_size(0));

-- Location: PIN_C2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\snake_size[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \size_counter1|ALT_INV_size\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_snake_size(1));

-- Location: PIN_C1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\snake_size[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \size_counter1|size\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_snake_size(2));

-- Location: PIN_D3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\snake_size[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \size_counter1|size\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_snake_size(3));

-- Location: PIN_D1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\snake_size[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \size_counter1|size\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_snake_size(4));

-- Location: PIN_F4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\snake_size[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \size_counter1|size\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_snake_size(5));

-- Location: PIN_D2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\snake_size[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \size_counter1|size\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_snake_size(6));

-- Location: PIN_H9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\eaten~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \size_counter1|Equal0~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_eaten);
END structure;


