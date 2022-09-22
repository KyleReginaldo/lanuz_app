// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:lanuz_app/domain/repository/repository.dart';

class UpdateCoordinates {
  final Repository repo;
  UpdateCoordinates({required this.repo});

  Future call(String coordinates) async {
    await repo.updateCoordinates(coordinates);
  }
}
