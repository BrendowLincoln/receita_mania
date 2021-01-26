import 'package:flutter/material.dart';
import 'package:receita_mania/data/dummy_data.dart';
import 'package:receita_mania/models/recipes_model.dart';
import 'package:receita_mania/screens/categories_recipes_screen.dart';
import 'package:receita_mania/screens/settings_screen.dart';
import 'package:receita_mania/screens/tab_bottom_screen.dart';
import 'package:receita_mania/utils/app_routes.dart';
import 'package:receita_mania/screens/recipe_detail_screen.dart';
import 'package:receita_mania/widgets/recipe_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  List<RecipesModel> _availableRecipe = DUMMY_RECIPES;

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
          )
        )
      ),
      initialRoute: '/',
      routes: {
       AppRoutes.HOME: (context) => TabBottomScreen(),
        AppRoutes.CATEGORIES_RECIPES: (context) => CategoriesRecipesScreen(recipes: _availableRecipe,),
        AppRoutes.RECIPE_DETAIL: (context) => RecipeDetailScreen(),
        AppRoutes.SETTINGS: (context) => SettingsScreen(),
      },
    );
  }
}