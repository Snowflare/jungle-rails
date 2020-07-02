require 'rails_helper'
RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'should pass validation with required inputs' do
      @category = Category.new(name: "Men")
      @product = Product.new(name: 'Trunk', price: 500, quantity: 10, category: @category)
      @product.valid?
      expect(@product.errors).to_not include ("can't be blank")
    end
    it 'should not pass validation without price' do
      @category = Category.new(name: "Men")
      @product = Product.new(name: 'Trunk', price: nil, quantity: 10, category: @category)
      @product.valid?
      expect(@product.errors.full_messages).to include ("Price can't be blank")
    end
    it 'should not pass validation without name' do
      @category = Category.new(name: "Men")
      @product = Product.new(name: nil, price: 500, quantity: 10, category: @category)
      @product.valid?
      expect(@product.errors.full_messages).to include ("Name can't be blank")
    end
    it 'should not pass validation without quantity' do
      @category = Category.new(name: "Men")
      @product = Product.new(name: 'Trunk', price: 500, quantity: nil, category: @category)
      @product.valid?
      expect(@product.errors.full_messages).to include ("Quantity can't be blank")
    end
    it 'should not pass validation without category' do
      @product = Product.new(name: 'Trunk', price: 500, quantity: 10, category: nil)
      @product.valid?
      expect(@product.errors.full_messages).to include ("Category can't be blank")
    end
  end
end
