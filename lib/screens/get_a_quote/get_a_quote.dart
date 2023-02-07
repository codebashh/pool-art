import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:poolart/configs/app.dart';
import 'package:poolart/configs/configs.dart';
import 'package:poolart/localization/locale_keys.g.dart';
import 'package:poolart/providers/quote_provider.dart';
import 'package:poolart/providers/scroll_provider.dart';
import 'package:poolart/responsive/responsive.dart';
import 'package:poolart/utils/static_assets.dart';
import 'package:poolart/widgets/bottom_page.dart';
import 'package:poolart/widgets/bottom_page_mobile.dart';
import 'package:poolart/widgets/custom_button.dart';
import 'package:poolart/widgets/custom_form_builder.dart';
import 'package:poolart/widgets/label.dart';
import 'package:poolart/widgets/stepper_widget/stepper_widget.dart';
import 'package:provider/provider.dart';

part 'views/desktop.dart';
part 'views/tablet.dart';
part 'views/mobile.dart';

part 'views/widgets/_1_shape.dart';
part 'views/widgets/_2_dimensions.dart';
part 'views/widgets/_3_depth.dart';
part 'views/widgets/_4_color.dart';
part 'views/widgets/_5_send_request.dart';
part 'views/widgets/_3_depth_mobile.dart';

class GetAQuoteScreen extends StatefulWidget {
  const GetAQuoteScreen({Key? key}) : super(key: key);

  @override
  State<GetAQuoteScreen> createState() => _GetAQuoteScreenState();
}

class _GetAQuoteScreenState extends State<GetAQuoteScreen> {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final scroll = Provider.of<ScrollProvider>(context, listen: false);
      controller.addListener(() {
        if (controller.position.userScrollDirection ==
            ScrollDirection.reverse) {
          scroll.scroll = true;
        }
        if (controller.position.pixels == 0.0) {
          scroll.scroll = false;
        }
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Responsive(
            mobile: Mobile(
              controller: controller,
            ),
            tablet: Mobile(
              controller: controller,
            ),
            desktop: Desktop(
              controller: controller,
            ),
          ),
        ),
      ),
    );
  }
}
