library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MEMORYINSTRUCTION is
    Port ( addressa : in  STD_LOGIC_VECTOR (31 downto 0);
           valuee : out  STD_LOGIC_VECTOR (31 downto 0));
end MEMORYINSTRUCTION;

architecture Behavioral of MEMORYINSTRUCTION is
type mem_array is array (0 to 31 ) of std_logic_vector (31 downto 0);
 Signal data_mem: mem_array := (
	x"8C120024", 
	x"8C110010",
	x"8C120014",
	x"8C14000C",
	x"8C0B0018",
	x"8C090040",
	x"8C0D001C",
	x"02328020",
	x"016D4022",
	x"AD31FFF4",
	x"0114A822",
	x"8C0A0020",
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
	 x"00000019");
	 begin
valuee <= data_mem( conv_integer(unsigned(addressa)));
end Behavioral;