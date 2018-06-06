library ieee;
use ieee.std_logic_1164.all;
library ps;
use ps.hex_conv.all;

entity boardio is
  port (
	 clock_50 : in std_logic;
	 hex0 : out std_logic_vector(0 to 6);
	 hex1 : out std_logic_vector(0 to 6);
	 hex2 : out std_logic_vector(0 to 6);
	 hex3 : out std_logic_vector(0 to 6);
	 key  : in std_logic_vector(0 to 3);
	 sw   : in std_logic_vector(0 to 9);
	 ledr : buffer std_logic_vector (0 to 9)
  );
end boardio;

architecture arch of boardio is

function count_ones(s : std_logic_vector) return integer is
  variable temp : integer := 0;
begin
  for i in s'range loop
    if s(i) = '1' then temp := temp + 1; 
    end if;
  end loop;
  
  return temp;
end function count_ones;

begin

gen: for i in 0 to 4 generate
  ha: entity ps.half_adder_entity port map(
    sw(i*2), sw(i*2+1), ledr(i*2), ledr(i*2+1)
  );
end generate gen;

process(sw)
begin

hex0 <= hex_digit(count_ones(sw));
hex1 <= hex_digit(0, true);
hex2 <= hex_digit(0, true);
hex3 <= hex_digit(0, true);

end progress;

end arch;