import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'count_event.dart';

class CountBloc extends Bloc<CountEvent, int> {
  CountBloc() : super(0) {
    on<IncrementCountEvent>((event, emit) {
      emit(state + 1);
    });
  }
}
