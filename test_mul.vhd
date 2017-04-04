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

entity test_mul is
    
    Port ( xin : in STD_LOGIC_VECTOR(3 downto 0);
           yin : in STD_LOGIC_VECTOR(3 downto 0);
           xout : out STD_LOGIC_VECTOR(7 downto 0));
           
end test_mul;
architecture beha of test_mul is 
 signal o1:SIGNED (3 downto 0);
 signal o2:SIGNED (3 downto 0);
 signal res:SIGNED (3 downto 0);
begin
 o1<=SIGNED(xin);
 o2<=SIGNED(yin);
 res<=o1*o2;
 xout<=STD_LOGIC_VECTOR(res); 
end beha;
 
 
 
 
 
 