require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'checks if there is no name for new records' do
      @category = Category.new
      @product = Product.new
      expect(@product.name).to be_nil
    end
  
    it 'checks if there is a name' do
      @category = Category.create(name: 'Apparel')
      @category.save!
      @product = Product.create(name: 'backpack', category: @category, quantity: 1, price: 200)
      @product.save!
      expect(@product).to be_valid
    end
  end
end
