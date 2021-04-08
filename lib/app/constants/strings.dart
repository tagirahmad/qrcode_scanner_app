class Strings {
  Strings._internal();
  
  static final Strings _singleton = Strings._internal();

  factory Strings() {
    return _singleton;
  }

  static const pleaseScan = 'Please, scan the QR code';
  static const scan = 'Scan';
  static const howAppWorks = 'How the app works?';
  static const processing = 'Your request is being processed';
  static const back = 'Back';
  static const flipCamera = 'Flip camera';
}
