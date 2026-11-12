# Campus Hub

A Flutter campus management app featuring task management, student profiles,
responsive widget examples, and an embedded Flutter website.

## Features

- Animated, two-second splash screen.
- Named-route navigation through the drawer: Home, Explore, Profile, and UI
  Showcase.
- In-memory task list with add-task and task-detail screens.
- Interactive animated welcome card.
- Responsive Flutter widget gallery and an HTTPS WebView.

## Run

```shell
flutter pub get
flutter run
```

The UI Showcase requires an internet connection to load its sample image and
embedded website. Tasks are stored in memory and reset when the app restarts.

## Structure

- `lib/main.dart`, `lib/app.dart` - Entry point, shared task repository, and routes.
- `lib/core/` - App theme and route names.
- `lib/feature/core/presentation/` - Shared navigation drawer.
- `lib/feature/home/` - Home, Explore, and task management.
- `lib/feature/profile/` - Student profile screen.
- `lib/feature/showcase/` - Widget gallery and WebView.
- `lib/feature/splash/` - Animated launch screen.