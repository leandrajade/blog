class Article < ApplicationRecord
    validates :name, presence: true
    # validates :name, uniqueness: true
    validates :name, length: { minimum: 3 }
    
    validates :body, presence: true
    validates :name, length: { minimum: 5 }
end
