import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:spotify/Player/Player.dart';
import 'package:spotify/SongsController/SongsController.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({super.key, required this.url, required this.album});
  String url;
  String album;
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SongsController>(context);

    return Scaffold(
        extendBodyBehindAppBar: false,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 1.3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.url), fit: BoxFit.cover),
                ),
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 1.3,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  )),
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    toolbarHeight: MediaQuery.of(context).size.height / 3,
                    backgroundColor: Colors.transparent,
                    automaticallyImplyLeading: false,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          child: Text(
                            widget.album,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        childCount: provider.songs.length, (context, index) {
                      final data = provider.songs[index];
                      if ((data.album == widget.album)) {
                        final songList = [];
                        final titleList = [];
                        data.song.map((e) {
                          songList.add(e);
                        }).toList();
                        data.title.map((e) {
                          titleList.add(e);
                        }).toList();
                        print(songList.length);
                        return SizedBox(
                          child: ListView.builder(
                            itemCount: songList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, i) {
                              return InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => Player(
                                              song: data.song[i],
                                              image: data.image,
                                              title: data.title[i],
                                              singer: data.singer,
                                              album: data.album,
                                            ))),
                                child: ListTile(
                                    leading: Container(
                                      height: 60,
                                      width: 60,
                                      child: Image.network(
                                        data.image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    title: Text(
                                      titleList[i],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                    subtitle: Text(
                                      data.singer,
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.5),
                                          fontSize: 18),
                                    )),
                              );
                            },
                          ),
                        );
                      } else {
                        return SizedBox(
                          width: 0,
                        );
                      }
                    }),
                  )
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
        ));
  }
}
