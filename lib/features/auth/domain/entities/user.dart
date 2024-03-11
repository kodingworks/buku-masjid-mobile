import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:buku_masjid/core/core.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
  });

  final String id;
  final String name;

  @JsonKey(fromJson: StringParser.parse)
  final String phone;

  @JsonKey(fromJson: StringParser.parse)
  final String email;

  @override
  List<Object> get props => [id, name, phone, email];
}
