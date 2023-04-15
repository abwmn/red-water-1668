require 'rails_helper'

RSpec.describe "Dish show page", type: :feature do
  it "displays the dish's name, description, ingredients, total calorie count, and chef's name" do
    chef = Chef.create!(name: "Gordon Ramsay")
    dish = chef.dishes.create!(name: "Beef Wellington", description: "A delicious classic")
    ingredient1 = dish.ingredients.create!(name: "Beef tenderloin", calories: 500)
    ingredient2 = dish.ingredients.create!(name: "Puff pastry", calories: 250)
    ingredient3 = dish.ingredients.create!(name: "Egg yolk", calories: 50)

    visit dish_path(dish)
    save_and_open_page

    expect(page).to have_content(dish.name)
    expect(page).to have_content(dish.description)
    
    within(".ingredients") do
      expect(page).to have_content(ingredient1.name)
      expect(page).to have_content(ingredient2.name)
      expect(page).to have_content(ingredient3.name)
    end
    
    expect(page).to have_content("Total calories: #{dish.total_calories}")
    expect(page).to have_content("Chef: #{chef.name}")
  end
end
