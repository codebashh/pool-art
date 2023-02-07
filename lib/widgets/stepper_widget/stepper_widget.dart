import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:poolart/configs/configs.dart';
import 'package:poolart/providers/quote_provider.dart';
import 'package:poolart/responsive/responsive.dart';
import 'package:poolart/utils/static_assets.dart';
import 'package:provider/provider.dart';

part 'step_widget.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quote = Provider.of<QuoteProvider>(context);

    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      spacing: Responsive.isMobile(context)
          ? AppDimensions.normalize(12)
          : AppDimensions.normalize(40),
      runSpacing: Responsive.isMobile(context)
          ? AppDimensions.normalize(5)
          : AppDimensions.normalize(10),
      children: StaticUtils.steps
          .asMap()
          .entries
          .map(
            (e) => InkWell(
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                if (e.value.isDone) {
                  quote.step = e.key;
                  quote.controller.animateToPage(
                    e.key,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: StepWidget(
                icon: e.value.icon,
                isActive: e.key == quote.step,
                isDone: e.value.isDone,
                text: e.value.text,
                index: e.key,
              ),
            ),
          )
          .toList(),
    );
  }
}
