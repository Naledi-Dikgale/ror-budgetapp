# spec/controllers/category_controllers_spec.rb
require 'rails_helper'
RSpec.describe 'Categories', type: :system do
  include Devise::Test::IntegrationHelpers
  before(:each) do
    @user = User.create(
      name: 'Naledi',
      email: 'naledi@test.com',
      password: 'password'
    )
    @category = Category.create(
      author_id: @user.id,
      name: 'Naledi',
      icon: 'icon'
    )
    sign_in @user
  end
  describe 'Category Index' do
    before(:each) do
      visit categories_path
    end
    it 'should display the category name' do
      expect(page).to have_content(@category.name)
    end
    it 'should display the category icon' do
      expect(page).to have_css('i')
    end
    it 'should display the total amount for each category' do
      expect(page).to have_content(@category.total_amount)
    end
  end
  describe 'Category Show' do
    before(:each) do
      visit category_path(@category)
    end
    it 'should navigate to the "Add transaction" page when clicking on "Add transaction"' do
      expect(page).to have_link('ADD TRANSACTION', href: new_category_item_path(@category))
    end
  end
end
