library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity butterfly is
    generic(b1_len:integer:=16;b2_len:integer:=8);
    Port ( x2in : in STD_LOGIC_VECTOR(((b1_len+b2_len)*2)-1 downto 0);
           y2in : in STD_LOGIC_VECTOR(((b1_len+b2_len)*2)-1 downto 0);
           z2in : in STD_LOGIC_VECTOR(((b2_len+2)*2)-1 downto 0);
           x21out : out STD_LOGIC_VECTOR(((b1_len+b2_len)*2)-1 downto 0);   ---h(n)+g(n)
           x22out : out STD_LOGIC_VECTOR(((b1_len+b2_len)*2)-1 downto 0));
end entity;

architecture arch1 of butterfly is
--component instaniations 1. comp_add 2.comp_sub 3.comp_mul
   component comp_add1 is
    generic (b_length:integer:=16); 
    Port ( xin : in STD_LOGIC_VECTOR((b_length*2)-1 downto 0);
           yin : in STD_LOGIC_VECTOR((b_length*2)-1 downto 0);
           xout : out STD_LOGIC_VECTOR((b_length*2)-1 downto 0));
   end component;
   component comp_sub1 is
       generic (b_length:integer:=16); 
       Port ( xin : in STD_LOGIC_VECTOR((b_length*2)-1 downto 0);
              yin : in STD_LOGIC_VECTOR((b_length*2)-1 downto 0);
              xout : out STD_LOGIC_VECTOR((b_length*2)-1 downto 0));
              
   end component;
   
   component comp_mul1 is
       generic (b1_length:integer:=4; b2_length:integer:=2); 
       Port ( x1in : in STD_LOGIC_VECTOR(((b1_length+b2_length)*2)-1 downto 0);
              t1in : in STD_LOGIC_VECTOR(((b2_length+2)*2)-1 downto 0);
              x1out : out STD_LOGIC_VECTOR(((b1_length+b2_length)*2)-1 downto 0));
   end component;
   signal op1,op21:STD_LOGIC_VECTOR(((b1_len+b2_len)*2)-1 downto 0);
   signal op3:STD_LOGIC_VECTOR(((b2_len+2)*2)-1 downto 0);
   signal s1:STD_LOGIC_VECTOR(((b1_len+b2_len)*2)-1 downto 0);
   signal s2:STD_LOGIC_VECTOR(((b1_len+b2_len)*2)-1 downto 0);
   signal s3:STD_LOGIC_VECTOR(((b1_len+b2_len)*2)-1 downto 0);
   begin
   op1<=x2in;
   op21<=y2in;
   op3<=z2in;
   
   add1:comp_add1 generic map(b_length=>(b1_len+b2_len)) port map(op1,op21,s1);
   sub1:comp_sub1 generic map(b_length=>(b1_len+b2_len)) port map(op1,op21,s2);
   twi_mul1:comp_mul1 generic map(b1_length=>b1_len,b2_length=>b2_len) port map(s2,op3,s3);
   x21out<=s1;
   x22out<=s3;
 end arch1;  
   
   