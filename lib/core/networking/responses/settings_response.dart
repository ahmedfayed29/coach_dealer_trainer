import 'package:coach/core/networking/network-mappers.dart';

class SettingsResponse extends BaseMappable {
  bool? status;
  Data? data;

  SettingsResponse({this.status, this.data});

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    return SettingsResponse(
      status: status,
      data: data,
    );
  }
}

class Data {
  String? aboutUs;
  String? terms;
  String? phone;
  String? email;
  String? facebook;
  String? twitter;
  String? instagram;
  String? whatsapp;
  String? messenger;
  String? privacy;
  String? tiktok;

  Data(
      {this.aboutUs,
      this.terms,
      this.phone,
      this.email,
      this.facebook,
      this.twitter,
      this.instagram,
      this.whatsapp,
      this.messenger,
      this.privacy,
      this.tiktok});

  Data.fromJson(Map<String, dynamic> json) {
    aboutUs = json['about_us'];
    terms = json['terms'];
    phone = json['phone'];
    email = json['email'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    instagram = json['instagram'];
    whatsapp = json['whatsapp'];
    messenger = json['messenger'];
    privacy = json['privacy'];
    tiktok = json['tiktok'];
  }
}
