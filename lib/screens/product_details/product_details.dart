import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poolart/configs/app.dart';
import 'package:poolart/configs/configs.dart';
import 'package:poolart/cubits/products/cubit.dart';
import 'package:poolart/models/product.dart';
import 'package:poolart/providers/scroll_provider.dart';
import 'package:poolart/responsive/responsive.dart';
import 'package:poolart/utils/static_assets.dart';
import 'package:poolart/widgets/bottom_page.dart';
import 'package:poolart/widgets/bottom_page_mobile.dart';
import 'package:poolart/widgets/custom_button.dart';
import 'package:poolart/widgets/image_stack_card.dart';
import 'package:poolart/widgets/label.dart';
import 'package:provider/provider.dart';

part 'views/desktop.dart';
part 'views/tablet.dart';
part 'views/mobile.dart';

part 'views/widgets/product_details_card.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    final productCubit = ProductsCubit.cubit(context);
    if (productCubit.state.data == null || productCubit.state.data!.isEmpty) {
      productCubit.fetch();
    }
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
