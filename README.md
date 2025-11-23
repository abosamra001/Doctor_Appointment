# Doctor Appointment App

A new Flutter project for booking doctor appointments and managing patient follow-ups.

## 📌 System design
```
lib/
├── core/
│   ├── di/            # Dependency Injection setup
│   ├── networking/    # API services, clients, interceptors
│   ├── routing/       # App routing, navigation helpers
│   ├── helpers/       # Utilities, extensions, shared logic
│   ├── theming/       # App themes, colors, typography
│   └── widgets/       # Reusable UI components
│
└── features/
    └── home/
        ├── data/
        │   ├── model/  # Data models (DTO / entities)
        │   └── repo/   # Repositories & data sources
        │
        ├── logic/
        │   ├── cubit/  # State management (Cubit)
        │   └── states/ # Cubit state definitions
        │
        └── ui/
            ├── screens/ # Screens & pages of the feature
            └── widgets/ # Feature-specific UI components
```
