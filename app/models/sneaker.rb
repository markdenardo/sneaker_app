class Sneaker < ApplicationRecord
  has_many :shops
  has_many :users, through: :shops

    validates :style, presence: true, uniqueness: true
    # validates :color, presence: true
    # validates :size, presence: true

#this goes in the rb file of the model
  def sneaker_info
    "#{self.style} - #{self.color} - #{self.size}"
  end

end
