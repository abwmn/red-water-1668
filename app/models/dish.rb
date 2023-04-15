class Dish < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :dishes_ingredients
  has_many :ingredients, through: :dishes_ingredients

  def total_calories
    ingredients.sum(:calories)
  end

  def add_ingredient(ing)
    ingredients << ing
  end
end