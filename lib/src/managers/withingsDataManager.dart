import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:withings_flutter/withings_flutter.dart';

abstract class WithingsDataManager {

  /// The access token
  String accessToken;

  /// Default constructor
  WithingsDataManager({required this.accessToken});


  /// Method that fetches data from the Withings API.
  Future<void> fetch(WithingsAPIURL url);

  /// Method the obtains the response from the given [WithingsAPIURL].
  Future<dynamic> getResponse(WithingsAPIURL withingsUrl) async {

    // Instantiate Dio and its Response
    Dio dio = Dio();
    late Response response;

    try {
      // get the withings profile data
      response = await dio.post(
        withingsUrl.url!,
        data: withingsUrl.data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization': withingsUrl.authorizationHeader,
          },
        ),
      );
    } on DioError catch (e) { //TODO: gestione no internet connection
      print(e);
    } // try - catch

    final decodedResponse =
        response.data is String ? jsonDecode(response.data) : response.data;

    Future<dynamic> ret = Future.value(decodedResponse);
    return ret;
  } //getResponse
}
