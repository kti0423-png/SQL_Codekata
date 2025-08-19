set @h := -1;
select
    @h := @h + 1 as hour,
    (select count(1)
    from animal_outs
    where @h=hour(datetime)) as count
from animal_outs
where @h<23;