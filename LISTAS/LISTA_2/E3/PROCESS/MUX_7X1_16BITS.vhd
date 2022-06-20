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
   PROCESS(i_A,i_B,i_C,i_D,i_E,i_F,i_G,i_SEL)
      BEGIN
         IF    (i_SEL = "000") THEN
            o_S <= i_A;
         ELSIF (i_SEL = "001") THEN
            o_S <= i_B;
         ELSIF (i_SEL = "010") THEN
            o_S <= i_C;
         ELSIF (i_SEL = "011") THEN
            o_S <= i_D;
         ELSIF (i_SEL = "100") THEN
            o_S <= i_E;
         ELSIF (i_SEL = "101") THEN
            o_S <= i_F;
         ELSIF (i_SEL = "110") THEN
            o_S <= i_G;
         ELSE
            o_S <= (OTHERS => 'Z');
         END IF;
   END PROCESS;
END BEHAVIORAL;
