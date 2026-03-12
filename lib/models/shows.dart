class TvShows {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final double rating;
  final String firstAirDate;

  TvShows({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.rating,
    required this.firstAirDate,
  });

  factory TvShows.fromJSON(Map<String, dynamic> json) {
    return TvShows(
      id: json['id'] ?? 0,
      title: json['name'] ?? json['title'] ?? 'Unknown title',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] != null
          ? (json['poster_path'].toString().startsWith('http')
                ? json['poster_path']
                : 'https://image.tmdb.org/t/p/w500${json['poster_path']}')
          : 'https://via.placeholder.com/500x750?text=No+Image',
      rating: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      firstAirDate: json['first_air_date'] ?? '',
    );
  }
}
