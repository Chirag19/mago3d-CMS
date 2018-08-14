-- FK, Index �� ���� ���Ϸ� �и�. �� �������� �۾� ����
drop table if exists user_group cascade;
drop table if exists user_group_role cascade;
drop table if exists user_group_menu cascade;
drop table if exists user_info cascade;
drop table if exists user_device cascade;
drop table if exists user_policy cascade;

-- ����� �׷�
create table user_group(
	user_group_id				int,
	group_key					varchar(60)							not null ,
	group_name					varchar(100)						not null,
	ancestor					int							default 0,
	parent						int							default 1,
	depth						int							default 1,
	view_order					int							default 1,
	child_yn					char(1)								default 'N',
	default_yn					char(1)								default 'N',
	use_yn						char(1)								default 'Y',
	description					varchar(256),
	insert_date					timestamp with time zone			default now(),
	constraint user_group_pk 	primary key (user_group_id)	
);

comment on table user_group is '����� �׷�';
comment on column user_group.user_group_id is '������ȣ';
comment on column user_group.group_key is '��ũ Ȱ�� ���� ���� Ȯ�� �÷�';
comment on column user_group.group_name is '�׷��';
comment on column user_group.ancestor is '���� ������ȣ';
comment on column user_group.parent is '�θ� ������ȣ';
comment on column user_group.depth is '����';
comment on column user_group.view_order is '���� ����';
comment on column user_group.child_yn is '�ڽ� ��������, Y : ����, N : �������(�⺻)';
comment on column user_group.default_yn is '���� �Ұ�, Y : �⺻, N : ����';
comment on column user_group.use_yn is '�������, Y : ���, N : ������';
comment on column user_group.description is '����';
comment on column user_group.insert_date is '�����';

-- ����� �׷캰 Role
create table user_group_role (
	user_group_role_id				int,
	user_group_id					int 								not null,
	role_id							int	 							not null,
	insert_date						timestamp with time zone				default now(),
	constraint user_group_role_pk 	primary key (user_group_role_id)
);

comment on table user_group_role is '����� �׷캰 Role';
comment on column user_group_role.user_group_role_id is '������ȣ';
comment on column user_group_role.user_group_id is '����� �׷� ����Ű';
comment on column user_group_role.role_id is 'Role ����Ű';
comment on column user_group_role.insert_date is '�����';

-- ����� �׷� ����
create table user_group_menu(
	user_group_menu_id				int,
	user_group_id					int 							not null,
	menu_id							int 							not null,
	all_yn							char(1)								default 'N',
	read_yn							char(1)								default 'N',
	write_yn						char(1)								default 'N',
	update_yn						char(1)								default 'N',
	delete_yn						char(1)								default 'N',
	insert_date						timestamp with time zone			default now(),
	constraint user_group_menu_pk 	primary key (user_group_menu_id)
);

comment on table user_group_menu is '����� �׷� �޴�';
comment on column user_group_menu.user_group_menu_id is '������ȣ';
comment on column user_group_menu.user_group_id is '����� �׷� ����Ű';
comment on column user_group_menu.menu_id is '�޴� ����Ű';
comment on column user_group_menu.all_yn is '�޴� ���� ��� ����';
comment on column user_group_menu.read_yn is '�б� ����';
comment on column user_group_menu.write_yn is '���� ����';
comment on column user_group_menu.update_yn is '���� ����';
comment on column user_group_menu.delete_yn is '���� ����';
comment on column user_group_menu.insert_date is '�����';


-- ����� �⺻����
create table user_info(
	user_id						varchar(32),
	user_group_id				int									not null,
	user_name					varchar(64)							not null,
	password					varchar(512)						not null,
	salt						varchar(256)						not null,
	telephone					varchar(256),
	mobile_phone				varchar(256),
	email						varchar(256),
	messanger					varchar(100),
	employee_id 				varchar(20),
  	postal_code					varchar(6),
	address						varchar(256),
	address_etc					varchar(1000),
	ci							varchar(256),
	di							varchar(256),
	status						char(1)								default '0',
	user_role_check_yn			char(1)								default 'Y',
	user_insert_type			varchar(30)							default 'USER_REGISTER_SELF',
	sso_use_yn					char(1)								default 'N',
	login_count					bigint								default 0,
	fail_login_count			int									default 0,
	last_login_date				timestamp with time zone,
	last_password_change_date	timestamp with time zone			default now(),
	update_date					timestamp with time zone,
	insert_date				timestamp with time zone			default now(),
	constraint user_info_pk primary key(user_id)
);

