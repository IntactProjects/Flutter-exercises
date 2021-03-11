import 'dart:async';

import 'package:exo1/domain/user.dart';

class UserRepository {
  // Prevent using default constructor
  UserRepository._();

  static final _instance = UserRepository._();
  factory UserRepository.get() => _instance;

  // in-memory list of users
  List<User> _users = [
    User(name: "Dilbert"),
    User(name: "Alice"),
    User(name: "Wally"),
    User(name: "Pointy-haired boss"),
  ];
  StreamController<List<User>>? _usersController;

  List<User> getUsers() => List.unmodifiable(_users);
  Stream<List<User>> observeUsers() {
    // In a real application, we would probably use RxDart BehaviorSubject
    // to ensure proper state of the stream
    if (_usersController != null) {
      _usersController?.close();
    }
    _usersController = StreamController()..add(_users);
    return _usersController!.stream;
  }

  void addUser(User user) {
    _users.add(user);
    _usersController?.add(_users);
  }

  void deleteUser(User user) {
    _users.remove(user);
    _usersController?.add(_users);
  }
}
