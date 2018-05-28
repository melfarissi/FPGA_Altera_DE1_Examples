entity hellofpga is
	port(
		ledr : out bit_vector(0 to 9);
		sw : in bit_vector(0 to 9)
	);
end hellofpga;

architecture arch of hellofpga is
begin
	ledr <= sw;
end arch;
