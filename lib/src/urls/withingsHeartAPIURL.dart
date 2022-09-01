import 'package:withings_flutter/withings_flutter.dart';

/// [WithingsHeartAPIURL] is a class that expresses multiple factory
/// constructors to be used to generate Withings Web APIs urls to fetch
/// [WithingsHeartData]
class WithingsHeartAPIURL extends WithingsAPIURL {
  ///The data to be attached to the url
  Map<String, dynamic>? data;

  /// The authorization header of the url
  String? authorizationHeader;

  ///Default [WithingsHeartAPIURL] constructor
  WithingsHeartAPIURL(
      {String? url, Map<String, dynamic>? data, String? authorizationHeader}) {
    // super fields
    this.url = url;

    // WithingsHeartAPIURL fields
    this.data = data;
    this.authorizationHeader = authorizationHeader;
  } // WithingsHeartAPIURL

  /// Generates a [WithingsHeartAPIURL] to get [WithingsHeartListData] of a specific date range
  /// between [startdate] and [enddate] of a given user [accessToken]. The offset is used if we have more
  /// data to retrieve
  factory WithingsHeartAPIURL.list({
    required int startdate,
    required int enddate,
    required String accessToken,
    int? offset,
  }) {
    return WithingsHeartAPIURL(
      url: 'https://wbsapi.withings.net/v2/heart',
      data: {
        'action': 'list',
        'startdate': startdate,
        'enddate': enddate,
        'offset': offset,
      },
      authorizationHeader: 'Bearer $accessToken',
    );
  }

  /// Generates a [WithingsHeartAPIURL] to get [WithingsHeartGetData] of a specific ECG of a given user [accessToken]
  factory WithingsHeartAPIURL.get({
    required int signalId,
    required String accessToken,
  }) {
    return WithingsHeartAPIURL(
      url: 'https://wbsapi.withings.net/v2/heart',
      data: {
        'action': 'get',
        'signalid': signalId,
      },
      authorizationHeader: 'Bearer $accessToken',
    );
  }
}
