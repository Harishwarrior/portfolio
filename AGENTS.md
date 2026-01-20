# AGENTS.md

This file provides guidance to AI agents when working with code in this repository.

## Project Overview

This is a Flutter web portfolio application showcasing professional experience, education, and social links. The app is data-driven, loading all content from a JSON configuration file, making it easy to update without code changes.

## Development Setup

### Flutter Version Management

- Uses FVM (Flutter Version Manager) with Flutter SDK 3.38.3
- Pin is defined in `.fvm/fvm_config.json`
- Use `fvm flutter` instead of `flutter` for all commands

### Common Commands

```bash
# Install dependencies
fvm flutter pub get

# Run the app (web)
fvm flutter run -d chrome

# Build for web production
fvm flutter build web

# Run linting
fvm flutter analyze

# Run tests
fvm flutter test

# Run a specific test file
fvm flutter test test/widget_test.dart
```

## Architecture

### Directory Structure

```text
lib/
├── main.dart                    # App entry point, theme configuration
├── models/
│   └── portfolio_model.dart     # Data models: PortfolioData, WorkExperience, SocialLink
├── services/
│   └── portfolio_service.dart   # Service to load JSON data from assets
└── screens/
    └── home_screen.dart         # Main portfolio screen with all UI components
```

### Key Design Patterns

**Data Flow:**

1. `PortfolioService.loadPortfolioData()` reads from `assets/data/portfolio.json`
2. JSON is parsed into strongly-typed models (`PortfolioData`, `WorkExperience`, `SocialLink`)
3. `HomeScreen` uses `FutureBuilder` to handle async data loading
4. UI components receive data via constructor parameters

**Component Structure:**

- `HomeScreen` is the main stateful widget containing all sections
- Private widget classes (`_TimelineItem`, `_SocialLinkCard`) are defined in the same file for encapsulation
- Hover states are managed with `MouseRegion` and local state

### Theme and Styling

- Material 3 design with custom color scheme defined in `main.dart`
- Primary color: `#E8F54D` (lime yellow)
- Secondary color: `#1A1A1A` (dark gray)
- Uses Google Fonts (Inter) throughout
- Responsive design with `ConstrainedBox` for max-width sections

### Dynamic Features

- Experience calculation: `_calculateExperience()` in `home_screen.dart:164` dynamically calculates years of experience from a hardcoded start date (August 2021)
- The `{experience}` placeholder in `portfolio.json` heroText is replaced at runtime

## Content Management

All portfolio content is in `assets/data/portfolio.json`. To update:

1. Edit the JSON file directly (no code changes needed)
2. Supported fields:
   - `name`: Full name displayed in header and footer
   - `availabilityBadge`: Status badge text (e.g., "Available for hire")
   - `heroText`: Main headline (supports `{experience}` placeholder)
   - `availabilityMessage`: Footer availability message
   - `profileImage`: Asset path to profile photo
   - `workExperience`: Array of work/education entries with timeline display
   - `socialLinks`: Array of social media links with SVG icons

3. Icon system:
   - Work experience uses Material Icons (`Icons.business` or `Icons.school`)
   - Social links require SVG files in `assets/icons/` (e.g., `linkedin.svg`, `github.svg`, `x.svg`)

## Dependencies

Key packages:

- `google_fonts`: Typography (Inter font family)
- `flutter_svg`: SVG icon rendering for social links
- `url_launcher`: External link handling
- `animated_text_kit`: Text animations (imported but may not be actively used)
- `flutter_animate`: General animations (imported but may not be actively used)

## Web Deployment

Built artifacts go to `build/web/`. The app includes:

- `web/manifest.json`: PWA configuration
- Assets are bundled into `build/flutter_assets/`
