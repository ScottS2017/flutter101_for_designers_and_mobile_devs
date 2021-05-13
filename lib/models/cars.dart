class MutableCar {
  MutableCar ({
    required this.engineIsStarted,
  });
  bool engineIsStarted;
}

// ******************************

class ImmutableCar {
  ImmutableCar({
    required this.engineIsStarted,
});
  final bool engineIsStarted;
  /// ** WARNING! DANGER! When you manipulate a List,
  /// you aren't changing the List, you're changing its contents.
  /// THERE IS A FUNDAMENTAL DIFFERENCE!
  /// You can manipulate the contents of a final List,
  /// because in the case of a list, you aren't changing its
  /// identity.
}

// ******************************
/// Getter and setters aren't necessary in Dart/Flutter.
/// The linter will tell  you to use the MutableCar

class CarWithGetter {
  CarWithGetter({
    required bool engineIsStarted,
  }) : _engineIsStarted = engineIsStarted;

  bool _engineIsStarted;
  bool get engineIsStarted => _engineIsStarted;
  set engineIsStarted(bool value) {
    _engineIsStarted = value;
  }
}
