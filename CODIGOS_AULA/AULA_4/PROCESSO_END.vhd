LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY PROCESSO_AND IS
	PORT(
		i_A : in  STD_LOGIC;
		i_B : in  STD_LOGIC;
		o_C : out STD_LOGIC
	);
END PROCESSO_AND;

ARCHITECTURE BEHAVIORAL OF PROCESSO_AND IS
BEGIN
	PROCESS (i_A, i_B)
	BEGIN
		o_C <= i_A AND i_B;
	END PROCESS;
END BEHAVIORAL;
