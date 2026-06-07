# Flutter State Management

## Contents

* State Management Principles
* State Organization
* Provider Responsibilities
* UI Responsibilities
* State Update Flow
* Shared State Rules
* Feature Development Workflow
* Code Quality Rules

---

# State Management Principles

Application state must be centralized, predictable and easy to maintain.

Use:

* Provider
* ChangeNotifier

The architecture should separate:

* UI rendering
* State management
* Business operations

State should be the single source of truth for the application.

---

# State Organization

Organize state management using dedicated Provider classes.

Preferred structure:

```text
lib/
├── providers/
│   ├── auth_provider.dart
│   ├── settings_provider.dart
│   └── feature_provider.dart
```

Each Provider should manage a single domain or feature.

Avoid creating large providers responsible for unrelated concerns.

---

# Provider Responsibilities

Providers are responsible for:

* Holding shared state
* Updating state
* Exposing state to the UI
* Coordinating interactions with Services

Providers should:

* Extend ChangeNotifier
* Expose public getters
* Keep internal state private
* Notify listeners after state changes

Example:

```dart
class ExampleProvider extends ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items;

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }
}
```

---

# UI Responsibilities

Widgets should consume state but should not own shared application state.

UI responsibilities:

* Display data
* Trigger actions
* React to state changes

Avoid:

* Duplicating Provider data in widgets
* Managing shared state through local variables
* Using stateful widgets for global application state

---

# State Update Flow

State changes should follow this flow:

```text
User Interaction
        ↓
Widget
        ↓
Provider Action
        ↓
State Update
        ↓
notifyListeners()
        ↓
UI Rebuild
```

Keep the flow predictable and easy to trace.

---

# Shared State Rules

Store in Providers:

* User session information
* Application settings
* Shared collections
* Dashboard data
* Feature state used by multiple widgets

Do not store in Providers:

* Temporary animation values
* Local widget-only state
* One-time UI interactions

Use local widget state only when the data is not shared.

---

# Provider Communication

Providers may consume Services.

Preferred flow:

```text
Widget
    ↓
Provider
    ↓
Service
    ↓
External Resource
```

Avoid:

```text
Widget
    ↓
Service
```

for shared application state.

Providers should act as the bridge between UI and business operations.

---

# State Exposure

Expose state through getters.

Example:

```dart
String _name = '';

String get name => _name;
```

Avoid exposing mutable internal structures directly.

When necessary, expose unmodifiable collections.

---

# Feature Development Workflow

When introducing new state:

### Task Progress

* [ ] Define required models.
* [ ] Create or update Services.
* [ ] Create or update Provider.
* [ ] Expose required state through getters.
* [ ] Implement update methods.
* [ ] Connect UI components.
* [ ] Validate reactive updates.
* [ ] Remove duplicated state.

---

# Consumer Usage

Use Provider consumers to rebuild only the required parts of the UI.

Prefer:

* Consumer
* Consumer2
* Selector

Avoid rebuilding entire screens when only a small section depends on state changes.

---

# Code Quality Rules

Always:

* Keep state private.
* Expose state through getters.
* Call notifyListeners() after updates.
* Maintain a single source of truth.
* Keep providers focused on a single responsibility.

Avoid:

* Business logic inside widgets.
* Multiple sources of truth.
* Global mutable variables.
* Massive providers with unrelated responsibilities.
* State duplication.

---

# Scalability Guidelines

As the application grows:

* Create new Providers for new domains.
* Keep Providers independent when possible.
* Reuse existing Providers before creating new ones.
* Maintain clear ownership of state.

State management should remain predictable regardless of application size.
