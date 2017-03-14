class Relationship < ApplicationRecord
	belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
  validates :seller_id, presence: true
  validates :buyer_id, presence: true
end
