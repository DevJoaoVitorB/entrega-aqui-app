# Flutter Navigation

## Contents

* Navigation Principles
* Route Organization
* Route Definitions
* Navigation Flow
* Parameter Passing
* Returning Data
* Nested Navigation
* Bottom Navigation
* Navigation Rules

---

# Navigation Principles

Navigation must be centralized, predictable and maintainable.

All routes should be declared in a dedicated routing configuration instead of being scattered throughout the application.

The navigation system should support:

* Navigation between screens
* Parameter passing
* Returning values
* Nested navigation
* Deep linking compatibility
* Independent navigation stacks when required

---

# Route Organization

Keep navigation configuration separate from UI components.

Preferred structure:

```text id="7cuhp6"
lib/
├── routes/
│   ├── app_router.dart
│   ├── route_names.dart
│   └── route_paths.dart
```

Responsibilities:

### app_router.dart

Responsible for:

* Router configuration
* Route registration
* Nested route configuration
* Redirect rules

### route_names.dart

Responsible for:

* Route name constants

### route_paths.dart

Responsible for:

* Route path constants

Avoid hardcoded route names inside widgets.

---

# Route Definitions

Routes should be defined centrally.

Rules:

* Every screen must have a registered route.
* Route names should be unique.
* Route paths should remain consistent.
* Route definitions should be reusable.

Example:

```text id="0zh4ak"
/
├── home
├── profile
├── settings
└── details
```

Avoid defining routes directly inside screens.

---

# Navigation Flow

Navigation should follow clear user flows.

Rules:

* Screens should navigate through route names or route paths.
* Navigation logic should remain simple.
* Avoid deeply nested navigation calls.

Prefer:

```text id="4t9vnv"
Screen A
    ↓
Screen B
    ↓
Screen C
```

Over:

```text id="k35gnh"
Screen A
    ↓
Screen B
    ↓
Screen C
    ↓
Screen D
    ↓
Screen E
```

when not necessary.

---

# Parameter Passing

Routes should support strongly typed parameters whenever possible.

Parameters may be used for:

* IDs
* Objects
* Filters
* Search terms

Rules:

* Validate required parameters.
* Avoid excessive parameter passing.
* Prefer passing identifiers when possible.

Example use cases:

```text id="crpzhm"
Product Details
User Profile
Order Details
```

---

# Returning Data

Screens may return data to previous screens.

Examples:

```text id="v47y1h"
Selection screens
Edit screens
Creation forms
Confirmation flows
```

Rules:

* Returning data should be explicit.
* Returned values should be validated.
* Keep return contracts predictable.

---

# Nested Navigation

Applications may contain nested navigation flows.

Examples:

```text id="bms9c3"
Bottom Navigation
Tabbed Interfaces
Feature-specific navigation stacks
```

Rules:

* Each navigation stack should remain independent.
* Preserve navigation history whenever possible.
* Avoid sharing navigation state between unrelated stacks.

---

# Bottom Navigation

When using Bottom Navigation:

Requirements:

* Maintain independent navigation history per tab.
* Preserve screen state while switching tabs.
* Avoid rebuilding entire navigation trees unnecessarily.

Preferred behavior:

```text id="n6n35o"
Tab A
    ├── Screen 1
    └── Screen 2

Tab B
    ├── Screen 1
    └── Screen 2
```

Switching tabs should not reset navigation history.

---

# Navigation Rules

Always:

* Centralize route definitions.
* Use route constants.
* Keep navigation predictable.
* Preserve navigation state when appropriate.
* Support parameter passing.
* Support returning values.

Avoid:

* Hardcoded route strings throughout the codebase.
* Duplicate route definitions.
* Navigation logic mixed with business logic.
* Deeply coupled navigation flows.
* Global navigation hacks.

---

# Scalability Guidelines

As the application grows:

* Add routes through the centralized router.
* Group related routes together.
* Keep route naming consistent.
* Maintain independent navigation stacks for complex flows.

The navigation architecture should support future screens and features without requiring structural changes.
