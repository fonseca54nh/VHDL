LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY PORTA_AND IS
   GENERIC(
      N   :   INTEGER := 64
   );
   PORT(
      i_A : IN  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
      i_B : IN  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
      o_C : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
   );
END PORTA_AND;

ARCHITECTURE BEHAVIORAL OF PORTA_AND IS
BEGIN
   o_C <= i_A AND i_B;
END BEHAVIORAL;
