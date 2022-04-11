use s_haein

create view 저자목록 as
	select 이름 + '(' + 한자 + ')' as 저자,
	cast(생년 as char(4)) + '-' + cast(몰년 as char(4)) as 생몰년,
	서명 + '(' + 한문서명 + ')' as 서명,
	간행년
	from 저자 inner join 서명 on 저자.이름 = 서명.저자

select * from 저자목록