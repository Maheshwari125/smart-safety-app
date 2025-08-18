import 'package:flutter/material.dart';
import 'package:app_theme/app_theme.dart';

class PanicButton extends StatelessWidget {
	final String label;
	final VoidCallback? onPressed;
	const PanicButton({super.key, required this.label, this.onPressed});

	@override
	Widget build(BuildContext context) {
		return SizedBox(
			width: 220,
			height: 220,
			child: ElevatedButton(
				style: ElevatedButton.styleFrom(
					backgroundColor: AppColors.primary,
					foregroundColor: Colors.white,
					shape: const CircleBorder(),
					elevation: 6,
					shadowColor: AppColors.primary.withOpacity(0.5),
				),
				onPressed: onPressed ?? () {},
				child: Text(
					label,
					style: Theme.of(context).textTheme.headlineMedium?.copyWith(
						color: Colors.white,
						fontWeight: FontWeight.bold,
					),
				),
			),
		);
	}
}