use s_haein

create view ���ڸ�� as
	select �̸� + '(' + ���� + ')' as ����,
	cast(���� as char(4)) + '-' + cast(���� as char(4)) as ������,
	���� + '(' + �ѹ����� + ')' as ����,
	�����
	from ���� inner join ���� on ����.�̸� = ����.����

select * from ���ڸ��