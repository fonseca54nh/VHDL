LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY TB_SOMADOR_NBITS IS
   GENERIC(
      CHOICE  :  INTEGER := 2;   -- Possible Test Options: 1, 2, (3, 4, 5, ...) 
      N       :  INTEGER := 8    -- Bus Width
   );
END TB_SOMADOR_NBITS;

ARCHITECTURE TEST OF TB_SOMADOR_NBITS IS

   COMPONENT SOMADOR_NBITS IS
      GENERIC(
         N       :  INTEGER := 8    -- Bus Width
      );
      PORT(
         i_A     :  IN  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
         i_B     :  IN  STD_LOGIC_VECTOR(N-1 DOWNTO 0);
         o_S     :  OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
         o_C     :  OUT STD_LOGIC
      );
   END COMPONENT;
	
   SIGNAL w_A : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
   SIGNAL w_B : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
   SIGNAL w_S : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
   SIGNAL w_C : STD_LOGIC;

BEGIN

   -- An instance of SOMADOR_NBITS
   U01: SOMADOR_NBITS
   GENERIC MAP(
      N   => 8
   )
   PORT MAP(
      i_A => w_A,
      i_B => w_B,
      o_S => w_S,
      o_C => w_C
   );
	
   PROCESS BEGIN
	
      IF (CHOICE = 1) THEN
         w_A <= "10101010";
         w_B <= "00011101";
         WAIT FOR 20 ns;
         WAIT;
         --------------------
         ------EXPECTED------
         --------------------
         -- w_S = 11000111 --
         -- w_C = 0        --
         --------------------
         --------------------
      ELSIF (CHOICE = 2) THEN
         w_A <= "10101010";
         w_B <= "10011101";
         WAIT FOR 20 ns;
         WAIT;
         --------------------
         ------EXPECTED------
         --------------------
         -- w_S = 01000111 --
         -- w_C = 1        --
         --------------------
         --------------------
      ELSE
         w_A <= "11101010";
         w_B <= "10011101";
         WAIT FOR 20 ns;
         WAIT;
         --------------------
         ------EXPECTED------
         --------------------
         -- w_S = 10000111 --
         -- w_C = 1        --
         --------------------
      END IF;
	
   END PROCESS;
	
END TEST;
