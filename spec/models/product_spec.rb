require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "should pass if all fields are present" do
      cat1 = Category.create! name: 'Apparel'
      product = Product.create(
        name: "Pokemon",
        description: 'toy',
        price: 12.99,
        quantity: 2,
        category: cat1
        )
      product.save!
      expect(product).to be_valid
    end

    it "should fail if name is not present" do
      cat1 = Category.create name: 'Apparel'
      product = Product.create(
        name: "",
        description: 'toy',
        price: 12.99,
        quantity: 2,
        category: cat1
        )
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it "it should fail if price is not present" do
    cat1 = Category.create name: 'Apparel'
      product = Product.create(
        name: "Pokemon",
        description: 'toy',
        price: nil,
        quantity: 2,
        category: cat1
        )
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it "it should fail if quantity is not present" do
      cat1 = Category.create name: 'Apparel'
      product = Product.create(
        name: "Pokemon",
        description: 'toy',
        price: 12.99,
        quantity: nil,
        category: cat1
        )
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end



    it "it should fail if category is not present" do
      cat1 = Category.create name: 'Apparel'
      product = Product.create(
        name: "Pokemon",
        description: 'toy',
        price: 12.99,
        quantity: 2,
        category: nil
        )
      expect(product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
