import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class CurrentPlaying extends ChangeNotifier {
  String _currenttitle = '';
  String get currenttitle => _currenttitle;
  String _currentsinger = '';
    String get currentsinger => _currentsinger;
  String _currentimage = '';
    String get currentimage => _currentimage;
  String _currentsong = '';
    String get currentsong => _currentsong;



// late AssetsAudioPlayer _assetsAudioPlayer;

    
//   late final audios;

//   @override
//   void initState() {
    
//     audios = [
//       Audio.network(
//         currentsong,
//         metas: Metas(
//           title:currenttitle,
//           artist: currentsinger,
//           album: 'OnlineAlbum',
//           image: MetasImage.network(currentimage),
//         ),
//       )
//     ];
//     _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
//     _assetsAudioPlayer.open(
//       Playlist(audios: audios, startIndex: 0),
//       showNotification: true,
//       autoStart: true,
//     );
//   }
  void currentPlaying(
      {required String title,
      required String singer,
      required String image,
      required String song}) {
    _currentimage = image;
    _currentsinger = singer;
    _currenttitle = title;
    _currentsong = song;
    notifyListeners();
   
  }
}
