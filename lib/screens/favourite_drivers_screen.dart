import 'package:flutter/material.dart';
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Drivers')),
      body: const Center(child: Text('Favorite drivers list will be shown here.')),
    );
  }
}