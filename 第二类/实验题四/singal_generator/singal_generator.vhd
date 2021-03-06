Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;
Use ieee.std_logic_arith.all;


ENTITY  singal_generator IS
 PORT(
	clkin: IN STD_LOGIC;		-- 184.32KHz
	clkout1: OUT STD_LOGIC;  	--0.25s
	clkout2: OUT STD_LOGIC;		--0.5s
	clkout3: OUT STD_LOGIC;		--1s
	clkout4: OUT STD_LOGIC		--2s
 );
END singal_generator;
 
 ARCHITECTURE content OF singal_generator IS
 
	SIGNAL counter1: integer range 0 to 23040;
	SIGNAL counter2: integer range 0 to 46080;
	SIGNAL counter3: integer range 0 to 92160;
	SIGNAL counter4: integer range 0 to 184320;
	SIGNAL Clk1:Std_Logic;
	SIGNAL Clk2:Std_Logic;
	SIGNAL Clk3:Std_Logic;
	SIGNAL Clk4:Std_Logic;
	
BEGIN

	PROCESS(clkin)  
	 BEGIN
	 
		IF(rising_edge(clkin)) THEN
			
			IF( counter1=23040 ) THEN 
				counter1 <= 0;
				Clk1 <= NOT Clk1;
			ELSE
				counter1 <= counter1+1;
			END IF;
			
			
			IF( counter2=46080 ) THEN 
				counter2 <= 0;
				Clk2 <= NOT Clk2;
			ELSE
				counter2 <= counter2+1;
			END IF;
			
			
			IF( counter3=92160 ) THEN 
				counter3 <= 0;
				Clk3 <= NOT Clk3;
			ELSE
				counter3 <= counter3+1;
			END IF;
			
			
			IF( counter4= 184320 ) THEN 
				counter4 <= 0;
				Clk4 <= NOT Clk4;
			ELSE
				counter4 <= counter4+1;
			END IF;
		
		END IF;
	
	END PROCESS;

	clkout1 <= Clk1;
	clkout2 <= Clk2;
	clkout3 <= Clk3;
	clkout4 <= Clk4;

 END content;