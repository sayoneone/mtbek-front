import 'package:mtbek_front/domain/repository/platform_repository.dart';
import 'package:mtbek_front/domain/usecase/base_usecase.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetGalleryImageUseCase implements UseCase<XFile?, NoParams> {
  final PlatformRepository repository;

  GetGalleryImageUseCase({
    required this.repository,
  });

  @override
  Future<XFile?> call(NoParams params) async =>
      await repository.captureImageFromGallery();
}
