import 'package:equatable/equatable.dart';

class IntroBoard extends Equatable {
  const IntroBoard({
    required this.id,
    required this.title,
    required this.description,
    required this.imageAsset,
  });

  final int id;
  final String title;
  final String description;
  final String imageAsset;

  @override
  List<Object?> get props => [id, title, description, imageAsset];
}
