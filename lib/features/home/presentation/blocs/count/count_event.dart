part of 'count_bloc.dart';

sealed class CountEvent extends Equatable {
  const CountEvent();

  @override
  List<Object> get props => [];
}

class IncrementCountEvent extends CountEvent {}
