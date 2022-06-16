LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY TB_MUX IS
END TB_MUX;

ARCHITECTURE BEHAVIORAL OF TB_MUX IS

    COMPONENT MUX IS
        PORT(
            i_A   :  in  STD_LOGIC_VECTOR(7 DOWNTO 0);
            i_B   :  in  STD_LOGIC_VECTOR(7 DOWNTO 0);
		i_C   :  in  STD_LOGIC_VECTOR(7 DOWNTO 0);
            i_D   :  in  STD_LOGIC_VECTOR(7 DOWNTO 0);
            o_C   :  out STD_LOGIC_VECTOR(7 DOWNTO 0);
    	      i_SEL :  in  STD_LOGIC_VECTOR(1 DOWNTO 0)
        );
    END COMPONENT;
	 
	 SIGNAL w_A    :  STD_LOGIC_VECTOR(7 DOWNTO 0);
	 SIGNAL w_B    :  STD_LOGIC_VECTOR(7 DOWNTO 0);
	 SIGNAL w_C    :  STD_LOGIC_VECTOR(7 DOWNTO 0);
	 SIGNAL w_D    :  STD_LOGIC_VECTOR(7 DOWNTO 0);
	 SIGNAL w_OUT  :  STD_LOGIC_VECTOR(7 DOWNTO 0);
	 SIGNAL w_SEL  :  STD_LOGIC_VECTOR(1 DOWNTO 0);

BEGIN

	UUT : MUX
	PORT MAP(
	     i_A   =>  w_A,
           i_B   =>  w_B,
	     i_C   =>  w_C,
	     i_D   =>  w_D,
	     o_C   =>  w_OUT,
           i_SEL =>  w_SEL
	);
	
	
	PROCESS
	BEGIN
              w_A <= x"AA";
		  w_B <= x"BB";
		  w_C <= x"CC";
		  w_D <= x"DD";
		  
		  w_SEL <= "00";
		  WAIT FOR 20 ns;
		  
		  w_SEL <= "01";
		  WAIT FOR 20 ns;
		  
		  w_SEL <= "10";
		  WAIT FOR 20 ns;
		  
		  w_SEL <= "11";
		  WAIT FOR 20 ns;
		  
	END PROCESS;

END BEHAVIORAL;