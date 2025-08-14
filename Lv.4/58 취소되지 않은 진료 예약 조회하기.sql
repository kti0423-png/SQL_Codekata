SELECT
    a.apnt_no,
    p.pt_name,
    a.pt_no,
    a.mcdp_cd,
    d.dr_name,
    a.apnt_ymd
from patient p
left join appointment a
on p.pt_no=a.pt_no
left join doctor d
on a.mddr_id=d.dr_id
where
    a.apnt_ymd like ('2022-04-13%')
    and a.apnt_cncl_yn = 'N'
    and a.mcdp_cd = 'CS'
order by 6 asc;