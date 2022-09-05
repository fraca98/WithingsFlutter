import 'package:logger/logger.dart';
import 'package:withings_flutter/withings_flutter.dart';

/// [WithingsMeasureGetactivityDataManager] is a class the manages the requests related to [WithingsMeasureGetactivityData]
class WithingsMeasureGetactivityDataManager extends WithingsDataManager {
  WithingsMeasureGetactivityDataManager({required String accessToken})
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
    WithingsData ret = _extractWithingsMeasureGetactivityData(response);
    return ret;
  } // fetch

  /// A private method that extracts [WithingsMeasureGetactivityData] from the given response.
  WithingsMeasureGetactivityData _extractWithingsMeasureGetactivityData(
      dynamic response) {
    if (response['status'] == 0) {
      return WithingsMeasureGetactivityData.fromJson(response);
    } else {
      return WithingsMeasureGetactivityData();
    }
  } // _extractWithingsMeasureGetactivityData
} // WithingsMeasureGetactivityDataManager