class ArticleModel {
  final String storyId;
  final String title;
  final String link;
  final String snippet;
  final String photoUrl;
  final String thumbnailUrl;
  final String publishedDatetimeUtc;
  final List<String> authors;
  final String sourceUrl;
  final String? sourceLogoUrl;
  final String sourceName;
  final String? sourceFaviconUrl;

  ArticleModel({
    required this.storyId,
    required this.title,
    required this.link,
    required this.snippet,
    required this.photoUrl,
    required this.thumbnailUrl,
    required this.publishedDatetimeUtc,
    required this.authors,
    required this.sourceUrl,
    required this.sourceName,
    required this.sourceLogoUrl,
    required this.sourceFaviconUrl,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      storyId: json['story_id'] ?? '',

      title: json['title'] ?? '',

      link: json['link'] ?? '',

      snippet: json['snippet'] ?? '',

      photoUrl: json['photo_url'] ?? '',

      thumbnailUrl: json['thumbnail_url'] ?? '',

      publishedDatetimeUtc: json['published_datetime_utc'] ?? '',

      authors: List<String>.from(json['authors'] ?? []),

      sourceUrl: json['source_url'] ?? '',

      sourceName: json['source_name'] ?? '',

      sourceLogoUrl: json['source_logo_url'],

      sourceFaviconUrl: json['source_favicon_url'],
    );
  }
}
