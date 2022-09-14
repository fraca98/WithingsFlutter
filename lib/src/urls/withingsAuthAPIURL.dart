import 'package:withings_flutter/src/urls/withingsNoHeadAPIURL.dart';

/// [WithingsAuthAPIURL] is a class that expresses multiple factory
/// constructors to be used to generate Withings Web APIs urls to
/// be used by [WithingsConnector].
class WithingsAuthAPIURL extends WithingsNoHeadAPIURL {
  /// Default [WithingsAuthAPIURL] constructor.
  WithingsAuthAPIURL({String? url, Map<String, dynamic>? data}) {
    // super fields
    this.url = url;
    this.data = data;
  } // WithingsAuthAPIURL

  /// Factory constructor that generates a [WithingsAuthAPIURL] to be used
  /// to get to the Withings authorization form
  factory WithingsAuthAPIURL.authorizeForm({
    required String clientID,
    required String state,
    required String scope,
    required String redirectUri,
  }) {
    return WithingsAuthAPIURL(
      url: Uri.https('account.withings.com', 'oauth2_user/authorize2', {
        'response_type': 'code',
        'client_id': clientID,
        'state': state, // check if spoof or not in the response
        'scope': scope,
        'redirect_uri': redirectUri,
      }).toString(),
      data: null,
    );
  } // WithingsAuthAPIURL.authorizeForm

  /// Factory constructor that generates a [WithingsAuthAPIURL] to be used
  /// to get the access and refresh tokens
  factory WithingsAuthAPIURL.authorize({
    required String clientID,
    required String clientSecret,
    String? authorizationCode,
    required String redirectUri,
  }) {
    return WithingsAuthAPIURL(
        url: 'https://wbsapi.withings.net/v2/oauth2',
        data: {
          'action': 'requesttoken',
          'client_id': clientID,
          'client_secret': clientSecret,
          'grant_type': 'authorization_code',
          'code': authorizationCode,
          'redirect_uri': redirectUri,
        });
  } // WithingsAuthAPIURL.authorize

  /// Factory constructor that generates a [WithingsAuthAPIURL] to be used
  /// to refresh the access token
  factory WithingsAuthAPIURL.refreshToken(
      {required String clientID,
      required String clientSecret,
      required String refreshToken}) {
    return WithingsAuthAPIURL(
      url: 'https://wbsapi.withings.net/v2/oauth2',
      data: {
        'action': 'requesttoken',
        'client_id': clientID,
        'client_secret': clientSecret,
        'grant_type': 'authorization_code',
        'refresh_token': refreshToken
      },
    );
  } // WithingsAuthAPIURL.refreshToken

}
