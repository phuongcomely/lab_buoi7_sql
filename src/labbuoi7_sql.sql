-- Lấy danh sách các bộ phim (films) thuộc thể loại “Action.”

select film.film_id, film.title, category.name from film
left join film_category on film.film_id = film_category.film_id
left join category on film_category.category_id = category.category_id
where category.category_id = 1;

-- Lấy danh sách các bộ phim (films) và thể loại (categories) của chúng.
select film.film_id, film.title, category.name from film
left join film_category on film.film_id = film_category.film_id
left join category on film_category.category_id = category.category_id;

--  Lấy danh sách các bộ phim (films) và số lượng thể loại (categories) của mỗi bộ phim.
select film.film_id, film.title, count(category.category_id) as soluong from film
left join film_category on film.film_id = film_category.film_id
left join category on film_category.category_id = category.category_id
group by film.film_id, film.title;

--  Lấy danh sách các bộ phim (films) và thể loại (categories) của bộ phim có rating “PG-13.”
select film.film_id, film.title, film.rating from film
left join film_category on film.film_id = film_category.film_id
left join category on film_category.category_id = category.category_id
where film.rating ="PG-13";

-- Lấy danh sách các diễn viên (actors) và số lượng bộ phim (films) thuộc thể loại “Family,” sắp xếp theo số lượng bộ phim giảm dần
select actor.actor_id, actor.first_name, actor.last_name, COUNT(film.film_id) as so_luong_bo_phim
from actor
inner join film_actor on actor.actor_id = film_actor.actor_id
inner join film on film_actor.film_id = film.film_id
inner join film_category on film.film_id = film_category.film_id
inner join category on film_category.category_id = category.category_id
where category.name = 'Family'
group by actor.actor_id, actor.first_name, actor.last_name
order by so_luong_bo_phim desc;

-- Lấy danh sách các bộ phim (films) và số lượng diễn viên (actors) tham gia, sắp xếp theo số lượng diễn viên giảm dần.
select actor.actor_id, actor.first_name, actor.last_name, COUNT(film.film_id) as so_luong_bo_phim
from actor
inner join film_actor on actor.actor_id = film_actor.actor_id
inner join film on film_actor.film_id = film.film_id
group by actor.actor_id, actor.first_name, actor.last_name
order by so_luong_bo_phim desc;

-- Lấy danh sách tất cả diễn viên (actors) có họ là “Smith” và tên bắt đầu bằng “J.”
select * from actor
where first_name = "Smith" and last_name like "J%";

-- Lấy danh sách các bộ phim (films) phát hành trong năm 2015 với tổng doanh thu (revenue) lớn hơn 5000.
select film.title,  film.release_year, SUM(payment.amount) AS tong_doanh_thu
from film
inner join  inventory on film.film_id = inventory.film_id
inner join rental on inventory.inventory_id = rental.inventory_id
inner join payment on rental.rental_id = payment.rental_id
where film.release_year = 2015
group by film.film_id, film.title, film.release_year
having  SUM(payment.amount) > 5000;

-- Lấy danh sách bộ phim (films) và ngôn ngữ (language) của từng bộ phim.

select film.film_id, film.title, language.name from film
inner join language on film.language_id = language.language_id;

-- Lấy danh sách bộ phim có tên(title) bắt đầu bằng chữ ‘I’ và kết thúc bằng chữ N
select film.film_id, film.title from film
where title like "I%N";