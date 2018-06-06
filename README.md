# FPGA_Altera_DE1_Examples

# Lab1(hellofpga.vhd)
•As you flip the switches(SW0-9) the corresponding LEDs(LEDR0-9) lights up.

# Lab2(demo.vhd)
•Visualizing the numbers 1234 on the 4-Digit 7-Segment Display. <br />
•As you flip the switches(SW0-9) the corresponding LEDs(LEDR0-9) lights up. /n
•The rightmost button (KEY0) is connected to LEDG7, so when you press it you will notice the leftmost led (LEDG7) lights up.
•We also connected KEY3 and KEY2 to light up LEDG4 in the middle but only when they're pressed together 
•LEDG0 is light up using simple single signal assignment.

# Lab3(bordio.vhdl)
•The counter is primarly at the value 0 (on HEX0) and as you start pressing the button KEY0 the counter is increasing, and as soon as I go over 9 you get 1 on HEX1 7-segment display. 

# Lab4-Resettable Timer-(timer.vhdl)
•A very simple design of a timer which counts up the number of seconds and minutes and if you press the rightmost button(KEY0) you will see that the entire clock is reset back to zero.

# Lab5(bordio.vhd - half_adder.vhd - hex_conv.vhd)
•We count the number of switches (SW0-9) that have been flipped and present that on the 4-Digit 7-Segment Display.
•We implement a simple half adder using SW1 and SW0 as inputs, LEDR0 represent the Sum pin and LEDR1 the Carry one.


