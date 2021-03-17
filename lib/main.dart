import 'package:flutter/material.dart';
import 'package:flutter_unsplash/screen/photo_list_screen.dart';

import 'persistence/photo_repository.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Photo Gallery',
      theme: ThemeData(primarySwatch: Colors.indigo,),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Test App',
                style: TextStyle(
                    fontFamily: 'nunito',
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
            centerTitle: true,
            shadowColor: Colors.grey,
            elevation: 8,
          ),
          body: PhotoListScreen(PhotoRepository())),
    );
  }
}
