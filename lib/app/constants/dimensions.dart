class Dimensions {
  Dimensions._internal();

  static final Dimensions _singleton = Dimensions._internal();

  factory Dimensions() {
    return _singleton;
  }

  static const double ITEM_INDENT = 10.0;
  static const double SIDE_INDENT = 15.0;
}
