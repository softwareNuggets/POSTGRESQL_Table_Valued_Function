create or replace function fn_get_actors_v1(searchBy search_type, param_firstName varchar(45) )
returns table
(
	actor_id integer,
	first_name varchar(45),
	last_name  varchar(45)
) as
$$
begin

	if searchBy = 'startsWith' then
		return query
		select 
			act.actor_id,
			act.first_name,
			act.last_name
		from actor act
		where upper(act.first_name) like upper(param_firstName) || '%';
		
		
	elsif searchBy = 'endsWith' then
		return query
		select 
			act.actor_id,
			act.first_name,
			act.last_name
		from actor act
		where upper(act.first_name) like '%' || upper(param_firstName);	
		
	elsif searchBy = 'contains' then
		return query
		select 
			act.actor_id,
			act.first_name,
			act.last_name
		from actor act
		where upper(act.first_name) like '%' || upper(param_firstName) || '%';		
	end if;

end;
$$
Language 'plpgsql';