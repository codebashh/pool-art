part of 'footer.dart';

class _ContactForm extends StatelessWidget {
  const _ContactForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: MediaQuery.of(context).size.width >= 1200 ? 2 : 3,
      child: Container(
        padding: Space.all(0, 5),
        height: AppDimensions.normalize(270),
        width: AppDimensions.normalize(200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.contactTitle.tr(),
              style: AppText.h1b,
            ),
            Space.y1!,
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    prefixIcon: const Icon(
                      Icons.person,
                    ),
                    name: 'firstName',
                    hint: '${LocaleKeys.first.tr()} ${LocaleKeys.name.tr()}',
                    textInputType: TextInputType.name,
                  ),
                ),
                Space.x1!,
                Expanded(
                  child: CustomTextField(
                    prefixIcon: const Icon(
                      Icons.person,
                    ),
                    name: 'lastName',
                    hint: '${LocaleKeys.last.tr()} ${LocaleKeys.name.tr()}',
                    textInputType: TextInputType.name,
                  ),
                ),
              ],
            ),
            Space.y1!,
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    prefixIcon: const Icon(
                      Icons.email,
                    ),
                    name: 'email',
                    hint: LocaleKeys.email.tr(),
                    textInputType: TextInputType.emailAddress,
                  ),
                ),
                Space.x1!,
                Expanded(
                  child: CustomTextField(
                    prefixIcon: const Icon(
                      Icons.phone,
                    ),
                    name: 'phone',
                    hint: LocaleKeys.phone.tr(),
                    textInputType: TextInputType.number,
                  ),
                ),
              ],
            ),
            Space.y1!,
            CustomTextField(
              prefixIcon: const Icon(
                Icons.pin_drop,
              ),
              name: 'address',
              hint: LocaleKeys.address.tr(),
              textInputType: TextInputType.text,
            ),
            Space.y1!,
            CustomTextField(
              prefixIcon: Padding(
                padding:
                    EdgeInsets.fromLTRB(0, 0, 0, AppDimensions.normalize(30)),
                child: const Icon(
                  Icons.message,
                ),
              ),
              name: 'message',
              hint: LocaleKeys.message.tr(),
              maxlines: 5,
              textInputType: TextInputType.multiline,
            ),
            Space.y1!,
            CustomButton(
              onPressed: () {},
              width: double.infinity,
              child: Center(
                child: Text(
                  LocaleKeys.send.tr(),
                  style: AppText.l1b!.cl(
                    Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
