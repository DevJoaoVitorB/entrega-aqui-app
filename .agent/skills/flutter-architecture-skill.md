# Flutter Architecture

## Contents

* Architectural Principles
* Project Structure
* Layer Responsibilities
* Dependency Flow
* Feature Development Workflow
* Code Organization Rules

---

# Architectural Principles

The application must follow a clear separation of responsibilities.

Each layer should have a single purpose and should not perform responsibilities belonging to another layer.

The architecture should prioritize:

* Readability
* Maintainability
* Reusability
* Scalability

Prefer simple solutions and avoid unnecessary abstractions.

---

# Project Structure

Organize the project using the following structure:

```text
lib/
├── core/
├── models/
├── providers/
├── services/
├── screens/
├── widgets/
├── routes/
└── main.dart
```

As the application grows, additional folders may be introduced without breaking the existing structure.

---

# Layer Responsibilities

## Models

Models represent application data.

Rules:

* Store data only.
* Do not contain UI code.
* Do not contain presentation logic.
* Keep models independent from widgets.

Examples:

* User
* Product
* Address
* Order

---

## Services

Services encapsulate operations and integrations.

Rules:

* Handle external integrations.
* Handle isolated business operations.
* Remain independent from UI.
* Avoid direct widget dependencies.

Services should be reusable across multiple features.

---

## Providers

Providers manage shared application state.

Rules:

* Expose state to the UI.
* Coordinate interactions between Services and Screens.
* Notify state changes.
* Keep state centralized.

Providers should not contain UI code.

---

## Screens

Screens represent application pages.

Rules:

* Compose the user interface.
* Consume application state.
* Delegate processing to Providers and Services.
* Avoid complex logic.

Screens should focus on presentation and user interaction.

---

## Widgets

Widgets are reusable UI components.

Rules:

* Encapsulate reusable visual elements.
* Have a single responsibility.
* Be configurable through parameters.
* Remain independent from feature-specific logic whenever possible.

Prefer composition over duplication.

---

# Dependency Flow

Dependencies must follow this direction:

```text
Screens
    ↓
Providers
    ↓
Services
    ↓
Models
```

Rules:

* Screens may consume Providers.
* Providers may use Services.
* Services may use Models.
* Models must not depend on higher layers.

Avoid circular dependencies.

---

# Feature Development Workflow

When implementing a new feature:

### Task Progress

* [ ] Create required Models.
* [ ] Create or update Services.
* [ ] Create or update Providers.
* [ ] Create reusable Widgets if necessary.
* [ ] Implement Screens.
* [ ] Connect dependencies.
* [ ] Validate architecture consistency.

Follow the workflow sequentially.

---

# Code Organization Rules

Always:

* Keep files focused on a single responsibility.
* Prefer small and readable classes.
* Extract reusable components.
* Use meaningful names.
* Organize code according to the defined structure.

Avoid:

* Large files with multiple responsibilities.
* Business logic inside UI components.
* Duplicate implementations.
* Tight coupling between layers.
* Direct communication between unrelated layers.

---

# Scalability Guidelines

New features should extend the existing architecture instead of creating parallel structures.

Before creating new folders, classes or layers:

1. Verify if an existing component can be reused.
2. Verify if the responsibility belongs to an existing layer.
3. Maintain consistency with the established architecture.

Architecture decisions should favor long-term maintainability over short-term convenience.
