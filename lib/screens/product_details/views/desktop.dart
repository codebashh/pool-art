part of '../product_details.dart';

class Desktop extends StatelessWidget {
  final ScrollController controller;
  const Desktop({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final productCubit = ProductsCubit.cubit(context);
    App.init(context);
    ScreenUtil.init(context,
        designSize: const Size(1440, 980), splitScreenMode: true);

    return SingleChildScrollView(
      controller: controller,
      child: Column(
        children: [
          Space.yf(8),
          ProductDetailsCard(
            product: productCubit.state.data!.first,
            isInverted: true,
            imagePath: StaticUtils.aboutUsNetworkImg,
          ),
          const BottomPage(),
        ],
      ),
    );
  }
}
