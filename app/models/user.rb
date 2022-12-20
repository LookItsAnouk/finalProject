class User < ApplicationRecord
    has_secure_password
    has_many :migraines, dependent: :destroy
    has_many :posts, dependent: :destroy
    
end
