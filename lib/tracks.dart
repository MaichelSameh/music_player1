import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class Tracks extends StatefulWidget {
  @override
  _TracksState createState() => _TracksState();
}

class _TracksState extends State<Tracks> {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();
  List<SongInfo> songs = [];

  // void getTracks() async {
  //   songs = await ;
  //   setState(() async {
  //     songs = songs;
  //   });
  // }

  // @override
  // void initState() {
  //   getTracks();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.music_note, color: Colors.black),
        title: Text(
          "Music app",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
        future: audioQuery.getSongs(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          else {
            songs = snapshot.data;
            return ListView.separated(
                itemBuilder: (ctx, index) => ListTile(
                      leading: CircleAvatar(
                        backgroundImage: songs[index].albumArtwork == null
                            ? AssetImage("assets/music_gradient.jpg")
                            : FileImage(File(songs[index].albumArtwork)),
                      ),
                      title: Text(songs[index].title),
                      subtitle: Text(
                        songs[index].artist,
                      ),
                      onTap: () {
                        print(songs[index]);
                      },
                    ),
                separatorBuilder: (ctx, index) => Divider(),
                itemCount: songs.length);
          }
        },
      ),
    );
  }
}
