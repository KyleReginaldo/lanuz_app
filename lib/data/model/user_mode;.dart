import 'dart:convert';

import '../../domain/enitity/user_entity.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  final String fullname;
  final String email;
  final String gender;
  final String contact;
  // ignore: non_constant_identifier_names
  final String loc_address;
  final String pword;
  final String? coordinates;

  UserModel({
    required this.fullname,
    required this.email,
    required this.gender,
    required this.contact,
    // ignore: non_constant_identifier_names
    required this.loc_address,
    required this.pword,
    this.coordinates,
  });

  factory UserModel.toEntity(UserEntity user) {
    return UserModel(
      fullname: user.fullname,
      email: user.email,
      gender: user.gender,
      contact: user.contact,
      loc_address: user.loc_address,
      pword: user.pword,
      coordinates: user.coordinates,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullname': fullname,
      'email': email,
      'gender': gender,
      'contact': contact,
      'loc_address': loc_address,
      'pword': pword,
      'coordinates': coordinates,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fullname: map['fullname'] as String,
      email: map['email'] as String,
      gender: map['gender'] as String,
      contact: map['contact'] as String,
      loc_address: map['loc_address'] as String,
      pword: map['pword'] as String,
      coordinates:
          map['coordinates'] != null ? map['coordinates'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
