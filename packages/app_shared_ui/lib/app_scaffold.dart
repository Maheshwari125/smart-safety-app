import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_theme/theme_cubit.dart';

class AppScaffold extends StatelessWidget {
	final String title;
	final Widget child;
	const AppScaffold({super.key, required this.title, required this.child});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text(title),
				actions: [
					IconButton(
						icon: const Icon(Icons.brightness_6),
						onPressed: () => context.read<ThemeCubit>().toggle(),
					),
				],
			),
			body: SafeArea(child: child),
		);
	}
}