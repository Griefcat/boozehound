class CocktailsController < ApplicationController
before_action :set_cocktail, only: [:show, :edit, :update, :destroy]
def show
    
end 

def index
    @cocktails = Cocktail.all
end 

def new
    @cocktail = Cocktail.new
end 

def create
    @cocktail = Cocktail.new(cocktail_parameters)
    if @cocktail.save
        redirect_to cocktail_path(@cocktail.id)
    else
        render :new
    end
end 

def cocktail_parameters
    params.require(:cocktail).permit(:name, :alcohol_percentage, :contains_alcohol, :ingredient_ids => [])
end 

def edit

end 

def update
    if @cocktail.update(cocktail_parameters)
    redirect_to cocktail_path(@cocktail.id)
    else
    render :edit 
        
    end
end 

def set_cocktail
    @cocktail = Cocktail.find(params[:id])
end 

def destroy
    @cocktail.delete
    redirect_to cocktails_path 
end 












end
