class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :category_items, dependent: :destroy
  has_many :items, through: :category_items

  def total_amount
    items.sum(:amount)
  end

  ICONS = {
    'fa-house' => 'Home',
    'fa-cart-shopping' => 'Shopping Cart',
    'fa-car' => 'Car',
    'fa-truck-medical' => 'Medical Truck',
    'fa-piggy-bank' => 'Piggy Bank',
    'fa-credit-card' => 'Credit Card'
  }.freeze
end
