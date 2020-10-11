----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:26:43 05/19/2019 
-- Design Name: 
-- Module Name:    DATAMEMORY - Behavioral 
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

entity DATAMEMORY is
	port(
	clock : in std_logic;
	adr_sa_koje_se_cita : in  STD_LOGIC_VECTOR (31 downto 0);
	mem_read : in std_logic;
	vrj_pod_za_upis_u_mem : in  STD_LOGIC_VECTOR (31 downto 0);
	mem_write : in std_logic;
	izlaz_procitan_sa_adrese : out std_logic_vector(31 downto 0)
	);
end DATAMEMORY;

architecture Behavioral of DATAMEMORY is
--64 od po 32
type mem_array is array(0 to 63) of STD_LOGIC_VECTOR (31 downto 0);

signal data_mem: mem_array := (
    X"00000001", 
    X"00000002", 
    X"00000003",
    X"00000004",
    X"00000005",
    X"00000006",
    X"00000007",
    X"00000008",
    X"00000009",
    X"00000001", 
    X"00000002", 
    X"00000003",
    X"00000004",
    X"00000005",
    X"00000006",
    X"00000007",
    X"00000008",
    X"00000009",
    X"00000001", 
    X"00000002", 
    X"00000003",
    X"00000004",
    X"00000005",
    X"00000006",
    X"00000007",
    X"00000008",
    X"00000009",
    X"00000001", 
    X"00000002", 
    X"00000003",
    X"00000004",
    X"00000005",
    X"00000006",
    X"00000007",
    X"00000008",
    X"00000009",
    X"00000001", 
    X"00000002", 
    X"00000003",
    X"00000004",
    X"00000005",
    X"00000006",
    X"00000007",
    X"00000008",
    X"00000009",
    X"00000001", 
    X"00000002", 
    X"00000003",
    X"00000004",
    X"00000005",
    X"00000006",
    X"00000007",
    X"00000008",
    X"00000009",
    X"00000001", 
    X"00000002", 
    X"00000003",
    X"00000004",
    X"00000005",
    X"00000006",
    X"00000007",
    X"00000008",
    X"00000009",
    X"00000000");
begin

mem_process: process(clock)
begin
	if(rising_edge(clock)) then
		if(mem_read = '1') then
			izlaz_procitan_sa_adrese <= data_mem(conv_integer(unsigned(adr_sa_koje_se_cita)));
		end if;
		if(mem_write = '1') then
			data_mem(conv_integer(unsigned(adr_sa_koje_se_cita))) <= vrj_pod_za_upis_u_mem;
		end if;
	end if;
end process mem_process;

end Behavioral;

