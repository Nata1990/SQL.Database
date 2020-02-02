use ZADANIE
GO

-- ������ ����, �������� � ������� ���� � ����������� � ��������� "�������"

select B_NAME, YEAR(GETDATE()) FROM BOOK JOIN KATEGORY ON BOOK.KAT_ID = KATEGORY.KAT_ID and KAT_NAME= '�������';

-- ������ �����������, ���������� ���� �� ����� ����� 100 ���. ���.

select SURNAME, FNAME, PATRONYMIC FROM ZAKAZCHIK JOIN BOOK ON ZAKAZCHIK.ZAKAZCHIK_ID=(SELECT ZAKAZCHIK_ID FROM ZAKAZ JOIN ZAKAZCHIK ON ZAKAZ.B_ID=BOOK.B_ID) WHERE SUM(PRICE)>100.000;

-- ������ ����, ������� �� ������������ � ������� ��������� ���� ���������

SELECT B_NAME FROM BOOK JOIN ZAKAZ ON BOOK.B_ID=ZAKAZ.B_ID WHERE B_ID NOT IN(SELECT B_ID FROM BOOK JOIN ZAKAZ ON BOOK.B_ID=ZAKAZ.B_ID WHERE MONTH(Z_DATE) - MONTH(GETDATE()) < 6);

-- ������ �������, �� ���������� �� ����� �����, ����������� � ��������� "�������"

SELECT SURNAME, FNAME, PATRONYMIC FROM AVTOR JOIN BOOK ON AVTOR.A_ID=BOOK.A_ID WHERE A_ID not in (select A_ID from AVTOR JOIN BOOK ON AVTOR.A_ID=BOOK.A_ID WHERE KAT_NAME=(SELECT KAT_NAME FROM KATEGORY JOIN BOOK ON BOOK.KAT_ID = KATEGORY.KAT_ID and KAT_NAME= '�������'));  

-- ��������� �� 1% ��������� ����, ���� ����� ��������� ����������� ��������� 100 ����

UPDATE BOOK SET PRICE=PRICE*1.01 WHERE B_ID= (SELECT B_ID FROM IZDATELSTVO WHERE T_ID>100);

--������ ���� ����, ������� ������ ����� ����� �� ��������� "�������"

SELECT B_NAME FROM BOOK WHERE PRICE > ANY (SELECT PRICE FROM BOOK JOIN KATEGORY ON BOOK.KAT_ID = KATEGORY.KAT_ID and KAT_NAME= '�������');

-- ������ ����, �� �������� �� � ���� �����

SELECT B_NAME FROM BOOK WHERE B_ID NOT IN (SELECT B_ID FROM ZAKAZ JOIN BOOK ON ZAKAZ.B_ID=BOOK.B_ID);

-- ����������, ��������� ����� �� ������������ �����

SELECT SURNAME, FNAME, PATRONYMIC FROM ZAKAZCHIK WHERE B_ID = (SELECT B_ID FROM ZAKAZ JOIN BOOK ON ZAKAZ.B_ID=BOOK.B_ID WHERE (SELECT MAX(PRICE) FROM BOOK));

-- ������ ����, � ��������� ������� ���������� ����� "��������������" � ������� ������������ �� ���� � ����������, ����������� 50 ������������

SELECT B_NAME FROM BOOK WHERE B_NAME like '%��������������%' and T_ID=(SELECT T_ID FROM TIRAZ WHERE T_AMT>50);

