# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

User.delete_all
Location.delete_all
University.delete_all
Friendlist.delete_all

Location.create(city: 'Chicago', state: 'IL')
Location.create(city: 'New York City', state: 'NY')
Location.create(city: 'San Francisco', state: 'CA')
Location.create(city: 'Washington', state: 'DC')
Location.create(city: 'Las Vegas', state: 'NV')
Location.create(city: 'Austin', state: 'TX')
Location.create(city: 'Dallas', state: 'TX')
Location.create(city: 'Los Angeles', state: 'CA')
Location.create(city: 'Boston', state: 'MA')

University.create(name: 'University of Chicago', color: '800000')
University.create(name: 'Northwestern University', color: '4E015C')
University.create(name: 'Harvard University', color: 'C90016')
University.create(name: 'Princeton University', color: 'FF8F00')
University.create(name: 'Stanford University', color: '8C1515')
University.create(name: 'Yale University', color: '0E4C92')
University.create(name: 'Columbia University', color: 'C4D8E2')

User.create(name: 'Matthias Meier', email: 'meierm@uchicago.edu', password: '123polizei', university_id: 1, graduation_year: 2015, major: 'Computer Science', bio: 'I love web design.', location_id: '1', interested_in_hosting: 'yes', interested_in_hanging_out: 'yes')
User.create(name: 'Will Boyer', email: 'wboyer@northwestern.edu', password: 'dajs32ids', university_id: 2, graduation_year: 2013, major: 'Mathematics', bio: 'I am a Maths Geek.', location_id: '2', interested_in_hosting: 'no', interested_in_hanging_out: 'yes')
User.create(name: 'Ralph Lesser', email: 'lesser@uchicago.edu', password: 'hajs2das', university_id: 1, graduation_year: 2015, major: 'Classics', bio: 'Bulls forever', location_id: '3', interested_in_hosting: 'yes', interested_in_hanging_out: 'yes')
User.create(name: 'Rick Andrews', email: 'andrews@harvard.edu', password: 'asda123sd', university_id: 4, graduation_year: 2014, major: 'Economics', bio: 'HARVARD IS STILL THE BEST', location_id: '4', interested_in_hosting: 'no', interested_in_hanging_out: 'yes')
User.create(name: 'Jessica Sanchez', email: 'sanchez@stanford.edu', password: 'asg3ggg4g', university_id: 5, graduation_year: 2013, major: 'Electrical Engineering', bio: 'Up for going out in Vegas', location_id: '7', interested_in_hosting: 'yes', interested_in_hanging_out: 'yes')
User.create(name: 'Monica Spiegel', email: 'spiegel@yale.edu', password: 'ahjasd233', university_id: 6, graduation_year: 2013, major: 'Biology', bio: 'Missing Yale people', location_id: '7', interested_in_hosting: 'no', interested_in_hanging_out: 'yes')
User.create(name: 'Ryan Lecher', email: 'rl@columbia.edu', password: 'aha12433', university_id: 7, graduation_year: 2015, major: 'German', bio: 'Give me a shout if you are in LA', location_id: '8', interested_in_hosting: 'yes', interested_in_hanging_out: 'yes')

Friendlist.create(creator_id: 1, friend_id: 3)
Friendlist.create(creator_id: 1, friend_id: 2)
Friendlist.create(creator_id: 2, friend_id: 4)
Friendlist.create(creator_id: 3, friend_id: 5)
Friendlist.create(creator_id: 6, friend_id: 4)
Friendlist.create(creator_id: 6, friend_id: 7)