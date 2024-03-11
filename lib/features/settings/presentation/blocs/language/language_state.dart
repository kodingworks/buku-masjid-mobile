part of 'language_bloc.dart';

class LanguageState extends Equatable {
  const LanguageState(
    this.language,
    this.supportedLanguages,
    this.languageSelect,
  );

  final Language? language;
  final Language? languageSelect;
  final List<Language> supportedLanguages;

  LanguageState copyWith({
    Language? language,
    Language? languageSelect,
    List<Language>? supportedLanguages,
  }) {
    return LanguageState(
      language ?? this.language,
      supportedLanguages ?? this.supportedLanguages,
      languageSelect ?? this.languageSelect,
    );
  }

  @override
  List<Object?> get props => [language, languageSelect, supportedLanguages];
}
