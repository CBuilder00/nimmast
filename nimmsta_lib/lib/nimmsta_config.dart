/// `NimmstaConfig` is a configuration class used to define configurations for [NimmstaLib].
class NimmstaConfig {
  /// The duration before a network operation times out.
  ///
  /// This is used to set a limit on how long any of the network operations should take
  /// before timing out. This includes connection establishing, requesting, or waiting for
  /// response.
  final Duration timeout;

  /// Constructs a [NimmstaConfig] instance.
  ///
  /// If no timeout is provided, it defaults to 30 seconds.
  /// 
  /// The timeout is used to set a limit on how long any of the network operations should 
  /// take before timing out. This includes connection establishing, requesting, or waiting for
  /// response.
  NimmstaConfig({this.timeout = const Duration(seconds: 30)});
}
