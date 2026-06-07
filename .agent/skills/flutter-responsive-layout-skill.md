# Flutter Responsiveness

## Contents

* Responsive Design Principles
* Layout Strategy
* LayoutBuilder Usage
* Adaptive Layout Rules
* Sizing Guidelines
* Spacing Guidelines
* Widget Composition
* Screen Size Adaptation
* Responsiveness Checklist

---

# Responsive Design Principles

All user interfaces must adapt gracefully to different screen sizes and orientations.

The goal is to maximize usability and maintain visual consistency across devices.

Layouts should respond to available space rather than relying on fixed dimensions.

Prioritize flexibility over pixel-perfect positioning.

---

# Layout Strategy

Build layouts using Flutter's adaptive layout widgets.

Prefer:

* Row
* Column
* Expanded
* Flexible
* Wrap
* LayoutBuilder
* SingleChildScrollView

These widgets should form the foundation of responsive layouts.

Avoid using fixed sizes unless absolutely necessary.

---

# LayoutBuilder Usage

Use LayoutBuilder whenever the layout must change based on available space.

Typical use cases:

* Reorganizing content
* Switching between horizontal and vertical layouts
* Adjusting grid structures
* Modifying widget density

Layout decisions should be based on available width rather than specific device models.

---

# Adaptive Layout Rules

When screen width is limited:

* Prioritize vertical layouts.
* Stack content using Column.
* Allow scrolling when necessary.

When more horizontal space is available:

* Use Row layouts where appropriate.
* Distribute content using Expanded.
* Reduce unnecessary scrolling.

Layout changes should improve usability rather than simply rearranging widgets.

---

# Sizing Guidelines

Prefer:

```dart id="a4mf9j"
Expanded()
Flexible()
MediaQuery
LayoutBuilder
```

Avoid:

```dart id="rjlwmw"
width: 350
height: 600
```

unless a fixed dimension is required by the design.

Components should adapt to available space whenever possible.

---

# Spacing Guidelines

Use consistent spacing throughout the application.

Prefer:

```dart id="4imw7r"
Padding
SizedBox
EdgeInsets
```

Avoid:

* Arbitrary spacing values.
* Inconsistent margins.
* Nested padding structures that create excessive complexity.

Spacing should scale naturally with layout changes.

---

# Widget Composition

Build interfaces from adaptable components.

Rules:

* Widgets should be reusable.
* Widgets should not assume a fixed width.
* Widgets should not assume a fixed height.
* Widgets should adapt to their parent constraints.

Reusable widgets must remain responsive regardless of where they are used.

---

# Screen Size Adaptation

Interfaces should adapt according to available space.

Examples:

## Small Screens

Prefer:

```text id="fzmvza"
Column
ListView
SingleChildScrollView
```

## Medium Screens

Prefer:

```text id="77v5wz"
Mixed layouts
Expanded sections
Responsive cards
```

## Large Screens

Prefer:

```text id="i1q3mp"
Multiple columns
Side-by-side content
Grid layouts
```

The focus should be on available space rather than device categories.

---

# Responsiveness Checklist

Before completing a screen:

* [ ] No unnecessary fixed dimensions.
* [ ] Layout adapts to available width.
* [ ] Content remains accessible on smaller screens.
* [ ] Overflow issues are prevented.
* [ ] Scrolling is handled appropriately.
* [ ] LayoutBuilder is used when adaptive behavior is required.
* [ ] Expanded and Flexible are used appropriately.
* [ ] Spacing remains consistent.

---

# Responsiveness Rules

Always:

* Design for multiple screen sizes.
* Use Flutter layout widgets effectively.
* Adapt layouts using constraints.
* Prefer flexible sizing.

Avoid:

* Fixed layouts.
* Device-specific assumptions.
* Hardcoded screen dimensions.
* Layouts that overflow on smaller screens.

The user experience should remain functional and visually organized regardless of screen size.
