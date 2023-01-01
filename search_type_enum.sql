-- we want to limit the terms that can be used to search the first name column
-- so we will use an enum data type.

create type search_type as enum
(
	'startsWith',
	'endsWith',
	'contains'
)