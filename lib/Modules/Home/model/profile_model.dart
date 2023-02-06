// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';


import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

part 'profile_model.g.dart';

List<ProfileModel> profileModelFromJson(str) =>
    List<ProfileModel>.from(str.map((x) => ProfileModel.fromJson(x)));

String profileModelToJson(List<ProfileModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 0)
class ProfileModel {
  ProfileModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    this.profileImage,
    required this.address,
    this.phone,
    this.website,
    this.company,
  });

  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String username;
  @HiveField(3)
  String email;
  @HiveField(4)
  String? profileImage;
  @HiveField(5)
  Address address;
  @HiveField(6)
  String? phone;
  @HiveField(7)
  String? website;
  @HiveField(8)
  Company? company;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        profileImage: json["profile_image"],
        address: Address.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company:
            json["company"] == null ? null : Company.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "profile_image": profileImage,
        "address": address.toJson(),
        "phone": phone,
        "website": website,
        "company": company?.toJson(),
      };
}

@HiveType(typeId: 1)
class Address {
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  @HiveField(0)
  String street;
  @HiveField(1)
  String suite;
  @HiveField(2)
  String city;
  @HiveField(3)
  String zipcode;
  @HiveField(4)
  Geo geo;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: Geo.fromJson(json["geo"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo.toJson(),
      };
}

@HiveType(typeId: 2)
class Geo {
  Geo({
    required this.lat,
    required this.lng,
  });

  @HiveField(0)
  String lat;
  @HiveField(1)
  String lng;

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

@HiveType(typeId: 3)
class Company {
  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  @HiveField(0)
  String name;
  @HiveField(1)
  String catchPhrase;
  @HiveField(2)
  String bs;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}
