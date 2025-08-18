import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/auth_cubit.dart';
import '../../features/auth/signup_page.dart';

class LoginPage extends StatefulWidget {
	const LoginPage({super.key});

	@override
	State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
	final TextEditingController _emailController = TextEditingController();
	final TextEditingController _passwordController = TextEditingController();
	final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Center(
				child: ConstrainedBox(
					constraints: const BoxConstraints(maxWidth: 420),
					child: Padding(
						padding: const EdgeInsets.all(24),
						child: Column(
							mainAxisSize: MainAxisSize.min,
							crossAxisAlignment: CrossAxisAlignment.stretch,
							children: [
								Text('Welcome back', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
								const SizedBox(height: 24),
								BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
									return Column(
										children: [
											if (state.status == AuthStatus.error && state.errorMessage != null)
												Container(
													padding: const EdgeInsets.all(12),
													decoration: BoxDecoration(color: Theme.of(context).colorScheme.errorContainer, borderRadius: BorderRadius.circular(12)),
													child: Row(
														children: [
															Icon(Icons.error_outline, color: Theme.of(context).colorScheme.onErrorContainer),
															const SizedBox(width: 8),
															Expanded(child: Text(state.errorMessage!, style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer))),
															IconButton(onPressed: () => context.read<AuthCubit>().clearError(), icon: const Icon(Icons.close))
														],
													),
												),
											const SizedBox(height: 12),
											Form(
												key: _formKey,
												child: Column(children: [
													TextFormField(
														controller: _emailController,
														keyboardType: TextInputType.emailAddress,
														decoration: const InputDecoration(labelText: 'Email'),
														validator: (v) => (v == null || !v.contains('@')) ? 'Enter a valid email' : null,
													),
													const SizedBox(height: 12),
													TextFormField(
														controller: _passwordController,
														obscureText: true,
														decoration: const InputDecoration(labelText: 'Password'),
														validator: (v) => (v == null || v.length < 6) ? 'Min 6 characters' : null,
													),
												]),
											),
											const SizedBox(height: 20),
											SizedBox(
												width: double.infinity,
												height: 48,
												child: ElevatedButton(
													onPressed: state.status == AuthStatus.authenticating
														? null
														: () {
															if (_formKey.currentState?.validate() ?? false) {
																context.read<AuthCubit>().login(email: _emailController.text.trim(), password: _passwordController.text);
															}
														},
													child: state.status == AuthStatus.authenticating ? const CircularProgressIndicator() : const Text('Login'),
												),
											),
											const SizedBox(height: 16),
											TextButton(
												onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SignupPage())),
												child: const Text('Create an account'),
											),
										],
									);
								}),
							],
						),
					),
				),
			),
		);
	}
}