import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_cubit.dart';

class SignupPage extends StatefulWidget {
	const SignupPage({super.key});

	@override
	State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
	final TextEditingController _nameController = TextEditingController();
	final TextEditingController _emailController = TextEditingController();
	final TextEditingController _passwordController = TextEditingController();
	final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: const Text('Create account')),
			body: Center(
				child: ConstrainedBox(
					constraints: const BoxConstraints(maxWidth: 420),
					child: Padding(
						padding: const EdgeInsets.all(24),
						child: BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
							return Column(
								mainAxisSize: MainAxisSize.min,
								crossAxisAlignment: CrossAxisAlignment.stretch,
								children: [
									Form(
										key: _formKey,
										child: Column(children: [
											TextFormField(
												controller: _nameController,
												textCapitalization: TextCapitalization.words,
												decoration: const InputDecoration(labelText: 'Full name'),
												validator: (v) => (v == null || v.trim().length < 2) ? 'Enter your name' : null,
											),
											const SizedBox(height: 12),
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
												: () async {
													if (_formKey.currentState?.validate() ?? false) {
														await context.read<AuthCubit>().signup(
															name: _nameController.text.trim(),
															email: _emailController.text.trim(),
															password: _passwordController.text,
														);
														if (context.mounted) Navigator.of(context).pop();
													}
												},
												child: state.status == AuthStatus.authenticating ? const CircularProgressIndicator() : const Text('Create account'),
											),
									),
								],
							);
						}),
					),
				),
			),
		);
	}
}