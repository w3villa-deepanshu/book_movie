# Movie Booking

1. Introduction: Movie Booking is a web application where users can select and book seats for available movie shows.

2. User Types: There are two types of users: admin and regular users. An admin attribute in the user table, represented as a boolean value, determines access rights. Admins can create movies, manage shows, and view all bookings.

3. Payment Integration: We have integrated Stripe for processing payments securely.

4. Features for Regular Users: Regular users can book movie tickets and view their bookings. They have the ability to cancel bookings for future dates. 

5. Cancellation Feature: When a user cancels a booking, the seats become available for others to book.

6. Admin Privileges: Admins have the ability to book movies and create shows for these movies.

7. Restrictions: Regular users are restricted from creating movies and shows to maintain system integrity.

8. Automatic Seat Creation: For simplicity, we automatically create 50 seats whenever a new show is set up.

9. Technology Stack: The application is built using Rails 7 and Ruby 3.1.1, with PostgreSQL as the database.

10. Pagination: To handle large datasets efficiently, pagination has been implemented.

11. User-Friendly URLs: We've added slugs to make the links more readable and easier to navigate.
