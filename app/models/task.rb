class Task < ApplicationRecord
    validates :name, presence: true
    validates :name, length: { maximum: 20 }

    validates :details, presence: true
    validates :details, length: { maximum: 40 }

    validates :scheduled_at, presence: true
    validates :category, presence: true

    belongs_to :category 
end
