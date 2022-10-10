import 'package:logger/logger.dart';
import 'package:withings_flutter/withings_flutter.dart';

/// [WithingsMeasureGetIntradayactivityDataManager] is a class the manages the requests related to [WithingsMeasureGetintradayactivityData]
class WithingsMeasureGetIntradayactivityDataManager
    extends WithingsDataManager {
  WithingsMeasureGetIntradayactivityDataManager();
  
  @override
  Future<WithingsMeasureGetIntradayactivityData> fetch(WithingsAPIURL withingsUrl) async {
    // Get the response
    final response = await getResponse(withingsUrl);

    // Debugging
    final logger = Logger();
    logger.i('$response');

    //Extract data and return them
    WithingsMeasureGetIntradayactivityData ret =
        _extractWithingsMeasureGetaintradayactivityData(response);
    return ret;
  } // fetch

  /// A private method that extracts [WithingsMeasureGetIntradayactivityData] from the given response.
  WithingsMeasureGetIntradayactivityData
      _extractWithingsMeasureGetaintradayactivityData(dynamic response) {
    if (response['status'] == 0) {
      return WithingsMeasureGetIntradayactivityData.fromJson(response);
    } else {
      return WithingsMeasureGetIntradayactivityData();
    }
  } // _extractWithingsMeasureGetaIntradayactivityData
} // WithingsMeasureGetaIntradayactivityDataManager