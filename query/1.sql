--Can a customer leave a review and see reviews from other users?
select c.playgroundId,c.commentsId,c.commText,c.zvezda,c.commDate from (select * from users u join comments l on(u.userId=l.userId)) c join playground p on(c.playgroundId=p.playgroundId); 
insert into project.comments values(1,12,54,'Nice playground',4.8,'2008-7-04');
