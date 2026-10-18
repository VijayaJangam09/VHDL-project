----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/26/2026 05:00:34 PM
-- Design Name: 
-- Module Name: andtest - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity andtest is
    Port ( S0 : in STD_LOGIC_VECTOR (0 downto 0);
           S1 : in STD_LOGIC_VECTOR (0 downto 0);
           RNOUT : out STD_LOGIC_VECTOR (0 downto 0));
end andtest;

architecture Behavioral of andtest is

begin
RNOUT <= S0 and S1;
--RNOUT <= S0 or S1;
--RNOUT <= S0 xor S1;



end Behavioral;
