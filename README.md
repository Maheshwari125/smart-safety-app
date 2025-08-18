# Emergency Super-App Monorepo

This repository contains a multi-domain Emergency Super-App built with Flutter, comprising three roles:

- Citizen App (mobile)
- Responder App (mobile)
- Command Center (web)

It uses a shared packages architecture and BLoC for state management.

## Structure

- `apps/citizen_app`: Flutter app for citizens
- `apps/responder_app`: Flutter app for responders
- `apps/command_center_web`: Flutter web app for command center
- `packages/app_theme`: Shared theming (light/dark, colors, fonts) and ThemeCubit
- `packages/app_core`: Domain models, blocs, and shared utilities
- `packages/app_shared_ui`: Shared UI components (cards, buttons, scaffolds)
- `packages/app_services`: Platform service interfaces/stubs (location, permissions, notifications)
- `packages/app_ai`: AI service interfaces/stubs (STT/TTS, summarization, triage)
- `packages/app_offline`: Offline sync and mesh/SMS fallback stubs

## Prerequisites

- Flutter 3.22+ installed and on PATH
- Dart 3.4+

## Getting Started

```bash
# Get packages for all apps and packages
flutter pub get

# Run Citizen App (mobile)
flutter run -d chrome -t apps/citizen_app/lib/main.dart

# Run Responder App (mobile)
flutter run -d chrome -t apps/responder_app/lib/main.dart

# Run Command Center (web)
flutter run -d chrome -t apps/command_center_web/lib/main.dart
```

You can also open each app as its own Flutter project in your IDE and run normally.

## Theming

- Primary: `#E11D48`
- Accent: `#0EA5E9`
- Support: `#22C55E`
- Rounded corners (2xl)
- Inter font via Google Fonts
- Dark/Light toggle via `ThemeCubit`

## State Management

- BLoC (`flutter_bloc`) is used across apps.

## Notes

This is a scaffold with feature stubs and sample screens. Extend repositories/services for integrations (maps, voice, video, push, etc.).