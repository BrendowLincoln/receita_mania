import 'package:flutter/material.dart';
import 'package:receita_mania/screens/categories_screen.dart';
import 'package:receita_mania/screens/favorite_screen.dart';

class TabsTopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Vamos Cozinhar?'),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.category),
                  text: 'Categorias'
                ),
                Tab(
                    icon: Icon(Icons.star),
                    text: 'Favoritos'
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              CategoriesScreen(),
              FavoriteScreen()
            ],
          ),
        ),
    );
  }
}
