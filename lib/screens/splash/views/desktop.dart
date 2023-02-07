part of '../splash.dart';

class Desktop extends StatefulWidget {
  const Desktop({Key? key}) : super(key: key);

  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, AppRoutes.landing);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        StaticUtils.appLogo1,
        width: AppDimensions.normalize(90),
        height: AppDimensions.normalize(90),
        color: Colors.white,
      ),
    );
  }
}
