drop table if exists membership cascade;


-- ȸ�� ����
create table membership(
	membership_id				bigint,
	user_id						varchar(32),
	membership_type				char(1)						default '0',
	charge_type					char(1)						default '0',
	insert_date					timestamp with time zone default now(),
	constraint membership_pk 	primary key (membership_id)	
);

comment on table membership is 'mago3D membership';
comment on column membership.membership_id is '������ȣ';
comment on column membership.user_id is '����� ���̵�';
comment on column membership.membership_type is 'ȸ�� Ÿ��. 0: Basic, 1 : �ǹ�, 2 : ���';
comment on column membership.charge_type is '��� ���� Ÿ��. 0: ������, 1 : ������, 2 : ���';
comment on column membership.insert_date is '�����';
