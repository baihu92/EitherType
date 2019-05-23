# Either

The library for Error Handling.

``` 
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
```

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
