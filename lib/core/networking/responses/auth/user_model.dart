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
  List<dynamic> sports;
  List<dynamic> images;
  List<dynamic> workingDays;
  List<dynamic> shifts;

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
        sports: List<dynamic>.from(json["sports"].map((x) => x)),
        images: List<dynamic>.from(json["images"].map((x) => x)),
        workingDays: List<dynamic>.from(json["working_days"].map((x) => x)),
        shifts: List<dynamic>.from(json["shifts"].map((x) => x)),
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
        "sports": List<dynamic>.from(sports.map((x) => x)),
        "images": List<dynamic>.from(images.map((x) => x)),
        "working_days": List<dynamic>.from(workingDays.map((x) => x)),
        "shifts": List<dynamic>.from(shifts.map((x) => x)),
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
        sports: List<dynamic>.from(json["sports"].map((x) => x)),
        images: List<dynamic>.from(json["images"].map((x) => x)),
        workingDays: List<dynamic>.from(json["working_days"].map((x) => x)),
        shifts: List<dynamic>.from(json["shifts"].map((x) => x)),
      );
}
