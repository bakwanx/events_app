class PresenterModel {
  PresenterModel({
    this.name,
    this.presenterImage,
    this.rating,
    this.job,
    this.about,
    this.email,
  });

  String? name;
  String? presenterImage;
  String? rating;
  String? job;
  String? about;
  String? email;

  factory PresenterModel.fromJson(Map<String, dynamic> json) => PresenterModel(
    name: json["name"],
    presenterImage: json["presenterImage"],
    rating: json["rating"],
    job: json["job"],
    about: json["about"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "presenterImage": presenterImage,
    "rating": rating,
    "job": job,
    "about": about,
    "email": email,
  };
}
