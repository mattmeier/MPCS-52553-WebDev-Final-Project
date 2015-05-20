class Friendship < ActiveRecord::Base
    has_and_belongs_to_many :users
    
    validates_presence_of :requester_id
    validates_presence_of :friend_id
end