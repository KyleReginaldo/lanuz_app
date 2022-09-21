// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String fullname;
  final String email;
  final String gender;
  final String contact;
  // ignore: non_constant_identifier_names
  final String loc_address;
  final String pword;
  final String coordinates;

  const UserEntity({
    required this.fullname,
    required this.email,
    required this.gender,
    required this.contact,
    // ignore: non_constant_identifier_names
    required this.loc_address,
    required this.pword,
    required this.coordinates,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
