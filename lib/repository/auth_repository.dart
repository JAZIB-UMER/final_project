import 'package:cv_maker/data/network/BaseApiServices.dart';
import 'package:cv_maker/data/network/NetworkApiServices.dart';
import 'package:cv_maker/resources/consts/app_url.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
