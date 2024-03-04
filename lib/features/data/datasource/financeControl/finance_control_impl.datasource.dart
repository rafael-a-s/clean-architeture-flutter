import 'package:clean_architeture_flutter/core/data/datasources/base.datasource.dart';
import 'package:clean_architeture_flutter/core/domain/base_json.convert.dart';
import 'package:clean_architeture_flutter/features/core/constants/app_routes_api.dart';
import 'package:clean_architeture_flutter/features/data/datasource/financeControl/finance_control.datasource.dart';
import 'package:clean_architeture_flutter/features/data/model/financeControl/finance_control.model.dart';
import 'package:clean_architeture_flutter/features/data/model/financeControl/finance_control_metric.model.dart';
import 'package:clean_architeture_flutter/features/domain/entity/financeControl/finance_control.entity.dart';
import 'package:dio/dio.dart';

class FinanceControlDatasourceImpl
    extends BaseDatasource<FinanceControl, String>
    implements FinanceControlDatasource {
  JsonModelConvert<FinanceControlModel> convert = JsonModelConvert(
    fromJson: (json) => FinanceControlModel.fromJson(json),
    toJson: (convert) => convert.toJson(), //nao implementado
  );

  FinanceControlDatasourceImpl({required super.client, required super.api});

  @override
  JsonModelConvert<FinanceControl> getJsonConvert() {
    return convert;
  }

  @override
  Future<FinanceControlMetricModel> financeControlMetrics() async {
    try {
      final response = await client.get(AppRoutesApi.financeControlMetrics);
      final data = response.data;
      return FinanceControlMetricModel.fromJson(data);
    } on DioError catch (e) {
      throw DioError(requestOptions: RequestOptions(path: ""), error: e.error);
    }
  }
}
