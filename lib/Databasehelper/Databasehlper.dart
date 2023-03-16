import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../SongsController/SongModel.dart';
import '../main.dart';

class Databasehelper {
  Databasehelper._privateConstructor();
  static final Databasehelper _instance = Databasehelper._privateConstructor();
  static Databasehelper get instance => _instance;

  static Databases? databases;
  static Storage? storages;
  
  init() {
    databases = Databases(client as Client);
    storages = Storage(client as Client);
  }

  Future<void> createsong({
    required String title,
    required String image,
    required Uint8List song,
    required String singer,
    required String category,
    required songData,
  }) async {
    databases ??= Databases(client as Client);

    try {
      File song = await uploadSong(songData,title);
      final documentId = ID.unique();
      Get.snackbar('Song added', '',
          duration: Duration(seconds: 3));
    } catch (e) {
      print(e);
      Get.snackbar('Something went wrong', e.toString(),
          duration: Duration(seconds: 5));
    }
  }

  Future<List<SongsModel>> getsong() async {
    databases ??= Databases(client as Client);
    try {
      final response = await databases!.listDocuments(
        databaseId: '6405d62f38aea554bf4b',
        collectionId: '6405d642c8e5331fadb7',
      );
      return response.documents
          .map((e) => SongsModel.fromJson(e.data))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<File> uploadSong(Uint8List songData,filename) async {
    storages ??= Storage(client as Client);
    try {
      final fileId = ID.unique();
      final file = InputFile(
        filename: filename,
        bytes: songData,
      );
      File uploadedFile = await storages!.createFile(
        bucketId: '6406d520472e86d75e96',
        fileId: fileId,
        file: file,
      );
      return uploadedFile;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
