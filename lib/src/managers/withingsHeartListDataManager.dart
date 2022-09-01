import 'package:logger/logger.dart';
import 'package:withings_flutter/withings_flutter.dart';

/// [WithingsHeartListDataManager] is a class the manages the requests related to [WithingsHeartListData]
class WithingsHeartListDataManager extends WithingsDataManager {
  
  WithingsHeartListDataManager({required String accessToken})
      : super(accessToken: accessToken);

  @override
  Future<WithingsData> fetch(WithingsAPIURL withingsUrl) async {
    // Get the response
    final response = await getResponse(withingsUrl);

    // Debugging
    final logger = Logger();
    logger.i('$response');

    //Extract data and return them
    WithingsData ret = _extractWithingsHeartListData(response);
    return ret;
  } // fetch

  /// A private method that extracts [WithingsHeartListData] from the given response.
  WithingsHeartListData _extractWithingsHeartListData(dynamic response) {
    if (response['status'] == 0) {
      return WithingsHeartListData.fromJson(response);
    } else {
      return WithingsHeartListData();
    }
  } // _extractWithingsHeartListData
}
 // WithingsHeartListDataManager

 //TO DO: implementare autoOffset