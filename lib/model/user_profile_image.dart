class UserProfileImage {
  String _small;
  String _medium;
  String _large;

  UserProfileImage(parseJson) {
    _small = parseJson['small'];
    _medium = parseJson['medium'];
    _large = parseJson['large'];
  }

  String get large => _large;

  set large(String value) {
    _large = value;
  }

  String get medium => _medium;

  set medium(String value) {
    _medium = value;
  }

  String get small => _small;

  set small(String value) {
    _small = value;
  }
}