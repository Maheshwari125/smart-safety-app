import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../home_dashboard_page.dart';
import 'auth_cubit.dart';
import 'login_page.dart';

class AuthGate extends StatelessWidget {
	const AuthGate({super.key});

	@override
	Widget build(BuildContext context) {
		return BlocBuilder<AuthCubit, AuthState>(
			builder: (context, state) {
				switch (state.status) {
					case AuthStatus.authenticated:
						return const HomeDashboardPage();
					case AuthStatus.authenticating:
						return const _Loading();
					case AuthStatus.error:
						return const LoginPage();
					case AuthStatus.unauthenticated:
						return const LoginPage();
				}
			},
		);
	}
}

class _Loading extends StatelessWidget {
	const _Loading();
	@override
	Widget build(BuildContext context) => const Scaffold(body: Center(child: CircularProgressIndicator()));
}