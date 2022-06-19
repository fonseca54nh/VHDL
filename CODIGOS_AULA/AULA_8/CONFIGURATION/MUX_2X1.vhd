-- Esta abordagem não é tanto utilizada, visto que existe o IF, que é capaz de fazer o mesmo
-- Além de que, para síntese, o "IF" SEMPRE funciona
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY MUX_2X1 IS
   PORT(
      A,B :  IN   STD_LOGIC;   -- Data Inputs
      SEL :  IN   STD_LOGIC;   -- Selector
      S   :  OUT  STD_LOGIC    -- Data Output
   );
END MUX_2X1;
------------------------------------------
ARCHITECTURE STRUCTURAL OF MUX_2X1 IS
   BEGIN
      S <= (A AND NOT SEL) OR (B AND SEL);
   END STRUCTURAL;
------------------------------------------
ARCHITECTURE BEHAVIOR OF MUX_2X1 IS
   BEGIN
   PROCESS(A,B,SEL)
      BEGIN
      IF(SEL='0') THEN
         S <= A;
      ELSE
         S <= B;
      END IF;
   END PROCESS;
END BEHAVIOR;
------------------------------------------
CONFIGURATION CONFIG OF MUX_2X1 IS
   FOR STRUCTURAL   -- Valores possíveis : STRUCTURAL | BEHAVIOR 
   END FOR;
END;
