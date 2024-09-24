import 'package:flutter/material.dart';
import 'details_screen.dart';
import 'favorite_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, Map<String, String>> recipes = {
    'Chocolate Chip Mini Muffins': {
      'name': 'Chocolate Chip Mini Muffins',
      'ingredients':
          'cooking spray, all-purpose flour, white sugar,  baking powder, salt, egg, milk, vegetable oil, vanilla extract, chocolate chips.',
      'instructions':
          '1. Preheat the oven to 400 degrees F (200 degrees C). Lightly spray 48 miniature muffin cups.\n2.Mix flour, white sugar, brown sugar, baking powder, and salt together in a large bowl.\n3.Lightly beat egg in a separate bowl; stir in milk, vegetable oil, and vanilla extract. Mix egg mixture into flour mixture until incorporated. Fold in mini chocolate chips.\n4. Spoon batter into the prepared muffin cups, filling each 3/4 full.\n5. Bake in the preheated oven until tops spring back when lightly pressed, about 10 minutes. Cool briefly in the tin before transferring muffins to a wire rack to cool completely.',
    },
    'Cream Puffs': {
      'name': 'Cream Puffs',
      'ingredients':
          'vanilla pudding mix, heavy cream, milk, butter, water, salt,all-purpose flour, eggs',
      'instructions':
          '1. Mix together vanilla instant pudding mix, cream and milk. Cover and refrigerate to set.\n2. Preheat oven to 425 degrees F (220 degrees C).\n3. In a large pot, bring water and butter to a rolling boil.\n4. Stir in flour and salt until the mixture forms a ball.\n5. Transfer the dough to a large mixing bowl. Using a wooden spoon or stand mixer, beat in the eggs one at a time, mixing well after each.\n6. Drop by tablespoonfuls onto an ungreased baking sheet, spacing them a couple of inches apart.\n7. Bake for 20 to 25 minutes in the preheated oven, until golden brown. Centers should be dry.\n8. When the shells are cool, either split and fill them with the pudding mixture, or use a pastry bag to pipe the pudding into the shells.\n9. Enjoy!!! ',
    },
    'Potato Fry': {
      'name': 'Potato Fry',
      'ingredients':
          "3 medium-sized potatoes (peeled and sliced), tablespoon oil, teaspoon mustard seeds, teaspoon cumin seeds, 1/2 teaspoon turmeric powder, 1 teaspoon red chili powder, Salt to taste",
      'instructions':
          "1. Heat Oil & Tempering: Heat oil in a pan. Add mustard seeds and cumin seeds, and let them crackle.\n2.Add the sliced potatoes to the pan. Stir well to coat them with the oil and spices.\n3.Sprinkle turmeric powder, red chili powder, and salt. Mix thoroughly so the potatoes are evenly coated.\n4. Cover the pan and cook on medium heat, stirring occasionally, until the potatoes are golden brown and crispy (about 15-20 minutes)."
    },
    'Chicken Curry': {
      'name': 'Chicken Curry',
      'ingredients': 'Chicken, Curry Paste, Coconut Milk, Potatoes, Carrots',
      'instructions':
          '1. Sauté curry paste with onions.\n2. Add chicken and brown.\n3. Add coconut milk, potatoes, and carrots.\n4. Simmer until cooked.',
    },
    'Breakfast Sliders': {
      'name': 'Breakfast Sliders',
      'ingredients':
          "Hawaiian rolls, medium eggs, milk, butter, black pepper, chives",
      'instructions':
          "1. Preheat the oven to 375 degrees F (190 degrees C). Place rolls into a 9x13-inch baking dish. Press a hole into the center of each roll and use fingers or a small spoon to press the bread in and around to create a large well.\n2. Place a half slice of ham into the form of each roll. Crack an egg into each and sprinkle evenly with salt.\n3. Bake in the preheated oven until the whites are set and the yolks are still runny, about 20 minutes, rotating the pan halfway through baking time.\n4. Meanwhile, prepare Hollandaise with milk and butter according to package directions.\n5. Carefully cut rolls into 12 servings and serve topped with 2 tablespoons Hollandaise sauce and a sprinkle of pepper and chives."
    }
  };

  List<Map<String, String>> favoriteRecipes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Recipe List'),
        ),
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Color.fromARGB(255, 29, 221, 163)],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    final key = recipes.keys.elementAt(index);
                    return ListTile(
                      title: Text(recipes[key]!['name']!),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              recipe: recipes[key]!,
                              isFavorite:
                                  favoriteRecipes.contains(recipes[key]),
                              onFavoriteToggle: (isFavorite) {
                                setState(() {
                                  if (isFavorite) {
                                    favoriteRecipes.add(recipes[key]!);
                                  } else {
                                    favoriteRecipes.remove(recipes[key]);
                                  }
                                });
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            FavoritesScreen(favoriteRecipes: favoriteRecipes),
                      ),
                    );
                  },
                  child: const Text('View Favorites'),
                ),
              ),
            ],
          ),
        ));
  }
}
