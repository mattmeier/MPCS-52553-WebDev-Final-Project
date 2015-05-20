class Friendlist < ActiveRecord::Base
    has_many :users
    
    validates_presence_of :requester_id
    validates_presence_of :friend_id
end