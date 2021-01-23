import 'package:flutter/material.dart';
import 'package:receita_mania/screens/categories_screen.dart';
import 'package:receita_mania/screens/favorite_screen.dart';

class TabBottomScreen extends StatefulWidget {
  @override
  _TabBottomScreenState createState() => _TabBottomScreenState();
}

class _TabBottomScreenState extends State<TabBottomScreen> {

  int _selectedScreenIndex = 0;
  final List<Widget> _screens = [
    CategoriesScreen(),
    FavoriteScreen()
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
        title: Text('Vamos Cozinhar?'),
        centerTitle: true,
      ),
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
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
