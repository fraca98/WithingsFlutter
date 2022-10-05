import 'package:logger/logger.dart';
import 'package:withings_flutter/withings_flutter.dart';

/// [WithingsMeasureGetMeasDataManager] is a class the manages the requests related to [WithingsMeasureGetMeasData]
class WithingsMeasureGetMeasDataManager extends WithingsDataManager {
  WithingsMeasureGetMeasDataManager();

  @override
  Future<WithingsData> fetch(WithingsAPIURL withingsUrl) async {
    // Get the response
    final response = await getResponse(withingsUrl);

    // Debugging
    final logger = Logger();
    logger.i('$response');

    //Extract data and return them
    WithingsData ret = _extractWithingsMeasureGetMeasData(response);
    return ret;
  } // fetch

  /// A private method that extracts [WithingsMeasureGetMeasData] from the given response.
  WithingsMeasureGetMeasData _extractWithingsMeasureGetMeasData(
      dynamic response) {
    if (response['status'] == 0) {
      return WithingsMeasureGetMeasData.fromJson(response);
    } else {
      return WithingsMeasureGetMeasData();
    }
  } // _extractWithingsMeasureGetMeasData
} // WithingsMeasureGetMeasDataManager