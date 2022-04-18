extension DoubleExt on double {
  String get percentage {
    return (this * 100).round().toString() + " %";
  }
}
