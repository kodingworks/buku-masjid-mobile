/// Extension for capitalizing the first letter of a string.
extension StringExtension on String {
  /// Capitalizes the first letter of the string.
  ///
  /// Returns the modified string with the first letter capitalized.
  String capitalize() {
    if (isNotEmpty) {
      return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
    } else {
      return '';
    }
  }
}
