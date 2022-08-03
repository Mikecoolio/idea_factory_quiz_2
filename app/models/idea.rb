class Idea < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true

    has_many :users
end
