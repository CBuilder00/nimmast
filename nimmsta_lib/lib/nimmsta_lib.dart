export 'nimmsta_lib.dart';
export 'nimmsta_config.dart';
export 'user_client.dart';

import 'package:nimmsta_lib/nimmsta_config.dart';

/// `NimmstaLib` serves as a central manager for the Nimmsta library.
///
/// This class provides a mechanism manage all aspects of the library and its lifecycle
/// it could be used to explicitly initialize it and pass custom configurations that
/// determines its behavior.
class NimmstaLib {
  static NimmstaConfig? _config;

  /// Initializes `NimmstaLib` with optional custom configuration.
  ///
  /// Calling this method is optional, if not explicitly called with a custom 
  /// configuration object, the library will fall back to default configurations.
  static void initialize({NimmstaConfig? config}) {
    if (_config != null)
      throw Exception('Library could only be initialized once.');
    _config = config;
  }

  /// Provides access to the current configuration of `NimmstaLib`.
  ///
  /// This getter returns the [NimmstaConfig] object as set during the initialization.
  /// If the library has not been initialized with a custom configuration, it returns a 
  /// default [NimmstaConfig] instance.
  static NimmstaConfig get config {
    if (_config == null) {
      _config = NimmstaConfig();
    }
    return _config!;
  }
}
