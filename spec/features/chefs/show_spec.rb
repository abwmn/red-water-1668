require 'rails_helper'

RSpec.describe "Chef show page" do
  before(:each) do
    @chef = Chef.create!(name: "Gordon Ramsay")
    @dish1 = @chef.dishes.create!(name: "Beef Wellington", description: "A delicious classic")
    @dish2 = @chef.dishes.create!(name: "Scrambled Eggs", description: "A simple dish")
    
    @ingredient1 = @dish1.ingredients.create!(name: "Beef tenderloin", calories: 500)
    @ingredient2 = @dish1.ingredients.create!(name: "Puff pastry", calories: 250)
    @ingredient3 = @dish1.ingredients.create!(name: "Egg yolk", calories: 50)
    
    @ingredient4 = @dish2.ingredients.create!(name: "Egg yolk", calories: 50)
    @ingredient5 = @dish2.ingredients.create!(name: "Butter", calories: 200)
  end

  it "links to ingredients index where I see a list of unique ingredients used by the chef" do
    visit chef_path(@chef)

    click_link "View All #{@chef.name}'s Ingredients"

    expect(current_path).to eq(chef_ingredients_path(@chef))
    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to have_content(@ingredient3.name)
    expect(page).to have_content(@ingredient5.name)
    expect(page).to have_content(@ingredient4.name)
    expect(page).to_not have_content(@ingredient4.name, count: 2)
  end
end