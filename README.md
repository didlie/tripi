# Tripi - CSCI 201 Final Project


## Authors:
* Bram Lim
* Natalie Pearson
* Dongzi Qu
* Xueyuan Wang
* Wilhelm Willie

## How to Setup and Run Tripi
1. Open Eclipse
2. Import project “tripi_csci201” into your workspace
3. Open the project settings in Eclipse and make sure external JARs are included in the project (particularly the JDBC driver for MySQL: mysql-connector-java-5.1.46.jar)
4. Open Tripi_Setup.sql and run that in MySQL Workbench to ensure you have a database properly set up. This will create a database called Tripi
5. Change the connection URL (String user and password) in JDBCDriver.java to match your local database credentials (NOTE: In our final version this is all you have to do but as of right now, there's another connection URL you need to change which is in Profile.java)
6. Right click on the project and run on a Apache TomCat v9.0 server
7. Open Google Chrome (our preferred browser)
8. Navigate to localhost:8080/tripi_csci201/home.jsp
9. Start using Tripi!


## To Do
* Code cleanup (commenting code, formatting it nicely, removing unnecessary code, etc)
* Bug fixes (Mostly visual)
* Feature tuneup (Some features work as laid out in our documentation but could be improved upon)
* Clean up front end and make the web app look uniform

As of right now, most of the web app functionality is up and running. We currently have working login/signup, websocket multithreading, and trip creation/viewing/editing functionality which is what we wanted for our final project. What's left is bug fixes, feature enhancements, and clean up.