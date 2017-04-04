ibrary IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fft_imp is
    generic (b_leng:integer:=16,f_length:integer:=8); 
    Port ( xin : in STD_LOGIC_VECTOR((b_leng*2)-1 downto 0);
           yout : out STD_LOGIC_VECTOR((b_leng*2)-1 downto 0));
end fft_imp;

architecture arch2 of fft_imp is
--butterfly inst
 component butterfly is
    generic(b1_len:integer:=16;b2_len:integer:=8);
    Port ( x2in : in STD_LOGIC_VECTOR(((b1_len+b2_len)*2)-1 downto 0);
           y2in : in STD_LOGIC_VECTOR(((b1_len+b2_len)*2)-1 downto 0);
           z2in : in STD_LOGIC_VECTOR(((b2_len+2)*2)-1 downto 0);
           x21out : out STD_LOGIC_VECTOR(((b1_len+b2_len)*2)-1 downto 0);   ---h(n)+g(n)
           x22out : out STD_LOGIC_VECTOR(((b1_len+b2_len)*2)-1 downto 0));
 end component;
begin
