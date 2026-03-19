SELECT name 
FROM sqlite_master
WHERE type ='table';

-- Basic--

SELECT * FROM albums;

SELECT name FROM genres;
SELECT * FROM customers;

SELECT FirstName, LastName FROM customers;

SELECT AlbumId, Title FROM albums;

SELECT * FROM invoice_items;

SELECT TrackId, UnitPrice FROM invoice_items;

SELECT * FROM invoices;
SELECT total AS TOTAL_AMOUNT,
InvoiceId
FROM invoices 
WHERE total>10;

SELECT * FROM CUSTOMERS;
SELECT FirstName, LastName , Country
FROM customers
WHERE Country='USA';

SELECT * FROM TRACKS;
SELECT COUNT(TrackId) AS TOTAL_TRACKS
FROM TRACKS;

SELECT TrackId,MAX (UnitPrice) AS MAXMIMUM_UNITpRICE
FROM TRACKS;

SELECT * FROM invoices;
SELECT InvoiceId, MIN (total) AS MINIMUM_INVOICE_TOTAL
FROM INVOICES;

SELECT EmployeeId,FirstName,LastName ,Title
FROM employees;

SELECT  DISTINCT (BillingCountry) FROM 
invoices;

SELECT * FROM tracks;

SELECT TrackId, name , Milliseconds
FROM tracks
WHERE Milliseconds > 300000;

select * from albums
order by Title;

select * from customers;

select  FirstName, LastName from customers 
group by FirstName, LastName
order by LastName DESC;

select * from genres;
select Count( GenreId ) from genres;

select * from tracks
select * from tracks 
where UnitPrice between '0.99' and '1.99';

select * from customers
where city like '%b____';

select * from invoices;
select Count(InvoiceId) from invoices;

select * from playlists;

--Intermediate---

select * from  tracks;
select TrackId, Name
from tracks;
 
select * from albums;

select * from customers;

select * from employees;
select * from   

select 
      c.FirstName || ' ' || c.LastName AS CustomerName,
	  e.FirstName || ' ' || e.LastName AS SupportRepName
FROM 
     customers c 
JOIN 
     employees e ON c.SupportRepId = e.EmployeeId
ORDER BY 
       SupportRepName;
	   
	   
	   
select * from invoices;
select 
      c.CustomerId ,
	  c.FirstName,c.LastName ,
	  i.InvoiceId,i.BillingAddress,
	  i.BillingCountry
	  
from 
    customers  c 
JOIN 
    invoices i on c.CustomerId= i.InvoiceId
ORDER BY
       i.BillingAddress;

	   
select * from tracks;
select * from genres;
select * from media_types;
select 
      t.TrackId,
	  t.Name as TrackName, 
	  g.Name  as GenreName,
	  m.Name as MediaType
from 
    tracks as t 
JOIN 
    genres  as g 
	      on g.GenreId = t.TrackId 
JOIN 
    media_types  as m 
           on m.MediaTypeId = t.TrackId;

select * from tracks;
select * from genres;	  
	
select 
     Count  ( t.TrackId) as Total_tracks ,
	 t.TrackId ,
	 g.Name 
from 
    tracks as t 
join 
    genres as g
	      on t.GenreId = g.GenreId
group by 
       g.Name
order by Total_tracks; 

select * from tracks;

select Name,UnitPrice
from tracks
      group by Name , UnitPrice
	  order by UnitPrice DESC limit 5;

select 
      Sum(Total) as Total_sales,
	  BillingCountry as AsPer_Country
from invoices
Group by BillingCountry
order by BillingCountry;

select * from albums;
select * from artists;

select 
    a.Title ,
	ar.Name as Artist_Name ,
	Count(AlbumId) as Total_albums 
from 
    albums as a 
join 
    artists as ar 
on  
   a.ArtistId = ar.ArtistId
group by 
       ar.ArtistId , ar.Name
order by 
      Total_albums DESC;


select * from customers;
select * from invoices;

select 
      c.FirstName,
	  c.LastName ,
	 Count( i.Total ) as Purchases
from 
     customers as c
join 
    invoices as i 
        on c.CustomerId = i.CustomerId
group by 
        c.FirstName , c.LastName 
order by 
        Purchases;
		
		
select * from invoices;
select InvoiceId, InvoiceDate , BillingAddress, BillingCountry ,Total
	  from invoices
	 where  TOtal > (select avg(Total) from invoices)
	 order by 
	       total Desc;

select * from invoice_items;
select * from tracks;

