
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:00:16 05/27/2019
-- Design Name:   REGFILE
-- Module Name:   C:/Users/nadij/lab2222/regfiletest.vhd
-- Project Name:  lab2222
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: REGFILE
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

ENTITY regfiletest_vhd IS
END regfiletest_vhd;

ARCHITECTURE behavior OF regfiletest_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT REGFILE
	PORT(
		clk : IN std_logic;
		RegWrite : IN std_logic;
		regUlaz1 : IN std_logic_vector(4 downto 0);
		regUlaz2 : IN std_logic_vector(4 downto 0);
		regUlaz3izMuxa : IN std_logic_vector(4 downto 0);
		upisiURegistar : IN std_logic_vector(31 downto 0);          
		regIzlaz1 : OUT std_logic_vector(31 downto 0);
		regIzlaz2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL clk :  std_logic := '0';
	SIGNAL RegWrite :  std_logic := '0';
	SIGNAL regUlaz1 :  std_logic_vector(4 downto 0) := (others=>'0');
	SIGNAL regUlaz2 :  std_logic_vector(4 downto 0) := (others=>'0');
	SIGNAL regUlaz3izMuxa :  std_logic_vector(4 downto 0) := (others=>'0');
	SIGNAL upisiURegistar :  std_logic_vector(31 downto 0) := (others=>'0');

	--Outputs
	SIGNAL regIzlaz1 :  std_logic_vector(31 downto 0);
	SIGNAL regIzlaz2 :  std_logic_vector(31 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: REGFILE PORT MAP(
		clk => clk,
		RegWrite => RegWrite,
		regUlaz1 => regUlaz1,
		regUlaz2 => regUlaz2,
		regUlaz3izMuxa => regUlaz3izMuxa,
		upisiURegistar => upisiURegistar,
		regIzlaz1 => regIzlaz1,
		regIzlaz2 => regIzlaz2
	);

	tb : PROCESS
	BEGIN

		clk <= '1';
		RegWrite <= '1';
		regUlaz3izMuxa <= "00000";
		upisiURegistar <= x"12345678";
		
		
		-- Wait 100 ns for global reset to finish
		wait for 100 ns;
		clk <= '0';
		regUlaz1 <= "00000";
		-- Place stimulus here

		wait; -- will wait forever
	END PROCESS;

END;
