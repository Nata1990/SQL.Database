use ZADANIE
GO

-- Список книг, изданных в текущем году и относящихся к категории "пособие"

select B_NAME, YEAR(GETDATE()) FROM BOOK JOIN KATEGORY ON BOOK.KAT_ID = KATEGORY.KAT_ID and KAT_NAME= 'пособие';

-- Список покупателей, заказавших книг на сумму более 100 тыс. руб.

select SURNAME, FNAME, PATRONYMIC FROM ZAKAZCHIK JOIN BOOK ON ZAKAZCHIK.ZAKAZCHIK_ID=(SELECT ZAKAZCHIK_ID FROM ZAKAZ JOIN ZAKAZCHIK ON ZAKAZ.B_ID=BOOK.B_ID) WHERE SUM(PRICE)>100.000;

-- Список книг, которые не заказывались в течение последних двух кварталов

SELECT B_NAME FROM BOOK JOIN ZAKAZ ON BOOK.B_ID=ZAKAZ.B_ID WHERE B_ID NOT IN(SELECT B_ID FROM BOOK JOIN ZAKAZ ON BOOK.B_ID=ZAKAZ.B_ID WHERE MONTH(Z_DATE) - MONTH(GETDATE()) < 6);

-- Список авторов, не написавших ни одной книги, относящейся к категории "пособие"

SELECT SURNAME, FNAME, PATRONYMIC FROM AVTOR JOIN BOOK ON AVTOR.A_ID=BOOK.A_ID WHERE A_ID not in (select A_ID from AVTOR JOIN BOOK ON AVTOR.A_ID=BOOK.A_ID WHERE KAT_NAME=(SELECT KAT_NAME FROM KATEGORY JOIN BOOK ON BOOK.KAT_ID = KATEGORY.KAT_ID and KAT_NAME= 'пособие'));  

-- Увеличить на 1% стоимость книг, если число проданных экземпляров превышает 100 штук

UPDATE BOOK SET PRICE=PRICE*1.01 WHERE B_ID= (SELECT B_ID FROM IZDATELSTVO WHERE T_ID>100);

--Список всех книг, которые дороже любой книги по категории "пособие"

SELECT B_NAME FROM BOOK WHERE PRICE > ANY (SELECT PRICE FROM BOOK JOIN KATEGORY ON BOOK.KAT_ID = KATEGORY.KAT_ID and KAT_NAME= 'пособие');

-- Список книг, не попавших ни в один заказ

SELECT B_NAME FROM BOOK WHERE B_ID NOT IN (SELECT B_ID FROM ZAKAZ JOIN BOOK ON ZAKAZ.B_ID=BOOK.B_ID);

-- Покупатель, сделавший заказ на максимальную сумму

SELECT SURNAME, FNAME, PATRONYMIC FROM ZAKAZCHIK WHERE B_ID = (SELECT B_ID FROM ZAKAZ JOIN BOOK ON ZAKAZ.B_ID=BOOK.B_ID WHERE (SELECT MAX(PRICE) FROM BOOK));

-- Список книг, в названиях которых содержится слово "Проектирование" и которые присутствуют на базе в количестве, превышающем 50 экземплаяров

SELECT B_NAME FROM BOOK WHERE B_NAME like '%проектирование%' and T_ID=(SELECT T_ID FROM TIRAZ WHERE T_AMT>50);

