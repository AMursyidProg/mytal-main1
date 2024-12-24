import 'package:flutter/material.dart';
import 'package:mytal/util/app_colors.dart';
import 'package:mytal/util/dimensions.dart';

class ComplicationsTabView extends StatelessWidget {
  final Widget profileComplicationsView;
  final Widget therapyComplicationsView;
  const ComplicationsTabView({
    required this.profileComplicationsView,
    required this.therapyComplicationsView,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Theme(
            data: theme.copyWith(
              colorScheme: theme.colorScheme.copyWith(
                surfaceContainerHighest: Colors.transparent,
              ),
            ),
            child: Container(
              color: Colors.white.withOpacity(0.8),
              child: TabBar(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: Dimensions.paddingSizeSmall),
                unselectedLabelColor: AppColors.color(context, 500),
                labelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(borderRadius: BorderRadius.circular(100), color: AppColors.color(context, 500)),
                tabs: [
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(100), border: Border.all(color: AppColors.color(context, 500), width: 1)),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text("Medical"),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(100), border: Border.all(color: AppColors.color(context, 500), width: 1)),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text("From Therapy"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                profileComplicationsView,
                therapyComplicationsView,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
