class User < ApplicationRecord
  has_many :shops
  has_many :sneakers, through: :shops

  validates :name, presence: true, uniqueness: true

end
