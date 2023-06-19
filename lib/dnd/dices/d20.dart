import 'package:helios/dnd/dices/dice.dart' show Dice;

/// A D20 die.
class D20 extends Dice {
  D20(int amount) : super(0, 0);

  D20.mod(int amount, int modifier) : super.mod(amount, 20, modifier);
}
