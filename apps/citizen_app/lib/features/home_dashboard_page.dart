import 'package:flutter/material.dart';
import 'package:app_shared_ui/app_scaffold.dart';
import 'package:app_shared_ui/menu_card.dart';
import 'package:app_theme/app_theme.dart';

class HomeDashboardPage extends StatelessWidget {
	const HomeDashboardPage({super.key});

	@override
	Widget build(BuildContext context) {
		return AppScaffold(
			title: 'Dashboard',
			child: ListView(
				padding: const EdgeInsets.all(16),
				children: [
					Container(
						padding: const EdgeInsets.all(16),
						decoration: BoxDecoration(
							color: Theme.of(context).colorScheme.primaryContainer,
							borderRadius: BorderRadius.circular(16),
						),
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								Text('Safety Score', style: Theme.of(context).textTheme.titleMedium),
								const SizedBox(height: 8),
								Text('72', style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold)),
							],
						),
					),
					const SizedBox(height: 16),
					MenuCard(icon: Icons.map_rounded, title: 'Map View', color: AppColors.accent, onTap: () => _open(context, const _StubPage(title: 'Map View'))),
					MenuCard(icon: Icons.woman_2_rounded, title: 'Women Safety', color: AppColors.primary, onTap: () => _open(context, const _StubPage(title: 'Women Safety'))),
					MenuCard(icon: Icons.local_hospital_rounded, title: 'Medical', color: AppColors.support, onTap: () => _open(context, const _StubPage(title: 'Medical'))),
					MenuCard(icon: Icons.warning_amber_rounded, title: 'Disaster', onTap: () => _open(context, const _StubPage(title: 'Disaster'))),
					MenuCard(icon: Icons.traffic_rounded, title: 'Traffic / Accident', onTap: () => _open(context, const _StubPage(title: 'Traffic / Accident'))),
					MenuCard(icon: Icons.local_fire_department_rounded, title: 'Fire', onTap: () => _open(context, const _StubPage(title: 'Fire'))),
					MenuCard(icon: Icons.shield_rounded, title: 'Crime', onTap: () => _open(context, const _StubPage(title: 'Crime'))),
					MenuCard(icon: Icons.groups_rounded, title: 'Community / Volunteers', onTap: () => _open(context, const _StubPage(title: 'Community / Volunteers'))),
					MenuCard(icon: Icons.wifi_tethering_rounded, title: 'Offline / Mesh', onTap: () => _open(context, const _StubPage(title: 'Offline / Mesh'))),
					const SizedBox(height: 24),
					Text('Cross', style: Theme.of(context).textTheme.titleMedium),
					const SizedBox(height: 8),
					MenuCard(icon: Icons.inbox_rounded, title: 'Inbox / Alerts', onTap: () => _open(context, const _StubPage(title: 'Inbox / Alerts'))),
					MenuCard(icon: Icons.download_rounded, title: 'Downloads', onTap: () => _open(context, const _StubPage(title: 'Downloads'))),
					MenuCard(icon: Icons.person_rounded, title: 'Profile', onTap: () => _open(context, const _StubPage(title: 'Profile'))),
					MenuCard(icon: Icons.settings_rounded, title: 'Settings', onTap: () => _open(context, const _StubPage(title: 'Settings'))),
				],
			),
		);
	}

	void _open(BuildContext context, Widget page) {
		Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
	}
}

class _StubPage extends StatelessWidget {
	final String title;
	const _StubPage({required this.title});

	@override
	Widget build(BuildContext context) {
		return AppScaffold(
			title: title,
			child: const Center(child: Text('Coming soon...')),
		);
	}
}