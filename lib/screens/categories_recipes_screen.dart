import 'package:flutter/material.dart';
import 'package:receita_mania/models/category_model.dart';

class CategoriesRecipesScreen extends StatelessWidget {

  final CategoryModel category;

  const CategoriesRecipesScreen({this.category});

  @override
  Widget build(BuildContext context) {
    final CategoryModel category = ModalRoute.of(context).settings.arguments as CategoryModel;

    return Scaffold(
      appBar:  AppBar(
        title: Text('Receitas'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Receitas por categorias ${category.id}'),
      ),
    );
  }
}
