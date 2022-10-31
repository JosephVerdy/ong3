import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class Ong3FirebaseUser {
  Ong3FirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

Ong3FirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<Ong3FirebaseUser> ong3FirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<Ong3FirebaseUser>(
      (user) {
        currentUser = Ong3FirebaseUser(user);
        return currentUser!;
      },
    );
