import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_theme/app_theme.dart';
import 'package:app_theme/theme_cubit.dart';
import 'package:app_shared_ui/app_scaffold.dart';

void main() {
	WidgetsFlutterBinding.ensureInitialized();
	runApp(const ResponderApp());
}

class ResponderApp extends StatelessWidget {
	const ResponderApp({super.key});

	@override
	Widget build(BuildContext context) {
		return BlocProvider(
			create: (_) => ThemeCubit(),
			child: BlocBuilder<ThemeCubit, ThemeMode>(
				builder: (context, themeMode) {
					return MaterialApp(
						title: 'Responder App',
						theme: AppTheme.lightTheme,
						darkTheme: AppTheme.darkTheme,
						themeMode: themeMode,
						home: const _ResponderHomePage(),
					);
				},
			),
		);
	}
}

class _ResponderHomePage extends StatelessWidget {
	const _ResponderHomePage();

	@override
	Widget build(BuildContext context) {
		return AppScaffold(
			title: 'Live SOS Queue',
			child: ListView.separated(
				padding: const EdgeInsets.all(16),
				itemBuilder: (context, index) => Card(
					child: ListTile(
						leading: const Icon(Icons.warning_rounded, color: Colors.redAccent),
						title: Text('SOS #${index + 1}'),
						subtitle: const Text('High priority • 1.2 km • 3 min ago'),
						trailing: const Icon(Icons.chevron_right),
					),
				),
				separatorBuilder: (context, index) => const SizedBox(height: 8),
				itemCount: 10,
			),
		);
	}
}