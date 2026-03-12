import 'package:flutter/material.dart';
import '../models/shows.dart';
import '../widgets/show_cards.dart';

class CategoryScreen extends StatelessWidget {
  final String title;
  final List<TvShows> shows;

  const CategoryScreen({super.key, required this.title, required this.shows});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, title: Text(title)),
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, 
          childAspectRatio: 0.5, 
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ),
        itemCount: shows.length,
        itemBuilder: (context, index) => ShowCards(show: shows[index]),
      ),
    );
  }
}