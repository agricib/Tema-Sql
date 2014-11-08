
----------------cerinta unu
----------------USE master; 
----------------GO 
----------------CREATE DATABASE Magazin 
----------------ON      ( NAME = Sales_dat, FILENAME = 'C:\Databases\Magazin.mdf') 
----------------LOG ON  ( NAME = Sales_log, FILENAME = 'C:\Databases\Magazin.ldf'); 
----------------GO

----------------cerinta doi

----------------USE Magazin
----------------GO

----------------create table Magazin
----------------(id_magazin int primary key not null,
----------------nume_magazin nvarchar(max))

----------------create table Categorie_Produs
----------------(id_categorie int primary key not null,
----------------nume_categorie nvarchar(max))

----------------create table Produse 
----------------(id_produs int primary key not null ,
----------------id_magazin int,
----------------id_categorie int,
----------------nume_produs nvarchar(max))

----------------create table Stocuri
----------------( cantitate int,
----------------  id_magazin int,
----------------  id_produs int)

----------------create table Intrari
----------------(id_magazin int,
----------------id_produs int,
----------------cantitate int,
----------------pret_unitar decimal(18, 0),
----------------data_intrare datetime not null)

----------------create table Iesiri
----------------(id_magazin int,
----------------id_produs int,
----------------cantitate int,
----------------pret_unitar decimal(18, 0),
----------------data_iesire datetime not null)

----------------ALTER TABLE Produse
----------------ADD CONSTRAINT FK_id_magazin FOREIGN KEY (id_magazin) REFERENCES Magazin (id_magazin),
----------------	CONSTRAINT FK_id_categorie FOREIGN KEY (id_categorie) REFERENCES Categorie_Produs (id_categorie)
----------------    ON DELETE CASCADE
----------------    ON UPDATE CASCADE;

----------------ALTER TABLE Stocuri
----------------ADD CONSTRAINT FK_id_produs FOREIGN KEY (id_produs) REFERENCES Produse (id_produs),
----------------	CONSTRAINT FK_id_magazinS FOREIGN KEY (id_magazin) REFERENCES Magazin (id_magazin) 
----------------    ON DELETE CASCADE
----------------    ON UPDATE CASCADE;

----------------ALTER TABLE Intrari
----------------ADD CONSTRAINT FK_id_magazinIR FOREIGN KEY (id_magazin) REFERENCES Magazin (id_magazin),
----------------	CONSTRAINT FK_id_produsIR FOREIGN KEY (id_produs) REFERENCES Produse (id_produs) 
----------------    ON DELETE CASCADE
----------------    ON UPDATE CASCADE;

----------------ALTER TABLE Iesiri
----------------ADD CONSTRAINT FK_id_produsIS FOREIGN KEY (id_produs) REFERENCES Produse (id_produs),
----------------	CONSTRAINT FK_id_magazinIS FOREIGN KEY (id_magazin) REFERENCES Magazin (id_magazin) 
----------------    ON DELETE CASCADE
----------------    ON UPDATE CASCADE;

----------------use Magazin;
----------------go



------create trigger InsertTrigger
------on [dbo].[Stocuri]
------for insert
------as
------begin
------insert into [dbo].[Stocuri](cantitate, id_magazin, id_produs) values 
------(10, 1, 1),
------(15, 1, 3),
------(20, 1, 6),
------(25, 1, 10),
------(10, 2, 4),
------(15, 2, 2),
------(20, 2, 11),
------(25, 2, 5);
------end;
------go
--------Use Magazin
--------insert into [dbo].[Produse](id_produs, id_magazin, id_categorie, nume_produs)values
--------(1, 1, 1, 'Paine Alba'),
--------(2, 2, 2, 'Iaurt'),
--------(3, 1, 3, 'Cotletul de Porc'),
--------(4, 2, 4, 'Mere'),
--------(5, 2, 5, 'Rosii'),
--------(6, 1, 6, 'Strudel'),
--------(7, 1, 1, 'Paine Neagra'),
--------(8, 2, 2, 'Lapte'),
--------(9, 2, 3, 'Mezelurile Afumate'),
--------(10, 1, 4, 'Pere'),
--------(11, 2, 5, 'Castraveti'),
--------(12, 1, 6, 'Pateu');

-------cerinta trei

----USE Magazin
----GO

----insert into Magazin(id_magazin, nume_magazin) values (1, 'Kaufland'), (2, 'Shop&Go');

