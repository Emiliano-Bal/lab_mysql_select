SHOW DATABASES;
USE publications;
SHOW TABLES;


#SELECT titleauthor.au_id, titleauthor.title_id, titles.title, authors.au_fname
#FROM titleauthor
#INNER JOIN authors
#ON titleauthor.au_id = authors.au_id
#INNER JOIN titles
#ON titleauthor.title_id = titles.title_id;



SELECT ta.au_id "AUTHOR ID", a.au_lname "LAST NAME", a.au_fname "FIRST NAME", t.title "TITLE", p.pub_name "PUBLISHER"
FROM titleauthor ta
INNER JOIN authors a 
ON ta.au_id = a.au_id
INNER JOIN titles t 
ON ta.title_id = t.title_id
INNER JOIN publishers p 
ON t.pub_id = p.pub_id;


SELECT ta.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", p.pub_name AS "PUBLISHER", count(t.title) AS "TITLE COUNT"
FROM titleauthor ta
INNER JOIN authors a 
ON ta.au_id = a.au_id
INNER JOIN titles t 
ON ta.title_id = t.title_id
INNER JOIN publishers p 
ON t.pub_id = p.pub_id
GROUP BY ta.au_id, p.pub_id
ORDER BY count(t.title) DESC;


SELECT ta.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", sum(s.qty) AS "TOTAL"
FROM authors a 
INNER JOIN titleauthor ta
ON a.au_id = ta.au_id
INNER JOIN sales s
ON ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY sum(s.qty) DESC
LIMIT 3;

SELECT ta.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", coalesce(sum(s.qty), 0) AS "TOTAL"
FROM authors a 
INNER JOIN titleauthor ta
ON a.au_id = ta.au_id
INNER JOIN sales s
ON ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY sum(s.qty) DESC;


