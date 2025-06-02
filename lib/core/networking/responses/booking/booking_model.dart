class BookingModel {
  int id;
  String code;
  String classPrice;
  String discount;
  String grandTotal;
  String startTime;
  String endTime;
  String bookingDate;
  String status;
  String statusText;
  String dateFrom;
  User user;
  dynamic coach;
  Sport sport;

  BookingModel({
    required this.id,
    required this.code,
    required this.classPrice,
    required this.discount,
    required this.grandTotal,
    required this.startTime,
    required this.endTime,
    required this.bookingDate,
    required this.status,
    required this.statusText,
    required this.dateFrom,
    required this.user,
    required this.coach,
    required this.sport,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        id: json["id"],
        code: json["code"] ?? "",
        classPrice: json["class_price"],
        discount: json["discount"],
        grandTotal: json["grand_total"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        bookingDate: json["booking_date"],
        status: json["status"],
        statusText: json["status_text"],
        dateFrom: json["date_from"],
        user: User.fromJson(json["user"]),
        coach: json["coach"],
        sport: Sport.fromJson(json["sport"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "class_price": classPrice,
        "discount": discount,
        "grand_total": grandTotal,
        "start_time": startTime,
        "end_time": endTime,
        "booking_date": bookingDate,
        "status": status,
        "status_text": statusText,
        "date_from": dateFrom,
        "user": user.toJson(),
        "coach": coach,
        "sport": sport.toJson(),
      };
}

class Sport {
  int id;
  String name;

  Sport({
    required this.id,
    required this.name,
  });

  factory Sport.fromJson(Map<String, dynamic> json) => Sport(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class User {
  int id;
  String name;
  String phone;
  String countryCode;
  String image;
  dynamic gender;
  String fullPhone;
  dynamic token;
  String language;
  int weight;
  int tall;
  int age;
  String healthProblems;
  dynamic country;

  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.countryCode,
    required this.image,
    required this.gender,
    required this.fullPhone,
    required this.token,
    required this.language,
    required this.weight,
    required this.tall,
    required this.age,
    required this.healthProblems,
    required this.country,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        countryCode: json["country_code"],
        image: json["image"],
        gender: json["gender"],
        fullPhone: json["full_phone"],
        token: json["token"],
        language: json["language"],
        weight: json["weight"] ?? 0,
        tall: json["tall"] ?? 0,
        age: json["age"] ?? 0,
        healthProblems: json["health_problems"] ?? "",
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "country_code": countryCode,
        "image": image,
        "gender": gender,
        "full_phone": fullPhone,
        "token": token,
        "language": language,
        "weight": weight,
        "tall": tall,
        "age": age,
        "health_problems": healthProblems,
        "country": country,
      };
}
