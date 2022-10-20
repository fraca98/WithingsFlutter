import 'package:withings_flutter/withings_flutter.dart';

/// [WithingsMeasureAPIURL] is a class that expresses multiple factory
/// constructors to be used to generate Withings Web APIs urls to fetch
/// [WithingsMeasureGetMeasData],[WithingsMeasureGetActivityData],[WithingsMeasureGetIntradayactivityData],[WithingsMeasureGetWorkoutsData]
class WithingsMeasureAPIURL extends WithingsAPIURL {
  ///Default [WithingsMeasureAPIURL] constructor
  WithingsMeasureAPIURL(
      {String? url, Map<String, dynamic>? data, String? authorizationHeader}) {
    // super fields
    this.url = url;
    this.data = data;
    this.authorizationHeader = authorizationHeader;
  } // WithingsMeasureAPIURL

  /// Generates a [WithingsMeasureAPIURL] to get [WithingsMeasureGetMeasData] of a specific date range
  /// between [startdate] and [enddate] of a given user [accessToken], defining the measures we want
  /// to retrieve [meastypes]. The offset [offset] is used if we have more data to retrieve, category [category]
  /// is used to request for real measures or user objectives
  factory WithingsMeasureAPIURL.getMeasRange({
    String? meastypes,
    int? category,
    required int startdate,
    required int enddate,
    //int? offset, //present in the documentation of the API, but not the field offset in the response, so removed
    required String accessToken,
  }) {
    return WithingsMeasureAPIURL(
      url: 'https://wbsapi.withings.net/v2/measure',
      data: {
        'action': 'getmeas',
        'meastypes': meastypes,
        'category': category,
        'startdate': startdate,
        'enddate': enddate,
        //'offset': offset,
      },
      authorizationHeader: 'Bearer $accessToken',
    );
  }

  /// Generates a [WithingsMeasureAPIURL] to get [WithingsMeasureGetMeasData] from the last time that data
  /// were updated or created after the date in [lastupdate] of a given user [accessToken], defining the measures we want
  /// to retrieve [meastypes]. The offset [offset] is used if we have more data to retrieve, category [category]
  /// is used to request for real measures or user objectives
  factory WithingsMeasureAPIURL.getMeasLastupdate({
    String? meastypes,
    int? category,
    required int lastupdate,
    //int? offset, //present in the documentation of the API, but not the field offset in the response, so removed
    required String accessToken,
  }) {
    return WithingsMeasureAPIURL(
      url: 'https://wbsapi.withings.net/v2/measure',
      data: {
        'action': 'getmeas',
        'meastypes': meastypes,
        'category': category,
        'lastupdate': lastupdate,
        //'offset': offset,
      },
      authorizationHeader: 'Bearer $accessToken',
    );
  }

  /// Generates a [WithingsMeasureAPIURL] to get [WithingsMeasureGetActivityData] of a specific date range
  /// between [startdateymd] and [enddateymd] of a given user [accessToken], defining the data fields we want
  /// to retrieve [dataFields]. The offset [offset] is used if we have more data to retrieve
  factory WithingsMeasureAPIURL.getActivityRange({
    required String startdateymd,
    required String enddateymd,
    String? dataFields,
    int? offset,
    required String accessToken,
  }) {
    return WithingsMeasureAPIURL(
      url: 'https://wbsapi.withings.net/v2/measure',
      data: {
        'action': 'getactivity',
        'startdateymd': startdateymd,
        'enddateymd': enddateymd,
        'datafields': dataFields,
        'offset': offset,
      },
      authorizationHeader: 'Bearer $accessToken',
    );
  }

  /// Generates a [WithingsMeasureAPIURL] to get [WithingsMeasureGetActivityData] from the last time that data
  /// were updated or created after the date in [lastupdate] of a given user [accessToken], defining the data fields we want
  /// to retrieve [dataFields]. The offset [offset] is used if we have more data to retrieve
  factory WithingsMeasureAPIURL.getActivityLastupdate({
    required int lastupdate,
    String? dataFields,
    int? offset,
    required String accessToken,
  }) {
    return WithingsMeasureAPIURL(
      url: 'https://wbsapi.withings.net/v2/measure',
      data: {
        'action': 'getactivity',
        'lastupdate': lastupdate,
        'datafields': dataFields,
        'offset': offset,
      },
      authorizationHeader: 'Bearer $accessToken',
    );
  }

  /// Generates a [WithingsMeasureAPIURL] to get [WithingsMeasureGetIntradayactivityData] of a specific date range
  /// between [startdate] and [enddate] of a given user [accessToken], defining the data fields we want
  /// to retrieve [dataFields].
  ///  - If your input startdate and enddate are separated by more than 24h, only the first 24h after startdate will be returned.
  ///  - If no startdate and enddate are passed as parameters, the most recent activity data will be returned.

  factory WithingsMeasureAPIURL.getIntradayactivity({
    int? startdate,
    int? enddate,
    String? dataFields,
    required String accessToken,
  }) {
    return WithingsMeasureAPIURL(
      url: 'https://wbsapi.withings.net/v2/measure',
      data: {
        'action': 'getintradayactivity',
        'startdate': startdate,
        'enddate': enddate,
        'data_fields': dataFields,
      },
      authorizationHeader: 'Bearer $accessToken',
    );
  }

  /// Generates a [WithingsMeasureAPIURL] to get [WithingsMeasureGetWorkoutsData] of a specific date range
  /// between [startdateymd] and [enddateymd] of a given user [accessToken], defining the data fields we want
  /// to retrieve [dataFields]. The offset [offset] is used if we have more data to retrieve
  factory WithingsMeasureAPIURL.getWorkoutsRange({
    required String? startdateymd,
    required String? enddateymd,
    String? dataFields,
    int? offset,
    required String accessToken,
  }) {
    return WithingsMeasureAPIURL(
      url: 'https://wbsapi.withings.net/v2/measure',
      data: {
        'action': 'getworkouts',
        'startdateymd': startdateymd,
        'enddateymd': enddateymd,
        'data_fields': dataFields,
        'offset': offset,
      },
      authorizationHeader: 'Bearer $accessToken',
    );
  }

  /// Generates a [WithingsMeasureAPIURL] to get [WithingsMeasureGetWorkoutsData] from the last time that data
  /// were updated or created after the date in [lastupdate] of a given user [accessToken], defining the data fields we want
  /// to retrieve [dataFields]. The offset [offset] is used if we have more data to retrieve
  factory WithingsMeasureAPIURL.getWorkoutsLastupdate({
    required int? lastupdate,
    String? dataFields,
    int? offset,
    required String accessToken,
  }) {
    return WithingsMeasureAPIURL(
      url: 'https://wbsapi.withings.net/v2/measure',
      data: {
        'action': 'getworkouts',
        'lastupdate': lastupdate,
        'data_fields': dataFields,
        'offset': offset,
      },
      authorizationHeader: 'Bearer $accessToken',
    );
  }
}
