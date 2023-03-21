# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

RecipeFood.destroy_all
Food.destroy_all
Recipe.destroy_all
User.destroy_all

# Creating 2 users
jorge = User.create(name: 'jorge')
fuad = User.create(name: 'fuad')

# Creating 4 foods for jorge
olive_oil = Food.create(name: 'Olive Oil', measurement_unit: 'l', price: '200$', quantity: 5, user: jorge)
tomatoes = Food.create(name: 'Tomatoes', measurement_unit: 'Kg', price: '30$', quantity: 4, user: jorge)
chicken_breast = Food.create(name: 'Chicken Breast', measurement_unit: 'Kg', price: '49.99$', quantity: 3, user: jorge)
onion = Food.create(name: 'Onion', measurement_unit: 'Kg', price: '5.78$', quantity: 2, user: jorge)

# Creating 4 foods for fuad
sugar = Food.create(name: 'Sugar', measurement_unit: 'g', price: '3.65$', quantity: 300, user: fuad)
mayonnaise = Food.create(name: 'Mayonnaise', measurement_unit: 'l', price: '10.99$', quantity: 2, user: fuad)
rice = Food.create(name: 'Rice', measurement_unit: 'Kg', price: '22.49$', quantity: 5, user: fuad)
sauce = Food.create(name: 'Sauce', measurement_unit: 'l', price: '2.19$', quantity: 1, user: fuad)


# Creating 2 recipes
description_of_grilled_chicken = " Wash hands with soap and water.
After washing basil and tomatoes, blot them dry with clean paper towel.
Using a clean cutting board, cut tomatoes into quarters.
For marinade, place first six ingredients in a blender. Cover and process until well blended.
Place chicken breasts in a shallow dish; orange quote icon do not rinse raw poultry. Cover with marinade. Cover dish. Refrigerate about 1 hour, turning occasionally. orange quote icon Wash dish after touching raw poultry.
orange quote icon Wash hands with soap and water after handling uncooked chicken.
Place chicken on an oiled grill rack over medium heat. orange quote icon Do not reuse marinades used on raw foods. Grill chicken 4-6 minutes per side. orange quote icon Cook until internal temperature reaches 165 °F as measured with a food thermometer."

grilled_basil_chicken_by_wassim = Recipe.create(name: 'Grilled Basil Chicken', preparation_time: '10 min', cooking_time: '45 min', description: description_of_grilled_chicken, public: true, user: jorge)

description_of_miso_marinated_short_ribs = "Wash hands with soap and water. In small bowl, stir together miso, mayonnaise, and 2 tbsp vinegar. Place ribs on a rimmed baking sheet and season lightly with salt; orange quote icon do not rinse raw meat. Pour all but 2 tablespoons miso mixture over ribs; turn to coat. Set remaining miso mixture aside.
Thinly slice radishes and toss in a medium bowl with remaining 1 tbsp vinegar. Season with salt and toss again.
Heat a large heavy skillet, preferably cast iron, over medium-high. When pan is hot, add 2 tsp. oil and swirl to coat. Remove ribs from marinade;  orange quote icon do not reuse marinade used on raw meat.
Wash hands with soap and water after handling uncooked meat. Add half of ribs to pan and cook without turning until underside is very dark brown and charred in spots, about 2 minutes."

miso_marinated_short_ribs_by_fuad = Recipe.create(name: 'Miso Marinated Short Ribs', preparation_time: '25 min', cooking_time: '20 min', description: description_of_miso_marinated_short_ribs, public: false, user: fuad)

# Creating Recipe Foods
# Grilled basil chicken has 3 foods
grilled_basil_chicken_food1 = RecipeFood.create(quantity: 2, recipe: grilled_basil_chicken_by_wassim, food: olive_oil)
grilled_basil_chicken_food2 = RecipeFood.create(quantity: 5, recipe: grilled_basil_chicken_by_wassim, food: chicken_breast)
grilled_basil_chicken_food3 = RecipeFood.create(quantity: 1, recipe: grilled_basil_chicken_by_wassim, food: onion)

# Miso_marinated_short_ribs has 2 foods
miso_marinated_short_ribs_food1 = RecipeFood.create(quantity: 4, recipe: miso_marinated_short_ribs_by_fuad, food: rice)
miso_marinated_short_ribs_food2 = RecipeFood.create(quantity: 1, recipe: miso_marinated_short_ribs_by_fuad, food: sauce)

