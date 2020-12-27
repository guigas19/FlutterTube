import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favorite_videos/blocs/videos_bloc.dart';
import 'package:favorite_videos/delegates/data_search.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 25,
          child: Image.asset("images/yt_logo_rgb_dark.png"),
        ),
        elevation: 0,
        backgroundColor: Colors.black87,
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text("0"),
          ),
          IconButton(
              icon: Icon(Icons.star),
              onPressed: (){}),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                String result = await showSearch(context: context, delegate: DataSearch());
                if (result != null) BlocProvider.of<VideosBloc>(context).inSearch.add(result);
              })
        ],
      ),
      body: StreamBuilder(
        stream: BlocProvider.of<VideosBloc>(context).outVideos,
        builder: (context, snapshot){
          if(snapshot.hasData)
            return ListView.builder(
                itemBuilder: (context, index){
                  // return VideoTile(snapshot.data[index]);
                  return null;
                },
              itemCount: snapshot.data.lenght,
            );
          else
            return Container();
        },
      ),
    );
  }
}
