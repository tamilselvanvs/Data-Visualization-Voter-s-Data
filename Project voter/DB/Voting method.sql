/*Voting Method*/

/*Election 1*/

create view voting_method_election_1
select 'E1' as Election_No,E1_VotingMethod as Voting_method,count(E1_VotingMethod) as E_time
from voter_details
group by E1_VotingMethod

/*Similarly for other elections the view is created and the query is executed*/