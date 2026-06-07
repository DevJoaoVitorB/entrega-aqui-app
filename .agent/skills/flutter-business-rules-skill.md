# Business Rules Architecture

## Contents

* Business Rules Principles
* Rule Ownership
* Service Responsibilities
* Provider Responsibilities
* Validation Rules
* Calculation Rules
* Decision Rules
* Workflow
* Code Quality Rules
* Scalability Guidelines

---

# Business Rules Principles

Business rules define how the application behaves.

Business rules must be independent from:

* UI components
* Navigation
* External APIs
* Persistence mechanisms

Rules should remain reusable, testable and maintainable.

The same business rule should produce the same result regardless of where it is executed.

---

# Rule Ownership

Business rules belong to the application logic layer.

Rules should be implemented inside dedicated Services.

Preferred structure:

```text
lib/
├── services/
│   ├── business/
│   ├── validation/
│   └── calculations/
```

Examples:

* ValidationService
* PricingService
* ClassificationService
* BusinessRuleService

Avoid implementing business rules directly inside widgets.

---

# Service Responsibilities

Services are responsible for:

* Data validation
* Calculations
* Classifications
* Transformations
* Business decisions

Services should receive data and return results.

Services should not contain UI code.

---

# Provider Responsibilities

Providers coordinate business operations.

Responsibilities:

* Receive user actions
* Call Services
* Store results
* Notify UI changes

Providers should not contain complex business logic.

Preferred flow:

```text
User Action
      ↓
Provider
      ↓
Business Service
      ↓
Result
      ↓
Provider State
      ↓
UI Update
```

---

# Validation Rules

Validation logic should remain centralized.

Examples:

* Required fields
* Value ranges
* Format validation
* Cross-field validation

Requirements:

* Validation must be reusable.
* Validation should not be duplicated.
* Validation should be independent from UI components.

Avoid validating the same rule in multiple locations.

---

# Calculation Rules

Calculations should be isolated from presentation logic.

Examples:

* Totals
* Scores
* Estimates
* Statistics
* Pricing

Requirements:

* Calculations must be deterministic.
* Inputs should produce predictable outputs.
* Calculations should be reusable.

Avoid calculations directly inside widgets.

---

# Decision Rules

Decision rules determine application behavior.

Examples:

* Status transitions
* User permissions
* Classifications
* Eligibility checks
* Conditional flows

Requirements:

* Decisions must be centralized.
* Logic should remain transparent.
* Rules should be easy to update.

Avoid scattering decision logic across multiple files.

---

# Rule Composition

Complex business operations may combine multiple rules.

Example:

```text
Validation
      ↓
Classification
      ↓
Calculation
      ↓
Result
```

Each rule should remain independent and reusable.

Prefer composition over large monolithic methods.

---

# Workflow

When introducing a new business rule:

### Task Progress

* [ ] Define the rule.
* [ ] Identify required inputs.
* [ ] Identify expected outputs.
* [ ] Create or update Service.
* [ ] Implement validation logic.
* [ ] Implement calculation or decision logic.
* [ ] Connect Provider.
* [ ] Expose results to UI.
* [ ] Validate behavior.

---

# Code Quality Rules

Always:

* Centralize business rules.
* Keep rules reusable.
* Use descriptive method names.
* Keep methods focused on a single responsibility.
* Return predictable results.

Avoid:

* Business logic inside widgets.
* Duplicated rules.
* Hardcoded decisions scattered across the application.
* Mixing validation and UI concerns.
* Mixing business logic and navigation logic.

---

# Testing Considerations

Business rules should be easy to test independently.

Rules should:

* Receive inputs.
* Process logic.
* Return outputs.

The result should not depend on UI state or widget lifecycle.

---

# Scalability Guidelines

As the application grows:

* Add new rules through Services.
* Reuse existing rules whenever possible.
* Keep responsibilities separated.
* Avoid creating large "God Services".

Business logic should remain centralized, predictable and independent from the presentation layer.
