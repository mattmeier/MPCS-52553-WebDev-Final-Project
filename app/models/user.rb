class User < ActiveRecord::Base
    belongs_to :location
    belongs_to :university
    
    validates :email, :uniqueness => true, :allow_nil => false
    validates :password, :presence => true
    validates :graduation_year, :presence => true
    validates :major, :presence => true
end
