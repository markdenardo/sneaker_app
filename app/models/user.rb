class User < ApplicationRecord
  has_many :shops
  has_many :sneakers, through: :shops
end
