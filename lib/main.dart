import 'package:appwrite/appwrite.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:spotify/SongsController/SongsController.dart';
import 'package:spotify/views/home/home_screen.dart';
import 'package:spotify/views/home/widget/bottomnavg.dart';

import 'views/home/widget/pages/upload_page.dart';

Client client = Client();

void main() {
  AssetsAudioPlayer.setupNotificationsOpenAction((notification) {
    return true;
  });

  client
      .setEndpoint('http://139.59.85.104/v1')
      .setProject('6405d4c4e20b265a259d')
      .setSelfSigned(
          status:
              true); // For self signed certificates, only use for development

  // runApp(
  //   DevicePreview(
  //     enabled: true,
  //     tools: const [
  //       ...DevicePreview.defaultTools,
  //     ],
  //     builder: (context) => const MyApp(),
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SongsController()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavigator(),
      ),
    );
  }
}
