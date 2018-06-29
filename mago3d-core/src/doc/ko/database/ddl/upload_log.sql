-- FK, Index �� ���� ���Ϸ� �и�. �� �������� �۾� ����
drop table if exists upload_log cascade;
drop table if exists converter_log cascade;

-- ����� ���� upload �̷�
create table upload_log(
	upload_log_id				bigint,
	user_id						varchar(32),
	file_name					varchar(100)				not null,
	file_real_name				varchar(100)				not null,
	file_path					varchar(256)				not null,
	file_size					varchar(12)					not null,
	file_ext					varchar(10)					not null,
	insert_date					timestamp with time zone			default now(),
	constraint upload_log_pk	primary key (upload_log_id)	
);

comment on table upload_log is '����� ���� upload �̷�';
comment on column upload_log.upload_log_id is '������ȣ';
comment on column upload_log.user_id is '����� ���̵�';
comment on column upload_log.file_name is '���� �̸�';
comment on column upload_log.file_real_name is '���� ���� �̸�';
comment on column upload_log.file_path is '���� ���';
comment on column upload_log.file_size is '���� ������';
comment on column upload_log.file_ext is '���� Ȯ����';
comment on column upload_log.insert_date is '�����';

-- ����� f4d ��ȯ �̷�
create table converter_log(
	converter_log_id			bigint,
	upload_log_id				bigint,
	converter_group_id			bigint,
	status							char(1)								default '0',
	error_code						varchar(4000),
	insert_date						timestamp with time zone			default now(),
	constraint converter_log_pk primary key (converter_log_id)	
);

comment on table converter_log is '����� f4d ��ȯ �̷�';
comment on column converter_log.converter_log_id is '������ȣ';
comment on column converter_log.upload_log_id is '���� ���� ������ȣ';
comment on column converter_log.converter_group_id is '���� ��ȯ �׷� ������ȣ';
comment on column converter_log.status is '����. 0: �غ�, 1: step1, 2: step2, 3: step3, 4: step4';
comment on column converter_log.error_code is '���� �ڵ�';
comment on column converter_log.insert_date is '�����';













