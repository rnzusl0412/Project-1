
create table customer(
	c_id varchar2(30) primary key,
	c_nic_name varchar2(30) not null,
	c_name varchar2(30) not null,
	c_email varchar2(100) not null,
	c_phone varchar2(30) not null,
	c_pw varchar2(30) not null,
	c_birth varchar2(30) not null,
	c_sex varchar2(30) not null,
	c_post number(30) not null,
	c_add varchar2(100) not null,
	c_dadd varchar2(100) not null,
	c_exadd varchar2(100) not null,
	c_answer_type number(10) not null,
	c_answer varchar2(100) not null
);

drop table customer;

CustomerVO [c_id=가나다, c_nic_name=가나다, c_name=가나다, c_email=lll@naver.com, c_phone=가나다, c_pw=가나다, c_birth=가나다, c_sex=Check_Man, c_post=6369, c_add=서울 강남구 밤고개로 99, c_dadd=가나다, c_exadd= (수서동)]
delete from customer;

insert into customer values('가','가','가','lll@naver.com','가','가','가','가',6,'가','가','가');
insert into customer(c_id,c_nic_name,c_name,c_email,c_phone,c_pw,c_birth,c_sex,c_post,c_add,c_dadd,c_exadd) values('가','가','가','lll@naver.com','가','가','가','가',6,'서울 강남구 밤고개로 99','가','가');

select * from CUSTOMER;



