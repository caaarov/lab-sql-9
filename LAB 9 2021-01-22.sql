# Lab | SQL Queries 9
Use sakila;
CREATE TABLE rentals_may (
    rental_id int,
    rental_date datetime,
    inventory_id int,
    customer_id int,
    return_date datetime,
    staff_id int,
    last_update datetime
);

select*from sakila.rental
where rental_date like '%-05%';
INSERT INTO rentals_may (rental_id,rental_date,inventory_id,customer_id,return_date,staff_id,last_update)
SELECT rental_id,rental_date,inventory_id,customer_id,return_date,staff_id,last_update
FROM rental 
where rental_date like '%-05%';

select*from sakila.rentals_may;

#- Create a table `rentals_june` to store the data from rental table with information for the month of June.
Use sakila;
CREATE TABLE rentals_june (
    rental_id int,
    rental_date datetime,
    inventory_id int,
    customer_id int,
    return_date datetime,
    staff_id int,
    last_update datetime
);

select*from sakila.rental
where rental_date like '%-06%';
INSERT INTO rentals_june (rental_id,rental_date,inventory_id,customer_id,return_date,staff_id,last_update)
SELECT rental_id,rental_date,inventory_id,customer_id,return_date,staff_id,last_update
FROM rental 
where rental_date like '%-06%';

#- Check the number of rentals for each customer for May.
select*from sakila.rentals_may;
select customer_id, count(rental_id) as sum_rentals from sakila.rentals_may
group by customer_id
order by sum_rentals desc;


#- Check the number of rentals for each customer for June.
select*from sakila.rentals_june;
select customer_id, count(rental_id) as sum_rentals from sakila.rentals_june
group by customer_id
order by sum_rentals desc;

#- Write a function that checks if customer borrowed more or less books in the month of June as compared to May.
# For this part, you can create a join between the two dataframes created before, using the merge function available for pandas dataframes. 