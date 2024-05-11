LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.Numeric_Std.ALL;
ENTITY clock_divider IS
	GENERIC (N : INTEGER);
	PORT (
		clk : IN std_logic;
		clk_out : OUT std_logic 
	);
END clock_divider;
ARCHITECTURE arch_clock_divider OF clock_divider IS
	SIGNAL pulse : std_logic := '0';
	SIGNAL count : INTEGER := 0;
BEGIN
	PROCESS (clk)
	BEGIN
		IF rising_edge(clk) THEN
			IF (count = (N - 1)) THEN
				pulse <= NOT pulse;
				count <= 0; -- reset count
			ELSE
				count <= count + 1;
			END IF;
		END IF;
	END PROCESS;
	clk_out <= pulse;
END arch_clock_divider;