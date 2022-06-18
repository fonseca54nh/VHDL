-- O gerador de clock do kit do laboratório funciona a 50MHz
-- Logo, tenho que contar até 50M para fechar 1s
-- 50.000.000 em binário é:
	-- 0010 1111 1010 1111 0000 1000 0000 (28bits)

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY CRONOMETRO IS
	PORT(
		i_CLK        :   IN STD_LOGIC;
		i_RST        :   IN STD_LOGIC;
		i_START      :   IN STD_LOGIC;
		i_STOP       :   IN STD_LOGIC;
		i_CLEAR      :   IN STD_LOGIC;
		o_CONTADOR   :   OUT STD_LOGIC_VECTOR(27 DOWNTO 0);
		o_LED        :   OUT STD_LOGIC
	);
END CRONOMETRO;

ARCHITECTURE BEHAVIORAL OF CRONOMETRO IS

	TYPE ESTADO IS (st_IDLE, st_CONTAR, st_PARAR);
	
		ATTRIBUTE syn_encoding : string;
		ATTRIBUTE syn_encoding OF Estado : TYPE IS "safe";
		
	SIGNAL w_STATE      :  Estado;
	SIGNAL w_CONTADOR   :  STD_LOGIC_VECTOR(27 DOWNTO 0); 
	SIGNAL w_LED        :  STD_LOGIC;
	
BEGIN

	PROCESS(i_RST, i_CLK)
	BEGIN
		IF(i_RST = '1') THEN
			w_CONTADOR <= (OTHERS => '0');
			w_LED <= '0';
			w_STATE <= st_IDLE;
		ELSIF RISING_EDGE(i_CLK) THEN
			CASE w_STATE IS
			   WHEN st_IDLE =>
			      IF(i_START = '1') THEN
				      w_CONTADOR <= w_CONTADOR + 1;
						w_STATE <= st_CONTAR;
					ELSE
						w_STATE <= st_IDLE;
					END IF;
				WHEN st_CONTAR =>
					IF(i_STOP = '1') THEN
						w_STATE <= st_PARAR;
					ELSIF(i_CLEAR = '1') THEN
						w_CONTADOR <= (OTHERS => '0');
						w_STATE <= st_IDLE;
					ELSE
						w_CONTADOR <= w_CONTADOR + 1;
						IF(w_CONTADOR = "0010111110101111000010000000") THEN
						   w_CONTADOR <= (OTHERS => '0');
							w_LED <= NOT w_LED;	        --- Ponto do código que eventualmente sofrerá ajustes
						   w_STATE <= st_CONTAR;
						END IF;
					END IF;
				WHEN st_PARAR =>
					IF(i_START = '1') THEN
						w_CONTADOR <= w_CONTADOR + 1;
				      w_STATE <= st_CONTAR;
					ELSIF(i_CLEAR  = '1') THEN
						w_CONTADOR <= (OTHERS => '0');
						w_STATE <= st_IDLE;
					ELSE
						w_STATE <= st_PARAR;
					END IF;
				WHEN OTHERS => 
						w_STATE <= st_IDLE;
         END CASE;
	   END IF;
	END PROCESS;
	
	--
	-- Coloca sinal interno na saída
	--
	
	o_CONTADOR <= w_CONTADOR;
	o_LED      <= w_LED;
END BEHAVIORAL;
