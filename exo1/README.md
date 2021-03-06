# Exercise 1

Learn the basics about state management

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
