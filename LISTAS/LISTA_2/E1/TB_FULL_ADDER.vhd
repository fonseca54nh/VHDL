-- This TB require 160ns
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY TB_FULL_ADDER IS
END TB_FULL_ADDER;

ARCHITECTURE TEST OF TB_FULL_ADDER IS

   COMPONENT FULL_ADDER IS
   PORT(
      i_A    :   IN   STD_LOGIC;
      i_B    :   IN   STD_LOGIC;
      i_C    :   IN   STD_LOGIC;
      o_S    :   OUT  STD_LOGIC;
      o_C    :   OUT  STD_LOGIC
   );
   END COMPONENT;
	
   SIGNAL w_A   : STD_LOGIC;
   SIGNAL w_B   : STD_LOGIC;
   SIGNAL w_C   : STD_LOGIC;
   SIGNAL w_S   : STD_LOGIC;
   SIGNAL w_Cpp : STD_LOGIC;

   BEGIN

   U01: FULL_ADDER
   PORT MAP(
      i_A => w_A,
      i_B => w_B,
      i_C => w_C,
      o_S => w_S,
      o_C => w_Cpp
   );
	
   -- CHECKING ALL INPUT COMBINATIONS
   PROCESS BEGIN
     
      w_A <= '0';
      w_B <= '0';
      w_C <= '0';
      -- EXPECTED: w_Cpp=0 e w_S=0 
      WAIT FOR 20 ns;
		
      w_A <= '1';
      w_B <= '0';
      w_C <= '0';
      -- EXPECTED: w_Cpp=0 e w_S=1
      WAIT FOR 20 ns;
		
      w_A <= '0';
      w_B <= '1';
      w_C <= '0';
      -- EXPECTED: w_Cpp=0 e w_S=1
      WAIT FOR 20 ns;
				
      w_A <= '1';
      w_B <= '1';
      w_C <= '0';
      -- EXPECTED: w_Cpp=1 e w_S=0
      WAIT FOR 20 ns;
  
      w_A <= '0';
      w_B <= '0';
      w_C <= '1';
      -- EXPECTED: w_Cpp=0 e w_S=1
      WAIT FOR 20 ns;
		
      w_A <= '1';
      w_B <= '0';
      w_C <= '1';
      -- EXPECTED: w_Cpp=1 e w_S=0
      WAIT FOR 20 ns;
		
      w_A <= '0';
      w_B <= '1';
      w_C <= '1';
      -- EXPECTED: w_Cpp=1 e w_S=0
      WAIT FOR 20 ns;

      w_A <= '1';
      w_B <= '1';
      w_C <= '1';
      -- EXPECTED: w_Cpp=1 e w_S=1
   WAIT;

END PROCESS;

END TEST; 
