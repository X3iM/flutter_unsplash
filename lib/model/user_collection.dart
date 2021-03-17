import 'package:flutter_unsplash/model/user.dart';

class UserCollection {
  String _id;
  String _title;
  String _published_at;
  String _last_collected_at;
  String _updated_at;
  String _cover_photo;
  User _user;

  UserCollection(parsedJson) {
    _id = parsedJson['id'];
    _title = parsedJson['title'];
    _published_at = parsedJson['published_at'];
    _last_collected_at = parsedJson['last_collected_at'];
    _updated_at = parsedJson['updated_at'];
    _cover_photo = parsedJson['cover_photo'];
    _user = User(parsedJson['user']);
  }
}
