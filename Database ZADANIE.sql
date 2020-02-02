create DATABASE ZADANIE;
GO
USE ZADANIE;
create table BOOK
(B_ID varchar(6) PRIMARY KEY,
B_NAME varchar(20),
A_ID varchar(6) references AVTOR(A_ID),
KAT_ID varchar(6) references KATEGORY(KAT_ID),
PAGE decimal(4) check(PAGE>=50 and PAGE<=2000),
T_ID varchar(6) references TIRAZ(T_ID),
PRICE decimal(4) check(PRICE>=500 and PRICE<=4000));


insert into BOOK values ('B1','�������������� ��', 'A1', 'KAT1', '538', 'T1', '1000');
insert into BOOK values ('B2','������������ ����', 'A2', 'KAT1', '335', 'T2', '900');
insert into BOOK values ('B3','���������������', 'A3', 'KAT2', '725', 'T3', '880'); 
insert into BOOK values ('B4','�������������� ���', 'A1', 'KAT3', '1050', 'T4', '1500');
insert into BOOK values ('B5','��������-����������', 'A4', 'KAT2', '350', 'T5', '1200');

go

create table TIRAZ
(T_ID varchar(6) PRIMARY KEY,
T_AMT decimal(6) check(T_AMT<=10000),
T_YEAR smallint DEFAULT Year(GetDate()));

insert into TIRAZ values ('T1','300', '');
insert into TIRAZ values ('T2','700', '');
insert into TIRAZ values ('T3','5000', ''); 
insert into TIRAZ values ('T4','3000', '');
insert into TIRAZ values ('T5','2000', '');

go

create table AVTOR
(A_ID varchar(6) PRIMARY KEY,
SURNAME varchar(20),
FNAME varchar(20),
PATRONYMIC varchar(20),
EMAIL varchar(20));

insert into AVTOR values ('A1','������', '����', '��������', 'ivanov@list.ru');
insert into AVTOR values ('A2','������', '����', '��������', 'petrov@list.ru');
insert into AVTOR values ('A3','�������', '������', '���������', 'sidorov@list.ru'); 
insert into AVTOR values ('A4','��������', '������', '����������', 'maksimov@list.ru');
insert into AVTOR values ('A5','��������', '�������', '����������', 'alekseev@list.ru');

go

create table ZAKAZ
(Z_ID varchar(6) PRIMARY KEY,
ZAKAZCHIK_ID varchar(20) references ZAKAZCHIK(ZAKAZCHIK_ID),
Z_AMT decimal(6),
Z_DATE date,
B_ID varchar(6) references BOOK(B_ID));

insert into ZAKAZ values ('Z1','ZK1', '6', '20190209', 'B1');
insert into ZAKAZ values ('Z2','ZK2', '12', '20190608', 'B2');
insert into ZAKAZ values ('Z3','ZK3', '3', '20191104', 'B3'); 
insert into ZAKAZ values ('Z4','ZK4', '10', '20190308', 'B4');
insert into ZAKAZ values ('Z5','ZK5', '24', '20190916', 'B2');

go

create table KATEGORY
(KAT_ID varchar(6) PRIMARY KEY,
KAT_NAME varchar(20));

insert into KATEGORY values ('KAT1','�������');
insert into KATEGORY values ('KAT2','�������');
insert into KATEGORY values ('KAT3','������������'); 
insert into KATEGORY values ('KAT4','����������');
insert into KATEGORY values ('KAT5','������� ��������');

go 

create table ZAKAZCHIK
(ZAKAZCHIK_ID varchar(20) PRIMARY KEY,
SURNAME varchar(20),
FNAME varchar(20),
PATRONYMIC varchar(20),
ADRESS varchar(20),
T_NUMBER decimal(15));

insert into ZAKAZCHIK values ('ZK1','��������', '�������', '����������', '�������� 33-45', '80293314242');
insert into ZAKAZCHIK values ('ZK2','�������', '�����', '����������', '��������� 44-88', '80297315255');
insert into ZAKAZCHIK values ('ZK3','�������', '����', '��������', '������������� 57-94', '80447147978'); 
insert into ZAKAZCHIK values ('ZK4','������', '��������', '����������', '������������� 104-12', '80336478899');
insert into ZAKAZCHIK values ('ZK5','�������', '�����', '���������', '������������� 15-166', '80295997874');

go
 create table IZDATELSTVO
 (B_ID varchar(6) references BOOK(B_ID),
  T_ID varchar(6) references TIRAZ(T_ID));

insert into IZDATELSTVO values ('B1','T1');
insert into IZDATELSTVO values ('B2','T2');
insert into IZDATELSTVO values ('B3','T3'); 
insert into IZDATELSTVO values ('B4','T4');
insert into IZDATELSTVO values ('B5','T5');