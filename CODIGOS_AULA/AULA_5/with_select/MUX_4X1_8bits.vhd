LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY MUX IS
   PORT(
      i_A   :  in  STD_LOGIC_VECTOR(7 DOWNTO 0);
      i_B   :  in  STD_LOGIC_VECTOR(7 DOWNTO 0);
      i_C   :  in  STD_LOGIC_VECTOR(7 DOWNTO 0);
      i_D   :  in  STD_LOGIC_VECTOR(7 DOWNTO 0);
      o_C   :  out STD_LOGIC_VECTOR(7 DOWNTO 0);
      i_SEL :  in  STD_LOGIC_VECTOR(1 DOWNTO 0)
   );
END MUX;

ARCHITECTURE BEHAVIORAL OF MUX IS

BEGIN

    PROCESS(i_A, i_B, i_C, i_D, i_SEL)
    BEGIN
        IF (i_SEL = "00") THEN 
	      o_C <= i_A;
        ELSIF (i_SEL = "01") THEN
            o_C <= i_B;
        ELSIF (i_SEL = "10") THEN
            o_C <= i_C;
        ELSE
            o_C <= i_D;
        END IF;
    END PROCESS;

END BEHAVIORAL
