LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY SUBTRACTOR_NBITS IS
   GENERIC(
      N      :  INTEGER := 4    -- Número de bits
   );
   PORT(
      i_A      :  IN  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
      i_B      :  IN  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
      o_Diff   :  OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
      o_Borrow :  OUT STD_LOGIC
   );
END SUBTRACTOR_NBITS;

ARCHITECTURE STRUCTURAL OF SUBTRACTOR_NBITS IS
   
   SIGNAL w_B : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	
   COMPONENT FULL_SUBTRACTOR IS
   PORT(
      i_A        :   IN   STD_LOGIC;
      i_B        :   IN   STD_LOGIC;
      i_Borrow   :   IN   STD_LOGIC;
      o_Diff     :   OUT  STD_LOGIC;
      o_Borrow   :   OUT  STD_LOGIC
   );
   END COMPONENT;
	
BEGIN
   
   LOOP_SUBTRACTOR : FOR i IN 0 TO N-1 GENERATE

      U_FADD0 : IF (i = 0) GENERATE
      ----------------
      FADD0: FULL_SUBTRACTOR
      ----------------
      PORT MAP (
         i_A       =>  i_A(i),
         i_B       =>  i_B(i),
         i_Borrow  =>  '0',
         o_Diff    =>  o_Diff(i),
         o_Borrow  =>  w_B(i)
      );   
      END GENERATE;
		 
      U_FADDN : IF (i /= 0) GENERATE
      ----------------
      FADDN: FULL_SUBTRACTOR
      ----------------
      PORT MAP (
         i_A       =>  i_A(i),
         i_B       =>  i_B(i),
         i_Borrow  =>  w_B(i-1),
         o_Diff    =>  o_Diff(i),
         o_Borrow  =>  w_B(i)
      );   
      END GENERATE;
		
   END GENERATE LOOP_SUBTRACTOR;
	
   o_Borrow <= w_B(N-1);

END STRUCTURAL;
