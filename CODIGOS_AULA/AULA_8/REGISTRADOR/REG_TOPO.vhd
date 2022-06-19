LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY REG_TOPO IS
   GENERIC(
      N       :   INTEGER  :=  16
   );
   PORT(
      i_RST   :   IN   STD_LOGIC;
      i_CLK   :   IN   STD_LOGIC;
      i_LOAD  :   IN   STD_LOGIC;
      i_DATA  :   IN   STD_LOGIC_VECTOR((N-1) DOWNTO 0);
      o_DATA  :   OUT  STD_LOGIC_VECTOR((N-1) DOWNTO 0)
   );
END REG_TOPO;

ARCHITECTURE BEHAVIORAL OF REG_TOPO IS
	
   COMPONENT REGISTRADOR IS
   GENERIC(
      N       :   INTEGER  :=  16
   );
   PORT(
      i_RST   :   IN   STD_LOGIC;
      i_CLK   :   IN   STD_LOGIC;
      i_LOAD  :   IN   STD_LOGIC;
      i_DATA  :   IN   STD_LOGIC_VECTOR((N-1) DOWNTO 0);
      o_DATA  :   OUT  STD_LOGIC_VECTOR((N-1) DOWNTO 0)
   );
   END COMPONENT;

BEGIN
	
   U01 : REGISTRADOR
   GENERIC MAP(
      N      =>   N/2   --Prevalece o N da hierarquia de topo (N/2 = 8, neste caso)
   )
   PORT MAP(
      i_RST   => i_RST,
      i_CLK   => i_CLK,
      i_LOAD  => i_LOAD,
      i_DATA  => i_DATA(N-1 DOWNTO N/2),  --Prevalece o N da hierárquia de topo (N/2 aqui também)
      o_DATA  => o_DATA(N-1 DOWNTO N/2)
   );
	
   U02 : REGISTRADOR
   GENERIC MAP(
      N      =>   N/2   --Prevalece o N da hierarquia de topo (N/2 = 8, neste caso)
   )
   PORT MAP(
      i_RST   => i_RST,
      i_CLK   => i_CLK,
      i_LOAD  => i_LOAD,
      i_DATA  => i_DATA((N/2)-1 DOWNTO 0), --Prevalece o N da hierárquia de topo (N/2 aqui também)
      o_DATA  => o_DATA((N/2)-1 DOWNTO 0)
   );
	
END BEHAVIORAL;
