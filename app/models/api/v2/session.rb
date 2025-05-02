class Api::V2::Session < ApplicationRecord
  belongs_to :user

  def generate_access_token
    loop do
        self.access_token = "#{SecureRandom.hex(10)}#{Time.now.to_i}"
        break unless User.exists?(access_token: self.access_token)
    end
    self.save
  end
end
