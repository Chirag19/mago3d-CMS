-- FK, Index �� ���� ���Ϸ� �и�. �� �������� �۾� ����
drop table if exists converter_job cascade;
drop table if exists converter_job_detail cascade;

-- ����� f4d ��ȯ job
create table converter_job(
	converter_job_id				bigint,
	user_id							varchar(32),
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
comment on column converter_job.converter_type is '0: �⺻, 1: ū �޽� �ϳ�';
comment on column converter_job.status is '0: �غ�, 1: ����, 2: Ȯ���ʿ�, 3: ����';
comment on column converter_job.error_code is '���� �ڵ�';
comment on column converter_job.update_date is '������';
comment on column converter_job.insert_date is '�����';


-- ����� f4d ��ȯ �̷�
create table converter_job_detail(
	converter_job_detail_id				bigint,
	converter_job_id				bigint,
	upload_data_id			bigint,
	user_id							varchar(32),
	project_id					int	,
	data_key					varchar(128)						not null,
	data_name					varchar(256),
	parent						bigint								default 1,
	depth						int									default 1,
	view_order					int									default 1,
	child_yn					char(1)								default 'N',
	mapping_type				varchar(30)							default 'origin',
	location		 			GEOGRAPHY(POINT, 4326),
	latitude					numeric(13,10),
	longitude					numeric(13,10),
	height						numeric(7,3),
	heading						numeric(8,5),
	pitch						numeric(8,5),
	roll						numeric(8,5),
	attributes					jsonb,
	status							char(1)								default '0',
	converter_result				char(1),
	error_code						varchar(4000),
	insert_date						timestamp with time zone			default now(),
	constraint converter_job_detail_pk primary key (converter_job_detail_id)	
);

comment on table converter_job_detail is '����� f4d ��ȯ �̷�';
comment on column converter_job_detail.converter_job_detail_id is '������ȣ';
comment on column converter_job_detail.converter_job_id is '���� ��ȯ job ������ȣ';
comment on column converter_job_detail.converter_upload_log_id is '���� ���� ������ȣ';
comment on column converter_job_detail.user_id is '����� ���̵�';
comment on column converter_job_detail.project_id is 'project ������ȣ';
comment on column converter_job_detail.data_key is 'data ���� �ĺ���ȣ';
comment on column converter_job_detail.data_name is 'data �̸�';
comment on column converter_job_detail.parent is '�θ� data_id';
comment on column converter_job_detail.depth is 'depth';
comment on column converter_job_detail.view_order is '���� ����';
comment on column converter_job_detail.child_yn is '�ڽ� ���� ����';
comment on column converter_job_detail.mapping_type is '�⺻�� origin : latitude, longitude, height�� origin�� ����. boundingboxcenter : latitude, longitude, height�� boundingboxcenter ����';
comment on column converter_job_detail.location is '����, �浵 ����';
comment on column converter_job_detail.latitude is '����';
comment on column converter_job_detail.longitude is '�浵';
comment on column converter_job_detail.height is '����';
comment on column converter_job_detail.heading is 'heading';
comment on column converter_job_detail.pitch is 'pitch';
comment on column converter_job_detail.roll is 'roll';
comment on column converter_job_detail.attributes is 'Data Control �Ӽ�';
comment on column converter_job_detail.status is '����. 0: �̵��, 1: �����, 2: ��ϿϷ�, 3: ����';
comment on column converter_job_detail.converter_result is '0: ����, 1: Ȯ���ʿ�, 2: ����';
comment on column converter_job_detail.error_code is '���� �ڵ�';
comment on column converter_job_detail.insert_date is '�����';



