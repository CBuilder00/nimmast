import 'package:nimmsta_lib/nimmsta_exception.dart';
import 'package:nimmsta_lib/src/dio_exception.dart';
import 'package:nimmsta_lib/src/dio_manager.dart';
import 'package:nimmsta_lib/src/json_place_holder_api.dart';
import 'package:nimmsta_model/nimmsta_model.dart';

/// [UserClient] class provides access to user data to perform operations
/// like fetching, creating, updating, and deleting.
class UserClient {
  final JsonPlaceHolderApi _apiService;

  /// Constructs a [UserClient].
  UserClient({JsonPlaceHolderApi? jsonPlaceHolderApi})
      : _apiService =
            jsonPlaceHolderApi ?? JsonPlaceHolderApi(DioManager.getInstance());

  /// Fetches a list of users.
  ///
  /// Returns a `Future` that resolves to a list of [User] objects.
  /// Throws [ResponseException], [TimeoutException], [NetworkException], or [UnknownException]
  /// for any errors that occur during the API call.
  Future<List<User>> getUsers() async {
    try {
      return await _apiService.getUsers();
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// Creates a new user with the provided [user] details.
  ///
  /// Accepts a [User] object and returns a `Future` that resolves to the created [User].
  /// Throws [ResponseException], [TimeoutException], [NetworkException], or [UnknownException]
  /// for any errors that occur during the API call.
  Future<User> createUser(User user) async {
    try {
      return await _apiService.createUser(user);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// Updates an existing user identified by [id] with the new [user] details.
  ///
  /// Accepts a user ID and a [User] object. Returns a `Future` that resolves to the updated [User].
  /// Throws [ResponseException], [TimeoutException], [NetworkException], or [UnknownException]
  /// for any errors that occur during the API call.
  Future<User> updateUser(int id, User user) async {
    try {
      return await _apiService.updateUser(id, user);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// Deletes a user identified by [id].
  ///
  /// Accepts a user ID and returns a `Future` that resolves to `void`.
  /// Throws [ResponseException], [TimeoutException], [NetworkException], or [UnknownException]
  /// for any errors that occur during the API call.
  Future<void> deleteUser(int id) async {
    try {
      return await _apiService.deleteUser(id);
    } catch (e) {
      throw _handleError(e);
    }
  }

  NimmstaException _handleError(dynamic e) {
    if (e is ResponseDioException) {
      return ResponseException(e.message ?? '', e.statusCode);
    } else if (e is TimeoutDioException) {
      return TimeoutException(e.message ?? '');
    } else if (e is NetworkDioException) {
      return NetworkException(e.message ?? '');
    } else {
      return UnknownException(e.message ?? '');
    }
  }
}
