Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;
Use ieee.std_logic_arith.all;

ENTITY timer IS
 PORT(
	clkin : IN STD_LOGIC;  
	Reset : IN STD_LOGIC;
	stop  : IN STD_LOGIC;
	data0 : OUT STD_LOGIC_VECTOR(3 downto 0);
	data1 : OUT STD_LOGIC_VECTOR(3 downto 0);
	data2 : OUT STD_LOGIC_VECTOR(3 downto 0);
	data3 : OUT STD_LOGIC_VECTOR(3 downto 0);
	data4 : OUT STD_LOGIC_VECTOR(3 downto 0);
	data5 : OUT STD_LOGIC_VECTOR(3 downto 0)
 );
END timer;



ARCHITECTURE timer_architecture OF timer IS

signal sec: integer range 0 to 60 ;
signal secL: integer range 0 to 9;
signal secH: integer range 0 to 9;

signal min: integer range 0 to 60 ;
signal minL: integer range 0 to 9;
signal minH: integer range 0 to 9;

signal hour: integer range 0 to 24 ;
signal hourL: integer range 0 to 9;
signal hourH: integer range 0 to 9;


BEGIN


timer:process(clkin,Reset,stop)
BEGIN
	if(Reset = '1') then hour <= 0;min <= 0; sec <= 0;
	elsif (stop = '0') then 
	if(clkin'event and clkin='1') then  
      sec<=sec+1;
      if (sec>=59)then 
	  sec<=0;min<=min+1;
	  if (min>=59)then 
	     min<=0;hour<=hour+1; 
	        if (hour>=23)then 
	   	       hour<=0;
	        end if;
	   end if;
       end if;
      end if;
     end if;
end process;


secH<=sec / 10;
secL<=sec-secH*10;
minH<=min / 10;
minL<=min-minH*10;
hourH<=hour / 10;
hourL<=hour-hourH*10;


sec_low:process(secL)
BEGIN
   case secL is
    when 0 =>data0<="0000";
    when 1 =>data0<="0001";
    when 2 =>data0<="0010"; 
    when 3 =>data0<="0011";
    when 4 =>data0<="0100";
    when 5 =>data0<="0101";
    when 6 =>data0<="0110";
    when 7 =>data0<="0111";
    when 8 =>data0<="1000";
    when 9 =>data0<="1001";
    when others =>data0<="1111";
  end case;
end process;

sec_high:process(secH)
BEGIN
   case secH is
    when 0 =>data1<="0000";
    when 1 =>data1<="0001";
    when 2 =>data1<="0010"; 
    when 3 =>data1<="0011";
    when 4 =>data1<="0100";
    when 5 =>data1<="0101";
    when 6 =>data1<="0110";
    when 7 =>data1<="0111";
    when 8 =>data1<="1000";
    when 9 =>data1<="1001";
    when others =>data1<="1111";
  end case;
end process;

min_low:process(minL)
BEGIN
   case minL is
    when 0 =>data2<="0000";
    when 1 =>data2<="0001";
    when 2 =>data2<="0010"; 
    when 3 =>data2<="0011";
    when 4 =>data2<="0100";
    when 5 =>data2<="0101";
    when 6 =>data2<="0110";
    when 7 =>data2<="0111";
    when 8 =>data2<="1000";
    when 9 =>data2<="1001";
    when others =>data2<="1111";
  end case;
end process;

min_high:process(minH)
BEGIN
   case minH is
    when 0 =>data3<="0000";
    when 1 =>data3<="0001";
    when 2 =>data3<="0010"; 
    when 3 =>data3<="0011";
    when 4 =>data3<="0100";
    when 5 =>data3<="0101";
    when 6 =>data3<="0110";
    when 7 =>data3<="0111";
    when 8 =>data3<="1000";
    when 9 =>data3<="1001";
    when others =>data3<="1111";
  end case;
end process;

hour_low:process(hourL)
BEGIN
   case hourL is
    when 0 =>data4<="0000";
    when 1 =>data4<="0001";
    when 2 =>data4<="0010"; 
    when 3 =>data4<="0011";
    when 4 =>data4<="0100";
    when 5 =>data4<="0101";
    when 6 =>data4<="0110";
    when 7 =>data4<="0111";
    when 8 =>data4<="1000";
    when 9 =>data4<="1001";
    when others =>data4<="1111";
  end case;
end process;

hour_high:process(hourH)
BEGIN
   case hourH is
    when 0 =>data5<="0000";
    when 1 =>data5<="0001";
    when 2 =>data5<="0010"; 
    when 3 =>data5<="0011";
    when 4 =>data5<="0100";
    when 5 =>data5<="0101";
    when 6 =>data5<="0110";
    when 7 =>data5<="0111";
    when 8 =>data5<="1000";
    when 9 =>data5<="1001";
    when others =>data5<="1111";
  end case;
end process;

END timer_architecture;