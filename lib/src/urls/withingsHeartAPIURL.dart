import 'package:withings_flutter/withings_flutter.dart';

/// [WithingsHeartAPIURL] is a class that expresses multiple factory
/// constructors to be used to generate Withings Web APIs urls to fetch
/// [WithingsHeartListData],[WithingsHeartGetData]
class WithingsHeartAPIURL extends WithingsAPIURL {
  ///Default [WithingsHeartAPIURL] constructor
  WithingsHeartAPIURL(
      {String? url, Map<String, dynamic>? data, String? authorizationHeader}) {
    // super fields
    this.url = url;
    this.data = data;
    this.authorizationHeader = authorizationHeader;
  } // WithingsHeartAPIURL

  /// Generates a [WithingsHeartAPIURL] to get [WithingsHeartListData] of a specific date range
  /// between [startdate] and [enddate], if specified, of a given user [accessToken]. The offset [offset] is used if we have more
  /// data to retrieve
  factory WithingsHeartAPIURL.list({
    int? startdate,
    int? enddate,
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

  /// Generates a [WithingsHeartAPIURL] to get [WithingsSleepGetData] of a given user [accessToken]
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
