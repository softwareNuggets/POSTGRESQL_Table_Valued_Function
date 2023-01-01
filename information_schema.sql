-- first, let's do some data discovery so we understand our data

select 	ordinal_position, column_name, data_type, udt_name, 
		is_nullable, character_maximum_length
from information_schema.columns
where table_name = 'actor'