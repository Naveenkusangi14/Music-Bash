import 'package:flutter/material.dart';
import 'package:spotify/Controller/current_playing.dart';
import 'package:spotify/views/home/widget/pages/English.dart';
import 'package:spotify/views/home/widget/pages/Hindi.dart';
import 'package:spotify/views/home/widget/pages/Singer.dart';
import 'package:spotify/views/home/widget/pages/Telugu.dart';
import 'package:spotify/views/home/widget/pages/TopSixSinger.dart';
import 'package:provider/provider.dart';
import 'package:spotify/views/home/widget/pages/upload_page.dart';
import 'package:spotify/widgets/current_playing_bottom.dart';
import '../../SongsController/SongsController.dart';
import '../../constants/theme.dart';
import '../../time/Timeconstant.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

@override
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SongsController>(context);
    final currentPlayingProvider = Provider.of<CurrentPlaying>(context);
    print(currentPlayingProvider.currenttitle + 'working');

    return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepPurple.shade200.withOpacity(0.8),
                Colors.deepPurple.shade700.withOpacity(0.8),
              ],
            ),
          ),
          child: RefreshIndicator(
            onRefresh: () async {
              setState(() {});
            },
            child: Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.deepPurple,
                heroTag: 'upload',
                onPressed: () {
                  Get.to(UploadPage());
                  setState(() {});
                },
                child: const Icon(
                  Icons.add,
                  size: 32,
                ),
              ),
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              greetings(),
                              
                              style: const TextStyle(
                                  color: ConstantTheme.textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32),
                            ),
                            
                            const SizedBox(
                              height: 10,
                            ),
                            // TOP SIX SINGERS
                            const TopSixSingers(),
                            const SizedBox(
                              height: 10,
                            ),

                            //  TELUGU SONG
                            const Telugu(),
                            const SizedBox(
                              height: 10,
                            ),
                            //  HINDI SONG
                            const Hindi(),
                            const SizedBox(
                              height: 10,
                            ),
                            // ENGLISH SONG
                            const English(),
                            const SizedBox(
                              height: 10,
                            ),
                            // PopularArtist
                            PopularArtist(
                              scrollDirection: Axis.horizontal,
                              height: 140,
                            ),
                          ],
                        ),
                      ),
                    ),
                   
                  ],
                ),
              ),
            ),
          ),
      
    
    );
  }
}
