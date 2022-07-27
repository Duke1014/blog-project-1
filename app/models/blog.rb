class Blog < ApplicationRecord
    # validates :content, presence: true

    has_many :comments
    has_many :users, through: :comments
end
