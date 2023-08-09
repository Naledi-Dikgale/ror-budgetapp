require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create!(name: 'Naledi', email: 'naledi01@test.com', password: 'password') }
  let(:category) { Category.create!(author: user, name: 'Naledi', icon: 'icon') }
  let!(:item) { Item.create!(author: user, name: 'Naledi', amount: 500) }
  let!(:category_item) { CategoryItem.create!(category:, item:) }

  describe 'validations' do
    it 'should be valid with all valid attributes' do
      expect(category).to be_valid
    end

    it 'should  be valid if name is present' do
      category.name = nil
      expect(category).to be_valid
    end
  end

  describe 'associations' do
    it 'should belong to the correct user' do
      expect(category.author).to eql user
    end

    it 'should include correct item' do
      expect(category.items).to include(item)
    end
  end

  describe 'total_amount' do
    it 'should calculate the total amount of items' do
      expect(category.total_amount).to eq(item.amount)
    end
  end
end
