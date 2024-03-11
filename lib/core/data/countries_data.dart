import 'package:buku_masjid/core/core.dart';

import 'raw/countries.dart';

/// Data class containing a list of countries.
class CountriesData {
  /// List of countries.
  static List<Country> data = _dataFromMap();

  /// Converts raw country data into a list of Country objects.
  static List<Country> _dataFromMap() => countriesRawData
      .map<Country>(
        (data) => Country.fromJson(data).copyWith(
          flag: MainAssets.pathLanguage(data['code'].toString().toLowerCase()),
        ),
      )
      .toList();
}
