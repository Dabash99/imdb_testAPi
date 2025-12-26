class Movie {
  final int rank;
  final String title;
  final String description;
  final String image;
  final String bigImage;
  final List<String> genre;
  final String thumbnail;
  final String rating;
  final String id;
  final int year;
  final String imdbid;
  final String imdbLink;

  Movie({
    required this.rank,
    required this.title,
    required this.description,
    required this.image,
    required this.bigImage,
    required this.genre,
    required this.thumbnail,
    required this.rating,
    required this.id,
    required this.year,
    required this.imdbid,
    required this.imdbLink,
  });

  // Factory constructor for creating a Movie instance from a map
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      rank: json['rank'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      bigImage: json['big_image'] ?? '',
      genre: (json['genre'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      thumbnail: json['thumbnail'] ?? '',
      rating: json['rating'] ?? '0.0',
      id: json['id'] ?? '',
      year: json['year'] ?? 0,
      imdbid: json['imdbid'] ?? '',
      imdbLink: json['imdb_link'] ?? '',
    );
  }

  // Method to convert Movie instance to a map (Optional, useful for debugging)
  Map<String, dynamic> toJson() {
    return {
      'rank': rank,
      'title': title,
      'description': description,
      'image': image,
      'big_image': bigImage,
      'genre': genre,
      'thumbnail': thumbnail,
      'rating': rating,
      'id': id,
      'year': year,
      'imdbid': imdbid,
      'imdb_link': imdbLink,
    };
  }
}