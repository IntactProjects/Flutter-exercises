# exo1

Flutter formation - exo 1

## Goals

- Add a new user to the list by entering his/her name
- Remove a user by swiping his/her entry in the list

Some constraints:
- The Add button should be disabled until a name is entered
- Typing a name then Enter should add the user to the list
- The input field should be cleared after the user has been added

## Guidelines

Use `UserRepository.get()` to retrieve a repository to manipulate users.

You can either use `UserRepository.getUsers()` to retrieve the current list of users, or `UserRepository.observeUsers()` if you want to try a reactive approach.

## Tests

Widget tests have been added to quickly check your implementation.

They can be run in the terminal with:
```
$ flutter test
``` 

[Widget tests](https://flutter.dev/docs/cookbook/testing/widget/introduction) are between Unit tests and Instrumentation tests. They are run headless and are useful to quickly check a behavior without needing an emulator or a device.

## Resources
Some useful widgets for this exercice are:
- [StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
- [StreamBuilder](https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html)
- [Dismissible](https://api.flutter.dev/flutter/widgets/Dismissible-class.html)

Flutter official documentation is quite good, here are some links that could be interesting:
- [Introduction to declarative UI](https://flutter.dev/docs/get-started/flutter-for/declarative)
- [Layouts in Flutter](https://flutter.dev/docs/development/ui/layout)
- [State management](https://flutter.dev/docs/development/data-and-backend/state-mgmt/intro)
- [Add interactivity](https://flutter.dev/docs/development/ui/interactive)
- [Dart language overview](https://dart.dev/guides/language/language-tour)

The [Cookbook](https://flutter.dev/docs/cookbook) gives some recipes for common use-cases.

The "From another platform?" section can be really useful if you have experience in another platform:
- [Android](https://flutter.dev/docs/get-started/flutter-for/android-devs)
- [iOS](https://flutter.dev/docs/get-started/flutter-for/ios-devs)
- [React Native](https://flutter.dev/docs/get-started/flutter-for/react-native-devs)
- [Web](https://flutter.dev/docs/get-started/flutter-for/web-devs)
