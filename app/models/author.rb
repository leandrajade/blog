class Author < ApplicationRecord
    validates :name, uniqueness: true
    validates :genre, presence: true
end
