LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY StorageU IS
	PORT(A: IN STD_LOGIC_VECTOR(7 DOWNTO 0);--8 bit A input
			Resetn, Clock: IN STD_LOGIC;--1 bit clock input and 1 bit rest input
			Q: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));--8 bit output
END StorageU;
ARCHITECTURE Behaviour OF StorageU IS
BEGIN
	PROCESS(Resetn, Clock)--process takes reset and clock as inputs
	BEGIN
		IF Resetn='0'THEN--when reset input  is '0' the latch does not operate
			Q <= "00000000";
		ELSIF Clock'EVENT AND Clock = '1' THEN--level sensitive based on clock
			Q <= A;
		END IF;
	END PROCESS;
END Behaviour;