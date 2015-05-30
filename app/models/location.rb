class Location < ActiveRecord::Base
    has_many :users, dependent: :restrict_with_exception
    has_many :events, dependent: :restrict_with_exception
    has_many :universities, dependent: :restrict_with_exception
    
    validates_presence_of :city
    validates_presence_of :state
    validates_presence_of :description
end
