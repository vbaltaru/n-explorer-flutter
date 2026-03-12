import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/shows.dart';
import '../widgets/section_heades.dart';
import '../widgets/show_cards.dart';
import 'category_screen.dart'; // Importăm ecranul de categorii

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. HERO SECTION (Imaginea mare de sus - ex: Wednesday)
            _buildHeroSection(),

            const SizedBox(height: 20),

            // 2. SECȚIUNEA TRENDING
            _buildCategorySection(
              "Trending Now",
              _apiService.fetchTrendingShows(),
            ),

            // 3. SECȚIUNEA TOP RATED
            _buildCategorySection(
              "Top Rated",
              _apiService.fetchTopRatedShows(),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection(String title, Future<List<TvShows>> future) {
    return FutureBuilder<List<TvShows>>(
      future: future,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox(height: 200);
        final shows = snapshot.data!;

        return Column(
          children: [
            SectionHeader(
              title: title,
              onSeeAllTap: () {
                // NAVIGAȚIA PENTRU "SEE ALL"
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CategoryScreen(title: title, shows: shows),
                  ),
                );
              },
            ),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20),
                itemCount: shows.length,
                itemBuilder: (context, index) => ShowCards(show: shows[index]),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildHeroSection() {
    return Stack(
      children: [
        Container(
          height: 500,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://image.tmdb.org/t/p/original/wwemzKWzjKYJFfCeiB57q3r4Bcm.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 500,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.8),
                Colors.black,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
