LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY IF_GENERATE IS
   GENERIC(
      N     :   INTEGER := 8;
      TIPO  :   STRING  := "OR" -- Valores possíveis: | "AND" | "OR" |
   );
   PORT(
      i_A   :   IN  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
      i_B   :   IN  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
      o_C   :   OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
   );
END IF_GENERATE;

ARCHITECTURE BEHAVIORAL OF IF_GENERATE IS

   COMPONENT PORTA_AND IS
      GENERIC(
         N   :   INTEGER := 64
      );
      PORT(
         i_A : IN  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
         i_B : IN  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
         o_C : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
      );
   END COMPONENT;

   COMPONENT PORTA_OR IS
      GENERIC(
         N   :   INTEGER := 64
      );
      PORT(
         i_A : IN  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
         i_B : IN  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
         o_C : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
      );
   END COMPONENT;

BEGIN

   -- Instância AND
   U_AND : IF (TIPO = "AND") GENERATE
   U01 : PORTA_AND
   GENERIC MAP(
      N   =>  N
   ) 
   PORT MAP(
      i_A => i_A,
      i_B => i_B,
      o_C => o_C
   );
   END GENERATE;
   
  -- Instância OR
   U_OR : IF (TIPO = "OR") GENERATE
   U02 : PORTA_OR
   GENERIC MAP(
      N   =>  N
   )
   PORT MAP(
      i_A => i_A,
      i_B => i_B,
      o_C => o_C
   );
   END GENERATE;

END BEHAVIORAL;
