

import 'package:flutter_unsplash/model/user_links.dart';
import 'package:flutter_unsplash/model/user_profile_image.dart';

class User {

  String _id;
  String _username;
  String _name;
  String _portfolio_url;
  String _bio;
  String _location;
  int    _total_likes;
  int    _total_photos;
  int    _total_collections;
  String _instagram_username;
  String _twitter_username;
  UserProfileImage _profile_image;
  UserLinks _user_links;

  User(parseJson) {
    _id = parseJson['id'];
    _username = parseJson['username'];
    _name = parseJson['name'];
    _portfolio_url = parseJson['portfolio_url'];
    _bio = parseJson['bio'];
    _location = parseJson['location'];
    _total_likes = parseJson['total_likes'];
    _total_photos = parseJson['total_photos'];
    _total_collections = parseJson['total_collections'];
    _instagram_username = parseJson['instagram_username'];
    _twitter_username = parseJson['twitter_username'];
    _profile_image = UserProfileImage(parseJson['profile_image']);
    _user_links = UserLinks(parseJson['user_links']);
  }

  UserLinks get user_links => _user_links;

  set user_links(UserLinks value) {
    _user_links = value;
  }

  UserProfileImage get profile_image => _profile_image;

  set profile_image(UserProfileImage value) {
    _profile_image = value;
  }

  String get twitter_username => _twitter_username;

  set twitter_username(String value) {
    _twitter_username = value;
  }

  String get instagram_username => _instagram_username;

  set instagram_username(String value) {
    _instagram_username = value;
  }

  int get total_collections => _total_collections;

  set total_collections(int value) {
    _total_collections = value;
  }

  int get total_photos => _total_photos;

  set total_photos(int value) {
    _total_photos = value;
  }

  int get total_likes => _total_likes;

  set total_likes(int value) {
    _total_likes = value;
  }

  String get location => _location;

  set location(String value) {
    _location = value;
  }

  String get bio => _bio;

  set bio(String value) {
    _bio = value;
  }

  String get portfolio_url => _portfolio_url;

  set portfolio_url(String value) {
    _portfolio_url = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get username => _username;

  set username(String value) {
    _username = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}