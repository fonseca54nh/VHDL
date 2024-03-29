LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY HALF_ADDER IS
PORT(
   i_A   :   IN    STD_LOGIC;
   i_B   :   IN    STD_LOGIC;
   o_S   :   OUT   STD_LOGIC;
   o_C   :   OUT   STD_LOGIC
);
END HALF_ADDER;

ARCHITECTURE BEHAVIORAL OF HALF_ADDER IS
BEGIN
   o_S <= i_A XOR i_B;
   o_C <= i_A AND i_B;
END BEHAVIORAL;
