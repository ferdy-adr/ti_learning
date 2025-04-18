import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/consts/endpoints.dart';
import '../../models/result.dart';
import '../../models/user.dart';
import '../../repositories/auth/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final Dio client;
  final FlutterSecureStorage storage;

  AuthRepositoryImpl({required this.client, required this.storage});

  @override
  Future<Result<User>> login({
    required String email,
    required String password,
  }) async {
    try {
      final apiKey =
          dotenv.env['API_KEY'] ?? const String.fromEnvironment('API_KEY');

      final response = await client.post(
        '${Endpoints.mobileApi}/$apiKey/auth/login',
        data: {'email': email, 'password': password},
      );

      User tempUser = User.fromJson(response.data['user']);
      tempUser.addToken(response.data['token']);
      return Result.success(tempUser);
    } on DioException catch (e) {
      if ((e.response?.statusCode ?? 0) >= 400 &&
          (e.response?.statusCode ?? 0) < 500) {
        // case: Bad Request
        return Result.failed(e.response?.data['message']);
      } else if ((e.response?.statusCode ?? 0) >= 500 &&
          (e.response?.statusCode ?? 0) < 600) {
        return Result.failed(
          'Terjadi kesalahan, silahkan coba kembali nanti. (${e.response?.statusCode}: Internal Server Error)',
        );
      }

      return Result.failed('Terjadi kesalahan, silahkan coba kembali nanti');
    } catch (e) {
      return Result.failed('Terjadi kesalahan, silahkan coba kembali nanti');
    }
  }
}
