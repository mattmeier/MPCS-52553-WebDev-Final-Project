class Event < ActiveRecord::Base
    has_many :users
    belongs_to :location
    
    validates_presence_of :name
    validates_presence_of :date
    validates_presence_of :time
    validates_presence_of :location
end
