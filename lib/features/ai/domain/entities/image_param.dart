import 'dart:typed_data';

enum ImageType {
  png('image/png'),
  jpeg('image/jpeg'),
  ;

  const ImageType(this.mimeType);
  final String mimeType;
}

class ImageParam {
  final ImageType type;
  final Uint8List data;

  ImageParam({required this.type, required this.data});
}
