import 'package:flutter/material.dart';
import 'package:receita_mania/screens/categories_screen.dart';
import 'package:receita_mania/screens/favorite_screen.dart';
import 'package:receita_mania/widgets/main_drawer.dart';

class TabBottomScreen extends StatefulWidget {
  @override
  _TabBottomScreenState createState() => _TabBottomScreenState();
}

class _TabBottomScreenState extends State<TabBottomScreen> {

  int _selectedScreenIndex = 0;
  final List<Map<String, Object>> _screens = [
    {'title': 'Lista de Categorias', 'screen':  CategoriesScreen()},
    {'title': 'Minhas Receitas Favoritas', 'screen':  FavoriteScreen()}
  ];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title']),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedScreenIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
            label: "Categorias"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Favoritos"
          )
        ],
      ),
    );
  }
}
