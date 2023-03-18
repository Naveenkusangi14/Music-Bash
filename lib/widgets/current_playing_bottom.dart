import 'package:flutter/material.dart';
import 'package:spotify/views/Player/Player.dart';

class CurrentPlayerBottom extends StatelessWidget {
  String title;
  String image;
  String singer;
  String song;
  CurrentPlayerBottom(
      {super.key,
      required this.title,
      required this.image,
      required this.singer,
      required this.song});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => Player(
                  album: '',
                  image: image,
                  title: title,
                  singer: singer,
                  song:song
                  ))),
      child: Container(
        color: Colors.deepPurple[200],
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(image),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
                Text(
                  singer,
                  style: const TextStyle(color: Colors.black54, fontSize: 14),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
