import 'package:flutter/material.dart';
import 'package:receita_mania/models/recipes_model.dart';

class RecipeDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recipe = ModalRoute.of(context).settings.arguments as RecipesModel;


    return Scaffold(
      appBar:  AppBar(
        title: Text(recipe.title),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Detalhes da Refeição'),
      ),
    );
  }
}
