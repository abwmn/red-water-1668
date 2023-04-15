require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dishes_ingredients}
    it {should have_many :ingredients}
  end

  describe 'instance methods' do
    describe '#total_calories' do
      it 'returns the total calories of a dish' do
        chef = Chef.create!(name: "Gordon Ramsay")
        dish = chef.dishes.create!(name: "Beef Wellington", description: "A delicious classic")
        ingredient1 = dish.ingredients.create!(name: "Beef tenderloin", calories: 500)
        ingredient2 = dish.ingredients.create!(name: "Puff pastry", calories: 250)
        ingredient3 = dish.ingredients.create!(name: "Egg yolk", calories: 50)

        expect(dish.total_calories).to eq(800)
      end
    end

    describe '#add_ingredient' do
      it 'adds an ingredient to a dish' do
        chef = Chef.create!(name: "Gordon Ramsay")
        dish = chef.dishes.create!(name: "Beef Wellington", description: "A delicious classic")
        ingredient1 = Ingredient.create!(name: "Beef tenderloin", calories: 500)

        expect(dish.ingredients.count).to eq(0)

        dish.add_ingredient(ingredient1)

        expect(dish.ingredients.count).to eq(1)
        expect(dish.ingredients.first).to eq(ingredient1)
      end
    end
  end
end