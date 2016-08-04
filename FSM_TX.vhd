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

entity FSM_TX is
	port( 
		CLK		:in	std_logic:='U';
		ARST	:in	std_logic:='U';	
		ST		:in	std_logic:='U';
		COMPTX	:in	std_logic:='U';
		COMPF   :in	std_logic:='U';
		DCLKI	:in std_logic:='U';	 
		DCLKO	:out std_logic:='0';
		OPC1	:out std_logic:='0';
		OPC2	:out std_logic_vector(1 downto 0):=(others=>'0');
		CS		:out std_logic:='0';
		DEL		:out std_logic:='0'
		);
end FSM_TX;

architecture Finite_State_Machine of FSM_TX is
	signal Qn:std_logic_vector(3 downto 0):=(others=>'0'); 
	signal Qp:std_logic_vector(3 downto 0):=(others=>'0');   
begin
	
	P1:process(Qp,CLK,DCLKI,COMPTX,COMPF,ST)
	begin
		case Qp is 
			when "0000" => 
				DCLKO <= '0';
				OPC1 <= '0';
				OPC2 <= "00";
				CS	 <= '1';
				DEL	 <= '1';
				if (ST='0') then
					Qn <= "0001";	
				else
					Qn <= Qp;
				end if;	
			when "0001" => 	
				DCLKO <= '0';
				OPC1 <= '1';
				OPC2 <= "00";
				CS	 <= '0';
				DEL	 <= '0';
				if (DCLKI='1') then
					Qn <= "0010";	
				else
					Qn <= Qp;
				end if;	
			when "0010" => 
				DCLKO <= '0';
				OPC1 <= '1';
				CS	 <= '0';
				DEL	 <= '0';
				if (DCLKI='0') then	
					OPC2 <= "01";
					Qn <= "0011";	
				else 
					OPC2 <= "00";
					Qn <= Qp;
				end if;	
			when "0011" =>
				DCLKO <= DCLKI;
				OPC1 <= '1';
				OPC2 <= "00";
				CS	 <= '0';
				DEL	 <= '0';
				if (DCLKI='1') then
					Qn <= "0100";	
				else
					Qn <= Qp;
				end if;	 
			when "0100" => 
				DCLKO <= DCLKI;
				OPC1 <= '1';
				CS	 <= '0';
				DEL	 <= '0';
				if (DCLKI='0') then	
					OPC2 <= "01";
					Qn <= "0101";	
				else
					OPC2 <= "00";
					Qn <= Qp;
				end if;
			when "0101" => 
				DCLKO <= DCLKI;
				OPC1 <= '1';
				OPC2 <= "00";
				CS	 <= '0';
				DEL	 <= '0';
				if (COMPTX='1') then
					Qn <= "0110";	
				else
					Qn <= "0011";
				end if;
			when "0110" =>
				DCLKO <= DCLKI;
				OPC1 <= '1';
				OPC2 <= "00";
				CS	 <= '0';
				DEL	 <= '0';
				if (DCLKI='1') then
					Qn <= "0111";	
				else
					Qn <= Qp;
				end if;	 
			when "0111" => 
				DCLKO <= DCLKI;
				OPC1 <= '1';
				CS	 <= '0';
				DEL	 <= '0';
				if (DCLKI='0') then	
					OPC2 <= "01";
					Qn <= "1000";	
				else
					OPC2 <= "00";
					Qn <= Qp;
				end if;
			when "1000" => 
				DCLKO <= DCLKI;
				OPC1 <= '1';
				OPC2 <= "00";
				CS	 <= '0';
				DEL	 <= '0';
				if (COMPF='1') then
					Qn <= "1001";	
				else
					Qn <= "0110";
				end if;	
			when others => 
				DCLKO<= '0';
				OPC1 <= '0';
				OPC2 <= "11";
				CS	 <= '0';
				DEL	 <= '1';
				Qn   <= "0011";
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
