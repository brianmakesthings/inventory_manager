class Item < ApplicationRecord
    belongs_to :location

    validates :name, presence: true
    validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :location, presence: true
end
