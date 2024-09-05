import 'package:mesa_app/services/repository.dart';
import 'package:mesa_app/utils/global_variables.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'provider.g.dart';

@riverpod
Future<(bool success, String msg)> register(RegisterRef ref,
    {String? fullName,
    String? email,
    String? userType,
    String? password}) async {
  var resp = await repository
      .makeRequest(RequestTypes.post, isProtected: false, reqBody: {
    "full_name": fullName,
    "email": email,
    "user_password": password,
    "user_type": userType
  });
  return (resp.success, resp.message);
}
