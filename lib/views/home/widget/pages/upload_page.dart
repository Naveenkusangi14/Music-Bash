// // ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:spotify/Databasehelper/Databasehlper.dart';
// import 'package:spotify/views/home/home_screen.dart';

// class UploadPage extends StatefulWidget {
//   const UploadPage({Key? key}) : super(key: key);

//   @override
//   State<UploadPage> createState() => _UploadPageState();
// }

// class _UploadPageState extends State<UploadPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Upload new song"),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: [
//               IconButton(
//                   onPressed: () async {
//                     try {
//                       FilePickerResult? result =
//                           await FilePicker.platform.pickFiles();

//                       if (result != null) {
//                         Uint8List? fileBytes = result.files.first.bytes;
//                         String fileName = result.files.first.name;

//                         // Upload file
//                          Databasehelper.instance.uploadSong(fileBytes!,fileName);
//                          // ignore: use_build_context_synchronously
//                          Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (_) => const HomeScreen()));
//                       }

//                     } catch (e) {
//                       print(e);
//                     }
//                   },
//                   icon: const Icon(
//                     Icons.add,
//                     size: 45,
//                   ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//update code

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spotify/Databasehelper/Databasehlper.dart';
import 'package:spotify/views/home/home_screen.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);
  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final List<String> _fileName = [];
  //String? _songPath;
  final List<Uint8List> _songBytes = [];
  Uint8List? _imageBytes;

  List singer = [];
  TextEditingController album = TextEditingController();
  List title = [];
  TextEditingController category = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'upload',
      child: Container(
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
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.deepPurple.shade700,
            title: const Text("Upload new song"),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        try {
                          FilePickerResult? result = await FilePicker.platform
                              .pickFiles(allowMultiple: true);
                          if (result!.files.isNotEmpty) {
                            result.files.map(((e) {
                              _songBytes.add(e.bytes!);
                              _fileName.add(e.name);
                            })).toList();

                            //      _songPath = result.files.first.path;
                            setState(() {});
                          }
                        } catch (e) {
                          return;
                        }
                      },
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            (_songBytes.isEmpty)
                                ? const Icon(
                                    Icons.upload_rounded,
                                    size: 45,
                                    color: Colors.deepPurple,
                                  )
                                : const Icon(
                                    Icons.check_circle_outline_rounded,
                                    size: 45,
                                    color: Colors.green,
                                  ),
                            const SizedBox(height: 10),
                            (_fileName.isNotEmpty)
                                ? SizedBox(
                                    height: 80,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: _fileName.length,
                                        itemBuilder: (context, index) {
                                          return Text(
                                            _fileName[index],
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.deepPurple,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlign: TextAlign.center,
                                          );
                                        }),
                                  )
                                : const Text(
                                    "Choose a song to upload",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _fileName.length,
                          itemBuilder: (context, index) {
                            return TextFormField(
                               
                              style: const TextStyle(color: Colors.white),
                              onFieldSubmitted: (value) {
                                singer.add(value);
                                print(singer);
                              },
                              decoration: InputDecoration(
                                hintStyle: const TextStyle(color: Colors.white),
                                hintText: "Enter ${index + 1} song singer name",
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: category,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: "Enter song category",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _fileName.length,
                          itemBuilder: (context, index) {
                            return TextFormField(
                              style: const TextStyle(color: Colors.white),
                              onFieldSubmitted: (value) {
                                title.add(value);
                              },
                              decoration: InputDecoration(
                                hintStyle: const TextStyle(color: Colors.white),
                                hintText: "Enter ${index + 1} song title",
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: album,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: "Enter album name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () async {
                        try {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles(
                            type: FileType.image,
                          );

                          if (result != null) {
                            _imageBytes = result.files.first.bytes;
                            setState(() {});
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (_imageBytes == null)
                              const Icon(
                                Icons.image_outlined,
                                size: 45,
                                color: Colors.deepPurple,
                              )
                            else
                              const Icon(
                                Icons.check_circle_outline_rounded,
                                size: 45,
                                color: Colors.green,
                              ),
                            const SizedBox(height: 10),
                            // ignore: prefer_const_constructors
                            Text(
                              "Choose an image for the song",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    InkWell(
                      onTap: () {
                        try {
                          upload();
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Chip(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 50),
                          backgroundColor: Colors.white,
                          label: Text(
                            "Upload",
                            style: TextStyle(
                                color: Colors.deepPurple.shade700,
                                fontSize: 22),
                          )),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> upload() async {
    try {
      // Upload file
      await Databasehelper.instance.createsong(
          title: title,
          image: _imageBytes!,
          song: _songBytes,
          singer: singer,
          category: category.text,
          songData: _songBytes,
          imageData: _imageBytes,
          album: album.text);
    } catch (e) {
      print('Error uploading song: $e');
    }
  }
}
