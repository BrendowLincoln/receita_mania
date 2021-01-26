import 'package:flutter/material.dart';
import 'package:receita_mania/models/recipes_model.dart';
import 'package:receita_mania/widgets/recipe_widget.dart';

class FavoriteScreen extends StatelessWidget {

  final List<RecipesModel> favoriteRecipes;

  const FavoriteScreen({this.favoriteRecipes});

  @override
  Widget build(BuildContext context) {

    if(favoriteRecipes.isEmpty) {
      return Center(
        child: Text('Nenhuma refeição marcada como favorita'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteRecipes.length,
        itemBuilder: (context, index) {
          return RecipeWidget(recipe: favoriteRecipes[index],);
        },
      );
    }


  }
}
