import 'package:dart_exercise_6/Album.dart';

class Music extends Album {
  String musicName;
  String albumName;
  num _timeOfMusic;
  String _composer;

  Music(
    this._timeOfMusic, 
    this._composer, {
    required super.artist,
    required this.albumName,
    required super.relaeseDate,
    required this.musicName,
  }) : super(name: albumName);

  num get timeOfMusic => _timeOfMusic;
  String get composer => _composer;

  set newTime(num time) {
    if (time != null){
      _timeOfMusic = time;
    }
  }

  set newComposer(String c) {
    if (c != null){
      _composer = c;
    }
  }
}