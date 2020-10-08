Joins
1
select * from invoice inv
join invoice_line invL on invL.invoice_id = inv.invoice_id
where invL.unit_price > 0.99;

2
select inv.invoice_date, cus.first_name, cus.last_name
from invoice inv
join customer cus on inv.customer_id = cus.customer_id;

3
select cus.first_name, cus.last_name, emp.first_name, emp.last_name
from employee emp
join customer cus on cus.support_rep_id = emp.employee_id;

4
select alb.title, art.name 
from album alb
join artist art on alb.artist_id = art.artist_id;

5
select plt.track_id
from playlist_track plt
join playlist pl on pl.playlist_id = plt.playlist_id
where pl.name = 'Music';

6
select t.name
from track t
join playlist_track plt on plt.track_id = t.track_id
where plt.playlist_id = 5;

7
select t.name, pl.name
from track t
join playlist_track plt on t.track_id = plt.track_id
join playlist pl on plt.playlist_id = pl.playlist_id;

8
select t.name, alb.title
from track t
join album alb on t.album_id = alb.album_id
join genre g on g.genre_id = t.genre_id
where g.name = 'Alternative & Punk';

Nested
1
select * 
from invoice
where invoice_id in (
  select invoice_id 
  from invoice_line 
  where unit_price > 0.99);

2
select *
from playlist_track
where playlist_id in (
  select playlist_id 
  from playlist 
  where name = 'Music')

3
select name 
from track
where track_id in (
  select track_id 
  from playlist_track 
  where playlist_id = 5);

4
select *
from track
where genre_id in (
  select genre_id
  from genre 
  where name = 'Comedy');

5
select *
from track
where album_id in (
  select album_id
  from album
  where name ='Fireball');

6 
select *
from track
where album_id in (
  select album_id
  from album 
  where artist_id in (
    select artist_id
    from artist
    where name = 'Queen'));

Rows

1
update customer
set fax = null
where fax is not null;

2
update customer
set company = 'Self'
where company is null;

3
update customer
set last_name = 'Thompson'
where first_name = 'Julia' and last_name = 'Barnett';

4
update customer
set support_rep_id = 4
where email = 'luisrojas@yahoo.cl';

5
update track
set composer = 'The darkness around us'
where composer is null and genre_id = (select genre_id from genre where name = 'Metal');

Group By
1