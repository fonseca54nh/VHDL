LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY E1B IS
   PORT(
     i_A    :    IN    STD_LOGIC;
     i_B    :    IN    STD_LOGIC;
     i_C    :    IN    STD_LOGIC;
     i_D    :    IN    STD_LOGIC;
     o_S    :    OUT   STD_LOGIC
   );
END E1B;

ARCHITECTURE BEHAVIORAL OF E1B IS
	
   SIGNAL w_1      :    STD_LOGIC;
   SIGNAL w_2      :    STD_LOGIC;
   SIGNAL w_3      :    STD_LOGIC;

BEGIN

   w_1 <= i_A AND i_B AND (NOT i_C);
   w_2 <= NOT(i_C AND i_D);
   w_3 <= w_1 OR w_2;
   o_S <= w_3 XNOR i_D;
	
END BEHAVIORAL;