comment on table user_info is '����� �⺻����';
comment on column user_info.user_id is '������ȣ';
comment on column user_info.user_group_id is '����� �׷� ������ȣ';
comment on column user_info.user_name is '�̸�';
comment on column user_info.password is '��й�ȣ';
comment on column user_info.salt is 'SALT';
comment on column user_info.telephone is '��ȭ��ȣ';
comment on column user_info.mobile_phone is '�ڵ��� ��ȣ';
comment on column user_info.email is '�̸���';
comment on column user_info.messanger is '�޽��� ���̵�';
comment on column user_info.employee_id is '���';
comment on column user_info.postal_code is '�����ȣ';
comment on column user_info.address is '�ּ�';
comment on column user_info.address_etc is '���ּ�';
comment on column user_info.ci is '�Ǹ� ���� CI ������';
comment on column user_info.di is '�Ǹ� ���� DI ������ ������';
comment on column user_info.user_role_check_yn is '���� �α��ν� ����� Role ���� üũ �н� ���. �⺻�� Y : üũ';
comment on column user_info.status is '����� ����. 0:�����, 1:�������(������), 2:���(��й�ȣ ����Ƚ�� �ʰ�), 3:�޸�(�α��� �Ⱓ), 4:����(���Ⱓ ����), 5:����(ȭ�� ��ǥ��, policy.user_delete_type=0), 6:�ӽú�й�ȣ';
comment on column user_info.user_insert_type is '����� ��� ���. �⺻ : SELF';
comment on column user_info.sso_use_yn is 'Single Sign-On �������. �⺻�� N : ������';
comment on column user_info.login_count is '�α��� Ƚ��';
comment on column user_info.fail_login_count is '�α��� ���� Ƚ��';
comment on column user_info.last_login_date is '������ �α��� ��¥';
comment on column user_info.last_password_change_date is '������ �α��� ��й�ȣ ���� ��¥';
comment on column user_info.update_date is '�������� ���� ��¥';
comment on column user_info.insert_date is '�����';


-- ����� ��� ����̽�
create table user_device (
	user_device_id				bigint,
	user_id						varchar(32)	 						not null,
	device_name1				varchar(60)							not null,
	device_type1				char(1)								default '0',
	device_ip1					varchar(45),
	device_priority1			int									default 1,
	use_yn1						char(1)								default 'Y',
	description1				varchar(256),
	device_name2				varchar(60)							not null,
	device_type2				char(1)								default '0',
	device_ip2					varchar(45),
	device_priority2			int									default 2,
	use_yn2						char(1)								default 'Y',
	description2				varchar(256),
	device_name3				varchar(60)							not null,
	device_type3				char(1)								default '0',
	device_ip3					varchar(45),
	device_priority3			int									default 3,
	use_yn3						char(1)								default 'Y',
	description3				varchar(256),
	device_name4				varchar(60)							not null,
	device_type4				char(1)								default '0',
	device_ip4					varchar(45),
	device_priority4			int									default 4,
	use_yn4						char(1)								default 'Y',
	description4				varchar(256),
	device_name5				varchar(60)							not null,
	device_type5				char(1)								default '0',
	device_ip5					varchar(45),
	device_priority5			int									default 5,
	use_yn5						char(1)								default 'Y',
	description5				varchar(256),
	insert_date				timestamp with time zone				default now(),
	constraint user_device_pk primary key (user_device_id)
);


comment on table user_device is '����� ��� ����̽�';
comment on column user_device.user_device_id is '������ȣ';
comment on column user_device.user_id is '����� ���̵�';
comment on column user_device.device_name1 is '��� ����1';
comment on column user_device.device_type1 is '��� ��� Ÿ��1. 0 : PC, 1 : �ڵ���';
comment on column user_device.device_ip1 is 'IP1';
comment on column user_device.device_priority1 is '�켱����1';
comment on column user_device.use_yn1 is '�������1. Y : ���, N : �̻��';
comment on column user_device.description1 is '����1';
comment on column user_device.device_name2 is '��� ����2';
comment on column user_device.device_type2 is '��� ��� Ÿ��2. 0 : PC, 1 : �ڵ���';
comment on column user_device.device_ip2 is 'IP2';
comment on column user_device.device_priority2 is '�켱����2';
comment on column user_device.use_yn2 is '�������2. Y : ���, N : �̻��';
comment on column user_device.description2 is '����2';
comment on column user_device.device_name3 is '��� ����3';
comment on column user_device.device_type3 is '��� ��� Ÿ��3. 0 : PC, 1 : �ڵ���';
comment on column user_device.device_ip3 is 'IP3';
comment on column user_device.device_priority3 is '�켱����3';
comment on column user_device.use_yn3 is '�������3. Y : ���, N : �̻��';
comment on column user_device.description3 is '����3';
comment on column user_device.device_name4 is '��� ����4';
comment on column user_device.device_type4 is '��� ��� Ÿ��4. 0 : PC, 1 : �ڵ���';
comment on column user_device.device_ip4 is 'IP4';
comment on column user_device.device_priority4 is '�켱����4';
comment on column user_device.use_yn4 is '�������4. Y : ���, N : �̻��';
comment on column user_device.description4 is '����4';
comment on column user_device.device_name5 is '��� ����5';
comment on column user_device.device_type5 is '��� ��� Ÿ��5. 0 : PC, 1 : �ڵ���';
comment on column user_device.device_ip5 is 'IP5';
comment on column user_device.device_priority5 is '�켱����5';
comment on column user_device.use_yn5 is '�������5. Y : ���, N : �̻��';
comment on column user_device.description5 is '����5';
comment on column user_device.insert_date is '�����';



