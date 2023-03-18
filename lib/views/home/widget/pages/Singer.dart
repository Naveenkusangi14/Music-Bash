import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:spotify/constants/colors.dart';
import 'package:spotify/time/Timeconstant.dart';
import '../../../../SongsController/SongsController.dart';

import '../../Secondpage.dart';

class PopularArtist extends StatelessWidget {
  PopularArtist({super.key, required this.scrollDirection,required this.height});
  Axis scrollDirection;
  double height;

  @override
  Widget build(BuildContext context) {
    Random rand = Random();
    final provider = Provider.of<SongsController>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Popular Artist',
          style: TextStyle(
            color: ConstantColors.titleColor,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: height,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: provider.songs.length,
              scrollDirection: scrollDirection,
              itemBuilder: (context, index) {
                final data = provider.songs[index];
                return (data.category == "Popular Artist")
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: InkWell(
                          onTap: () {
                            Get.to(
                              SecondScreen(url: data.image, album: data.singer),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Stack(children: [
                                Positioned(
                                  child: Container(
                                    color: Colors.deepPurple,
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    height: 140,
                                  ),
                                ),
                                Positioned(
                                    right: 0,
                                    child: Container(
                                      width:   MediaQuery.of(context).size.width / 1.5,
                                        height: 150,
                                        child: Image.network(data.image,
                                            fit: BoxFit.cover))),
                                Container(
                                  height: 140,
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                    RandomColors.colors[rand.nextInt(5)],
                                    Colors.black.withOpacity(0.1)
                                  ])),
                                ),
                                Positioned(
                                  top: 100,
                                  left: 20,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    child: Text(data.singer,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 22)),
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(
                        height: 0,
                      );
              }),
        ),
      ],
    );
  }
}
