
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:15:45 04/29/2019
-- Design Name:   DATAPATH
-- Module Name:   C:/Xilinx92i/Lab5/TestMips.vhd
-- Project Name:  Lab5
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

ENTITY TestMips_vhd IS
END TestMips_vhd;

ARCHITECTURE behavior OF TestMips_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT DATAPATH
	PORT(
		Clk : IN std_logic;          
		addrs : OUT std_logic_vector(31 downto 0);
		instr : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL Clk :  std_logic := '0';

	--Outputs
	SIGNAL addrs :  std_logic_vector(31 downto 0);
	SIGNAL instr :  std_logic_vector(31 downto 0);

BEGIN

	
	-- Instantiate the Unit Under Test (UUT)
	uut: DATAPATH PORT MAP(
		Clk => Clk,
		addrs => addrs,
		instr => instr
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
