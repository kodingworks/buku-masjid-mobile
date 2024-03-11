import 'package:url_launcher/url_launcher.dart';

/// A helper class for launching URLs.
class LauncherHelper {
  /// Launches the given [url].
  ///
  /// Throws an exception if the URL cannot be launched.
  ///
  /// Example:
  /// ```dart
  /// try {
  ///   await LauncherHelper.launch('https://example.com');
  /// } catch (e) {
  ///   print('Error launching URL: $e');
  /// }
  /// ```
  static Future<void> launch(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
    await launch(url);
  }
}
