class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :record


  validates :quantity, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }


end
