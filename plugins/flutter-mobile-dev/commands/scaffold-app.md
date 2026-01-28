# Scaffold App Command

## Command
```
/scaffold-app
```

## Description
Creates complete Flutter project structure for RelationCRM with clean architecture.

## Generated Structure
```
relationcrm/
├── lib/
│   ├── core/
│   │   ├── constants/
│   │   │   ├── app_colors.dart
│   │   │   ├── app_strings.dart
│   │   │   └── app_theme.dart
│   │   ├── errors/
│   │   │   ├── exceptions.dart
│   │   │   └── failures.dart
│   │   ├── network/
│   │   │   ├── api_client.dart
│   │   │   └── network_info.dart
│   │   ├── utils/
│   │   │   ├── date_utils.dart
│   │   │   └── validators.dart
│   │   └── widgets/
│   │       ├── app_button.dart
│   │       ├── app_text_field.dart
│   │       └── loading_indicator.dart
│   ├── features/
│   │   ├── auth/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   ├── contacts/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   ├── reminders/
│   │   ├── insights/
│   │   └── settings/
│   ├── injection_container.dart
│   └── main.dart
├── test/
│   ├── unit/
│   ├── widget/
│   └── integration/
├── integration_test/
├── pubspec.yaml
├── analysis_options.yaml
└── README.md
```

## Included Dependencies
```yaml
dependencies:
  flutter_riverpod: ^2.4.0
  freezed_annotation: ^2.4.0
  go_router: ^12.0.0
  firebase_core: ^2.24.0
  firebase_auth: ^4.15.0
  cloud_firestore: ^4.13.0
  hive_flutter: ^1.1.0
  dartz: ^0.10.1

dev_dependencies:
  freezed: ^2.4.0
  build_runner: ^2.4.0
  flutter_test:
  mockito: ^5.4.0
  bloc_test: ^9.1.0
```

## Agents Involved
- flutter-architect: Project structure
- ui-designer: Theme and components
- state-manager: Riverpod setup
