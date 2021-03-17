import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_unsplash/bloc/detail_bloc/photo_detail_bloc.dart';
import 'package:flutter_unsplash/bloc/detail_bloc/photo_detail_state.dart';
import 'package:flutter_unsplash/model/photos_response.dart';

class PhotoDetailScreenArgument {
  final PhotoListBean photoListBean;

  PhotoDetailScreenArgument(this.photoListBean);
}

class PhotoDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PhotoDetailScreenArgument args = ModalRoute.of(context).settings.arguments;
    return BlocProvider(
      create: (context) => PhotoDetailBloc(args.photoListBean),
      child: PhotoDetailWidget(
        photoListBean: args.photoListBean,
      ),
    );
  }
}

class PhotoDetailWidget extends StatefulWidget {
  final PhotoListBean photoListBean;

  const PhotoDetailWidget({Key key, this.photoListBean}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PhotoDetailWidgetState();
}

class PhotoDetailWidgetState extends State<PhotoDetailWidget> {
  PhotoDetailBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<PhotoDetailBloc>();
    // Timer.periodic(Duration(seconds: 1), (timer) {
    //   setState(() {});
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoDetailBloc, PhotoDetailState>(
        builder: (buildContext, state) {
          print('state:    $state');
          return Scaffold(
            appBar: AppBar(title: Text('Detailed Photo'),),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Hero(
                tag: 'photo${widget.photoListBean.id}',
                child: Image.network(widget.photoListBean.photosUrl.full, fit: BoxFit.scaleDown,),
              ),
            ),
          );
        }
    );
  }

  Widget _buildImage(PhotoDetailState state) {
    print('buildImage');
    if (state is InitialPhotoDetailState || state is DownloadingState) {
      return Center(child: CircularProgressIndicator());
    }
    if (state is DownloadedState) {
      return Image.network(widget.photoListBean.photosUrl.full, fit: BoxFit.scaleDown,);
    }
  }
}
