library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU3 is
    port (
        Clock : in std_logic;
        A, B : in unsigned(7 downto 0);
        student_id : in unsigned(3 downto 0);
        OP : in unsigned(15 downto 0);
        Neg : out std_logic;
        R1 : out unsigned(3 downto 0);
        R2 : out unsigned(3 downto 0)
    );
end ALU3;

architecture calculation of ALU3 is
    signal Reg1, Reg2, Result : unsigned(7 downto 0) := (others => '0');
begin
    Reg1 <= A;
    Reg2 <= B;

    process (Clock, OP)
    begin
        if (rising_edge(Clock)) then
            case OP is
                when "0000000000000001"=>
           
                    Result <= Reg1 + Reg2;  -- Replace this with your actual logic
            
                    if student_id mod 2 = 0 then
                        Neg <= '1';  -- 'y' if even
                    else
                        Neg <= '0';  -- 'n' if odd
                    end if;

                when "0000000000000010"=>
         
                    Result <= Reg1 - Reg2;  -- Replace this with your actual logic
               
                    if student_id mod 2 = 0 then
                        Neg <= '1';  -- 'y' if even
                    else
                        Neg <= '0';  -- 'n' if odd
                    end if;



                when others =>
              
                    Neg <= '0';
            end case;
        end if;
    end process;

    R1 <= Result(3 downto 0);
    R2 <= Result(7 downto 4);
end calculation;


