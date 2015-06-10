# StayInTouch

StayInTouch is a Ruby on Rails powered alumni database website, featuring alumni from your university and at your location after graduation, as well as alumni events hosted in your region. It includes user profiles with secure authentication, dynamic creation of new city and university community profiles, and hosting of and sign ups for events. 

The project includes “Forgot Password” functionality via email. To test it, log out of your registered user account and go to sign up. Then click the "Forgot Password?" link and on the reset page enter your email you have registered your account with. If you have entered the correct email, you should be redirected to the main page and get a success message there. Then you should receive an email with the reset instructions. However, sometimes the message gets caught by the Spam filter - if this happens, please go into the log and look there for a message like the following:
"UserMailer#password_reset: processed outbound mail in 56.2ms

Sent mail to <your email address> (144.0ms)
Date: Sun, 31 May 2015 12:36:46 -0500
From: < some email >
To: <your email address>
Message-ID: < something >
Subject: Your Password Reset For StayInTouch
Mime-Version: 1.0
Content-Type: text/plain;
charset=UTF-8
Content-Transfer-Encoding: 7bit

To reset your password, click the following URL:

http://localhost:3000/password_resets/<some code>/edit

If you did not request your password to be reset, please ignore this email and your password will still remain the original one.
"
Then paste the URL specified in this message into your browser and enter your new password.

Both the Event and User models are complete, RESTful database-backed resources (in both cases restricted by authorization though: a user can only edit and delete his own user profile, an event can only be edited and deleted by the user who created it).

Note that the focus of this project was functionality and backend rather than nice design/CSS. 
Also note that this was a Final Project for the MPCS 52553 Web Development class at the University of Chicago in Spring 2015. My project partner was Alex Tsu (alextsu).
