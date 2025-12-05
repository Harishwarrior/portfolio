# Portfolio Web App

A Flutter web portfolio application showcasing professional experience, education, and social links.

## Features

- Data-driven content from JSON configuration
- Responsive design with Material 3
- Work experience timeline
- Social media links with SVG icons
- Dynamic experience calculation
- Feature-first architecture with Riverpod state management

## Setup

```bash
# Install dependencies
fvm flutter pub get

# Run development server
fvm flutter run -d chrome

# Build for production
fvm flutter build web
```

## Project Structure (Feature-First Architecture)

```
lib/
├── main.dart                    # App entry point with Riverpod ProviderScope
└── features/
    └── portfolio/
        ├── data/                # Data layer
        │   ├── portfolio_service.dart
        │   └── timeline_service.dart
        ├── domain/              # Domain layer (models)
        │   ├── portfolio_model.dart
        │   └── timeline_model.dart
        ├── presentation/        # Presentation layer
        │   └── home_screen.dart
        └── providers/           # Riverpod providers
            ├── portfolio_provider.dart
            └── timeline_provider.dart
```

## Architecture

### Feature-First Organization

- **Data Layer**: Services for loading JSON data from assets
- **Domain Layer**: Data models and business logic
- **Presentation Layer**: UI components and screens
- **Providers Layer**: Riverpod state management and dependency injection

### Riverpod State Management

- Uses Riverpod Generator for code generation
- `portfolioDataProviderProvider` - Manages portfolio data loading
- `timelineDataProviderProvider` - Manages timeline data loading
- AsyncValue pattern for loading/error states

## Content Management

Edit `assets/data/portfolio.json` to update:

- Personal information
- Work experience
- Social links
- Availability status

## Dependencies

- Flutter 3.38.3
- google_fonts
- flutter_svg
- url_launcher
- flutter_riverpod
- riverpod_annotation
- riverpod_generator
- build_runner

## Development Workflow

```bash
# Generate Riverpod providers
fvm dart run build_runner build -d

# Run linter
fvm flutter analyze

# Run tests
fvm flutter test
```

## Key Features

1. **Riverpod Integration**: State management with dependency injection
2. **Feature Isolation**: Each feature has its own data, domain, presentation, and providers
3. **Code Generation**: Riverpod Generator creates type-safe providers
4. **Async State Handling**: Loading, error, and data states managed by Riverpod
5. **Clean Architecture**: Separation of concerns between layers
