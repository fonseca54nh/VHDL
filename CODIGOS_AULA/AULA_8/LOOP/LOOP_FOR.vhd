LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY LOOP_FOR IS
   GENERIC(
      N   :     INTEGER   :=   3                        -- Numero de bits
   );
   PORT(
      X,Y : IN  STD_LOGIC_VECTOR(N-1 DOWNTO 0);         -- Entradas do somados
      ZE  : IN  STD_LOGIC;                              -- Vem um
      S   : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);         -- Saida
      ZS  : OUT STD_LOGIC                               -- Vai um
   );
END LOOP_FOR;

ARCHITECTURE BEHAVIORAL OF LOOP_FOR IS
BEGIN
   abc: PROCESS(X,Y,ZE)
      VARIABLE V : STD_LOGIC_VECTOR (N DOWNTO 0);       -- Vai um interno
   BEGIN
      V(0) := ZE;
      abc : FOR i IN 0 TO n-1 LOOP
         S(i)   <=   X(i)  XOR  Y(i)  XOR V(i);
         V(i+1) :=   (X(i) AND  Y(i)) OR  (X(i) AND V(i)) OR (Y(i) AND V(i));
      END LOOP abc;	
      ZS <= V(N);
   END PROCESS;
END BEHAVIORAL; 
