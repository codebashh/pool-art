import 'package:community_material_icon/community_material_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:poolart/configs/app.dart';
import 'package:poolart/configs/configs.dart';
import 'package:poolart/localization/locale_keys.g.dart';
import 'package:poolart/widgets/custom_button.dart';
import 'package:poolart/widgets/custom_form_builder.dart';
import 'package:poolart/widgets/footer/chat_footer.dart';
import 'package:poolart/widgets/label.dart';

part '_contact_tile.dart';
part '_contact_form.dart';
part '_contact_info.dart';
part 'footer_mobile.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Padding(
      padding: EdgeInsets.only(
        top: AppDimensions.normalize(8),
      ),
      child: Row(
        children: [
          SizedBox(
            width: AppDimensions.normalize(50),
          ),
          const _ContactInfo(),
          SizedBox(
            height: AppDimensions.normalize(80),
            child: VerticalDivider(
              thickness: 1,
              color: Colors.black54,
              width: AppDimensions.normalize(60),
            ),
          ),
          const _ContactForm(),
          const Spacer(),
        ],
      ),
    );
  }
}
