entity light is
  port (
	 hex0 : out bit_vector(0 to 6);
	 hex1 : out bit_vector(0 to 6);
	 hex2 : out bit_vector(0 to 6);
	 hex3 : out bit_vector(0 to 6);
	 key : in bit_vector(0 to 3);
	 sw: bit_vector(0 to 9);
	 ledr: buffer bit_vector (0 to 9)
  );
end light;

architecture arch of light is

function hex_digit(x:integer; constant hide_zero:boolean := false) return bit_vector is
begin
	case x is
		when 0 => 
			if hide_zero then
				return "1111111";
			else
				return "0000001";
			end if;
		when 1 => return "1001111";
		when 2 => return "0010010";
		when 3 => return "0000110";
		when 4 => return "1001100";
		when 5 => return "0100100";
		when 6 => return "0100000";
		when 7 => return "0001111";
		when 8 => return "0000000";
		when 9 => return "0000100";
		when others => return "1111111";
	end case;
end function;

begin

process(key)
	variable count:integer := 0;
begin
	if (key(0)'event and key(0) = '0') then
		count := count + 1;
	end if;
	
	hex0 <= hex_digit(count rem 10);
	hex1 <= hex_digit(count / 10, true);
end process;

process(sw)
begin
end process;

end arch;