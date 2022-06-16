LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY FlipFlopSinc IS
	PORT (
		i_RST   :  IN   STD_LOGIC;
		i_CLK   :  IN   STD_LOGIC;
		i_DATA  :  IN   STD_LOGIC;
		o_DATA  :  out  STD_LOGIC
	);
END FlipFlopSinc;

ARCHITECTURE BEHAVIORAL OF FlipFlopSinc IS

BEGIN

	PROCESS(i_CLK)
	BEGIN
		IF RISING_EDGE(i_CLK) THEN
			IF (i_RST = '1') THEN
				o_DATA <= '0';
			ELSE
				o_DATA <= i_DATA;
			END IF;
		END IF;
	END PROCESS;

END BEHAVIORAL; 
