class University < ActiveRecord::Base
    has_many :users, dependent: :restrict_with_exception
    has_many :events, dependent: :restrict_with_exception
    belongs_to :location
    
    validates :name, :uniqueness => true, :allow_nil => false
    validates_presence_of :description
    validates_presence_of :location
    validates_presence_of :logo_url
end
