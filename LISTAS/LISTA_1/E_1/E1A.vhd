LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY E1A IS
    PORT(
		  i_A    :    IN    STD_LOGIC;
	    i_B    :    IN    STD_LOGIC;
  	  i_C    :    IN    STD_LOGIC;
	    i_D    :    IN    STD_LOGIC;
	    o_S    :    OUT   STD_LOGIC
	  );
END E1A;

ARCHITECTURE BEHAVIORAL OF E1A IS
 	 SIGNAL w_1      :    STD_LOGIC;
	 SIGNAL w_2      :    STD_LOGIC;
BEGIN
	w_1 <= i_A AND (NOT i_B);
	w_2 <= NOT(i_C AND i_D);
	o_S <= w_1 NOR w_2;  
END BEHAVIORAL;
