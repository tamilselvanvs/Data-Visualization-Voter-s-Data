/*City that has got the maximum votes*/

/*Election 1*/

create view city_max_votes_election_1
select count(E1_PartyCd) as no_of_votes,E1_PartyCd,res_city_desc

from voter_details

where E1_PartyCd <> ''

group by res_city_desc,E1_PartyCd

/*Similarly for other elections the view is created and the query is executed*/