import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

/// Returns an [EventTransformer] that throttles incoming events and drops events that occur
/// during the throttle period.
EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

/// Returns an [EventTransformer] that throttles incoming events and restarts the throttle
/// period whenever a new event is emitted.
EventTransformer<E> throttleRestartable<E>(Duration duration) {
  return (events, mapper) {
    return restartable<E>().call(events.throttle(duration), mapper);
  };
}

/// Returns an [EventTransformer] that debounces incoming events, emitting only the last
/// event after a specified duration has passed without any new events being emitted.
EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}
