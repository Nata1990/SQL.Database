USE ZADANIE;
GO
-- —оздать представление, содержашее сведени€ о количестве заказанных экземпл€ров каждой книги, изданной в текущем году  
CREATE VIEW book_amt
AS SELECT Z_AMT, B_NAME, T_YEAR
FROM ZAKAZ, BOOK, TIRAZ 
WHERE BOOK.B_ID=ZAKAZ.B_ID AND BOOK.T_ID=TIRAZ.T_ID

-- —оздать хранимые процедуры
--1. дл€ снижени€ цены на книги, которые наход€тс€ на базе в количестве, превышающем 1000 штук
USE ZADANIE;
go
CREATE PROCEDURE reduce_price (@PRICE decimal (4))
as
begin
UPDATE BOOK SET PRICE=PRICE*0.9 WHERE B_ID= (SELECT B_ID FROM IZDATELSTVO JOIN TIRAZ ON TIRAZ.T_ID = BOOK.T_ID AND T_AMT>1000); 
end
--2. дл€ ввода новой книги

CREATE PROCEDURE insert_book (@B_ID varchar(6), @B_NAME varchar(20), @A_ID varchar(6), @KAT_ID varchar(6), @PAGE decimal(4), @T_ID varchar(6), @PRICE decimal(4))
as
begin
insert into insert_book (B_ID, B_NAME, A_ID, KAT_ID, PAGE, T_ID, PRICE) values (@B_ID, @B_NAME, @A_ID, @KAT_ID, @PAGE, @T_ID, @PRICE); 
end

--3. дл€ оформлени€ заказа
CREATE PROCEDURE zakaz_book (@Z_ID varchar(6), @ZAKAZCHIK_ID varchar(20), @Z_AMT decimal(6), @Z_DATE date, @B_ID varchar(6))
as
begin
insert into zakaz_book (Z_ID, ZAKAZCHIK_ID, Z_AMT, Z_DATE, B_ID) values (@Z_ID, @ZAKAZCHIK_ID, @Z_AMT, @Z_DATE, @B_ID); 
end

--4. дл€ поиска книг заданного автора
CREATE PROCEDURE search_book (@B_NAME  varchar(20), @A_ID varchar(6), @SURNAME varchar(20), @FNAME varchar(20), @PATRONYMIC varchar(20))
as
begin
SELECT B_NAME, SURNAME, FNAME, PATRONYMIC FROM AVTOR JOIN BOOK ON AVTOR.A_ID=BOOK.A_ID; 
end