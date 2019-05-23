import 'package:either_type/either_type.dart';
import 'dart:math';

// Some user class.
class User {
  final String name;

  User(this.name);
}

// Some error class.
class ServerError {
  final int code;

  ServerError(this.code);
}

main() async {
  // There is some method that will return the user or error.
  await getUser()
    ..either((ServerError error) {
      // Add a handler for the error.
      print("Error: ${error.code}");
    }, (User user) {
      // Add a handler to get the user.
      print("User: ${user.name}");
    });
}

// And the return of either looks like this.
// According to the agreement, the right part stores the result of success,
// left is wrong.
Future<Either<ServerError, User>> getUser() async =>
    (Random().nextBool()) ? Right(User("Bob")) : Left(ServerError(500));
