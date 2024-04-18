import 'package:image_picker/image_picker.dart';

abstract class PlatformRepository {
  Future<XFile?> captureImageFromGallery();
  Future<XFile?> captureImageFromCamera();
}
