# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

User.delete_all
Location.delete_all
University.delete_all
Friendlist.delete_all

Location.create(id: '1', city: 'Chicago', state: 'IL')
Location.create(id: '2', city: 'New York City', state: 'NY')
Location.create(id: '3', city: 'San Francisco', state: 'CA')
Location.create(id: '4', city: 'Washington', state: 'DC')
Location.create(id: '5', city: 'Las Vegas', state: 'NV')
Location.create(id: '6', city: 'Austin', state: 'TX')
Location.create(id: '7', city: 'Dallas', state: 'TX')
Location.create(id: '8', city: 'Los Angeles', state: 'CA')
Location.create(id: '9', city: 'Boston', state: 'MA')

University.create(id: '1', name: 'University of Chicago', color: '800000')
University.create(id: '2', name: 'Northwestern University', color: '4E015C')
University.create(id: '3', name: 'Harvard University', color: 'C90016')
University.create(id: '4', name: 'Princeton University', color: 'FF8F00')
University.create(id: '5', name: 'Stanford University', color: '8C1515')
University.create(id: '6', name: 'Yale University', color: '0E4C92')
University.create(id: '7', name: 'Columbia University', color: 'C4D8E2')

User.create(id: '1', name: 'Matthias Meier', email: 'meierm@uchicago.edu', password: '123polizei', university_id: 1, graduation_year: 2015, major: 'Computer Science', bio: 'I love web design.', location_id: '1', interested_in_hosting: 'yes', interested_in_hanging_out: 'yes')
User.create(id: '2', name: 'Will Boyer', email: 'wboyer@northwestern.edu', password: 'dajs32ids', university_id: 2, graduation_year: 2013, major: 'Mathematics', bio: 'I am a Maths Geek.', location_id: '2', interested_in_hosting: 'no', interested_in_hanging_out: 'yes')
User.create(id: '3', name: 'Ralph Lesser', email: 'lesser@uchicago.edu', password: 'hajs2das', university_id: 1, graduation_year: 2015, major: 'Classics', bio: 'Bulls forever', location_id: '3', interested_in_hosting: 'yes', interested_in_hanging_out: 'yes')
User.create(id: '4', name: 'Rick Andrews', email: 'andrews@harvard.edu', password: 'asda123sd', university_id: 3, graduation_year: 2014, major: 'Economics', bio: 'HARVARD IS STILL THE BEST', location_id: '4', interested_in_hosting: 'no', interested_in_hanging_out: 'yes')
User.create(id: '5', name: 'Jessica Sanchez', email: 'sanchez@stanford.edu', password: 'asg3ggg4g', university_id: 4, graduation_year: 2013, major: 'Electrical Engineering', bio: 'Up for going out in Vegas', location_id: '7', interested_in_hosting: 'yes', interested_in_hanging_out: 'yes')
User.create(id: '6', name: 'Monica Spiegel', email: 'spiegel@yale.edu', password: 'ahjasd233', university_id: 5, graduation_year: 2013, major: 'Biology', bio: 'Missing Yale people', location_id: '7', interested_in_hosting: 'no', interested_in_hanging_out: 'yes')
User.create(id: '7', name: 'Ryan Lecher', email: 'rl@columbia.edu', password: 'aha12433', university_id: 6, graduation_year: 2015, major: 'German', bio: 'Give me a shout if you are in LA', location_id: '6', interested_in_hosting: 'yes', interested_in_hanging_out: 'yes')

Friendlist.create(requester_id: 1, friend_id: 3)
Friendlist.create(requester_id: 1, friend_id: 2)
Friendlist.create(requester_id: 2, friend_id: 4)
Friendlist.create(requester_id: 3, friend_id: 5)
Friendlist.create(requester_id: 6, friend_id: 4)
Friendlist.create(requester_id: 6, friend_id: 7)