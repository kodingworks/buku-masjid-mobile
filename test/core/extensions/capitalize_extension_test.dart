import 'package:flutter_test/flutter_test.dart';
import 'package:buku_masjid/core/extensions/capitalize_extension.dart';

void main() {
  group('StringExtension', () {
    test('should capitalize the first letter of a string', () {
      const input = 'hello world';
      final output = input.capitalize();
      expect(output, 'Hello world');
    });

    test('should return an empty string if input is empty', () {
      const input = '';
      final output = input.capitalize();
      expect(output, '');
    });

    test(
        'should return the same string if it already starts with a capital letter',
        () {
      const input = 'Hello world';
      final output = input.capitalize();
      expect(output, 'Hello world');
    });
  });
}
