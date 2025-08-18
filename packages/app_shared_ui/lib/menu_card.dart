import 'package:flutter/material.dart';
import 'package:app_theme/app_theme.dart';

class MenuCard extends StatelessWidget {
	final IconData icon;
	final String title;
	final Color? color;
	final VoidCallback? onTap;
	const MenuCard({super.key, required this.icon, required this.title, this.color, this.onTap});

	@override
	Widget build(BuildContext context) {
		return InkWell(
			onTap: onTap,
			borderRadius: BorderRadius.circular(16),
			child: Card(
				elevation: 2,
				shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
				child: Padding(
					padding: const EdgeInsets.all(16),
					child: Row(
						children: [
							Container(
								width: 44,
								height: 44,
								decoration: BoxDecoration(
									color: (color ?? AppColors.accent).withOpacity(0.1),
									shape: BoxShape.circle,
								),
								child: Icon(icon, color: color ?? AppColors.accent),
							),
							const SizedBox(width: 12),
							Expanded(
								child: Text(
									title,
									style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
								),
							),
							const Icon(Icons.chevron_right),
						],
					),
				),
			),
		);
	}
}