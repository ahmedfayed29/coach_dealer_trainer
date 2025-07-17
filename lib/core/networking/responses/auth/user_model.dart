import 'package:coach/core/caching/preference_manager.dart';
import 'package:coach/core/networking/network-mappers.dart';
import 'package:coach/core/networking/responses/countries/country_model.dart';

class UserModel extends BaseMappable {
  int id;
  String name;
  String phone;
  String countryCode;
  String image;
  String fullPhone;
  String token;
  String language;
  dynamic experienceYears;
  dynamic sessionsNumber;
  dynamic traineesNumber;
  dynamic bio;
  int classPeriod;
  CountryModel country;
  List<SportsModel> sports;
  List<ImagesModel> images;
  List<WorkingDaysModel> workingDays;
  List<ShiftsModel> shifts;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.countryCode,
    required this.image,
    required this.fullPhone,
    required this.token,
    required this.language,
    required this.experienceYears,
    required this.sessionsNumber,
    required this.traineesNumber,
    required this.bio,
    required this.classPeriod,
    required this.country,
    required this.sports,
    required this.images,
    required this.workingDays,
    required this.shifts,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        countryCode: json["country_code"],
        image: json["image"],
        fullPhone: json["full_phone"],
        token: json["token"] ?? PreferenceManager().authToken() ?? "",
        language: json["language"],
        experienceYears: json["experience_years"],
        sessionsNumber: json["sessions_number"],
        traineesNumber: json["trainees_number"],
        bio: json["bio"],
        classPeriod: int.tryParse(json["class_period"].toString()) ?? 0,
        country: CountryModel.fromJson(json["country"]),
        sports: List<SportsModel>.from(json["sports"].map((x) {
          print("x is ${x.runtimeType}");
          return x is SportsModel ? x : SportsModel.fromJson(x);
        })),
        images: List<ImagesModel>.from(json["images"].map((x) => ImagesModel.fromJson(x))),
        workingDays: List<WorkingDaysModel>.from(
            json["working_days"].map((x) => WorkingDaysModel.fromJson(x))),
        shifts: List<ShiftsModel>.from(json["shifts"].map((x) => ShiftsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "country_code": countryCode,
        "image": image,
        "full_phone": fullPhone,
        "token": token,
        "language": language,
        "experience_years": experienceYears,
        "sessions_number": sessionsNumber,
        "trainees_number": traineesNumber,
        "bio": bio,
        "class_period": classPeriod,
        "country": country.toJson(),
        "sports": List<SportsModel>.from(sports.map((x) => x)),
        "images": List<ImagesModel>.from(images.map((x) => x)),
        "working_days": List<WorkingDaysModel>.from(workingDays.map((x) => x)),
        "shifts": List<ShiftsModel>.from(shifts.map((x) => x)),
      };

  @override
  Mappable fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        countryCode: json["country_code"],
        image: json["image"],
        fullPhone: json["full_phone"],
        token: json["token"],
        language: json["language"],
        experienceYears: json["experience_years"],
        sessionsNumber: json["sessions_number"],
        traineesNumber: json["trainees_number"],
        bio: json["bio"],
        classPeriod: json["class_period"],
        country: CountryModel.fromJson(json["country"]),
        sports: List<SportsModel>.from(json["sports"].map((x) => x)),
        images: List<ImagesModel>.from(json["images"].map((x) => x)),
        workingDays: List<WorkingDaysModel>.from(json["working_days"].map((x) => x)),
        shifts: List<ShiftsModel>.from(json["shifts"].map((x) => x)),
      );
}

class SportsModel {
  int id;
  String name;
  String price;

  SportsModel({
    required this.id,
    required this.name,
    required this.price,
  });

  factory SportsModel.fromJson(Map<String, dynamic> json) => SportsModel(
        id: json["id"],
        name: json["name"],
        price: json["price"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
      };
}

class ShiftsModel {
  int id;
  String startTime;
  String endTime;

  ShiftsModel({
    required this.id,
    required this.startTime,
    required this.endTime,
  });

  factory ShiftsModel.fromJson(Map<String, dynamic> json) => ShiftsModel(
        id: json["id"],
        startTime: json["start_time"],
        endTime: json["end_time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "start_time": startTime,
        "end_time": endTime,
      };
}

class WorkingDaysModel {
  String day;

  WorkingDaysModel({
    required this.day,
  });

  factory WorkingDaysModel.fromJson(Map<String, dynamic> json) => WorkingDaysModel(
        day: json["day"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
      };
}

class ImagesModel {
  int id;
  String url;

  ImagesModel({
    required this.id,
    required this.url,
  });

  factory ImagesModel.fromJson(Map<String, dynamic> json) => ImagesModel(
        id: json["id"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
      };
}
