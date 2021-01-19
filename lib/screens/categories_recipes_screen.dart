import 'package:flutter/material.dart';
import 'package:receita_mania/data/dummy_data.dart';
import 'package:receita_mania/models/category_model.dart';

class CategoriesRecipesScreen extends StatelessWidget {

  final CategoryModel category;

  const CategoriesRecipesScreen({this.category});

  @override
  Widget build(BuildContext context) {
    final CategoryModel category = ModalRoute.of(context).settings.arguments as CategoryModel;

    final categoryRecipes = DUMMY_RECIPES.where((recipe) {
      return recipe.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar:  AppBar(
        title: Text('Receitas'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoryRecipes.length,
          itemBuilder: (context, index) {
            return Text(categoryRecipes[index].title);
          },
        ),
      ),
    );
  }
}
