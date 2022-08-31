import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:logger/logger.dart';
import 'package:withings_flutter/src/urls/withingsAuthAPIURL.dart';

class WithingsConnector {
  ///Method that implements the OAuth 2.0 protocol and returns the
  ///access and refresh tokens from Withings APIs.
  static Future<List<String?>> authorize({
    BuildContext? context,
    required String clientID,
    required String clientSecret,
    required String state,
    required String scope,
    required String redirectUri,
    required String callbackUrlScheme,
  }) async {
    // Initialize tokens as null
    String? accessToken;
    String? refreshToken;

    //Instantiate Dio and its Response
    Dio dio = Dio();
    Response response;

    //Generate the Withings url for granting the authorization code
    final withingsAuthorizeFormUrl = WithingsAuthAPIURL.authorizeForm(
      clientID: clientID,
      state: state,
      scope: scope,
      redirectUri: redirectUri,
    );

    //Perform authentication
    try {
      final result = await FlutterWebAuth.authenticate(
          url: withingsAuthorizeFormUrl.url!,
          callbackUrlScheme: callbackUrlScheme);

      //Get the authorization code
      final code = Uri.parse(result).queryParameters['code'];

      //Get the state (check if spoofed or not)
      final retuned_state = Uri.parse(result).queryParameters['state'];

      //Generate the Withings url to retrieve the accessToken and the refreshToken
      final withingsAuthorizeUrl = WithingsAuthAPIURL.authorize(
          redirectUri: redirectUri,
          authorizationCode: code,
          clientID: clientID,
          clientSecret: clientSecret);

      response = await dio.post(
        withingsAuthorizeUrl.url!,
        data: withingsAuthorizeUrl.data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );

      //Debugging
      final logger = Logger();
      logger.i('$response');

      //Show the tokens
      accessToken = response.data['body']['access_token'] as String;
      refreshToken = response.data['body']['refresh_token'] as String;
    } catch (e) {
      print(e);
    } // catch
    return [accessToken, refreshToken]; //Return the tokens

    //TO DO: check if spoofed state, error to show if authorization code is not granted, too much time to get tokens
  } //authorize

  ///Method that refreshes the Withings access token.
  static Future<List<String?>> refreshToken({
    required String clientID,
    required String clientSecret,
    required String WithingsRefreshToken,
  }) async {
    //Initialize tokens as null
    String? accessToken;
    String? refreshToken;

    //Instantiate Dio and its Response
    Dio dio = Dio();
    Response response;

    //Generate the Withings url
    final withingRefreshUrl = WithingsAuthAPIURL.refreshToken(
      clientID: clientID,
      clientSecret: clientSecret,
      refreshToken: WithingsRefreshToken,
    );

    try {
      //Post refresh query to Withings API
      response = await dio.post(
        withingRefreshUrl.url!,
        data: withingRefreshUrl.data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );

      //Debugging
      final logger = Logger();
      logger.i('$response');

      //Display the new tokens
      accessToken = response.data['body']['access_token'] as String;
      refreshToken = response.data['body']['refresh_token'] as String;
    } catch (e) {
      print(e);
    }

    return [accessToken, refreshToken];
    //TODO: manage errors about refresh code invalid, no internet
  } //refreshToken

}
