import 'package:buku_masjid/core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'language.g.dart';

/// Represents a language.
@JsonSerializable()
class Language extends Equatable {
  /// Language code.
  @JsonKey(fromJson: StringParser.parse)
  final String code;

  /// Language name.
  @JsonKey(fromJson: StringParser.parse)
  final String name;

  /// Constructs a [Language].
  const Language({
    required this.code,
    required this.name,
  });

  /// Creates a [Language] instance from JSON data.
  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);

  /// Converts this [Language] instance to a JSON object.
  Map<String, dynamic> toJson() => _$LanguageToJson(this);

  /// Creates a copy of this [Language] but with the given fields replaced with the new values.
  Language copyWith({
    String? code,
    String? name,
  }) {
    return Language(
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [code, name];
}
