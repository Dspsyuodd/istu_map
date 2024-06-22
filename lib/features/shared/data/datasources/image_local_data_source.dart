import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

abstract interface class ImageLocalDataSource {
  Future<Uint8List> getImageBytes(String objectId);
  void saveImageBytes(String objectId, Uint8List bytes);
}

class ImageLocalDataSourceImpl implements ImageLocalDataSource {
  @override
  Future<Uint8List> getImageBytes(String objectId) async {
    var documentDirectory = await getApplicationDocumentsDirectory();
    var file = File('${documentDirectory.path}/$objectId');
    if (await file.exists()) {
      return await file.readAsBytes();
    } else {
      throw Exception('File not found');
    }
  }
  
  @override
  void saveImageBytes(String objectId, Uint8List bytes) async {
    var documentDirectory = await getApplicationDocumentsDirectory();
    var file = File('${documentDirectory.path}/$objectId');
    await file.writeAsBytes(bytes);
  }
}
