require 'rails_helper'

RSpec.describe Product, type: :model do
  before :each do
    @product = Product.new(
      name: 'Item',
      price: 1,
      quantity: 1
    )
  end
  describe 'Validations' do
    # validation tests/examples here
    it "is not valid without a name" do
      @product.name = nil
      expect(@product).to_not be_valid
    end
    it "is not valid without a price" do
      @product.price = nil
      expect(@product).to_not be_valid
    end
    it "is not valid without a quantity" do
      @product.quantity = nil
      expect(@product).to_not be_valid
    end
    it "is not valid without a category" do
      @product.category = nil
      expect(@product).to_not be_valid
    end
  end
end