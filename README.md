# MPCS-52553-WebDev-Final-Project
Final Project for the MPCS 52553 Web Development class at the University of Chicago in Spring 2015. My project partner is Alex Tsu (alextsu).

StayInTouch is a Ruby on Rails powered alumni database website, featuring alumni from your university and at your location after graduation, as well as alumni events hosted in your region. It includes user profiles with secure authentication, dynamic creation of new city and university community profiles, and hosting of and sign ups for events. 

The project includes “Forgot Password” functionality via email (see log).
Both the Event and User models are complete, RESTful database-backed resources (in both cases restricted by authorization though: a user can only edit and delete his own user profile, an event can only be edited and deleted by the user who created it).

Note that the focus of this project was functionality and backend rather than nice design/CSS. 
