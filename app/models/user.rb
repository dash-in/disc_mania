class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image
  acts_as_paranoid


  has_many :cart_items
  has_many :shipping_infos
  has_many :orders
  has_many :reviews, dependent: :destroy

  # User.joins(orders: :order_details).select("users.*,orders.*,order_details.*")

end
