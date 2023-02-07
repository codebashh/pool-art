part of '../contact.dart';

class Mobile extends StatelessWidget {
  final ScrollController controller;

  const Mobile({
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
          Padding(
            padding: Space.all(2, 0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    LocaleKeys.contactUsTitle.tr().toUpperCase(),
                    style: AppText.h2b,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Space.yf(4),
          Wrap(
            runSpacing: AppDimensions.normalize(5),
            spacing: AppDimensions.normalize(3),
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
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
          Space.y2!,
          const Divider(
            endIndent: 50,
            indent: 50,
            color: Colors.grey,
          ),
          Space.y2!,
          const ChatFooter(),
        ],
      ),
    );
  }
}
