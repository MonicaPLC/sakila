-- 1. ¿Qué consulta ejecutarías para obtener todos los clientes dentro de city_id = 312? 
-- Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.

select address.city_id, city.city, customer.first_name, customer.last_name, customer.email, address.address
from customer join address
on address.address_id= customer.address_id
join city
on city.city_id=address.city_id and city.city_id=312;

-- 2. ¿Qué consulta harías para obtener todas las películas de comedia? 
-- Su consulta debe devolver el título de la película, la descripción, 
-- el año de estreno, la calificación, las características especiales y el género (categoría).

select film.film_id, film.title, film.description, film.release_year, film.special_features, film.rating, category.name
from film join film_category
on film.film_id=film_category.film_id
join category
on category.category_id= film_category.category_id and category.name='Comedy';

-- 3. ¿Qué consulta harías para obtener todas las películas unidas por actor_id = 5? 
-- Su consulta debe devolver la identificación del actor, el nombre del actor, el título de la película, 
-- la descripción y el año de lanzamiento.

select actor.actor_id, actor.first_name, last_name, film.film_id, film.title, film.description, film.release_year
from film join film_actor
on film.film_id=film_actor.film_id
join actor
on actor.actor_id=film_actor.actor_id and actor.actor_id=5 ;

-- 4. ¿Qué consulta ejecutaría para obtener todos los clientes en store_id = 1 
-- y dentro de estas ciudades (1, 42, 312 y 459)? Su consulta debe devolver el nombre, apellido, 
-- correo electrónico y dirección del cliente.

select store.store_id, city.city_id, customer.first_name, customer.last_name, customer.email, address.address
from address join customer 
on address.address_id=customer.address_id
join city
on city.city_id=address.city_id
join store
on store.store_id=customer.store_id and store.store_id=1 and city.city_id in (1,42,312,459);

-- 5. ¿Qué consulta realizarías para obtener todas las películas con una "calificación = G" y 
-- "característica especial = detrás de escena", unidas por actor_id = 15? 
-- Su consulta debe devolver el título de la película, la descripción, el año de lanzamiento, 
-- la calificación y la función especial. Sugerencia: puede usar la función LIKE para obtener la parte 'detrás de escena'.

select*from film;

select film.title, film.description, film.release_year, film.rating, film.special_features
from film join film_actor
on film.film_id=film_actor.film_id
where film.rating='G' and film.special_features like'%behind%scenes%'and film_actor.actor_id=15;

-- 6. ¿Qué consulta harías para obtener todos los actores que se unieron en el film_id = 369? 
-- Su consulta debe devolver film_id, title, actor_id y actor_name.

select film.film_id as film_id, film.title as título, actor.actor_id, CONCAT_WS('', actor.first_name, actor.last_name) as actor_name
from film join film_actor
on film.film_id=film_actor.film_id
join actor 
on film_actor.actor_id=actor.actor_id
where film.film_id=369;


-- 7. ¿Qué consulta harías para obtener todas las películas dramáticas con una tarifa de alquiler de 2.99? 
-- Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, las características especiales
-- y el género (categoría).

select film.title, film.description, film.release_year, film.rating, film.special_features, film.rental_rate, category.name
from film join film_category
on film.film_id=film_category.film_id
join category
on category.category_id=film_category.category_id and film.rental_rate=2.99 and category.name='Drama';


-- 8. ¿Qué consulta harías para obtener todas las películas de acción a las que se une SANDRA KILMER? 
-- Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, 
-- las características especiales, el género (categoría) y el nombre y apellido del actor.

SELECT actor.actor_id, concat(first_name, ' ', last_name) AS actor_name, film.title, film.description, film.release_year, film.rating, film.special_features, category.name AS genero FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film.film_id = film_actor.film_id
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON category.category_id = film_category.category_id
WHERE actor.first_name = 'SANDRA' AND actor.last_name = 'KILMER'  AND category.name = 'Action';

