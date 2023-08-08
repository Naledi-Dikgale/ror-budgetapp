require 'rails_helper'

RSpec.describe 'Items', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create!(name: 'Naledi', email: 'naledi@test.com', password: 'password') }
  let(:category) { Category.create!(name: 'Journey', icon: 'icon', author: user) }

  let(:valid_params) { { name: 'Kota', amount: 5 } }
  let(:invalid_params) { { name: nil, amount: 5 } }

  before do
    sign_in user
  end

  describe 'GET /new' do
    it 'should return a 200 OK status' do
      get new_category_item_path(category)
      expect(response).to have_http_status(:ok)
    end

    it 'should render items/new template' do
      get new_category_item_path(category)
      expect(response).to render_template(:new)
    end

    it 'should assign @category and @item' do
      get new_category_item_path(category)
      expect(assigns(:category)).to eq(category)
      expect(assigns(:item)).to be_a_new(Item)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'should create a new Item' do
        expect do
          post category_items_path(category), params: { item: valid_params }
        end.to change(Item, :count).by(1)
      end

      it 'should Item with the Category' do
        post category_items_path(category), params: { item: valid_params }
        expect(category.items).to include(assigns(:item))
      end

      it 'should redirect to category/show page' do
        post category_items_path(category), params: { item: valid_params }
        expect(response).to redirect_to(category_path(category))
      end
    end
  end
end
