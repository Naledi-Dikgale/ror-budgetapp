class Item < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :category_items, dependent: :destroy
  has_many :categories, through: :category_items
end
