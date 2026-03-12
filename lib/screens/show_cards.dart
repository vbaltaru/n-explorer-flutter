import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/shows.dart';
import '../screens/detail_screen.dart'; // Importăm ecranul de detalii pentru navigație

class ShowCards extends StatelessWidget {
  final TvShows show;

  const ShowCards({super.key, required this.show});

  @override
  Widget build(BuildContext context) {
    // Învelim totul în GestureDetector pentru a detecta apăsarea (tap)
    return GestureDetector(
      onTap: () {
        // Navigăm către DetailScreen și trimitem obiectul 'show' curent
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(show: show),
          ),
        );
      },
      child: Container(
        width: 130,
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Secțiunea de imagine cu Rating Badge
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: show.posterPath,
                    height: 180,
                    width: 130,
                    fit: BoxFit.cover,
                    // Placeholder arătat în timp ce se descarcă imaginea
                    placeholder: (context, url) => Container(
                      height: 180,
                      width: 130,
                      color: Colors.grey[900],
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                    // Widget arătat dacă imaginea nu poate fi încărcată
                    errorWidget: (context, url, error) => Container(
                      height: 180,
                      width: 130,
                      color: Colors.grey[900],
                      child: const Icon(Icons.broken_image, color: Colors.grey),
                    ),
                  ),
                ),
                
                // Rating Badge (Steluța galbenă din colț)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow, size: 12),
                        const SizedBox(width: 4),
                        Text(
                          show.rating.toStringAsFixed(1),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 8),
            
            // Titlul serialului
            Text(
              show.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis, // Pune "..." dacă titlul e prea lung
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}