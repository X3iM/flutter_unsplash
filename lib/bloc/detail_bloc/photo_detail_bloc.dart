import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_unsplash/bloc/detail_bloc/photo_detail_event.dart';
import 'package:flutter_unsplash/bloc/detail_bloc/photo_detail_state.dart';
import 'package:flutter_unsplash/model/photos_response.dart';
import 'package:flutter_unsplash/persistence/download_repository.dart';
import 'package:rxdart/rxdart.dart';

class PhotoDetailBloc extends Bloc<PhotoDetailEvent, PhotoDetailState> {
  final PhotoListBean _photoListBean;
  final DownloadRepository repository = DownloadRepository();

  PhotoDetailBloc(this._photoListBean) : super(InitialPhotoDetailState());

  @override
  Stream<Transition<PhotoDetailEvent, PhotoDetailState>> transformEvents(
      Stream<PhotoDetailEvent> events, transitionFn) {
    return super.transformEvents(
        (events).debounceTime(Duration(milliseconds: 500)), transitionFn);
  }

  @override
  Stream<PhotoDetailState> mapEventToState(PhotoDetailEvent event) async* {
    final currentState = state;
    print('mapEventToState:     $state');
    if (event is DownloadImageEvent && !(currentState is DownloadingState)) {
      try {
        yield DownloadingState();
        await repository.downloadImage(_photoListBean);
        yield DownloadedState();
      } catch (error, stacktrace) {
        print(error);
        print(stacktrace);
        yield ErrorDownloadingState();
      }
    }
  }


}