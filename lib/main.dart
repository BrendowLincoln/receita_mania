import 'package:flutter/material.dart';
import 'package:receita_mania/data/dummy_data.dart';
import 'package:receita_mania/models/recipes_model.dart';
import 'package:receita_mania/models/settings_model.dart';
import 'package:receita_mania/screens/categories_recipes_screen.dart';
import 'package:receita_mania/screens/settings_screen.dart';
import 'package:receita_mania/screens/tab_bottom_screen.dart';
import 'package:receita_mania/utils/app_routes.dart';
import 'package:receita_mania/screens/recipe_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SettingsModel settings = SettingsModel();
  List<RecipesModel> _availableRecipe = DUMMY_RECIPES;
  List<RecipesModel> _favoriteRecipes = [];

  void _filterRecipes(SettingsModel settings) {
    this.settings = settings;
    setState(() {
      _availableRecipe = DUMMY_RECIPES.where((recipe) {
        final filterGluten = settings.isGlutenFree && !recipe.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !recipe.isLactoseFree;
        final filterVegan = settings.isVegan && !recipe.isVegan;
        final filterVegetarian = settings.isVegetariam && !recipe.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(RecipesModel recipe) {
    setState(() {
      _favoriteRecipes.contains(recipe)
          ? _favoriteRecipes.remove(recipe)
          : _favoriteRecipes.add(recipe);
    });
  }

  bool _isFavorite(RecipesModel recipe) {
    return _favoriteRecipes.contains(recipe);
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Receita Mania',
      theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.amberAccent,
          canvasColor: Color.fromRGBO(255, 254, 200, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ))),
      initialRoute: '/',
      routes: {
        AppRoutes.HOME: (context) =>
            TabBottomScreen(favoriteRecipes: _favoriteRecipes),
        AppRoutes.CATEGORIES_RECIPES: (context) => CategoriesRecipesScreen(
              recipes: _availableRecipe,
            ),
        AppRoutes.RECIPE_DETAIL: (context) => RecipeDetailScreen(isFavorite: _isFavorite,onToggleFavorite: _toggleFavorite),
        AppRoutes.SETTINGS: (context) => SettingsScreen(
              settings: settings,
              onSettingsChanged: _filterRecipes,
            ),
      },
    );
  }
}