--select * from Magazin

------insert into [dbo].[Categorie_Produs]([id_categorie],[nume_categorie]) 
------values 
------(1,  'Brutarie'),
------(2, 'Lactate'),
------(3, 'Mezeluri'),
------(4,'Fructe'),
------(5,'Legume'),
------(6,'Patiserie');

------select * from [dbo].[Categorie_Produs];

------insert into [dbo].[Stocuri](cantitate, id_magazin, id_produs) values 
------(1, 1, 1),
------(2, 2, 2),
------(3, 1, 4),
------(4, 2, 6);


------parcurgere secventilala folosind bucla

----------declare @counter_magazin as int =1
----------declare @counter_produs as int =1
----------declare @counter_categorie as int =1
----------declare @nume_magazin as nvarchar(10) = 'Kaufland'
----------declare @cantitate int = 10
----------declare @id_produs nvarchar(max)


----------while @counter_magazin <= 2
----------begin
----------insert into Magazin (id_magazin,nume_magazin) values (@counter_magazin, @nume_magazin)
----------set @counter_magazin = @counter_magazin +1
----------set @nume_magazin = 'Shop&Go'
----------end

----------insert into Categorie_Produs([id_categorie],[id_produs],[nume_categorie]) 
----------values 
----------(1, 1, N'Brutarie'),
----------(2, 2, N'Lactate'),
----------(3, 3, N'Mezeluri'),
----------(4, 4, N'Fructe'),
----------(5, 5, N'Legume'),
----------(6, 6, N'Patiserie');

----------insert into Produse(id_produs, id_magazin, id_categorie, nume_produs)values
----------(1, 1, 1, N'Paine Alba'),
----------(2, 2, 2, N'Iaurt'),
----------(3, 1, 3, N'Cotletul de Porc'),
----------(4, 2, 4, N'Meree'),
----------(5, 2, 5, N'Rosii'),
----------(6, 1, 6, N'Strudel'),
----------(7, 1, 1, N'Paine Neagra'),
----------(8, 2, 2, N'Lapte'),
----------(9, 2, 3, N'Mezelurile Afumate'),
----------(10, 1, 4, N'Pere'),
----------(11, 2, 5, N'Castraveti'),
----------(12, 1, 6, N'Pateu');

----------set @counter_magazin = 1
----------while @counter_magazin <= 2
----------	begin

----------set @counter_produs = 1
----------while @counter_produs <=4
----------	begin

----------insert into Stocuri(cantitate, id_magazin, id_produs) values (@cantitate, @counter_magazin, @id_produs)
----------set @cantitate = @cantitate + 5
----------set @counter_produs = @counter_produs + 1
----------set @id_produs = (select id_produs from Produse where id_magazin = @counter_magazin) 
----------	end 
----------set @counter_magazin = @counter_magazin + 1
----------set @cantitate = 10
----------	end

--------cerinta patru

--------USE Magazin
--------GO
--------SELECT p.id_magazin, p.id_produs, p.id_categorie FROM Produse p LEFT JOIN Stocuri s
--------ON p.id_produs=s.id_produs WHERE s.id_produs IS  NULL

--------select id_magazin, id_produs, id_categorie from produse where id_produs not in (select id_produs from Stocuri)

----------------cerinta cinci

--------USE Magazin
--------GO
--------CREATE VIEW view_cinci
--------AS 
--------SELECT m.nume_magazin, c.nume_categorie, p.nume_produs, n.cantitate
--------FROM dbo.Categorie_Produs AS c INNER JOIN
--------    dbo.Produse AS p ON c.id_categorie = p.id_categorie INNER JOIN
--------    dbo.Magazin As m ON p.id_magazin = m.id_magazin INNER JOIN
--------    dbo.Stocuri AS n ON p.id_produs = n.id_produs AND m.id_magazin = n.id_magazin
--------GO



--------cerinta sase


----------USE Magazin
----------GO
----------CREATE PROCEDURE InsertProc 
----------AS
----------BEGIN
----------	INSERT INTO [dbo].[Intrari](id_magazin, id_produs,cantitate, pret_unitar, data_intrare)
----------	VALUES
----------	(1, 1,100, 1.00, getdate()+1),
----------	(1, 3,200, 8.00, getdate()+10),
----------	(1, 6,300, 3.00, getdate()+100),
----------	(1, 10,350, 6.00, getdate()+1000),
----------	(2, 2,350, 3.00, getdate()+1),
----------	(2, 4,10, 5.00, getdate()+10),
----------	(2, 5,120, 2.00, getdate()+100),
----------	(2, 11,230, 3.00, getdate()+10000)
----------END
----------return


