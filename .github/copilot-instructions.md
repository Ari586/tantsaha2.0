# Copilot Instructions for Tantsaha (Akoho Tech)

## Project Overview
- **Tantsaha** is a Flutter app for Malagasy farmers, focused on managing livestock and agriculture (akoho, bitro, kisoa, trondro, tantely, olitra, zezika, fambolena).
- The app uses Firebase and Supabase for backend services, with local storage via `shared_preferences` and file operations via `path_provider`.
- The design system is defined in `lib/pages/tombony_analyzer_page.dart` (see `AppColors` and theme setup).

## Key Architecture & Patterns
- **Entry Point:** `lib/main.dart` initializes Firebase and Supabase, then runs `AkohoTechApp`.
- **Pages:** Main features are implemented as pages in `lib/pages/` (e.g., `tombony_analyzer_page.dart`, `supabase_test_page.dart`).
- **Data Model:** Domain models (e.g., `AgriItem`) and static data are defined in feature pages, not in a central model directory.
- **Theming:** Uses `google_fonts` and custom color classes for a consistent look.
- **Assets:** Images and icons are in `assets/images/` and referenced in `pubspec.yaml`.

## Developer Workflows
- **Build (Web):** Use `scripts/build_web.sh` to clone Flutter and build the web app. Output is in `build/web/`.
- **Analyze:** Run `flutter analyze` (task available in VS Code) for static analysis. Lint rules are in `analysis_options.yaml`.
- **Run:** Standard `flutter run` for local development.
- **Deploy (Vercel):** Web output is deployed via Vercel, configured in `vercel.json` to serve from `build/web/`.

## Integration & External Services
- **Firebase:** Configured in `lib/firebase_options.dart` (placeholder, replace with real config via `flutterfire configure`).
- **Supabase:** Initialized in `main.dart` (non-web only). Credentials are hardcoded for now.
- **Share:** Uses `share_plus` for sharing data.

## Project Conventions
- **No central state management:** State is managed locally in widgets/pages.
- **Data organization:** Domain data is often hardcoded in feature files (see `database` in `tombony_analyzer_page.dart`).
- **Lints:** Uses `flutter_lints` with some overrides in `analysis_options.yaml`.
- **Dependency overrides:** See `pubspec.yaml` for temporary fixes (e.g., `sign_in_with_apple`).

## Examples
- **Add a new crop:** Extend the `database` map in `tombony_analyzer_page.dart` with a new `AgriItem`.
- **Add a new page:** Create a Dart file in `lib/pages/`, then add a route in `main.dart`.

## Key Files & Directories
- `lib/main.dart` — App entry, backend init
- `lib/pages/` — Feature pages
- `lib/firebase_options.dart` — Firebase config
- `pubspec.yaml` — Dependencies, assets
- `analysis_options.yaml` — Lint rules
- `scripts/build_web.sh` — Web build script
- `vercel.json` — Vercel deployment config

---
For more, see the [Flutter docs](https://docs.flutter.dev/) and comments in each file. Update this file as project structure evolves.
