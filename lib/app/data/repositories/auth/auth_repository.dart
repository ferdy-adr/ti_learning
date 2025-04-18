import '../../models/result.dart';
import '../../models/user.dart';

abstract class AuthRepository {
  Future<Result<User>> login({required String email, required String password});
}
