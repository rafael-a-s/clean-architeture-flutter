import 'package:clean_architeture_flutter/features/core/constants/constants.dart';
import 'package:clean_architeture_flutter/features/core/routes/app_routes.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/home/components/app_bar_home.component.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/home/components/card_expense.component.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/home/components/card_monthly_contribution.component.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/home/components/card_sub_total_monthly.component.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/home/components/card_total_spend_week.component.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/home/components/card_transaction.component.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/home/components/wage_info.component.dart';
import 'package:clean_architeture_flutter/features/presenter/modules/home/controller/home.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.read(homeStateProvider.notifier).getUserLogged();
    });
  }

  @override
  Widget build(BuildContext context) {
    final loading =
        ref.watch(homeStateProvider.select((value) => value.isLoading));

    final authUser =
        ref.watch(homeStateProvider.select((value) => value.authUser));

    loading ? context.loaderOverlay.show() : context.loaderOverlay.hide();

    return Scaffold(
      backgroundColor: AppColors.second,
      body: Padding(
        padding: AppDefaults.padinngDefault,
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                ),
              ),
              AppBarHomeComponent(
                id: authUser!.id,
                name: authUser.name,
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              const SliverToBoxAdapter(
                child: WageInfoComponent(),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CardExpenseComponent(),
                    Column(
                      children: [
                        const CardTotalSpendWeekComponent(),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () => Modular.to
                              .pushNamed(AppRoutes.monthlyContribution),
                          child: const CardMonthlyContributionComponent(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              const SliverToBoxAdapter(
                child: CardSubTotalMonthlyComponent(),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transações",
                      style: AppDefaults.textStyleHeader2,
                    ),
                    Text(
                      "Ver tudo",
                      style: AppDefaults.textStyleHeader2,
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              const SliverToBoxAdapter(
                child: CardTransactionComponent(),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              const SliverToBoxAdapter(
                child: CardTransactionComponent(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
