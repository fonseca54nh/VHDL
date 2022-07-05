-- Teste de Reset
	process
	begin
		w_RST <= '1';
		wait for 40 ns;
		w_RST <= '0';
		wait;
	end process;
	
	-- Teste de Clock
	process
	begin
		w_CLOCK <= '0';
		wait for 20 ns;
		w_CLOCK <= '1';
		wait for 20 ns;
	end process;
	
	-- Teste de Escrita
	process
	begin
		w_WR <= '0';
		wait for 40 ns;
		w_WR <= '1';
		wait for 40 ns;
	end process;
-- Teste de Enable
	process
	begin
		w_EN <= '0';
		wait for 60 ns;
		w_EN <= '1';
		wait for 60 ns;
	end process;
	
	process
	begin
		w_ADD <= x"001";
		wait for 80 ns;
		w_ADD <= x"000";
		wait for 80 ns;
	end process;
