require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'have the right error message when creating a new product without a name' do
      @category = Category.create(name: 'evergreens')
      @product = Product.create(name: nil, price: 998, quantity: 1, category: @category)
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it 'have the right error message when creating a new product without a price' do
      @category = Category.create(name: 'evergreens')
      @product = Product.create(name: 'some_plant', quantity: 1, category: @category)
      pp @product
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it 'have the right error message when creating a new product without a quantity' do
      @category = Category.create(name: 'evergreens')
      @product = Product.create(name: 'some_plant', price: 998, quantity: nil, category: @category)
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'have the right error message when creating a new product without a category' do
      @product = Product.create(name: 'some_plant', price: 998, quantity: 1, category: nil)
      expect(@product.errors.full_messages).to include('Category must exist', "Category can't be blank")
    end
  end
end
