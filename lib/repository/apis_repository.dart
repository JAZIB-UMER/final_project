import 'package:cv_maker/data/network/BaseApiServices.dart';
import 'package:cv_maker/data/network/NetworkApiServices.dart';
import 'package:cv_maker/resources/consts/app_url.dart';

class GeneralApiRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> resumeApis(dynamic key) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.pexelsUrl);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
