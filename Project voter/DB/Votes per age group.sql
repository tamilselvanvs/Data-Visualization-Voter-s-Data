/* Votes per age group*/

/*Election 1*/

create view age_group_election_1
select count(E1_PartyCd) as no_of_votes, 'E1' as Election_No, '18-40' as Age_group from voter_details 
where age between 18 and 40 and E1_PartyCd<>''

union

select count(E1_PartyCd) as no_of_votes, 'E1' as Election_No, '40-60' as Age_Group from voter_details 
where age between 40 and 60 and E1_PartyCd<>''

union

select count(E1_PartyCd) as no_of_votes, 'E1' as Election_No, '60-80' as Age_Group from voter_details 
where age between 60 and 80 and E1_PartyCd<>''

union

select count(E1_PartyCd) as no_of_votes, 'E1' as Election_No, '80-100' as Age_Group from voter_details 
where age between 80 and 100 and E1_PartyCd<>''

union

select count(E1_PartyCd) as no_of_votes, 'E1' as Election_No, '100-120' as Age_Group from voter_details 
where age between 100 and 120 and E1_PartyCd<>''

/*Similarly for other elections the view is created and the query is executed*/