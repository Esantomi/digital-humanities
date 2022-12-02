/* 인문정보편찬연구II (22.12.02) */

USE hanyang2022


--DecNode 조회
select * from DecNode$

select * from DecNode$
	where 최종수정id is NULL

--최종수정 id 중복 확인용
select distinct 최종수정id from DecNode$

select 최종수정id, count(*) from DecNode$
	group by 최종수정id
	having count(*) > 1

select * from DecNode$
	where 최종수정id='E2022-R2-09B'

--중복 데이터 삭제
/*
delete DecNode$
	where 최종수정id='E2022-R2-09B'
	and iconUrl='http://dh.aks.ac.kr/~hanyang2/icon/episode.png'
*/


--node2022Dec02 조회
select * from node2022Dec02$

select * from node2022Dec02$
	where id is NULL

--id, class, label 중 NULL 값이 있는지 조회
select * from node2022Dec02$
	where id is NULL or class is NULL or label is NULL

--NULL 값 수정
update Node2022Dec02$
	set class='Actor', groupName ='인물군'
	where id='장생보연지무동'

update Node2022Dec02$
	set label='정순왕후'
	where id='정순왕후'

select distinct groupName from hanyang2022Data
	where class='Actor'

--join 문
select a.* from Node2022Dec02$ as a
	join hanyang2022Data as b
	on a.id=b.id

--left join 문
select a.* from Node2022Dec02$ as a
	left join hanyang2022Data as b
	on a.id=b.id

--insert 문
/*
insert hanyang2022Data
	select a.* from Node2022Dec02$ as a
		left join hanyang2022Data as b
		on a.id=b.id
		where b.id is NULL
*/


--hanyang2022Links 조회
select * from hanyang2022Links

select * from hanyang2022Links as a
	join Delete2022Dec02$ as b
	on a.source=b.source and a.target=b.target and a.relation=b.relation

--delete문
/*
delete hanyang2022Links
	from hanyang2022Links as a
	join Delete2022Dec02$ as b
	on a.source=b.source and a.target=b.target and a.relation=b.relation
*/


--Link2022Dec02 조회
select * from Link2022Dec02$

select source, target, relation, count(*) from Link2022Dec02$
	group by source, target, relation
	having count(*) > 1

--제거대상 view 생성
create view 제거대상 as
	select source, target, relation, count(*) as occurence from Link2022Dec02$
	group by source, target, relation
	having count(*) > 1

select * from 제거대상

--delete 문
/*
delete Link2022Dec02$
	select a.* from Link2022Dec02$ as a
		join hanyang2022Links as b
		on a.source=b.source and a.target=b.target and a.relation=b.relation
*/

select * from Link2022Dec02$

select source, target, relation, count(*) as occurence from Link2022Dec02$
	group by source, target, relation
	having count(*) > 1

select * from Link2022Dec02$ as a
	join 제거대상 as b
	on a.source=b.source and a.target=b.target and a.relation=b.relation

/*
delete Link2022Dec02$
	select * from Link2022Dec02$ as a
		join 제거대상 as b
		on a.source=b.source and a.target=b.target and a.relation=b.relation
*/

select * from 제거대상

--제거대상 view 제거
drop view 제거대상

--insert 문
insert into hanyang2022Links
	select * from Link2022Dec02$


--한양 노드 조회
select * from hanyang2022Data

--한양 릴레이션 조회
select * from hanyang2022Links