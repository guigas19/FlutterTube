import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favorite_videos/blocs/favorite_bloc.dart';
import 'package:favorite_videos/blocs/videos_bloc.dart';
import 'package:favorite_videos/pages/home.dart';
import 'package:flutter/material.dart';

import 'api.dart';

void main() {
  Api api = Api();
  api.search("basket");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: VideosBloc(),
      child: BlocProvider(
        bloc: FavoriteBloc(),
        child: MaterialApp(
          title: 'FlutterTube',
          home: Home(),
        ),
      ),
    );
  }
}
