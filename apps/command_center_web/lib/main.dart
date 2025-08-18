import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_theme/app_theme.dart';
import 'package:app_theme/theme_cubit.dart';

void main() {
	WidgetsFlutterBinding.ensureInitialized();
	runApp(const CommandCenterApp());
}

class CommandCenterApp extends StatelessWidget {
	const CommandCenterApp({super.key});

	@override
	Widget build(BuildContext context) {
		return BlocProvider(
			create: (_) => ThemeCubit(),
			child: BlocBuilder<ThemeCubit, ThemeMode>(
				builder: (context, themeMode) {
					return MaterialApp(
						title: 'Command Center',
						theme: AppTheme.lightTheme,
						darkTheme: AppTheme.darkTheme,
						themeMode: themeMode,
						home: const _DashboardPage(),
					);
				},
			),
		);
	}
}

class _DashboardPage extends StatelessWidget {
	const _DashboardPage();

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: const Text('Live Incidents')),
			body: GridView.count(
				padding: const EdgeInsets.all(16),
				crossAxisCount: 3,
				crossAxisSpacing: 16,
				mainAxisSpacing: 16,
				children: const [
					_Card(title: 'Open Incidents', value: '24'),
					_Card(title: 'Avg. Response', value: '07:42'),
					_Card(title: 'Ambulances Active', value: '12'),
				],
			),
		);
	}
}

class _Card extends StatelessWidget {
	final String title;
	final String value;
	const _Card({required this.title, required this.value});

	@override
	Widget build(BuildContext context) {
		return Card(
			child: Padding(
				padding: const EdgeInsets.all(16),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						Text(title, style: Theme.of(context).textTheme.titleMedium),
						const Spacer(),
						Text(
							value,
							style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
						),
					],
				),
			),
		);
	}
}