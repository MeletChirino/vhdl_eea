library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.std_logic_unsigned.all;
use	ieee.numeric_std.all;

library	work;
use 	work.tools.all;

entity project is
	port(
		clk_in	: in std_logic;
		output	: out std_logic_vector(6 downto 0)
		--aqui hay que meterle otras entradas como el 
		--C
		--Reset
	);
end entity;

architecture rtl of project is
	--falta el frequency divider
	component counter
		port(
			input	: in std_logic;
			C	: in std_logic;
			reset	: in std_logic;		
			output 	: out std_logic_vector(3 downto 0)
		    );
	end component;
	component bcd_7sg
	       port(
			bcd_input	: in std_logic_vector(3 downto 0);
			output_7seg	: out std_logic_vector(6 downto 0)
		   );
	end component;	       
	signal first_input	: std_logic;
	signal counter_result	: std_logic_vector(3 downto 0);
	signal c		: std_logic := '1';
	signal reset		: std_logic := '0';
begin
	increment	: counter port map(
			--senhal externa => senhal interna
			input	=> clk_in,
			c	=> c,
			reset	=> reset,
			output	=> counter_result
			);

	bcd_to_7seg : bcd_7sg port map(
			--senhal externa => senhal interna
			bcd_input	=> counter_result,
			output_7seg	=> output
			);
end rtl;

