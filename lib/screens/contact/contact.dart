import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:poolart/configs/app.dart';
import 'package:poolart/configs/configs.dart';
import 'package:poolart/localization/locale_keys.g.dart';
import 'package:poolart/providers/scroll_provider.dart';
import 'package:poolart/responsive/responsive.dart';
import 'package:poolart/utils/static_assets.dart';
import 'package:poolart/widgets/footer/chat_footer.dart';
import 'package:poolart/widgets/footer/footer.dart';
import 'package:provider/provider.dart';

part 'views/desktop.dart';
part 'views/tablet.dart';
part 'views/mobile.dart';

part 'views/widgets/_info_card.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
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
