import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PhotoDetailEvent extends Equatable {
  const PhotoDetailEvent();

  @override
  List<Object> get props => [];
}

class DownloadImageEvent extends PhotoDetailEvent {}