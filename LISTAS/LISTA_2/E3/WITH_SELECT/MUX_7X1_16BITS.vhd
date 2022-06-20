LIBRARY IEEE;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MUX_7X1_16BITS IS
   GENERIC(
      N  : INTEGER := 16   -- Length of each signal input (X bits)
   );
   PORT(
      i_A   :   IN    STD_LOGIC_VECTOR(N-1 DOWNTO 0);
      i_B   :   IN    STD_LOGIC_VECTOR(N-1 DOWNTO 0);
      i_C   :   IN    STD_LOGIC_VECTOR(N-1 DOWNTO 0);
      i_D   :   IN    STD_LOGIC_VECTOR(N-1 DOWNTO 0);
      i_E   :   IN    STD_LOGIC_VECTOR(N-1 DOWNTO 0);
      i_F   :   IN    STD_LOGIC_VECTOR(N-1 DOWNTO 0);
      i_G   :   IN    STD_LOGIC_VECTOR(N-1 DOWNTO 0);
      i_SEL :   IN    STD_LOGIC_VECTOR( 2  DOWNTO 0);
      o_S   :   OUT   STD_LOGIC_VECTOR(N-1 DOWNTO 0)
   );
END MUX_7X1_16BITS;

ARCHITECTURE BEHAVIORAL OF MUX_7X1_16BITS IS
BEGIN
   WITH i_SEL SELECT
	    o_S  <=  i_A WHEN "000",
               i_B WHEN "001",
               i_C WHEN "010",
               i_D WHEN "011",
               i_E WHEN "100",
               i_F WHEN "101",
               i_G WHEN "110",
               (OTHERS =>'Z') WHEN OTHERS;
END BEHAVIORAL;
