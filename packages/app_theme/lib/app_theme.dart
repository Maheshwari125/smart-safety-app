library app_theme;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

export 'theme_cubit.dart';

class AppColors {
	AppColors._();

	static const Color primary = Color(0xFFE11D48); // red safety
	static const Color accent = Color(0xFF0EA5E9); // blue
	static const Color support = Color(0xFF22C55E); // green
}

class AppTheme {
	AppTheme._();

	static ThemeData get lightTheme {
		final base = ThemeData.light(useMaterial3: true);
		final colorScheme = ColorScheme.fromSeed(
			seedColor: AppColors.primary,
			primary: AppColors.primary,
			secondary: AppColors.accent,
			tertiary: AppColors.support,
			brightness: Brightness.light,
		);
		return base.copyWith(
			colorScheme: colorScheme,
			textTheme: GoogleFonts.interTextTheme(base.textTheme),
			appBarTheme: AppBarTheme(
				backgroundColor: colorScheme.surface,
				foregroundColor: colorScheme.onSurface,
				elevation: 0,
			),
			useMaterial3: true,
			elevatedButtonTheme: ElevatedButtonThemeData(
				style: ElevatedButton.styleFrom(
					shape: RoundedRectangleBorder(
						borderRadius: BorderRadius.circular(16),
					),
				),
			),
			cardTheme: CardTheme(
				shape: RoundedRectangleBorder(
					borderRadius: BorderRadius.circular(16),
				),
				elevation: 2,
			),
		);
	}

	static ThemeData get darkTheme {
		final base = ThemeData.dark(useMaterial3: true);
		final colorScheme = ColorScheme.fromSeed(
			seedColor: AppColors.primary,
			primary: AppColors.primary,
			secondary: AppColors.accent,
			tertiary: AppColors.support,
			brightness: Brightness.dark,
		);
		return base.copyWith(
			colorScheme: colorScheme,
			textTheme: GoogleFonts.interTextTheme(base.textTheme),
			appBarTheme: AppBarTheme(
				backgroundColor: colorScheme.surface,
				foregroundColor: colorScheme.onSurface,
				elevation: 0,
			),
			useMaterial3: true,
			elevatedButtonTheme: ElevatedButtonThemeData(
				style: ElevatedButton.styleFrom(
					shape: RoundedRectangleBorder(
						borderRadius: BorderRadius.circular(16),
					),
				),
			),
			cardTheme: CardTheme(
				shape: RoundedRectangleBorder(
					borderRadius: BorderRadius.circular(16),
				),
				elevation: 2,
			),
		);
	}
}