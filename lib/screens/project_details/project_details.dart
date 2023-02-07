import 'package:community_material_icon/community_material_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:poolart/app_routes.dart';
import 'package:poolart/configs/app.dart';
import 'package:poolart/configs/configs.dart';
import 'package:poolart/cubits/projects/cubit.dart';
import 'package:poolart/dummy.dart';
import 'package:poolart/localization/locale_keys.g.dart';
import 'package:poolart/locator.dart';
import 'package:poolart/providers/scroll_provider.dart';
import 'package:poolart/responsive/responsive.dart';
import 'package:poolart/screens/project_details/views/widgets/points_card.dart';
import 'package:poolart/services/app_navigation.dart';
import 'package:poolart/utils/static_assets.dart';
import 'package:poolart/widgets/bottom_page.dart';
import 'package:poolart/widgets/bottom_page_mobile.dart';
import 'package:poolart/widgets/custom_button.dart';
import 'package:poolart/widgets/label.dart';
import 'package:poolart/widgets/latest_project_slider_mobile.dart';

part 'views/desktop.dart';
part 'views/mobile.dart';
part 'views/tablet.dart';

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    final projectCubit = BlocProvider.of<ProjectsCubit>(context);
    if (projectCubit.state.data == null || projectCubit.state.data!.isEmpty) {
      projectCubit.fetch();
    }

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
            mobile: const Mobile(),
            tablet: const Mobile(),
            desktop: Desktop(
              controller: controller,
            ),
          ),
        ),
      ),
    );
  }
}
