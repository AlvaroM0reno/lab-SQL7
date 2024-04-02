-- 1. En la tabla de actores, ¿cuáles son los actores cuyos apellidos no se repiten?
USE sakila;
SELECT first_name, last_name
FROM actor
WHERE last_name IN (
    SELECT last_name 
    FROM actor 
    GROUP BY last_name 
    HAVING COUNT(last_name) = 1
);

-- 2. ¿Qué apellidos aparecen más de una vez?
USE sakila;
SELECT first_name, last_name
FROM actor
WHERE last_name IN (
    SELECT last_name 
    FROM actor 
    GROUP BY last_name 
    HAVING COUNT(last_name) > 1
);

-- 3. Utilizando la tabla de alquileres, averigüe cuántos alquileres procesó cada empleado.
SELECT staff_id, COUNT(rental_id)
FROM sakila.rental
GROUP BY staff_id;

-- 4. Usando la tabla de películas, averigua cuántas películas se estrenaron cada año.
SELECT COUNT(film_id), release_year
FROM sakila.film
GROUP BY release_year;

-- 5. Usando la tabla de películas, averigua para cada clasificación cuántas películas había.
SELECT count(film_id), rating
FROM sakila.film
GROUP BY rating;

-- 6. ¿Cuál es la duración media de la película para cada tipo de calificación? Redondea las longitudes medias a dos decimales.
SELECT rating, ROUND(AVG(length), 2)
FROM sakila.film
GROUP BY rating;

-- 7. ¿Qué tipo de películas (calificación) tienen una duración media superior a dos horas?
SELECT rating, ROUND(AVG(length), 2)
FROM sakila.film
GROUP BY rating
HAVING AVG(length) >120;

