import 'package:flutter/material.dart';
import 'package:receita_mania/models/recipes_model.dart';

class RecipeDetailScreen extends StatelessWidget {

  final Function(RecipesModel) onToggleFavorite;
  final bool Function(RecipesModel) isFavorite;

  const RecipeDetailScreen({this.onToggleFavorite, this.isFavorite});

  _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
      width: 400,
      height: 250,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color:  Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final recipe = ModalRoute.of(context).settings.arguments as RecipesModel;


    return Scaffold(
      appBar:  AppBar(
        title: Text(recipe.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(recipe.imageUrl, fit: BoxFit.cover),
            ),
            _createSectionTitle(context, 'Ingredientes'),
            _createSectionContainer(
                ListView.builder(
                  itemCount: recipe.ingredients.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10
                        ),
                        child: Text(recipe.ingredients[index]),
                      ),
                      color: Theme.of(context).accentColor,
                    );
                  },
                ),
            ),
            _createSectionTitle(context, 'Passos'),
            _createSectionContainer(
              ListView.builder(
                itemCount: recipe.steps.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: Text(recipe.steps[index]),
                      ),
                      Divider(height: 3,),
                    ],
                  );
                },
              )
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(recipe) ? Icons.star : Icons.star_border),
        onPressed: () {
          onToggleFavorite(recipe);
        },
      ),
    );
  }
}
