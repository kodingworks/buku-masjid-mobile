part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthenticateEvent extends AuthEvent {}

class LoginAuthEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginAuthEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class RegisterAuthEvent extends AuthEvent {
  final String name;
  final String phone;
  final String email;
  final String password;

  const RegisterAuthEvent({
    required this.email,
    required this.name,
    required this.phone,
    required this.password,
  });

  @override
  List<Object> get props => [email, password, name, phone];
}
