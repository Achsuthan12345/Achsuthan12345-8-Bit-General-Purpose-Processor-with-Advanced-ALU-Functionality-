LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;
entity ALU4 is
port(Clk: in std_logic; --input clock signal
	  A,B :in unsigned(7 downto 0); --8-bit inputs from latches A and B
	  OP : in unsigned(15 downto 0);
	  Neg: out std_logic;
	  R1: out unsigned(3 downto 0);
	  R2: out unsigned(3 downto 0));
end ALU4;
architecture calculation of ALU4 is
signal Reg1,Reg2,Result : unsigned(7 downto 0):= (others => '0');
signal Reg4: unsigned(0 to 7);
begin
Reg1 <= A;
Reg2 <= B;
process(Clk, OP)
begin
	if(rising_edge(Clk))THEN
		case OP is
		  WHEN "0000000000000001" =>
		  Result <= (A+B);
		     WHEN "0000000000000010" =>
			  if(B>A)THEN
			  Result <= (B-A);
			  Neg <= '1';
			  ELSE
			  Result <= (A-B);
			  Neg<='0';
			  end if;
			  WHEN "0000000000000100" =>
			  Result <= not(A);
			  Neg<='0';
			  WHEN "0000000000001000" =>
			  Result <= not(A and B);
			  Neg<='0';
			  WHEN "0000000000010000" =>
			  Result <= not(A or B);
			  Neg<='0';
			  WHEN "0000000000100000" =>
			  Result <= (A and B);
			  Neg<='0';
			  WHEN "0000000001000000" =>
			  Result <= (A xor B);
			  Neg<='0';
			  WHEN "0000000010000000" =>
			  Result <= (A or B);
			  Neg<='0';
			  WHEN "0000000100000000" =>
			  Result <= not(A xor B);
			  Neg<='0';
			  WHEN OTHERS =>
		end case;
	end if;
end process;
R1 <= Result(3 downto 0);
R2 <= Result(7 downto 4);
end calculation;
			  