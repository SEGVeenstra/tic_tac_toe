<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Game logic for the game [Tic Tac Toe](https://www.google.com/search?q=tictactoe).

## Usage

Simply create a new instance of `TicTacToeGameState` and call the `claimField` function to play the game.

```dart
final gameState = TicTacToeGameState();

// Use .fields to get the state of the fields.
// You can use this to draw the UI for example.
final fields = gameState.fields;
// Use .status to get the current status of the game.
// You can use this to show the players who's turn it is or who has won the game.
final status = gameState.status;

// Use .claimField to let the current player claim a field. The result is a new instance.
final newState = gameState.claimField(4);
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
