import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:buku_masjid/core/extensions/sizedbox_extension.dart';

void main() {
  group('SizedBoxExtension', () {
    test('width creates SizedBox with specified width', () {
      const double width = 100.0;
      final SizedBox sizedBox = width.width;

      expect(sizedBox, isA<SizedBox>());
      expect(sizedBox.width, width);
    });

    test('height creates SizedBox with specified height', () {
      const double height = 150.0;
      final SizedBox sizedBox = height.height;

      expect(sizedBox, isA<SizedBox>());
      expect(sizedBox.height, height);
    });

    test('box creates SizedBox with specified width and height', () {
      const double size = 200.0;
      final SizedBox sizedBox = size.box;

      expect(sizedBox, isA<SizedBox>());
      expect(sizedBox.width, size);
      expect(sizedBox.height, size);
    });
  });
}
