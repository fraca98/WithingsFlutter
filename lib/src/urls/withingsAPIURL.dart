import 'package:withings_flutter/src/urls/withingsNoHeadAPIURL.dart';

/// [WithingsAPIURL] is the abstract class (extending [WithingsNoHeadAPIURL]) implementing the data model of a url of Withings APIs
abstract class WithingsAPIURL extends WithingsNoHeadAPIURL{

  /// The authorization header of the url
  String? authorizationHeader;

  /// Default [WithingsAPIURL] constructor.
  WithingsAPIURL({this.authorizationHeader});
}
