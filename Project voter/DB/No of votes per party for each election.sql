/*No of votes per party in each election*/

/*Party Name : DEM*/

create view votes_per_party_DEM
 select count(voter_reg_num) as no_of_votes,E1_PartyCd as party_cd ,E1_date as E_date
from voter_details
where E1_PartyCd = 'DEM' 
union
select count(voter_reg_num) as no_of_votes,E2_PartyCd as party_cd , E2_date as E_date
from voter_details
where E2_PartyCd = 'DEM'
union
select count(voter_reg_num) as no_of_votes,E3_PartyCd as party_cd , E3_date as E_date
from voter_details
where E3_PartyCd = 'DEM'
union
select count(voter_reg_num) as no_of_votes,E4_PartyCd as party_cd , E4_date as E_date
from voter_details
where E4_PartyCd = 'DEM'
union
select count(voter_reg_num) as no_of_votes,E5_PartyCd as party_cd , E5_date as E_date
from voter_details
where E5_PartyCd = 'DEM'
union
select count(voter_reg_num) as no_of_votes,E6_PartyCd as party_cd , E6_date as E_date
from voter_details
where E6_PartyCd = 'DEM'
union
select count(voter_reg_num) as no_of_votes,E7_PartyCd as party_cd , E7_date as E_date
from voter_details
where E7_PartyCd = 'DEM'
union
select count(voter_reg_num) as no_of_votes,E8_PartyCd as party_cd , E8_date as E_date
from voter_details
where E8_PartyCd = 'DEM'
union
select count(voter_reg_num) as no_of_votes,E9_PartyCd as party_cd , E9_date as E_date
from voter_details
where E9_PartyCd = 'DEM'
union
select count(voter_reg_num) as no_of_votes,E10_PartyCd as party_cd , E10_date as E_date
from voter_details
where E10_PartyCd = 'DEM'
union
select count(voter_reg_num) as no_of_votes,E11_PartyCd as party_cd , E11_date as E_date
from voter_details
where E11_PartyCd = 'DEM'
union
select count(voter_reg_num) as no_of_votes,E12_PartyCd as party_cd , E12_date as E_date
from voter_details
where E12_PartyCd = 'DEM'
union
select count(voter_reg_num) as no_of_votes,E13_PartyCd as party_cd , E13_date as E_date
from voter_details
where E13_PartyCd = 'DEM'
union
select count(voter_reg_num) as no_of_votes,E14_PartyCd as party_cd , E14_date as E_date
from voter_details
where E14_PartyCd = 'DEM'
union
select count(voter_reg_num) as no_of_votes,E15_PartyCd as party_cd , E15_date as E_date
from voter_details
where E15_PartyCd = 'DEM'
union
select count(voter_reg_num) as no_of_votes,E16_PartyCd as party_cd , E16_date as E_date
from voter_details
where E16_PartyCd = 'DEM'
union
select count(voter_reg_num) as no_of_votes,E17_PartyCd as party_cd , E17_date as E_date
from voter_details
where E17_PartyCd = 'DEM'
union
select count(voter_reg_num) as no_of_votes,E18_PartyCd as party_cd , E18_date as E_date
from voter_details
where E18_PartyCd = 'DEM'
union
select count(voter_reg_num) as no_of_votes,E19_PartyCd as party_cd , E19_date as E_date
from voter_details
where E19_PartyCd = 'DEM'
union
select count(voter_reg_num) as no_of_votes,E20_PartyCd as party_cd , E20_date as E_date
from voter_details
where E20_PartyCd = 'DEM'

/*Similarly for other parties the view is created and the query is executed*/