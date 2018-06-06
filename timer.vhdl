entity boardio is
  port (
    clock_50: in bit;
	 hex0 : out bit_vector(0 to 6);
	 hex1 : out bit_vector(0 to 6);
	 hex2 : out bit_vector(0 to 6);
	 hex3 : out bit_vector(0 to 6);
	 key : in bit_vector(0 to 3);
	 sw: bit_vector(0 to 9);
	 ledr: buffer bit_vector (0 to 9)
  );
end boardio;

architecture arch of boardio is
signal count : integer := 1; -- not a variable!
signal clock_1hz : bit := '0';
signal mins, secs : integer range 0 to 59 := 0;

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

-- 1hz clock
process(clock_50)
begin
	if (clock_50'event and clock_50 = '1') then
		count <= count + 1;
		if (count = 25000000) then -- half the rate
			clock_1hz <= not clock_1hz;
			count <= 1;
		end if;
	end if;
end process;

process(clock_1hz, key)
begin
	-- update # of seconds
	if (clock_1hz'event and clock_1hz = '1') then
		if (key(0) = '0') then
			secs <= 0;
			mins <= 0;
		else
			if (secs = 59) then
				mins <= (mins + 1) rem 60;
			end if;
			secs <= (secs + 1) rem 60;
		end if;
	end if;
end process;

process(clock_1hz)
begin
		hex0 <= hex_digit(secs rem 10);
		hex1 <= hex_digit(secs / 10, true);
		hex2 <= hex_digit(mins rem 10, mins = 0);
		hex3 <= hex_digit(mins / 10, true);
end process;

end arch;