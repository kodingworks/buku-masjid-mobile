# Buku Masjid Mobile

Buku Masjid Mobile is a mobile application open source for managing mosque registries.

## Installation

To use Buku Masjid Mobile [Flutter](https://docs.flutter.dev/get-started/install), you need to have Flutter version 3.3.0 or higher installed on your system.

### Clone the repository:

You can clone the repository using either SSH or HTTPS:

```sh
git clone git@github.com:kodingworks/buku-masjid-mobile.git

#or

git clone https://github.com/kodingworks/buku-masjid-mobile.git
```

### Fetch the necessary packages

After cloning the repository, navigate into the project directory and run the following command to fetch the necessary dependencies:

```sh
flutter pub get
```

### Launching with Different Environments

Buku Masjid Mobile supports launching with different environments using flavors.

```sh
# Development
flutter run -t lib/main_development.dart --flavor development

# Staging
flutter run -t lib/main_staging.dart --flavor staging

# Production
flutter run -t lib/main_production.dart --flavor production
```

### Building APKs with Different Environments

You can also build APKs with different environments:

```sh
# Development
flutter build apk -t lib/main_development.dart --flavor development

# Staging
flutter build apk -t lib/main_staging.dart --flavor staging

# Production
flutter build apk -t lib/main_production.dart --flavor production
```

## Configuration Setup

Configure your application and API settings in `lib/app/config.dart`:

```sh
static FlavorConfig<String> baseUrl = const FlavorConfig<String>(
   /// Base URL in Production Mode
   production: 'YOUR_PRODUCTION_BASE_URL',

   /// Base URL in Development Mode
   development: 'YOUR_DEVELOPMENT_BASE_URL',

   /// Base URL in Staging/Sandbox Mode
   staging: 'YOUR_STAGING_BASE_URL',
);
```

## Running Test

To execute all unit and widget tests, use the following command:

```sh
   flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report, you can use [lcov]:

```sh
   # Generate Coverage Report
   genhtml coverage/lcov.info -o coverage/

   # Open Coverage Report
   open coverage/index.html
```

## Working with Translations

This project relies on `flutter_localizations` and follows the official internationalization guide for Flutter.

### Adding Localizable Strings

To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb` and follow these steps:

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

### Use the new string

After adding the new string, you can use it in your code like this:

```dart
import 'package:hsiedu/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale:

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>es</string>
	</array>

    ...
```

### Adding Translations

For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
```

Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

`app_es.arb`

```arb
{
    "@@locale": "es",
    "counterAppBarTitle": "Contador",
    "@counterAppBarTitle": {
        "description": "Texto mostrado en la AppBar de la página del contador"
    }
}
```

## Packages

Buku Masjid Mobile is currently expanded with the following packages.
Instructions on how to use them in your own app are linked below:

| Package | README |
| ------ | ------ |
| flutter_bloc | https://pub.dev/packages/flutter_bloc |
| bloc_concurrency | https://pub.dev/packages/bloc_concurrency |
| dio | https://pub.dev/packages/dio |
| dartz | https://pub.dev/packages/dartz |
| equatable | https://pub.dev/packages/equatable |
| get_it | https://pub.dev/packages/get_it |
| hive | https://pub.dev/packages/hive |
| intl | https://pub.dev/packages/intl |
| internet_connection_checker | https://pub.dev/packages/internet_connection_checker |
| json_annotation | https://pub.dev/packages/json_annotation |
| path_provider | https://pub.dev/packages/path_provider |
| stream_transformer | https://pub.dev/packages/stream_transformer |