-- ����� ���å
create table user_policy(
	user_id						varchar(32)	 						not null,	
		
	geo_view_library						varchar(20)			default 'cesium',
	geo_data_path							varchar(100)		default '/f4d',
	geo_data_default_projects				varchar(30)[],
	geo_cull_face_enable					varchar(5)			default 'false',
	geo_time_line_enable					varchar(5)			default 'false',
	
	geo_init_camera_enable					varchar(5)			default 'true',
	geo_init_latitude						varchar(30)			default '37.521168',
	geo_init_longitude						varchar(30)			default '126.924185',
	geo_init_height							varchar(30)			default '3000.0',
	geo_init_duration						int					default 3,
	geo_init_default_terrain				varchar(64),
	geo_init_default_fov					int					default 0,
	
	geo_lod0								varchar(20)			default '15',
	geo_lod1								varchar(20)			default '60',
	geo_lod2								varchar(20)			default '90',
	geo_lod3								varchar(20)			default '200',
	geo_lod4								varchar(20)			default '1000',
	geo_lod5								varchar(20)			default '50000',
	geo_ambient_reflection_coef				varchar(10)			default '0.5',
	geo_diffuse_reflection_coef				varchar(10)			default '1.0',
	geo_specular_reflection_coef			varchar(10)			default '1.0',
	geo_specular_color						varchar(11)			default '#d8d8d8',
	geo_ambient_color						varchar(11)			default '#d8d8d8',
	geo_ssao_radius							varchar(20)			default '0.15',
	
	update_date								timestamp with time zone			default now(),
	insert_date								timestamp with time zone			default now(),
	constraint user_policy_pk primary key (user_id)	
);

comment on table user_policy is '����� ���å';
comment on column user_policy.user_id is '����� ���̵�';

comment on column user_policy.geo_view_library is 'view library. �⺻ cesium';
comment on column user_policy.geo_data_path is 'data ����. �⺻ /f4d';
comment on column user_policy.geo_data_default_projects is '���۽� �ε� ������Ʈ. �迭�� ����';
comment on column user_policy.geo_cull_face_enable is 'cullFace �������. �⺻ false';
comment on column user_policy.geo_time_line_enable is 'timeLine �������. �⺻ false';
	
comment on column user_policy.geo_init_camera_enable is '�ʱ� ī�޶� �̵� ����. �⺻ true';
comment on column user_policy.geo_init_latitude is '�ʱ� ī�޶� �̵� ����';
comment on column user_policy.geo_init_longitude is '�ʱ� ī�޶� �̵� �浵';
comment on column user_policy.geo_init_height is '�ʱ� ī�޶� �̵� ����';
comment on column user_policy.geo_init_duration is '�ʱ� ī�޶� �̵� �ð�. �� ����';
comment on column user_policy.geo_init_default_terrain is '�⺻ Terrain';
comment on column user_policy.geo_init_default_fov is 'field of view. �⺻�� 0(1.8 ����)';
comment on column user_policy.geo_lod0 is 'LOD0. �⺻�� 15M';
comment on column user_policy.geo_lod1 is 'LOD1. �⺻�� 60M';
comment on column user_policy.geo_lod2 is 'LOD2. �⺻�� 90M';
comment on column user_policy.geo_lod3 is 'LOD3. �⺻�� 200M';
comment on column user_policy.geo_lod4 is 'LOD4. �⺻�� 1000M';
comment on column user_policy.geo_lod5 is 'LOD5. �⺻�� 50000M';
comment on column user_policy.geo_ambient_reflection_coef is '���̷�Ʈ ���� �ƴ� �ݻ��� ����. �⺻�� 0.5';
comment on column user_policy.geo_diffuse_reflection_coef is '�ڱ� ������ �ݻ��� ����. �⺻�� 1.0';
comment on column user_policy.geo_specular_reflection_coef is 'ǥ���� �����Ÿ� ����. �⺻�� 1.0';
comment on column user_policy.geo_ambient_color is '���̷�Ʈ ���� �ƴ� �ݻ��� RGB, �޸��� ����';
comment on column user_policy.geo_specular_color is 'ǥ���� �����Ÿ� ����. RGB, �޸��� ����';
comment on column user_policy.geo_ssao_radius is '�׸��� �ݰ�';

comment on column user_policy.update_date is '������';
comment on column user_policy.insert_date is '�����';