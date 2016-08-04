-------------------------------------------------------------------------------
--
-- Title       : UART
-- Design      : Universal Asynchronous Receiver Transmitter
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

entity SPI is
	generic(
		N:integer:=8
		);
	port(
		CLK		:in std_logic:='U';
		ARST	:in std_logic:='U';
		ST		:in std_logic:='U';
		BUSY	:in std_logic:='U';
		SDI		:in std_logic:='U';
		SDO		:out std_logic:='0'; 
		SCLK	:out std_logic:='0'; 
		CS		:out std_logic:='0';
		EOT		:out std_logic:='0';
		DOUT	:out std_logic_vector(11 downto 0):=(others=>'0')
		);	   
end SPI;	 

architecture structural of SPI is	 
	signal DCLKI :std_logic:='0';
	signal DCLK  :std_logic:='0';
	signal COMPTX:std_logic:='0';	
	signal COMPRX:std_logic:='0';
	signal COMPF :std_logic:='0';
	signal EN    :std_logic:='0';
	signal DEL   :std_logic:='0';
	signal OPC1  :std_logic:='0';
	signal OPC2  :std_logic:='0';
	signal OPC3  :std_logic_vector(1 downto 0):=(others=>'0');
	signal OPC4  :std_logic_vector(1 downto 0):=(others=>'0');
	signal QTX	 :std_logic_vector(3 downto 0):=(others=>'0');
	signal QRX	 :std_logic_vector(3 downto 0):=(others=>'0');	
	signal DAT	 :std_logic_vector(11 downto 0):=(others=>'0');
begin
	
	U0:entity work.FSM_TX port map(CLK,ARST,ST,COMPTX,COMPF,DCLKI,DCLK,OPC1,OPC3,CS,DEL);
	U1:entity work.FSM_RX port map(CLK,ARST,COMPRX,BUSY,DCLK,OPC2,OPC4,EN);  
	U2:entity work.Frequency_Divider generic map(12) port map(CLK,ARST,OPC1,DEL,"000111110100",DCLKI);--100kHz		
	U3:entity work.Up_Counter_Synchronous_Clear generic map(4) port map(CLK,ARST,OPC3,QTX);
	U4:entity work.Comparator generic map(4) port map(QTX,"1000",COMPTX);--8 bits de envio
	U5:entity work.Comparator generic map(4) port map(QTX,"1111",COMPF);--15 bits	
	U6:entity work.Up_Counter_Synchronous_Clear generic map(4) port map(CLK,ARST,OPC4,QRX);
	U7:entity work.Comparator generic map(4) port map(QRX,"1100",COMPRX);--12 bits de recepcion	
	U8:entity work.Hold_Left_Shift_Register generic map(12) port map(CLK,ARST,OPC2,SDI,DAT);
	U9:entity work.Hold_Register generic map(12) port map(CLK,ARST,EN,DAT,DOUT);
	U10:entity work.MUX generic map(8) port map("10000111",QTX,SDO);	
		
	SCLK <= DCLK;
	
end structural;				 

