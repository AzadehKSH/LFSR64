library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity lfsr_tb is
	-- Generic declarations of the tested unit
		generic(
		bits : INTEGER := 64 );
end lfsr_tb;

architecture TB_ARCHITECTURE of lfsr_tb is
	-- Component declaration of the tested unit
	component lfsr
		generic(
		bits : INTEGER := 64 );
	port(
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		Q : out STD_LOGIC_VECTOR(bits-1 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal reset : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Q : STD_LOGIC_VECTOR(bits-1 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : lfsr
		generic map (
			bits => bits
		)

		port map (
			clk => clk,
			reset => reset,
			Q => Q
		);

	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_lfsr of lfsr_tb is
	for TB_ARCHITECTURE
		for UUT : lfsr
			use entity work.lfsr(arch);
		end for;
	end for;
end TESTBENCH_FOR_lfsr;

