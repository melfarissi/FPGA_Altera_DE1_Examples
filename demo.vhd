entity light is
  port (
    ledr : out bit_vector(0 to 9);
	 ledg : out bit_vector(0 to 7);
	 hex0 : out bit_vector(0 to 6);
	 hex1 : out bit_vector(0 to 6);
	 hex2 : out bit_vector(0 to 6);
	 hex3 : out bit_vector(0 to 6);
	 
	  key : in bit_vector(0 to 3);
		sw : in bit_vector(0 to 9)
  );
end light;

architecture arch of light is
begin
  -- there is no clock in this design

  ledr <= sw; -- connect each switch to a red led
  
  -- light the first green led
  ledg(0) <= '1';
  
  -- ensure key 0 turns on leftmost green led
  ledg(7) <= not key(0);
  
  -- light up a green led if two buttons are pressed at the same time
  ledg(4) <= not key(2) and not key(3);
  
  -- show 1234 on the hex display
  hex3 <= "1001111"; -- 1
  hex2 <= "0010010"; -- 2
  hex1 <= "0000110"; -- 3
  hex0 <= "1001100"; -- 4
end arch;