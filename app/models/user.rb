class User < ApplicationRecord

    has_secure_password

    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :access_token, uniqueness: true

    before_create :generate_access_token
    
    def destroy_session
        self.generate_access_token
        self.save
    end

    private
        def generate_access_token
            loop do
                self.access_token = "#{SecureRandom.hex(10)}#{Time.now.to_i}"
                break unless User.exists?(access_token: self.access_token)
            end
            self.save
        end

end
