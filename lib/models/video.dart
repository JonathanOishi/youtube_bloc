class Video {
  final String id;
  final String title;
  final String thumbnail;
  final String channelTitle;

  Video({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.channelTitle,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id']['videoId'],
      title: json['snippet']['title'],
      thumbnail: json['snippet']['thumbnails']['high']['url'],
      channelTitle: json['snippet']['channelTitle'],
    );
  }
}
