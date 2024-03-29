import 'package:clean_architeture_flutter/core/data/datasources/i_base.datasource.dart';
import 'package:clean_architeture_flutter/core/domain/base.entity.dart';
import 'package:clean_architeture_flutter/core/domain/base_json.convert.dart';
import 'package:dio/dio.dart';

abstract class BaseDatasource<T extends BaseEntity, ID>
    extends IBaseDatasource<T, ID> {
  final Dio client;
  BaseDatasource({required this.client, required super.api});

  @override
  Future<List<T>> getAll() async {
    try {
      final response = await client.get('${api}/all');
      final data = response.data as List;
      final JsonModelConvert<T> convert = getJsonConvert();
      return data.map((value) => convert.fromJson(value)).toList();
    } on DioError catch (e) {
      throw DioError(requestOptions: RequestOptions(path: ''), error: e.error);
    }
  }

  @override
  Future<T> get(ID id) async {
    try {
      final response = await client.get('$api/$id');
      final data = response.data;
      final JsonModelConvert<T> convert = getJsonConvert();
      return convert.fromJson(data);
    } on DioError catch (e) {
      throw DioError(requestOptions: RequestOptions(path: ""), error: e.error);
    }
  }

  @override
  Future<T> create(T model) async {
    try {
      final JsonModelConvert<T> convert = getJsonConvert();

      final response = await client.post(api, data: convert.toJson(model));
      final data = response.data;

      return convert.fromJson(data);
    } on DioError catch (e) {
      throw DioError(requestOptions: RequestOptions(path: ""), error: e.error);
    }
  }

  @override
  Future<T> update(T model) async {
    try {
      JsonModelConvert<T> convert = getJsonConvert();
      final response =
          await client.put('$api/${model.id}', data: convert.toJson(model));
      final data = response.data;
      return convert.fromJson(data);
    } on DioError catch (e) {
      throw DioError(requestOptions: RequestOptions(path: ""), error: e.error);
    }
  }

  @override
  Future<int?> delete(ID id) async {
    try {
      final response = await client.delete('$api/$id');
      final statusCodeNoContent = response.statusCode;

      return statusCodeNoContent;
    } on DioError catch (e) {
      throw DioError(requestOptions: RequestOptions(path: ""), error: e.error);
    }
  }
}
