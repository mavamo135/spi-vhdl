				-------------------------------------------------------------------------------
--
-- Title       : FSM
-- Design      : FSM
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
-- Description : Finite State Machine
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {Up_Down_Counter_Synchronous_Clear} architecture {Counter}}

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity FSM_RX is
	port( 
		CLK		:in	std_logic:='U';
		ARST	:in	std_logic:='U';	
		COMPRX	:in	std_logic:='U';
		BUSY	:in std_logic:='U';
		DCLKI	:in std_logic:='U';	 
		OPC1	:out std_logic:='0';
		OPC2	:out std_logic_vector(1 downto 0):=(others=>'0');
		EN		:out std_logic:='0'
		);
end FSM_RX;

architecture Finite_State_Machine of FSM_RX is
	signal Qn:std_logic_vector(3 downto 0):=(others=>'0'); 
	signal Qp:std_logic_vector(3 downto 0):=(others=>'0');   
begin
	P1:process(Qp,DCLKI,COMPRX,BUSY)
	begin
		case Qp is 
			when "0000" => 
				OPC1 <= '0';
				OPC2 <= "11";
				EN	 <= '0';
				if (BUSY='1') then
					Qn <= "0001";	
				else
					Qn <= Qp;
				end if;	
			when "0001" => 
				OPC1 <= '0';
				OPC2 <= "00";
				EN	 <= '0';
				if (BUSY='0') then
					Qn <= "0010";	
				else
					Qn <= Qp;
				end if;	
			when "0010" => 
				OPC1 <= '0';
				OPC2 <= "00";
				EN	 <= '0';
				if (DCLKI='0') then
					Qn <= "0011";	
				else
					Qn <= Qp;
				end if;	
			when "0011" =>
				EN	 <= '0';
				if (DCLKI='1') then
					OPC1 <= '1';
					OPC2 <= "01";
					Qn <= "0100";	
				else 
					OPC1 <= '0';
					OPC2 <= "00";
					Qn <= Qp;
				end if;
			when "0100" => 
				OPC1 <= '0';
				OPC2 <= "00";
				EN	 <= '0';
				if (DCLKI='0') then
					Qn <= "0101";	
				else
					Qn <= Qp;
				end if;
			when others =>
				OPC1 <= '0';
				OPC2 <= "00";
				if (COMPRX='1') then 
					EN	 <= '1';
					Qn <= "0000";	
				else 
					EN	 <= '0';
					Qn <= "0011";
				end if;					
		end case;
	end process P1;  
	
	P2:process(CLK,ARST)
	begin
		if (ARST='0') then
			Qp <= (others=>'0');
		elsif (CLK'event and CLK='1') then
			Qp <= Qn;
		end if;
	end process P2;  	
	
end Finite_State_Machine;
