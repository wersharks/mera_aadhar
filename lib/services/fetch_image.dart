import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

Future<Uint8List?> fetchImage(String imageFileName) async {
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Uint8List? imageBytes;
  await firebaseStorage
      .ref()
      .child(imageFileName)
      .getData(100000000)
      .then((value) => {imageBytes = value})
      .catchError((error) => {});
  return imageBytes;
}

Future uploadFile(String filePath, String folderPath) async {
  File file = File(filePath);

  try {
    await FirebaseStorage.instance.ref(folderPath).putFile(file);
  } on FirebaseException catch (e) {
    print(e);
    return 0;
  }
}
