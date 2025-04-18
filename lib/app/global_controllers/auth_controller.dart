import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../core/consts/keys.dart';
import '../data/models/result.dart';
import '../data/models/user.dart';
import '../data/repositories/auth/auth_repository.dart';
import '../routes/app_pages.dart';

class AuthController extends GetxController {
  final _authRepository = Get.find<AuthRepository>();
  final _secureStorage = Get.find<FlutterSecureStorage>();

  final user = Rxn<User>();

  @override
  void onReady() async {
    await Future.delayed(
      // Durasi splashscreen minimal 2 detik
      const Duration(seconds: 0),
      () async {
        // step 1: Ambil token dari local storage
        final token = await _secureStorage.read(key: Keys.accessToken);

        // step 2: Cek jika `token` tidak null, artinya user sudah login
        if (token != null && token != '') {
          // Ambil data User dari secure storage
          final jsonUser = await _secureStorage.read(key: Keys.user);
          final tempUser = jsonDecode(jsonUser ?? '');
          user.value = User.fromJson(tempUser);

          Get.offAllNamed(Routes.MAIN);
        } else {
          // Kondisi ketika `token` null, artinya user belum login
          Get.offAllNamed(Routes.ONBOARD);
        }
      },
    );

    super.onReady();
  }

  /// Fungsi untuk menyimpan token dan user profile ke secure storage
  Future<void> _setStorage() async {
    try {
      // step 1: Pastikan userAccount tidak kosong
      if (user.value != null) {
        final tempJsonUser = jsonEncode(user.toJson());

        // step 2: Simpan data User ke secure storage
        await _secureStorage.write(
          key: Keys.accessToken,
          value: user.value!.accessToken,
        );
        await _secureStorage.write(key: Keys.user, value: tempJsonUser);
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Fungsi untuk menghapus data User dari secure storage
  Future<void> _clearStorage() async {
    await _secureStorage.delete(key: Keys.accessToken);
    await _secureStorage.delete(key: Keys.user);
  }

  Future<Result<String>> login({
    required String email,
    required String password,
  }) async {
    try {
      // step 1: Login ke API
      final result = await _authRepository.login(
        email: email,
        password: password,
      );

      if (result is Success) {
        user.value = result.resultValue;

        // step 2: Simpan data User ke secure storage
        await _setStorage();

        return Result.success('Login success');
      }

      return Result.failed('Login failed');
    } catch (e) {
      return Result.failed('Terjadi masalah. Mohon dicoba beberapa saat lagi');
    }
  }

  Future<Result<String>> logout() async {
    try {
      // step 1: Hapus data User pada local storage
      await _clearStorage();

      // step 2: Return result
      return Result.success('Logout success');
    } catch (e) {
      return Result.failed('Terjadi masalah. Mohon dicoba beberapa saat lagi');
    }
  }
}