----------exec InsertProc;
---------- go
---------- use Magazin
---------- go
----------SELECT * FROM Intrari

----------cerinta sapte


------USE Magazin
------GO

------select id_magazin, data_intrare, id_produs from Intrari 
------where data_intrare in (select max(data_intrare) from Intrari group by id_magazin)




------use Magazin;
------go

------select id_magazin, id_produs, data_intrare from( 
------SELECT id_magazin, id_produs, data_intrare, 
------ROW_NUMBER() OVER(PARTITION BY id_magazin ORDER BY data_intrare ASC) AS Row
------FROM Intrari) temp
------where Row <= 2



--------cerinta opt

----USE Magazin
----GO
----insert into Iesiri(id_magazin, id_produs,cantitate, pret_unitar,data_iesire) values
----(1,1,,300 3, getdate()+1),
----(1,3,320, 10,getdate()+10),
----(1,6,250, 5,getdate()+100),
----(2,2,120, 6,getdate()+100),
----(2,4,1000, 8,getdate()+10),
----(2,5,360, 4,getdate()+1);
----select * from iesiri;


----USE Magazin
----GO

----create trigger CantitateUpdate
----on Intrari
----after insert
----as
----begin
----	UPDATE [dbo].[Stocuri]
----    SET  [cantitate] += new.[cantitate]
----	From inserted new
----    WHERE ([dbo].[Stocuri].[id_produs] =new.[id_produs] And [dbo].[Stocuri].[id_magazin] =new.[id_magazin])

----end
----go



----USE Magazin
----GO

----create trigger CantitateRemove
----on Iesiri
----after insert
----as
----begin
----	UPDATE [dbo].[Stocuri]
----    SET  [cantitate] -= new.[cantitate]
----	From inserted new
----    WHERE ([dbo].[Stocuri].[id_produs] =new.[id_produs] And [dbo].[Stocuri].[id_magazin] =new.[id_magazin])

----end
----go
----use Magazin
----insert into Iesiri(id_magazin,id_produs,cantitate,pret_unitar,data_iesire)
----values(1,1,1000,3,GETDATE()+100)

----Select * from Stocuri
----select * from Intrari


---cerinta 9---

------USe Magazin
------SELECT
------    m.nume_magazin,p.nume_produs, c.nume_categorie ,i.data_intrare
------FROM
------	dbo.Intrari As  i
------    LEFT JOIN dbo.Produse As p
------    ON i.id_produs = p.id_produs
------	 LEFT JOIN dbo.Categorie_Produs As c
------    ON c.id_categorie = p.id_categorie
------	 LEFT JOIN dbo.Magazin As m
------    ON m.id_magazin = i.id_magazin
------where i.data_intrare > getdate()-10


------SELECT
------    m.nume_magazin,p.nume_produs, c.nume_categorie ,i.data_iesire
------FROM
------	 dbo.Iesiri AS i
------    LEFT JOIN dbo.Produse As p
------    ON i.id_produs = p.id_produs
------	 LEFT JOIN dbo.Categorie_Produs AS c
------    ON c.id_categorie = p.id_categorie
------	 LEFT JOIN dbo.Magazin AS m
------    ON m.id_magazin = i.id_magazin
------where i.data_iesire > getdate()-10


----cerinta 10---


---nu e bine---
------CREATE PROC AfisareEvolutie 


------AS 
------BEGIN 
------ SELECT m.nume_magazin as Magazin, i.data_intrare as Data, p.nume_produs As Produs, i.cantitate As cantitate, i.pret_unitar as Valoare
 
------ FROM dbo.Intrari As  i
------    LEFT JOIN dbo.Produse As p
------    ON i.id_produs = p.id_produs
------	 LEFT JOIN dbo.Categorie_Produs As c
------    ON c.id_categorie = p.id_categorie
------	 LEFT JOIN dbo.Magazin As m
------    ON m.id_magazin = i.id_magazin
------	Where i.pret_unitar = i.pret_unitar * i.cantitate

------ RETURN; 
------END 
------GO

------USe Magazin
------Exec AfisareEvolutie 
------go