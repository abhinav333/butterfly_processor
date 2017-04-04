----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.10.2016 16:33:11
-- Design Name: 
-- Module Name: comp_mul - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


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

entity comp_sub1 is
    generic (b_length:integer:=16); 
    Port ( xin : in STD_LOGIC_VECTOR((b_length*2)-1 downto 0);
           yin : in STD_LOGIC_VECTOR((b_length*2)-1 downto 0);
           xout : out STD_LOGIC_VECTOR((b_length*2)-1 downto 0));
           
end comp_sub1;

architecture Behavioral of comp_sub1 is
 signal op11,op12: SIGNED (b_length-1 downto 0);
 signal op21,op22:signed(b_length-1 downto 0);
 signal result1,result2:signed(b_length-1 downto 0); 
begin
 op11<=SIGNED(xin((b_length*2)-1 downto (b_length)));
 op12<=SIGNED(yin((b_length*2)-1 downto (b_length)));
 result1<=op11-op12; 
 xout((b_length*2)-1 downto b_length)<=STD_LOGIC_VECTOR(result1);
 op21<=SIGNED(xin(b_length-1 downto 0));
 op22<=SIGNED(yin(b_length-1 downto 0));
 result2<=op21-op22;
 xout(b_length-1 downto 0)<=STD_LOGIC_VECTOR(result2);

end Behavioral;
