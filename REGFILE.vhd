----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:43:11 05/06/2019 
-- Design Name: 
-- Module Name:    REGFILE - Behavioral 
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
--
use ieee.numeric_std.all;


---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity REGFILE is

port(clk: in std_logic;
	  RegWrite: in std_logic;
	  regUlaz1: in std_logic_vector(4 downto 0);
	  regUlaz2: in std_logic_vector(4 downto 0);
	  regUlaz3izMuxa: in std_logic_vector(4 downto 0);
	  upisiURegistar: in std_logic_vector(31 downto 0);
	  regIzlaz1: out std_logic_vector(31 downto 0);
	  regIzlaz2: out std_logic_vector(31 downto 0)
	  );

end REGFILE;

architecture Behavioral of REGFILE is

--definisan tip podataka "mem_array"
	 type mem_array is array(0 to 31) of STD_LOGIC_VECTOR (31 downto 0);
    signal reg_mem: mem_array := (
       x"00000000", 
	 x"00000001",
	 x"00000002", 
	 x"00000003",
	 x"00000004", 
	 x"00000005",
	 x"00000006", 
	 x"00000007",
	 x"00000008", 
	 x"00000009",
	 x"00000010", 
	 x"00000011",
	 x"00000012", 
	 x"00000013",
	 x"00000014", 
	 x"00000015",
	 x"00000016", 
	 x"00000017",
	 x"00000018", 
	 x"00000019",
	 x"00000000", 
	 x"00000001",
	 x"00000002", 
	 x"00000003",
	 x"00000004", 
	 x"00000005",
	 x"00000006", 
	 x"00000007",
	 x"00000008", 
	 x"00000009",
	 x"00000010", 
	 x"00000011"
    );

begin	
	
	regIzlaz1 <= reg_mem(conv_integer(unsigned(regUlaz1)));
	
	regIzlaz1 <= x"00000000" when reg_mem(conv_integer(unsigned(regUlaz1))) = "0";
   
	regIzlaz2 <= reg_mem(conv_integer(unsigned(regUlaz2)));

	process(clk)
	--na pocetku procesa mora stajati "begin", i ne ide ":" nakon sesnsiviti liste
	begin
		if(rising_edge(clk) and RegWrite = '1') then
			reg_mem(conv_integer(unsigned(regUlaz3izMuxa))) <= upisiURegistar;
		end if;
	end process;
	
end Behavioral;