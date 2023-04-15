require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :dishes}
  end

  describe 'instance methods' do
    describe '#unique_ingredients' do
      it 'returns unique ingredients used by the chef' do
        chef = Chef.create!(name: "Gordon Ramsay")
        dish1 = chef.dishes.create!(name: "Beef Wellington", description: "A delicious classic")
        dish2 = chef.dishes.create!(name: "Eggs Benedict", description: "A delicious breakfast")
        ingredient1 = dish1.ingredients.create!(name: "Beef tenderloin", calories: 500)
        ingredient2 = dish1.ingredients.create!(name: "Puff pastry", calories: 250)
        ingredient3 = dish2.ingredients.create!(name: "Egg yolk", calories: 50)
        ingredient4 = dish2.ingredients.create!(name: "English muffin", calories: 150)
        dish2.ingredients << ingredient1

        expect(chef.unique_ingredients).to match_array([ingredient1.name, ingredient2.name, ingredient3.name, ingredient4.name])
      end
    end
  end
end