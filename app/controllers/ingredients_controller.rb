class IngredientsController < ApplicationController
before_action :set_ingredients, only: [:show]

def index 
        @ingredients = Ingredient.all 
    if  params[:sort] != nil 
        @ingredients = Ingredient.where(ingredient_type: params[:sort]) 
    end 
end 

def show 

end 


def set_ingredients
    @ingredient = Ingredient.find(params[:id])
end 












end
