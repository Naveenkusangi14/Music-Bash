import 'dart:async';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/Controller/current_playing.dart';

import '../../Controller/playingcontrols.dart';
import '../../Controller/positioncontroller.dart';

class Player extends StatefulWidget {
  Player({
    Key? key,
    required this.album,
    required this.song,
    required this.image,
    required this.title,
    required this.singer,
  });

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
    audios = [
      Audio.network(
        widget.song,
        metas: Metas(
          title: widget.title,
          artist: widget.singer,
          album: 'OnlineAlbum',
          image: MetasImage.network(widget.image),
        ),
      )
    ];
    _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
    _assetsAudioPlayer.open(
      Playlist(audios: audios, startIndex: 0),
      showNotification: true,
      autoStart: true,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _assetsAudioPlayer.dispose();
  }

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  @override
  Widget build(BuildContext context) {
    final CurrentPlayingProvider = Provider.of<CurrentPlaying>(context);
    CurrentPlayingProvider.currentPlaying(
        image: widget.image, singer: widget.singer, title: widget.title,song:widget.song);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  StreamBuilder<Playing?>(
                    stream: _assetsAudioPlayer.current,
                    builder: (context, playing) {
                      if (playing.data != null) {
                        final myAudio =
                            find(audios, playing.data!.audio.assetAudioPath);
        
                        return Image.network(
                          myAudio.metas.image!.path,
                          height: MediaQuery.of(context).size.height / 1.5,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        );
                      }
                      return const SizedBox(height: 0);
                    },
                  ),
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
                    },
                  ),
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
              Positioned(
                bottom: MediaQuery.of(context).size.width / 1.9,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp,
                          colors: [Colors.black, Colors.black26])),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 28),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.singer,
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: MediaQuery.of(context).size.width / 2.5,
                child: Text(
                  'Now Playing',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
