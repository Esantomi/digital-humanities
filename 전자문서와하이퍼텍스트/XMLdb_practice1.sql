--���ѻ꼺 ������ ��ȸ
select * from common.dbo.���ѻ꼺_xml

select xmltxt.query('//�θ�') from common.dbo.���ѻ꼺_xml
select xmltxt.query('//����') from common.dbo.���ѻ꼺_xml
select xmltxt.query('/�׸�/��Ÿ������/������') from common.dbo.���ѻ꼺_xml


--ȸȭ ������ ��ȸ
select * from common.dbo.paintings

select xmltxt.query('/') from common.dbo.paintings where id='w01'  --/ : �ֻ��� ���
select xmltxt.query('/��ü/�Ӽ�/�۰�') from common.dbo.paintings where id='w01'
select xmltxt.query('/��ü/ǥ��'), xmltxt.query('/��ü/�Ӽ�/�۰�') from common.dbo.paintings where id='w05'

select xmltxt.value('(/��ü/�Ӽ�/@Ʋ)[1]', 'nvarchar(max)') from common.dbo.paintings where id='w01'  --@ : attributeselect xmltxt.value('(/��ü/ǥ��/�̸�)[1]', 'nvarchar(max)') as ��ǰ��,
	xmltxt.value('(/��ü/�Ӽ�/�۰�)[1]', 'nvarchar(max)') as �۰�
	from common.dbo.paintings


--����� ���� ������ //
select xmltxt.query('//�θ�') from common.dbo.paintings where id='w05'

select id, 
	xmltxt.value('(/��ü/ǥ��/�̸�)[1]', 'nvarchar(max)') as ��ǰ��, 
	xmltxt.value('(/��ü/�Ӽ�/�۰�)[1]', 'nvarchar(max)') as �۰�,
	xmltxt.query('//�θ�') as �����θ�, 
	xmltxt.query('//����') as ��������
	from common.dbo.paintings


--���� []
select xmltxt.query('/��ü/����/����[./����]') from common.dbo.paintings           --���� ���� ���� ������select xmltxt.query('/��ü/����/����[./����="Ȳ���"]') from common.dbo.paintings  --���� ���� ������ Ȳ����� ������select xmltxt.query('/��ü/ǥ��/�̸�[./@ǥ��="����"]') from common.dbo.paintings   --ǥ��� attribute�̹Ƿ� @�� ���select id,
	xmltxt.value('(/��ü/ǥ��/�̸�)[1]', 'nvarchar(max)') as ��ǰ��, 
	xmltxt.value('(/��ü/�Ӽ�/�۰�)[1]', 'nvarchar(max)') as �۰�,
	xmltxt.value('(/��ü/ǥ��/�̸�[./@ǥ��="����"])[1]', 'nvarchar(max)') as ����,
	xmltxt.value('(/��ü/ǥ��/�̸�[./@ǥ��="����"])[1]', 'nvarchar(max)') as ���� 
	from common.dbo.paintings


--XPath �Լ�
---count : ���� ����
select xmltxt.query('count(/��ü/����/����/�θ�)') from common.dbo.paintings where id='w05'
---node() : �� �ؿ� �ִ� ������ ��� ��ü
select xmltxt.query('/��ü/ǥ��/node()') from common.dbo.paintings where id='w03'---text() : �ؽ�Ʈ ������select xmltxt.query('/��ü/����/����/text()') from common.dbo.paintings where id='w03'---position() : ��ġ ����select xmltxt.query('(//�θ�)[position()=1]') from common.dbo.paintings where id='w05'  --id w05�� �θ� 3�� �� 1��° ������---last() : ������ ��ġ ����select xmltxt.query('(//�θ�)[last()]') from common.dbo.paintings where id='w05'