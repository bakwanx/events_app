class AudienceModel {
  AudienceModel({
    this.name,
    this.image,
    this.date,
  });

  String? name;
  String? image;
  DateTime? date;

  factory AudienceModel.fromJson(Map<String, dynamic> json) => AudienceModel(
    name: json["name"],
    image: json["image"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "date": date!.toIso8601String(),
  };
}