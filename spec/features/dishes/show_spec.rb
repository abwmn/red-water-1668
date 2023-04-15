require 'rails_helper'

RSpec.describe "Dish show page", type: :feature do
  before(:each) do 
    @chef = Chef.create!(name: "Gordon Ramsay")
    @dish = @chef.dishes.create!(name: "Beef Wellington", description: "A delicious classic")
    @ingredient1 = @dish.ingredients.create!(name: "Beef tenderloin", calories: 500)
    @ingredient2 = @dish.ingredients.create!(name: "Puff pastry", calories: 250)
    @ingredient3 = @dish.ingredients.create!(name: "Egg yolk", calories: 50)
    @ingredient4 = Ingredient.create!(name: "Egg white", calories: 20)
  end

  it "displays the dish's name, description, ingredients, total calorie count, and chef's name" do
    visit dish_path(@dish)

    expect(page).to have_content(@dish.name)
    expect(page).to have_content(@dish.description)
    
    within(".ingredients") do
      expect(page).to have_content(@ingredient1.name)
      expect(page).to have_content(@ingredient2.name)
      expect(page).to have_content(@ingredient3.name)
    end
    
    expect(page).to have_content("Total calories: #{@dish.total_calories}")
    expect(page).to have_content("Chef: #{@chef.name}")
  end

  it 'adds an existing ingredient' do
    visit dish_path(@dish)

    expect(page).not_to have_content(@ingredient4.name)

    within("#add-ing-form") do
      fill_in "ingredient_id", with: @ingredient4.id
      click_button "Submit"
    end

    expect(current_path).to eq(dish_path(@dish))
    expect(page).to have_content(@ingredient4.name)
  end
end
