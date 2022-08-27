import 'package:events_app/models/audience_model.dart';
import 'package:events_app/models/presenter_model.dart';

class EventModel {
  EventModel({
    this.id,
    this.presenter,
    this.eventName,
    this.description,
    this.price,
    this.isOnline,
    this.quota,
    this.audience,
    this.image,
    this.city,
    this.date,
  });

  int? id;
  PresenterModel? presenter;
  String? eventName;
  String? description;
  String? price;
  bool? isOnline;
  int? quota;
  List<AudienceModel>? audience;
  String? image;
  String? city;
  DateTime? date;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
    id: json["id"],
    presenter: PresenterModel.fromJson(json["presenter"]),
    eventName: json["eventName"],
    description: json["description"],
    price: json["price"],
    isOnline: json["isOnline"],
    quota: json["quota"],
    audience: List<AudienceModel>.from(json["audience"].map((x) => AudienceModel.fromJson(x))),
    image: json["image"],
    city: json["city"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "presenter": presenter!.toJson(),
    "eventName": eventName,
    "description": description,
    "price": price,
    "isOnline": isOnline,
    "quota": quota,
    "audience": List<dynamic>.from(audience!.map((x) => x.toJson())),
    "image": image,
    "city": city,
    "date": date!.toIso8601String(),
  };
}