import 'package:coach/features/auth/complete_register/complete_register_state.dart';

class CompleteProfileModel {
  String name;
  String phone;
  String countryCode;
  String traineesNumber;
  String sessionsNumber;
  String experienceYears;
  String bio;
  String classPeriod;
  List<WeekDays> workingDays;
  List<ShiftModel> shifts;
  List<SportModel> sports;
  CompleteProfileModel({
    required this.name,
    required this.phone,
    required this.countryCode,
    required this.traineesNumber,
    required this.sessionsNumber,
    required this.experienceYears,
    required this.bio,
    required this.classPeriod,
    required this.workingDays,
    required this.shifts,
    required this.sports,
  });

  Map<String, dynamic> toJson() {
    final json = {
      "name": name,
      "phone": phone,
      "country_code": countryCode,
      "trainees_number": traineesNumber,
      "sessions_number": sessionsNumber,
      "experience_years": experienceYears,
      "bio": bio,
      "class_period": classPeriod,
    };
    if (workingDays.isNotEmpty) {
      for (int i = 0; i < workingDays.length; i++) {
        print("id os ${workingDays[i].dayName}");
        json["working_days[$i]"] = workingDays[i].id;
      }
    }
    if (shifts.isNotEmpty) {
      for (int i = 0; i < shifts.length; i++) {
        json["shifts[$i][start_time]"] = shifts[i].startTime;
        json["shifts[$i][end_time]"] = shifts[i].endTime;
      }
    }
    if (sports.isNotEmpty) {
      for (int i = 0; i < sports.length; i++) {
        json["sports[$i][id]"] = sports[i].id.toString();
        json["sports[$i][price]"] = sports[i].price;
      }
    }
    return json;
  }
}

class ShiftModel {
  String startTime;
  String endTime;

  ShiftModel({
    required this.startTime,
    required this.endTime,
  });

  factory ShiftModel.fromJson(Map<String, dynamic> json) => ShiftModel(
        startTime: json["start_time"],
        endTime: json["end_time"],
      );

  Map<String, dynamic> toJson() => {
        "start_time": startTime,
        "end_time": endTime,
      };
}

class SportModel {
  int id;
  String price;

  SportModel({
    required this.id,
    required this.price,
  });

  factory SportModel.fromJson(Map<String, dynamic> json) => SportModel(
        id: json["id"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
      };
}
