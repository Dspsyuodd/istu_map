import 'dart:typed_data';

abstract interface class ImageLocalDataSource {
  Future<Uint8List> getImageBytes(String objectId);
}

class ImageLocalDataSourceImpl implements ImageLocalDataSource {
  @override
  Future<Uint8List> getImageBytes(String objectId) {
    // TODO: implement getImageBytes
    throw UnimplementedError();
  }
}
