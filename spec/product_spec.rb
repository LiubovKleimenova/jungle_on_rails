require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'checks if there is no name for new records' do
      @category = Category.new
      @product = Product.new
      expect(@product.name).to be_nil
    end
  
    it 'ensures that a product with all four fields set will indeed save successfully' do
      @category = Category.create(name: 'Apparel')
      @product = Product.create(name: 'backpack', category: @category, quantity: 1, price: 200)
      @product.save!
      expect(@product).to be_valid
    end

    it 'ensures that it throws an error Name cant be blank without a name' do
      @category = Category.create(name: 'Apparel')
      @product = Product.create(name: nil, category: @category, quantity: 1, price: 200)
      expect(@product.errors.full_messages[0]).to eq "Name can't be blank"
    end

    it 'ensures that it throws an error Quantity cant be blank without a quantity' do
      @category = Category.create(name: 'Apparel')
      @product = Product.create(name: 'backpack', category: @category, quantity: nil, price: 200)
      expect(@product.errors.full_messages[0]).to eq "Quantity can't be blank"
    end

    it 'ensures that it throws an error Category cant be blank without a category' do
      #@category = Category.create(name: 'Apparel')
      @product = Product.create(name: 'backpack', category: nil, quantity: 2, price: 200)
      expect(@product.errors.full_messages[0]).to eq "Category can't be blank"
    end

    it 'ensures that it throws an error Price is not a number if it is not' do
      @category = Category.create(name: 'Apparel')
      @product = Product.create(name: 'backpack', category: @category, quantity: 2, price: nil)
      expect(@product.errors.full_messages[0]).to eq "Price cents is not a number"
    end


  end
end
