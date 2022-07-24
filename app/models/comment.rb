class Comment < ApplicationRecord
    validates :content, presence: true

    has_many :blogs
    has_many :users, through: :blogs

end
