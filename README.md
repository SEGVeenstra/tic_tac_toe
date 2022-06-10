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

This package/repository is the result of an article about Test Driven Development.
