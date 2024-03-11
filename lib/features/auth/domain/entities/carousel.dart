import 'package:equatable/equatable.dart';

class Carousel extends Equatable {
  const Carousel({
    required this.image,
    required this.title,
    required this.desc,
  });

  final String image;
  final String title;
  final String desc;

  @override
  List<Object?> get props => [image, title, desc];
}
