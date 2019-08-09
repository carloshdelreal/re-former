class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :username, presence: true, uniqueness:  { case_sensitive: false }
    validates :email, presence: true,format: { with: VALID_EMAIL_REGEX },uniqueness:  { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 5 }
    has_secure_password

end
