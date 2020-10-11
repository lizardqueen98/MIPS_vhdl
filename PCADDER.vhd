library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PCADDER is
    Port ( trenutna : in  STD_LOGIC_VECTOR (31 downto 0);
           izlaz : out  STD_LOGIC_VECTOR (31 downto 0));
end PCADDER;

architecture Behavioral of PCADDER is

 signal 	konstanta4 : std_logic_vector(31 downto 0) := x"00000004";

begin

izlaz <= std_logic_vector(trenutna + konstanta4);

end Behavioral;