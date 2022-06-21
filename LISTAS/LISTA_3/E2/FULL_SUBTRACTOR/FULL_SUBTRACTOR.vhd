LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY FULL_SUBTRACTOR IS
PORT(
   i_A       :    IN   STD_LOGIC;
   i_B       :    IN   STD_LOGIC;
   i_Borrow  :    IN   STD_LOGIC;
   o_Diff    :    OUT  STD_LOGIC;
   o_Borrow  :    OUT  STD_LOGIC
);
END FULL_SUBTRACTOR;

ARCHITECTURE STRUCTURAL OF FULL_SUBTRACTOR IS

   COMPONENT HALF_SUBTRACTOR IS
   PORT(
      i_A        :   IN    STD_LOGIC;
      i_B        :   IN    STD_LOGIC;
      o_Diff     :   OUT   STD_LOGIC;
      o_Borrow   :   OUT   STD_LOGIC
   );
   END COMPONENT;
	
   SIGNAL w_Diff : STD_LOGIC;
   SIGNAL w_B1   : STD_LOGIC;
   SIGNAL w_B2   : STD_LOGIC;

BEGIN

   HLF0: HALF_SUBTRACTOR
   PORT MAP(
      i_A      => i_A,
      i_B      => i_B,
      o_Diff   => w_Diff,
      o_Borrow => w_B1
   );

   HLF1: HALF_SUBTRACTOR
   PORT MAP(
      i_A      => w_Diff,
      i_B      => i_Borrow,
      o_Diff   => o_Diff,
      o_Borrow => w_B2
   );
	
   o_Borrow <= w_B1 OR w_B2;
	
END STRUCTURAL;
