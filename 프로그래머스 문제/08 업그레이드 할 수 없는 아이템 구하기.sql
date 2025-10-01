select
    t1.item_id, i.item_name, i.rarity
from item_tree as t1
left join item_tree as t2 on t1.item_id = t2.parent_item_id
inner join item_info as i on t1.item_id = i.item_id
where t2.item_id is null
order by 1 desc;