select * from public.stage_rrhh

--Creando dimension Gender

select distinct(gender) from stage_rrhh
--creando dim gender
drop table Dim_gender
create table Dim_gender
(
id_gender serial,
Gender varchar(10)
)
--insertando en la dim gender
insert into dim_gender (Gender)
select distinct (gender) from stage_rrhh

select * from dim_gender


--Creando dimension EthnicGroup

select distinct(EthnicGroup) from stage_rrhh
--creando dim EthnicGroup
drop table Dim_EthnicGroup
create table Dim_EthnicGroup
(
id_EthnicGroup serial,
EthnicGroup varchar(10)
)
--insertando en la dim EthnicGroup
insert into dim_EthnicGroup (EthnicGroup)
select distinct (EthnicGroup) from stage_rrhh

select * from dim_EthnicGroup

--Creando dimension Work_Type

select distinct(Work_Type) from stage_rrhh
--creando dim Work_Type
drop table Dim_Work_Type
create table Dim_Work_Type
(
id_Work_Type serial,
Work_Type varchar(10)
)
--insertando en la dim Work_Type
insert into dim_Work_Type(Work_Type)
select distinct (Work_Type) from stage_rrhh

select * from dim_Work_Type


--Creando dimension Cost_Centre

select distinct(Cost_Centre) from stage_rrhh
--creando dim Cost_Centre
drop table Dim_Cost_Centre
create table Dim_Cost_Centre
(
id_Cost_Centre serial,
Cost_Centre varchar(25)
)
--insertando en la dim Work_Type
insert into dim_Cost_Centre(Cost_Centre)
select distinct (Cost_Centre) from stage_rrhh

select * from dim_Cost_Centre

        
        
   
--Creando dimension  HireDate

select distinct(HireDate) from stage_rrhh
--creando dim HireDate
create table Dim_HireDate
(
HireDate varchar(25)
)
--insertando en la dim HireDate
insert into dim_HireDate(HireDate)
select distinct (HireDate) from stage_rrhh

select * from dim_HireDate


--Creando dimension  Remains_Employed

select distinct(Remains_Employed) from stage_rrhh
--creando dim Remains_Employed
drop table Dim_Remains_Employed

create table Dim_Remains_Employed
(
id_Remains_Employed serial,
Remains_Employed char(3)
)
--insertando en la dim Remains_Employed
insert into dim_Remains_Employed(Remains_Employed)
select distinct (Remains_Employed) from stage_rrhh

select * from dim_Remains_Employed


--Creando dimension  Remains_Employed

select distinct(PayType) from stage_rrhh
--creando dim PayType
drop table Dim_PayType

create table Dim_PayType
(
id_PayType serial,
PayType varchar(15)
)
--insertando en la dim PayType
insert into dim_PayType(PayType)
select distinct (PayType) from stage_rrhh

select * from dim_PayType

--Creando dimension  SeperationReason

select distinct(SeperationReason) from stage_rrhh
--creando dim SeperationReason
drop table Dim_SeperationReason

create table Dim_SeperationReason
(
id_SeperationReason serial,
SeperationReason varchar(15)
)
--insertando en la dim PayType
insert into dim_SeperationReason(SeperationReason)
select distinct (SeperationReason) from stage_rrhh

select * from dim_SeperationReason


--crear consulta tabla de hechos 

select a.EmployeeID,a.Age,a.AgeGroup,a.TenureDays,a.TernureMonths,a.Leave_Balance,	
a.Sick_Days_Last_12_Mths,a.Current_Salary,a.Current_Employee_Rating,
b.id_gender,c.id_EthnicGroup,d.id_Work_Type,e.id_Cost_Centre,g.id_Remains_Employed,
h.id_PayType,i.id_SeperationReason
from stage_rrhh as a
left join Dim_gender as b
on a.gender=b.gender
left join Dim_EthnicGroup as c
on a.EthnicGroup=c.EthnicGroup
left join Dim_Work_Type as d
on a.Work_Type=d.Work_Type
left join Dim_Cost_Centre as e
on a.Cost_Centre=e.Cost_Centre
left join Dim_Remains_Employed as g
on a.Remains_Employed=g.Remains_Employed
left join Dim_PayType as h
on a.PayType=h.PayType
left join dim_SeperationReason as i
on a.SeperationReason=i.SeperationReason

--Creando tabla de hechos 
select a.EmployeeID,a.Age,a.AgeGroup,a.TenureDays,a.TernureMonths,a.Leave_Balance,	
a.Sick_Days_Last_12_Mths,a.Current_Salary,a.Current_Employee_Rating,
b.id_gender,c.id_EthnicGroup,d.id_Work_Type,e.id_Cost_Centre,g.id_Remains_Employed,
h.id_PayType,i.id_SeperationReason into hechos_empresa
from stage_rrhh as a
left join Dim_gender as b
on a.gender=b.gender
left join Dim_EthnicGroup as c
on a.EthnicGroup=c.EthnicGroup
left join Dim_Work_Type as d
on a.Work_Type=d.Work_Type
left join Dim_Cost_Centre as e
on a.Cost_Centre=e.Cost_Centre
left join Dim_Remains_Employed as g
on a.Remains_Employed=g.Remains_Employed
left join Dim_PayType as h
on a.PayType=h.PayType
left join dim_SeperationReason as i
on a.SeperationReason=i.SeperationReason


select * from hechos_empresa