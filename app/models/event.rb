class Event < ActiveRecord::Base
	has_many :event_signups
    has_many :users, through: :event_signups
    belongs_to :university
    belongs_to :location
    
    validates_presence_of :name
    validates_presence_of :address
    validates_presence_of :start_time
    validates_presence_of :end_time
    validates_presence_of :university_id
    validates_presence_of :location_id
    validates_presence_of :organizer_contact_email
end
