class UserLinks {

  String _self;
  String _html;
  String _photos;
  String _likes;
  String _portfolio;

  UserLinks(parsedJson) {
    // _self = parsedJson['self'];
    // _html = parsedJson['html'];
    // _photos = parsedJson['photos'];
    // _likes = parsedJson['likes'];
    // _portfolio = parsedJson['portfolio'];
  }

  String get portfolio => _portfolio;

  set portfolio(String value) {
    _portfolio = value;
  }

  String get likes => _likes;

  set likes(String value) {
    _likes = value;
  }

  String get photos => _photos;

  set photos(String value) {
    _photos = value;
  }

  String get html => _html;

  set html(String value) {
    _html = value;
  }

  String get self => _self;

  set self(String value) {
    _self = value;
  }
}