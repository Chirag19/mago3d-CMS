-- FK, Index �� ���� ���Ϸ� �и�. �� �������� �۾� ����
drop table if exists converter_upload_log cascade;
drop table if exists converter_job cascade;
drop table if exists converter_log cascade;

-- ����� ���� upload �̷�
create table converter_upload_log(
	converter_upload_log_id				bigint,
	user_id						varchar(32),
	file_name					varchar(100)				not null,
	file_real_name				varchar(100)				not null,
	file_path					varchar(256)				not null,
	file_size					varchar(12)					not null,
	file_ext					varchar(10)					not null,
	converter_count				int							default 0,
	insert_date					timestamp with time zone	default now(),
	constraint converter_upload_log_pk	primary key (converter_upload_log_id)	
);

comment on table converter_upload_log is '����� ���� upload �̷�';
comment on column converter_upload_log.converter_upload_log_id is '������ȣ';
comment on column converter_upload_log.user_id is '����� ���̵�';
comment on column converter_upload_log.file_name is '���� �̸�';
comment on column converter_upload_log.file_real_name is '���� ���� �̸�';
comment on column converter_upload_log.file_path is '���� ���';
comment on column converter_upload_log.file_size is '���� ������';
comment on column converter_upload_log.file_ext is '���� Ȯ����';
comment on column converter_upload_log.converter_count is 'F4D Converter ��ȯ Ƚ��';
comment on column converter_upload_log.insert_date is '�����';

-- ����� f4d ��ȯ job
create table converter_job(
	converter_job_id				bigint,
	user_id							varchar(32),
	project_id						bigint								not null,
	title							varchar(256)						not null,
	converter_type					char(1)								default '0',
	status							char(1)								default '0',
	error_code						varchar(4000),
	update_date						timestamp with time zone,
	insert_date						timestamp with time zone			default now(),
	constraint converter_job_pk primary key (converter_job_id)	
);

comment on table converter_job is '����� f4d ��ȯ �̷�';
comment on column converter_job.converter_job_id is '������ȣ';
comment on column converter_job.user_id is '����� ���̵�';
comment on column converter_job.project_id is 'project ������ȣ';
comment on column converter_job.converter_type is '0: �⺻, 1: ū �޽� �ϳ�';
comment on column converter_job.status is '0: �غ�, 1: ����, 2: ����';
comment on column converter_job.error_code is '���� �ڵ�';
comment on column converter_job.update_date is '������';
comment on column converter_job.insert_date is '�����';


-- ����� f4d ��ȯ �̷�
create table converter_log(
	converter_log_id				bigint,
	converter_job_id				bigint,
	converter_upload_log_id			bigint,
	user_id							varchar(32),
	status							char(1)								default '0',
	error_code						varchar(4000),
	insert_date						timestamp with time zone			default now(),
	constraint converter_log_pk primary key (converter_log_id)	
);

comment on table converter_log is '����� f4d ��ȯ �̷�';
comment on column converter_log.converter_log_id is '������ȣ';
comment on column converter_log.converter_job_id is '���� ��ȯ job ������ȣ';
comment on column converter_log.converter_upload_log_id is '���� ���� ������ȣ';
comment on column converter_log.user_id is '����� ���̵�';
comment on column converter_log.status is '����. 0: �غ�, 1: step1, 2: step2, 3: step3, 4: step4';
comment on column converter_log.error_code is '���� �ڵ�';
comment on column converter_log.insert_date is '�����';



