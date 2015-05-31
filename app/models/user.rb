class User < ActiveRecord::Base
    has_secure_password
    has_many :event_signups, :dependent => :delete_all
    has_many :events, through: :event_signups, :dependent => :delete_all
    belongs_to :location
    belongs_to :university
    
    validates :email, :uniqueness => true, :allow_nil => false
    validates :password, :presence => true
    validates :graduation_year, :presence => true
    validates :major, :presence => true
    validates :location_id, :presence => true
    validates :university_id, :presence => true
end
