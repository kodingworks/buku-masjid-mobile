import 'package:buku_masjid/core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

/// Represents a country.
@JsonSerializable()
class Country extends Equatable {
  /// Dial code of the country.
  @JsonKey(name: 'dial_code', fromJson: StringParser.parse)
  final String dialCode;

  /// Code of the country.
  @JsonKey(fromJson: StringParser.parse)
  final String code;

  /// Flag icon of the country.
  @JsonKey(fromJson: StringParser.parse)
  final String flag;

  /// Name of the country.
  @JsonKey(fromJson: StringParser.parse)
  final String name;

  /// Constructs a [Country].
  const Country({
    required this.dialCode,
    required this.code,
    required this.flag,
    required this.name,
  });

  /// Creates a [Country] instance from JSON data.
  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  /// Converts this [Country] instance to a JSON object.
  Map<String, dynamic> toJson() => _$CountryToJson(this);

  /// Creates a copy of this [Country] but with the given fields replaced with the new values.
  Country copyWith({
    String? dialCode,
    String? code,
    String? flag,
    String? name,
  }) {
    return Country(
      dialCode: dialCode ?? this.dialCode,
      code: code ?? this.code,
      flag: flag ?? this.flag,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [dialCode, code, flag, name];
}
