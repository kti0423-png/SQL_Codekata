set @num = 1;
set @num1 = 1;

select group_concat(numa separator '&')
from
    (select @num := @num + 1 as numa
    from information_schema.tables as t1,
        information_schema.tables as t2
    ) as a
where
    numa <= 1000
    and not exists
                (select *
                from (
                    select @num1 := @num1 + 1 as numb
                    from information_schema.tables as t1,
                        information_schema.tables as t2
                    limit 1000
                ) as b
                where
                    mod(numa, numb) = 0
                    and numb != numa
                    )