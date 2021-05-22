--Is it possible to search sport playgrounds by category?
select * from playground join sport on(playground.sportId=sport.sportId) where sportName='Futboll';
select * from sportSection join sport on(sportSection.sportId=sport.sportId) where sportName='Dance';
