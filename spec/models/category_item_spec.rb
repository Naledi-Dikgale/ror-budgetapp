require 'rails_helper'

RSpec.describe CategoryItem, type: :model do
  let(:user) { User.create!(name: 'Naledi', email: 'naledi@test.com', password: 'password') }
  let(:item) { Item.create!(author: user, name: 'Naledi', amount: 500) }
  let(:category) { Category.create!(author: user, name: 'Naledi', icon: 'icon') }
  let(:category_item) { CategoryItem.create!(category:, item:) }

  describe 'associations' do
    it 'should belong to a category' do
      expect(category_item.category).to eq(category)
    end

    it 'should belong to an item' do
      expect(category_item.item).to eq(item)
    end
  end
end
