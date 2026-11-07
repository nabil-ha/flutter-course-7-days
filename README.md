# Flutter Course: 7 Days

A hands-on Flutter course that builds one app, a **project management app** with clients, projects, quotations and role-based dashboards, step by step over 7 days.

Each `day_N` folder is a complete Flutter project showing the app at the end of that day, so you can open any day and run it on its own, or compare two days to see exactly what changed.

## What each day covers

| Day | Topic | What gets built |
|---|---|---|
| [Day 1](day_1) | Dart & Flutter basics | `User` and `Project` models, a first client dashboard screen |
| [Day 2](day_2) | Navigation & multiple screens | Login page, role-based dashboards (admin, operations, client), project details page |
| [Day 3](day_3) | Forms & user input | Create-project page, a reusable multi-step stepper form, `Client` model |
| [Day 4](day_4) | State management & networking | `provider` for app state (users, projects, data), `dio` HTTP client against a demo REST API |
| [Day 5](day_5) | File upload & business workflows | File picking and upload, documents, project workflow stepper, client PO section, sales and client actions, request logging |
| [Day 6](day_6) | Localization & notifications | Arabic/English with `flutter_localizations` and ARB files, language switching, quotations, local notifications |
| [Day 7](day_7) | Polish & structure | Refactored language provider, shared UI helpers, app launcher icons |

## Running a day

```bash
cd day_6
flutter pub get
flutter run
```

The networking examples use public demo APIs ([restful-api.dev](https://restful-api.dev) and the [Platzi Fake Store API](https://fakeapi.platzi.com/)), so no backend or API keys are needed.

## Packages used

`provider` · `dio` · `pretty_dio_logger` · `file_picker` · `flutter_localizations` · `flutter_local_notifications` · `timezone` · `flutter_launcher_icons`

## Author

Built and taught by [Nabil Hamwi](https://github.com/nabil-ha).
