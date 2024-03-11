part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({
    this.failure,
    this.status = Auth.initial,
    this.user,
  });

  factory AuthState.initial() {
    return const AuthState();
  }

  final Auth status;
  final Failure? failure;
  final User? user;

  AuthState copyWith({Auth? status, Failure? failure, User? user}) {
    return AuthState(
      failure: failure,
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [failure, status, user];
}
