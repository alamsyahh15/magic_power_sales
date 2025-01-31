extension IntExtensions on int {
  String toAlphabet() {
    if (this < 0 || this > 25) {
      throw ArgumentError("Number should be between 0 and 25 (inclusive).");
    }

    // ASCII value of 'a' is 97
    int asciiValueOfA = 'a'.codeUnitAt(0);

    // convert the number to alphabet letter
    return String.fromCharCode(asciiValueOfA + this);
  }
}
