/***** DDL **/

create database applieddb;

use applieddb;

create table voter_details(
voter_reg_num int primary key ,
first_name varchar(150),
middle_name varchar(150),
last_name varchar(150),
age int,
sex_code varchar(150),
race_code varchar(150),
ethnic_code varchar(150),
registr_dt datetime,
status_cd varchar(150)
);

create table voter_address(
voter_reg_num int,
house_num int,
street_name varchar(150),
street_type_cd varchar(150),
unit_num varchar(100),
precinct_desc varchar(150),
pct_portion float,
res_city_desc varchar(150),
state_cd varchar(150),
zip_code int,
municipality_desc varchar(150),
ward_desc varchar(150),
cong_dist_desc varchar(150),
super_court_desc varchar(150),
judic_dist_desc varchar(150),
nc_senate_desc varchar(150),
nc_house_desc varchar(150),
county_commiss_desc varchar(150),
school_dist_desc varchar(150),
dist_1_desc varchar(150),
CONSTRAINT PK_voter_address PRIMARY KEY (voter_reg_num),
CONSTRAINT FK_va_vd foreign key (voter_reg_num)
references voter_details(voter_reg_num)
on delete cascade
);


create table election_details(
E_N_Key int auto_increment   ,
E_N int ,
E_Date datetime,
CONSTRAINT PK_election_details PRIMARY KEY (E_N_KEY)
);


create table voter_party(
voter_reg_num int,
E_N_Key int,
E_VotingMethod varchar(150),
E_PartyCd varchar(150),
CONSTRAINT PK_voter_party PRIMARY KEY (voter_reg_num,E_N_key),
CONSTRAINT FK_vp_vd foreign key (voter_reg_num)
references voter_details(voter_reg_num)
on delete cascade,
CONSTRAINT FK_vp_ed foreign key (E_N_Key)
references election_details(E_N_KEY)
);



-- voter details start

use applieddb;

drop procedure if exists voter_details_insert;

DELIMITER //

 CREATE PROCEDURE voter_details_insert()
   BEGIN
   set @i =0;
   
   set @table_count =(select max(voter_reg_num) FROM voter_detail);
   while (@i < @table_count) do
		
        insert into voter_details
		select voter_reg_num  ,
		first_name ,
		middle_name ,
		last_name ,
		age ,
		sex_code ,
		race_code ,
		ethnic_code ,
		registr_dt ,
		status_cd 
		from voter_detail
        where voter_reg_num > @i
        order by voter_reg_num
        limit 50000;     
           
    set @i=(select max(voter_reg_num) from voter_details);
	
    end while ;

 end //
 
DELIMITER ;

call voter_details_insert();

-- voter address start

use applieddb;

drop procedure if exists voter_address_insert;

DELIMITER //

 CREATE PROCEDURE voter_address_insert()
   BEGIN
   set @i =0;
   
   set @table_count =(select max(voter_reg_num) FROM voter_detail);
   while (@i < @table_count) do
		
        insert into voter_address
		select
        voter_reg_num ,
		house_num ,
		street_name ,
		street_type_cd ,
		unit_num ,
		precinct_desc ,
		pct_portion ,
		res_city_desc ,
		state_cd ,
		zip_code ,        
		municipality_desc ,
		ward_desc ,
		cong_dist_desc ,
		super_court_desc ,
		judic_dist_desc ,
		nc_senate_desc ,
		nc_house_desc ,
		county_commiss_desc ,
		school_dist_desc ,
		dist_1_desc 
		from voter_detail -- primary table entire dump
        where voter_reg_num > @i
        order by voter_reg_num
        limit 50000;        
    
    set @i=(select max(voter_reg_num) from voter_address);

    end while ;

 end //
 
 DELIMITER ;

call voter_address_insert();

-- voter address insert end --

-- election details population start--

  drop procedure if exists election_detail_insert;
  
  DELIMITER //

CREATE PROCEDURE election_detail_insert()
   BEGIN

    declare j int default 1;
				
	while (j < 21) do
	
    set @election_col = concat('E',j);
    set @date_col = concat('E',j,'_date');
    
    set @query = concat('insert into election_details (E_N,E_date) 
    select ',@election_col, ',date_format(str_to_date(',@date_col,', \'%m/%d/%Y\'), \'%Y%m%d\') from voter_detail 
    where ' ,@date_col,' != \'\' and ',@date_col,' != \'\'
    limit 1 ;');
	
    PREPARE stmt FROM @query;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
    
	set j = j + 1;

	End While;

end //
 
 DELIMITER ;
	
    call election_detail_insert();

-- election details population end --

-- voter party start --
select * from voter_party;
drop procedure if exists voter_party_insert;

Delimiter //

CREATE PROCEDURE voter_party_insert()
   BEGIN

    declare j int default 1;
    set @i =0;
   
   set @table_count = (select max(voter_reg_num) FROM voter_detail);

	 while(@i < @table_count) do
				
	while (j < 21) do
	
    set @col = concat('voter_detail.E',j);
    set @voting_col = concat('voter_detail.E',j,'_votingMethod');
    set @party_col = concat('voter_detail.E',j,'_PartyCd');
    set @date_col = concat('voter_detail.E',j,'_date');
    
    SET @query = CONCAT('insert into voter_party ',
	'select distinct voter_detail.voter_reg_num,election_details.E_N_Key,', @voting_col ,',', @party_col ,
    ' from voter_detail , election_details 
	where ',@col,' = election_details.E_N 
    and ',@date_col,' != \'\'
    limit 50000;');
    
    select @query;
	
    PREPARE stmt FROM @query;
	EXECUTE stmt;

	End While;
	
    set j = 1;
	set @i=(select max(voter_reg_num) from voter_party);
    
    End while ;
end //
 
 DELIMITER ;
	
    call voter_party_insert();
    
-- voter party end --


-- join condition to recreate the table

	select 
		vd.voter_reg_num  ,
		vd.first_name ,
		vd.middle_name ,
		vd.last_name ,
		vd.age ,
		vd.sex_code ,
		vd.race_code ,
		vd.ethnic_code ,
		vd.registr_dt ,
		vd.status_cd ,
		va.house_num ,
		va.street_name ,
		va.street_type_cd ,
		va.unit_num ,
		va.precinct_desc ,
		va.pct_portion ,
		va.res_city_desc ,
		va.state_cd ,
		va.zip_code,
		va.municipality_desc ,
		va.ward_desc ,
		va.cong_dist_desc ,
		va.super_court_desc ,
		va.judic_dist_desc ,
		va.nc_senate_desc ,
		va.nc_house_desc ,
		va.county_commiss_desc ,
		va.school_dist_desc ,
		va.dist_1_desc,
        	vp.E_N ,
		vp.E_VotingMethod ,
		vp.E_PartyCd ,
		vp.E_Date
		from voter_detail vd  
        inner join voter_address va on va.voter_reg_num = vd.voter_reg_num 
        inner join voter_party vp on vp.voter_reg_num = vd.voter_reg_num 
        inner join election_details ed on ed.E_N_Key = vp.E_N_Key;
			
-- recreating the table end --