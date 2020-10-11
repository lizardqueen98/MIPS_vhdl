----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:53:26 04/22/2019 
-- Design Name: 
-- Module Name:    DATAPATH - Behavioral 
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
entity DATAPATH is
    Port ( Clk : in  STD_LOGIC
			  );
end DATAPATH;

architecture Behavioral of DATAPATH is

component PC is 
Port ( clk : in  STD_LOGIC;
           pc_in : in  STD_LOGIC_VECTOR (31 downto 0);
           pc_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
component PcAdder is
    Port ( trenutna : in  STD_LOGIC_VECTOR (31 downto 0);
           izlaz : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
component MEMORYINSTRUCTION is
    Port ( addressa : in  STD_LOGIC_VECTOR (31 downto 0);
           valuee : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
component CONTROL
	port (
			opcode: in std_logic_vector(5 downto 0);
			reg_dest,jump, branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write: out std_logic;
			alu_op: out std_logic_vector(1 downto 0)
		);
end component;
component SIGNEXTEND
	port(ulaz: in std_logic_vector(15 downto 0);
		  izlaz: out std_logic_vector(31 downto 0)
			);
end component;
component REGFILE
	port(clk: in std_logic;
	  RegWrite: in std_logic;
	  regUlaz1: in std_logic_vector(4 downto 0);
	  regUlaz2: in std_logic_vector(4 downto 0);
	  regUlaz3izMuxa: in std_logic_vector(4 downto 0);
	  upisiURegistar: in std_logic_vector(31 downto 0);
	  regIzlaz1: out std_logic_vector(31 downto 0);
	  regIzlaz2: out std_logic_vector(31 downto 0)
	  );
end component;
component MUX2_1
	port(ulaz1 : in std_logic_vector (4 downto 0);
		  ulaz2: in std_logic_vector (4 downto 0);
		  kontrolni: in std_logic;
		  izlaz: out std_logic_vector (4 downto 0)
		  );
end component;
component ALU
	port(
		ulaz1_u_alu: in std_logic_vector(31 downto 0);
		ulaz2_u_alu: in std_logic_vector(31 downto 0);
		alu_control: in std_logic;
		izlaz_iz_alu: out std_logic_vector(31 downto 0));
end component;

component ALUCONTROL
port (
		funct: in std_logic_vector(5 downto 0);
		alu_op: in std_logic_vector(1 downto 0);
		alu_izlaz: out std_logic
	   );
end component;

component MUX2_1_ZA_ALU
port (
		ulaz1_u_mux: in std_logic_vector(31 downto 0);
		ulaz2_u_mux: in std_logic_vector(31 downto 0);
		alu_src: in std_logic;
		izlaz_iz_muxa: out std_logic_vector(31 downto 0)
	   );
end component;

component DATAMEMORY
	port(
	clock : in std_logic;
	adr_sa_koje_se_cita : in  STD_LOGIC_VECTOR (31 downto 0);
	mem_read : in std_logic;
	vrj_pod_za_upis_u_mem : in  STD_LOGIC_VECTOR (31 downto 0);
	mem_write : in std_logic;
	izlaz_procitan_sa_adrese : out std_logic_vector(31 downto 0)
	);
end component;
signal instr_address: std_logic_vector(31 downto 0):= x"00000000"; 
signal next_address: std_logic_vector(31 downto 0) := x"00000000";
signal instruction: std_logic_vector(31 downto 0) := x"00000000";

signal prosirena_vrijednost : std_logic_vector (31 downto 0) := x"00000000";
--signali
signal s_jump : std_logic :='0';
signal s_branch : std_logic :='0';
signal s_mem_read : std_logic :='0';
signal s_mem_to_reg : std_logic:='0';
signal s_mem_write : std_logic :='0'; 
signal s_alu_src : std_logic :='0';
signal s_reg_dest : std_logic :='0';
signal s_reg_write: std_logic :='0';
signal s_alu_op: std_logic_vector(1 downto 0) :="00";

--izlazi iz registers
signal s_read_data1 : std_logic_vector(31 downto 0) := x"00000000";
signal s_read_data2 : std_logic_vector(31 downto 0) := x"00000000";

--ovaj signal bira ocel biti rd ili rt
signal s_rez_muxa : std_logic_vector(4 downto 0) := "00000";
--izlaz i posljednjeg muxa i ulaz u registers
signal s_write_data : std_logic_vector(31 downto 0) := x"00000000";
--izlaz iz alu control
signal s_alucontrol_izlaz : std_logic :='0';
--izlaz iz alu mux-a
signal s_alu_mux_izlaz : std_logic_vector(31 downto 0) := x"00000000";
--izlaz iz alu-a
signal s_alu_izlaz : std_logic_vector(31 downto 0) := x"00000000";
--izlaza iz datamem
signal s_datamem_izlaz : std_logic_vector(31 downto 0) := x"00000000";

begin
  Prog_Broj: PC port map (Clk, next_address, instr_address);
  Pc_adder: PCADDER port map (instr_address, next_address);
  Memorija_istrukcija : MEMORYINSTRUCTION port map (instr_address,instruction);
  sgn_ex : SIGNEXTEND port map(instruction(15 downto 0), prosirena_vrijednost);
  ctrl : CONTROL port map (instruction(31 downto 26), s_reg_dest, s_jump, s_branch, s_mem_read, s_mem_to_reg, s_mem_write, s_alu_src, s_reg_write, s_alu_op);
  prvi_mux2x1 : MUX2_1 port map (instruction(20 downto 16), instruction(15 downto 11), s_reg_dest, s_rez_muxa);
  registers : REGFILE port map (Clk, s_reg_write, instruction(25 downto 21), instruction(20 downto 16), s_rez_muxa, s_write_data, s_read_data1, s_read_data2);
  mux2_1_alu: MUX2_1_ZA_ALU port map(s_read_data2, prosirena_vrijednost, s_alu_src, s_alu_mux_izlaz);
  alu_control: ALUCONTROL port map(instruction(5 downto 0), s_alu_op, s_alucontrol_izlaz);
  --nemre se zvat samo alu 
  aluu : ALU port map(s_read_data1, s_alu_mux_izlaz, s_alucontrol_izlaz, s_alu_izlaz);
  data_mem : DATAMEMORY port map(Clk,s_alu_izlaz,s_mem_read,s_read_data2,s_mem_write,s_datamem_izlaz);
  mux2_1_zadnji : MUX2_1_ZA_ALU port map(s_alu_izlaz, s_datamem_izlaz, s_mem_to_reg, s_write_data);
  
		 process(Clk) begin
		 if rising_edge(clk) then
		  instr_address <= next_address;
		 end if;
		 end process;
end Behavioral;
