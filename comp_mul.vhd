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

entity comp_mul is
    generic (b1_length:integer:=4; b2_length:integer:=2); 
    Port ( x1in : in STD_LOGIC_VECTOR(((b1_length+b2_length)*2)-1 downto 0);
           t1in : in STD_LOGIC_VECTOR(((b2_length+2)*2)-1 downto 0);
           x1out : out STD_LOGIC_VECTOR(((b1_length+b2_length)*2)+1 downto 0));
           
end comp_mul;

architecture Behavioral of comp_mul is
--component for real & twiddle factor multiplication
  component integer_fraction_multiply is
    generic(b1_bit:integer:=16;b2_bit:integer:=8);
      Port ( xin : in STD_LOGIC_VECTOR(b1_bit+b2_bit-1 downto 0);
             yin : in STD_LOGIC_VECTOR(b2_bit+1 downto 0);
             xout : out STD_LOGIC_VECTOR(b1_bit+b2_bit-1 downto 0));
  end component;


 signal a,b: STD_LOGIC_VECTOR ((b1_length+b2_length)-1 downto 0);
 signal x,y:STD_LOGIC_VECTOR((2+b2_length)-1 downto 0);
 signal m1,m2,m3,m4:STD_LOGIC_VECTOR((b1_length+b2_length)-1 downto 0); 
 signal result1,result2:signed(b1_length downto 0); 
begin
 a<=x1in(((b1_length+b2_length)*2)-1 downto ((b1_length+b2_length)));
 b<=x1in((b1_length+b2_length)-1 downto 0);
 x<=t1in(((b2_length+2)*2)-1 downto (b2_length+2));
 y<=t1in((b2_length+2)-1 downto 0);
 mul1: integer_fraction_multiply generic map(b1_bit=>b1_length,b2_bit=>b2_length) port map(a,x,m1);
 mul2: integer_fraction_multiply generic map(b1_bit=>b1_length,b2_bit=>b2_length) port map(b,y,m2);
 mul3: integer_fraction_multiply generic map(b1_bit=>b1_length,b2_bit=>b2_length) port map(a,y,m3);
 mul4: integer_fraction_multiply generic map(b1_bit=>b1_length,b2_bit=>b2_length) port map(b,x,m4);
 x1out<=STD_LOGIC_VECTOR((SIGNED(m1(b1_length+b2_length-1)&m1)-SIGNED(m2(b1_length+b2_length-1)&m2)) & 
                         (SIGNED(m3(b1_length+b2_length-1)&m3)+SIGNED(m4(b1_length+b2_length-1)&m4)));   
 
 
 

end Behavioral;
