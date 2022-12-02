/* �ι�������������II (22.12.02) */

USE hanyang2022


--DecNode ��ȸ
select * from DecNode$

select * from DecNode$
	where ��������id is NULL

--�������� id �ߺ� Ȯ�ο�
select distinct ��������id from DecNode$

select ��������id, count(*) from DecNode$
	group by ��������id
	having count(*) > 1

select * from DecNode$
	where ��������id='E2022-R2-09B'

--�ߺ� ������ ����
/*
delete DecNode$
	where ��������id='E2022-R2-09B'
	and iconUrl='http://dh.aks.ac.kr/~hanyang2/icon/episode.png'
*/


--node2022Dec02 ��ȸ
select * from node2022Dec02$

select * from node2022Dec02$
	where id is NULL

--id, class, label �� NULL ���� �ִ��� ��ȸ
select * from node2022Dec02$
	where id is NULL or class is NULL or label is NULL

--NULL �� ����
update Node2022Dec02$
	set class='Actor', groupName ='�ι���'
	where id='�������������'

update Node2022Dec02$
	set label='��������'
	where id='��������'

select distinct groupName from hanyang2022Data
	where class='Actor'

--join ��
select a.* from Node2022Dec02$ as a
	join hanyang2022Data as b
	on a.id=b.id

--left join ��
select a.* from Node2022Dec02$ as a
	left join hanyang2022Data as b
	on a.id=b.id

--insert ��
/*
insert hanyang2022Data
	select a.* from Node2022Dec02$ as a
		left join hanyang2022Data as b
		on a.id=b.id
		where b.id is NULL
*/


--hanyang2022Links ��ȸ
select * from hanyang2022Links

select * from hanyang2022Links as a
	join Delete2022Dec02$ as b
	on a.source=b.source and a.target=b.target and a.relation=b.relation

--delete��
/*
delete hanyang2022Links
	from hanyang2022Links as a
	join Delete2022Dec02$ as b
	on a.source=b.source and a.target=b.target and a.relation=b.relation
*/


--Link2022Dec02 ��ȸ
select * from Link2022Dec02$

select source, target, relation, count(*) from Link2022Dec02$
	group by source, target, relation
	having count(*) > 1

--���Ŵ�� view ����
create view ���Ŵ�� as
	select source, target, relation, count(*) as occurence from Link2022Dec02$
	group by source, target, relation
	having count(*) > 1

select * from ���Ŵ��

--delete ��
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
	join ���Ŵ�� as b
	on a.source=b.source and a.target=b.target and a.relation=b.relation

/*
delete Link2022Dec02$
	select * from Link2022Dec02$ as a
		join ���Ŵ�� as b
		on a.source=b.source and a.target=b.target and a.relation=b.relation
*/

select * from ���Ŵ��

--���Ŵ�� view ����
drop view ���Ŵ��

--insert ��
insert into hanyang2022Links
	select * from Link2022Dec02$


--�Ѿ� ��� ��ȸ
select * from hanyang2022Data

--�Ѿ� �����̼� ��ȸ
select * from hanyang2022Links