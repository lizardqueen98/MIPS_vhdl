----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:25:20 05/13/2019 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
port(
      ulaz1_u_alu: in std_logic_vector(31 downto 0);
		ulaz2_u_alu: in std_logic_vector(31 downto 0);
		alu_control: in std_logic;
		izlaz_iz_alu: out std_logic_vector(31 downto 0)
		);
end ALU;

architecture Behavioral of ALU is

begin
izlaz_iz_alu <= std_logic_vector(ulaz1_u_alu + ulaz2_u_alu) when alu_control='0' else
					std_logic_vector(ulaz1_u_alu - ulaz2_u_alu);

end Behavioral;

