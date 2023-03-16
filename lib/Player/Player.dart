import 'dart:async';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../Controller/playingcontrol.dart';
import '../Controller/position.dart';
class Player extends StatefulWidget {
  Player({
    super.key, 
    required this.album,
    required this.song, required this.image,required this.title,required this.singer});
  String image;
  String song;
  String title;
  String singer;
  String album;

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
 late AssetsAudioPlayer _assetsAudioPlayer;
 late final audios;


  @override
  void initState() {
    super.initState();
   audios =[ Audio.network(
      widget.song,
      metas: Metas(
        //id: 'Online',
      title:widget.title ,
      artist:widget.singer,
      album: 'OnlineAlbum',
      image: MetasImage.network(widget.image),
      ),
    )];
    _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
     _assetsAudioPlayer.open(
      Playlist(audios: audios, startIndex: 0),
      showNotification: true,
      autoStart: true,
    );
    
  }
@override
  // void dispose() {
  //   // TODO: implement dispose
  //   _assetsAudioPlayer.dispose();
    
  //   super.dispose();
  // }
  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
     
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: 
                [Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    
                    StreamBuilder<Playing?>(
                        stream: _assetsAudioPlayer.current,
                        builder: (context, playing) {
                          if (playing.data != null) {
                            final myAudio =
                                find(audios, playing.data!.audio.assetAudioPath);
            
                            return Image.network(
                                  myAudio.metas.image!.path,
                                  height:
                                      MediaQuery.of(context).size.height /
                                          1.3,
                                  width:
                                      MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                );
                          }
                        return SizedBox(height: 0,);
                        }),
                  
                    const SizedBox(
                      height: 20,
                    ),
                    _assetsAudioPlayer.builderRealtimePlayingInfos(
                              builder: (context, RealtimePlayingInfos? infos) {
                            if (infos == null) {
                              return const SizedBox();
                            }
                            return Column(
                              children: [
                                PositionSeekWidget(
                                  currentPosition: infos.currentPosition,
                                  duration: infos.duration,
                                  seekTo: (to) {
                                    _assetsAudioPlayer.seek(to);
                                  },
                                ),
                      
                              ],
                            );
                          }),
                    _assetsAudioPlayer.builderCurrent(
                        builder: (context, Playing? playing) {
                      return Column(
                        children: <Widget>[
                          _assetsAudioPlayer.builderLoopMode(
                            builder: (context, loopMode) {
                              return PlayerBuilder.isPlaying(
                                  player: _assetsAudioPlayer,
                                  builder: (context, isPlaying) {
                                    return PlayingControls(
                                      loopMode: loopMode,
                                      isPlaying: isPlaying,
                                      isPlaylist: false,
                                      onStop: () {
                                        _assetsAudioPlayer.stop();
                                      },
                                      // toggleLoop: () {
                                      //   _assetsAudioPlayer.toggleLoop();
                                      // },
                                      onPlay: () {
                                        _assetsAudioPlayer.playOrPause();
                                      },
                                      onNext: () {
            
                                        _assetsAudioPlayer.next(
                                            keepLoopMode:
                                                true /*keepLoopMode: false*/);
            
                                       },
                                       onPrevious: () {
                                       _assetsAudioPlayer.previous(
                                            /*keepLoopMode: false*/);
                                       },
                                    );
                                  });
                            },
                          ),
                          
                        ],
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                  Positioned(
                left: 10,
                top: 20,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              ],
            ),
          ),
        ),
    
    );
  }

}
