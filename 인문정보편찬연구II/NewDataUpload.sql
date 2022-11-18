use tutor

drop table hanyang2022Data
select * into hanyang2022Data from hanyang2022.dbo.hanyang2022Data
select * into hanyang2022LInks from hanyang2022.dbo.hanyang2022LInks

select * from sys.tables

select * from 사용자Link$
select * from 사용자Node$

--delete Node$
--where id is NULL

/* 자체 중복이 있는가? */

-- 1) 노드 중복 체크
select * from 사용자Node$
--110
select distinct id from 사용자Node$
--110
select id, count(*) from 사용자Node$
group by id
having count(*) > 1

--2) 링크 중복 체크

select * from 사용자Link$
--208
select distinct source, target, relation from 사용자Link$
--208

/* 기존 데이터와 중복이 있는가? */

--1) 노드 중복 체크 & 업로드
select * from 사용자Node$ as a
join hanyang2022.dbo.hanyang2022Data as b
on a.id=b.id

--중복데이터 14건
--※ infoUrl이 Null이 아니면 갱신 데이터로 판단

select * from 사용자Node$ as a
join hanyang2022Data as b
on a.id=b.id
where a.infoUrl is not NULL and b.infoUrl is NULL
--1건... 갱신 작업 대상

update hanyang2022Data
set class=a.class, groupName=a.groupName, partName=a.partName,
label=a.label, hangeul=a.hangeul, hanja=a.hanja, english=a.english,
infoUrl=a.infoUrl, iconUrl=a.iconUrl, note=a.note, remark=a.remark 
--select *
from 사용자Node$ as a
join hanyang2022Data as b
on a.id=b.id
where a.infoUrl is not NULL and b.infoUrl is NULL

--기존 데이터 1건 갱신

-- 신규 노드 추가
select * from 사용자Node$ as a
left join hanyang2022Data as b
on a.id=b.id
where b.id is NULL
-- 신규 노드 96 건

insert into hanyang2022Data
select a.* from 사용자Node$ as a
left join hanyang2022Data as b
on a.id=b.id
where b.id is NULL
-- 신규 노드 96건 입력

--2) 링크 중복 체크 및 업로드

select * from 사용자LInk$
-- 208건

select * from 사용자LInk$ as a
join hanyang2022Links as b
on a.source=b.source and a.target=b.target and a.relation=b.relation
-- 중복 3건

delete 사용자LInk$
from 사용자LInk$ as a
join hanyang2022Links as b
on a.source=b.source and a.target=b.target and a.relation=b.relation
-- 중복 3건 삭제 (새 링크 테이블에서)

select * from 사용자LInk$
-- 신규 링크 205건

--유효한 RDF인지 확인--
select * from 사용자LInk$ as a
join hanyang2022Data as b
on a.source=b.id
--136

select * from 사용자LInk$ as a
join hanyang2022Data as b
on a.target=b.id
--154

select a.* from 사용자LInk$ as a
left join hanyang2022Data as b
on a.source=b.id
where b.id is NULL
--69건...  Node 없는 source

union

select a.* from 사용자LInk$ as a
left join hanyang2022Data as b
on a.target=b.id
where b.id is NULL
--51건...  Node 없는 target


--유효하지 않은 Link 삭제
delete 사용자LInk$
from 사용자LInk$ as a
left join hanyang2022Data as b
on a.source=b.id
where b.id is NULL
--유효하지 않은 source 69건

delete 사용자LInk$
from 사용자LInk$ as a
left join hanyang2022Data as b
on a.target=b.id
where b.id is NULL
--24건...  Node 없는 target

select * from 사용자LInk$
--유효한 Link 112건

select * from 사용자LInk$ as a
join hanyang2022Data as b
on a.source=b.id
--112

select * from 사용자LInk$ as a
join hanyang2022Data as b
on a.target=b.id
--112


insert into hanyang2022Links
select * from 사용자LInk$
