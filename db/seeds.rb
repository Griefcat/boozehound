# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cocktail.destroy_all
Ingredient.destroy_all
CocktailIngredient.destroy_all

20.times do 
    cocktail_info = RestClient.get'https://www.thecocktaildb.com/api/json/v1/1/random.php'
    cocktail_info_parsed = JSON.parse(cocktail_info)

    cocktail = Cocktail.find_or_create_by(name: HTMLEntities.new.decode(cocktail_info_parsed["drinks"][0]["strDrink"]))
            cocktail.alcohol_percentage = rand(15..50)
            if cocktail_info_parsed["drinks"][0]["strAlcoholic"] = "Alcoholic"
                cocktail.contains_alcohol = true
            else 
                cocktail.contains_alcohol= false
            end 
        cocktail.save 

    index = 1
    while cocktail_info_parsed["drinks"][0]["strIngredient#{index}"] != nil 
        new_ingredient = Ingredient.find_or_create_by(name: HTMLEntities.new.decode(cocktail_info_parsed["drinks"][0]["strIngredient#{index}"]))
        CocktailIngredient.create(cocktail_id: cocktail.id, ingredient_id: new_ingredient.id)
        ingredient_info = RestClient.get'https://www.thecocktaildb.com/api/json/v1/1/search.php?i='+new_ingredient.name.downcase
        parsed_ingredient_info = JSON.parse(ingredient_info)
        new_ingredient.ingredient_type = HTMLEntities.new.decode(parsed_ingredient_info["ingredients"][0]["strType"])
        if new_ingredient.ingredient_type == "" 
            new_ingredient.ingredient_type = "general"
        end 
        new_ingredient.save
        index +=1
    end 
end 