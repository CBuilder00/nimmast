import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:nimmsta_model/nimmsta_model.dart';

part 'json_place_holder_api.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class JsonPlaceHolderApi {
  factory JsonPlaceHolderApi(Dio dio, {String baseUrl}) = _JsonPlaceHolderApi;

  @GET("/users")
  Future<List<User>> getUsers();

  @POST("/users")
  Future<User> createUser(@Body() User user);

  @PUT("/users/{id}")
  Future<User> updateUser(@Path("id") int id, @Body() User user);

  @DELETE("/users/{id}")
  Future<void> deleteUser(@Path("id") int id);
}
