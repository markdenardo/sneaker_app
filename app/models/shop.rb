class Shop < ApplicationRecord
  belongs_to :user
  belongs_to :sneaker

  validates :user_id, presence: true
    validates :sneaker_id, presence: true

end
