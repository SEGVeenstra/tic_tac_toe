import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:tic_tac_toe_game/src/tic_tac_toe_game_state.dart';

void main() {
  group(
    'status',
    () {
      test(
        'when no moves have been made, status is p1Turn',
        () {
          final gameState = TicTacToeGameState();

          expect(gameState.status, equals(TicTacToeStatus.p1Turn));
        },
      );

      test(
        'when p1 has more moves than p2, status is p2Turn',
        () {
          final gameState = TicTacToeGameState(fields: [
            Players.p1,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
          ]);

          expect(gameState.status, TicTacToeStatus.p2Turn);
        },
      );

      test(
        'when p1 has 3-in-a-row, status is p1Won',
        () {
          final gameState = TicTacToeGameState(
            fields: [
              Players.p1,
              Players.p1,
              Players.p1,
              Players.p2,
              Players.p2,
              null,
              null,
              null,
              null,
            ],
          );

          expect(gameState.status, TicTacToeStatus.p1Won);
        },
      );

      test(
        'when the fields are full and p1 and p2 both haven\'t won, status is draw',
        () {
          final gameState = TicTacToeGameState(
            fields: [
              Players.p1,
              Players.p2,
              Players.p1,
              Players.p1,
              Players.p2,
              Players.p2,
              Players.p2,
              Players.p1,
              Players.p1,
            ],
          );

          expect(gameState.status, TicTacToeStatus.draw);
        },
      );
    },
  );

  group(
    'doMove',
    () {
      test(
        'when a valid move is made, return new game state ',
        () {
          final initialState = TicTacToeGameState();
          final expectedState = TicTacToeGameState(fields: [
            Players.p1,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
          ]);

          final newState = initialState.doMove(Players.p1, 0);

          expect(newState, expectedState);
        },
      );

      test(
        'when p1 tries to make a move when it\'s not his turn, throw error',
        () {
          final initialState = TicTacToeGameState(fields: [
            Players.p1,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
          ]);

          expect(
            () => initialState.doMove(Players.p1, 1),
            throwsA(isA<InvalidMoveException>()),
          );
        },
      );

      test(
        'when p2 tries to make a move when it\'s not his turn, throw error',
        () {
          final initialState = TicTacToeGameState(fields: [
            Players.p1,
            Players.p2,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
          ]);

          expect(
            () => initialState.doMove(Players.p2, 1),
            throwsA(isA<InvalidMoveException>()),
          );
        },
      );
    },
  );
}
