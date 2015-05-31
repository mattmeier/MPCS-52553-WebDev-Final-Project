class User < ActiveRecord::Base
    has_secure_password

    def send_password_reset
        generate_token(:password_reset_token)
        self.password_reset_sent_at = Time.zone.now
        save!(validate: false)
        UserMailer.password_reset(self).deliver_now
    end

    def generate_token(column)
        begin
            self[column] = SecureRandom.urlsafe_base64
        end while User.exists?(column => self[column])
    end

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
