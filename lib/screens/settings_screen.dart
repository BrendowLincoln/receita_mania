import 'package:flutter/material.dart';
import 'package:receita_mania/widgets/main_drawer.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configurações'), centerTitle: true,),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Settings Screen'),
      ),
    );
  }
}
