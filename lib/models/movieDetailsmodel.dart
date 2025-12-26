class MovieDetail {
  final int rank;
  final String title;
  final String thumbnail;
  final String rating;
  final String id;
  final int year;
  final String image;
  final String bigImage;
  final String description;
  final String trailer;
  final String trailerEmbedLink;
  final String trailerYoutubeId;
  final List<String> genre;
  final List<String> director;
  final List<String> writers;
  final String imdbid;
  final String imdbLink;

  MovieDetail({
    required this.rank,
    required this.title,
    required this.thumbnail,
    required this.rating,
    required this.id,
    required this.year,
    required this.image,
    required this.bigImage,
    required this.description,
    required this.trailer,
    required this.trailerEmbedLink,
    required this.trailerYoutubeId,
    required this.genre,
    required this.director,
    required this.writers,
    required this.imdbid,
    required this.imdbLink,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
      rank: json['rank'] ?? 0,
      title: json['title'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      rating: json['rating'] ?? '0.0',
      id: json['id'] ?? '',
      year: json['year'] ?? 0,
      image: json['image'] ?? '',
      bigImage: json['big_image'] ?? '',
      description: json['description'] ?? '',

      trailer: json['trailer'] ?? '',
      trailerEmbedLink: json['trailer_embed_link'] ?? '',
      trailerYoutubeId: json['trailer_youtube_id'] ?? '',

      genre: (json['genre'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      director: (json['director'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      writers: (json['writers'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],

      imdbid: json['imdbid'] ?? '',
      imdbLink: json['imdb_link'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rank': rank,
      'title': title,
      'thumbnail': thumbnail,
      'rating': rating,
      'id': id,
      'year': year,
      'image': image,
      'big_image': bigImage,
      'description': description,
      'trailer': trailer,
      'trailer_embed_link': trailerEmbedLink,
      'trailer_youtube_id': trailerYoutubeId,
      'genre': genre,
      'director': director,
      'writers': writers,
      'imdbid': imdbid,
      'imdb_link': imdbLink,
    };
  }
}