import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import '../Databasehelper/Databasehlper.dart';
import 'SongModel.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get package
import '../Databasehelper/Databasehlper.dart';
import 'SongModel.dart';

class SongsController extends ChangeNotifier {
  bool isLoading = false;

  List<SongsModel> _songs = [];
  List<SongsModel> get songs => _songs;

  SongsController() {
    // Call init in constructor
    Databasehelper.instance.init();
    fetchSongs();
  }

  get currentSong => null;

  Future<void> fetchSongs() async {
    isLoading = true;
    notifyListeners();
    _songs = await Databasehelper.instance.getsong();
    isLoading = false;
    notifyListeners();
  }

  createSong({
  required String title,
  required String image,
  required String song,
  required String singer,
  required String category,
}) async {
  try {
    await Databasehelper.databases!.createDocument(
      databaseId: '6405d62f38aea554bf4b',
      collectionId: '6405d642c8e5331fadb7',
      documentId: ID.unique(),
      data: {
        'title': title,
        'song': song,
        'image': image,
        'singer': singer,
        'category': category,
      },
    ).then((value) {
      Get.snackbar('Song added', '', duration: Duration(seconds: 3));
    });
  } catch (e) {
    Get.snackbar('Something went wrong', e.toString(),
        duration: Duration(seconds: 5));
  }
}
}

