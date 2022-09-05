import 'package:logger/logger.dart';
import 'package:withings_flutter/withings_flutter.dart';

/// [WithingsMeasureGetworkoutsDataManager] is a class the manages the requests related to [WithingsMeasureGetworkoutsData]
class WithingsMeasureGetworkoutsDataManager extends WithingsDataManager {
  WithingsMeasureGetworkoutsDataManager({required String accessToken})
      : super(
          accessToken: accessToken,
        );

  @override
  Future<WithingsData> fetch(WithingsAPIURL withingsUrl) async {
    // Get the response
    final response = await getResponse(withingsUrl);

    // Debugging
    final logger = Logger();
    logger.i('$response');

    //Extract data and return them
    WithingsData ret = _extractWithingsMeasureGetworkoutsData(response);
    return ret;
  } // fetch

  /// A private method that extracts [WithingsMeasureGetactivityData] from the given response.
  WithingsMeasureGetworkoutsData _extractWithingsMeasureGetworkoutsData(
      dynamic response) {
    if (response['status'] == 0) {
      return WithingsMeasureGetworkoutsData.fromJson(response);
    } else {
      return WithingsMeasureGetworkoutsData();
    }
  } // _extractWithingsMeasureGetworkoutsData
} // WithingsMeasureGetworkoutsDataManager