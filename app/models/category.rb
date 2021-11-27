class Category < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :name, length: { maximum: 20 }
end
