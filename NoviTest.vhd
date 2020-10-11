
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:09:55 05/13/2019
-- Design Name:   DATAPATH
-- Module Name:   C:/Users/nadij/lab2222/NoviTest.vhd
-- Project Name:  lab2222
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DATAPATH
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends 
-- that these types always be used for the top-level I/O of a design in order 
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY NoviTest_vhd IS
END NoviTest_vhd;

ARCHITECTURE behavior OF NoviTest_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT DATAPATH
	PORT(
		Clk : IN std_logic;          
		addrs : OUT std_logic_vector(31 downto 0);
		instr : OUT std_logic_vector(31 downto 0);
		prosirena_vrijednost : OUT std_logic_vector(31 downto 0);
		s_jump : OUT std_logic;
		s_branch : OUT std_logic;
		s_mem_read : OUT std_logic;
		s_mem_to_reg : OUT std_logic;
		s_mem_write : OUT std_logic;
		s_alu_src : OUT std_logic;
		s_alu_op : OUT std_logic_vector(1 downto 0);
		s_read_data1 : OUT std_logic_vector(31 downto 0);
		s_read_data2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL Clk :  std_logic := '0';

	--Outputs
	SIGNAL addrs :  std_logic_vector(31 downto 0);
	SIGNAL instr :  std_logic_vector(31 downto 0);
	SIGNAL prosirena_vrijednost :  std_logic_vector(31 downto 0);
	SIGNAL s_jump :  std_logic;
	SIGNAL s_branch :  std_logic;
	SIGNAL s_mem_read :  std_logic;
	SIGNAL s_mem_to_reg :  std_logic;
	SIGNAL s_mem_write :  std_logic;
	SIGNAL s_alu_src :  std_logic;
	SIGNAL s_alu_op :  std_logic_vector(1 downto 0);
	SIGNAL s_read_data1 :  std_logic_vector(31 downto 0);
	SIGNAL s_read_data2 :  std_logic_vector(31 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: DATAPATH PORT MAP(
		Clk => Clk,
		addrs => addrs,
		instr => instr,
		prosirena_vrijednost => prosirena_vrijednost,
		s_jump => s_jump,
		s_branch => s_branch,
		s_mem_read => s_mem_read,
		s_mem_to_reg => s_mem_to_reg,
		s_mem_write => s_mem_write,
		s_alu_src => s_alu_src,
		s_alu_op => s_alu_op,
		s_read_data1 => s_read_data1,
		s_read_data2 => s_read_data2
	);

	tb : PROCESS
	BEGIN
         Clk<='1';
		wait for 100 ns;
			Clk<='0';
		wait for 100 ns;
			Clk<='1';
		wait for 100 ns;
			Clk<='0';
		wait for 100 ns;
			Clk<='1';
		wait for 100 ns;
			Clk<='0';
		wait for 100 ns;
			Clk<='1';
		wait for 100 ns;
			Clk<='0';
		wait; 
	END PROCESS;

END;
