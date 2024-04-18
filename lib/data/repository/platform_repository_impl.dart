import 'package:mtbek_front/domain/repository/platform_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PlatformRepository)
class PlatformRepositoryImpl implements PlatformRepository {
  @override
  Future<XFile?> captureImageFromCamera() async {
    try {
      return await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 75,
        maxWidth: 1500,
        maxHeight: 1500,
      );
    } catch (err) {
      throw 'Не удалось получить изображение, ошибка: $err';
    }
  }

  @override
  Future<XFile?> captureImageFromGallery() {
    try {
      return ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 75,
        maxWidth: 1500,
        maxHeight: 1500,
      );
    } catch (err) {
      throw 'Не удалось получить изображение, ошибка: $err';
    }
  }
}
