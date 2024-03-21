import 'package:clean_architeture_flutter/features/core/constants/app_routes_api.dart';
import 'package:clean_architeture_flutter/features/data/datasource/monthlyContribution/monthly_contribution.datasource.dart';
import 'package:clean_architeture_flutter/features/data/datasource/monthlyContribution/monthly_contribution_impl.datasource.dart';
import 'package:clean_architeture_flutter/features/data/repository/monthly_contribution_impl.repository.dart';
import 'package:clean_architeture_flutter/features/domain/repository/monthly_contribution.repository.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/monthlyContribution/create_monthly_contribution.usecase.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/monthlyContribution/delete_monthly_contribution.usecase.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/monthlyContribution/edit_monthly_contribution.usecase.dart';
import 'package:clean_architeture_flutter/features/domain/usecases/monthlyContribution/get_all_monthly_contribution.usecase.dart';
import 'package:clean_architeture_flutter/features/start/submodule/financeControl/submodule/monthlyContribution/controller/form_monthly_contribution.controller.dart';
import 'package:clean_architeture_flutter/features/start/submodule/financeControl/submodule/monthlyContribution/controller/monthly_contribution.controller.dart';
import 'package:clean_architeture_flutter/features/start/submodule/financeControl/submodule/monthlyContribution/pages/monthly_contribution.page.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MonthlyContributionModule extends Module {
  MonthlyContributionModule();

  @override
  void binds(Injector i) {
    i.addLazySingleton<Dio>(
      () {
        return Dio(BaseOptions(
          baseUrl: AppRoutesApi.baseUrl,
          connectTimeout: 20000,
          receiveTimeout: 20000,
        ));
      },
      config: BindConfig(
        onDispose: (dio) => dio.close(),
      ),
    );
    i.addSingleton<MonthlyContributionDatasource>(() =>
        MonthlyContributionDatasourceImpl(
            client: i.get<Dio>(), api: '/monthly-contribution'));
    i.addSingleton<MonthlyContributionRepository>(
        MonthlyContributionRepositoryImpl.new);
    i.add<CreateMonthlyContributionUsecase>(
        CreateMonthlyContributionUsecase.new);
    i.add<GetAllMonthlyContributionUsecase>(
        GetAllMonthlyContributionUsecase.new);
    i.add<DeleteMonthlyContributionUsecase>(
        DeleteMonthlyContributionUsecase.new);
    i.add<EditMonthlyContributionUsecase>(EditMonthlyContributionUsecase.new);
    i.add<FormMonthlyContributionController>(
        FormMonthlyContributionController.new);
    i.add<MonthlyContributionController>(MonthlyContributionController.new);
  }

  @override
  void routes(r) {
    r.child("/", child: (_) => const MonthlyContributionPage());
  }
}