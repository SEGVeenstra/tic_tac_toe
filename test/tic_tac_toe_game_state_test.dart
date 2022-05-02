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
}
