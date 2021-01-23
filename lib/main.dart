import 'package:flutter/material.dart';
import 'package:receita_mania/screens/categories_recipes_screen.dart';
import 'package:receita_mania/screens/settings_screen.dart';
import 'package:receita_mania/screens/tab_bottom_screen.dart';
import 'package:receita_mania/utils/app_routes.dart';
import 'package:receita_mania/screens/recipe_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        AppRoutes.CATEGORIES_RECIPES: (context) => CategoriesRecipesScreen(),
        AppRoutes.RECIPE_DETAIL: (context) => RecipeDetailScreen(),
        AppRoutes.SETTINGS: (context) => SettingsScreen(),
      },
    );
  }
}