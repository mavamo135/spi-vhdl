-------------------------------------------------------------------------------
--
-- Title       : Hold_Left_Shift_Register
-- Design      : Hold_Left_Shift_Register
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

entity Hold_Left_Shift_Register is
	generic(
		N: integer:=8
		);
	port(
		CLK	:in	std_logic:='U';
		ARST:in	std_logic:='U';
		OPC	:in std_logic:='U';
		D	:in std_logic:='U';
		Q	:out std_logic_vector(N-1 downto 0):=(others=>'0')
		);
end Hold_Left_Shift_Register;

architecture Reg of Hold_Left_Shift_Register is
	signal Qn:std_logic_vector(N-1 downto 0):=(others=>'0'); 
	signal Qp:std_logic_vector(N-1 downto 0):=(others=>'0');   
begin
	
	MUX:process(OPC,Qp,D)
	begin
		case OPC is
			when '0' => Qn <= Qp;
			when others => Qn <= Qp(N-2 downto 0) & D;
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
	
end Reg;

