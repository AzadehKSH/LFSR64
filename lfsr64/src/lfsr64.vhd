-------------------------------------------------------------------------------
--
-- Title       : lfsr
-- Design      : lfsr
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : lfsr.vhd
-- Generated   : Mon Dec  7 19:10:bits-17 2015
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {lfsr} architecture {arch}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity lfsr is 
	generic (bits:integer:=64);
	 port(
		 clk : in STD_LOGIC;
		 reset : in STD_LOGIC;
		 Q : out STD_LOGIC_VECTOR(bits-1 downto 0)
	     );
end lfsr;



architecture arch of lfsr is 
signal zero,fzero,fb:std_Ulogic;
signal reg,nx:std_logic_vector(bits-1downto 0);
constant seed: std_logic_vector(bits-1 downto 1):=(others=>'0');
begin 
	 
	process(clk,reset)
	begin
		if (reset='1') then
			reg<=(others=>'0');
			
		elsif(clk'event and clk='1') then 
			reg<=nx;
			
			end if;
		end process;
			zero<='1' when reg(bits-1downto 1)=seed else '0';
		    fb<=(reg(4) xor reg(3) xor reg(1) xor reg(0) );
			fzero<=(fb xor zero);
			nx<=( fzero & reg(bits-1 downto 1));
		    Q<=reg;

	

end arch;
