class Video {
  final String id;
  final String title;
  final String thumb;
  final String channel;

  Video(
      {required this.id,
      required this.title,
      required this.thumb,
      required this.channel});

  factory Video.fromJson(Map<String, dynamic> json) {
    if (json.containsKey("id")) {
      return Video(
          id: json["id"]?["videoId"] ?? "",
          title: json["snippet"]?["title"] ?? "Título não disponível",
          thumb: json["snippet"]?["thumbnails"]?["high"]?["url"] ??
              json["snippet"]?["thumbnails"]?["medium"]?["url"] ??
              json["snippet"]?["thumbnails"]?["default"]?["url"] ??
              "",
          channel: json["snippet"]?["channelTitle"] ?? "Canal não disponível");
    } else {
      return Video(
          id: json["videoId"] ?? "",
          title: json["title"] ?? "Título não disponível",
          thumb: json["thumb"] ?? "",
          channel: json["channel"] ?? "Canal não disponível");
    }
  }

  Map<String, dynamic> toJson() {
    return {"videoId": id, "title": title, "thumb": thumb, "channel": channel};
  }
}
