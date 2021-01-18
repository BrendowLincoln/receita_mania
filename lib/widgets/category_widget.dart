import 'package:flutter/material.dart';
import 'package:receita_mania/models/category_model.dart';
import 'package:receita_mania/screens/categories_recipes_screen.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel category;

  const CategoryWidget({this.category});
  
  void _selectedCategory(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => CategoriesRecipesScreen(category: category,))
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      onTap: () => _selectedCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [category.color.withOpacity(0.5), category.color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
