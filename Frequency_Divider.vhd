-------------------------------------------------------------------------------
--
-- Title       : Frequency_Divider
-- Design      : Frequency_Divider
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\Electronica_Avanzada_2\Frequency_Divider\Frequency_Divider\src\Frequency_Divider.vhd
-- Generated   : Mon Aug 17 17:30:32 2015
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
--{entity {Frequency_Divider} architecture {behavioral}}

library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_UNSIGNED.all;

entity Frequency_Divider is	
	generic(
		N:integer:=2
	);
	port(
		CLK_IN	:in std_logic:='U';  
		ARST	:in std_logic:='U';	
		OPC		:in std_logic:='U';
		DEL 	:in std_logic:='U';
		Q		:in std_logic_vector(N-1 downto 0):=(others=>'U');
		CLK_OUT	:out std_logic:='0'
	);
end Frequency_Divider;

--}} End of automatically maintained section

architecture behavioral of Frequency_Divider is	 
	signal CLKI:std_logic:='0';
begin

	 process(CLK_IN,ARST,CLKI,OPC,DEL)
		variable cnt:std_logic_vector(N-1 downto 0):=(others=>'0');
		begin 
		if (ARST='0' or DEL='1') then
			cnt := (others=>'0');
			CLKI <= '0';
		elsif (CLK_IN'event and CLK_IN='1') then  
			if(OPC='1') then
				cnt := cnt+'1';
				if (cnt=Q) then
					CLKI <=	not CLKI;
					cnt := (others=>'0');	 				
				end if;
			end if;
		end if;
		CLK_OUT	<=	CLKI;
	end process;

end behavioral;
