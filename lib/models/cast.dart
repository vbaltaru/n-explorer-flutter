class Cast {
  final String name;
  final String profilePath;
  final String character;

  Cast({required this.name, required this.profilePath, required this.character});

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      name: json['name'] ?? 'Unknown',
      character: json['character'] ?? '',
      
      profilePath: json['profile_path'] != null
          ? 'https://image.tmdb.org/t/p/w200${json['profile_path']}'
          : 'https://via.placeholder.com/200x200?text=No+Image',
    );
  }
}