

import 'package:flutter_unsplash/model/photo_links.dart';
import 'package:flutter_unsplash/model/photo_urls.dart';
import 'package:flutter_unsplash/model/user.dart';
import 'package:flutter_unsplash/model/user_collection.dart';

class PhotoListResponse {
  final List<PhotoListBean> results;

  PhotoListResponse(this.results);

  PhotoListResponse.fromJsonArray(List json)
      : results = json.map((i) => new PhotoListBean.fromJson(i)).toList();
}

class PhotoListBean {
  String _id;
  String _created_at;
  String _updated_at;
  int    _width;
  int    _height;
  String _color;
  String _blur_hash;
  int    _likes;
  bool   _liked_by_user;
  String _description;
  User   _user;
  List<UserCollection> _userCollections;
  PhotoUrls            _photosUrl;
  PhotoLinks           _photoLinks;

  PhotoListBean.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _created_at = parsedJson['created_at'];
    _updated_at = parsedJson['updated_at'];
    _width = parsedJson['width'];
    _height = parsedJson['height'];
    _color = parsedJson['color'];
    _blur_hash = parsedJson['blur_hash'];
    _likes = parsedJson['likes'];
    _liked_by_user = parsedJson['liked_by_user'];
    _description = parsedJson['description'];
    _user = User(parsedJson['user']);
    for (int i = 0; i < parsedJson['current_user_collections'].length; i++) {
      UserCollection userCollection = UserCollection(parsedJson['current_user_collections'][i]);
      _userCollections.add(userCollection);
    }
    _photosUrl = PhotoUrls(parsedJson['urls']);
    _photoLinks = PhotoLinks(parsedJson['links']);
  }

  PhotoLinks get photoLinks => _photoLinks;

  set photoLinks(PhotoLinks value) {
    _photoLinks = value;
  }

  PhotoUrls get photosUrl => _photosUrl;

  set photosUrl(PhotoUrls value) {
    _photosUrl = value;
  }

  List<UserCollection> get userCollections => _userCollections;

  set userCollections(List<UserCollection> value) {
    _userCollections = value;
  }

  User get user => _user;

  set user(User value) {
    _user = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  bool get liked_by_user => _liked_by_user;

  set liked_by_user(bool value) {
    _liked_by_user = value;
  }

  int get likes => _likes;

  set likes(int value) {
    _likes = value;
  }

  String get blur_hash => _blur_hash;

  set blur_hash(String value) {
    _blur_hash = value;
  }

  String get color => _color;

  set color(String value) {
    _color = value;
  }

  int get height => _height;

  set height(int value) {
    _height = value;
  }

  int get width => _width;

  set width(int value) {
    _width = value;
  }

  String get updated_at => _updated_at;

  set updated_at(String value) {
    _updated_at = value;
  }

  String get created_at => _created_at;

  set created_at(String value) {
    _created_at = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}
