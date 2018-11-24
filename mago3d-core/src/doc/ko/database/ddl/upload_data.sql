-- FK, Index �� ���� ���Ϸ� �и�. �� �������� �۾� ����
drop table if exists upload_data cascade;
drop table if exists upload_data_file cascade;

-- ����� ���ε� ����
create table upload_data(
	upload_data_id					bigint,
	project_id						int,
	sharing_type					char(1)								default '1',
	data_type						varchar(30),
	user_id							varchar(32),
	data_name						varchar(256),
	latitude						numeric(13,10),
	longitude						numeric(13,10),
	height							numeric(7,3),
	description						varchar(256),
	compress_yn						char(1)								default 'N',
	file_count						int									default 0,
	converter_count					int 								default 0,
	status							char(1)								default '0',
	year							char(4)				default to_char(now(), 'yyyy'),
	month							varchar(2)			default to_char(now(), 'MM'),
	day								varchar(2)			default to_char(now(), 'DD'),
	year_week						varchar(2)			default to_char(now(), 'WW'),
	week							varchar(2)			default to_char(now(), 'W'),
	hour							varchar(2)			default to_char(now(), 'HH24'),
	minute							varchar(2)			default to_char(now(), 'MI'),
	update_date						timestamp with time zone,
	insert_date						timestamp with time zone			default now(),
	constraint upload_data_pk	primary key (upload_data_id)	
);

comment on table upload_data is '����� ���ε� ����';
comment on column upload_data.upload_data_id is '������ȣ';
comment on column upload_data.project_id is '������Ʈ ������ȣ';
comment on column upload_data.sharing_type is '���� Ÿ��(�ߺ�). 0 : common, 1: public, 2 : private, 3 : sharing';
comment on column upload_data.data_type is '������ Ÿ��';
comment on column upload_data.user_id is '����� ���̵�';
comment on column upload_data.data_name is '���ϸ�';
comment on column upload_data.latitude is '����';
comment on column upload_data.longitude is '�浵';
comment on column upload_data.height is '����';
comment on column upload_data.description is '����';
comment on column upload_data.compress_yn is '��������. N : �������(�⺻��). Y : ����';
comment on column upload_data.file_count is '���� ����';
comment on column upload_data.converter_count is 'converter Ƚ��';
comment on column upload_data.status is '����. 0 : ���ε� �Ϸ�, 1 : ��ȯ';
comment on column upload_data.year is '��';
comment on column upload_data.month is '��';
comment on column upload_data.day is '��';
comment on column upload_data.year_week is '�ϳ��� ����';
comment on column upload_data.week is '�̹��� ����';
comment on column upload_data.hour is '�ð�';
comment on column upload_data.minute is '��';
comment on column upload_data.update_date is '������';
comment on column upload_data.insert_date is '�����';


-- ����� ���ε� ���� ���� 
create table upload_data_file(
	upload_data_file_id				bigint,
	upload_data_id					bigint,
	project_id						int,
	sharing_type					char(1)								default '1',
	data_type						varchar(30),
	converter_target_yn				char(1)								default 'N',		
	user_id							varchar(32),
	file_type						char(1)								default 'F',
	file_name						varchar(100)						not null,
	file_real_name					varchar(100)						not null,
	file_path						varchar(256)						not null,
	file_sub_path					varchar(256),
	depth							int									default 1,
	file_size						varchar(12)							not null,
	file_ext						varchar(10),
	error_message					varchar(256),
	converter_count					int 								default 0,
	year							char(4)				default to_char(now(), 'yyyy'),
	month							varchar(2)			default to_char(now(), 'MM'),
	day								varchar(2)			default to_char(now(), 'DD'),
	year_week						varchar(2)			default to_char(now(), 'WW'),
	week							varchar(2)			default to_char(now(), 'W'),
	hour							varchar(2)			default to_char(now(), 'HH24'),
	minute							varchar(2)			default to_char(now(), 'MI'),
	insert_date						timestamp with time zone			default now(),
	constraint upload_data_file_pk	primary key (upload_data_file_id)	
);

comment on table upload_data_file is '����� ���ε� ���� ���� ';
comment on column upload_data_file.upload_data_file_id is '������ȣ';
comment on column upload_data_file.upload_data_id is '����� ���ε� ���� ������ȣ';
comment on column upload_data_file.project_id is '������Ʈ ���̵�(�ߺ�)';
comment on column upload_data_file.sharing_type is '���� Ÿ��(�ߺ�). 0 : common, 1: public, 2 : private, 3 : sharing';
comment on column upload_data_file.data_type is '������ Ÿ��(�ߺ�)';
comment on column upload_data_file.converter_target_yn is 'converter ��� ���� ����. Y : ���, N : ���ƴ�(�⺻��)';
comment on column upload_data_file.user_id is '����� ���̵�';
comment on column upload_data_file.file_type is '���丮/���� ����. D : ���丮, F : ����';
comment on column upload_data_file.file_name is '���� �̸�';
comment on column upload_data_file.file_real_name is '���� ���� �̸�';
comment on column upload_data_file.file_path is '���� ���';
comment on column upload_data_file.file_sub_path is '������Ʈ ��� �Ǵ� ���� ���丮 ���� ������ ���� ���';
comment on column upload_data_file.depth is '�������� ����. 1���� ����';
comment on column upload_data_file.file_size is '���� ������';
comment on column upload_data_file.file_ext is '���� Ȯ����';
comment on column upload_data_file.error_message is '���� �޽���';
comment on column upload_data_file.converter_count is 'converter Ƚ��';
comment on column upload_data_file.year is '��';
comment on column upload_data_file.month is '��';
comment on column upload_data_file.day is '��';
comment on column upload_data_file.year_week is '�ϳ��� ����';
comment on column upload_data_file.week is '�̹��� ����';
comment on column upload_data_file.hour is '�ð�';
comment on column upload_data_file.minute is '��';
comment on column upload_data_file.insert_date is '�����';

