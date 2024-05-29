class JourneyModel {
  String? uid;
  double fromLat;
  double toLat;
  double fromLon;
  double toLon;
  double currentLat;
  double currentLon;
  String sharingUserId;

  JourneyModel(
      {required this.currentLat,
      required this.sharingUserId,
      required this.currentLon,
      required this.fromLat,
      required this.fromLon,
      required this.toLat,
      required this.toLon,
       this.uid});

  Map<String, dynamic> toJson(id) => {
        "currentLat": currentLat,
        "sharingUserId":sharingUserId,
        "currentLon": currentLon,
        "uid":id ,
        "fromLat": fromLat,
        "toLat": toLat,
        "fromLon": fromLon,
        "toLon": toLon
      };

  factory JourneyModel.fromJson(Map<String, dynamic> json) => JourneyModel(
      currentLat: json["currentLat"],
      currentLon: json["currentLon"],
      sharingUserId:json["sharingUserId"],
      fromLat: json["fromLat"],
      fromLon: json["fromLon"],
      toLat: json["toLat"],
      toLon: json["toLon"],
      uid: json["uid"]);
}
