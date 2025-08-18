import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_theme/app_theme.dart';
import 'package:app_theme/theme_cubit.dart';
import 'features/home_dashboard_page.dart';
import 'package:app_shared_ui/panic_button.dart';

void main() {
	WidgetsFlutterBinding.ensureInitialized();
	runApp(const CitizenApp());
}

class CitizenApp extends StatelessWidget {
	const CitizenApp({super.key});

	@override
	Widget build(BuildContext context) {
		return BlocProvider(
			create: (_) => ThemeCubit(),
			child: BlocBuilder<ThemeCubit, ThemeMode>(
				builder: (context, themeMode) {
					return MaterialApp(
						title: 'Citizen App',
						theme: AppTheme.lightTheme,
						darkTheme: AppTheme.darkTheme,
						themeMode: themeMode,
						home: const _Shell(),
					);
				},
			),
		);
	}
}

class _Shell extends StatelessWidget {
	const _Shell();

	@override
	Widget build(BuildContext context) {
		return Stack(
			children: [
				const HomeDashboardPage(),
				Positioned(
					bottom: 24,
					left: 0,
					right: 0,
					child: Center(
						child: PanicButton(label: 'Panic', onPressed: () {}),
					),
				),
			],
		);
	}
}