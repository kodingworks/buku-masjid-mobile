import 'package:buku_masjid/core/core.dart';

import 'raw/languages.dart';

/// Data class containing a list of languages.
class LanguagesData {
  /// List of languages.
  static List<Language> data = _dataFromMap();

  /// Converts raw language data into a list of Language objects.
  static List<Language> _dataFromMap() {
    return languagesRawData.map((data) => Language.fromJson(data)).toList();
  }
}
