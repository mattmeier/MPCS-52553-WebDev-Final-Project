class Location < ActiveRecord::Base
    has_many :users
    has_many :events
    has_many :universities
    
    validates_presence_of :city
    validates_presence_of :state
    validates_presence_of :description
end
