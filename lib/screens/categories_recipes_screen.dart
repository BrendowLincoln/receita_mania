import 'package:flutter/material.dart';
import 'package:receita_mania/data/dummy_data.dart';
import 'package:receita_mania/models/category_model.dart';
import 'package:receita_mania/models/recipes_model.dart';
import 'package:receita_mania/widgets/recipe_widget.dart';

class CategoriesRecipesScreen extends StatelessWidget {

  final List<RecipesModel> recipes;

  const CategoriesRecipesScreen({@required this.recipes});

  @override
  Widget build(BuildContext context) {
    final CategoryModel category = ModalRoute.of(context).settings.arguments as CategoryModel;

    final categoryRecipes = DUMMY_RECIPES.where((recipe) {
      return recipe.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar:  AppBar(
        title: Text(category.title),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoryRecipes.length,
          itemBuilder: (context, index) {
            return RecipeWidget(recipe: categoryRecipes[index]);
          },
        ),
      ),
    );
  }
}
