class IngredientsController < ApplicationController
  def index
    @chef = Chef.find(params[:chef_id])
    @ingredients = @chef.unique_ingredients
    render 'chefs/ingredients/index'
  end

  def create
    dish = Dish.find(params[:dish_id])
    ingredient = Ingredient.find(params[:ingredient_id])

    dish.add_ingredient(ingredient)

    redirect_to dish_path(dish)
  end
end