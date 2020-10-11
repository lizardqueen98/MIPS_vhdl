
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:07:34 05/16/2019
-- Design Name:   DATAPATH
-- Module Name:   C:/Users/nadij/lab2222/testnajnoviji.vhd
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

ENTITY testnajnoviji_vhd IS
END testnajnoviji_vhd;

ARCHITECTURE behavior OF testnajnoviji_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT DATAPATH
	PORT(
		Clk : IN std_logic       
		);
	END COMPONENT;

	--Inputs
	SIGNAL Clk :  std_logic := '0';

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: DATAPATH PORT MAP(
		Clk => Clk
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
