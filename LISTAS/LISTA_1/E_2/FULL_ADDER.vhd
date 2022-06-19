LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY FULL_ADDER IS
   PORT(
      i_A    :   IN   STD_LOGIC;
      i_B    :   IN   STD_LOGIC;
      i_C    :   IN   STD_LOGIC;
      o_S    :   OUT  STD_LOGIC;
      o_C    :   OUT  STD_LOGIC
   );
END FULL_ADDER;

ARCHITECTURE BEHAVIORAL OF FULL_ADDER IS

   COMPONENT HALF_ADDER IS
   PORT(
      i_A   :   IN    STD_LOGIC;
      i_B   :   IN    STD_LOGIC;
      o_S   :   OUT   STD_LOGIC;
      o_C   :   OUT   STD_LOGIC
   );
   END COMPONENT;

   SIGNAL    w_S    :    STD_LOGIC;
   SIGNAL    w_C1   :    STD_LOGIC;
   SIGNAL    w_C2   :    STD_LOGIC;
   SIGNAL    w_C3   :    STD_LOGIC;

BEGIN

   w_C1 <= i_C;
	
   HLF0: HALF_ADDER
   PORT MAP(
      i_A => i_A,
      i_B => i_B,
      o_S => w_S,
      o_C => w_C2
   );

   HLF1: HALF_ADDER
   PORT MAP(
      i_A => w_S,
      i_B => w_C1,
      o_S => o_S,
      o_C => w_C3
   );
	
   o_C <= w_C2 OR w_C3;

END BEHAVIORAL;
