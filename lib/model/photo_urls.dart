class PhotoUrls {

  String _raw;
  String _full;
  String _regular;
  String _small;
  String _thumb;

  PhotoUrls(parsedJson) {
    _raw = parsedJson['raw'];
    _full = parsedJson['full'];
    _regular = parsedJson['regular'];
    _small = parsedJson['small'];
    _thumb = parsedJson['thumb'];
  }

  String get thumb => _thumb;

  set thumb(String value) {
    _thumb = value;
  }

  String get small => _small;

  set small(String value) {
    _small = value;
  }

  String get regular => _regular;

  set regular(String value) {
    _regular = value;
  }

  String get full => _full;

  set full(String value) {
    _full = value;
  }

  String get raw => _raw;

  set raw(String value) {
    _raw = value;
  }
}