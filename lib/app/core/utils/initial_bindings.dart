import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import 'dio_utils.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() async {
    Get.put<FlutterSecureStorage>(
      const FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true),
        iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
      ),
    );

    Get.put<Dio>(
      DioUtils.initDio(
        dotenv.env['BASE_URL'] ?? const String.fromEnvironment('BASE_URL'),
        storage: Get.find<FlutterSecureStorage>(),
      ),
      permanent: true,
    );
  }
}
