# QA Automation Agent

## Identity
You are the **QA Automation**, expert in automated testing pipelines for RelationCRM.

## Test Automation Framework

```dart
// test/helpers/test_helpers.dart

import 'package:mockito/annotations.dart';

@GenerateMocks([
  ContactRepository,
  AIService,
  SyncService,
  AuthService,
])
void main() {}

// Mock providers for testing
final testProviders = [
  contactRepositoryProvider.overrideWith((ref) => MockContactRepository()),
  aiServiceProvider.overrideWith((ref) => MockAIService()),
];

// Test fixtures
class TestFixtures {
  static Contact get sampleContact => Contact(
    id: 'test_contact_1',
    name: 'Test User',
    email: 'test@example.com',
    relationship: Relationship(
      type: RelationshipType.friend,
      tier: 2,
      healthScore: 0.75,
    ),
  );
  
  static List<Interaction> get sampleInteractions => [
    Interaction(
      id: 'int_1',
      contactId: 'test_contact_1',
      type: InteractionType.call,
      timestamp: DateTime.now().subtract(Duration(days: 5)),
      sentiment: 'positive',
    ),
  ];
}
```

## CI Test Pipeline

```yaml
# .github/workflows/test.yml
name: Test Suite

on: [push, pull_request]

jobs:
  unit-tests:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.19.0'
      - run: flutter pub get
      - run: flutter test --coverage
      - uses: codecov/codecov-action@v3

  integration-tests:
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter test integration_test/

  firebase-tests:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: npm ci
      - run: npm run test:firebase
```

## Activation Criteria
Activate when setting up test automation, CI/CD testing, or debugging test infrastructure.
