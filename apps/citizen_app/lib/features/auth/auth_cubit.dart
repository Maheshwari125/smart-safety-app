import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthStatus { unauthenticated, authenticating, authenticated, error }

class AuthState {
	final AuthStatus status;
	final String? userEmail;
	final String? errorMessage;
	const AuthState({required this.status, this.userEmail, this.errorMessage});

	AuthState copyWith({AuthStatus? status, String? userEmail, String? errorMessage}) {
		return AuthState(
			status: status ?? this.status,
			userEmail: userEmail ?? this.userEmail,
			errorMessage: errorMessage,
		);
	}

	static const unauthenticated = AuthState(status: AuthStatus.unauthenticated);
}

class AuthCubit extends Cubit<AuthState> {
	AuthCubit() : super(AuthState.unauthenticated);

	Future<void> login({required String email, required String password}) async {
		if (email.isEmpty || !email.contains('@')) {
			emit(state.copyWith(status: AuthStatus.error, errorMessage: 'Enter a valid email'));
			return;
		}
		if (password.length < 6) {
			emit(state.copyWith(status: AuthStatus.error, errorMessage: 'Password too short'));
			return;
		}
		emit(state.copyWith(status: AuthStatus.authenticating, errorMessage: null));
		await Future.delayed(const Duration(milliseconds: 600));
		emit(AuthState(status: AuthStatus.authenticated, userEmail: email));
	}

	Future<void> signup({required String name, required String email, required String password}) async {
		if (name.trim().length < 2) {
			emit(state.copyWith(status: AuthStatus.error, errorMessage: 'Enter your name'));
			return;
		}
		if (email.isEmpty || !email.contains('@')) {
			emit(state.copyWith(status: AuthStatus.error, errorMessage: 'Enter a valid email'));
			return;
		}
		if (password.length < 6) {
			emit(state.copyWith(status: AuthStatus.error, errorMessage: 'Password too short'));
			return;
		}
		emit(state.copyWith(status: AuthStatus.authenticating, errorMessage: null));
		await Future.delayed(const Duration(milliseconds: 800));
		emit(AuthState(status: AuthStatus.authenticated, userEmail: email));
	}

	void logout() {
		emit(AuthState.unauthenticated);
	}

	void clearError() {
		if (state.status == AuthStatus.error) {
			emit(state.copyWith(status: AuthStatus.unauthenticated, errorMessage: null));
		}
	}
}