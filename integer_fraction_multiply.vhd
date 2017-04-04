library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity integer_fraction_multiply is
    generic(b1_bit:integer:=16;b2_bit:integer:=8);
    Port ( xin : in STD_LOGIC_VECTOR(b1_bit+b2_bit-1 downto 0);
           yin : in STD_LOGIC_VECTOR(b2_bit+1 downto 0);
           xout : out STD_LOGIC_VECTOR(b1_bit+b2_bit-1 downto 0));
end integer_fraction_multiply;

architecture beha of integer_fraction_multiply is 
 signal o1,o2:SIGNED (b1_bit+b2_bit-1 downto 0);
 signal opp:STD_LOGIC_VECTOR(b1_bit-3 downto 0);
 signal res1:SIGNED (((b1_bit+b2_bit)*2)-1 downto 0);
 
begin
 o1<=SIGNED(xin);
 
 opp<=(others=>'0') when yin(b2_bit+1)='0' else
     (others=>'1') when yin(b2_bit+1)='1';    
 
 o2<=SIGNED(opp & yin);
 res1<=o1*o2;
 
 xout<=STD_LOGIC_VECTOR(res1(b1_bit+(2*b2_bit)-1 downto b2_bit));
 --xout<=STD_LOGIC_VECTOR(res1);
end beha;
