create or replace function fn_get_actors(begin_end_contain varchar(20), param_firstName varchar(45) )
returns table
(
	actor_id integer,
	first_name varchar(45),
	last_name  varchar(45)
) AS
$$
begin

	if begin_end_contain = 'begin' then
		return query
		select 	act.actor_id,
				act.first_name,
				act.last_name
		from actor act
		where upper(act.first_name) like upper(param_firstName) || '%';
	
	elsif begin_end_contain = 'end' then
	
		return query
		select 	act.actor_id,
				act.first_name,
				act.last_name
		from actor act
		where upper(act.first_name) like '%' || upper(param_firstName) ;
		
	elsif begin_end_contain = 'contain' then
	
		return query
		select 	act.actor_id,
				act.first_name,
				act.last_name
		from actor act
		where upper(act.first_name) like '%' || upper(param_firstName) || '%';
	end if;
end;
$$
Language 'plpgsql';