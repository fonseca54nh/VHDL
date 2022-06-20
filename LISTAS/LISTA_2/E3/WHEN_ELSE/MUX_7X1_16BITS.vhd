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
      i_SEL :   IN    STD_LOGIC_VECTOR(N-1 DOWNTO 0);
      o_S   :   OUT   STD_LOGIC_VECTOR(N-1 DOWNTO 0)
   );
END MUX_7X1_16BITS;

ARCHITECTURE BEHAVIORAL OF MUX_7X1_16BITS IS
BEGIN

   o_S  <=  i_A WHEN i_SEL = "000" ELSE
            i_B WHEN i_SEL = "001" ELSE
            i_C WHEN i_SEL = "010" ELSE
            i_D WHEN i_SEL = "011" ELSE
            i_E WHEN i_SEL = "100" ELSE
            i_F WHEN i_SEL = "101" ELSE
            i_G WHEN i_SEL = "110";

END BEHAVIORAL;
