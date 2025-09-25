select d1.id, d1.genotype, d2.genotype as parent_genotype
from ecoli_data as d1, ecoli_data as d2
where
    d1.parent_id = d2.id
    and (d1.genotype & d2.genotype) = d2.genotype
order by d1.id