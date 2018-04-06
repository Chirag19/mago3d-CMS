drop table if exists board cascade;
drop table if exists board_detail cascade;
drop table if exists board_comment cascade;

-- �Խ���
create table board (
	board_id					bigint				not null,
	title						varchar(4000)		not null,
	user_id						varchar(32)	 		not null,
	start_date					timestamp with 		time zone,
	end_date					timestamp with 		time zone,
	use_yn						char(1)				default 'Y',
	client_ip					varchar(45)			not null,
	view_count					bigint				default 0,
	insert_date					timestamp 			with time zone			default now(),
	constraint board_pk primary key (board_id)	
);

comment on table board is '�Խ���';
comment on column board.board_id is '������ȣ';
comment on column board.title is '����';
comment on column board.user_id is '����� ���̵�';
comment on column board.start_date is '�Խ� ���۽ð�';
comment on column board.end_date is '�Խ� ����ð�';
comment on column board.use_yn is '�������, Y : ���, N : ������';
comment on column board.client_ip is '��û IP';
comment on column board.view_count is '��ȸ��';
comment on column board.insert_date is '�����';

-- �Խ��� ��
create table board_detail (
	board_detail_id				bigint			not null,
	board_id					bigint 			not null,
	contents					text,
	insert_date					timestamp 		with time zone			default now(),
	constraint board_detail_pk 	primary key (board_detail_id)	
);

comment on table board_detail is '�Խ��� ��';
comment on column board_detail.board_id is '�Խ��� ������ȣ';
comment on column board_detail.contents is '����';
comment on column board.insert_date is '�����';

-- �Խ��� ���(Comment)
create table board_comment (
	board_comment_id			bigint 				not null,
	board_id					bigint				not null,
	user_id						varchar(32)	 		not null,
	comment						varchar(4000)		not null,
	client_ip					varchar(45)			not null,
	insert_date					timestamp 			with time zone			default now(),
	constraint board_comment_pk primary key (board_comment_id)	
);

comment on table board_comment is '�Խ��� ���(Comment)';
comment on column board_comment.board_comment_id is '������ȣ';
comment on column board_comment.board_id is '�Խ��� ������ȣ';
comment on column board_comment.user_id is '����� ���̵�';
comment on column board_comment.comment is '���(Comment)';
comment on column board_comment.client_ip is '��û IP';
comment on column board_comment.insert_date is '�����';
