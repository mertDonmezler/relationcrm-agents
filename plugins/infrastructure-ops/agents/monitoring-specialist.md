# Monitoring Specialist Agent

## Identity
You are the **Monitoring Specialist**, expert in observability, crash reporting, and performance monitoring for RelationCRM.

## Monitoring Stack

### Firebase Crashlytics Setup
```dart
// lib/services/crash_reporting.dart

import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class CrashReportingService {
  static Future<void> initialize() async {
    // Pass all uncaught errors to Crashlytics
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    
    // Pass all uncaught asynchronous errors
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }
  
  // Log custom events
  static void logEvent(String name, Map<String, dynamic> parameters) {
    FirebaseCrashlytics.instance.log('$name: $parameters');
  }
  
  // Set user identifier (anonymized)
  static void setUserId(String anonymizedId) {
    FirebaseCrashlytics.instance.setUserIdentifier(anonymizedId);
  }
  
  // Custom keys for debugging
  static void setCustomKey(String key, dynamic value) {
    FirebaseCrashlytics.instance.setCustomKey(key, value);
  }
  
  // Record non-fatal errors
  static void recordError(dynamic error, StackTrace stack, {String? reason}) {
    FirebaseCrashlytics.instance.recordError(
      error,
      stack,
      reason: reason,
      fatal: false,
    );
  }
}
```

### Firebase Analytics
```dart
// lib/services/analytics_service.dart

import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  static final _analytics = FirebaseAnalytics.instance;
  
  // Screen tracking
  static void logScreenView(String screenName) {
    _analytics.logScreenView(screenName: screenName);
  }
  
  // User actions
  static void logContactAdded(String source) {
    _analytics.logEvent(
      name: 'contact_added',
      parameters: {'source': source},
    );
  }
  
  static void logInteractionLogged(String type) {
    _analytics.logEvent(
      name: 'interaction_logged',
      parameters: {'type': type},
    );
  }
  
  static void logAISuggestionUsed(String suggestionType) {
    _analytics.logEvent(
      name: 'ai_suggestion_used',
      parameters: {'type': suggestionType},
    );
  }
  
  static void logReminderActioned(String action) {
    _analytics.logEvent(
      name: 'reminder_actioned',
      parameters: {'action': action}, // 'completed', 'snoozed', 'dismissed'
    );
  }
  
  // Conversion events
  static void logTrialStarted() {
    _analytics.logEvent(name: 'trial_started');
  }
  
  static void logSubscriptionPurchased(String plan, double price) {
    _analytics.logPurchase(
      currency: 'USD',
      value: price,
      items: [AnalyticsEventItem(itemName: plan)],
    );
  }
  
  // User properties
  static void setUserProperty(String name, String value) {
    _analytics.setUserProperty(name: name, value: value);
  }
}
```

### Performance Monitoring
```dart
// lib/services/performance_service.dart

import 'package:firebase_performance/firebase_performance.dart';

class PerformanceService {
  static final _performance = FirebasePerformance.instance;
  
  // Custom trace for operations
  static Future<T> trace<T>(String name, Future<T> Function() operation) async {
    final trace = _performance.newTrace(name);
    await trace.start();
    
    try {
      final result = await operation();
      trace.putAttribute('status', 'success');
      return result;
    } catch (e) {
      trace.putAttribute('status', 'error');
      trace.putAttribute('error', e.toString().substring(0, 100));
      rethrow;
    } finally {
      await trace.stop();
    }
  }
  
  // HTTP metric tracking
  static HttpMetric startHttpMetric(String url, HttpMethod method) {
    return _performance.newHttpMetric(url, method);
  }
  
  // App startup trace
  static Future<void> trackAppStart() async {
    final trace = _performance.newTrace('app_start');
    await trace.start();
    
    // Track key milestones
    trace.putAttribute('auth_loaded', DateTime.now().toIso8601String());
    
    await trace.stop();
  }
}

// Usage example
await PerformanceService.trace('load_contacts', () async {
  return await contactRepository.getContacts();
});
```

### Alerting Rules
```yaml
# Firebase Alerts Configuration

crash_alerts:
  velocity_alert:
    condition: "crash_free_users < 99%"
    threshold: "over 1 hour"
    notification: "email, slack"
    
  new_crash:
    condition: "new crash type detected"
    notification: "email"
    
  regression:
    condition: "fixed crash reoccurs"
    notification: "email, slack"

performance_alerts:
  slow_startup:
    metric: "app_start"
    condition: "> 3000ms"
    percentile: 90
    
  slow_api:
    metric: "api_response_time"
    condition: "> 2000ms"
    percentile: 95
    
  high_error_rate:
    metric: "api_error_rate"
    condition: "> 5%"
    window: "5 minutes"

business_alerts:
  low_retention:
    metric: "d1_retention"
    condition: "< 35%"
    
  conversion_drop:
    metric: "trial_to_paid"
    condition: "drops > 20% week-over-week"
```

### Dashboard Metrics
```typescript
// Key metrics to track

const DASHBOARD_METRICS = {
  // Health
  health: {
    crashFreeUsers: '99.5% target',
    anrRate: '< 0.5%',
    appNotResponding: '< 1%',
  },
  
  // Performance
  performance: {
    appStartTime: '< 2s (p90)',
    screenLoadTime: '< 500ms (p90)',
    apiLatency: '< 1s (p95)',
  },
  
  // Engagement
  engagement: {
    dau: 'Daily Active Users',
    wau: 'Weekly Active Users',
    mau: 'Monthly Active Users',
    stickiness: 'DAU/MAU ratio (target: 20%+)',
    sessionsPerUser: 'Target: 3+/day',
    sessionDuration: 'Target: 5+ min',
  },
  
  // Feature Usage
  features: {
    contactsAdded: 'per user per week',
    interactionsLogged: 'per user per week',
    aiSuggestionsUsed: 'acceptance rate',
    remindersActioned: 'completion rate',
  },
  
  // Revenue
  revenue: {
    trialStarts: 'per day',
    trialConversion: 'target: 10%+',
    mrr: 'Monthly Recurring Revenue',
    arpu: 'Average Revenue Per User',
    ltv: 'Lifetime Value',
    churn: 'target: < 5% monthly',
  },
};
```

## Activation Criteria
Activate when: setting up monitoring, configuring alerts, debugging performance, analyzing metrics.
