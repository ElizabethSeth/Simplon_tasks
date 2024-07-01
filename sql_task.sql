-- 1- Afficher les 5 premiers Records de la table Actor
SELECT * FROM Actor
LIMIT 5;
-- 2- Récupérer dans une colonne Actor_Name le full_name des acteurs sous le format: first_name + "" + last_name
SELECT CONCAT(first_name , ' ', last_name) AS Actor_Name_full_name
FROM Actor;

-- 3- Récupérer dans une colonne Actor_Name le full_name des acteurs sous le format: first_name en minuscule + "." + last_name en majuscule
SELECT CONCAT(LOWER(first_name) , ' ' , UPPER(last_name)) As Actor_Name_full_name
FROM Actor;

SELECT concat(UPPER(last_name) , '.', UPPER(LEFT(first_name , 1))) AS Actor_Name_full_name
FROM Actor;

SELECT * FROM Actor
WHERE first_name = "JENNIFER";

SELECT * FROM actor
WHERE length(first_name) = 3;

SELECT actor_id, first_name, last_name , length(first_name) AS nbre_char_first_name, length(last_name) AS nbre_char_last_name
FROM actor
ORDER BY length(first_name) DESC;

SELECT actor_id, first_name, last_name , length(first_name) AS nbre_char_first_name, length(last_name) AS nbre_char_last_name
FROM actor
ORDER BY length(first_name) DESC, length(last_name) ASC;

SELECT * From actor
WHERE last_name LIKE '%SON%';

SELECT * From actor
WHERE last_name LIKE 'JOH%';

SELECT first_name , last_name
FROM actor
WHERE last_name LIKE '%LI%'
ORDER BY last_name ASC;

-- 12- trouver dans la table country les countries "China", "Afghanistan", "Bangladesh"
SELECT * FROM country
WHERE country IN ('China', 'Afghanistan', 'Bangladesh');

-- 13- Ajouter une colonne middle_name entre les colonnes first_name et last_name
ALTER TABLE actor
ADD COLUMN middle_name VARCHAR(255)
AFTER first_name;

-- 14- Changer le data type de la colonne middle_name au type blobs
ALTER TABLE actor
MODIFY COLUMN middle_name BLOB;

-- 15- Supprimer la colonne middle_name
ALTER TABLE actor
DROP COLUMN middle_name;

-- 16- Trouver le nombre des acteurs ayant le meme last_name Afficher le resultat par ordre décroissant

SELECT last_name , COUNT(*) as counts
FROM actor
GROUP BY last_name
HAVING count(*) > 1
ORDER BY counts DESC;

-- 17- Trouver le nombre des acteurs ayant le meme last_name Afficher UNIQUEMENT les last_names communs à au moins 3 acteurs Afficher par ordre alph. croissant
SELECT last_name , COUNT(*) as count
FROM actor
GROUP BY last_name
HAVING COUNT(*) >= 3;

-- 18- Trouver le nombre des acteurs ayant le meme first_name Afficher le resultat par ordre alph. croissant
SELECT first_name , COUNT(*) as count
FROM actor
GROUP BY first_name
HAVING COUNT(*) > 1
ORDER BY first_name ASC;

-- Insérer dans la table actor ,un nouvel acteur , faites attention à l'id!
INSERT INTO actor (first_name , last_name)
VALUES ('Nouvel', 'Acteur');

-- 20- Modifier le first_name du nouvel acteur à "Jean
UPDATE actor
SET first_name = 'Jean'
WHERE first_name = 'Nouvel' AND last_name = 'Acteur';

-- 21- Supprimer le dernier acteur inséré de la table actor

DELETE FROM actor
WHERE first_name = 'Jean' AND last_name = 'Acteur';

-- 22-Corriger le first_name de l'acteur HARPO WILLIAMS qui était accidentellement inséré à GROUCHO WILLIAMS
UPDATE actor
SET first_name = 'HARPO'
WHERE first_name = 'GROUCHO' AND last_name = 'WILLIAMS';

-- 23- Mettre à jour le first_name dans la table actor pour l'actor_id 173 comme suit: si le first_name ="ALAN" alors remplacer le par "ALLAN" sinon par "MUCHO ALLAN"
UPDATE actor
SET first_name = CASE
	WHEN first_name = 'ALAN' THEN 'ALLAN'
    ELSE 'MUCHO ALLAN'
END
WHERE actor_id = 173;

-- 24- Trouver les first_names,last names et l'adresse de chacun des membre staff RQ: utiliser join avec les tables staff & address:
SELECT s.first_name , s.last_name , a.address
FROM staff s
JOIN address a ON  s.address_id = a.address_id;

-- 25- Afficher pour chaque membre du staff ,le total de ses salaires depuis Aout 2005. RQ: Utiliser les tables staff & payment.
SELECT s.staff_id, s.first_name, s.last_name, SUM(p.amount) AS total_salary
FROM staff s
JOIN payment p ON s.staff_id = p.staff_id
WHERE p.payment_date >= '2005-08-01'
GROUP BY s.staff_id, s.first_name, s.last_name;

-- 26- Afficher pour chaque film ,le nombre de ses acteurs
SELECT f.title, COUNT(fa.actor_id) AS actor_count
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
GROUP BY f.title;
-- 27 Trouver le film intitulé "Hunchback Impossible"
SELECT film_id
FROM film
WHERE title = 'Hunchback Impossible';

-- 28- combien de copies exist t il dans le systme d'inventaire pour le film Hunchback Impossible

SELECT COUNT(*) AS copy_count
FROM inventory
WHERE film_id = (SELECT film_id FROM film WHERE title = 'Hunchback Impossible');

-- 29- Afficher les titres des films en anglais commençant par 'K' ou 'Q'
SELECT title
FROM film
WHERE title LIKE 'K%' OR title LIKE 'Q%';
-- 30- Afficher les first et last names des acteurs qui ont participé au film intitulé 'ACADEMY DINOSAUR'

SELECT a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'ACADEMY DINOSAUR';

-- 31- Trouver la liste des film catégorisés comme family films.
SELECT f.title
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Family';

-- 32- Afficher le top 5 des films les plus loués par ordre decroissant
SELECT f.title , COUNT(rental_id) as rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 5;

-- 33- Afficher la liste des stores : store ID, city, country
SELECT store_id , city , country
FROM store s
JOIN address a on s.address_id = a.address_id
JOIN city c on a.city_id = c.city_id
JOIN country co on c.country_id = co.country_id;

-- 34- Afficher le chiffre d'affaire par store. RQ: le chiffre d'affaire = somme (amount)
SELECT s.store_id, SUM(p.amount) AS revenue
FROM store s
JOIN staff st ON s.store_id = st.store_id
JOIN payment p ON st.staff_id = p.staff_id
GROUP BY s.store_id;

-- 35- Lister par ordre décroissant le top 5 des catégories ayant le plus des revenues. RQ utiliser les tables : category, film_category, inventory, payment, et rental.

SELECT c.name AS category, SUM(p.amount) AS revenue
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY c.name
ORDER BY revenue DESC
LIMIT 5;

-- 36- Créer une view top_five_genres avec les résultat de la requete precedante.
CREATE VIEW top_five_genres AS
SELECT c.name AS category, SUM(p.amount) AS revenue
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY c.name
ORDER BY revenue DESC
LIMIT 5;

-- 37- Supprimer la table top_five_genres
DROP VIEW top_five_genres;