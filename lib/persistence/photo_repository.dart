import 'package:dio/dio.dart';
import 'package:flutter_unsplash/model/photos_response.dart';

class PhotoRepository {

  final _baseUrl = 'https://api.unsplash.com/';
  final _accessToken = 'ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9';

  Future<List<PhotoListBean>> getPhotos(int page) async {
    try {
      Response responce = await Dio().get('${_baseUrl}photos/?client_id=$_accessToken&page=$page');

      List<PhotoListBean> list = PhotoListResponse.fromJsonArray(responce.data).results;
      list.forEach((element) => print(element));

      return list;
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      return null;
    }
  }

}