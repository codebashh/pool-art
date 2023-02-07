part of '../contact.dart';

class Desktop extends StatelessWidget {
  final ScrollController controller;
  const Desktop({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        children: [
          Space.yf(8),
          Row(
            children: [
              const Spacer(),
              Expanded(
                child: Text(
                  LocaleKeys.contactUsTitle.tr().toUpperCase(),
                  style: AppText.h1b,
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
            ],
          ),
          Space.yf(4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: StaticUtils.contactInfo
                .map(
                  (e) => _InfoCard(
                    icon: e['icon'] as IconData,
                    info: e['info'] as String,
                    title: e['title'] as String,
                  ),
                )
                .toList(),
          ),
          const Footer(),
        ],
      ),
    );
  }
}
