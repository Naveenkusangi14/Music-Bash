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
import 'dart:typed_data';
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
  String? _fileName;
  //String? _songPath;
  Uint8List? _fileBytes;
   TextEditingController singer = TextEditingController();
   TextEditingController album = TextEditingController();
   TextEditingController title= TextEditingController();

  Uint8List? _imageBytes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload new song"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            GestureDetector(
              onTap: () async {
                try {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();

                  if (result != null) {
                    _fileBytes = result.files.first.bytes;
                    _fileName = result.files.first.name;
               //      _songPath = result.files.first.path;
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
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_fileBytes == null)
                      const Icon(
                        Icons.upload_rounded,
                        size: 45,
                        color: Colors.grey,
                      )
                    else
                      const Icon(
                        Icons.check_circle_outline_rounded,
                        size: 45,
                        color: Colors.green,
                      ),
                    const SizedBox(height: 10),
                    Text(
                      _fileName ?? "Choose a song to upload",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller:singer,
              decoration: const InputDecoration(
                hintText: "Enter singer name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),

            ),
            const SizedBox(height: 20),
            TextFormField(
              controller:album,
              decoration: const InputDecoration(
                hintText: "Enter song category",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            
            ),
            TextFormField(
              controller:title,
              decoration: const InputDecoration(
                hintText: "Enter song title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
          
            ),
            // TextFormField(
            //   decoration: const InputDecoration(
            //     hintText: "Enter album name",
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(10)),
            //     ),
            //   ),
              
            // ),
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
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_imageBytes == null)
                      const Icon(
                        Icons.image_outlined,
                        size: 45,
                        color: Colors.grey,
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
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                try {
                  upload();
                } catch (e) {
                  print(e);
                }
              },
              child: const Text("Upload"),
            )
          ]),
        ),
      ),
    );
  }

Future<void> upload() async {
  try {
    // Upload file
    await Databasehelper.instance.createsong(
        title: title.text,
        image: '',
        song: _fileBytes!,
        singer: singer.text,
        category: album.text,
        songData: _fileBytes);

    print('Song uploaded successfully!');

    // Navigate back to home screen
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  } catch (e) {
    print('Error uploading song: $e');
  }
}

  }

