# NuConta Marketplace

A Flutter app where users spend their NuConta balance on awesome products.

# Preview

![NuConta%20Marketplace%20663d3dc4087a4534943e3674a05f9ae7/Screenrecorder-2020-06-21-20-06.gif](NuConta%20Marketplace%20663d3dc4087a4534943e3674a05f9ae7/Screenrecorder-2020-06-21-20-06.gif)

# Call flow

![NuConta%20Marketplace%20663d3dc4087a4534943e3674a05f9ae7/call_flow.jpg](NuConta%20Marketplace%20663d3dc4087a4534943e3674a05f9ae7/call_flow.jpg)

# Code Structure

```
project
├───lib
│   ├───assets         # All assets as images, animations and icons
│   ├───components     # Some custom widgets created during the development
│   ├───feature        # folder used to separate project features
│   │   ├───home       # home feature, screens and support classes
│   │   └───product    # product feature, screens and support classes
│   ├───model          # data models used in the project
│   ├───network        # classes related to APIs and network connections
│   │   └───query      # query and mutation for GraphQL requests
│   ├───repository     # all repository classes
│   ├───shared         # colors, enun=ms and styles used in project
│   └───utils          # text formatters, device utils and dependency Injection
├───screenshots        # folder created when run instrumented tests
├───test               # folder for unit, widget tests
│   ├───components     
│   ├───model          
│   ├───repository     
│   └───utils          
└───test_driver        # folder for instrumentation tests
```

# Libs

## [MobX](https://pub.dev/packages/mobx)

Is a popular state management library for Dart and Flutter apps. It has also been recognized as a [Flutter Favorite package](https://flutter.dev/docs/development/packages-and-plugins/favorites).

MobX embraces an approach often called Declarative MVVM, since I developed for Android before Flutter, this approach remembers me much with Android Jetpack components as Live Datas, ViewModel and so on.

**Pros** 

- Simple to learn and less boilerplate
- Easy to test
- Good performance
- Good documentation and standards

**Cons**

- Code generation slow and some time stops

## [get_it](get_it)

This is a simple **Service Locator** for Dart and Flutter projects with some additional goodies highly inspired by **[Splat](https://github.com/reactiveui/splat)**. It can be used instead of `InheritedWidget` or `Provider` to access objects e.g. from your UI.

Typical usage:

- Accessing service objects like REST API clients, databases so that they easily can be mocked.
- Accessing View/AppModels/Managers/BLoCs from Flutter Views

**Pros** 

- Can request type anywhere using the global locator
- Instance tracking is automatically taken care of by registering types as Factories or Singleton
- Can register types against interfaces and abstract your architecture from the implementation details
- Compact setup code with minimal boilerplate

**Cons**

- Disposing is not a top priority in the framework
- Loose coding guidelines that can lead to badly written software
- Global object usage which is the start of multi-directional data flow which is the opposite of what Flutter promotes

## [GraphQL](https://pub.dev/packages/graphql)

GraphQL Client for flutter.

Used in this project due to the requirement to interface with a Nubank GraphQL server.

## [Dartz](https://pub.dev/packages/dartz)

Include support to functional programming paradigms in dart.

I used this package in this project to handle network responses with the class `Either` , it makes the development much simpler.

## [Intl](https://pub.dev/packages/intl)

This package provides internationalization and localization facilities, including message translation, plurals and genders, date/number formatting and parsing, and bidirectional text.

## [Lottie](https://pub.dev/packages/lottie)

Lottie is a mobile library for Android and iOS that parses Adobe After Effects animations exported as json with Bodymovin and renders them natively on mobile.

All the animations used in this project was acquired on [https://lottiefiles.com/](https://lottiefiles.com/).

# Tests

## Unit and Widget tests

It was developed some test codes in order to ensure a minimal code quality.

Run the following command from the root of the project:

```
flutter test
```

## Instrumentation tests

It was developed some instrumentations tests in order to check the navigations.

Run the following command from the root of the project:

```
flutter drive --target=test_driver/app.dart
```

## Test coverage

A simple command-line tool to collect test coverage information from Dart VM tests. It is useful if you need to generate coverage reports locally during development.

Run the following command from the root of the project:

```
flutter test --coverage
```

Result is saved in `coverage/lcov.info`. If you have `lcov` tool installed on your system (for Mac it's `brew install lcov`) you can generate coverage reports using `genhtml` command:

```
genhtml -o coverage coverage/lcov.info
# Open in the default browser (mac):
open coverage/index.html
```