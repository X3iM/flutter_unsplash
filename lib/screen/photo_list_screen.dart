import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_unsplash/bloc/photo_bloc/photo_list_event.dart';
import 'package:flutter_unsplash/bloc/photo_bloc/photo_list_state.dart';
import 'package:flutter_unsplash/bloc/photo_bloc/photos_bloc.dart';
import 'package:flutter_unsplash/model/photos_response.dart';
import 'package:flutter_unsplash/persistence/photo_repository.dart';
import 'package:flutter_unsplash/screen/photo_detail_screen.dart';
import 'package:transparent_image/transparent_image.dart';

class PhotoListScreen extends StatelessWidget {
  final PhotoRepository repository;

  PhotoListScreen(this.repository);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotoListBloc(repository),
      child: _PhotoListWidget(),
    );
  }
}

class _PhotoListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PhotoListWidgetState();
}

class _PhotoListWidgetState extends State<_PhotoListWidget>
    with AutomaticKeepAliveClientMixin {
  PhotoListBloc _bloc;
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    _bloc = BlocProvider.of<PhotoListBloc>(context);
    _bloc.add(FetchEvent());
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    // print(maxScroll - currentScroll);
    if (maxScroll - currentScroll <= _scrollThreshold) {
      // print('onScroll');
      _bloc.add(FetchEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoListBloc, PhotoListState>(
        builder: (buildContext, state) {
      if (state is PhotoListError) {
        return Center(
          child: Text('Error'),
        );
      }
      if (state is InitialPhotoListState) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is PhotoListLoaded) {
        return ListView.builder(
          itemCount: state.photos.length + 1,
          controller: _scrollController,
          itemBuilder: (buildContext, index) {
            if (index >= state.photos.length) {
              return Center(child: CircularProgressIndicator());
            }
            // print(state.photos.length);
            PhotoListBean item = state.photos[index];
            double displayWidth = MediaQuery.of(context).size.width;
            double finalHeight = displayWidth / (item.width / item.height);
            return InkWell(
              onTap: () {
                _onPhotoTap(item);
              },
              child: Hero(
                tag: 'photo${item.id}',
                child: Stack(
                  children: [
                    FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: item.photosUrl.thumb,
                      fit: BoxFit.fitWidth,
                      width: displayWidth,
                      height: finalHeight,
                    ),
                    FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: item.photosUrl.regular,
                      fit: BoxFit.fitWidth,
                      width: displayWidth,
                      height: finalHeight,
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Text(
                        item.description != null ? item.description : '',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      left: 5,
                      child: Text(
                        item.user.name != null ? item.user.name : '',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
      return Center();
    });
  }

  _onPhotoTap(PhotoListBean photoListBean) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => PhotoDetailScreen(),
          settings: RouteSettings(
            arguments: PhotoDetailScreenArgument(photoListBean),
          )),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
