Tema 1--
sequence vs identity--

/*Folosind atributul identity pentru o coloana , putem genera cu usurinta numere auto - incrementate.
Cu sequence , acesta va fi un obiect diferit pe care il putem atasa la o coloana de tabela cu insert .
 Spre deosebire de identity , urmatorul numar din coloana va fi preluat de memorie , mai degraba decat de pe disc - 
 acest lucru face sequence semnificativ mai rapid decat de identity . */
Tema 2--



Create database teme;

Go
Use teme;
Create table fisierxml (
	id int primary key identity,
	nume nvarchar(30),
	continut xml
	)
Go

Use [teme]

CREATE TABLE fisierxml (i int primary key identity, continut xml,nume nvarchar(30));
go
INSERT INTO fisierxml VALUES('<root>
<carte autor="Eminescu" editura="Topoloveni">
<capitol numar="1">Prefata</capitol>
<capitol numar="2"></capitol>
<capitol numar="3"></capitol>
<capitol numar="4"></capitol>
<capitol numar="5"></capitol>
    
</carte>
</root>','Vasile');

INSERT INTO fisierxml VALUES('<root>
<carte autor="Vasilescu" editura="Francisco">
<capitol numar="1">Prefata</capitol>
<capitol numar="2"></capitol>
<capitol numar="3"></capitol>
<capitol numar="4"></capitol>
</carte>
</root>','Vasile')

INSERT INTO fisierxml VALUES('<root>
<carte autor="Vladimirescu" editura="Topoloveni">
<capitol numar="1">Prefata</capitol>
<capitol numar="2"></capitol>
<capitol numar="3"></capitol>
</carte>
</root>','Vasile')

INSERT INTO fisierxml VALUES('<root>
<carte autor="Vasilescu" editura="Topoloveni">
<capitol numar="1">Prefata</capitol>
<capitol numar="2"></capitol>
<capitol numar="3"></capitol>
</carte>
</root>','Vasile')

INSERT INTO fisierxml VALUES('<root>
<carte autor="Eduard" editura="Aramis">
<capitol numar="1">Prefata</capitol>
<capitol numar="2"></capitol>
<capitol numar="3"></capitol>
<capitol numar="4"></capitol>
<capitol numar="5"></capitol>
    
</carte>
</root>','Cartea lui Eminescu')
go

INSERT INTO fisierxml VALUES('<root>
<carte autor="Groot" editura="Aramis">
<capitol numar="1">Prefata</capitol>
<capitol numar="2"></capitol>
<capitol numar="3"></capitol>
<capitol numar="4"></capitol>
<capitol numar="5"></capitol>
    
</carte>
</root>','Groot')
go

INSERT INTO fisierxml VALUES('<root>
<carte autor="Roberts" editura="Aramis">
<capitol numar="1">Prefata</capitol>
<capitol numar="2"></capitol>
<capitol numar="3"></capitol>
<capitol numar="4"></capitol>
<capitol numar="5"></capitol>
    
</carte>
</root>','Marvel')
go

select * from fisierxml
where nume like 'Vasile'

--Tema 3--

USE AdventureWorks2014
GO

DECLARE Contact__Cursor CURSOR
FOR SELECT * FROM Person.ContactType
WHERE  Name like '_s%' or Name like 's%'
ORDER BY Name

OPEN Contact__Cursor;
FETCH NEXT FROM Contact__Cursor;
 
WHILE @@FETCH_STATUS = 0
BEGIN

   FETCH NEXT FROM Contact__Cursor;
END

CLOSE Contact_Cursor;
DEALLOCATE contact_cursor;
GOom [Person].[ContactType]