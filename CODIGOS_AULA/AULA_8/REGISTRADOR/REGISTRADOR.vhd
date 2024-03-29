LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY REGISTRADOR IS
   GENERIC(
      N       :   INTEGER  :=  8
   );
   PORT(
      i_RST   :   IN   STD_LOGIC;
      i_CLK   :   IN   STD_LOGIC;
      i_LOAD  :   IN   STD_LOGIC;
      i_DATA  :   IN   STD_LOGIC_VECTOR((N-1) DOWNTO 0);
      o_DATA  :   OUT  STD_LOGIC_VECTOR((N-1) DOWNTO 0)
   );
END REGISTRADOR;

ARCHITECTURE BEHAVIORAL OF REGISTRADOR IS
BEGIN
-- Reset assíncrono
   PROCESS(i_CLK, i_RST, i_LOAD)
      BEGIN
         IF (i_RST = '1') THEN
            o_DATA <= (OTHERS => '0');
         ELSIF (i_LOAD = '1') THEN
            o_DATA <= (OTHERS => '0');
         ELSE
            IF RISING_EDGE(i_CLK) THEN
               o_DATA <= i_DATA;
            END IF;
         END IF;
   END PROCESS;
END BEHAVIORAL;
		 
