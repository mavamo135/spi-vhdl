-------------------------------------------------------------------------------
--
-- Title       : MUX
-- Design      : MUX
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

entity MUX is
	generic(
		N: integer:=8
		);
	port(
		D 	:in std_logic_vector(N-1 downto 0):=(others=>'U');
		OPC	:in std_logic_vector(3 downto 0):=(others=>'U');
		Q	:out std_logic:='0'
		);
end MUX;
																   
architecture Multiplexer of MUX is  
begin
	
	M:process(OPC,D)
	begin
		case OPC is
			when "0000" => Q <= '0';
			when "0001" => Q <= D(7);
			when "0010" => Q <= D(6);
			when "0011" => Q <= D(5);
			when "0100" => Q <= D(4); 
			when "0101" => Q <= D(3);
			when "0110" => Q <= D(2);
			when "0111" => Q <= D(1); 
			when "1000" => Q <= D(0);  
			when others => Q <= '0';
		end case;
	end process M;  
	
	
end Multiplexer;
