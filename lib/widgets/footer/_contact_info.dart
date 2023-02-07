part of 'footer.dart';

class _ContactInfo extends StatelessWidget {
  const _ContactInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Label(
            text: LocaleKeys.contact.tr().toUpperCase(),
          ),
          Space.y!,
          Text(
            LocaleKeys.contact.tr(),
            style: AppText.h1b,
          ),
          _ContactTile(
            title: LocaleKeys.address.tr().toUpperCase(),
            subTitle: 'Office #302, Street #1, City, Country',
          ),
          _ContactTile(
            title: LocaleKeys.contact.tr().toUpperCase(),
            subTitle: '+92 354 1532516     |   +92 354 1532515',
          ),
          _ContactTile(
            title: LocaleKeys.address.tr().toUpperCase(),
            subTitle: 'Office #302, Street #1, City, Country',
          ),
          _ContactTile(
            title: LocaleKeys.email.tr().toUpperCase(),
            subTitle: 'support@piscine.com    |   help@piscine.com',
          ),
          _ContactTile(
            title: LocaleKeys.address.tr().toUpperCase(),
            subTitle: 'Office #302, Street #1, City, Country',
          ),
          _ContactTile(
            title: LocaleKeys.branchOffice.tr(),
            subTitle: 'Office #302, Street #1, City, Country',
          ),
          Space.y1!,
          Row(
            children: [
              CommunityMaterialIcons.facebook,
              CommunityMaterialIcons.instagram,
              CommunityMaterialIcons.twitter,
            ]
                .map(
                  (e) => Padding(
                    padding: Space.h!,
                    child: Icon(
                      e,
                      color: AppTheme.c!.text,
                      size: AppDimensions.normalize(10),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
