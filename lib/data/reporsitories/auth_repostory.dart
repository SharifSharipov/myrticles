import 'package:image_picker/image_picker.dart';
import 'package:myrticles/data/models/user_model/user_model.dart';

import '../local/repository/storage_repository.dart';
import '../models/universal_data/universal_data.dart';
import '../network/api_service.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository({required this.apiService});

  Future<UniversalData> sendCodeToGmail({
    required String gmail,
    required String password,
  }) async =>
      apiService.sendToGmail(email: gmail, passowrd: password);

  Future<UniversalData> confirmCode({required String code}) async =>
      apiService.confirmCode(code: code);

  Future<UniversalData> registerUser({
    required Usermodel usermodel,
    required XFile file,
  }) async =>
      apiService.register(usermodel: usermodel, xFile: file);

  Future<UniversalData> loginUser({
    required String gmail,
    required String password,
  }) async =>
      apiService.loginUser(email: gmail, passowrd: password);

  String getToken() => StorageRepository.getString("token");
}
