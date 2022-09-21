// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../repository/repository.dart';

class CreateTable {
  final Repository repo;
  CreateTable({required this.repo});
  Future call() async {
    await repo.createTable();
  }
}
