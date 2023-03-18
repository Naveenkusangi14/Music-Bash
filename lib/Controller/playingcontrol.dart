import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import '../Player/Player.dart';

class PlayingControls extends StatelessWidget {
  final bool isPlaying;
  final LoopMode? loopMode;
  final bool isPlaylist;
  final Function()? onPrevious;
  final Function() onPlay;
  final Function()? onNext;
  final Function()? toggleLoop;
  final Function()? onStop;

  PlayingControls({
    required this.isPlaying,
    this.isPlaylist = false,
    this.loopMode,
    this.toggleLoop,
    this.onPrevious,
    required this.onPlay,
    this.onNext,
    this.onStop,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: isPlaylist ? onPrevious : null,
          child: const Icon(
            Icons.skip_previous,
            size: 60,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: onPlay,
          child: Icon(
            isPlaying ? Icons.pause : Icons.play_arrow,
            size: 60,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: isPlaylist
              ? onNext
              : () {
                  Player(
                    song:
                        'http://139.59.85.104/v1/storage/buckets/63fcd60b2bd538f9097d/files/6401fd13c630f858465c/view?project=63fcc073e64c3ffb682d&mode=admin',
                    image:
                        'https://images-na.ssl-images-amazon.com/images/S/pv-target-images/acda4ca3da981ad44848c04d5b79267b6edef62f7ba4a04383b6c976eda674a2._RI_V_TTW_.jpg',
                    title: 'data.title[i]',
                    singer: 'data.singer',
                    album: 'data.album',
                  );

                  //  Navigator.push(
                  //                           context,
                  //                           MaterialPageRoute(
                  //                               builder: (_) => Player(
                  //                                     song: 'http://139.59.85.104/v1/storage/buckets/63fcd60b2bd538f9097d/files/6401fd13c630f858465c/view?project=63fcc073e64c3ffb682d&mode=admin',

                  //                                      image: 'https://images-na.ssl-images-amazon.com/images/S/pv-target-images/acda4ca3da981ad44848c04d5b79267b6edef62f7ba4a04383b6c976eda674a2._RI_V_TTW_.jpg',
                  //                                     title: 'data.title[i]',
                  //                                     singer: 'data.singer',
                  //                                     album: 'data.album',
                  //                                   ),
                  //                                   ),
                  //                                   );
                },
          child: const Icon(
            Icons.skip_next,
            size: 60,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
