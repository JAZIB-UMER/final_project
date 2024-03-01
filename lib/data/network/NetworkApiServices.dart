import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:cv_maker/data/app_exceptions.dart';
import 'package:cv_maker/data/network/BaseApiServices.dart';
import 'package:http/http.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(
            Uri.parse(url),
          )
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      //SocketException -> No Internet Exception
      throw FetchDataExceptions('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      //SocketException -> No Internet Exception
      throw FetchDataExceptions('No Internet Connection');
    }

    return responseJson;
  }

  // For Returning Response from Api Call
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException(response.body.toString());

      case 404:
        throw UnauthorizedException(response.body.toString());

      default:
        throw FetchDataExceptions(
            'Error occurred While Communicating with server '
            'with status code ${response.statusCode.toString()}');
    }
  }
}