select 
     Count(t.TrackId) as total_Qunatity,
	  t.TrackId,
	  i.InvoiceId
from 
    invoice_items as i
join 
    tracks as t 
	    on i.TrackId=t.TrackId
group by
       i.InvoiceId
order by
       total_Qunatity DESC;
select * from playlists;
select * from playlist_track;  
select * from tracks;


select 
     p.PlaylistId ,
	 pt.TrackId ,
	  p.Name as Tracks_as_Each,
	 Count(pt.TrackId)  as Total_tracks
from 
    playlists as p 
JOIN 
    playlist_track as pt
	     on p.PlaylistId =pt.PlaylistId
JOIN 
    tracks as t
	     on pt.TrackId =  T.TrackId
group by 
       p.PlaylistId
order by 
      Total_tracks DESC;
 
	  
select * from employees;

select 
     e.FirstName || ' ' || e.LastName as staff_member,
	 m.FirstName || ' ' || m.LastName as Reprots_TO_Manager 
	 from 
	     employees as e
	 JOIN 
	     employees as m 
	         on m.EmployeeId= e.ReportsTo;
select * from customers;
select * from invoices;

select 
      i.InvoiceId,
	  c.FirstName,c.LastName, c.CustomerId
from 
   customers as c
     LEFT JOIN 
	   invoices as i 
	     on c.CustomerId = i.CustomerId
where i.InvoiceId is NULL;



--- Advanced ---

  select * from customers;
  select * from invoices;
  
   Select 
         c.FirstName, c.LastName, i.Total as Total_sPent
    from customers as c  
	    join
		    invoices as i 
			    on  c.CustomerId = i.CustomerId 
			order by 
			       Total_sPent DESC limit 5;
				  
select * from genres;
select * from tracks;

select 
      G.Name  as Genre_Name,
	  Count(T.TrackId) as total_tracks
From 
    genres as G
join 
    tracks as T
	    on G.GenreId= T.GenreId
  group by 
        g.Name
		
 order by 
        total_tracks DESC;
select * from artists;	
select * from tracks;

select ar.Name , 
        Count(pt.PlaylistId) as playlist_apperances
from artists as ar 
  join albums as al 
     on ar.ArtistId = al.ArtistId
  join tracks as t 
     on al.AlbumId = t.AlbumId
  join playlist_track as pt 
     on t.TrackId = pt.TrackId
  group by 
      ar.name
  order by 
      playlist_apperances
	  limit 5;
   
   
	  
select g.Name as Genre,
       t.Name as Track,
	   t.Milliseconds
from tracks as t 
    join genres as g 
	    on t.GenreId = g.GenreId
	where t.Milliseconds = (
	select Max (Milliseconds)
	from tracks
	where GenreId= g.GenreId
	);
	
select strftime('%Y-%m' , InvoiceDate) as Month , 
      sum(Total) as monlty_revenue
	  from invoices
	  group by Month
	  order by Month ;
	  
select e.FirstName,
       e.LastName ,
	   Count(c.CustomerId) as Customer_Count 
From employees as e
   join customers c 
   on  e.EmployeeId = c.SupportRepId
group by e.EmployeeId 
order by CustomerId DESC
LIMIT 1;
   
select 
     t.name
	    from tracks as t
		  left join invoice_items as ii 
		     on t.TrackId = ii.TrackId
			 where ii.InvoiceLineId is null;
select c.FirstName, c.LastName, al.Title
from customers c
join invoices i on c.CustomerId = i.CustomerId
join invoice_items ii on i.InvoiceId = ii.InvoiceId
join tracks t on ii.TrackId = t.TrackId
join albums al on t.AlbumId = al.AlbumId
group by c.CustomerId, al.AlbumId
having Count(DISTINCT t.TrackId) = (
    select Count(TrackId) from tracks where AlbumId = al.AlbumId
);

select  p.Name, Count(DISTINCT t.GenreId) as Genre_Variety
from playlists p
join playlist_track pt on p.PlaylistId = pt.PlaylistId
join tracks t on pt.TrackId = t.TrackId
group by p.PlaylistId
having Genre_Variety > 5;


select  
    ar.Name as Artist, 
    al.Title as Album, 
    Count(t.TrackId) as Tracks_on_Album,
    sum(ii.UnitPrice * ii.Quantity) as Total_Revenue
from artists ar
join albums al on ar.ArtistId = al.ArtistId
join tracks t on al.AlbumId = t.AlbumId
left join invoice_items ii on t.TrackId = ii.TrackId
group by  al.AlbumId
order by Artist, Album;