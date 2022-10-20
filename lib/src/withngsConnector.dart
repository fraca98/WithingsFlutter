import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:logger/logger.dart';
import 'package:withings_flutter/src/urls/withingsAuthAPIURL.dart';

/// [WithingsConnector] is a class that is in charge of managing the connection authorization
/// between the app and Withings APIs.
/// In details, it can authorize the app giving the access and refresh tokens (see
/// [WithingsConnector.authorize] for more details), refresh the access token (see
/// [WithingsConnector.refreshToken] for more details)

/// [WithingsCredentials] is a class that is in charge of managing the credentials to be used
/// to make requests to the Withings Web APIs: [userID], [withingsAccessToken], and [withingsRefreshToken].
class WithingsCredentials {
  /// The user id associated to the credentials.
  String userID;

  /// The Withings access token associated to the credentials.
  String withingsAccessToken;

  /// The Withings refresh token associated to the credentials.
  String withingsRefreshToken;

  /// Time for the access token to expire
  int expires;

  /// Default constructor of [WithingsCredentials].
  WithingsCredentials({
    required this.userID,
    required this.withingsAccessToken,
    required this.withingsRefreshToken,
    required this.expires,
  });

  @override
  String toString() {
    return (StringBuffer('WithingsCredentials(')
          ..write('userID: $userID, ')
          ..write('withingsAccessToken: $withingsAccessToken, ')
          ..write('withingsRefreshToken: $withingsRefreshToken, ')
          ..write('expires: $expires')
          ..write(')'))
        .toString();
  } // toString
}

class WithingsConnector {
  /// Method that implements the OAuth 2.0 protocol and returns the
  /// access and refresh tokens from Withings APIs.
  static Future<WithingsCredentials?> authorize({
    required String clientID,
    required String clientSecret,
    required String scope,
    required String redirectUri,
    required String callbackUrlScheme,
  }) async {
    // Initialize state as random number: used to check if spoofed
    String state = Random().nextInt(pow(2, 32).toInt()).toString();

    // Instantiate Dio and its Response
    Dio dio = Dio();
    Response response;

    // Generate the Withings url for granting the authorization code
    final withingsAuthorizeFormUrl = WithingsAuthAPIURL.authorizeForm(
      clientID: clientID,
      state: state,
      scope: scope,
      redirectUri: redirectUri,
    );

    // instanciate object of WithingsCredentials
    WithingsCredentials? withingsCredentials;

    // Perform authentication
    try {
      final result = await FlutterWebAuth.authenticate(
          url: withingsAuthorizeFormUrl.url!,
          callbackUrlScheme: callbackUrlScheme);

      // Get the authorization code
      final code = Uri.parse(result).queryParameters['code'];

      // Get the state (check if spoofed or not)
      final returned_state = Uri.parse(result).queryParameters['state'];
      if (returned_state != state) {
        print('The connection has been spoofed!');
        return withingsCredentials;
      }

      // Generate the Withings url to retrieve the accessToken and the refreshToken
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

      // Debugging
      final logger = Logger();
      logger.i('$response');

      // Get userId and tokens
      final userID = response.data['body']['userid'] as String;
      final accessToken = response.data['body']['access_token'] as String;
      final refreshToken = response.data['body']['refresh_token'] as String;
      final expiresin = response.data['body']
          ['expires_in']; //time to expire for accessToken in seconds

      withingsCredentials = WithingsCredentials(
          userID: userID,
          withingsAccessToken: accessToken,
          withingsRefreshToken: refreshToken,
          expires: expiresin);
    } catch (e) {
      //print(e);
    } // catch
    return withingsCredentials;
  } // authorize

  /// Method that refreshes the Withings access token.
  static Future<WithingsCredentials?> refreshToken({
    required String clientID,
    required String clientSecret,
    required String withingsRefreshToken,
  }) async {
    // Instantiate Dio and its Response
    Dio dio = Dio();
    Response response;

    // Generate the Withings url
    final withingRefreshUrl = WithingsAuthAPIURL.refreshToken(
      clientID: clientID,
      clientSecret: clientSecret,
      refreshToken: withingsRefreshToken,
    );

    //new WithingsCredentials instantiate
    WithingsCredentials? newWithingsCredentials;

    try {
      // Post refresh query to Withings API
      response = await dio.post(
        withingRefreshUrl.url!,
        data: withingRefreshUrl.data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );

      // Debugging
      final logger = Logger();
      logger.i('$response');

      // Overwrite the new tokens
      final userID = response.data['body']
          ['userid']; //here userID in refresh is given back as int
      final accessToken = response.data['body']['access_token'] as String;
      final refreshToken = response.data['body']['refresh_token'] as String;
      final expiresin = response.data['body']
          ['expires_in']; //time to expire for accessToken in seconds

      newWithingsCredentials = WithingsCredentials(
          userID: userID.toString(),
          withingsAccessToken: accessToken,
          withingsRefreshToken: refreshToken,
          expires: expiresin);
    } catch (e) {
      //print(e);
    }
    return newWithingsCredentials;
  } // refreshToken

}
