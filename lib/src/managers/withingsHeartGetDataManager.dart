import 'package:logger/logger.dart';
import 'package:withings_flutter/withings_flutter.dart';

/// [WithingsHeartGetDataManager] is a class the manages the requests related to [WithingsSleepGetData]
class WithingsHeartGetDataManager extends WithingsDataManager {
  WithingsHeartGetDataManager();

  @override
  Future<WithingsHeartGetData> fetch(WithingsAPIURL withingsUrl) async {
    // Get the response
    final response = await getResponse(withingsUrl);

    // Debugging
    final logger = Logger();
    logger.i('$response');

    //Extract data and return them
    WithingsHeartGetData ret = _extractWithingsHeartGetData(response);
    return ret;
  } // fetch

  /// A private method that extracts [WithingsHeartGetData] from the given response.
  WithingsHeartGetData _extractWithingsHeartGetData(dynamic response) {
    return WithingsHeartGetData.fromJson(response);
  } // _extractWithingsHeartGetData
}
// WithingsHeartGetDataManager
