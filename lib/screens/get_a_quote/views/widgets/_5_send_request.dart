part of '../../get_a_quote.dart';

class _SendRequest extends StatelessWidget {
  const _SendRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Label(
                text: LocaleKeys.yourPool.tr().toUpperCase(),
              ),
              Text(
                LocaleKeys.enterInformation.tr(),
                style: AppText.h2b,
              ),
              Space.y2!,
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      prefixIcon: const Icon(Icons.person),
                      name: 'firstName',
                      hint: '${LocaleKeys.first.tr()} ${LocaleKeys.name.tr()}',
                      textInputType: TextInputType.name,
                    ),
                  ),
                  Space.x!,
                  Expanded(
                    child: CustomTextField(
                      prefixIcon: const Icon(Icons.person),
                      name: 'lastName',
                      hint: '${LocaleKeys.last.tr()} ${LocaleKeys.name.tr()}',
                      textInputType: TextInputType.name,
                    ),
                  ),
                ],
              ),
              Space.y!,
              CustomTextField(
                prefixIcon: const Icon(Icons.phone),
                name: 'phone',
                hint:
                    '${LocaleKeys.enter.tr()} ${LocaleKeys.phone.tr()} ${LocaleKeys.number.tr()}',
                textInputType: TextInputType.phone,
              ),
              Space.y!,
              CustomTextField(
                prefixIcon: const Icon(Icons.email),
                name: 'email',
                hint:
                    '${LocaleKeys.enter.tr()} ${LocaleKeys.email.tr()} ${LocaleKeys.address.tr()}',
                textInputType: TextInputType.emailAddress,
              ),
              Space.y!,
              FormBuilderCheckbox(
                name: 'agree',
                title: Text(
                  LocaleKeys.termsAndConditions.tr(),
                  style: AppText.l2!.cl(
                    Colors.grey,
                  ),
                ),
              ),
              Space.y!,
              CustomButton(
                child: Center(
                  child: Text(
                    LocaleKeys.submit.tr(),
                    style: AppText.b2b!.cl(Colors.white),
                  ),
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
        if (!Responsive.isMobile(context)) const Spacer(),
      ],
    );
  }
}
