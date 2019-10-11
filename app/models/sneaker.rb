class Sneaker < ApplicationRecord
  has_many :shops
  has_many :users, through: :shops

    validates :style, presence: true 
      validates :color, presence: true
        validates :size, presence: true

end
