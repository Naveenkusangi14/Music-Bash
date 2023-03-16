import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../SongsController/SongsController.dart';
import '../../../controllers/SongsController.dart';
import '../../Secondpage.dart';

class PopularArtist extends StatelessWidget {
  const PopularArtist ({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SongsController>(context);
    return SizedBox(
      height: 300,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
          shrinkWrap: true,
            itemCount: provider.songs.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final data = provider.songs[index];
              return (data.category == "Popular Artist")
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        onTap: () {
                          Get.to(
                            SecondScreen(url: data.image, album: data.singer),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                                width: 180,
                                height: 190,
                                child: Stack(children: [
                                  Positioned(
                                    top: 45,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      width: 140,
                                      height: 140,
                                    ),
                                  ),
                                  Positioned(
                                      right: 35,
                                      child: Container(
                                          height: 160,
                                          child: Image.network(data.image,
                                              fit: BoxFit.contain)))
                                ])),
                            Container(
                              width: 120,
                              child: Text(data.image,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 18)),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(
                      height: 0,
                    );
            }),
      ),
    );
  }
}
