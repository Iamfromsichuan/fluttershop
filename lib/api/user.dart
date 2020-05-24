import 'package:shop/entity/user.dart';
import 'package:shop/util/http_util.dart';

class UserApi {
  static Future<UserLoginResponseEntity> login(
      {UserLoginRequestEntity params}) async {
    var response = await HttpUtil().post("/users/login", params: params);
    return UserLoginResponseEntity.fromJson(response);
  }
}
