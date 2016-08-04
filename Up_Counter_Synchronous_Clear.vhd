-------------------------------------------------------------------------------
--
-- Title       : Up_Counter_Synchronous_Clear
-- Design      : Up_Counter_Synchronous_Clear
-- Author      : Maximiliano Valencia Moctezuma
-- Company     : Universidad Autonoma de Queretaro
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\Electronica_Avanzada_2\Up_Down_Counter_Synchronous_Clear\Up_Down_Counter_Synchronous_Clear\Up_Down_Counter_Synchronous_Clear\src\Up_Down_Counter_Synchronous_Clear.vhd
-- Generated   : Tue Aug  4 16:51:42 2015
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
--{entity {Up_Down_Counter_Synchronous_Clear} architecture {Counter}}

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Up_Counter_Synchronous_Clear is
	generic(
		N: integer:=8
		);
	port(
		CLK	:in	std_logic:='U';
		ARST:in	std_logic:='U';
		OPC	:in std_logic_vector(1 downto 0):=(others=>'U');
		Q	:out std_logic_vector(N-1 downto 0):=(others=>'0')
		);
end Up_Counter_Synchronous_Clear;

architecture Counter of Up_Counter_Synchronous_Clear is
	signal Qn:std_logic_vector(N-1 downto 0):=(others=>'0'); 
	signal Qp:std_logic_vector(N-1 downto 0):=(others=>'0');   
begin
	
	MUX:process(OPC,Qp)
	begin
		case OPC is
			when "00" => Qn <= Qp;
			when "01" => Qn <= Qp+'1';
			when others => Qn <= (others=>'0');
		end case;
	end process MUX;  
	
	FlipFlop:process(CLK,ARST)
	begin
		if (ARST='0') then
			Qp <= (others=>'0');
		elsif (CLK'event and CLK='1') then
			Qp <= Qn;
		end if;
	end process FlipFlop;  	
	
	Q <= Qp;
	
end Counter;
