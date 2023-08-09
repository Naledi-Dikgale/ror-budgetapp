require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { User.create!(name: 'Naledi', email: 'naledi@test.com', password: 'password') }
  let(:item) { Item.create!(author: user, name: 'Naledi', amount: 500) }

  describe 'validations' do
    it 'should be valid with all valid attributes' do
      expect(item).to be_valid
    end

    it 'should be valid if name is present' do
      item.name = nil
      expect(item).to be_valid
    end
  end

  describe 'associations' do
    it 'should belong to the correct user' do
      expect(item.author).to eql user
    end

    it 'should include the correct categories' do
      category = Category.create!(author: user, name: 'Naledi', icon: 'icon')
      CategoryItem.create!(category:, item:)
      expect(item.categories).to include(category)
    end
  end
end
