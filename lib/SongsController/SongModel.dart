import 'dart:convert';

List<SongsModel> songsModelFromJson(String str) => List<SongsModel>.from(json.decode(str).map((x) => SongsModel.fromJson(x)));

String songsModelToJson(List<SongsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SongsModel {
    SongsModel({
       required this.category,
       //required this.album,
        required this.title,
        required this.image,
        required this.singer,
        required this.song,
        required this.album,
    });

   String category;
   // String album;
    List title;
    String image;
    String singer;
    List song;
    String album;

    factory SongsModel.fromJson(Map<String, dynamic> json) => SongsModel(
        category: json["category"],
       // album: json["album"],
        title: json["title"],
        image: json["image"],
        singer: json["Singer"],
        song: json["song"],
        album: json["album"] ??'private'
    );

    Map<String, dynamic> toJson() => {
        "category": category,
        "album": album,
        "title": title,
        "image": image,
        "singer": singer,
        "song": song,
    };
}
