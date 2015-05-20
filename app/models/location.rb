class Location < ActiveRecord::Base
    has_many :universities
    has_many :events
    has_many :users, :through => universities
    
    validates_presence_of :city
    validates_presence_of :state
end
