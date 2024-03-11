part of 'bottom_nav_bloc.dart';

abstract class BottomNavEvent extends Equatable {
  const BottomNavEvent();
}

class BottomNavChanged extends BottomNavEvent {
  final int index;

  const BottomNavChanged(this.index);

  @override
  List<Object> get props => [index];
}
