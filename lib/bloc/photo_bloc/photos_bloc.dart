import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_unsplash/bloc/photo_bloc/photo_list_state.dart';
import 'package:flutter_unsplash/persistence/photo_repository.dart';
import 'package:rxdart/rxdart.dart';

import 'photo_list_event.dart';

class PhotoListBloc extends Bloc<PhotoListEvent, PhotoListState> {
  final PhotoRepository photoRepository;

  PhotoListBloc(this.photoRepository) : super(InitialPhotoListState());

  @override
  Stream<Transition<PhotoListEvent, PhotoListState>> transformEvents(
      Stream<PhotoListEvent> events, transitionFn) {
    return super.transformEvents(
        (events).debounceTime(Duration(milliseconds: 500)), transitionFn);
  }

  @override
  Stream<PhotoListState> mapEventToState(PhotoListEvent event) async* {
    final currentState = state;
    // print('mapEventToState');
    if (event is FetchEvent) {
      try {
        if (currentState is InitialPhotoListState) {
          final photos = await photoRepository.getPhotos(1);
          // print('photoListBloc:     $photos');
          yield PhotoListLoaded(photos, 1);
        } else if (currentState is PhotoListLoaded) {
          int currentPage = currentState.page;
          // print('currentPage:   $currentPage');
          final photos = await photoRepository.getPhotos(++currentPage);
          // print('photoListBloc:        $photos');
          yield photos.isEmpty ? currentState.copyWith(photos) : PhotoListLoaded(currentState.photos + photos, currentPage);
        }
      } catch (error, stacktrace) {
        print(error);
        print(stacktrace);
        yield PhotoListError();
      }
    }
  }
}
