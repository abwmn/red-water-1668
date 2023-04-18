require 'rails_helper'

RSpec.describe "Ingredient Index", type: :feature do
  describe 'ingredients index' do
    it 'displays all ingredients' do
      @ingredient1 = Ingredient.create!(name: "Beef tenderloin", calories: 500)
      @ingredient2 = Ingredient.create!(name: "Puff pastry", calories: 250)
      @ingredient3 = Ingredient.create!(name: "Egg yolk", calories: 50)
      
      @ingredient4 = Ingredient.create!(name: "Egg yolk", calories: 50)
      @ingredient5 = Ingredient.create!(name: "Butter", calories: 200)
      
      visit ingredients_path
      
      Ingredient.all.each do |ing|
        expect(page).to have_content(ing.name)
      end
    end
  end
end

