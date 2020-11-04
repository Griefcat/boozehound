class Cocktail < ApplicationRecord
    has_many :cocktail_ingredients
    has_many :ingredients, through: :cocktail_ingredients
    # validates :name, presence: true, uniqueness: true
    # validates :alcohol_percentage, presence: true 
    # #validate :ingredients_invalid 
    # validates :ingredients, presence: {message: "can't be empty"}
    # validate :alcohol_percentage_valid 


    def alcohol_percentage_valid
        if self.alcohol_percentage && (self.alcohol_percentage > 100 || self.alcohol_percentage < 0 )
            self.errors.add(:alcohol_percentage, "needs to be between 0 and 100")
        end
    end 


    # def ingredients_invalid
    #     if self.ingredient_ids.empty?
    #         self.errors.add(:ingredients, message: "Must have ingredients")
    #     end 
    # end 

end 
