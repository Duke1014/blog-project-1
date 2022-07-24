class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true

    has_many :blogs
    has_many :comments, through :blogs
end
