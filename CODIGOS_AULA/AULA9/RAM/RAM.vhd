LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY RAM IS
   GENERIC(
      p_MEMORY_TYPE     :    STRING  := "INTEL";   -- Possible values: "INTEL"|"OWN"
      p_MEMORY_RESOURCE :    STRING  := "LOGIC";   -- Possible values: "LOGIC"|"M9K"
      p_DATA_WIDTH      :    INTEGER := 8;         -- Bus width: 8 bits
      p_ADD_WIDTH       :    INTEGER := 6          -- number of positions: (2^6) = 64
   );
   PORT(
      i_CLK             :    IN  STD_LOGIC;
      i_DATA            :    IN  STD_LOGIC_VECTOR(p_DATA_WIDTH-1 DOWNTO 0);
      i_ADD             :    IN  STD_LOGIC_VECTOR(p_ADD_WIDTH-1 DOWNTO 0);
      i_WE              :    IN  STD_LOGIC;
      i_EN              :    IN  STD_LOGIC;
      o_DATA            :    OUT STD_LOGIC_VECTOR(p_DATA_WIDTH-1 DOWNTO 0)	
   );
END RAM;

ARCHITECTURE BEHAVIORAL OF RAM IS

   TYPE MEM_TYPE IS ARRAY (i_ADD'RANGE) OF STD_LOGIC_VECTOR(i_DATA'RANGE);
   SIGNAL w_MEMORY : MEM_TYPE;

   ATTRIBUTE RAMSTYLE : STRING;
   ATTRIBUTE RAMSTYLE OF w_MEMORY : SIGNAL IS p_MEMORY_RESOURCE;

   COMPONENT INTEL_MEMORY
   PORT
   (
      address         :    IN STD_LOGIC_VECTOR (5 DOWNTO 0);
      clken           :    IN STD_LOGIC  := '1';
      clock           :    IN STD_LOGIC  := '1';
      data            :    IN STD_LOGIC_VECTOR (7 DOWNTO 0);
      wren            :    IN STD_LOGIC ;
      q               :    OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
   );
   END COMPONENT;


BEGIN

   U_INTEL : IF (p_MEMORY_TYPE = "INTEL") GENERATE
   U01     : INTEL_MEMORY PORT MAP (
      address        =>   i_ADD,
      clken          =>   i_EN,
      clock          =>   i_CLK,
      data           =>   i_DATA,
      wren           =>   i_WE,
      q              =>   o_DATA
   );
   END GENERATE;
	
   U_OWN : IF (p_MEMORY_TYPE = "OWN") GENERATE
      PROCESS(i_CLK)
      BEGIN
         IF(RISING_EDGE(i_CLK)) THEN 
            IF(i_EN = '1') THEN
               IF(i_WE = '1') THEN
                  w_MEMORY(CONV_INTEGER(i_ADD)) <= i_DATA;
               ELSE
                  o_DATA <= w_MEMORY(CONV_INTEGER(i_DATA));
               END IF;
            END IF;		
         END IF;
      END PROCESS;
   END GENERATE;

END BEHAVIORAL;
