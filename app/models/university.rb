class University < ActiveRecord::Base
    has_many :users
    has_many :events
    belongs_to :location
    
    validates :name, :uniqueness => true, :allow_nil => false
    validates_presence_of :color
    validates_presence_of :description
    validates_presence_of :location
end
