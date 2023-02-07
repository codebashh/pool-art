part of 'footer.dart';

class FooterMobile extends StatelessWidget {
  const FooterMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Label(
          text: 'CONTACT',
          showPadding: true,
        ),
        Space.y!,
        Padding(
          padding: Space.hf(0.8),
          child: Text(
            'Contact',
            style: AppText.h2b,
          ),
        ),
        Padding(
          padding: Space.hf(0.9),
          child: const _ContactTile(
            title: 'ADDRESS',
            subTitle: 'Office #302, Street #1, City, Country',
          ),
        ),
        Space.y!,
        Padding(
          padding: Space.hf(0.9),
          child: const _ContactTile(
            title: 'PHONE',
            subTitle: '+92 354 1532516   |  +92 354 1532515',
          ),
        ),
        Space.y!,
        Padding(
          padding: Space.hf(0.9),
          child: const _ContactTile(
            title: 'EMAIL',
            subTitle: 'support@piscine.com  |  help@piscine.com',
          ),
        ),
        Space.y!,
        Padding(
          padding: Space.hf(0.9),
          child: const _ContactTile(
            title: 'BRANCH OFFICE',
            subTitle: 'Office #302, Street #1, City, Country',
          ),
        ),
        Space.y1!,
        Space.y!,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
        ),
        Divider(
          height: AppDimensions.normalize(15),
          thickness: AppDimensions.normalize(2),
        ),
        Space.y1!,
        const ChatFooter(),
      ],
    );
  }
}
