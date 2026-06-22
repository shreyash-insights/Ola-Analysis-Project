CREATE DATABASE OLA;
USE OLA;

-- 1. Retrieve all successful bookings:
create view successful_bookings as
SELECT * FROM Bookings 
WHERE Booking_Status = 'Success';

select * from successful_bookings;

-- 2.Find the average ride distance for each vehicle type:
create view ride_distance_for_rach_vehicle as 
SELECT Vehicle_Type, AVG(Ride_Distance)
as avg_distance FROM bookings
GROUP BY Vehicle_Type;

select * from ride_distance_for_rach_vehicle;


-- 3. Get the total number of cancelled rides by customers:
SELECT COUNT(*) AS total_cancelled_rides
FROM Bookings
WHERE Booking_Status = 'Cancelled by Customer';

-- 4. List the top 5 customers who booked the highest number of rides:
create view top_5_customer_with_highest_of_rides as
select customer_id,
count(*) as total_bookings
from bookings
group by customer_id
order by total_bookings desc
limit 5;
        
select * from top_5_customer_with_highest_of_rides;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view rides_cancelled_by_drivers_due_to_P_C_issue as 
select count(*) 
from bookings
where Canceled_Rides_by_Driver = 'personal & car related issue';

select*from rides_cancelled_by_drivers_due_to_P_C_issue;


-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_min_driver_rating_for_PS as 
select
 max(Driver_Ratings) as max_rating,
 min(Driver_Ratings) as min_rating
from bookings
where Vehicle_Type = 'prime sedan';

select * from max_min_driver_rating_for_PS;


--  7. Retrieve all rides where payment was made using UPI:
create view payment_method_upi as 
select * from bookings
where Payment_Method = 'UPI';

select * from  payment_method_upi;


-- 8. Find the average customer rating per vehicle type:
create view avg_customer_rating_per_vehicle_type as 
select
  Vehicle_Type,
  avg(Customer_Rating) as average_customer_rating
from bookings
group by Vehicle_Type;

select * from avg_customer_rating_per_vehicle_type ;


-- 9. Calculate the total booking value of rides completed successfully:
create view total_booking_value as
select 
 sum(Booking_Value) as total_booking_value
from Bookings
where Booking_Status ='success';
 
 select * from total_booking_value;
 
 
 -- 10. List all incomplete rides along with the reason:
 create view incomplete_rides_with_reasons as 
 select 
  Customer_ID,
  Incomplete_Rides_Reason
from Bookings
where Incomplete_Rides  = 'Yes';

  select * from incomplete_rides_with_reasons;











