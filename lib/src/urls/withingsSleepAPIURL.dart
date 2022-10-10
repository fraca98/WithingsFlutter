import 'package:withings_flutter/withings_flutter.dart';

/// [WithingsSleepAPIURL] is a class that expresses multiple factory
/// constructors to be used to generate Withings Web APIs urls to fetch
/// [WithingsSleepGetData],[WithingsMeasureGetActivityData]
class WithingsSleepAPIURL extends WithingsAPIURL {
  ///Default [WithingsSleepAPIURL] constructor
  WithingsSleepAPIURL(
      {String? url, Map<String, dynamic>? data, String? authorizationHeader}) {
    // super fields
    this.url = url;
    this.data = data;
    this.authorizationHeader = authorizationHeader;
  } // WithingsHeartAPIURL

  /// Generates a [WithingsSleepAPIURL] to get [WithingsSleepGetData] of a specific date range
  /// between [startdate] and [enddate] of a given user [accessToken], defining the data fields we want
  /// to retrieve [dataFields]. If your input startdate and enddate are separated by more than 24h, only the first 24h after startdate will be returned
  factory WithingsSleepAPIURL.get({
    required int startdate,
    required int enddate,
    required String dataFields,
    required String accessToken,
  }) {
    return WithingsSleepAPIURL(
      url: 'https://wbsapi.withings.net/v2/sleep',
      data: {
        'action': 'get',
        'startdate': startdate,
        'enddate': enddate,
        'data_fields': dataFields,
      },
      authorizationHeader: 'Bearer $accessToken',
    );
  }

  /// Generates a [WithingsSleepAPIURL] to get [WithingsMeasureGetActivityData] of a specific date range
  /// between [startdateymd] and [enddateymd] of a given user [accessToken], defining the data fields we want
  /// to retrieve [dataFields]
  factory WithingsSleepAPIURL.getSummaryRange({
    required String startdateymd,
    required String enddateymd,
    String? dataFields,
    int? offset,
    required String accessToken,
  }) {
    return WithingsSleepAPIURL(
      url: 'https://wbsapi.withings.net/v2/sleep',
      data: {
        'action': 'getsummary',
        'startdateymd': startdateymd,
        'enddateymd': enddateymd,
        'offset': offset,
      },
      authorizationHeader: 'Bearer $accessToken',
    );
  }

  /// Generates a [WithingsSleepAPIURL] to get [WithingsMeasureGetActivityData] from the last time that data
  /// were updated or created after the date in [lastupdate] of a given user [accessToken], defining the data fields we want
  /// to retrieve [dataFields]
  factory WithingsSleepAPIURL.getSummaryLastupdate({
    required int lastupdate,
    String? dataFields,
    int? offset,
    required String accessToken,
  }) {
    return WithingsSleepAPIURL(
      url: 'https://wbsapi.withings.net/v2/sleep',
      data: {
        'action': 'getsummary',
        'lastupdate': lastupdate,
        'data_fields': dataFields,
        'offset': offset,
      },
      authorizationHeader: 'Bearer $accessToken',
    );
  }
}
