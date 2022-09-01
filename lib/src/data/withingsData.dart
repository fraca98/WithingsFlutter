/// [WithingsData] is the abstract class implementing the data model
/// of Withings generated data.
abstract class WithingsData {
  /// Returns the status of a [WithingsData]
  String toString();

  /// Converts the [value] to a json.
  dynamic toJson<T extends WithingsData>();
} // WithingsData