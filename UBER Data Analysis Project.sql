Create database Uber;

use Uber

select * from [dbo].[July$];

--Q.1  Retrieve All success Booking

select * from [dbo].[July$]
where Booking_Status='Success';


--Create View so I can see or fectch the value by using only the View name

Create View Successfull_Booking As
select * from [dbo].[July$]
where Booking_Status='Success';

-----------------------------------------------------------
--Remove the Nulls from  Vehicle_Type

SELECT * 
FROM [dbo].[July$]
WHERE Vehicle_Type IS NULL;

Delete 
FROM [dbo].[July$]
WHERE Vehicle_Type IS NULL;

--Q.2  Find the average ride distance for each vehicle type.

select Vehicle_Type, avg(Ride_Distance) [AVG Distance] from [dbo].[July$]
group by Vehicle_Type;

--To Create View for better Understanding

Create View Average_Ride_Distance AS
select Vehicle_Type, avg(Ride_Distance) [AVG Distance] from [dbo].[July$]
group by Vehicle_Type;

select * from Average_Ride_Distance;

--Q.3 Get the total number of canceled rides by customers

select * from [dbo].[July$];

Create View Canceled_by_Rider AS
select count(*) as [Canceled Rides by Customer] from [dbo].[July$]
where Booking_Status ='Canceled by Customer'

select * from Canceled_by_Rider

--Q.4 List the top 5 customers who booked the highest number of rides;

Create View Top_5_Customer AS
SELECT TOP 5 Customer_ID, COUNT(Booking_ID) AS [Top 5 Customer]
FROM [dbo].[July$]
GROUP BY Customer_ID
ORDER BY [Top 5 Customer] DESC;

--Q.5 Get the number of rides canceled by drivers due to personal and car related issues
select * from [dbo].[July$];

--Booking_Satus, Canceled_Rides_by_Driver

Create View Rides_Canceled_By_Drivers AS
select Count(Booking_Status) as [Rides Canceled By Drivers] from [dbo].[July$]
Where Canceled_Rides_by_Driver = 'Personal & Car related issue';

--Q.6 Find the Maxium and minium drivers ratings for prime Sedan Bookings;

--Remove the Nulls from Driver Raitng

SELECT * 
FROM [dbo].[July$]
WHERE Driver_Ratings IS NULL;

Delete 
FROM [dbo].[July$]
WHERE Driver_Ratings IS NULL;

select * from [dbo].[July$]

Create VIEW MAX_MIN_Driver_Rating AS
select MAX(Driver_Ratings) as [Max Rating], Min(Driver_Ratings) as [Min Rating]from [dbo].[July$]
where Vehicle_Type = 'Prime Sedan';

--Q.7 Retrieve all rides where payment was made using UPI

select * from [dbo].[July$];

Create VIEW UPI_Payment AS
select * from [dbo].[July$]
where Payment_method ='UPI';

--Q.8  FInd the average Customer rating per vehicle type;
Create VIEW AVG_Customer_Rating AS
select Vehicle_Type, AVG(Customer_Rating) as [AVG Customer Rating]from [dbo].[July$]
Group by Vehicle_Type

--Q.9 Calculate the total booking value of rides completed successfully

Create View Total_Successfull_Ride_value AS
select SUM(Booking_Value) as [Total Successfull Ride value] from [dbo].[July$]
Where Booking_Status = 'Success';

--Q.10 List all incomplete rides along with the reason

Create View Incomplete_Rides_with_Reason AS
Select Booking_ID, Incomplete_Rides_Reason from [dbo].[July$]
where Incomplete_Rides ='Yes'