----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:24:43 05/13/2019 
-- Design Name: 
-- Module Name:    ALUCONTROL - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALUCONTROL is
port (
		funct: in std_logic_vector(5 downto 0);
		alu_op: in std_logic_vector(1 downto 0);
		alu_izlaz: out std_logic
	   );
end ALUCONTROL;

architecture Behavioral of ALUCONTROL is

begin

		alu_izlaz <= '0' when alu_op="00" or (alu_op="10" and funct="100000") else '1';

end Behavioral;

