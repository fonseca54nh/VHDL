LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY NBITS_ADDER IS
   GENERIC(
      N      :  INTEGER := 8    -- Número de bits
   );
   PORT(
      i_A    :  IN  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
      i_B    :  IN  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
      o_S    :  OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
      o_C    :  OUT STD_LOGIC
   );
END NBITS_ADDER;

ARCHITECTURE BEHAVIORAL OF NBITS_ADDER IS
   
   SIGNAL w_C : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	
   COMPONENT FULL_ADDER IS
      PORT(
         i_A    :   IN   STD_LOGIC;
         i_B    :   IN   STD_LOGIC;
         i_C    :   IN   STD_LOGIC;
         o_S    :   OUT  STD_LOGIC;
         o_C    :   OUT  STD_LOGIC
      );
   END COMPONENT;
	
BEGIN
   
   LOOP_ADDER : FOR i IN 0 TO N-1 GENERATE

      U_FADD0 : IF (i = 0) GENERATE
         ----------------
         FADD0: FULL_ADDER
         ----------------
         PORT MAP (
            i_A  =>  i_A(i),
            i_B  =>  i_B(i),
            i_C  =>  '0',
            o_S  =>  o_S(i),
            o_C  =>  w_C(i)
         );   
      END GENERATE;
		 
      U_FADDN : IF (i /= 0) GENERATE
         ----------------
         FADDN: FULL_ADDER
         ----------------
         PORT MAP (
            i_A  =>  i_A(i),
            i_B  =>  i_B(i),
            i_C  =>  w_C(i-1),
            o_S  =>  o_S(i),
            o_C  =>  w_C(i)
         );   
      END GENERATE;
		
   END GENERATE LOOP_ADDER;
	
   o_C <= w_C(N-1);

END BEHAVIORAL;
