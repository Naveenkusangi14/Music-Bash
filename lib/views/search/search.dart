//upload page newwww
// import 'dart:typed_data';

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
//   String? _fileName;
//   Uint8List? _fileBytes;
//   String? _singerName;

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
//               GestureDetector(
//                 onTap: () async {
//                   try {
//                     FilePickerResult? result =
//                         await FilePicker.platform.pickFiles();

//                     if (result != null) {
//                       _fileBytes = result.files.first.bytes;
//                       _fileName = result.files.first.name;
//                       setState(() {});
//                     }
//                   } catch (e) {
//                     print(e);
//                   }
//                 },
//                 child: Container(
//                   height: 150,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       if (_fileBytes == null)
//                         const Icon(
//                           Icons.upload_rounded,
//                           size: 45,
//                           color: Colors.grey,
//                         )
//                       else
//                         const Icon(
//                           Icons.check_circle_outline_rounded,
//                           size: 45,
//                           color: Colors.green,
//                         ),
//                       const SizedBox(height: 10),
//                       Text(
//                         _fileName ?? "Choose a song to upload",
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   hintText: "Enter singer name",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                   ),
//                 ),
//                 onChanged: (value) => _singerName = value,
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _fileName != null && _singerName != null
//                     ? () async {
//                         try {
//                           // Upload file
//                           await Databasehelper.instance.uploadSong(
//                             _fileBytes!,
//                             _fileName!,
//                             singerName: _singerName!,
//                           );

//                           // Navigate back to home screen
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(builder: (_) => const HomeScreen()),
//                           );
//                         } catch (e) {
//                           print(e);
//                         }
//                       }
//                     : null,
//                 child: const Text("Upload"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }






//uploadpageeeee
// import 'dart:typed_data';

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
//   String? _fileName;
//   Uint8List? _fileBytes;
//   String? _singerName;
  
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
//               GestureDetector(
//                 onTap: () async {
//                   try {
//                     FilePickerResult? result =
//                         await FilePicker.platform.pickFiles();

//                     if (result != null) {
//                       _fileBytes = result.files.first.bytes;
//                       _fileName = result.files.first.name;
//                       setState(() {});
//                     }
//                   } catch (e) {
//                     print(e);
//                   }
//                 },
//                 child: Container(
//                   height: 150,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       if (_fileBytes == null)
//                         const Icon(
//                           Icons.upload_rounded,
//                           size: 45,
//                           color: Colors.grey,
//                         )
//                       else
//                         const Icon(
//                           Icons.check_circle_outline_rounded,
//                           size: 45,
//                           color: Colors.green,
//                         ),
//                       const SizedBox(height: 10),
//                       Text(
//                         _fileName ?? "Choose a song to upload",
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   hintText: "Enter singer name",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                   ),
//                 ),
//                 onChanged: (value) => _singerName = value,
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _fileName != null && _singerName != null
//                     ? () async {
//                         try {
//                           // Upload file
//                           await Databasehelper.instance.uploadSong(
//                             _fileBytes!,
//                             _fileName!,
//                             singerName: _singerName!,
//                           );

//                           // Navigate back to home screen
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(builder: (_) => const HomeScreen()),
//                           );
//                         } catch (e) {
//                           print(e);
//                         }
//                       }
//                     : null,
//                 child: const Text("Upload"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
