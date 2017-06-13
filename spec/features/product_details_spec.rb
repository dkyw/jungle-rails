require 'rails_helper'

RSpec.feature "Visitor navigates navigate from the home page to the product detail page by clicking on a product.", type: :feature, js: true do

  # SETUP
  before :each do
  @category = Category.create! name: 'Apparel'
    @category.products.create!(
      name: 'Cool Shirt',
      description: 'A really cool shirt.',
      image: open_asset('apparel1.jpg'),
      quantity: 3,
      price: 12.99
    )
  end

  scenario "They see all products" do
    # ACT
    visit root_path

    first('article.product').find_link('Details').click

    sleep 2
    expect(page).to have_content 'Reviews'
    save_screenshot "products.png"
  end
end

