----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:26:04 05/13/2019 
-- Design Name: 
-- Module Name:    MUX2_1_ZA_ALU - Behavioral 
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

entity MUX2_1_ZA_ALU is
port (
		ulaz1_u_mux: in std_logic_vector(31 downto 0);
		ulaz2_u_mux: in std_logic_vector(31 downto 0);
		alu_src: in std_logic;
		izlaz_iz_muxa: out std_logic_vector(31 downto 0)
	   );
end MUX2_1_ZA_ALU;

architecture Behavioral of MUX2_1_ZA_ALU is

begin

   izlaz_iz_muxa <= ulaz1_u_mux when alu_src = '0' else 
							ulaz2_u_mux;
end Behavioral; 

