import 'package:flutter_unsplash/model/photos_response.dart';
import 'package:image_downloader/image_downloader.dart';

class DownloadRepository {
  downloadImage(PhotoListBean photoListBean) async {
    await ImageDownloader.downloadImage(photoListBean.photosUrl.raw,
        destination: AndroidDestinationType.custom(
          directory: 'unsplash',
        )..subDirectory('${photoListBean.id}.jpg'));
  }
}
