-------------------------------------------------------------------------------
--
-- Title       : Comparator
-- Design      : Comparator
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


library ieee;
use ieee.std_logic_1164.all;

entity Comparator is
	generic(
		N:integer:=8
		);
	port(
		D1	:in std_logic_vector(N-1 downto 0):=(others=>'0');	 
		D2	:in std_logic_vector(N-1 downto 0):=(others=>'0'); 
		Q	:out std_logic:='0'
		);	   
end Comparator;	 

architecture Comp of Comparator is
begin
	
	process(D1,D2)
	begin
		if (D1=D2) then
			Q <= '1';
		else
			Q <= '0';
		end if;
	end process;
	
end Comp;


