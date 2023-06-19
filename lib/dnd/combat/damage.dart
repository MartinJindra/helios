import 'package:helios/dnd/dices/d0.dart' show D0;
import 'package:helios/dnd/dices/dice.dart' show Dice;
import 'package:helios/dnd/properties/damagetype.dart' show DamageType;

/// Class representing damage.
class Damage {
  late Dice dice;

  late DamageType type;

  Damage(this.dice, this.type);

  Damage.mod(int modifier, this.type) {
    dice = D0.mod(1, modifier);
  }

  /// Parses an expression for a Damage object.
  /// A die (and optional damage type) is required.
  static Damage parse(String expression) {
    List<String> stringSplit = expression.split(" ");

    if (stringSplit.length == 1) {
      stringSplit[0] = stringSplit[0].replaceAll("+", "");
      return Damage.mod(int.parse(stringSplit[0]), DamageType.none);
    }
    DamageType type =
        DamageType.values.firstWhere((e) => e.toString() == stringSplit[1]);
    Dice damage = Dice.parse(stringSplit[0]);

    return Damage(damage, type);
  }

  @override
  String toString() {
    return '$dice $type';
  }
}
