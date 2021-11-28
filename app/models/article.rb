class Article < ApplicationRecord
    validates :name, presence: true
    validates :name, length: { minimum: 3 }
    # validates :name, uniqueness: true
    
    validates :body, presence: true
    validates :body, length: { minimum: 5 }

    has_many :comments
end
