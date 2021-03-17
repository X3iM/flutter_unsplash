class PhotoLinks {
  String _raw;
  String _full;
  String _regular;
  String _small;

  PhotoLinks(parseJson) {
    _raw = parseJson[''];
  }

  String get raw => _raw;

  set raw(String value) {
    _raw = value;
  }

  String get full => _full;

  String get small => _small;

  set small(String value) {
    _small = value;
  }

  String get regular => _regular;

  set regular(String value) {
    _regular = value;
  }

  set full(String value) {
    _full = value;
  }
}